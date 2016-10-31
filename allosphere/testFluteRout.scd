(
SynthDef(\testFluteRout, { |busS = 0, busD = 1, vibRate = 16, dur = 2, gate = 1, delTrig = 0, multWhite = 1.5, freq = 440, rq = 0.0001, amp = 1.2|
	var env, vib, in;
	env = EnvGen.ar(Env([0,1,0.9,0], [dur*0.1, dur*0.6, dur*0.29], [3, 0, -6]), TDelay.kr(gate, delTrig), doneAction: 2);
	vib = SinOsc.kr(vibRate).range(amp*0.9, amp*1.1);
	//in = LPF.ar(BPF.ar(WhiteNoise.ar(multWhite), freq, rq, amp*vib), 5000)*env;
	in = LPF.ar(BBandPass.ar(WhiteNoise.ar(multWhite), freq, rq, amp*vib), 7000)*env;
	OffsetOut.ar(busS, FreeVerb.ar(in, 0.5, 0.5, 0.5));
	OffsetOut.ar(busD, FreeVerb.ar(DelayC.ar(in, 0.1, 0.04, 0.75), 0.5, 0.5, 0.5, 0.75));
}).add;
)

//Env([0,1,0.9,0], [0.03, 0.7, 0.24], [3, 0, -6]).plot;
a = Synth(\testFluteRout);

(
r = Routine({
	var delta, dur, freq, vibRate, bus1, bus2, bus3, bus4, bus5, bus6;
	dur = (5..8);
	freq = (440..550);
	vibRate = (12..16);
	bus1 = (0..7);
	bus2 = (0..7);
	bus3 = (8..15);
	bus4 = (8..15);
	bus5 = (16..23);
	bus6 = (16..23);
	loop{
		delta = rrand(5, 8);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur.choose, \freq, freq.choose,     \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur.choose, \freq, freq.choose * 3, \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur.choose, \freq, freq.choose * 5, \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur.choose, \freq, freq.choose * 7, \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur.choose, \freq, freq.choose * 9, \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur.choose, \freq, freq.choose * 11, \vibRate, vibRate.choose]);
		delta.yield;
		Synth(\testFluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur.choose, \freq, freq.choose, \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur.choose, \freq, freq.choose * 3, \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur.choose, \freq, freq.choose * 5, \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur.choose, \freq, freq.choose * 7, \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur.choose, \freq, freq.choose * 9, \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus3.choose, \busD, bus4.choose, \dur, dur.choose, \freq, freq.choose * 11, \vibRate, vibRate.choose]);
		delta.yield;
		Synth(\testFluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur.choose, \freq, freq.choose, \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur.choose, \freq, freq.choose * 3, \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur.choose, \freq, freq.choose * 5, \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur.choose, \freq, freq.choose * 7, \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur.choose, \freq, freq.choose * 9, \vibRate, vibRate.choose]);
		Synth(\testFluteRout, [\busS, bus5.choose, \busD, bus6.choose, \dur, dur.choose, \freq, freq.choose * 11, \vibRate, vibRate.choose]);
		delta.yield;
	};
})
)

r.play;

~amp = [-6.dbamp, -8.dbamp, -12.dbamp, -15.dbamp, -17.dbamp, -19.dbamp, -21.dbamp, -23.dbamp, -25.dbamp, -29.dbamp, -33.dbamp, -37.dbamp]*3;

(
~rout2 = Routine({
	var delta, dur, freq, vibRate, bus1, bus2, bus3, bus4, bus5, bus6;
	vibRate = (4..8);
	/*bus1 = (0..7);
	bus2 = (0..7);
	bus3 = (8..15);
	bus4 = (8..15);
	bus5 = (16..23);
	bus6 = (16..23);*/
	bus1 = [0,1];
	bus2 = [0,1];
	bus3 = [0,1];
	bus4 = [0,1];
	bus5 = [0,1];
	bus6 = [0,1];
	loop{
		delta = rrand(5, 8);
		freq = rrand(440, 550);
		dur = rrand(5, 8);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur, \freq, freq,     \vibRate, vibRate.choose, \amp, ~amp.at(0)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.89, \freq, freq * 2, \vibRate, vibRate.choose, \delTrig, 0.1, \amp, ~amp.at(1)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.87, \freq, freq * 3, \vibRate, vibRate.choose, \delTrig, 0.12, \amp, ~amp.at(2)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.84, \freq, freq * 4, \vibRate, vibRate.choose, \delTrig, 0.15, \amp, ~amp.at(3)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.88, \freq, freq * 5, \vibRate, vibRate.choose, \delTrig, 0.11, \amp, ~amp.at(4)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 6, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(5)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.89, \freq, freq * 7, \vibRate, vibRate.choose, \delTrig, 0.1, \amp, ~amp.at(6)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.87, \freq, freq * 8, \vibRate, vibRate.choose, \delTrig, 0.12, \amp, ~amp.at(7)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.84, \freq, freq * 9, \vibRate, vibRate.choose, \delTrig, 0.15, \amp, ~amp.at(8)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.88, \freq, freq * 10, \vibRate, vibRate.choose, \delTrig, 0.11, \amp, ~amp.at(9)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 11, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(10)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 12, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(11)]);
		delta.yield;
		freq = rrand(220, 330);
		dur = rrand(5, 8);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur, \freq, freq,     \vibRate, vibRate.choose, \amp, ~amp.at(0)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.89, \freq, freq * 2, \vibRate, vibRate.choose, \delTrig, 0.1, \amp, ~amp.at(1)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.87, \freq, freq * 3, \vibRate, vibRate.choose, \delTrig, 0.12, \amp, ~amp.at(2)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.84, \freq, freq * 4, \vibRate, vibRate.choose, \delTrig, 0.15, \amp, ~amp.at(3)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.88, \freq, freq * 5, \vibRate, vibRate.choose, \delTrig, 0.11, \amp, ~amp.at(4)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 6, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(5)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.89, \freq, freq * 7, \vibRate, vibRate.choose, \delTrig, 0.1, \amp, ~amp.at(6)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.87, \freq, freq * 8, \vibRate, vibRate.choose, \delTrig, 0.12, \amp, ~amp.at(7)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.84, \freq, freq * 9, \vibRate, vibRate.choose, \delTrig, 0.15, \amp, ~amp.at(8)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.88, \freq, freq * 10, \vibRate, vibRate.choose, \delTrig, 0.11, \amp, ~amp.at(9)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 11, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(10)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 12, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(11)]);
		delta.yield;
		freq = rrand(220, 550);
		dur = rrand(5, 8);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur, \freq, freq,     \vibRate, vibRate.choose, \amp, ~amp.at(0)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.89, \freq, freq * 2, \vibRate, vibRate.choose, \delTrig, 0.1, \amp, ~amp.at(1)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.87, \freq, freq * 3, \vibRate, vibRate.choose, \delTrig, 0.12, \amp, ~amp.at(2)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.84, \freq, freq * 4, \vibRate, vibRate.choose, \delTrig, 0.15, \amp, ~amp.at(3)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.88, \freq, freq * 5, \vibRate, vibRate.choose, \delTrig, 0.11, \amp, ~amp.at(4)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 6, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(5)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.89, \freq, freq * 7, \vibRate, vibRate.choose, \delTrig, 0.1, \amp, ~amp.at(6)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.87, \freq, freq * 8, \vibRate, vibRate.choose, \delTrig, 0.12, \amp, ~amp.at(7)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.84, \freq, freq * 9, \vibRate, vibRate.choose, \delTrig, 0.15, \amp, ~amp.at(8)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.88, \freq, freq * 10, \vibRate, vibRate.choose, \delTrig, 0.11, \amp, ~amp.at(9)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 11, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(10)]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 12, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(11)]);
		delta.yield;
	};
})
)

~rout2.play;

(
~rout3 = Routine({
	var delta, dur, freq, vibRate, bus1, bus2, bus3, bus4, bus5, bus6;
	vibRate = (8..12);
	/*bus1 = (0..7);
	bus2 = (0..7);
	bus3 = (8..15);
	bus4 = (8..15);
	bus5 = (16..23);
	bus6 = (16..23);*/
	bus1 = [0,1];
	bus2 = [0,1];
	bus3 = [0,1];
	bus4 = [0,1];
	bus5 = [0,1];
	bus6 = [0,1];
	loop{
		delta = rrand(5, 8);
		freq = rrand(440, 550);
		dur = rrand(5, 8);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur, \freq, freq,     \vibRate, vibRate.choose, \amp, ~amp.at(0), \rq, 0.066/freq]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.89, \freq, freq * 2, \vibRate, vibRate.choose, \delTrig, 0.1, \amp, ~amp.at(1), \rq, 0.066/freq*2]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.87, \freq, freq * 3, \vibRate, vibRate.choose, \delTrig, 0.12, \amp, ~amp.at(2), \rq, 0.066/freq*3]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.84, \freq, freq * 4, \vibRate, vibRate.choose, \delTrig, 0.15, \amp, ~amp.at(3), \rq, 0.066/freq*4]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.88, \freq, freq * 5, \vibRate, vibRate.choose, \delTrig, 0.11, \amp, ~amp.at(4), \rq, 0.066/freq*5]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 6, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(5), \rq, 0.066/freq*6]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.89, \freq, freq * 7, \vibRate, vibRate.choose, \delTrig, 0.1, \amp, ~amp.at(6), \rq, 0.066/freq*7]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.87, \freq, freq * 8, \vibRate, vibRate.choose, \delTrig, 0.12, \amp, ~amp.at(7), \rq, 0.066/freq*8]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.84, \freq, freq * 9, \vibRate, vibRate.choose, \delTrig, 0.15, \amp, ~amp.at(8), \rq, 0.066/freq*9]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.88, \freq, freq * 10, \vibRate, vibRate.choose, \delTrig, 0.11, \amp, ~amp.at(9), \rq, 0.066/freq*10]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 11, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(10), \rq, 0.066/freq*11]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 12, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(11), \rq, 0.066/freq*12]);
		delta.yield;
		freq = rrand(220, 330);
		dur = rrand(5, 8);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur, \freq, freq,     \vibRate, vibRate.choose, \amp, ~amp.at(0), \rq, 0.066/freq]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.89, \freq, freq * 2, \vibRate, vibRate.choose, \delTrig, 0.1, \amp, ~amp.at(1), \rq, 0.066/freq*2]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.87, \freq, freq * 3, \vibRate, vibRate.choose, \delTrig, 0.12, \amp, ~amp.at(2), \rq, 0.066/freq*3]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.84, \freq, freq * 4, \vibRate, vibRate.choose, \delTrig, 0.15, \amp, ~amp.at(3), \rq, 0.066/freq*4]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.88, \freq, freq * 5, \vibRate, vibRate.choose, \delTrig, 0.11, \amp, ~amp.at(4), \rq, 0.066/freq*5]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 6, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(5), \rq, 0.066/freq*6]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.89, \freq, freq * 7, \vibRate, vibRate.choose, \delTrig, 0.1, \amp, ~amp.at(6), \rq, 0.066/freq*7]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.87, \freq, freq * 8, \vibRate, vibRate.choose, \delTrig, 0.12, \amp, ~amp.at(7), \rq, 0.066/freq*8]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.84, \freq, freq * 9, \vibRate, vibRate.choose, \delTrig, 0.15, \amp, ~amp.at(8), \rq, 0.066/freq*9]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.88, \freq, freq * 10, \vibRate, vibRate.choose, \delTrig, 0.11, \amp, ~amp.at(9), \rq, 0.066/freq*10]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 11, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(10), \rq, 0.066/freq*11]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 12, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(11), \rq, 0.066/freq*12]);
		delta.yield;
		freq = rrand(220, 550);
		dur = rrand(5, 8);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur, \freq, freq,     \vibRate, vibRate.choose, \amp, ~amp.at(0), \rq, 0.066/freq]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.89, \freq, freq * 2, \vibRate, vibRate.choose, \delTrig, 0.1, \amp, ~amp.at(1), \rq, 0.066/freq*2]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.87, \freq, freq * 3, \vibRate, vibRate.choose, \delTrig, 0.12, \amp, ~amp.at(2), \rq, 0.066/freq*3]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.84, \freq, freq * 4, \vibRate, vibRate.choose, \delTrig, 0.15, \amp, ~amp.at(3), \rq, 0.066/freq*4]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.88, \freq, freq * 5, \vibRate, vibRate.choose, \delTrig, 0.11, \amp, ~amp.at(4), \rq, 0.066/freq*5]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 6, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(5), \rq, 0.066/freq*6]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.89, \freq, freq * 7, \vibRate, vibRate.choose, \delTrig, 0.1, \amp, ~amp.at(6), \rq, 0.066/freq*7]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.87, \freq, freq * 8, \vibRate, vibRate.choose, \delTrig, 0.12, \amp, ~amp.at(7), \rq, 0.066/freq*8]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.84, \freq, freq * 9, \vibRate, vibRate.choose, \delTrig, 0.15, \amp, ~amp.at(8), \rq, 0.066/freq*9]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.88, \freq, freq * 10, \vibRate, vibRate.choose, \delTrig, 0.11, \amp, ~amp.at(9), \rq, 0.066/freq*10]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 11, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(10), \rq, 0.066/freq*11]);
		Synth(\testFluteRout, [\busS, bus1.choose, \busD, bus2.choose, \dur, dur*0.82, \freq, freq * 12, \vibRate, vibRate.choose, \delTrig, 0.17, \amp, ~amp.at(11), \rq, 0.066/freq*12]);
		delta.yield;
	};
})
)

~rout3.play;

550*12

{ BBandPass.ar(WhiteNoise.ar(1), 880, 0.000075, 2)}.play;

660*0.0001;
880*0.0001;
440*0.0001;
220*0.0001;
0.066/880;
880*0.000075;