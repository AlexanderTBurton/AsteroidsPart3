int numStars = 200; //number of stars
ArrayList<Star> aStar = new ArrayList<Star>();
ArrayList<Asteroid> anAsteroid = new ArrayList<Asteroid>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
float d, d2;
int bXL, bXR, bYT, bYB;

void setup() {
  size(500,500);
  background(0);
  
}

void draw() {
  background(0);
  for (int i = 0; i < numStars; i++) {
    aStar.add(new Star());
    aStar.get(i).show();
  }
  
  if (Math.random() <= 0.005) {
      anAsteroid.add(new Asteroid());
    }
    
  for (int i = 0; i < anAsteroid.size(); i++) {
    anAsteroid.get(i).show();
    anAsteroid.get(i).move();
    d = dist((float)anAsteroid.get(i).getMyAsteroidCenterX(), (float)anAsteroid.get(i).getMyAsteroidCenterY(), (float)joe.getMyShipCenterX(), (float)joe.getMyShipCenterY());
    if(d <= 37) {
      anAsteroid.remove(i);
      i--;
      System.out.println("Ouch");
    }
      for (int j = bullets.size()-1; j >= 0; j--) {
      bullets.get(j).move();
      bullets.get(j).show();
      bXL = (int)bullets.get(j).getMyBulletCenterX();
      bXR = (int)bullets.get(j).getMyBulletCenterX();
      bYT = (int)bullets.get(j).getMyBulletCenterY();
      bYB = (int)bullets.get(j).getMyBulletCenterY();
      d2 = dist((float)anAsteroid.get(i).getMyAsteroidCenterX(), (float)anAsteroid.get(i).getMyAsteroidCenterY(), (float)bullets.get(j).getMyBulletCenterX(), (float)bullets.get(j).getMyBulletCenterY());
      if((bXL <= 0) || (bXR >= 500) || (bYT <= 0) || (bYB >= 500)) {
        bullets.remove(j);
        j--;
      }
      else if(d2 <= 100) {
      anAsteroid.remove(i);
      i--;
      bullets.remove(j);
      System.out.println("Shot on target");
    }
    }
  }
  
  
  System.out.println(bullets.size());
  joe.show();
  joe.move();
}

Spaceship joe = new Spaceship();

public void keyPressed() {
  //hyperspace
  if (key == 's') {
    joe.setXspeed(0);
    joe.setYspeed(0);
    joe.setMyCenterX((int)(Math.random()*width));
    joe.setMyCenterY((int)(Math.random()*height));
    }
  //rotate left
  else if (key == 'q') {
    joe.turn(-12);
  }
  //rotate right
  else if (key == 'e') {
    joe.turn(12);
  }
  //accelerate
  else if (key == 'w') {
    joe.accelerate(1.0);
  }
  else if (key == ' ') {
    bullets.add(new Bullet(joe));
  }
}
    
