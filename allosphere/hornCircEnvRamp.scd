(
SynthDef(\hornCircEnvRamp, { | ampWhite = 1.5, freqTrig 1, dur = 1, bus = #[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22], startFreq = 55, endFreq = 77.78, freqs = #[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], bws = #[0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0], amps = #[0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0], ampF1 = #[0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0], ampF2 = #[0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0], ampF3 = #[0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0], sclF1 = 0.2, sclF2 = 0.08, sclF3 = 0.04, delT = 0.05, ampDel = 0.75, mix = 0.2, room = 0.3, damp = 0.3, ampRev = 1.0, durGest = 30, gate = 1 |
	var in, trig, env, envDel, envGest, fund, harm1, delHarm1, harm2, delHarm2, harm3, delHarm3, harm4, delHarm4, harm5, delHarm5, harm6, delHarm6, harm7, delHarm7, harm8, delHarm8, harm9, delHarm9, harm10, delHarm10, harm11, delHarm11, harm12, delHarm12, harm13, delHarm13, harm14, delHarm14, harm15, delHarm15, harm16, delHarm16, harm17, delHarm17, harm18, delHarm18, harm19, delHarm19, harm20, delHarm20;

	in = WhiteNoise.ar(ampWhite);
	trig = Impulse.kr(freqTrig);
	env = EnvGen.kr(Env([0,0.9,0.9,0], [dur*0.01, dur*0.97, dur*0.01], [-3, 0, 3]), trig);
	envDel = EnvGen.kr(Env([0,0.9,0.9,0], [dur*0.01, dur*0.97, dur*0.01], [-3, 0, 3]), TDelay.kr(trig, dur/2));
	envGest = EnvGen.kr(Env([0,1,0], [durGest*0.5, durGest*0.5], \sin), gate, doneAction:2);
	fund = Line.kr(startFreq, endFreq, durGest, doneAction:2);

	harm1 = (Mix.new(BBandPass.ar(in, fund*freqs.at(0),  bws.at(0), amps.at(0)),   Formant.ar(fund, 175, 250, ampF1.at(0)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(0)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(0)*sclF3))*env)*envGest;
	harm2 = (Mix.new(BBandPass.ar(in, fund*freqs.at(1),  bws.at(1), amps.at(1)),   Formant.ar(fund, 175, 250, ampF1.at(1)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(1)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(1)*sclF3))*env)*envGest;
	harm3 = (Mix.new(BBandPass.ar(in, fund*freqs.at(2),  bws.at(2), amps.at(2)),   Formant.ar(fund, 175, 250, ampF1.at(2)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(2)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(2)*sclF3))*env)*envGest;
	harm4 = (Mix.new(BBandPass.ar(in, fund*freqs.at(3),  bws.at(3), amps.at(3)),   Formant.ar(fund, 175, 250, ampF1.at(3)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(3)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(3)*sclF3))*env)*envGest;
	harm5 = (Mix.new(BBandPass.ar(in, fund*freqs.at(4),  bws.at(4), amps.at(4)),   Formant.ar(fund, 175, 250, ampF1.at(4)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(4)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(4)*sclF3))*env)*envGest;
	harm6 = (Mix.new(BBandPass.ar(in, fund*freqs.at(5),  bws.at(5), amps.at(5)),   Formant.ar(fund, 175, 250, ampF1.at(5)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(5)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(5)*sclF3))*env)*envGest;
	harm7 = (Mix.new(BBandPass.ar(in, fund*freqs.at(6),  bws.at(6), amps.at(6)),   Formant.ar(fund, 175, 250, ampF1.at(6)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(6)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(6)*sclF3))*env)*envGest;
	harm8 = (Mix.new(BBandPass.ar(in, fund*freqs.at(7),  bws.at(7), amps.at(7)),   Formant.ar(fund, 175, 250, ampF1.at(7)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(1)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(1)*sclF3))*env)*envGest;
	harm9 = (Mix.new(BBandPass.ar(in, fund*freqs.at(8),  bws.at(8), amps.at(8)),   Formant.ar(fund, 175, 250, ampF1.at(8)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(2)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(2)*sclF3))*env)*envGest;
	harm10 = (Mix.new(BBandPass.ar(in, fund*freqs.at(9),  bws.at(9), amps.at(9)),  Formant.ar(fund, 175, 250, ampF1.at(9)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(3)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(3)*sclF3))*env)*envGest;
	harm11 = (Mix.new(BBandPass.ar(in, fund*freqs.at(10), bws.at(10), amps.at(10)), Formant.ar(fund, 175, 250, ampF1.at(10)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(10)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(10)*sclF3))*env)*envGest;
	harm12 = (Mix.new(BBandPass.ar(in, fund*freqs.at(11), bws.at(11), amps.at(11)), Formant.ar(fund, 175, 250, ampF1.at(11)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(11)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(11)*sclF3))*env)*envGest;
	harm13 = (Mix.new(BBandPass.ar(in, fund*freqs.at(12), bws.at(12), amps.at(12)), Formant.ar(fund, 175, 250, ampF1.at(12)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(12)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(12)*sclF3))*env)*envGest;
	harm14 = (Mix.new(BBandPass.ar(in, fund*freqs.at(13), bws.at(13), amps.at(13)), Formant.ar(fund, 175, 250, ampF1.at(13)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(13)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(13)*sclF3))*env)*envGest;
	harm15 = (Mix.new(BBandPass.ar(in, fund*freqs.at(14), bws.at(14), amps.at(14)), Formant.ar(fund, 175, 250, ampF1.at(14)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(14)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(14)*sclF3))*env)*envGest;
	harm16 = (Mix.new(BBandPass.ar(in, fund*freqs.at(15), bws.at(15), amps.at(15)), Formant.ar(fund, 175, 250, ampF1.at(15)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(15)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(15)*sclF3))*env)*envGest;
	harm17 = (Mix.new(BBandPass.ar(in, fund*freqs.at(16), bws.at(16), amps.at(16)), Formant.ar(fund, 175, 250, ampF1.at(16)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(16)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(16)*sclF3))*env)*envGest;
	harm18 = (Mix.new(BBandPass.ar(in, fund*freqs.at(17), bws.at(17), amps.at(17)), Formant.ar(fund, 175, 250, ampF1.at(17)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(17)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(17)*sclF3))*env)*envGest;
	harm19 = (Mix.new(BBandPass.ar(in, fund*freqs.at(18), bws.at(18), amps.at(18)), Formant.ar(fund, 175, 250, ampF1.at(18)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(18)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(18)*sclF3))*env)*envGest;
	harm20 = (Mix.new(BBandPass.ar(in, fund*freqs.at(19), bws.at(19), amps.at(19)), Formant.ar(fund, 175, 250, ampF1.at(19)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(19)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(19)*sclF3))*env)*envGest;

	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(0)),   FreeVerb.ar(harm1, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(1)),   FreeVerb.ar(harm2, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(2)),   FreeVerb.ar(harm3, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(3)),   FreeVerb.ar(harm4, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(4)),   FreeVerb.ar(harm5, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(5)),   FreeVerb.ar(harm6, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(6)),   FreeVerb.ar(harm7, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(7)),   FreeVerb.ar(harm8, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(8)),   FreeVerb.ar(harm9, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(9)),   FreeVerb.ar(harm10, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(10)),  FreeVerb.ar(harm11, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(11)),  FreeVerb.ar(harm12, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(12)),  FreeVerb.ar(harm13, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(13)),  FreeVerb.ar(harm14, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(14)),  FreeVerb.ar(harm15, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(15)),  FreeVerb.ar(harm16, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(16)),  FreeVerb.ar(harm17, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(17)),  FreeVerb.ar(harm18, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(18)),  FreeVerb.ar(harm19, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(19)),  FreeVerb.ar(harm20, mix, room, damp, ampRev));

	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(0)),   FreeVerb.ar(harm1, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(1)),   FreeVerb.ar(harm2, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(2)),   FreeVerb.ar(harm3, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(3)),   FreeVerb.ar(harm4, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(4)),   FreeVerb.ar(harm5, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(5)),   FreeVerb.ar(harm6, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(6)),   FreeVerb.ar(harm7, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(7)),   FreeVerb.ar(harm8, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(8)),   FreeVerb.ar(harm9, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(9)),   FreeVerb.ar(harm10, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(10)),  FreeVerb.ar(harm11, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(11)),  FreeVerb.ar(harm12, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(12)),  FreeVerb.ar(harm13, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(13)),  FreeVerb.ar(harm14, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(14)),  FreeVerb.ar(harm15, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(15)),  FreeVerb.ar(harm16, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(16)),  FreeVerb.ar(harm17, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(17)),  FreeVerb.ar(harm18, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(18)),  FreeVerb.ar(harm19, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(19)),  FreeVerb.ar(harm20, mix, room, damp, ampRev)*envDel);
}).send(s);
)
Env([0,1,0], [0.01, 0.98], \linear).plot;
(
SynthDef(\hornCircEnvRampCont, { | ampWhite = 1.5, freqTrig 1, dur = 1, bus = #[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22], startFreq = 55, endFreq = 77.78, freqs = #[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], bws = #[0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0], amps = #[0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0], ampF1 = #[0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0], ampF2 = #[0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0], ampF3 = #[0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0, 0,0,0,0,0], sclF1 = 0.2, sclF2 = 0.08, sclF3 = 0.04, delT = 0.05, ampDel = 0.75, mix = 0.2, room = 0.3, damp = 0.3, ampRev = 1.0, durGest = 60, gate = 1 |
	var in, trig, env, envDel, envGest, fund, harm1, delHarm1, harm2, delHarm2, harm3, delHarm3, harm4, delHarm4, harm5, delHarm5, harm6, delHarm6, harm7, delHarm7, harm8, delHarm8, harm9, delHarm9, harm10, delHarm10, harm11, delHarm11, harm12, delHarm12, harm13, delHarm13, harm14, delHarm14, harm15, delHarm15, harm16, delHarm16, harm17, delHarm17, harm18, delHarm18, harm19, delHarm19, harm20, delHarm20;

	in = WhiteNoise.ar(ampWhite);
	trig = Impulse.kr(freqTrig);
	env = EnvGen.kr(Env([0,0.9,0.9,0], [dur*0.01, dur*0.97, dur*0.01], [-3, 0, 3]), trig);
	envDel = EnvGen.kr(Env([0,0.9,0.9,0], [dur*0.01, dur*0.97, dur*0.01], [-3, 0, 3]), TDelay.kr(trig, dur/2));
	envGest = EnvGen.kr(Env([0,1,0], [durGest*0.01, durGest*0.98], \linear), gate, doneAction:2);
	fund = Line.kr(startFreq, endFreq, durGest/8);

	harm1 = (Mix.new(BBandPass.ar(in, fund*freqs.at(0),  bws.at(0), amps.at(0)),   Formant.ar(fund, 175, 250, ampF1.at(0)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(0)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(0)*sclF3))*env)*envGest;
	harm2 = (Mix.new(BBandPass.ar(in, fund*freqs.at(1),  bws.at(1), amps.at(1)),   Formant.ar(fund, 175, 250, ampF1.at(1)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(1)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(1)*sclF3))*env)*envGest;
	harm3 = (Mix.new(BBandPass.ar(in, fund*freqs.at(2),  bws.at(2), amps.at(2)),   Formant.ar(fund, 175, 250, ampF1.at(2)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(2)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(2)*sclF3))*env)*envGest;
	harm4 = (Mix.new(BBandPass.ar(in, fund*freqs.at(3),  bws.at(3), amps.at(3)),   Formant.ar(fund, 175, 250, ampF1.at(3)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(3)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(3)*sclF3))*env)*envGest;
	harm5 = (Mix.new(BBandPass.ar(in, fund*freqs.at(4),  bws.at(4), amps.at(4)),   Formant.ar(fund, 175, 250, ampF1.at(4)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(4)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(4)*sclF3))*env)*envGest;
	harm6 = (Mix.new(BBandPass.ar(in, fund*freqs.at(5),  bws.at(5), amps.at(5)),   Formant.ar(fund, 175, 250, ampF1.at(5)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(5)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(5)*sclF3))*env)*envGest;
	harm7 = (Mix.new(BBandPass.ar(in, fund*freqs.at(6),  bws.at(6), amps.at(6)),   Formant.ar(fund, 175, 250, ampF1.at(6)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(6)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(6)*sclF3))*env)*envGest;
	harm8 = (Mix.new(BBandPass.ar(in, fund*freqs.at(7),  bws.at(7), amps.at(7)),   Formant.ar(fund, 175, 250, ampF1.at(7)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(1)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(1)*sclF3))*env)*envGest;
	harm9 = (Mix.new(BBandPass.ar(in, fund*freqs.at(8),  bws.at(8), amps.at(8)),   Formant.ar(fund, 175, 250, ampF1.at(8)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(2)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(2)*sclF3))*env)*envGest;
	harm10 = (Mix.new(BBandPass.ar(in, fund*freqs.at(9),  bws.at(9), amps.at(9)),  Formant.ar(fund, 175, 250, ampF1.at(9)*sclF1),  Formant.ar(fund, 900, 660, ampF2.at(3)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(3)*sclF3))*env)*envGest;
	harm11 = (Mix.new(BBandPass.ar(in, fund*freqs.at(10), bws.at(10), amps.at(10)), Formant.ar(fund, 175, 250, ampF1.at(10)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(10)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(10)*sclF3))*env)*envGest;
	harm12 = (Mix.new(BBandPass.ar(in, fund*freqs.at(11), bws.at(11), amps.at(11)), Formant.ar(fund, 175, 250, ampF1.at(11)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(11)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(11)*sclF3))*env)*envGest;
	harm13 = (Mix.new(BBandPass.ar(in, fund*freqs.at(12), bws.at(12), amps.at(12)), Formant.ar(fund, 175, 250, ampF1.at(12)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(12)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(12)*sclF3))*env)*envGest;
	harm14 = (Mix.new(BBandPass.ar(in, fund*freqs.at(13), bws.at(13), amps.at(13)), Formant.ar(fund, 175, 250, ampF1.at(13)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(13)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(13)*sclF3))*env)*envGest;
	harm15 = (Mix.new(BBandPass.ar(in, fund*freqs.at(14), bws.at(14), amps.at(14)), Formant.ar(fund, 175, 250, ampF1.at(14)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(14)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(14)*sclF3))*env)*envGest;
	harm16 = (Mix.new(BBandPass.ar(in, fund*freqs.at(15), bws.at(15), amps.at(15)), Formant.ar(fund, 175, 250, ampF1.at(15)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(15)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(15)*sclF3))*env)*envGest;
	harm17 = (Mix.new(BBandPass.ar(in, fund*freqs.at(16), bws.at(16), amps.at(16)), Formant.ar(fund, 175, 250, ampF1.at(16)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(16)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(16)*sclF3))*env)*envGest;
	harm18 = (Mix.new(BBandPass.ar(in, fund*freqs.at(17), bws.at(17), amps.at(17)), Formant.ar(fund, 175, 250, ampF1.at(17)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(17)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(17)*sclF3))*env)*envGest;
	harm19 = (Mix.new(BBandPass.ar(in, fund*freqs.at(18), bws.at(18), amps.at(18)), Formant.ar(fund, 175, 250, ampF1.at(18)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(18)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(18)*sclF3))*env)*envGest;
	harm20 = (Mix.new(BBandPass.ar(in, fund*freqs.at(19), bws.at(19), amps.at(19)), Formant.ar(fund, 175, 250, ampF1.at(19)*sclF1), Formant.ar(fund, 900, 660, ampF2.at(19)*sclF2), Formant.ar(fund, 2300, 1400, ampF3.at(19)*sclF3))*env)*envGest;

	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(0)),   FreeVerb.ar(harm1, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(1)),   FreeVerb.ar(harm2, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(2)),   FreeVerb.ar(harm3, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(3)),   FreeVerb.ar(harm4, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(4)),   FreeVerb.ar(harm5, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(5)),   FreeVerb.ar(harm6, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(6)),   FreeVerb.ar(harm7, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(7)),   FreeVerb.ar(harm8, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(8)),   FreeVerb.ar(harm9, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(9)),   FreeVerb.ar(harm10, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(10)),  FreeVerb.ar(harm11, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(11)),  FreeVerb.ar(harm12, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(12)),  FreeVerb.ar(harm13, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(13)),  FreeVerb.ar(harm14, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(14)),  FreeVerb.ar(harm15, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(15)),  FreeVerb.ar(harm16, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(16)),  FreeVerb.ar(harm17, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(17)),  FreeVerb.ar(harm18, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(18)),  FreeVerb.ar(harm19, mix, room, damp, ampRev));
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(19)),  FreeVerb.ar(harm20, mix, room, damp, ampRev));

	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(0)),   FreeVerb.ar(harm1, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(1)),   FreeVerb.ar(harm2, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(2)),   FreeVerb.ar(harm3, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(3)),   FreeVerb.ar(harm4, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(4)),   FreeVerb.ar(harm5, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(5)),   FreeVerb.ar(harm6, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(6)),   FreeVerb.ar(harm7, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(7)),   FreeVerb.ar(harm8, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(8)),   FreeVerb.ar(harm9, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(9)),   FreeVerb.ar(harm10, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(10)),  FreeVerb.ar(harm11, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(11)),  FreeVerb.ar(harm12, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(12)),  FreeVerb.ar(harm13, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(13)),  FreeVerb.ar(harm14, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(14)),  FreeVerb.ar(harm15, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(15)),  FreeVerb.ar(harm16, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(16)),  FreeVerb.ar(harm17, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(17)),  FreeVerb.ar(harm18, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(18)),  FreeVerb.ar(harm19, mix, room, damp, ampRev)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(19)),  FreeVerb.ar(harm20, mix, room, damp, ampRev)*envDel);
}).send(s);
)

(
~bus = (0..22);
~bus1 = (0..22).reverse;
~fund = 55;
~freqs = (1..20);
~amps = [ -8.5775862068966, -3.6637931034483, 0, -9.1910112359551, -10, -10.539325842697, -18.23275862069, -12.629310344828, -19.438202247191, -20.606741573034, -20.991379310345, -21.465201465201, -26.300366300366, -27.765567765568, -28.278388278388, -28.644688644689, -28.577586206897, -27.887931034483, -28.318965517241, -29.612068965517 ]+14.1;
~bws = Array.rand(20, 0.00008, 0.0001);
)

a = Synth(\hornCircEnvRamp, [\bus, ~bus1, \freqs, ~freqs, \bws, ~bws, \amps, ~amps.dbamp, \ampF1, ~amps.dbamp, \ampF2, ~amps.dbamp, \ampF3, ~amps.dbamp, \freqTrig, 6, \dur, 1/6]);
a.set(\freqTrig, 4, \dur, 1/4);
a.set(\freqTrig, 10, \dur, 0.1);
a.set(\freqTrig, 9, \dur, 1/9);
a.set(\freqTrig, 6, \dur, 1/6); //stable for random
~bus1 = (0..22).scramble;
a.set(\bus, ~bus1);

b = Synth(\hornCircEnv, [\bus, ~bus1, \fund, 55.6, \freqs, ~freqs, \bws, ~bws, \amps, ~amps.dbamp, \ampF1, ~amps.dbamp, \ampF2, ~amps.dbamp, \ampF3, ~amps.dbamp, \freqTrig, 5, \dur, 1/5]);

(
~routHornCircShepTone =  Routine({
	var delta;
	1.do{
		Synth(\hornCircEnvRamp, [\bus, ~bus, \freqs, ~freqs, \bws, ~bws, \amps, ~amps.dbamp, \ampF1, ~amps.dbamp, \ampF2, ~amps.dbamp, \ampF3, ~amps.dbamp, \freqTrig, 5, \dur, 1/5, \dureGest, 30]);
		12.4.yield;
		Synth(\hornCircEnvRamp, [\bus, ~bus1, \freqs, ~freqs, \bws, ~bws, \amps, ~amps.dbamp, \ampF1, ~amps.dbamp, \ampF2, ~amps.dbamp, \ampF3, ~amps.dbamp, \freqTrig, 5.2, \dur, 1/5.2, \durGest, 26]);
		10.7.yield;
		Synth(\hornCircEnvRamp, [\bus, ~bus, \freqs, ~freqs, \bws, ~bws, \amps, ~amps.dbamp, \ampF1, ~amps.dbamp, \ampF2, ~amps.dbamp, \ampF3, ~amps.dbamp, \freqTrig, 5.4, \dur, 1/5.4, \durGest, 22]);
		9.1.yield;
		Synth(\hornCircEnvRamp, [\bus, ~bus1, \freqs, ~freqs, \bws, ~bws, \amps, ~amps.dbamp, \ampF1, ~amps.dbamp, \ampF2, ~amps.dbamp, \ampF3, ~amps.dbamp, \freqTrig, 5.6, \dur, 1/5.6, \durGest, 18]);
		7.4.yield;
		Synth(\hornCircEnvRamp, [\bus, ~bus, \freqs, ~freqs, \bws, ~bws, \amps, ~amps.dbamp, \ampF1, ~amps.dbamp, \ampF2, ~amps.dbamp, \ampF3, ~amps.dbamp, \freqTrig, 5.8, \dur, 1/5.8, \durGest, 14]);
		5.8.yield;
		Synth(\hornCircEnvRamp, [\bus, ~bus1, \freqs, ~freqs, \bws, ~bws, \amps, ~amps.dbamp, \ampF1, ~amps.dbamp, \ampF2, ~amps.dbamp, \ampF3, ~amps.dbamp, \freqTrig, 6, \dur, 1/6, \durGest, 10]);
		4.1.yield;
		Synth(\hornCircEnvRamp, [\bus, ~bus1, \freqs, ~freqs, \bws, ~bws, \amps, ~amps.dbamp, \ampF1, ~amps.dbamp, \ampF2, ~amps.dbamp, \ampF3, ~amps.dbamp, \freqTrig, 6, \dur, 1/6, \durGest, 6]);
		1.25.yield;
		Synth(\hornCircEnvRampCont, [\bus, ~bus1, \freqs, ~freqs, \bws, ~bws, \amps, ~amps.dbamp, \ampF1, ~amps.dbamp, \ampF2, ~amps.dbamp, \ampF3, ~amps.dbamp, \freqTrig, 6, \dur, 1/6]);
		Synth(\hornCircEnvRampCont, [\bus, ~bus, \endFreq, 77.58, \freqs, ~freqs, \bws, ~bws, \amps, ~amps.dbamp, \ampF1, ~amps.dbamp, \ampF2, ~amps.dbamp, \ampF3, ~amps.dbamp, \freqTrig, 7, \dur, 1/7]);
	};
})
)

~routHornCircShepTone.play;
~routHornCircShepTone.stop;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/horn/routHornCircEnvRampShepTone_Take2.aif");
s.record;
s.stopRecording;

6/2.42
