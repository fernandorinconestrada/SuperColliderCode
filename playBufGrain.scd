(
b = Buffer.readChannel(s, "/Users/fernandorincon/Desktop/Untitled Session 1/Bounced Files/Bounce_1.wav", channels: 1);
//b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");

SynthDef(\playBufGrain, { |bufnum, sustLev = 0.1, decLev = 0.3, attT = 0.01, sustT = 0.03, decT = 0.05, curveAtt = 8, curveSust = -8, curveDec = -8, start = 20 end = 2, durLine = 50, ratePan = 0.04, rateAmp = 0.04, ampMax = 0.7, ampMin = 0.1, rateTransp = 10, rateBufPos = 15|
	var env, trig, pan, amp, out;
	//trig = Impulse.kr(XLine.kr(start, end, durLine, doneAction:2));
	trig = Impulse.kr(Stepper.kr(Impulse.kr(0.64), 0, 1, 17, -1, 0).poll);
	//trig = Impulse.ar(EnvGen.kr(Env([0.01, 20, 0.01], [0, 20], [8, -4]), Impulse.kr(0.05)).poll);
	env = EnvGen.kr(Env([0, sustLev, decLev, 0], [attT, sustT, decT], [curveAtt, curveSust, curveDec]), trig);
	pan = SinOsc.kr(ratePan).range(-1.0, 1.0);
	amp = SinOsc.kr(0.04, 0, ampMax, ampMin).abs;
	out = Pan2.ar(PlayBuf.ar(1, bufnum, LFNoise0.kr(rateTransp, 1.05, 0.59).abs, env, LFNoise0.kr(rateBufPos).abs, 1), pan, amp) * env;
	OffsetOut.ar(0, HPF.ar(out, 30));
	OffsetOut.ar(0, Pan2.ar(HPF.ar(DelayC.ar(out, 0.2, SinOsc.kr(0.04, 0, 0.05, 0.01).abs, amp * 0.8 ), 30), pan * XLine.kr(-1.0, -0.1, 25)));
}).add;
)

a.set(\sustT, 0.03);
a.set(\decT, 0.05);

a = Synth(\playBufGrain, [\bufnum, b]);
0.68*25

16/25