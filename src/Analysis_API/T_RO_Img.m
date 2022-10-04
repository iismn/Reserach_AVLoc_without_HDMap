clc; clear
rawB = fread(fopen('DCC_NGII_BUILD2.geojson'),inf);
rawB = char(rawB');
geojsonValue_BUILD = jsondecode(rawB);
rawR = fread(fopen('DCC_NGII_ROAD.geojson'),inf);
rawR = char(rawR');
geojsonValue_ROAD = jsondecode(rawR);

%%
MAP_All = pcread('GlobalMap.pcd');
MAP_Odom = pcread('trajectory.pcd');
gridStep = 2.0;

MAP_All_Temp = pcdownsample(MAP_All,'gridAverage',gridStep);
MAP_All_Temp = pcdenoise(MAP_All_Temp,'NumNeighbors',500,'Threshold',5);
MAP_All_Temp = pointCloud([MAP_All_Temp.Location(:,1),MAP_All_Temp.Location(:,2),MAP_All_Temp.Location(:,3)]);

%%
clf
figure(1)
% pcshow(MAP_All_Temp)
scatter1 = scatter3(MAP_All_Temp.Location(:,1), MAP_All_Temp.Location(:,2),MAP_All_Temp.Location(:,3),1,'MarkerFaceColor','r','MarkerEdgeColor','k');
scatter1.MarkerEdgeColor = [0.8 0.8 0.1];
scatter1.MarkerFaceAlpha = .1;
scatter1.MarkerEdgeAlpha = .5;
hold on; axis equal;
plot3(MAP_Odom.Location(:,1), MAP_Odom.Location(:,2),MAP_Odom.Location(:,3)-200,'k','LineWidth',4)
plot3(MAP_Odom.Location(:,1), MAP_Odom.Location(:,2),MAP_Odom.Location(:,3)-400,'k','LineWidth',4)
plot3(MAP_Odom.Location(:,1), MAP_Odom.Location(:,2),MAP_Odom.Location(:,3),'black','LineWidth',4)
grid off;

latitude=36.3749136;
longitude=127.3906068;
[UTM_X, UTM_Y, ~] = deg2utm(latitude,longitude);
Init_UTM = [UTM_X, UTM_Y];
ngii_Plot_3D(geojsonValue_BUILD,'BUILDING',Init_UTM)

%% Submap Point
CenterPoint = [-11.314 86.6099 -1.07689];
roi = [CenterPoint(1)-80 CenterPoint(1)+80 CenterPoint(2)-80 CenterPoint(2)+80 CenterPoint(3)-10 CenterPoint(3)+100];
indices = findPointsInROI(MAP_All_Temp,roi);
MAP_All_Temp_Sub = select(MAP_All_Temp,indices);
hold on;

scatter2 = scatter3(MAP_All_Temp_Sub.Location(:,1), MAP_All_Temp_Sub.Location(:,2),MAP_All_Temp_Sub.Location(:,3),1,...
    'MarkerFaceColor','r','MarkerEdgeColor','k');
scatter2.MarkerEdgeColor = [1 0 1];
scatter2.MarkerFaceAlpha = .1;
scatter2.MarkerEdgeAlpha = .5;

X = [roi(1) roi(1) roi(2) roi(2) roi(1)];
Y = [roi(3) roi(4) roi(4) roi(3) roi(3)];
Z = [10 10 10 10 10];
plot3(X,Y,Z,'-','LineWidth',4,'Color',[1 0 1])

%% Submap Matching Line
roi = [CenterPoint(1)-80 CenterPoint(1)+80 CenterPoint(2)-80 CenterPoint(2)+80 CenterPoint(3)-10 CenterPoint(3)+100];
indices = findPointsInROI(MAP_Odom,roi);

sizef=15;
indices = indices(randsample(size(indices,1),sizef));
MAP_Odom_Sub = select(MAP_Odom,indices);

for i = 1:sizef
    X = [CenterPoint(1) MAP_Odom_Sub.Location(i,1)];
    Y = [CenterPoint(2) MAP_Odom_Sub.Location(i,2)];
    Z = [CenterPoint(3) MAP_Odom_Sub.Location(i,3)-200];
    plot3(X,Y,Z,'-','LineWidth',4,'Color',[1 0 1]);
    scatter3(X(2),Y(2),Z(2)-200,100,'MarkerFaceColor','b','MarkerEdgeColor','b');   
end

%% Matched Particle Weight Plot
DistScore = [];

for i =1:sizef
    DistScore = [DistScore; norm(CenterPoint-MAP_Odom_Sub.Location(i,:))];
end

DistScore = normalize(DistScore,'range');

for i =1:sizef
    X = [MAP_Odom_Sub.Location(i,1) MAP_Odom_Sub.Location(i,1)];
    Y = [MAP_Odom_Sub.Location(i,2) MAP_Odom_Sub.Location(i,2)];
    Z = [-400  -400+100*(1-DistScore(i))];
    S = plot3(X,Y,Z,'-','LineWidth',2,'Color',[0 0 1],'LineWidth',4);
end





























