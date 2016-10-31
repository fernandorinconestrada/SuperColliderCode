(
SynthDef(\sinOscFBGrain, { |trigNoise = 80, rel = 0.04, loAmp = 0.1, hiAmp = 0.3, fund = 440, bw = 0.001, loFb = 0.2, hiFb = 0.4, delT = 0.05, ampDel = 0.5, busL = 0, busR = 1|
	var trig, env, in;
	trig = LFNoise0.kr(trigNoise);
	env = EnvGen.ar(Env.perc(0.01, rel), trig, trig.range(loAmp, hiAmp));
	in = SinOscFB.ar(trig.range(fund-((fund/2)*bw), ((fund*2)*bw+fund)),trig.range(loFb, hiFb), env);
	OffsetOut.ar(busL, in);
	OffsetOut.ar(busR, DelayC.ar(in, 0.2, delT, ampDel));
}).add;
)

a = Synth(\sinOscFBGrain);
a.set(\bw, 0.1);
a.set(\delT = 0.08);
a.set(\bw, 0.01);
a.set(\busL, 1, \busR, 0);
a.set(\rel, 0.02);

b = Synth(\sinOscFBGrain, [\fund, 441]);
b.set(\rel, 0.03);