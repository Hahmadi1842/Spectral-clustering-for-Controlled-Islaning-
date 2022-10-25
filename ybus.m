%function [Y] = ybus(linedata) %declaring function[Y] that takes as input linedata and outputs Y-matrix.
linedata=  [1 4 0.0    0.0576 0.     1. 0. ;
	4 5 0.017  0.092  0.158  1. 0. ;
	5 6 0.039  0.17   0.358  1. 0. ;
	3 6 0.0    0.0586 0.     1. 0. ;
	6 7 0.0119 0.1008 0.209  1. 0. ;
	7 8 0.0085 0.072  0.149  1. 0. ;
	8 2 0.0    0.0625 0.     1. 0. ;
	8 9 0.032  0.161  0.306  1. 0. ;
	9 4 0.01   0.085  0.176  1. 0. ];

nl = linedata (:,1); % extracting column 1 from the linedata file. nl is linefrom bus 
nr = linedata (:,2); % extracting column 2 from the linedata file.nl is line to bus
R = linedata (:,3); %extrac ting the resistance in column 3 from the linedata file.
X = linedata (:,4); %xtracting the line reactance from column 4 
B = linedata(:,5); %extracting half of the total line susceptance from column 8 OF LINEDATA FILE 
nline = length (linedata (:,1)); %declaring the total # of lines 
nbus = max (max (nl), max (nr)); %defining the toal no of nodes
Z = R +j*X; % declaring the impedance
y = ones (nline,1)./Z ; Y= zeros (nbus,nbus);
for n = 1:nbus %defining a for loop to find the diagonal elements of Y-matrix.
for k = 1:nline
if nl (k) == n| nr (k) == n
Y (n,n) = Y (n,n) + y(k)-B(k);
else, end
end
end
for k = 1:nline %defining a loopto find the off-diagonal elements of Y-matrix
Y (nl(k), nr(k))=Y(nl(k),nr(k))-y(k);
Y(nr(k),nl(k))=Y(nl(k),nr(k));
end
Y