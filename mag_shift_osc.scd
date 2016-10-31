(
//~b1 = Buffer.alloc(s, 2048, 2);
SynthDef(\filtro_magshift, { arg stretch = 1 , shift = 0, amp = 0.0;
	var in, chain, zout;
	in = SoundIn.ar(0);
	//in = WhiteNoise.ar(0.5);
	chain = FFT(LocalBuf(512, 1), in);
	chain = PV_MagShift(chain, stretch, shift);
	Out.ar(0,
		IFFT(chain) * amp);
}).send(s);
)
d = Synth(\filtro_magshift);
e = Synth(\filtro_magshift);
(
OSCdef(\stretch, {|msg, time, addr, recvPort| d.set(\stretch,  (1 + (msg[1] * 11)).postln)},"/stretch_shift_a/1", nil, 57120);
OSCdef(\shift, {|msg, time, addr, recvPort| d.set(\shift, (msg[2] * 20).postln)},"/stretch_shift_a/1", nil, 57120);
OSCdef(\stretch_a, {|msg, time, addr, recvPort| e.set(\stretch, (1 + (msg[1] * 12)).postln)},"/stretch_shift_b/1", nil, 57120);
OSCdef(\shift_b, {|msg, time, addr, recvPort| e.set(\shift, (msg[2] * 18).postln)},"/stretch_shift_b/1", nil, 57120);
OSCdef(\amp, {|msg, time, addr, recvPort| d.set(\amp, (msg[1]).postln)},"/amp", nil, 57120);
OSCdef(\amp_b, {|msg, time, addr, recvPort| e.set(\amp, (msg[1]).postln)},"/amp_b", nil, 57120);
)
