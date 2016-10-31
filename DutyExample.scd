(
    {
        var freq;
        freq = Duty.kr(
                Dseq([0.4, 0.4, 0.8], inf), // demand ugen as durations
                0,
                Dseq([204, 400, 800], inf)
            );
        SinOsc.ar(freq * [1, 1.01]) * 0.1

    }.play;
)