(
(
SynthDef(\oneShotResA, { |gate|
	var env, trigNum1, trigNum2, trigNum3, trigNum4, trigFeed1, trigFeed2, trigFeed3, trigFeed4, one, feedOne, two, feedTwo, three, feedThree, four, feedFour, mixNum, delFeed1, mix, mixFeed, delFeed2, in;
	env = EnvGen.kr(Env.perc(0.001, 1), gate);
	trigNum1 = Dwhite(0, 1, inf);
	trigNum2 = Dwhite(0, 1, inf);
	trigNum3 = Dwhite(0, 1, inf);
	trigNum4 = Dwhite(0, 1, inf);
	trigFeed1 = Dwhite(0, 1, inf);
	trigFeed2 = Dwhite(0, 1, inf);
	trigFeed3 = Dwhite(0, 1, inf);
	trigFeed4 = Dwhite(0, 1, inf);
	one = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1000), Demand.kr(gate, 0, trigNum1 * 40 + 40), 0.5, 0.06).sin;
	feedOne = Ringz.ar(one, Demand.kr(gate, 0, trigFeed1 * 100 + 100) , 0.3);
	two = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1200),Demand.kr(gate, 0, trigNum2 * 20 + 80),0.5, 0.05).sin;
	feedTwo = Ringz.ar(two, Demand.kr(gate, 0, trigFeed2 * 200 + 200), 0.3);
	three = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1300),Demand.kr(gate, 0, trigNum3 * 98 + 100),0.5, 0.04).sin;
	feedThree = Ringz.ar(three, Demand.kr(gate, 0, trigFeed3 * 400 + 400), 0.3);
	four = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1700),Demand.kr(gate, 0, trigNum4 * 200 + 200),0.5, 0.03).sin;
	feedFour = Ringz.ar(four, Demand.kr(gate, 0, trigFeed4 * 800 + 800), 0.3);
	mixNum = Mix.new([one, two, three, four]);
	delFeed1 = AllpassC.ar(mixNum, 0.3, Demand.kr(gate, 0, trigFeed4 * 0.15 + 0.05), Demand.kr(gate, 0, trigFeed2 * 0.2 + 0.5), 0.8);
	mixFeed = Mix.new([feedOne, feedTwo, feedThree, feedFour]);
	delFeed2 = AllpassC.ar(mixFeed, 0.3, Demand.kr(gate, 0, trigNum3 * 0.15 + 0.1), Demand.kr(gate, 0, trigNum1 * 0.8 + 0.5), 0.6);
	mix = Mix.new([mixNum, delFeed1, mixFeed, delFeed2]);
	in = LPF.ar(Limiter.ar(mix, 0.9, 0.01), 12000);
	OffsetOut.ar([0,1], FreeVerb.ar(in, Demand.kr(gate, 0, trigNum2 * 0.1 + 0.1), Demand.kr(gate, 0, trigNum4 * 0.15 + 0.15), Demand.kr(gate, 0, trigFeed1 * 0.5 + 0.15) ) );
}).add
);
(
c = Synth(\oneShotResA);
d = Synth(\oneShotResA);
e = Synth(\oneShotResA);
);
(
OSCdef(\gate1, {|msg, time, addr, recvPort| c.set(\gate, msg[1].postln)},"2/push1", nil, 57121);
OSCdef(\gate2, {|msg, time, addr, recvPort| d.set(\gate, msg[1].postln)},"2/push2", nil, 57121);
OSCdef(\gate3, {|msg, time, addr, recvPort| e.set(\gate, msg[1].postln)},"2/push3", nil, 57121);
);
)