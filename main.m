 clear all;close all;clc;
addpath('toolbox_graph');

[vertices, faces] = read_off('bumpy.off');
%[vertices, faces] = ply_to_tri_mesh('cow.ply');
trisurf(faces',vertices(1,:),vertices(2,:),vertices(3,:));axis equal;

threshold = 0.01; % distance between vertices 
nIter = 100; % number of iterations define the number of edges to be removed
nIter2 = 100; % number of iterations define the number of faces to be removed
newVertices = vertices;
newFaces = faces;

%% Project : Simplify mesh by removing edges.
for i = 1:nIter
        [newFaces,newVertices] = simplifyMesh(newFaces,newVertices,threshold);
end
figure;
trisurf(newFaces',newVertices(1,:),newVertices(2,:),newVertices(3,:));axis equal;

%% Extension of the project : Simplify mesh by removing traingles instead of edges

for i = 1:nIter2
        [newFaces,newVertices] = simplifyMeshTri(newFaces,newVertices,threshold);
end

figure;
trisurf(newFaces',newVertices(1,:),newVertices(2,:),newVertices(3,:)); axis equal;
