function [Out]=finalProbability(features)
load('neuralnetwork');
load('net.mat')
%layer1input=IW{1,1}*features
%bias1=bias{1,1}
Out=net(features)