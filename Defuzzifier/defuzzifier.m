function [m] = defuzzifier(w)
% Defuzzifies the action

%% Rules
%Rule-l:    IF theta is PO      AND     thetadot is PO      THEN F is PL
%Rule-2:    IF theta is PO      AND     thetadot is ZE      THEN F is PM 
%Rule-3:    IF theta is PO      AND     thetadot is NE      THEN F is ZE
%Rule-4:    IF theta is ZE      AND     thetadot is PO      THEN F is PS
%Rule-5:    IF theta is ZE      AND     thetadot is ZE      THEN F is ZE
%Rule-6:    IF theta is ZE      AND     thetadot is NE      THEN F is NS
%Rule-7:    IF theta is NE      AND     thetadot is PO      THEN F is ZE
%Rule-8:    IF theta is NE      AND     thetadot is ZE      THEN F is NM
%Rule-9:    IF theta is NE      AND     thetadot is NE      THEN F is NL 

%Rule-10:   IF theta is VS      AND     thetadot is VS      AND     x is NE     AND     xdot is NE      THEN F is NS       
%Rule-11:   IF theta is VS      AND     thetadot is VS      AND     x is NE     AND     xdot is VS      THEN F is NVS 
%Rule-12:   IF theta is VS      AND     thetadot is VS      AND     x is PO     AND     xdot is VS      THEN F is PVS
%Rule-12:   IF theta is VS      AND     thetadot is VS      AND     x is PO     AND     xdot is PO      THEN F is PS

Rules = ...
    {@PL;...
     @PM;...
     @ZE;...
     @PS;...
     @ZE;...
     @NS;...
     @ZE;...
     @NM;...
     @NL;...
     @NS;...
     @NVS;...
     @PVS;...
     @PS};
%% Create m vector

m = zeros(length(w),1);

for i= 1:length(m)
    m(i) = Rules{i}(w(i));
end

%% vector to check the m vector
% mtest = zeros(length(w),1);
% mtest(1) = PL(w(1));
% mtest(2) = PM(w(2));
% mtest(3) = ZE(w(3));
% mtest(4) = PS(w(4));
% mtest(5) = ZE(w(5));
% mtest(6) = NS(w(6));
% mtest(7) = ZE(w(7));
% mtest(8) = NM(w(8));
% mtest(9) = NL(w(9));
% mtest(10) = NS(w(10));
% mtest(11) = NVS(w(11));
% mtest(12) = PVS(w(12));
% mtest(13) = PS(w(13));


end

