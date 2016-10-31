o  = Server.local.options;
o.numOutputBusChannels = 2;

~sndbufBuf = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/uniANdes/multiExplode/editSequia/Bounced Files/SequiaChunkUniAndes.wav");
~sndbufBuf = Buffer.read(s,"/Users/fernandorincon/Documents/Adobe/Audition/7.0/uniANdes/multiExplode/editPeceras/editPeceras/Bounced Files/PecerasChunkUniandes.wav");
(
SynthDef(\bandPassBuffer, { |bufnum, rateScale = 0.001, rateFreq = 40, bw = 0.01, ampFilt = 2, loFreq = 600, hiFreq = 610|
	var freq, sig, scale;
	scale = SinOsc.kr(rateScale).range(0.9, 1.1);
	freq = LFNoise0.kr(rateFreq).range(loFreq*scale.poll, hiFreq*scale.poll);
	//freq = SinOsc.kr(rateFreq).range(300, 600);
	sig = PlayBuf.ar(2, bufnum, doneAction:2);
	sig = BBandPass.ar(sig, freq, bw, ampFilt);
	OffsetOut.ar(0, Compander.ar(sig, sig, 0.3, 1.0, 1.2));
}).add;
)
(
SynthDef(\bandPassBufferVer2, { |bufnum, rateScale = 0.001, rateFreq = 40, bw = 0.01, ampFilt = 2, loFreq = 600, hiFreq = 610|
	var freq, sig, scale, del;
	scale = SinOsc.kr(rateScale).range(0.9, 1.1);
	freq = LFNoise0.kr(rateFreq).range(loFreq*scale.poll, hiFreq*scale.poll);
	//freq = SinOsc.kr(rateFreq).range(300, 600);
	sig = PlayBuf.ar(2, bufnum, doneAction:2);
	sig = BBandPass.ar(sig, freq, bw, ampFilt);
	sig = Compander.ar(sig, sig, 0.3, 1.0, 1.2);
	del = DelayC.ar(sig, 0.2, 0.05, SinOsc.kr(0.3).range(0.4, 0.75));
	OffsetOut.ar(0, sig);
	OffsetOut.ar(0, del);
}).add;
)

(
SynthDef(\bandPassBufferVer3, { |bufnum, rateScale = 0.001, rateFreq = 40, bw = 0.01, ampFilt = 2, loFreq = 600, hiFreq = 610, delT = 0.05|
	var freq, sig, scale, del;
	scale = SinOsc.kr(rateScale).range(0.5, 1.5);
	freq = LFNoise0.kr(rateFreq).range(loFreq*scale.poll, hiFreq*scale.poll);
	//freq = SinOsc.kr(rateFreq).range(300, 600);
	sig = PlayBuf.ar(2, bufnum, SinOsc.kr(0.01).range(0.97, 1.05), doneAction:2);
	sig = BBandPass.ar(sig, freq, bw, ampFilt);
	sig = Compander.ar(sig, sig, 0.3, 1.0, 1.2);
	del = DelayC.ar(sig, 0.2, delT, SinOsc.kr(0.3).range(0.4, 0.75));
	OffsetOut.ar(0, sig);
	OffsetOut.ar(0, del);
}).add;
)

(
SynthDef(\bandPassBufferLine, { |bufnum, rateScale = 0.001, rateFreq = 40,  ampFilt = 2, loFreq = 400, hiFreq = 415, dur = 180, bus|
	var freq, sig, scale, bw;
	scale = SinOsc.kr(rateScale).range(0.9, 1.1);
	freq = LFNoise0.kr(rateFreq).range(loFreq*scale.poll, hiFreq*scale.poll);
	bw = XLine.kr(0.001, 0.99, dur, doneAction: 2);
	//freq = SinOsc.kr(rateFreq).range(300, 600);
	sig = PlayBuf.ar(2, bufnum, doneAction:2);
	sig = BBandPass.ar(sig, freq, bw, ampFilt);
	OffsetOut.ar(bus, sig);
}).add;
)


(
a = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.019]);
b = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.017]);
c = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.013]);
d = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.011]);
e = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.007]);
)

(
a = Synth(\bandPassBufferVer3, [\bufnum, ~sndbufBuf, \bw, 0.019, \delT, 0.04]);
b = Synth(\bandPassBufferVer3, [\bufnum, ~sndbufBuf, \bw, 0.017, \delT, 0.05]);
c = Synth(\bandPassBufferVer3, [\bufnum, ~sndbufBuf, \bw, 0.013, \delT, 0.06]);
d = Synth(\bandPassBufferVer3, [\bufnum, ~sndbufBuf, \bw, 0.011, \delT, 0.07]);
e = Synth(\bandPassBufferVer3, [\bufnum, ~sndbufBuf, \bw, 0.007, \delT, 0.08]);
)

(
a = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.019, \rateScale, 0.0013]);
b = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.017, \rateScale, 0.0019]);
c = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.013, \rateScale, 0.0023]);
d = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.011, \rateScale, 0.0011]);
e = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.007, \rateScale, 0.0029]);
)

(
a = Synth(\bandPassBufferLine, [\bufnum, ~sndbufBuf, \rateScale, 0.0013, \bus, 0]);
b = Synth(\bandPassBufferLine, [\bufnum, ~sndbufBuf, \rateScale, 0.0019, \bus, 2]);
c = Synth(\bandPassBufferLine, [\bufnum, ~sndbufBuf, \rateScale, 0.0023, \bus, 4]);
d = Synth(\bandPassBufferLine, [\bufnum, ~sndbufBuf, \rateScale, 0.0011, \bus, 6]);
e = Synth(\bandPassBufferLine, [\bufnum, ~sndbufBuf, \rateScale, 0.0017, \bus, 8]);
f = Synth(\bandPassBufferLine, [\bufnum, ~sndbufBuf, \rateScale, 0.0031, \bus, 10]);
g = Synth(\bandPassBufferLine, [\bufnum, ~sndbufBuf, \rateScale, 0.0037, \bus, 12]);
h = Synth(\bandPassBufferLine, [\bufnum, ~sndbufBuf, \rateScale, 0.0043, \bus, 14]);
)

(
a = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.019, \loFreq, 600*3, \hiFreq, 610*3]);
b = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.017, \loFreq, 600*5, \hiFreq, 610*5]);
c = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.013, \loFreq, 600*7, \hiFreq, 610*7]);
d = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.011, \loFreq, 600*11, \hiFreq, 610*11]);
e = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.007, \loFreq, 600, \hiFreq, 610]);
)

(
a = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.019, \rateScale, 0.0013, \loFreq, 600*3, \hiFreq, 610*3]);
b = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.017, \rateScale, 0.0019, \loFreq, 600*5, \hiFreq, 610*5]);
c = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.013, \rateScale, 0.0023, \loFreq, 600*7, \hiFreq, 610*7]);
d = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.011, \rateScale, 0.0011, \loFreq, 600*11, \hiFreq, 610*11]);
e = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.007, \rateScale, 0.0029, \loFreq, 600, \hiFreq, 610]);
)


(
f = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.007, \loFreq, 600*3, \hiFreq, 610*3]);
g = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.011, \loFreq, 600*3, \hiFreq, 610*3]);
h = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.013, \loFreq, 600*3, \hiFreq, 610*3]);
i = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.019, \loFreq, 600*3, \hiFreq, 610*3]);
j = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.017, \loFreq, 600*3, \hiFreq, 610*3]);
)



a.set(\bw, 0.02);
b.set(\bw, 0.02);
c.set(\bw, 0.02);
d.set(\bw, 0.02);
e.set(\bw, 0.02);


b.set(\bw, 0.001);
a.set(\rateFreq, 40);

(
~routBandPassBuffer = Routine({
	1.do{
		a = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.019, \rateScale, 0.0013, \loFreq, 600*3, \hiFreq, 610*3]);
		b = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.017, \rateScale, 0.0019, \loFreq, 600*5, \hiFreq, 610*5]);
		c = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.013, \rateScale, 0.0023, \loFreq, 600*7, \hiFreq, 610*7]);
		d = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.011, \rateScale, 0.0011, \loFreq, 600*11, \hiFreq, 610*11]);
		e = Synth(\bandPassBuffer, [\bufnum, ~sndbufBuf, \bw, 0.007, \rateScale, 0.0029, \loFreq, 600, \hiFreq, 610]);
		10.yield;
		e.set(\bw, 0.008);
		11.yield;
		e.set(\bw, 0.009);
		11.yield;
		d.set(\bw, 0.012);
		13.yield;
		d.set(\bw, 0.013);
		c.set(\bw, 0.014);
		11.yield;
		e.set(\bw, 0.010);
		b.set(\bw, 0.018);
		17.yield;
		e.set(\bw, 0.011);
		19.yield;
		d.set(\bw, 0.013);
		b.set(\bw, 0.019);
		13.yield;
		d.set(\bw, 0.014);
		c.set(\bw, 0.015);
		10.yield;
		e.set(\bw, 0.012);
		11.yield;
		e.set(\bw, 0.013);
		11.yield;
		d.set(\bw, 0.015);
		c.set(\bw, 0.016);
		13.yield;
		d.set(\bw, 0.016);
		c.set(\bw, 0.017);
		11.yield;
		e.set(\bw, 0.014);
		b.set(\bw, 0.02);
		17.yield;
		e.set(\bw, 0.015);
		19.yield;
		d.set(\bw, 0.017);
		13.yield;
		d.set(\bw, 0.018);
		c.set(\bw, 0.018);
		7.yield;
		b.set(\bw, 0.02);
		17.yield;
		e.set(\bw, 0.016);
		c.set(\bw, 0.019);
		19.yield;
		d.set(\bw, 0.019);
		c.set(\bw, 0.02);
		13.yield;
		d.set(\bw, 0.02);
		e.set(\bw, 0.017);
		7.yield;
		e.set(\bw, 0.018);
		11.yield;
		e.set(\bw, 0.019);
		7.yield;
		e.set(\bw, 0.02);

	}
})
)


s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/uniAndes/routBandPassBufferTake1.aif");
s.record;
~routBandPassBuffer.play;
s.stopRecording;
