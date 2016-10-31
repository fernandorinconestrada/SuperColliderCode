ULib.startup;

 a = Udef(\sine, { UOut.ar(0, SinOsc.ar(400) ) })
a.gui;
Udef.all[\sine]


Udef.userDefsFolder

(
y = UChain([\aNiceUdef, [\freq,400]],\stereoOutput);
y.prepareAndStart(s);
y.gui;
)

U(\sine).def.argSpecs.dopostln

x = Udef(\test, { SinOsc.ar(\freq.kr(200)) },[ArgSpec(\freq, 800, \freq.asSpec)] ).argSpecs[0];
x.spec

U(\test).gui

(
x = Udef(\test,{ |bus = 0, freq = 500,thing2=1, thing3 =1,thing4,thing5, point = #[0,0]|
     Out.ar(bus,UEQ.ar( WhiteNoise.ar*0.001*point, \eq, \default )) },
    [[\bus,0,IntegerSpec()],
    [\point, Point(1,2),PointSpec(Rect(0,0,20,20))],
    [\thing2,1,BoolSpec()],
    [\thing3,1,ListSpec([1,2,3,4],2)],
    [\thing4,1,RangeSpec()] ,
    [\thing5,nil,DiskSndFileSpec()],
    [\eq, nil, UEQSpec( \default ) ]
]);
y = U(\test);
y.gui;
)

(
z = UScore(
    *12.collect{ |i|
        UChain(
            i/5, //startTime
            i,     //track
            rrand(3.0,10.0), //fade times
            false, //releaseSelf
            U(\sine,[\freq, rrand(200.0,600.0)]),
            \stereoOutput
        ).fadeOut_(1).fadeIn_(1);
    }
);
z.gui
)

(
z = UScore(
    *12.collect({ |i|
        var evt;
        evt = BufSndFile("sounds/a11wlk01-44_1.aiff",
                rate: (i-6).midiratio, loop: [true,false].wrapAt(i) ).makeUChain
                .releaseSelf_(true).startTime_(i/2).track_(i).fadeOut_(1).fadeIn_(1);

        if( evt.duration == inf ) {
            evt.duration = 8; // looped events stopped by UScore
        };
        evt;
    })
);
x = UScoreEditor(z);
y = UScoreEditorGUI(x);
)

(
// create some Udefs

Udef( \mix2, { |balance = 0.5|
    var l1, l2;
    l1 = UIn.ar( 0 ) * (1-balance);
    l2 = UIn.ar( 1 ) * balance;
    UOut.ar( 0, l1 + l2 )
} ).loadSynthDef;

Udef( \vibrato, { |rate = 1, amount = #[0.0,1.0]|
    UOut.ar( 0, SinOsc.kr( rate ).range(*amount) * UIn.ar( 0 ) )
} ).loadSynthDef;

)

// \sine and \output are already in the Udef bank

x = UChain( \sine, [ \sine, [ \freq, 550, \u_o_ar_0_bus, 1 ]], \mix2, \vibrato, \output );

y = UChain( [ \sine, [ \freq, 660 ] ], \output );

s.notify; // make sure the server is notified!!

x.prepareAndStart;
x.release;

x.fadeOut = 0.5;
x.fadeIn = 0.5;

x.dur_( 5 );
x.dur_( inf ); // infinite duration (default)

x[1].setAudioOut( 0, 1 ); // 2nd sine output to bus 1, so it goes to second mix input

//you can control all the parameters from the guis
x.gui;
y.gui;