%data for New England Test case

disp('New England data')
%(bus#)( volt )( ang  )(  pgen )(  qgen )( pload )( qload )(gshunt)(bshunt)(bus type)
bus=[
  1   1.0505 1   0.0000   0.0000   .0000   3.0000 0.00000 0.00000 3 99  -99 1.0   0     0;
  2   1.0341 2   0.0000   0.0000   3.2200   4.0240 0.00000 0.00000 3 99  -99 1.0   0     0;
  3   1.0587 2   0.0000   0.0000   2.2400   0.4720 0.00000 0.00000 3 99  -99 1.0   0     0;
  4   1.0536 4   0.0000   0.0000   5.3900   0.1700 0.00000 0.00000 3 99  -99 1.0   0     0;
  5   1.0399 5   0.0000   0.0000   2.8100   0.7550 0.00000 0.00000 3 99  -99 1.0   0     0;
  6   1.0509 1   0.0000   0.0000   2.0600   0.2760 0.00000 0.00000 3 99  -99 1.0   0     0;
  7   1.0505 1   0.0000   1.0000   2.8350   1.2690 0.00000 0.00000 2 99  -99 1.0   0     0;
  8   1.0475 1   4.5000   4.3621   0.0000   0.0000 0.00000 0.00000 2  8   -5 1.0   0     0; 
  9   1.0278  1  5.4000  -3.0444   0.0000   0.0000 0.00000 0.00000 2  8   -5 1.0   0     0;
  10   1.0265  1   8.3000   3.1939   0.0000  0.0000 0.00000 0.00000 1  8   -5 1.0   0     0;
 ];

%b#1 b#2( res  )(  rea  )(charg )(tap )(phase)
line = [
   
   1   2 0.00130  0.01510 0.25720 0.0000 0   0    0    0;
   1  3 0.00700  0.00860 0.14600 0.0000 0   0    0    0;
   1  8 0.00000  0.01810 0.00000 1.0250 0   0    0    0;
  3  4 0.00320  0.03230 0.51300 0.0000 0   0    0    0;
  3  9 0.00060  0.02320 0.00000 1.0250 0   0    0    0;
  4  5 0.00140  0.01470 0.23960 0.0000 0   0    0    0;
  4  6 0.00430  0.04740 0.78020 0.0000 0   0    0    0;
  4  7 0.00570  0.06250 1.02900 0.0000 0   0    0    0;
  5  7 0.00140  0.01510 0.24900 0.0000 0   0    0    0;
  7  10 0.00080  0.01560 0.00000 1.0250 0   0    0    0;
  ];


mac_con = [
  1  8  1000.0 0.125 0.0014  1.000 0.310 0 10.20 0 0.690 0.310 0  1.500 0 4.200 0.000 0.00 30 0 0;
  2  9  1000.0 0.280 .00686  2.900 0.570 0 6.700 0 2.800 0.570 0  0.410 0 2.430 0.000 0.00 37 0 0;
  3  10  1000.0 0.298 0.0030  2.106 0.570 0 4.790 0 2.050 0.570 0  1.960 0 3.450 0.000 0.00 38 0 0;
 ];

exc_con =[
1   1  0  50.00 0.060  0.000 0.000 5   -5    -0.05 0.25  1.7 0.5  3 2.0   0 0.04  1.000;  
1   2  0  50.00 0.020  0.000 0.000 5   -5    -0.05 0.528 3   0.09 4 0.28  0 0.09  1.260; 
1   3  0 40.00 0.020  0.000 0.000 10.5 -10.5 1.00 1.400 3   0.03 4 0.85  0 0.03  1.000; ];


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

pss_con = [...
     1   1    200.55  10  1.2483  0.0371  1.1991  0.0305 0.01 -0.05 ; 
     1   2    50.99  10  0.8148  0.0164  0.7331  0.0177 0.02 -0.05 ;
     1   3    50.79  10  0.2522  0.0494  0.2892  0.0285 0.02 -0.05 ; 
     ];
 
%sw_con = [...
%0    0    0    0    0    0    0.01;%sets intitial time step
%10  1    2    0    0    6    0.01; %apply three phase fault at bus 3 line 3-4
%11  0    0    0    0    0    0.01; %clear fault at bus 3
%0.18 0    0    0    0    0    0.01; %clear remote end
%0.50 0    0    0    0    0    0.02; % increase time step 
%1.0  0    0    0    0    0    0.02; % increase time step
%50.0  0    0    0    0    0    0]; % end simulation
sw_con = [...
0    0    0    0    0    0    0.01;%sets intitial time step
0.1  1    2  0    0    6    0.01; % 3 ph fault
0.15 0    0    0    0    0    0.01; %clear near end
0.20 0    0    0    0    0    0.01; %clear remote end
%0.50 0    0    0    0    0    0.01; % increase time step 
%1.0  0    0    0    0    0    0.01; % increase time step
50.0  0    0    0    0    0    0];


%ibus_con = zeros(length(mac_con(:,1)),1);
%ibus_con(10) = 1;