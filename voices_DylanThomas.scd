(
SynthDef(\voice, { |bus = 0, rate, ampRate, freq|
	var amp;
	amp = FSinOsc.kr(rate, 0, ampRate);
	Out.ar(bus, FSinOsc.ar(freq, 0, amp))
}).add;
)
~valotser = (110 * (1..32));
~valrt = (4..36);
~valampRt = ((0..32)/32).normalize(0.01, 0.2);
(
~a1  = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a2  = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a3  = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a4  = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a5  = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a6  = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a7  = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a8  = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a9  = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a10 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a11 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a12 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a13 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a14 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a15 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a16 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a17 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a18 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a19 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a20 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a21 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a22 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a23 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a24 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a25 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a26 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a27 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a28 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a29 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a30 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a31 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
~a32 = Synth(\voice, [\freq, ~valotser.choose.postln, \rate, ~valrt.choose.postln , \ampRate, ~valampRt.choose.postln]);
)
~a1.free;  ~a2.free;  ~a3.free;  ~a4.free;
~a5.free;  ~a6.free;  ~a7.free;  ~a8.free;
~a9.free;  ~a10.free; ~a11.free; ~a12.free;
~a13.free; ~a14.free; ~a15.free; ~a16.free;
~a17.free; ~a18.free; ~a19.free; ~a20.free;
~a21.free; ~a22.free; ~a23.free; ~a24.free;
~a25.free; ~a26.free; ~a27.free; ~a28.free;
~a29.free; ~a30.free; ~a31.free; ~a32.free;

