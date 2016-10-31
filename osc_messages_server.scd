Server.local.makeGui;
Server.internal.makeGui;
s.boot;
//OSC Messages and chain process//
(
SynthDef(\impulse, { arg freq = 20, out = 0;
	Out.ar(out,
		Impulse.ar(freq));
}).send(s);
)
(
SynthDef(\echo,{ arg max = 0.2, delay = 0.15, decay = 1.5, mul = 0.8, out = 0;
	var in;
	in = In.ar(out, 2);
	ReplaceOut.ar(out,
		CombN.ar(in, max, delay, decay, mul));
}).send(s);
)

s.sendMsg("/s_new", "impulse", a = s.nextNodeID, 1, 1, "freq", 3);
s.sendMsg("/n_free", a);


s.sendMsg("/s_new", "impulse", b = s.nextNodeID, 1, 1, "freq", 1);
s.sendMsg("/s_new", "impulse", c = s.nextNodeID, 1, 1, "freq", 2);
s.sendMsg("/s_new", "impulse", d = s.nextNodeID, 1, 1, "freq", 3);
s.sendMsg("/n_free", b);
s.sendMsg("/n_free", c);
s.sendMsg("/n_free", d);

s.sendMsg("/s_new", "echo", e = s.nextNodeID, 1, 1);
s.sendMsg("/n_free", e);

s.sendMsg("/s_new", "echo", f = s.nextNodeID, 1, 1);
s.sendMsg("/n_free", f);
//control buffers//

(
SynthDef(\line,{ arg i_bus = 10, i_start = 1000, i_end = 500, i_dur = 1;
	ReplaceOut.kr(i_bus, Line.kr(i_start, i_end, i_dur, doneAction: 2));
}).send(s);
)

s.sendMsg("/s_new", "impulse", g = s.nextNodeID, 1, 1, "freq", 1);
s.sendMsg("/c_set", 10, g);
s.sendMsg("/n_map", g, \freq, 10);
s.sendMsg("/c_set", 10, 3);
s.sendMsg("s_new", "line", s.nextNodeID, 0, 1);
s.sendMsg("/n_free", g);
