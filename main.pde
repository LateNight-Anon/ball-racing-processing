int col1, col2, col3;

void setBackgroundColours() {
  col1 = round(random(0,225));
  col2 = round(random(0,225));
  col3 = round(random(0,225));
}

class racingBall {
    float x, speed;
    int col1, col2, col3;
    racingBall() {
        x = 0;
        col1 = round(random(0,225));
        col2 = round(random(0,225));
        col3 = round(random(0,225));
        speed = random(1, 20);
    }
}

racingBall[] racingBalls = {new racingBall(), new racingBall(), new racingBall(), new racingBall()};

void setup() {
  size(600, 180);
  setBackgroundColours();
}
  

void draw() {
  background(col1, col2, col3);
  fill(150, 150, 150);
  rect(0, 150, 50, 30);
  for (int i = 0; i < 4; i++) {
    fill(0, 0, 0);
    text(str(i + 1), 10, (i + 1) * 31);
    fill(racingBalls[i].col1, racingBalls[i].col2, racingBalls[i].col3);
    circle(racingBalls[i].x, 30 * (i + 1), 20);
    racingBalls[i].x += racingBalls[i].speed;
    if (racingBalls[i].x > 600) {
      racingBalls[i].speed -= racingBalls[i].speed * 2; 
    } else if (racingBalls[i].x < 0) {
        print("ball " + str(i + 1) + " won!!!\n");
        noLoop();
    }
  }
}

void reset() {
  for (int i = 0; i < 4; i++) {
    racingBalls[i].x = 0;
    racingBalls[i].col1 = round(random(0,225));
    racingBalls[i].col2 = round(random(0,225));
    racingBalls[i].col3 = round(random(0,225));
    racingBalls[i].speed = random(1, 20);
    setBackgroundColours();
  }
  loop();
}

void mousePressed() {
   if (mouseX <= 50 && mouseY >= 150) {
      reset();
   }
}
