function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%


test=[1:K];%build a horizontal vector of 1:k 
test=repmat(test,m,1); %repeat test m times so each column is compared against indexes
idx2=repmat(idx,1,K);%copy the indices so each column is tested against the index from test
res=idx2==test; %return a logical array, each time there is a 1 this is where they match. 
%e.g. a 1 in column 3 row 10, means the 10th training example is assigned
%to centroid 3

res=repelem(res,1,n);%repeat the logical array so we can do a dot product
Xtemp=repmat(X,1,K);%repeat the x matrix so we can dot product

Q=Xtemp.*res;%multiply together. Get a matrix of n repeats of X in horizontal direction., each set of size(X,2) is one centroid

Q2=sum(Q,1);%sum each column

Q3=reshape(Q2,n,K);
%disp(size(Q3));
%Q4=sum(Q3,1);%sum columns. now a horizontal vector where each column is a K index


A=sum(idx2==test,1);%sum up all the columns of the logical matrix to get the number assingned to each centroid
%delete the repeats. Now each column is the number of elements mapped to that centroid
%disp(size(A));
means=Q3./A;%each column is the mean

centroids=means';

% =============================================================


end

