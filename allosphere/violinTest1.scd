// violin

// fund = E5 = 1319
(
~fundvlnE5 = 1319;
~partsvlnE5 = (1..6) * ~fundvlnE5;
~ampsvlnE5 = ([30, 25, 15, 5, 6, 3.5]-30).dbamp;
)
[30, 25, 15, 5, 6.5, 3.5].plot;

// fund = E4 = 659
(
~fundvlnE4 = 659;
~partsvlnE4 = (1..11) * ~fundvlnE4;
~ampsvlnE4 = ([30, 25.5, 21, 23, 15, 13.5, 11, 7, 8, 5, 3]-30).dbamp;
)
[30, 25.5, 21, 23, 15, 13.5, 11, 7, 8, 5, 3].plot;

// fund = E3 = 330
(
~fundvlnE3 = 330;
//~fundvlnE3 = 330*9/4;
//~fundvlnE3 = 110;
~partsvlnE3 = (1..16) * ~fundvlnE3;
~ampsvlnE3 = ([30, 28, 23, 30, 29, 20, 18, 22, 16, 17, 10, 12, 10, 7, 8, 7]-30).dbamp;
)
[30, 28, 23, 30, 29, 20, 18, 22, 16, 17, 10, 12, 10, 7, 8, 7].plot;

//formants

{Formant.ar(330, 330*2, MouseX.kr(50, 4000).poll, 0.1)}.play;

{
	var scale;
	scale = MouseX.kr(0,1);
Mix.new([Formant.ar(~fundvlnE4, ~fundvlnE4*2, 660, 0.13*scale), Formant.ar(~fundvlnE4, ~fundvlnE4*4,1319, 0.08*scale), Formant.ar(~fundvlnE4, ~fundvlnE4*6,2200, 0.07*scale)])
}.play;

//instruments
// interesting timbre
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(WhiteNoise.ar(1), ~partsvlnE5, 0.0002, ~ampsvlnE5*30)), Formant.ar(~fundvlnE5, ~fundvlnE5*2, 1319, 0.06*scale), Formant.ar(~fundvlnE5, ~fundvlnE5*3,2200, 0.01*scale)]))
}.play;

//hi level in formants makes nicer timbre
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(WhiteNoise.ar(1), ~partsvlnE4, 0.0002, ~ampsvlnE4*30)), Formant.ar(~fundvlnE4, ~fundvlnE4*2, 660, 0.13*scale), Formant.ar(~fundvlnE4, ~fundvlnE4*4,1319, 0.08*scale), Formant.ar(~fundvlnE4, ~fundvlnE4*6,2200, 0.07*scale)]))
}.play;
// nice timbre there a bow friction flavor
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(Resonz.ar(WhiteNoise.ar(1), ~partsvlnE3*LFNoise0.kr(16).range(0.998,1.002), 0.00015, ~ampsvlnE3*30)), Formant.ar(~fundvlnE3, ~fundvlnE3*2, 50, 0.15*scale), Formant.ar(~fundvlnE3, ~fundvlnE3*4, 660, 0.13*scale), Formant.ar(~fundvlnE3, ~fundvlnE3*8,1319, 0.08*scale), Formant.ar(~fundvlnE3, ~fundvlnE3*12,2200, 0.07*scale)]))
}.play;
//bandpass
//narrower bandwidth for pure sound on high register
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(BBandPass.ar(WhiteNoise.ar(1), ~partsvlnE5*LFNoise0.kr(12).range(0.998, 1.002), 0.0001, ~ampsvlnE5*30)), Formant.ar(~fundvlnE5, ~fundvlnE5*2, 1319, 0.06*scale), Formant.ar(~fundvlnE5, ~fundvlnE5*3,2200, 0.01*scale)]))
}.play;

//rev
{
	var scale, in, delay, rev;
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(BBandPass.ar(WhiteNoise.ar(1), ~partsvlnE5*LFNoise0.kr(12).range(0.998, 1.002), 0.0001, ~ampsvlnE5*30)), Formant.ar(~fundvlnE5, ~fundvlnE5*2, 1319, 0.06*scale), Formant.ar(~fundvlnE5, ~fundvlnE5*3,2200, 0.01*scale)]);
	delay = Mix.new(DelayC.ar(in, 0.1, [0.05, 0.06, 0.08], [0.75, 0.5, 0.25]));
	rev = FreeVerb.ar(delay*0.8, 0.4, 0.3, 0.5, 0.75);
	Out.ar(0, LeakDC.ar(rev));
	Out.ar(1, LeakDC.ar(in));
}.play;

//envelope
a = {
	var scale, in, delay, rev, env, trig, dur;
	scale = MouseX.kr(0,1);
	trig = Dust.kr(0.1);
	dur = Demand.kr(trig, 0, Diwhite(6, 12, inf));
	env = EnvGen.ar(Env([0, 1.0, 0.6, 0], [dur*0.1, dur*0.5, dur*0.4], [2, 0, -4]), trig, doneAction:2);
	in = Mix.new([Mix.new(BBandPass.ar(WhiteNoise.ar(1), ~partsvlnE5*LFNoise0.kr(12).range(0.998, 1.002), 0.0001, ~ampsvlnE5*30)), Formant.ar(~fundvlnE5, ~fundvlnE5*2, 1319, 0.06*scale), Formant.ar(~fundvlnE5, ~fundvlnE5*3,2200, 0.01*scale)]);
	delay = Mix.new(DelayC.ar(in, 0.1, [0.05, 0.06, 0.08], [0.75, 0.5, 0.25]));
	rev = FreeVerb.ar(delay*0.8, 0.4, 0.3, 0.5, 0.75);
	Out.ar(0, LeakDC.ar(rev)*env);
	Out.ar(1, LeakDC.ar(in)*env);
}.play;

// fund E4
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(BBandPass.ar(WhiteNoise.ar(1), ~partsvlnE4, 0.0002, ~ampsvlnE4*30)), Formant.ar(~fundvlnE4, ~fundvlnE4*2, 660, 0.13*scale), Formant.ar(~fundvlnE4, ~fundvlnE4*4,1319, 0.08*scale), Formant.ar(~fundvlnE4, ~fundvlnE4*6,2200, 0.07*scale)]))
}.play;
//with envelope
{
	var scale, env, in, delay, rev;
	scale = MouseX.kr(0,1);
	env = EnvGen.ar(Env([0, 1, 0.75, 0], [0.1, 0.1, 3, 1]), Impulse.ar(0.2));
	in = Mix.new([Mix.new(BBandPass.ar(WhiteNoise.ar(1), ~partsvlnE4, 0.0002, ~ampsvlnE4*30)), Formant.ar(~fundvlnE4, ~fundvlnE4*2, 660, 0.13*scale), Formant.ar(~fundvlnE4, ~fundvlnE4*4,1319, 0.08*scale), Formant.ar(~fundvlnE4, ~fundvlnE4*6,2200, 0.07*scale)]);
	delay = Mix.new(DelayC.ar(in, 0.1, [0.05, 0.06, 0.07, 0.08], [0.7, 0.5, 0.3, 0.1]));
	rev = FreeVerb.ar(delay*0.8, 0.4, 0.3, 0.5, 0.75);
	Out.ar(0, LeakDC.ar(in)*env);
	Out.ar(1, LeakDC.ar(rev)*env);
}.play;
//grain pizz perc
{
	var scale, in, delay, rev, grain, trig;
	trig = LFNoise0.kr(MouseY.kr(8, 20));
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(BBandPass.ar(WhiteNoise.ar(1), ~partsvlnE4, 0.0002, ~ampsvlnE4*30)), Formant.ar(~fundvlnE4, ~fundvlnE4*2, 660, 0.13*scale), Formant.ar(~fundvlnE4, ~fundvlnE4*4,1319, 0.08*scale), Formant.ar(~fundvlnE4, ~fundvlnE4*6,2200, 0.07*scale)]);
	delay = Mix.new(DelayC.ar(in, 0.1, [0.05, 0.06, 0.07, 0.08], [0.7, 0.5, 0.3, 0.1]));
	grain = GrainIn.ar(2, trig, trig.range(0.03, 0.1), delay, trig.range(-1.0, 1.0));
	rev = FreeVerb.ar(grain, 0.4, 0.3, 0.5, 0.75);
	Out.ar(0, LeakDC.ar(grain));
	Out.ar(1, LeakDC.ar(rev));
}.play;
//pizz decay2
{
	var scale, in, delay, rev, grain, trig, filter, feedB;
	//trig = LFNoise0.ar(MouseY.kr(8, 20));
	trig = Dust.ar(2);
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(BBandPass.ar(WhiteNoise.ar(1), ~partsvlnE4, 0.0002, ~ampsvlnE4*30)), Formant.ar(~fundvlnE4, ~fundvlnE4*2, 660, 0.13*scale), Formant.ar(~fundvlnE4, ~fundvlnE4*4,1319, 0.08*scale), Formant.ar(~fundvlnE4, ~fundvlnE4*6,2200, 0.07*scale)]);
	delay = Mix.new(DelayC.ar(in, 0.1, [0.038, 0.047, 0.053, 0.067], [0.7, 0.5, 0.3, 0.1]));
	grain = Decay2.ar(trig, 0.01, trig.range(0.2, 0.5), delay);
	rev = FreeVerb.ar(grain, 0.4, 0.3, 0.5, 0.75);
	filter = AllpassC.ar(rev, 0.1, trig.range(0.06, 0.12), 1);
	feedB =  AllpassC.ar(filter, 0.1, trig.range(0.12, 0.18), 1);
	Out.ar(0, GVerb.ar(LeakDC.ar(Mix.new([grain, filter])), 100, 20, 0.4, 0.3, 20, 0.5, 0.3, 0.1));
	Out.ar(0, GVerb.ar(LeakDC.ar(Mix.new([feedB, rev])), 120, 25, 0.5, 0.3, 30, 0.4, 0.2));
}.play;
//fund E3
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, Mix.new([Mix.new(BBandPass.ar(WhiteNoise.ar(1), ~partsvlnE3*LFNoise0.kr(12).range(0.998, 1.002), 0.0001, ~ampsvlnE3*30)), Formant.ar(~fundvlnE3, ~fundvlnE3*2, 1319, 0.06*scale), Formant.ar(~fundvlnE3, ~fundvlnE3*3,2200, 0.01*scale)]))
}.play

{
	var scale, in, delay, rev, grain, trig, filter, feedB;
	//trig = LFNoise0.ar(MouseY.kr(8, 20));
	trig = Dust.ar(SinOsc.kr(0.1).range(0.1, 2));
	scale = MouseX.kr(0,1);
	in = Mix.new([Mix.new(BBandPass.ar(WhiteNoise.ar(1), ~partsvlnE3*LFNoise0.kr(16).range(0.998, 1.002), 0.0002, ~ampsvlnE3*30)), Formant.ar(~fundvlnE3, ~fundvlnE3*2, 660, 0.13*scale), Formant.ar(~fundvlnE3, ~fundvlnE3*4,1319, 0.08*scale), Formant.ar(~fundvlnE3, ~fundvlnE3*6,2200, 0.07*scale)]);
	delay = Mix.new(DelayC.ar(in, 0.1, [0.038, 0.047, 0.053, 0.067], [0.7, 0.5, 0.3, 0.1]));
	grain = Decay2.ar(trig, 0.01, trig.range(0.1, 0.2), delay);
	rev = FreeVerb.ar(grain, 0.4, 0.3, 0.5, 0.75);
	filter = AllpassC.ar(rev, 0.1, trig.range(0.06, 0.12), 1);
	feedB =  AllpassC.ar(filter, 0.1, trig.range(0.12, 0.18), 1);
	Out.ar(Stepper.ar(trig, 0, 0, 30, 1, 30), GVerb.ar(LeakDC.ar(Mix.new([grain, filter])), 50, 10, 0.4, 0.3, 20, 0.5, 0.3, 0.1));
	Out.ar(Stepper.ar(trig, 0, 0, 30, 1, 15), GVerb.ar(LeakDC.ar(Mix.new([feedB, rev])), 60, 12, 0.5, 0.3, 30, 0.4, 0.2));
}.play;





