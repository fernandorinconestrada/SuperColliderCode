(
SynthDef(\bass, {|out = 0, f = #[2,1,1, 1], p = #[0, 0.25, 0.75, 0.25]|
	var src = sum({ Ringz.ar(LFPulse.ar(f,p,0.01), exprand(50, 150).round([1,40,50, 60]), 0.5)} ! 20);
	Out.ar(out, src*3e-4!2 * EnvGate());
}).add;
)

x = Synth(\bass);

x.setn(\f, [0, 0, 2]);

x.release;

exprand(50, 150).round([1,40,50]);

10.round(40);

exprand(50, 150);

3e-4;

(
~getMatrix = { |l = 50, h = 150, n = #[1, 40, 50], size = 20|
	{ exprand(l, h).round(n) } ! size
};
)

~getMatrix.postln;

{a = LFPulse.ar(2, 0.25)}.plotGraph;
a.plot(minval: nil, maxval: nil);

{ |x| sin(x)}.plotGraph(2, 0.25, 2*pi);

{ sum( Ringz.ar(LFPulse.ar([2,1,1], [0, 0.25, 0.75], exprand(50, 150).round([1, 40, 50]), 0.5))) }.plot(4); 