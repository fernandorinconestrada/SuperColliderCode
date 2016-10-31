Server.internal.scope;
(
SynthDef(\osc_vertice, {arg freq, phase;
	var carrier, modphase;
	carrier = MouseX.kr(200, 1000);
	modphase = MouseY.kr(0, 4);
	Out.ar(0,
		PMOsc.ar(freq, carrier, phase, modphase, 0.1));
}).send(s);
)
x = Synth(\osc_vertice);
x.trace(10);
~cursor_2 = Synth(\osc_vertice);
~cursor_3 = Synth(\osc_vertice);
~cursor_4 = Synth(\osc_vertice);
~cursor_5 = Synth(\osc_vertice);

(
OSCdef(\cursor_01, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln; time.postln)  }, "cursor", nil, 57130);
/*OSCdef(\cursor_02, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_03, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_04, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_05, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_06, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_07, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln,\phase, msg[3].postln)  }, "cursor_", nil, 57130);
OSCdef(\cursor_08, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln,\phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_09, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_10, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_11, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_12, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_13, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_14, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_15, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_16, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_17, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_18, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_19, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_20, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_21, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_22, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_23, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_24, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);
OSCdef(\cursor_25, { |msg, time, addr, recvPort| x.set(\freq, msg[2].postln, \phase, msg[3].postln)  }, "cursor", nil, 57130);*/
)
