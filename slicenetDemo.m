clear all

ptCloudR = pcread('bunny.ply');
ptCloud = ptCloudR.Location;
pcshow(ptCloudR)
planes = 20;
figure(1)
disp(ptCloudR);
planeResolution = abs(ptCloudR.ZLimits(1) - ptCloudR.ZLimits(2))/(planes-1);
z = ptCloudR.ZLimits(1):planeResolution:ptCloudR.ZLimits(2);
% loop through points
for pt = 1:ptCloudR.Count
    % find which plane is the closest
    % identify point with plane
    % move point to plane
    % plot point on plane
    currentPtz = ptCloud(pt,3);
    d = zeros(1,planes);
    for p = 1:planes
        d(p) = abs(currentPtz-z(p));
    end
    [dmin,I] = min(d);
    ptCloud(pt,3) = z(I);
end
figure(2)
scatter3(ptCloud(:,1), ptCloud(:,2), ptCloud(:,3))
