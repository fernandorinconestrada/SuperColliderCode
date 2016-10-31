(
SynthDef(\algoTestEight, { | densAttack = 0.4, freqs = #[0,0,0,0,0], bws = #[0,0,0,0,0], amps = #[0,0,0,0,0] |
	var trig, decay, delTrig, in;
	trig = Impulse.ar(densAttack);
	decay = TRand.ar(2.0, 2.5, trig).poll(label: \decay);
	delTrig = (1/TRand.ar(4, 16, trig).poll(label: \divisor)).poll(label: \delTrig);
	//in = Mix.new(SinOscFB.ar(freqs, bws, amps));
	in = Mix.new(BBandPass.ar(GrayNoise.ar(1), freqs, bws, amps));
	OffsetOut.ar(0, Decay2.ar(trig,  0.01, decay/2, in));
	OffsetOut.ar(1, Decay2.ar(TDelay.ar(trig, (delTrig*1).poll(label: \trig1)),  0.01, decay/3, in*(1/2.squared)));
	OffsetOut.ar(2, Decay2.ar(TDelay.ar(trig, (delTrig*2).poll(label: \trig2)),  0.01, decay/4, in*(1/3.squared)));
	OffsetOut.ar(3, Decay2.ar(TDelay.ar(trig, (delTrig*3).poll(label: \trig3)),  0.01, decay/5, in*(1/4.squared)));
	OffsetOut.ar(4, Decay2.ar(TDelay.ar(trig, (delTrig*4).poll(label: \trig4)),  0.01, decay/6, in*(1/5.squared)));
	OffsetOut.ar(5, Decay2.ar(TDelay.ar(trig, (delTrig*5).poll(label: \trig5)),  0.01, decay/7, in*(1/6.squared)));
	OffsetOut.ar(6, Decay2.ar(TDelay.ar(trig, (delTrig*6).poll(label: \trig6)),  0.01, decay/8, in*(1/7.squared)));
	OffsetOut.ar(7, Decay2.ar(TDelay.ar(trig, (delTrig*7).poll(label: \trig7)),  0.01, decay/9, in*(1/8.squared)));
	OffsetOut.ar(0, Decay2.ar(TDelay.ar(trig, (delTrig*8).poll(label: \trig8)),  0.01, decay/10, in*(1/9.squared)));
	OffsetOut.ar(1, Decay2.ar(TDelay.ar(trig, (delTrig*9).poll(label: \trig9)),  0.01, decay/11, in*(1/10.squared)));
	OffsetOut.ar(2, Decay2.ar(TDelay.ar(trig, (delTrig*10).poll(label: \trig10)),  0.01, decay/12, in*(1/11.squared)));
	OffsetOut.ar(3, Decay2.ar(TDelay.ar(trig, (delTrig*11).poll(label: \trig11)),  0.01, decay/13, in*(1/12.squared)));
	OffsetOut.ar(4, Decay2.ar(TDelay.ar(trig, (delTrig*12).poll(label: \trig12)),  0.01, decay/14, in*(1/13.squared)));
	OffsetOut.ar(5, Decay2.ar(TDelay.ar(trig, (delTrig*13).poll(label: \trig13)),  0.01, decay/15, in*(1/14.squared)));
	OffsetOut.ar(6, Decay2.ar(TDelay.ar(trig, (delTrig*14).poll(label: \trig14)),  0.01, decay/16, in*(1/15.squared)));
	OffsetOut.ar(7, Decay2.ar(TDelay.ar(trig, (delTrig*15).poll(label: \trig15)),  0.01, decay/17, in*(1/16.squared)));
}).add;
)
(
SynthDef(\algoTestEightdelay, { | densAttack = 0.4, freqs = #[0,0,0,0,0], bws = #[0,0,0,0,0], amps = #[0,0,0,0,0] |
	var trig, decay, delTrig, in, delay;
	trig = Impulse.ar(densAttack);
	decay = TRand.ar(2.0, 2.5, trig).poll(label: \decay);
	delTrig = (1/TRand.ar(4, 16, trig).poll(label: \divisor)).poll(label: \delTrig);
	in = Mix.new(SinOscFB.ar(freqs, bws, amps));
	//in = Mix.new(BBandPass.ar(GrayNoise.ar(1), freqs, bws, amps));
	delay = Mix.new(in, DelayC.ar(in, 0.2, 0.02, 0.75), DelayC.ar(in, 0.2, 0.04, 0.5));
	OffsetOut.ar(0, Decay2.ar(trig,  0.01, decay/2, delay));
	OffsetOut.ar(1, Decay2.ar(TDelay.ar(trig, (delTrig*1).poll(label: \trig1)),  0.01, decay/3, delay*(1/2.squared)));
	OffsetOut.ar(2, Decay2.ar(TDelay.ar(trig, (delTrig*2).poll(label: \trig2)),  0.01, decay/4, delay*(1/3.squared)));
	OffsetOut.ar(3, Decay2.ar(TDelay.ar(trig, (delTrig*3).poll(label: \trig3)),  0.01, decay/5, delay*(1/4.squared)));
	OffsetOut.ar(4, Decay2.ar(TDelay.ar(trig, (delTrig*4).poll(label: \trig4)),  0.01, decay/6, delay*(1/5.squared)));
	OffsetOut.ar(5, Decay2.ar(TDelay.ar(trig, (delTrig*5).poll(label: \trig5)),  0.01, decay/7, delay*(1/6.squared)));
	OffsetOut.ar(6, Decay2.ar(TDelay.ar(trig, (delTrig*6).poll(label: \trig6)),  0.01, decay/8, delay*(1/7.squared)));
	OffsetOut.ar(7, Decay2.ar(TDelay.ar(trig, (delTrig*7).poll(label: \trig7)),  0.01, decay/9, delay*(1/8.squared)));
	OffsetOut.ar(0, Decay2.ar(TDelay.ar(trig, (delTrig*8).poll(label: \trig8)),  0.01, decay/10, delay*(1/9.squared)));
	OffsetOut.ar(1, Decay2.ar(TDelay.ar(trig, (delTrig*9).poll(label: \trig9)),  0.01, decay/11, delay*(1/10.squared)));
	OffsetOut.ar(2, Decay2.ar(TDelay.ar(trig, (delTrig*10).poll(label: \trig10)),  0.01, decay/12, delay*(1/11.squared)));
	OffsetOut.ar(3, Decay2.ar(TDelay.ar(trig, (delTrig*11).poll(label: \trig11)),  0.01, decay/13, delay*(1/12.squared)));
	OffsetOut.ar(4, Decay2.ar(TDelay.ar(trig, (delTrig*12).poll(label: \trig12)),  0.01, decay/14, delay*(1/13.squared)));
	OffsetOut.ar(5, Decay2.ar(TDelay.ar(trig, (delTrig*13).poll(label: \trig13)),  0.01, decay/15, delay*(1/14.squared)));
	OffsetOut.ar(6, Decay2.ar(TDelay.ar(trig, (delTrig*14).poll(label: \trig14)),  0.01, decay/16, delay*(1/15.squared)));
	OffsetOut.ar(7, Decay2.ar(TDelay.ar(trig, (delTrig*15).poll(label: \trig15)),  0.01, decay/17, delay*(1/16.squared)));
}).add;
)
(
SynthDef(\algoTestEightRand, { | densAttack = 0.4, freqs = #[0,0,0,0,0], bws = #[0,0,0,0,0], amps = #[0,0,0,0,0] |
	var trig, decay, delTrig, in;
	trig = Impulse.ar(densAttack);
	decay = TRand.ar(2.0, 2.5, trig).poll(label: \decay);
	delTrig = (1/TRand.ar(4, 16, trig).poll(label: \divisor)).poll(label: \delTrig);
	in = Mix.new(SinOscFB.ar(freqs, bws, amps));
	//in = Mix.new(BBandPass.ar(GrayNoise.ar(1), freqs, bws, amps));
	OffsetOut.ar(0, Decay2.ar(trig,  0.01, decay/2, in));
	OffsetOut.ar(1, Decay2.ar(TDelay.ar(trig, (delTrig*1*TRand.kr(0.8, 1.2, trig)).poll(label: \trig1)),  0.01, decay/3, in*(1/2.squared)));
	OffsetOut.ar(2, Decay2.ar(TDelay.ar(trig, (delTrig*2*TRand.kr(0.8, 1.2, trig)).poll(label: \trig2)),  0.01, decay/4, in*(1/3.squared)));
	OffsetOut.ar(3, Decay2.ar(TDelay.ar(trig, (delTrig*3*TRand.kr(0.8, 1.2, trig)).poll(label: \trig3)),  0.01, decay/5, in*(1/4.squared)));
	OffsetOut.ar(4, Decay2.ar(TDelay.ar(trig, (delTrig*4*TRand.kr(0.8, 1.2, trig)).poll(label: \trig4)),  0.01, decay/6, in*(1/5.squared)));
	OffsetOut.ar(5, Decay2.ar(TDelay.ar(trig, (delTrig*5*TRand.kr(0.8, 1.2, trig)).poll(label: \trig5)),  0.01, decay/7, in*(1/6.squared)));
	OffsetOut.ar(6, Decay2.ar(TDelay.ar(trig, (delTrig*6*TRand.kr(0.8, 1.2, trig)).poll(label: \trig6)),  0.01, decay/8, in*(1/7.squared)));
	OffsetOut.ar(7, Decay2.ar(TDelay.ar(trig, (delTrig*7*TRand.kr(0.8, 1.2, trig)).poll(label: \trig7)),  0.01, decay/9, in*(1/8.squared)));
	OffsetOut.ar(0, Decay2.ar(TDelay.ar(trig, (delTrig*8*TRand.kr(0.8, 1.2, trig)).poll(label: \trig8)),  0.01, decay/10, in*(1/9.squared)));
	OffsetOut.ar(1, Decay2.ar(TDelay.ar(trig, (delTrig*9*TRand.kr(0.8, 1.2, trig)).poll(label: \trig9)),  0.01, decay/11, in*(1/10.squared)));
	OffsetOut.ar(2, Decay2.ar(TDelay.ar(trig, (delTrig*10*TRand.kr(0.8, 1.2, trig)).poll(label: \trig10)),  0.01, decay/12, in*(1/11.squared)));
	OffsetOut.ar(3, Decay2.ar(TDelay.ar(trig, (delTrig*11*TRand.kr(0.8, 1.2, trig)).poll(label: \trig11)),  0.01, decay/13, in*(1/12.squared)));
	OffsetOut.ar(4, Decay2.ar(TDelay.ar(trig, (delTrig*12*TRand.kr(0.8, 1.2, trig)).poll(label: \trig12)),  0.01, decay/14, in*(1/13.squared)));
	OffsetOut.ar(5, Decay2.ar(TDelay.ar(trig, (delTrig*13*TRand.kr(0.8, 1.2, trig)).poll(label: \trig13)),  0.01, decay/15, in*(1/14.squared)));
	OffsetOut.ar(6, Decay2.ar(TDelay.ar(trig, (delTrig*14*TRand.kr(0.8, 1.2, trig)).poll(label: \trig14)),  0.01, decay/16, in*(1/15.squared)));
	OffsetOut.ar(7, Decay2.ar(TDelay.ar(trig, (delTrig*15*TRand.kr(0.8, 1.2, trig)).poll(label: \trig15)),  0.01, decay/17, in*(1/16.squared)));
}).add;
)

(
~fund = 55;
~ratio = 3/2;
~fifths1 = [1,3,5,8];//[2,2,3] perm1
~fifths2 = [1,3,6,8];//[2,3,2] perm2
~fifths3 = [1,4,6,8];//[3,2,2] perm3
~perm1 = [~fund, ~fund*(~ratio*~ratio.pow(~fifths1.at(0))), ~fund*(~ratio*~ratio.pow(~fifths1.at(1))), ~fund*(~ratio*~ratio.pow(~fifths1.at(2))), ~fund*(~ratio*~ratio.pow(~fifths1.at(3)))];
~perm2 = [~fund, ~fund*(~ratio*~ratio.pow(~fifths2.at(0))), ~fund*(~ratio*~ratio.pow(~fifths2.at(1))), ~fund*(~ratio*~ratio.pow(~fifths2.at(2))), ~fund*(~ratio*~ratio.pow(~fifths2.at(3)))];
~perm3 = [~fund, ~fund*(~ratio*~ratio.pow(~fifths3.at(0))), ~fund*(~ratio*~ratio.pow(~fifths3.at(1))), ~fund*(~ratio*~ratio.pow(~fifths3.at(2))), ~fund*(~ratio*~ratio.pow(~fifths3.at(3)))];
//~amps = Array.rand(5, 1, 2);
~amps = Array.rand(5, 0.1, 0.2);
~bws = Array.rand(5, 0.3, 0.7);
//~bws = Array.rand(5, 0.001, 0.01);
)
a = Synth(\algoTestEightdelay, [\freqs, ~perm1, \amps, ~amps, \bws, ~bws]);
a.set(\amps, ~amps);

(1/(1..16)).squared.plot;

2/7*(0..7)-1.0;

0.373744*16

2.05439/8;