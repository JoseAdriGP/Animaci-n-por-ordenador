ball = sphere radius:8 wireColor:blue
cp1 = box length:5 width:5 height:5 pos:[30,10,-10] wireColor:red
cp2 = box length:5 width:5 height:5 pos:[0,-40,20] wireColor:red
cp3 = box length:5 width:5 height:5 pos:[-30,20,0] wireColor:red
cp4 = box length:2 width:2 height:2 wireColor:yellow
cp5 = box length:2 width:2 height:2 wireColor:yellow

fn punto Punto1 Punto2 T=
(
	V = Punto2 - Punto1
	return Punto1 + ((normalize V)*(((length V)/100)*T))
)

fn interpolacionCuadratica Traveler CP1 CP2 CP3 CP4 CP5 FIni FFin Salto=
(
	animate on
	(
		for t in FIni to FFin by Salto do
		(
			at time t
			(
				CP4.pos = punto CP1 CP2 t
				CP5.pos = punto CP2 CP3 t
				Traveler.pos = punto CP4.pos CP5.pos t
			)
		)
	)
	Traveler.showTrajectory = on
)

interpolacionCuadratica ball cp1.pos cp2.pos cp3.pos cp4 cp5 0 100 10
