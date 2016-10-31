//// coordinates speakers
(
~s1=[-77.66, 41]; ~s2=[-45.08,41]; ~s3=[-14.79, 41]; ~s4=[14.79, 41]; ~s5=[45.08, 41]; ~s6=[77.16, 41]; ~s7=[102.33, 41]; ~s8=[134.91,41]; ~s9=[165.2, 41]; ~s10=[-165.2,41]; ~s11=[-134.91,41]; ~s12=[-102.33, 41]; ~s13=[-77.66, 0]; ~s14=[-65.64,0]; ~s15 =[-54.08, 0]; ~s16=[-42.86, 0]; ~s17=[-31.92, 0]; ~s18=[-21.18, 0]; ~s19=[-10.55, 0]; ~s20=[-0, 0]; ~s21=[10.55, 0]; ~s22=[21.18, 0]; ~s23=[31.92, 0]; ~s24=[42.86, 0]; ~s25=[54.08, 0]; ~s26=[65.54, 0]; ~s27=[77.66, 0]; ~s28=[102.33, 0]; ~s29=[114.35, 0]; ~s30=[125.91, 0]; ~s31=[137.13, 0]; ~s32=[148.07, 0]; ~s33=[158.81, 0]; ~s34=[169.44, 0]; ~s35=[179, 0]; ~s36=[-169.44, 0]; ~s37=[-158.81, 0]; ~s38=[-148.07, 0]; ~s39=[-137.13, 0]; ~s40=[-125.91, 0]; ~s41=[-114.35, 0]; ~s42=[-102.33, 0]; ~s43=[-77.66,-32.5]; ~s44=[-45.08,-32.5]; ~s45=[-14.79, -32.5]; ~s46=[14.79, -32.5]; ~s47=[45.08, -32.5]; ~s48=[77.16, -32.5]; ~s49=[102.33, -32.5]; ~s50=[134.91,-32.5]; ~s51=[165.2, -32.5]; ~s52=[-165.2,-32.5]; ~s53=[-134.91,-32.5]; ~s54=[-102.33, -32.5];
)

////full array

~allos = VBAPSpeakerArray.new(3, [~s1, ~s2, ~s3, ~s4, ~s5, ~s6, ~s7, ~s8, ~s9, ~s10, ~s11, ~s12, ~s13, ~s14, ~s15, ~s16, ~s17, ~s18, ~s19, ~s20, ~s21, ~s22, ~s23, ~s24, ~s25, ~s26, ~s27, ~s28, ~s29, ~s30, ~s31, ~s32, ~s33, ~s34, ~s35, ~s36, ~s37, ~s38, ~s39, ~s40, ~s41, ~s42, ~s43, ~s44, ~s45, ~s46, ~s47, ~s48, ~s49, ~s50, ~s51, ~s52, ~s53, ~s54]);

/////new array with 50 speakers only (-45, 45, -135, 135) are out
(
~s1=[-77.66, 41]; ~s2=[-45.08,41]; ~s3=[-14.79, 41]; ~s4=[14.79, 41]; ~s5=[45.08, 41]; ~s6=[77.16, 41]; ~s7=[102.33, 41]; ~s8=[134.91,41]; ~s9=[165.2, 41]; ~s10=[-165.2,41]; ~s11=[-134.91,41]; ~s12=[-102.33, 41]; ~s13=[-77.66, 0]; ~s14=[-65.64,0]; ~s15 =[-54.08, 0]; ~s16=[-31.92, 0]; ~s17=[-21.18, 0]; ~s18=[-10.55, 0]; ~s19=[-0, 0]; ~s20=[10.55, 0]; ~s21=[21.18, 0]; ~s22=[31.92, 0]; ~s23=[54.08, 0]; ~s24=[65.54, 0]; ~s25=[77.66, 0]; ~s26=[102.33, 0]; ~s27=[114.35, 0]; ~s28=[125.91, 0]; ~s29=[148.07, 0]; ~s30=[158.81, 0]; ~s31=[169.44, 0]; ~s32=[179, 0]; ~s33=[-169.44, 0]; ~s34=[-158.81, 0]; ~s35=[-148.07, 0]; ~s36=[-125.91, 0]; ~s37=[-114.35, 0]; ~s38=[-102.33, 0]; ~s39=[-77.66,-32.5]; ~s40=[-45.08,-32.5]; ~s41=[-14.79, -32.5]; ~s42=[14.79, -32.5]; ~s43=[45.08, -32.5]; ~s44=[77.16, -32.5]; ~s45=[102.33, -32.5]; ~s46=[134.91,-32.5]; ~s47=[165.2, -32.5]; ~s48=[-165.2,-32.5]; ~s49=[-134.91,-32.5]; ~s50=[-102.33, -32.5];
)
(
~allos = VBAPSpeakerArray.new(3, [~s1, ~s2, ~s3, ~s4, ~s5, ~s6, ~s7, ~s8, ~s9, ~s10, ~s11, ~s12, ~s13, ~s14, ~s15, ~s16, ~s17, ~s18, ~s19, ~s20, ~s21, ~s22, ~s23, ~s24, ~s25, ~s26, ~s27, ~s28, ~s29, ~s30, ~s31, ~s32, ~s33, ~s34, ~s35, ~s36, ~s37, ~s38, ~s39, ~s40, ~s41, ~s42, ~s43, ~s44, ~s45, ~s46, ~s47, ~s48, ~s49, ~s50]);
b = Buffer.loadCollection(s, ~allos.getSetsAndMatrices);
)

//////middle ring array

(
~allosMidRing = VBAPSpeakerArray.new(2, [-77.66,-65.64,-54.08,-42.86,-31.92,-21.18,-10.55,0,10.55,21.18,31.92,42.86,54.08,65.54,77.66,102.33,114.35,125.91,137.13,148.07,158.81,169.44, 179,-169.44,-158.81,-148.07,-137.13,-125.91,-114.35,-102.33]);
b = Buffer.loadCollection(s, ~allosMidRing.getSetsAndMatrices);
)

//upper ring
(
~allosLoUpRing = VBAPSpeakerArray.new(2, [-77.66, -45.08, -14.79, 14.79, 45.08, 77.16, 102.33, 134.91, 165.2, -165.2, -134.91, -102.33]);
b = Buffer.loadCollection(s, ~allosLoUp.getSetsAndMatrices);
)

(
x = { |azi = 0, ele = 0, spr = 0|
	VBAP.ar(50, PinkNoise.ar(0.8), b.bufnum, azi, ele, spr);
}.play;
)

// test them out
{[~s1, ~s2, ~s3, ~s4, ~s5, ~s6, ~s7, ~s8, ~s9, ~s10, ~s11, ~s12, ~s13, ~s14, ~s15, ~s16, ~s17, ~s18, ~s19, ~s20, ~s21, ~s22, ~s23, ~s24, ~s25, ~s26, ~s27, ~s28, ~s29, ~s30, ~s31, ~s32, ~s33, ~s34, ~s35, ~s36, ~s37, ~s38, ~s39, ~s40, ~s41, ~s42, ~s43, ~s44, ~s45, ~s46, ~s47, ~s48, ~s49, ~s50].do({|ang, alt| x.set([[\azi, ang], [\ele, alt]]); 0.25.wait; }) }.fork;

(
SynthDef(\violoncelloInstEnvVBAPAllos, { |decay = 0.6, durLine = 20, multPink = 1, fund = 83, parts = #[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21], devFreq = 8, bw = 0.0001, amps = #[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], scaleAmp = 20, bwF1 = 200, ampF1 = 0.02, bwF2 = 400, ampF2 = 0.02, bwF3 = 420, ampF3 = 0.002, bwF4 = 1000, ampF4 = 0.002, cutOffFreq = 5000, decDel = 5, decPar = 1, level = 1, busPar = 0, busIn = 2, bufnumV|
	var scale, env, in, delay, parallel, mix, azi, mixAll;
	//azi = MouseX.kr(-180, 180, lag: 0.02).poll(label: \azi);
	scale = SinOsc.kr(Dust.kr(0.2).range(0.1, 0.3)).range(0, 0.2);
	//env = EnvGen.kr(Env([0, 1.0, decay, 0], [durLine*0.16, durLine*0.42, durLine*0.41], [4, 0, -5]), 1, doneAction: 2);
	env = EnvGen.kr(Env([0,1,0.9,0], [durLine*0.5, durLine*0.05, durLine*0.44], [5, -8, -4]));
	in = LPF.ar(Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(multPink), fund*parts*LFNoise0.ar(devFreq).range(0.999, 1.001), 0.0001, amps*scaleAmp)), Formant.ar(fund, fund*3, bwF1, ampF1*scale), Formant.ar(fund, fund*5, bwF2, ampF2*scale), Formant.ar(fund, fund*9, bwF3, ampF3*scale), Formant.ar(fund, fund*13, bwF4, ampF4*scale)]), cutOffFreq);
	delay = DelayN.ar(in, 0.06);
	parallel = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), decDel);
	4.do({parallel = Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar))});
	//mixAll = Mix([Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar)), Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar)), Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar))]);
	mix = Mix([LeakDC.ar(parallel, 0.995, 1*level)*env, LeakDC.ar(in, 0.995, 0.75*level)*env ]);
	//OffsetOut.ar(0, VBAP.ar(8, mix, bufnumV, azi, 0, 0));
	//OffsetOut.ar(0, VBAP.ar(8, mix, bufnumV, SinOsc.kr(0.1).range(-180, 180), 0, SinOsc.kr(0.05).range(20,50)));
	OffsetOut.ar(0, VBAP.ar(50, mix, bufnumV, SinOsc.kr(Dust.kr(0.5).range(0.1, 0.4)).range(-179, 180).poll, 0, SinOsc.kr(0.05).range(20,50)));
}).add;
)

(
SynthDef(\violoncelloInstEnvVBAPAllosMid, { |decay = 0.6, durLine = 20, multPink = 1, fund = 83, parts = #[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21], devFreq = 8, bw = 0.0001, amps = #[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], scaleAmp = 20, bwF1 = 200, ampF1 = 0.02, bwF2 = 400, ampF2 = 0.02, bwF3 = 420, ampF3 = 0.002, bwF4 = 1000, ampF4 = 0.002, cutOffFreq = 5000, decDel = 5, decPar = 1, level = 1, busPar = 0, busIn = 2, bufnumV|
	var scale, env, in, delay, parallel, mix, azi, mixAll;
	//azi = MouseX.kr(-180, 180, lag: 0.02).poll(label: \azi);
	scale = SinOsc.kr(Dust.kr(0.2).range(0.1, 0.3)).range(0, 0.2);
	//env = EnvGen.kr(Env([0, 1.0, decay, 0], [durLine*0.16, durLine*0.42, durLine*0.41], [4, 0, -5]), 1, doneAction: 2);
	env = EnvGen.kr(Env([0,1,0.9,0], [durLine*0.5, durLine*0.05, durLine*0.44], [5, -8, -4]), 1, doneAction:2);
	in = LPF.ar(Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(multPink), fund*parts*LFNoise0.ar(devFreq).range(0.999, 1.001), 0.0001, amps*scaleAmp)), Formant.ar(fund, fund*3, bwF1, ampF1*scale), Formant.ar(fund, fund*5, bwF2, ampF2*scale), Formant.ar(fund, fund*9, bwF3, ampF3*scale), Formant.ar(fund, fund*13, bwF4, ampF4*scale)]), cutOffFreq);
	delay = DelayN.ar(in, 0.06);
	parallel = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), decDel);
	4.do({parallel = Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar))});
	//mixAll = Mix([Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar)), Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar)), Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar))]);
	mix = Mix([LeakDC.ar(parallel, 0.995, 1*level)*env, LeakDC.ar(in, 0.995, 0.75*level)*env ]);
	//OffsetOut.ar(0, VBAP.ar(8, mix, bufnumV, azi, 0, 0));
	//OffsetOut.ar(0, VBAP.ar(8, mix, bufnumV, SinOsc.kr(0.1).range(-180, 180), 0, SinOsc.kr(0.05).range(20,50)));
	OffsetOut.ar(0, VBAP.ar(30, mix, bufnumV, SinOsc.kr(Dust.kr(0.5).range(0.1, 0.4)).range(-179, 180).poll, 0, SinOsc.kr(0.05).range(20,50)));
}).add;
)

(
SynthDef(\violoncelloInstEnvVBAPAllosLoUp, { |decay = 0.6, durLine = 20, multPink = 1, fund = 83, parts = #[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21], devFreq = 8, bw = 0.0001, amps = #[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], scaleAmp = 20, bwF1 = 200, ampF1 = 0.02, bwF2 = 400, ampF2 = 0.02, bwF3 = 420, ampF3 = 0.002, bwF4 = 1000, ampF4 = 0.002, cutOffFreq = 5000, decDel = 5, decPar = 1, level = 1, busPar = 0, busIn = 2, bufnumV|
	var scale, env, in, delay, parallel, mix, azi, mixAll;
	//azi = MouseX.kr(-180, 180, lag: 0.02).poll(label: \azi);
	scale = SinOsc.kr(Dust.kr(0.2).range(0.1, 0.3)).range(0, 0.2);
	//env = EnvGen.kr(Env([0, 1.0, decay, 0], [durLine*0.16, durLine*0.42, durLine*0.41], [4, 0, -5]), 1, doneAction: 2);
	env = EnvGen.kr(Env([0,1,0.9,0], [durLine*0.5, durLine*0.05, durLine*0.44], [5, -8, -4]));
	in = LPF.ar(Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(multPink), fund*parts*LFNoise0.ar(devFreq).range(0.999, 1.001), 0.0001, amps*scaleAmp)), Formant.ar(fund, fund*3, bwF1, ampF1*scale), Formant.ar(fund, fund*5, bwF2, ampF2*scale), Formant.ar(fund, fund*9, bwF3, ampF3*scale), Formant.ar(fund, fund*13, bwF4, ampF4*scale)]), cutOffFreq);
	delay = DelayN.ar(in, 0.06);
	parallel = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), decDel);
	4.do({parallel = Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar))});
	//mixAll = Mix([Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar)), Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar)), Mix(AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand], decPar))]);
	mix = Mix([LeakDC.ar(parallel, 0.995, 1*level)*env, LeakDC.ar(in, 0.995, 0.75*level)*env ]);
	//OffsetOut.ar(0, VBAP.ar(8, mix, bufnumV, azi, 0, 0));
	//OffsetOut.ar(0, VBAP.ar(8, mix, bufnumV, SinOsc.kr(0.1).range(-180, 180), 0, SinOsc.kr(0.05).range(20,50)));
	OffsetOut.ar(0, VBAP.ar(12, mix, bufnumV, SinOsc.kr(Dust.kr(0.5).range(0.1, 0.4)).range(-179, 180).poll, 0, SinOsc.kr(0.05).range(20,50)));
}).add;
)

/////////Never forget this
(
~fundvcE1 = 83;
~partsvcE1 = (1..21) * ~fundvcE1;
~ampsvcE1 = ([14, 30, 19, 20, 12.5, 8, 13.5, 22, 15, 16, 10.2, 8.7, 8, 10, 5.5, 2, 1, 3, 2, 4.5, 1]-30).dbamp;
)

(
~routVCVBAPAllos = Routine({
	3.do{
	var delta, durLine, fund, level;
		//delta = rrand(7, 12);
		delta = 13;
	1.do{
		durLine = rrand(7, 12);
		level = rrand(0.05, 0.2);
		fund = rrand(82, 83);
		Synth(\violoncelloInstEnvVBAPAllosMid, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
		delta.yield;
	/*1.do{
		durLine = rrand(30, 40);
		level = rrand(0.7, 0.8);
		fund = rrand(82*2, 82.5*2);
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		level = rrand(0.2, 0.4);
		fund = rrand(82.5, 83)*7;
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		level = rrand(0.7, 0.95);
		fund = rrand(82*3, 82.3*3);
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		level = rrand(0.7, 0.9);
		fund = rrand(82*11, 82.2*11);
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		level = rrand(0.2, 0.4);
		fund = rrand(82.5, 83)*2;
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;
	1.do{
		durLine = rrand(30, 40);
		level = rrand(0.7, 0.9);
		fund = rrand(82, 83);
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;
	1.do{
		durLine = rrand(40, 60);
		level = rrand(0.3, 0.4);
		fund = rrand(55, 56);
		Synth(\violoncelloInstEnvVBAP, [\fund, fund, \amps, ~ampsvcE1, \durLine, durLine, \level, level, \bufnumV, b]);
	};
	delta.yield;*/
	}
})
)

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/RoutinePligues/VBAP/midRing/VCSynthIndGesture_Take2.aif");
s.record;
s.stopRecording;

~routVCVBAPAllos.play;
~routVCVBAPAllos.stop;