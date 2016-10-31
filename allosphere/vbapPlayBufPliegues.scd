
~varese = VBAPSpeakerArray.new(2, [0, 45, 90, 135, 180, -135, -90, -45]);

~varese.speakers[2].dump;

b = ~varese.loadToBuffer;

(
~allosLoUpRing = VBAPSpeakerArray.new(2, [-77.66, -45.08, -14.79, 14.79, 45.08, 77.16, 102.33, 134.91, 165.2, -165.2, -134.91, -102.33]);
b = Buffer.loadCollection(s, ~allosLoUpRing.getSetsAndMatrices);
)

(
~allosMidRing = VBAPSpeakerArray.new(2, [-77.66,-65.64,-54.08,-42.86,-31.92,-21.18,-10.55,0,10.55,21.18,31.92,42.86,54.08,65.54,77.66,102.33,114.35,125.91,137.13,148.07,158.81,169.44, 179,-169.44,-158.81,-148.07,-137.13,-125.91,-114.35,-102.33]);
b = Buffer.loadCollection(s, ~allosMidRing.getSetsAndMatrices);
)

//buffers middle
(
~buf1vbapInd = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/8channExtract/Bounced Files/monoVBAPVCIndGest/miniRoutVC_extendedGapsTake1_monoMixPart2.wav");
~buf2vbapInd = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/8channExtract/Bounced Files/monoVBAPVCIndGest/miniRoutVC_extendedGapsTake1_monoMixPart3.wav");
~buf3vbapInd = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/8channExtract/Bounced Files/monoVBAPVCIndGest/miniRoutVC_extendedGapsTake5_monoMixPart1.wav");
~buf4vbapInd = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/8channExtract/Bounced Files/monoVBAPVCIndGest/miniRoutVC_extendedGapsTake5_monoMixPart2.wav");
~buf5vbapInd = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/8channExtract/Bounced Files/monoVBAPVCIndGest/miniRoutVC_extendedGapsTake5_monoMixPart3.wav");
~buf6vbapInd = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/8channExtract/Bounced Files/monoVBAPVCIndGest/miniRoutVC_extendedGapsTake5_monoMixPart4.wav");
~buf7vbapInd = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/7.0/allosphere/allosphereStereoTemplate/mixing workspace/8channExtract/Bounced Files/monoVBAPVCIndGest/miniRoutVC_extendedGapsTake5_monoMixPart5.wav");
~buf = [~buf1vbapInd, ~buf2vbapInd, ~buf3vbapInd, ~buf4vbapInd, ~buf5vbapInd, ~buf6vbapInd, ~buf7vbapInd];
~bufFrames = [~buf1vbapInd.numFrames, ~buf2vbapInd.numFrames, ~buf3vbapInd.numFrames, ~buf4vbapInd.numFrames, ~buf5vbapInd.numFrames, ~buf6vbapInd.numFrames, ~buf7vbapInd.numFrames]/48000;
)

/////buffers end
(
~vbapIndbuf1 = Buffer.read(s,"/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/untitled folder/AuditionAmp/MonoMix/miniRoutVCVer4_Take1_+6db_monoMix.wav" );
~vbapIndbuf2 = Buffer.read(s, "/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/untitled folder/AuditionAmp/MonoMix/miniRoutVCVer4_Take2_+6db_monoMix.wav");
~vbapIndbuf3 = Buffer.read(s, "/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/untitled folder/AuditionAmp/MonoMix/miniRoutVCVer4_Take3_+6db_monoMix.wav");
~vbapIndbuf4 = Buffer.read(s,"/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/untitled folder/AuditionAmp/MonoMix/miniRoutVCVer4_Take4_+6db_monoMix.wav" );
~vbapIndbuf5 = Buffer.read(s, "/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/violoncello/untitled folder/AuditionAmp/MonoMix/miniRoutVCVer4_Take6_+6db_monoMix.wav");
~bufEnd = [~vbapIndbuf1, ~vbapIndbuf2, ~vbapIndbuf3, ~vbapIndbuf4, ~vbapIndbuf5];
~bufEndFrames = [~vbapIndbuf1.numFrames, ~vbapIndbuf2.numFrames, ~vbapIndbuf3.numFrames, ~vbapIndbuf4.numFrames, ~vbapIndbuf5.numFrames]/48000;
)


(
SynthDef(\vbapSynthPlayBufSpinStereo, { |sub= 24, rate = 1, trigger = 1, bufnum, bufnumV, spr = 10, phase = 0.5, dur = 6, rateAzi = 0.1, loAzi = 90, hiAzi = -180, loSpread = 0, hiSpread = 20, phaseSpr = 0.5pi, rateEnv = 0.2, elev = 0, point1 = 135, point2 = 1, durLine = 20|
	var env, azi, source, spread, mix;
	env = EnvGen.kr(Env([0,1,0], [durLine*0.5, durLine*0.5], \sin), 1, doneAction:2);
	azi = LFSaw.kr(rateAzi, phase).range(loAzi,hiAzi).poll(label: \aziOr);
	//azi = SinOsc.kr(rateAzi, phase).range(loAzi,hiAzi).poll(label: \aziOr);
	//elev = SinOsc.kr(0.025, -0.5pi).range(0, 88).poll(label: \eleOr);
	spread = SinOsc.kr(0.05, phaseSpr).range(loSpread, hiSpread).poll(label: \spr);
	source = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum)*1, trigger, 0, 1)*env;
	//OffsetOut.ar(0, VBAP.ar(8, source, bufnumV, XLine.kr(point1, point2, durLine, doneAction:2).poll(label: \azi), elev, spread));
	OffsetOut.ar(0, VBAP.ar(8, source, bufnumV, azi.poll(label: \azi), elev, spread));
}).add;
)

(
SynthDef(\vbapSynthPlayBufSpinPlieguesEnd, { |rate = 1, trigger = 1, bufnum, bufnumV, spr = 10, phase = 2, dur = 6, /*rateAzi = 0.1,*/ loAzi = 180, hiAzi = -180, loSpread = 0, hiSpread = 20, phaseSpr = 0.5pi, rateEnv = 0.2, elev = 0, durLine = 20|
	var env, azi, source, spread, mix, rateAzi;
	env = EnvGen.kr(Env([0,1,0], [durLine*0.5, durLine*0.5], \sin), 1, doneAction:2);
	rateAzi = SinOsc.kr(0.1).range(0.05, 0.1);
	//azi = LFSaw.kr(rateAzi, phase).range(loAzi,hiAzi).poll(label: \aziOr);
	azi = SinOsc.kr(rateAzi, phase).range(loAzi,hiAzi).poll(label: \aziOr);
	//elev = SinOsc.kr(0.025, -0.5pi).range(0, 88).poll(label: \eleOr);
	spread = SinOsc.kr(0.05, phaseSpr).range(loSpread, hiSpread).poll(label: \spr);
	source = PlayBuf.ar(1, bufnum, BufRateScale.kr(bufnum)*1, trigger, 0, 1)*env;
	//OffsetOut.ar(0, VBAP.ar(8, source, bufnumV, XLine.kr(point1, point2, durLine, doneAction:2).poll(label: \azi), elev, spread));
	OffsetOut.ar(0, VBAP.ar(30, source, bufnumV, azi.poll(label: \azi), elev, spread));
}).add;
)
{XLine.kr(1,90, 20).poll}.play;
(
x = Synth(\vbapSynthPlayBufSpinPlieguesEnd, [\bufnum, ~vbapIndbuf2, \bufnumV, b, \loSpread, 60, \hiSpread, 20, \phaseSpr, 1, \rateAzi, 0.067, \durLine, ~bufEndFrames.at([1]) ]);
)

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/VBAP/EndTakes/MiddleRing_Take3.aif");
s.record;
s.stopRecording;

(
~testRout = Routine({
	var delta, index, point1, point2, point3, point4;
	delta = rrand(5, 8);
	point1 = rrand(1, 90);
	point2 = rrand(90, 180);
	point3 = rrand(-1, -90);
	point4 = rrand(-90, -180);
	1.do{
		var index;
		index = rrand(0,6);
		Synth(\vbapSynthPlayBufSpinStereo, [\bufnum, ~buf.at([index]), \bufnumV, b, \loSpread, 40, \hiSpread, 20, \phaseSpr, 1, \durLine,  ~bufEndFrames.at([index])]);
	};
	17.yield;
	1.do{
		var index;
		index = rrand(0,6);
		Synth(\vbapSynthPlayBufSpinStereo, [\bufnum, ~buf.at([index]), \bufnumV, b, \loSpread, 10, \hiSpread, 40, \phaseSpr, 1, \durLine,  ~bufFrames.at([index]), \point1, point2, \point2, point1]);
	17.yield;
	};
	1.do{
		var index;
		index = rrand(0,6);
		Synth(\vbapSynthPlayBufSpinStereo, [\bufnum, ~buf.at([index]), \bufnumV, b, \loSpread, 20, \hiSpread, 60, \phaseSpr, 1, \durLine,  ~bufFrames.at([index]), \point1, point3, \point2, point4]);
	};
	17.yield;
	1.do{
		var index;
		index = rrand(0,6);
		Synth(\vbapSynthPlayBufSpinStereo, [\bufnum, ~buf.at([index]), \bufnumV, b, \loSpread, 10, \hiSpread, 30, \phaseSpr, 1, \durLine,  ~bufFrames.at([index]), \point1, point4, \point2, point3]);
	};
});
)

~testRout.play;