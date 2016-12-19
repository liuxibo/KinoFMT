% This script is used for development and testing of the RunKinoFMTMEX.cpp mex function

clear all
clc

mex KinoFMTMEX.cpp

evalMat = uint64([  0, 9, 6, 7;...
                    0, 0, 8, 0;...
                    2, 0, 0, 1;...
                    4, 5, 3, 0]);
costMat = [10.1; 15.5; 11.3; 5.6; 14.9; 11.0; 10.7; 1.01; 0.5];
trajMat = zeros(9,2,3);
trajMat(:,:,1) = [  -1.1,   -1.1;...
                    -1.1,   -1.1;...
                    2.2,    2.2;...
                    2.2,    2.2;...
                    2.2,    2.2;...
                    3.3,    -3.3;...
                    3.3,    -3.3;...
                    -4.4,   4.4;...
                    3.3,    -3.3];
trajMat(:,:,2) = [  -0.1    0.5;...
                    2.0,    -1.5;...
                    1.0,    0.2;...
                    3.3,    0.0;...
                    -1.1,   3.0;...
                    1.0,    -2.0;...
                    6.5,    -0.5;...
                    -5.0    1.5;...
                    3.0,    4.0];
trajMat(:,:,3) = [  2.2,    2.2;...
                    3.3,    -3.3;...
                    -1.1,   -1.1;...
                    3.3,    -3.3;...
                    -4.4,   4.4;...
                    -1.1,   -1.1;...
                    2.2,    2.2;...
                    -1.1,   -1.1;...
                    -4.4,   4.4];
obsMat = [  2.0, 4.0,   -1.0, 0.0;...
            3.0, 5.0,   1.0, 2.0];
sphObsMat = [];
bounds = [  -5.5, 5.5;...
            -5.5, 5.5];
outNeighbor{1} = uint32([2; 3; 4]);
outNeighbor{2} = uint32([3]);
outNeighbor{3} = uint32([4]);
outNeighbor{4} = uint32([1; 2; 3]);
inNeighbor{1} = uint32([4]);
inNeighbor{2} = uint32([1; 4]);
inNeighbor{3} = uint32([1; 2; 4]);
inNeighbor{4} = uint32([1; 3]);
nGoalSamples = 1;

[optPath, optCost] = KinoFMTMEX(evalMat, costMat, trajMat, obsMat, sphObsMat, bounds, outNeighbor, inNeighbor, nGoalSamples);
