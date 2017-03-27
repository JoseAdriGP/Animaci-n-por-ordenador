ball = sphere radius:10 wireColor:blue
animate on
( 
	at time 0   ball.pos = [-100,0,0]
	at time 100 ball.pos = [100,0,0]
)



b2 = sphere radius:4 wireColor:red
animate on for t in 0 to 100 by 5 do
	at time t 
	(
		b2.pos = ball.pos + random [-15,-15,-15] [15,15,15]
		ball.radius = 8 + 3 * sin (720 * t / 100)
	)

p1 = at time 10 ball.pos
p2 = at time 50 ball.pos
distance p2 p1