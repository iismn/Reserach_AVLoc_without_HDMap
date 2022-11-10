#!/usr/bin/env python3
# [RAW] : PKG Dependency
from __future__ import print_function
import rospy
from std_msgs.msg import String

# SYSTEM
import argparse
from math import log10, ceil
from os.path import join, exists, isfile, realpath, dirname
from os import makedirs, remove, chdir, environ
import random, shutil, json, time

# PyTorch
import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
import torch.onnx
from torch.autograd import Variable
from torch.utils.data import DataLoader, SubsetRandomSampler
from torch.utils.data.dataset import Subset
import torchvision.transforms as transforms
import torchvision.datasets as datasets
import torchvision.models as models
import netvlad

# THB
import cv2
import pcl
import h5py
import time
import math
import faiss
import numpy as np
from PIL import Image
from datetime import datetime
import matplotlib.pyplot as plt
import matplotlib as mpl
from matplotlib import cm
from collections import OrderedDict
from skimage.transform import resize
from tensorboardX import SummaryWriter
from cv_bridge import CvBridge, CvBridgeError
import open3d as o3d
import open3d.core as o3c
# ROS
import ros_numpy
import message_filters
from nav_msgs.msg import Odometry as ROS_Odometry
from sensor_msgs.msg import Image as ROS_Image
from sensor_msgs.msg import PointCloud2 as ROS_PCL
from std_msgs.msg import Float32,Float32MultiArray,Float64,Float64MultiArray,MultiArrayLayout,MultiArrayDimension



# [RAW] : PARSER Argument
class Localization_PARAM():
    def __init__(self):
        self.mode =                      'test'
        self.batchSize =                 4
        self.cacheBatchSize =            24
        self.cacheRefreshRate =          1000
        self.nEpochs =                   30
        self.start_epoch =               0
        self.nGPU =                      1
        self.optim =                     'ADAM'
        self.lr =                        0.0001
        self.lrStep =                    5
        self.lrGamma =                   0.5
        self.weightDecay =               0.001
        self.momentum=                   0.9
        self.nocuda =                    False
        self.threads =                   8
        self.seed =                      123
        self.savePath =                  'checkpoints'
        self.ckpt =                      'best'
        self.evalEvery =                 1
        self.patience =                  10
        self.dataset =                   'urban'
        self.arch =                      'resnet18'
        self.vladv2 =                    False
        self.pooling =                   'netvlad'
        self.num_clusters =              64
        self.margin =                    0.1
        self.split =                     'val'
        self.fromscratch =               True

        # HARD CODED -> [Future Works] : Change with ROS Param
        self.dataPath =                  '/home/iismn/WorkSpace/CU11_DL/ROS/src/RESEARCH_PACK/OSM_NetVLAD/src/data/'
        self.runsPath =                  '/home/iismn/WorkSpace/CU11_DL/ROS/src/RESEARCH_PACK/OSM_NetVLAD/src/runs/'
        self.cachePath =                 '/home/iismn/WorkSpace/CU11_DL/ROS/src/RESEARCH_PACK/OSM_NetVLAD/src/cache/'
        self.resume =                    '/home/iismn/WorkSpace/CU11_DL/ROS/src/RESEARCH_PACK/OSM_NetVLAD/src/runs/8K_1K_ResNet18_NetVLAD'

        self.MAP_range =                 80
        self.iter =                      0

class Localization_MAIN():
    def __init__(self):
        
        # [ROS] ROS Set Initializeing -------------------------------------------------
        print('[  STD  ] >> START')

        self.range = localizer_PARM.MAP_range/2
        self.res = self.range*2/700+0.001 #100M / 700 Pixels
        self.init_Pos = np.array([0,0])

        print('[  STD  ] >> SPIN')

        KITTI_MAP = pcl.load("/home/iismn/WorkSpace/Research/KITTI_08_Dataset/PointCloud/GlobalMapRGB.pcd")
        KITTI_TRJ = pcl.load("/home/iismn/WorkSpace/Research/KITTI_08_Dataset/PointCloud/trajectory.pcd")

        KITTI_TRJ = ros_numpy.numpify(KITTI_TRJ)

        KITTI_TRJ_Pts=np.zeros((KITTI_TRJ.shape[0],4))
        KITTI_TRJ_Pts[:,0]=KITTI_TRJ['x']
        KITTI_TRJ_Pts[:,1]=KITTI_TRJ['y']
        KITTI_TRJ_Pts[:,2]=KITTI_TRJ['z']
        KITTI_TRJ_Pts[:,3]=KITTI_TRJ['intensity']


        for i in range(KITTI_TRJ.shape[0]):
            X = KITTI_TRJ_Pts[i,0]
            Y = KITTI_TRJ_Pts[i,1]

            X-80 Y-80 X+80 Y+80


    def locmapCB(self, PCL_Data, POS_Data):

        # [ROS] Pos Call Back : Position Data Save
        Vehicle_Pos_X = POS_Data.pose.pose.position.x
        Vehicle_Pos_Y = POS_Data.pose.pose.position.y

        # [ROS] Image Call Back : Convert Image to PyTorch Tensor
        npPCL = self.pclnpCB(PCL_Data, Vehicle_Pos_X, Vehicle_Pos_Y)
        input_img_Q = self.Localization_SUBF.pcl_transform(npPCL, Vehicle_Pos_X, Vehicle_Pos_Y, False)
        input_img_Q=cv2.cvtColor(input_img_Q, cv2.COLOR_RGB2BGR)
        localizer_PARM.iter = localizer_PARM.iter + 1

        # SAVE IMAGE
        F_Path_IMG = '/home/iismn/WorkSpace/DB/DB_DL_v3/DL/IRIS/SEJONG/3D/'
        F_Name = str(localizer_PARM.iter).zfill(8)
        cv2.imwrite(F_Path_IMG + F_Name + ".png",input_img_Q)

        # SAVE POS
        F_Path_POS = '/home/iismn/WorkSpace/DB/DB_DL_v3/DL/IRIS/SEJONG/POS_3D/'
        POS = np.array([Vehicle_Pos_X, Vehicle_Pos_Y])
        UTM_POS = POS + self.init_Pos
        UTM_POS = np.array(UTM_POS).reshape((1,2))
        np.savetxt(F_Path_POS + F_Name + ".txt",UTM_POS, fmt='%10.10f')

        msg = Float32MultiArray()
        msg.data = data_in
        self.desc_pub.publish(msg)

    def pclnpCB(self, PCL_Data, Vehicle_Pos_X, Vehicle_Pos_Y):
        
        LocalMAP = ros_numpy.numpify(PCL_Data)
        # CONVERT PointCloud2 to NP.
        LocalMAP_Pts=np.zeros((LocalMAP.shape[0],4))
        LocalMAP_Pts[:,0]=LocalMAP['x']
        LocalMAP_Pts[:,1]=LocalMAP['y']
        LocalMAP_Pts[:,2]=LocalMAP['z']
        LocalMAP_Pts[:,3]=LocalMAP['intensity']
        ff = np.logical_and((LocalMAP_Pts[:,0] > Vehicle_Pos_X-self.range), (LocalMAP_Pts[:,0] < Vehicle_Pos_X+self.range))
        ss = np.logical_and((LocalMAP_Pts[:,1] > Vehicle_Pos_Y-self.range), (LocalMAP_Pts[:,1] < Vehicle_Pos_Y+self.range))
        tt = np.logical_and((LocalMAP_Pts[:,2] > 0.5), (LocalMAP_Pts[:,2] < 50))

        indices = np.argwhere(np.logical_and(ff,ss)).flatten()
        npPCL = LocalMAP_Pts[indices,:]

        return npPCL


class Localization_SUB():
    def __init__(self):
        self.range = localizer_PARM.MAP_range/2
        self.res = self.range*2/700+0.001 #100M / 700 Pixels

    def input_transform():
        return transforms.Compose([
            transforms.ToTensor(),
            transforms.Normalize(mean=[0.485, 0.456, 0.406],
                                std=[0.229, 0.224, 0.225]),
        ])

    def pcl_transform(self, npPCL, Vehicle_Pos_X, Vehicle_Pos_Y, Building):

        if Building == True:
            start = time.time()
            FLT_S = self.pcl_normal(npPCL, Vehicle_Pos_X, Vehicle_Pos_Y)
            FLT_S = FLT_S[0]
            print("time :", time.time() - start)

            input_imgBF = self.pcl_imgTF(FLT_S)

            return input_imgBF

        else:

            npPCL[:,0] = npPCL[:,0] - Vehicle_Pos_X
            npPCL[:,1] = npPCL[:,1] - Vehicle_Pos_Y


            input_img = self.pcl_imgTF(npPCL)



            return input_img

    def pcl_normal(self, PCL_IN, Vehicle_Pos_X, Vehicle_Pos_Y):
        PCL_IN[:,0] = PCL_IN[:,0] - Vehicle_Pos_X
        PCL_IN[:,1] = PCL_IN[:,1] - Vehicle_Pos_Y

        minX = np.min(PCL_IN[:,0])
        maxX = np.max(PCL_IN[:,0])
        minY = np.min(PCL_IN[:,1])
        maxY = np.max(PCL_IN[:,1])

        SubMAP_SIZE = (maxX-minX)/10


        FLT_S = np.array([[[0,0,0,0]]])

        for i in range(10):
            for j in range(10):

                idx_X = np.logical_and((PCL_IN[:,0] >= minX+i*SubMAP_SIZE), (PCL_IN[:,0] < minX+(i+1)*SubMAP_SIZE))
                idx_Y = np.logical_and((PCL_IN[:,1] >= minY+j*SubMAP_SIZE), (PCL_IN[:,1] < minY+(j+1)*SubMAP_SIZE))
                idx_T = np.argwhere(np.logical_and(idx_X,idx_Y)).flatten()
                # print(idx_T.shape[0])
                if idx_T.shape[0] > 200:
                    sub_npPCL = PCL_IN[idx_T,:]
                    PCL_NormF = o3d.geometry.PointCloud()
                    PCL_NormF.points = o3d.utility.Vector3dVector(sub_npPCL[:,0:3])
                    PCL_NormF.estimate_normals(
                    search_param=o3d.geometry.KDTreeSearchParamHybrid(radius=0.5, max_nn=30))
                    norm = np.asarray(PCL_NormF.normals)
                    idx_F = np.where(np.absolute(norm[:,2]) < 0.04)
                    FLT_S = np.append(FLT_S, sub_npPCL[idx_F,:], axis=1)

        return FLT_S

    def pcl_imgTF(self, PCL_IN):
        IMG_x = (-PCL_IN[:,1]/self.res).astype(np.int32)
        IMG_y = (PCL_IN[:,0]/self.res).astype(np.int32)
        IMG_x += int(np.floor((self.range)/self.res))
        IMG_y -= int(np.floor((self.range)/self.res))
        IMG_i = PCL_IN[:,3].astype(np.int32)


        # FILL PIXEL VALUES IN IMAGE ARRAY
        x_max = int((self.range*2)/self.res)
        y_max = int((self.range*2)/self.res)
        input_img = np.zeros([700, 700,3], dtype=np.uint8)

        HSV_Table = cm.hsv(range(256))
        input_img[IMG_x, IMG_y] = HSV_Table[IMG_i,0:3]*255

        return input_img

if __name__ == '__main__':
    rospy.init_node("non_map_localization")
    localizer_PARM = Localization_PARAM()
    localizer_SUB = Localization_SUB()
    localizer_DL = Localization_MAIN()