%data for New England Test case

disp('New England data')
%(bus#)( volt )( ang  )(  pgen )(  qgen )( pload )( qload )(gshunt)(bshunt)(bus type)
bus=[
   1   1.048  9.43   0.0000   0.0000   8.0000   3.5000 0.00000 0.00000 3 99  -99 1.0   0     0;
  2   1.0300 10.96  10.000   8.6846   11.040   2.5000 0.00000 0.00000 1  15 -10 1.0   0     0];

%b#1 b#2( res  )(  rea  )(charg )(tap )(phase)
line = [
   1  2 0.00100  0.02500 0.75000 0.0000 0   0    0    0;
   ];


mac_con = [ 1 2  1000.0 0.030 0.0010  0.200 0.060 0 7.000 0 0.190 0.060 0  0.700 0 50.00 0.000 0.00 39 0 0];

exc_con =[1   1  0 40.00 0.020  0.000 0.000 10.5 -10.5 1.00 1.400 3   0.03 4 0.85  0 0.03  1.000];

%Switching file defines the simulation control
% row 1 col1  simulation start time (s) (cols 2 to 6 zeros)
%       col7  initial time step (s)
% row 2 col1  fault application time (s)
%       col2  bus number at which fault is applied
%       col3  bus number defining far end of faulted line
%       col4  zero sequence impedance in pu on system base
%       col5  negative sequence impedance in pu on system base
%       col6  type of fault  - 0 three phase
%                            - 1 line to ground
%                            - 2 line-to-line to ground
%                            - 3 line-to-line
%                            - 4 loss of line with no fault
%                            - 5 loss of load at bus
%       col7  time step for fault period (s)
% row 3 col1  near end fault clearing time (s) (cols 2 to 6 zeros)
%       col7  time step for second part of fault (s)
% row 4 col1  far end fault clearing time (s) (cols 2 to 6 zeros)
%       col7  time step for fault cleared simulation (s)
% row 5 col1  time to change step length (s)
%       col7  time step (s)
%
%
%
% row n col1 finishing time (s)  (n indicates that intermediate rows may be inserted)
%pss_con = [];
pss_con = [1   1   100  10  0.08  0.01  0.08  0.02 0.02 -0.05 ];
     
sw_con = [...
0    0    0    0    0    0    0.01;%sets intitial time step
0.5  1    2    0    0    6    0.01; %apply three phase fault at bus 3 line 3-4
0.6 0    0    0    0    0    0.01; %clear fault at bus 3
0.18 0    0    0    0    0    0.01; %clear remote end
0.50 0    0    0    0    0    0.02; % increase time step 
1.0  0    0    0    0    0    0.02; % increase time step
10.0  0    0    0    0    0    0]; % end simulation



%ibus_con = zeros(length(mac_con(:,1)),1);
%ibus_con(10) = 1;