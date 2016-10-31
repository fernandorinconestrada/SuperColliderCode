~b = RedBuffer(s,"/Users/fernandorincon/Documents/Live/June8/Samples/Processed/Consolidate/sample a.aif", 0.1, 2);
~c = RedBuffer(s,"/Users/fernandorincon/Documents/Live/June8/Samples/Processed/Consolidate/sample b.aif", 0.1, 3);
~d = RedBuffer(s,"/Users/fernandorincon/Documents/Live/June8/Samples/Processed/Consolidate/sample c.aif", 0.1, 4);

/*~b = RedBuffer(s,"/Users/fernandorincon/Documents/Pre Comp/Estudio 209/Comp 17/209 sine tones/Midi90Ciclo1.aiff", 0.1, 2);
~c = RedBuffer(s,"/Users/fernandorincon/Documents/Pre Comp/Estudio 209/Comp 17/209 sine tones/Midi92Ciclo1.aiff", 0.1, 3);
~d = RedBuffer(s,"/Users/fernandorincon/Documents/Pre Comp/Estudio 209/Comp 17/209 sine tones/Midi95Ciclo1.aiff", 0.1, 4);*/

r = RedGrain(s);

(
fork{
    2000.do{|i|
        r.buf_([~b, ~c, ~d].wrapAt(i));
        r.pos_(0.1.rand);
		r.dur_({[0.3, 0.5, 0.7].choose});
		r.rate_(1.rrand(1.1));
		(0.1.rand).wait;
    }
};
)

r.buf_({[~b, ~c, ~d].choose});
r.start;
r.pos_({0.1.rand});
r.rate_(1.rrand(1.2));
r.dur_({1.9.rrand(1.7).postln});
r.stop;


s.prepareForRecord("/Users/fernandorincon/Documents/Live/June8/Samples/Processed/Consolidate/redgrain.aif");
s.record;
s.stop;