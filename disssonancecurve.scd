(
~w = (3/2**[2,4,6,9]++ 1).sort;
~x = (3/2**[3,5,7,9]++ 1).sort;
~y = (3/2**[2,5,7,9]++ 1).sort;
~z = (3/2**[2,4,7,9]++ 1).sort;

~a = (1.0/[1,2,4,9,25]).normalizeSum;
~b = (1.0/[1,2,4,9,25]).normalizeSum;
~c = (1.0/[1,2,4,9,25]).normalizeSum;

~ph = [0,1,2,3,4];
~ph1 = [1,2,3,4,0];
~ph2 = [2,3,4,0,1];
)
(
~str6 = 82.41*~w;
~str6P1 = ~str6.at(1)*~x;
~str6P2 = ~str6.at(2)*~y;
~str5 = 110*~w;
~str5P1 = ~str5.at(1)*~x;
~str5P2 = ~str5.at(2)*~y;
~str4 = 146.92*~w;
~str4P1 = ~str4.at(1)*~x;
~str4P2 = ~str4.at(2)*~y;
~str3 = 196*~x;
~str3P1 = ~str3.at(1)*~y;
//~str3P2 = ~str3.at(2)*~z;
)
(
~freq1 = ~str6 ++ ~str6P1 ++ ~str6P2;
~conv = 1200 * log(16038.59/82.41);
~amps = (~a*0.6) ++ (~b*0.3)++ (~c*0.2);
~spec1 = DissonanceCurve.new(~freq1, ~amps, (~conv+300));
~spec1.plot;
~freq2 = ~str5 ++ ~str5P1 ++ ~str5P2;
~conv1 = 1200 * log(21408/110);
~spec2 = DissonanceCurve.new(~freq2, ~amps, (~conv1+300));
~spec2.plot;
)

3/2**[2,4,6,9];

3**[2,4,6,9];
2**[2,4,6,9];

220.3 424.04 282.68 141.32
