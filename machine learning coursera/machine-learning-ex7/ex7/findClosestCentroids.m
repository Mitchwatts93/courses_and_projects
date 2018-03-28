function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

Z=repelem(X,size(centroids,1),1);%make a Z matrix which is each element repeated K times

Centroids=repmat(centroids,length(X),1);%repeat centroid matrix m times so same length as Z
z=Z-Centroids;%find difference in x and y coordinates between the repeated training examples and the different centroids


zl=sum(z.^2,2);%find squared distance of the centroids from x


zl2=reshape(zl,[size(centroids,1),length(X)]); %reshape so its a 3xm matrix, 
[zl3,I]=min(zl2);%find the max of each column and its index
idx=I';%set idx = indexes transposed, so each row in idx is an element which refers to index of centroid which is closes








% =============================================================

end

