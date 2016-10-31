~up = (0..11);
~up.size;
~mid = (12..41);
~mid.size;
~low = (42..53);
~low.size;

(
r = Routine({
	15.do{
		var delta;
		delta = rrand(1, 3);
		~up.fork(0).postln;
		delta.yield;
	}
})
)

r.play;

(
~index = 0;
~array = #[0,2,4];

~func = {
 fork{
 inf.do{
 ~array[~index].postln;
 0.1.wait;
 }
 }
};
)
(
(
a = Routine({inf.do{ |i| i.yield;}});
b = Routine({inf.do{ |i| i.yield;}});
c = Routine({inf.do{ |i| i.yield;}});
d = Routine({inf.do{ |i| i.yield;}});



v = Routine({
		inf.do{
	var delta;
	delta = 1;
	{
			Out.ar(a.value.wrap(0, 11).postln, WhiteNoise.ar(0.1)*EnvGen.kr(Env.perc, 1, doneAction:2));
			Out.ar(b.value.wrap(12, 27).postln, WhiteNoise.ar(0.1)*EnvGen.kr(Env.perc, 1, doneAction:2));
			Out.ar((67 - c.value.wrap(27, 41)).postln, WhiteNoise.ar(0.1)*EnvGen.kr(Env.perc, 1, doneAction:2));
			Out.ar(d.value.wrap(42, 54).postln, WhiteNoise.ar(0.1)*EnvGen.kr(Env.perc, 1, doneAction:2))}.play;
	delta.yield;
		};
})
)
v.play;
a.reset;b.reset;c.reset;d.reset;
(r = Routine.new({1.yield; 2.yield; 3.yield; 4.yield;}))

~func.value;
~index = 1;

~up = Routine({2.do{0.yield;1.yield;2.yield;3.yield;4.yield;5.yield;6.yield;7.yield;8}})

(
x = { Routine { |in|
       var accum = [], n = 5;
       loop {
               accum = accum.add(in).keep(n.neg);
               in = (accum.sum / accum.size).yield;
                accum.postln;
       }
} };
)

(
e = Routine({inf.do{|i| i.yield;}});
f = Routine({
	inf.do{
		(e.value.wrap(42,54)).postln;
		0.5.yield;
	};
})
)
f.stop;
e.reset;
f.play;
