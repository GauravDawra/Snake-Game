ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();

int head = 20;
int w = 25, h = 25;
int dir = 2; // down, up, right, left
int apple_x = 15, apple_y = 15;
int[] dx = {0,0,1,-1}, dy = {1, -1, 0, 0};
int score = 0;
boolean gameOver = false;

void setup(){
  size(500, 500);
  x.add(12);
  y.add(12);
}

void draw(){
  background(255);
  if(!gameOver){
     textSize(30);
     textAlign(CENTER);
     text("Score:" + score, width - 100, 40);
     for(int i=0; i<x.size(); i++){
      fill(0, 255, 0);
      rect(x.get(i) * head, y.get(i) * head, head, head);
    }
    
    fill(255, 0, 0);
    rect(head * apple_x, head * apple_y, head, head);
    
    if(frameCount%5==0){
      x.add(0, x.get(0) + dx[dir]);
      y.add(0, y.get(0) + dy[dir]);
      if(x.get(0) >= w || y.get(0) >= h || x.get(0) < 0 || y.get(0) < 0) gameOver = true;
      
      for(int i=1;i<x.size();i++) {if(x.get(i)==x.get(0) && y.get(i)==y.get(0)) gameOver = true;}
      
      if(x.get(0) == apple_x && y.get(0) == apple_y){
        apple_x = (int)random(0, w-1);
        apple_y = (int)random(0, h-1);
        score++;
      }
      else{
        x.remove(x.size()-1);
        y.remove(y.size()-1);
      }
    }
  }
  else{
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text("GAME OVER\n", width/2, height/2);
    text("SCORE: " + score, width/2, height/2+40);
    if(keyPressed && key==' '){
      x.clear();
      y.clear();
      x.add(12);
      y.add(12);
      gameOver = false;
      score = 0;
    }
  }
}

/*void keyPressed(){
  int oldDir = dir;
  if(key=='s') dir = 0;
  else if(key=='w') dir = 1;
  else if(key=='d') dir = 2;
  else if(key=='a') dir = 3;
  if(oldDir==0 && dir == 1 ||
     oldDir==1 && dir == 0 ||
     oldDir==2 && dir == 3 ||
     oldDir==3 && dir == 2) dir = oldDir;
}*/

void keyPressed() { int nd=key=='s'? 0:(key=='w'?1:(key=='d'?2:(key=='a'?3:-1)));
  if (nd!=-1&&(x.size()<=1||!(x.get(1)==x.get(0)+dx[nd]&&y.get(1)==y.get(0)+dy[nd]))) dir=nd;
}
