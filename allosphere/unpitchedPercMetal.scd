{
	var in, parallel, revPar, revIn;
	in = Decay2.ar(Dust.ar(SinOsc.kr(0.1).range(0.1, 3)), 0.001, LFNoise0.kr(16).range(0.01, 0.02), BBandPass.ar(WhiteNoise.ar(20), 600.rand+600, 0.003));
4.do({parallel = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \synth1), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4])});
	revPar = LeakDC.ar(FreeVerb.ar(parallel, 0.2, 0.2));
	revIn = LeakDC.ar(FreeVerb.ar(in, 0.3, 0.3, 0.5, 0.6));
	Out.ar(4, GVerb.ar(revIn));
	Out.ar(6, GVerb.ar(revPar))
}.play;
Env([0,1,0.7,0], [0.25, 0.5, 0.25], [4, 0, -4]).plot;
{
	var in, parallel, revPar, revIn;
	in = Decay2.ar(Dust.ar(SinOsc.kr(0.15).range(0.1, 2)), 0.001, LFNoise0.kr(16).range(0.01, 0.02), BBandPass.ar(WhiteNoise.ar(20), 600.rand+200, 0.003));
4.do({parallel = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \synth2), LFNoise0.kr(8).range(0.5, 1), [0.2+0.6, 0.2+0.4])});
	revPar = LeakDC.ar(FreeVerb.ar(parallel, 0.2, 0.2));
	revIn = LeakDC.ar(FreeVerb.ar(in, 0.3, 0.3, 0.5, 0.6));
	Out.ar(0, GVerb.ar(revIn));
	Out.ar(2, GVerb.ar(revPar))
}.play;

{
	var in, parallel, revPar, revIn;
	in = Decay2.ar(Dust.ar(SinOsc.kr(0.11).range(0.1, 5)), 0.001, LFNoise0.kr(16).range(0.01, 0.02), BBandPass.ar(WhiteNoise.ar(20), 600.rand+800, 0.003));
4.do({parallel = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \synth3), LFNoise0.kr(8).range(0.5, 1), [0.2+0.6, 0.2+0.4])});
	revPar = LeakDC.ar(FreeVerb.ar(parallel, 0.2, 0.2));
	revIn = LeakDC.ar(FreeVerb.ar(in, 0.3, 0.3, 0.5, 0.6));
	Out.ar(2, GVerb.ar(revIn));
	Out.ar(6, GVerb.ar(revPar))
}.play;

{
	var in, parallel, revPar, revIn;
	in = Decay2.ar(Dust.ar(SinOsc.kr(0.17).range(0.1, 2)), 0.001, LFNoise0.kr(16).range(0.01, 0.02), BBandPass.ar(WhiteNoise.ar(20), 600.rand+1200, 0.003));
4.do({parallel = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \synth4), LFNoise0.kr(8).range(0.5, 1), [0.2+0.6, 0.2+0.4])});
	revPar = LeakDC.ar(FreeVerb.ar(parallel, 0.2, 0.2));
	revIn = LeakDC.ar(FreeVerb.ar(in, 0.3, 0.3, 0.5, 0.6));
	Out.ar(0, GVerb.ar(revIn));
	Out.ar(4, GVerb.ar(revPar))
}.play;
(
//with envelope and mix
{
	var in, parallel, revPar, revIn, parallel1, parallel2, parallel3, parallel4, env, durLine;
	durLine = 3.5*6;
	env = EnvGen.kr(Env([0,0.7,1,0], [0.25, 0.5, 0.25]*durLine, [4,0,-4]), Impulse.kr(1/durLine));
	in = Decay2.ar(Dust.ar(SinOsc.kr(0.1).range(0.1, 5)), 0.001, LFNoise0.kr(16).range(0.0012, 0.02), BBandPass.ar(WhiteNoise.ar(20), 600.rand+600, 0.003));
	parallel1 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par1), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel2 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par2), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel3 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par3), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel4 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par4), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel = Mix.new([parallel1, parallel2, parallel3, parallel4]);
	revPar = LeakDC.ar(FreeVerb.ar(parallel, 0.2, 0.2));
	revIn = LeakDC.ar(FreeVerb.ar(in, 0.3, 0.3, 0.5, 0.6));
	Out.ar(4, GVerb.ar(revIn)*env);
	Out.ar(6, GVerb.ar(revPar)*env);
}.play;


{
	var in, parallel, revPar, revIn, parallel1, parallel2, parallel3, parallel4, env, durLine;
	durLine = 3.5*4;
	env = EnvGen.kr(Env([0,1,0.7,0], [0.25, 0.5, 0.25]*durLine, [4,0,-4]), Impulse.kr(1/durLine));
	in = Decay2.ar(Dust.ar(SinOsc.kr(0.1).range(0.1, 2)), 0.001, LFNoise0.kr(16).range(0.0012, 0.02), BBandPass.ar(WhiteNoise.ar(20), 600.rand+200, 0.003));
	parallel1 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par1), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel2 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par2), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel3 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par3), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel4 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par4), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel = Mix.new([parallel1, parallel2, parallel3, parallel4]);
	revPar = LeakDC.ar(FreeVerb.ar(parallel, 0.2, 0.2));
	revIn = LeakDC.ar(FreeVerb.ar(in, 0.3, 0.3, 0.5, 0.6));
	Out.ar(0, GVerb.ar(revIn)*env);
	Out.ar(2, GVerb.ar(revPar)*env);
}.play;

{
	var in, parallel, revPar, revIn, parallel1, parallel2, parallel3, parallel4, env, durLine;
	durLine = 3.5*5;
	env = EnvGen.kr(Env([0,1,0.7,0], [0.25, 0.5, 0.25]*durLine, [4,0,-4]), Impulse.kr(1/durLine));
	in = Decay2.ar(Dust.ar(SinOsc.kr(0.1).range(0.1, 3)), 0.001, LFNoise0.kr(16).range(0.0012, 0.02), BBandPass.ar(WhiteNoise.ar(20), 600.rand+1200, 0.003));
	parallel1 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par1), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel2 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par2), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel3 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par3), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel4 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par4), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel = Mix.new([parallel1, parallel2, parallel3, parallel4]);
	revPar = LeakDC.ar(FreeVerb.ar(parallel, 0.2, 0.2));
	revIn = LeakDC.ar(FreeVerb.ar(in, 0.3, 0.3, 0.5, 0.6));
	Out.ar(0, GVerb.ar(revIn)*env);
	Out.ar(6, GVerb.ar(revPar)*env);
}.play;

{
	var in, parallel, revPar, revIn, parallel1, parallel2, parallel3, parallel4, env, durLine;
	durLine = 3.5*3;
	env = EnvGen.kr(Env([0, 0.7, 1, 0], [0.25, 0.5, 0.25]*durLine, [4,0,-4]), Impulse.kr(1/durLine));
	in = Decay2.ar(Dust.ar(SinOsc.kr(0.1).range(0.1, 2)), 0.001, LFNoise0.kr(16).range(0.0012, 0.02), BBandPass.ar(WhiteNoise.ar(20), 600.rand+1800, 0.003));
	parallel1 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par1), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel2 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par2), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel3 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par3), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel4 = AllpassC.ar(in, 0.2, [0.04.rand+0.065, 0.08.rand+0.1].poll(label: \par4), LFNoise0.kr(8).range(0.5, 1), [0.2.rand+0.6, 0.2.rand+0.4]);
	parallel = Mix.new([parallel1, parallel2, parallel3, parallel4]);
	revPar = LeakDC.ar(FreeVerb.ar(parallel, 0.2, 0.2));
	revIn = LeakDC.ar(FreeVerb.ar(in, 0.3, 0.3, 0.5, 0.6));
	Out.ar(4, GVerb.ar(revIn)*env);
	Out.ar(2, GVerb.ar(revPar)*env);
}.play;

)