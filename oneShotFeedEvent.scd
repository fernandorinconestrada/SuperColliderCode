(
SynthDef(\oneShotRes, { |imp, gate|
	var one, two, three, four, env, mix, feedOne, feedTwo, feedThree, feedFour, mixFeed, mixNum, delFeed1, delFeed2, in;
	env = EnvGen.kr(Env.perc(0.001, 1.5), gate);
	one = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1000),LFNoise0.kr(2).range(49, 80),0.5, 0.05).sin;
	feedOne = Ringz.ar(one, LFNoise0.kr(3).range(100, 200), 0.1);
	two = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1200),LFNoise0.kr(3).range(80, 100),0.5, 0.05).sin;
	feedTwo = Ringz.ar(two, LFNoise0.kr(5).range(200, 400), 0.1);
	three = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1300),LFNoise0.kr(5).range(98, 200),0.75, 0.05).sin;
	feedThree = Ringz.ar(three, LFNoise0.kr(3).range(400, 800), 0.1);
	four = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1700),LFNoise0.kr(3).range(200, 400),0.75, 0.05).sin;
	feedFour = Ringz.ar(four, LFNoise0.kr(2).range(800, 1600), 0.1);
	mixNum = Mix.new([one, two, three, four]);
	delFeed1 = AllpassC.ar(mixNum, 0.3, LFNoise0.ar(1).range(0.05, 0.2), LFNoise1.ar(0.5).range(0.5, 0.7), 0.8);
	mixFeed = Mix.new([feedOne, feedTwo, feedThree, feedFour]);
	delFeed2 = AllpassC.ar(mixFeed, 0.3, LFNoise0.ar(1).range(0.1, 0.25), LFNoise1.ar(0.5).range(0.5, 1.3), 0.6);
	mix = Mix.new([mixNum, delFeed1, mixFeed, delFeed2]);
	in = Limiter.ar(mix, 0.9, 0.01);
	Out.ar([0,1], FreeVerb.ar(in, 0.2, 0.1));
}).add
)

b = Synth(\oneShotRes);

x = FreqScope.new;
OSCdef(\gate, {|msg, time, addr, recvPort| b.set(\gate, msg[1].postln)},"2/push1", nil, 57121);