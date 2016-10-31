(
{
var s, z, y;
	// 10 voices of a random sine percussion sound :
s = Mix.ar(Array.fill(10, { Resonz.ar(Dust.ar(0.2, 50), 200 + 3000.0.rand, 0.003)}) );
	// reverb predelay time :
z = DelayN.ar(s, 0.048);
	// 7 length modulated comb delays in parallel :
y = Mix.ar(Array.fill(7,{ CombL.ar(z, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 15) }));
	// two parallel chains of 4 allpass delays (8 total) :
4.do({ y = AllpassN.ar(y, 0.050, [0.050.rand, 0.050.rand], 1) });
	// add original sound to reverb and play it :
s+(0.2*y)
}.scope
)

{Mix.ar(Array.fill(10, { Resonz.ar(Dust.ar(0.2, 50), 200 + 3000.0.rand, 0.003)}))}.play;

{ CombL.ar(Mix.ar(Array.fill(10, { Resonz.ar(Dust.ar(0.2, 50), 200 + 3000.0.rand, 0.003)})), 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), MouseX.kr(1, 15))}.play;

{ CombL.ar(Mix.ar(Array.fill(10, { Resonz.ar(Dust.ar(0.2, 50), 200 + 3000.0.rand, 0.003)})), 0.1, MouseY.kr(0.04, 0.06), MouseX.kr(1, 15))}.play;

{
	var source, preDel, in;
	source = Mix.new(Array.fill(10, { Resonz.ar(Dust.ar(0.2, 50), 200 + 3000.0.rand, 0.003)}) );
	preDel = DelayC.ar(source, 0.05, 0.05);
	in = Mix.new(Array.fill(7, {CombC.ar(Mix.ar(Array.fill(10, { Resonz.ar(Dust.ar(0.2, 50), 200 + 3000.0.rand, 0.003)})), 0.1, MouseY.kr(0.04, 0.06), MouseX.kr(1, 15))}));
	4.do({in = AllpassC.ar(in, 0.05, [0.05.rand, 0.05.rand], 1)});
	Out.ar(0, source);
	Out.ar(0, in*0.2);
}.play;