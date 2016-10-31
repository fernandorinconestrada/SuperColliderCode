(
b = Buffer.read(s, "/Users/fernandorincon/Music/SuperCollider Recordings/FMGrain_take1_monoR.wav");

SynthDef(\grfm_pitchshift, { |sndbuf, rate = 1, pos = 0, envbuf = -1, frq_dns = 20 , frq_dr = 20, frq_pan = 0.3|
	var dens, dur, pan;
	dens = LFNoise0.kr(frq_dns);
	dur = LFNoise0.kr(frq_dr).range(0.03, 0.17);
	pan = SinOsc.kr(frq_pan);
	Out.ar(0, GrainBuf.ar(2, Dust.kr(dens), dur, sndbuf, rate, pos, 2, pan, envbuf) )
}).load(s);
)

a = Synth(\grfm_pitchshift, [\sndbuf, b]);
a.set(\frq_dns, 200, \frq_dr,50);

(
x = SynthDef(\help_Buffer, { arg out = 0, bufnum;
    Out.ar( out,
        PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum) * 0.7)
    )
}).play(s,[\bufnum, b]);
)
x.free; b.free;

(
c = Buffer.read(s, "/Users/fernandorincon/Music/SuperCollider Recordings/Buffer_mono_FMGrain.wav");

SynthDef(\pitchplay, { |out = 0, bufnum, trig, startPos, start, end|
	var rate, out_filt;
	rate = XLine.kr(start, end, 42);
	out_filt = PlayBuf.ar(1, bufnum, rate, trig, startPos);
	Out.ar(out, LPF.ar(out_filt, 18000));
}).load(s);
)
(
h = Synth(\pitchplay, [\out, 0, \bufnum, c, \trig, 1, \start, 0.5, \end, 1.25, \startPos, 0]);
i = Synth(\pitchplay, [\out, 1, \bufnum, c, \trig, 1, \start, 0.5, \end, 1.25, \startPos, 19845]);
j = Synth(\pitchplay, [\out, 2, \bufnum, c, \trig, 1, \start, 0.5, \end, 1.25, \startPos, 39690]);
k = Synth(\pitchplay, [\out, 3, \bufnum, c, \trig, 1, \start, 0.5, \end, 1.25, \startPos, 59535]);
l = Synth(\pitchplay, [\out, 4, \bufnum, c, \trig, 1, \start, 0.5, \end, 1.25, \startPos, 79380]);
)
s = Server.local;
s.recChannels = 5;
s.prepareForRecord;
s.record;
s.stopRecording;

	