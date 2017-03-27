ball = sphere radius:8 wireColor:blue
cp1 = box length:5 width:5 height:5 pos:[-60,10,0] wireColor:red
cp2 = box length:5 width:5 height:5 pos:[-10,100,0] wireColor:red
cp3 = box length:5 width:5 height:5 pos:[20,-80,0] wireColor:red
cp4 = box length:5 width:5 height:5 pos:[60,-10,0] wireColor:red
cp5 = box length:2 width:2 height:2 wireColor:yellow
cp6 = box length:2 width:2 height:2 wireColor:yellow
cp7 = box length:2 width:2 height:2 wireColor:yellow
cp8 = box length:2 width:2 height:2 wireColor:green
cp9 = box length:2 width:2 height:2 wireColor:green

fn punto Punto1 Punto2 T=
(
	V = Punto2 - Punto1
	return Punto1 + ((normalize V)*(((length V)/100)*T))
)

fn interpolacionCubica Traveler CP1 CP2 CP3 CP4 CP5 CP6 CP7 CP8 CP9=
(
	animate on
	(
		for t in 0 to 100 by 10 do
		(
			at time t
			(
				CP5.pos = punto CP1 CP2 t 
				CP6.pos = punto CP2 CP3 t
				CP7.pos = punto CP3 CP4 t
				CP8.pos = punto CP5.pos CP6.pos t
				CP9.pos = punto CP6.pos CP7.pos t
				Traveler.pos = punto CP8.pos CP9.pos t
			)
		)
	)
	Traveler.showTrajectory = on
)

interpolacionCubica ball cp1.pos cp2.pos cp3.pos cp4.pos cp5 cp6 cp7 cp8 cp9