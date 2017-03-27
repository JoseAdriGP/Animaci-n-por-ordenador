ball = sphere radius:5 wireColor:blue pos:[-30,0,5]
b2 = sphere radius:5 wireColor:red pos:[0,0,5]
boxy = box length:1 width:1 height:2 wireColor:green pos:[0,0,0]

fn salto Jumper Altura tiempo framesini framesfin paso= 
(
	i = [0,0,Altura]
	animate on
	(
		for t in framesini to framesfin by paso do
		(
			at time (t+tiempo)
			(
				Jumper.pos = Jumper.pos + i
				i=i*(-1)
			)
		)
	)
)

fn orbitar Orbiter framesini framesfin paso objetivo1 objetivo2= 
(
	animate on
	(
		for t in framesini to framesfin by paso do
		(
			at time t
			(
				it = random 1 2
				Orbiter.pos = if it == 1 then objetivo1.pos + random [-15,-15,-15] [15,15,15] else objetivo2.pos + random [-15,-15,-15] [15,15,15]
			)
		)
	)
)
		
salto ball 30 0 50 100 10
salto b2 30 10 50 110 10
orbitar boxy 0 110 5 ball b2

animate on
(
	at time 50 b2.pos= at time 60 b2.pos
)
