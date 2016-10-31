play{l=LFNoise2;o=0.3;FreeVerb.ar(LPF.ar(SinOsc.ar(l.ar(o).range(300,1000))*Saw.ar(17),300),l.ar(o).range(0, 0.3).poll)!2}

y = FreqScope.new;

(

play{ o = 0.3; FreeVerb.ar(AllpassC.ar(LPF.ar(SinOscFB.ar(LFNoise2.ar(o).range(666, 801), LFNoise2.ar(o*0.3).range(0.1, 0.8).poll, 0.4)*Saw.ar(10), LFNoise2.ar(o*0.2).range(200, 600)), 0.5, LFNoise2.ar(o*0.2).range(0.01, 0.5), 0.4), LFNoise2.ar(o*1.1).range(0.1, 0.7), LFNoise2.ar(0), 0.3) !2 };

play{ o = 0.3; FreeVerb.ar(AllpassC.ar(LPF.ar(SinOscFB.ar(LFNoise2.ar(o).range(665, 700), LFNoise2.ar(o*0.2).range(0.1, 0.6).poll, 0.6)*Saw.ar(11), LFNoise2.ar(o*0.2).range(200, 800)), 0.5, LFNoise2.ar(o*0.2).range(0.01, 0.3), 1), LFNoise2.ar(o*1).range(0.1, 0.4), LFNoise2.ar(0), 0.3) !2 };

)

{ Saw.ar(20) }.plot(0.5);

s.prepareForRecord;
s.record;
s.stopRecording;
