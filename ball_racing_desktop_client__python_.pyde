#note: FUCK YOU PROCESSING WHY CANT I USE TYPE HINTS ME AND THE GANG WHEN UNREADABLE CODE

from random import randrange

randCol = lambda: randrange(0,226)

bgCols = {
    "R": randCol(),
    "G": randCol(),
    "B": randCol()
}

class racingBall:
    def __init__(self):
        self.x = 0
        self.speed = randrange(1,21)
        self.R = randCol()
        self.G = randCol()
        self.B = randCol()

balls = [racingBall() for _ in range(4)]

def setup():
    size(600, 180)
    
def draw():
    background(bgCols["R"], bgCols["G"], bgCols["B"])
    fill(150, 150, 150)
    rect(0, 150, 50, 30)
    for i, ball in enumerate(balls):
        fill(0, 0, 0)
        text(str(i + 1), 10, (i + 1) * 31)
        fill(ball.R, ball.G, ball.B)
        circle(ball.x, (i + 1) * 30, 20)
        balls[i].x += balls[i].speed
        if balls[i].x > 600: balls[i].speed -= balls[i].speed * 2
        elif balls[i].x < 0:
            print("ball " + str(i + 1) + " won!!!!")
            noLoop()
            
def reset():
    for i in range(4):
        balls[i].R = randCol()        
        balls[i].G = randCol()
        balls[i].B = randCol()
        balls[i].x = 0
        balls[i].speed = randrange(1,21)
        bgCols = {"R": randCol(),"G": randCol(),"B": randCol()}
    loop()
            
def mousePressed():
    if mouseX <= 50 and mouseY >= 150: reset()
