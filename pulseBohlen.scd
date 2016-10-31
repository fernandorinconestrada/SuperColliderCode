s = Server.local.makeGui;
o = Server.local.options;
o.numOutputBusChannels = 31;
o.numInputBusChannels = 2;

(
SynthDef(\pulseBohlenPierce, { |bus = #[0,1], freq_imp = 0.1, width = 0.5, amp = 0.1, freq = #[1,1,1,1], ampli = #[1,1,1,1], ring = #[1,1,1,1], freq_pan = 0.2, pan_width = 2, orient = 0.5 |
	var in;
	in = DynKlank.ar( `[freq, ampli, ring], Pulse.ar(freq_imp, width, amp));
	Out.ar(bus,
		PanAz.ar(2, in, SinOsc.ar(freq_pan), pan_width, orient))
}).load(s);
)

~a = Synth(\pulseBohlenPierce,
	[\bus, [0,29], \freq_imp, 0.13, \width, 0.6, \amp, rrand(0.01, 0.1).postln,
		\freq, Array.fill(4, {|deg| 660*(6**(deg/13))}).postln,
		\ampli, Array.fill(4, {rrand(0.2, 0.6)}).postln,
		\rings, Array.fill(4, {rrand(0.4, 1)}).postln, \freq_pan, 0.3]);
~b = Synth(\pulseBohlenPierce,
	[\bus, [2,27], \freq_imp, 0.11, \width, 0.5, \amp, rrand(0.01, 0.1).postln,
		\freq, Array.fill(4, {|deg| 660*(6**(deg/13))}).postln,
		\ampli, Array.fill(4, {rrand(0.2, 0.6)}).postln,
		\rings, Array.fill(4, {rrand(0.4, 1)}).postln,
		\freq_pan, 0.5]);
~c = Synth(\pulseBohlenPierce,
	[\bus, [4,25], \freq_imp, 0.17, \width, 0.8, \amp, rrand(0.01, 0.1).postln,
		\freq, Array.fill(4, {|deg| 660*(6**(deg/13))}).postln,
		\ampli, Array.fill(4, {rrand(0.2, 0.6)}).postln,
		\rings, Array.fill(4, {rrand(0.4, 1)}).postln]);
~d = Synth(\pulseBohlenPierce,
	[\bus, [6,23], \freq_imp, 0.13, \width, 0.6, \amp, rrand(0.01, 0.1).postln,
		\freq, Array.fill(4, {|deg| 660*(6**(deg/13))}).postln,
		\ampli, Array.fill(4, {rrand(0.2, 0.6)}).postln,
		\rings, Array.fill(4, {rrand(0.4, 1)}).postln]);

~e = Synth(\pulseBohlenPierce,
	[\bus, [8,21], \freq_imp, 0.19, \width, 0.6, \amp, rrand(0.01, 0.1).postln,
		\freq, Array.fill(4, {|deg| 660*(6**(deg/13))}).postln,
		\ampli, Array.fill(4, {rrand(0.2, 0.6)}).postln,
		\rings, Array.fill(4, {rrand(0.4, 1)}).postln, \freq_pan, 0.7]);
~f = Synth(\pulseBohlenPierce,
	[\bus, [10,19], \freq_imp, 0.13, \width, 0.5, \amp, rrand(0.01, 0.1).postln,
		\freq, Array.fill(4, {|deg| 660*(6**(deg/13))}).postln,
		\ampli, Array.fill(4, {rrand(0.2, 0.6)}).postln,
		\rings, Array.fill(4, {rrand(0.4, 1)}).postln,
		\freq_pan, 0.5]);
~g = Synth(\pulseBohlenPierce,
	[\bus, [12,17], \freq_imp, 0.17, \width, 0.8, \amp, rrand(0.01, 0.1).postln,
		\freq, Array.fill(4, {|deg| 660*(6**(deg/13))}).postln,
		\ampli, Array.fill(4, {rrand(0.2, 0.6)}).postln,
		\rings, Array.fill(4, {rrand(0.4, 1)}).postln]);
~h = Synth(\pulseBohlenPierce,
	[\bus, [14,16], \freq_imp, 0.93, \width, 0.6, \amp, rrand(0.01, 0.1).postln,
		\freq, Array.fill(4, {|deg| 660*(6**(deg/13))}).postln,
		\ampli, Array.fill(4, {rrand(0.2, 0.6)}).postln,
		\rings, Array.fill(4, {rrand(0.4, 1)}).postln, \freq_pan, 1.1]);
