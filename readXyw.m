function [X,y,w]=readXyw()

%Reads X,y,w of given max score problem

X=load('X.txt');
%X=load('X_200_4.txt');
%X=load('X_200_5.txt');
%X=[X(:,2) X(:,3) X(:,4) X(:,5)];
X=X(:,2:end);
y=load('ys.txt');
%y=load('ys_200_4.txt');
%y=load('ys_200_5.txt');
y=[y(:,2)];
%w=load('w_numeric5.txt');
%w=[w(:,2)];
w=repmat(1,size(X,1),1);

[ysorted,ind]=sort(y,'ascend');
Xsorted=X(ind,:);

y=ysorted;
X=Xsorted;
end