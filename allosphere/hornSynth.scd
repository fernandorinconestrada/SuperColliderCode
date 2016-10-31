(
SynthDef(\hornSynth, { |busS = 0, busD = 1, rateTrig = 1, dur = 1, multWhite = 1.5, freq = 440, amp = 2, bw = 0.0001, form1 = 175, bwForm1 = 250, sclF1 = 0.2, form2 = 900, bwForm2 = 600, sclF2 = 0.08, form3 = 2300, bwForm3 = 1400, sclF3 = 0.04, delT = 0.05, mixRev = 0.5, room = 0.5, damp = 0.5|
	var trig, env, envDel, envInt, envDelInt, mix, del, mixInt, delInt;
	trig = Impulse.ar(rateTrig, 0, 0.2);
	env = EnvGen.ar(Env([0,0.9,0.9,0], [dur*0.01, dur*0.99, dur*0.01], [-3,0,3]), trig);
	envDel = EnvGen.ar(Env([0,0.9,0.9,0], [dur*0.01, dur*0.99, dur*0.01], [-3,0,3]), TDelay.ar(trig, delT));
	envInt = EnvGen.ar(Env([0,0.9,0.9,0], [dur*0.01, dur*0.99, dur*0.01], [-3,0,3]), TDelay.ar(trig, dur/2));
	envDelInt = EnvGen.ar(Env([0,0.9,0.9,0], [dur*0.01, dur*0.99, dur*0.01], [-3,0,3]), TDelay.ar(trig, dur/2+delT));
	mix = LPF.ar(Mix.new(BBandPass.ar(WhiteNoise.ar(multWhite), freq, bw, amp), Formant.ar(freq, form1, bwForm1, amp*sclF1), Formant.ar(freq, form2, bwForm2, amp*sclF2), Formant.ar(freq, form3, bwForm3, amp*sclF3)), 8000)*env;
	del = DelayC.ar(mix, 0.1, delT)*envDel;
	mixInt = LPF.ar(Mix.new(BBandPass.ar(WhiteNoise.ar(multWhite), freq, bw, amp), Formant.ar(freq, form1, bwForm1, amp*sclF1), Formant.ar(freq, form2, bwForm2, amp*sclF2), Formant.ar(freq, form3, bwForm3, amp*sclF3)), 8000)*envInt;
	delInt = DelayC.ar(mix, 0.1, delT)*envDelInt;
	OffsetOut.ar(busS, FreeVerb.ar(mix, mixRev, room, damp));
	OffsetOut.ar(busD, FreeVerb.ar(del, mixRev, room, damp));
	OffsetOut.ar(busD, FreeVerb.ar(mixInt, mixRev, room, damp));
	OffsetOut.ar(busD, FreeVerb.ar(delInt, mixRev, room, damp));
}).send(s);
)
(
~fund = 65;
~busS = 0;
~busD = 1;
~amp = [ -8.5775862068966, -3.6637931034483, 0, -9.1910112359551, -10, -10.539325842697, -18.23275862069, -12.629310344828, -19.438202247191, -20.606741573034, -20.991379310345, -21.465201465201, -26.300366300366, -27.765567765568, -28.278388278388, -28.644688644689, -28.577586206897, -27.887931034483, -28.318965517241, -29.612068965517 ]+18;
a = Synth(\hornSynth, [\freq, ~fund*1, \busS, ~busS, \busD, ~busD, \amp, ~amp.dbamp.at(0)]);
b = Synth(\hornSynth, [\freq, ~fund*2, \busS, ~busS+1, \busD, ~busD+1, \amp, ~amp.dbamp.at(1)]);
c = Synth(\hornSynth, [\freq, ~fund*3, \busS, ~busS+2, \busD, ~busD+2, \amp, ~amp.dbamp.at(2)]);
d = Synth(\hornSynth, [\freq, ~fund*4, \busS, ~busS+3, \busD, ~busD+3, \amp, ~amp.dbamp.at(3)]);
e = Synth(\hornSynth, [\freq, ~fund*5, \busS, ~busS+4, \busD, ~busD+4, \amp, ~amp.dbamp.at(4)]);
f = Synth(\hornSynth, [\freq, ~fund*6, \busS, ~busS+5, \busD, ~busD+5, \amp, ~amp.dbamp.at(5)]);
g = Synth(\hornSynth, [\freq, ~fund*7, \busS, ~busS+6, \busD, ~busD+6, \amp, ~amp.dbamp.at(6)]);
h = Synth(\hornSynth, [\freq, ~fund*8, \busS, ~busS+7, \busD, ~busD+7, \amp, ~amp.dbamp.at(7)]);
i = Synth(\hornSynth, [\freq, ~fund*9, \busS, ~busS+8, \busD, ~busD+8, \amp, ~amp.dbamp.at(8)]);
j = Synth(\hornSynth, [\freq, ~fund*10, \busS, ~busS+9, \busD, ~busD+9, \amp, ~amp.dbamp.at(9)]);
k = Synth(\hornSynth, [\freq, ~fund*11, \busS, ~busS+10, \busD, ~busD+10, \amp, ~amp.dbamp.at(10)]);
l = Synth(\hornSynth, [\freq, ~fund*12, \busS, ~busS+11, \busD, ~busD+11, \amp, ~amp.dbamp.at(11)]);
m = Synth(\hornSynth, [\freq, ~fund*13, \busS, ~busS+12, \busD, ~busD+12, \amp, ~amp.dbamp.at(12)]);
n = Synth(\hornSynth, [\freq, ~fund*14, \busS, ~busS+13, \busD, ~busD+13, \amp, ~amp.dbamp.at(13)]);
p = Synth(\hornSynth, [\freq, ~fund*15, \busS, ~busS+14, \busD, ~busD+14, \amp, ~amp.dbamp.at(14)]);
q = Synth(\hornSynth, [\freq, ~fund*16, \busS, ~busS+15, \busD, ~busD+15, \amp, ~amp.dbamp.at(15)]);
r = Synth(\hornSynth, [\freq, ~fund*17, \busS, ~busS+16, \busD, ~busD+16, \amp, ~amp.dbamp.at(16)]);
t = Synth(\hornSynth, [\freq, ~fund*18, \busS, ~busS+17, \busD, ~busD+17, \amp, ~amp.dbamp.at(17)]);
u = Synth(\hornSynth, [\freq, ~fund*19, \busS, ~busS+18, \busD, ~busD+18, \amp, ~amp.dbamp.at(18)]);
v = Synth(\hornSynth, [\freq, ~fund*20, \busS, ~busS+19, \busD, ~busD+19, \amp, ~amp.dbamp.at(19)]);
)

Env([0.01,0.95,0.01], [0.495, 0.495], [-6,6]).plot;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/horn/interpSynthTanke1.aiff");
s.record;
s.stopRecording;