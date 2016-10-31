(
SynthDef(\fluteRout, { |busS = 0, busD = 1, vibRate = 16, dur = 2, gate = 1, delTrig = 0, multWhite = 1.5, freq = 440, rq = 0.0001, amp = 1.2, mix = 0.6, room = 0.5, damp = 0.5, delT = 0.05, ampDel = 0.75, ampRev = 0.75|
	var env, vib, in, comp;
	env = EnvGen.ar(Env([0,1,0.9,0], [dur*0.1, dur*0.6, dur*0.29], [3, 0, -6]), TDelay.kr(gate, delTrig), doneAction: 2);
	vib = SinOsc.kr(vibRate).range(amp*0.9, amp*1.1);
	//in = LPF.ar(BPF.ar(WhiteNoise.ar(multWhite), freq, rq, amp*vib), 5000)*env;
	in = LPF.ar(BBandPass.ar(WhiteNoise.ar(multWhite), freq, rq, amp*vib), 8000)*env;
	comp = Compander.ar(in, in, 0.2, 0.7, 1.4);
	OffsetOut.ar(busS, FreeVerb.ar(comp, mix, room, damp));
	OffsetOut.ar(busD, FreeVerb.ar(DelayC.ar(comp, 0.1, delT, ampDel), mix, room, damp, ampRev));
}).add;
)

a = Synth(\testFluteMembRout);

~amp = [-6.dbamp, -8.dbamp, -12.dbamp, -15.dbamp, -17.dbamp, -19.dbamp, -21.dbamp, -23.dbamp, -25.dbamp, -29.dbamp, -33.dbamp, -37.dbamp]*4;

(
~routFlute1 = Routine({
	var delta, dur, freq, vibRate, bus1, bus2, bus3, bus4, bus5, bus6, delTrig, partEnvDur, bwConst;
	vibRate = (8..12);
	bus1 = (0..11);
	bus2 = (12..23);
	bus3 = (0..11);
	bus4 = (12..23);
	bus5 = (0..11);
	bus6 = (12..23);
	delTrig = (10..20)*0.01;
	partEnvDur = 0.8;
	bwConst = 0.044;
	loop{
		delta = rrand(5, 8);
		freq = rrand(55, 220);
		dur = rrand(5, 8);
		Synth(\fluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur, \freq, freq,     \vibRate, vibRate.choose, \amp, ~amp.at(0), \rq, bwConst/freq]);
		Synth(\fluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*partEnvDur, \freq, freq * 2, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(1), \rq, bwConst/freq*2]);
		Synth(\fluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*partEnvDur, \freq, freq * 3, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(2), \rq, bwConst/freq*3]);
		Synth(\fluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*partEnvDur, \freq, freq * 4, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(3), \rq, bwConst/freq*4]);
		Synth(\fluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*partEnvDur, \freq, freq * 5, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(4), \rq, bwConst/freq*5]);
		Synth(\fluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*partEnvDur, \freq, freq * 6, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(5), \rq, bwConst/freq*6]);
		Synth(\fluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*partEnvDur, \freq, freq * 7, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(6), \rq, bwConst/freq*7]);
		Synth(\fluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*partEnvDur, \freq, freq * 8, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(7), \rq, bwConst/freq*8]);
		Synth(\fluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*partEnvDur, \freq, freq * 9, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(8), \rq, bwConst/freq*9]);
		Synth(\fluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*partEnvDur, \freq, freq * 10, \vibRate, vibRate.choose, \delTrig,delTrig.choose, \amp, ~amp.at(9), \rq, bwConst/freq*10]);
		Synth(\fluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*partEnvDur, \freq, freq * 11, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(10), \rq, bwConst/freq*11]);
		Synth(\fluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*partEnvDur, \freq, freq * 12, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(11), \rq, bwConst/freq*12]);
		delta.yield;
		freq = rrand(110, 330);
		dur = rrand(5, 8);
		Synth(\fluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur, \freq, freq,     \vibRate, vibRate.choose, \amp, ~amp.at(0), \rq, bwConst/freq]);
		Synth(\fluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur*partEnvDur, \freq, freq * 2, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(1), \rq, bwConst/freq*2]);
		Synth(\fluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur*partEnvDur, \freq, freq * 3, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(2), \rq, bwConst/freq*3]);
		Synth(\fluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur*partEnvDur, \freq, freq * 4, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(3), \rq, bwConst/freq*4]);
		Synth(\fluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur*partEnvDur, \freq, freq * 5, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(4), \rq, bwConst/freq*5]);
		Synth(\fluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur*partEnvDur, \freq, freq * 6, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(5), \rq, bwConst/freq*6]);
		Synth(\fluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur*partEnvDur, \freq, freq * 7, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(6), \rq, bwConst/freq*7]);
		Synth(\fluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur*partEnvDur, \freq, freq * 8, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(7), \rq, bwConst/freq*8]);
		Synth(\fluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur*partEnvDur, \freq, freq * 9, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(8), \rq, bwConst/freq*9]);
		Synth(\fluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur*partEnvDur, \freq, freq * 10, \vibRate, vibRate.choose, \delTrig,delTrig.choose, \amp, ~amp.at(9), \rq, bwConst/freq*10]);
		Synth(\fluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur*partEnvDur, \freq, freq * 11, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(10), \rq, bwConst/freq*11]);
		Synth(\fluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur*partEnvDur, \freq, freq * 12, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(11), \rq, bwConst/freq*12]);
		delta.yield;
		freq = rrand(55, 550);
		dur = rrand(5, 8);
		Synth(\fluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur, \freq, freq,     \vibRate, vibRate.choose, \amp, ~amp.at(0), \rq, bwConst/freq]);
		Synth(\fluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur*partEnvDur, \freq, freq * 2, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(1), \rq, bwConst/freq*2]);
		Synth(\fluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur*partEnvDur, \freq, freq * 3, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(2), \rq, bwConst/freq*3]);
		Synth(\fluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur*partEnvDur, \freq, freq * 4, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(3), \rq, bwConst/freq*4]);
		Synth(\fluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur*partEnvDur, \freq, freq * 5, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(4), \rq, bwConst/freq*5]);
		Synth(\fluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur*partEnvDur, \freq, freq * 6, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(5), \rq, bwConst/freq*6]);
		Synth(\fluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur*partEnvDur, \freq, freq * 7, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(6), \rq, bwConst/freq*7]);
		Synth(\fluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur*partEnvDur, \freq, freq * 8, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(7), \rq, bwConst/freq*8]);
		Synth(\fluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur*partEnvDur, \freq, freq * 9, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(8), \rq, bwConst/freq*9]);
		Synth(\fluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur*partEnvDur, \freq, freq * 10, \vibRate, vibRate.choose, \delTrig,delTrig.choose, \amp, ~amp.at(9), \rq, bwConst/freq*10]);
		Synth(\fluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur*partEnvDur, \freq, freq * 11, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(10), \rq, bwConst/freq*11]);
		Synth(\fluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur*partEnvDur, \freq, freq * 12, \vibRate, vibRate.choose, \delTrig, delTrig.choose, \amp, ~amp.at(11), \rq, bwConst/freq*12]);
		delta.yield;
	};
})
)

~routFlute1.play;


s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/flute/routFlute1_Take2.aif")
s.record;
s.stopRecording;

