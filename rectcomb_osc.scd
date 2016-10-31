(
SynthDef(\filtro_rectcomb, { arg numTeeth = 1, freq = 5, iphase = 1, freq_width = 5, iphase_width = 1, amp = 0.0;
	var in, chain, zout;
	in = SoundIn.ar(0);
	//in = WhiteNoise.ar(0.9);
	chain = FFT(LocalBuf(512, 1), in);
	chain = PV_RectComb(chain, numTeeth, LFTri.kr(freq, iphase), LFTri.kr(freq_width, iphase_width));
	Out.ar(0,
		IFFT(chain).dup) * amp;
}).send(s);
)
c = Synth(\filtro_rectcomb);
(
OSCdef(\freq, {|msg, time, addr, recvPort| c.set(\freq,  (msg[1] * 20).postln)},"/freq_iphase/1", nil, 57120);
OSCdef(\iphase, {|msg, time, addr, recvPort| c.set(\iphase, (msg[2] * 4).postln)},"/freq_iphase/1", nil, 57120);
OSCdef(\freq_width, {|msg, time, addr, recvPort| c.set(\freq_width, (msg[1] * 100).postln)},"/freq_phase_width/1", nil, 57120);
OSCdef(\iphase_width, {|msg, time, addr, recvPort| c.set(\iphase_width, (msg[2] * 4).postln)},"/freq_phase_width/1", nil, 57120);
OSCdef(\numTeeth, {|msg, time, addr, recvPort| c.set(\numTeeth, (msg[1] * 10).postln)},"/teeth_amp/1", nil, 57120);
OSCdef(\amp, {|msg, time, addr, recvPort| c.set(\amp, (msg[2]).postln)},"/teeth_amp/1", nil, 57120);
)