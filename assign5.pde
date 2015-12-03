boolean leftPressed = false ;
boolean rightPressed = false ;
boolean aMode=true,bMode=false,cMode=false;

  final int COUNT=8;
 float []enemyX=new float[COUNT];
 float []enemyY=new float[COUNT];
 
 PImage[]flame = new PImage[5];
 
 int speed=0;
 boolean []showing=new boolean[COUNT];


void setup () {
  size(640,480) ;  
  fighterImg=loadImage("img/fighter.png");
  enemyImg=loadImage("img/enemy.png");
  bg1Img=loadImage("img/bg1.png");
  bg2Img=loadImage("img/bg2.png");
  hpImg=loadImage("img/hp.png");
  treasureImg=loadImage("img/treasure.png");
  start1Img=loadImage("img/start1.png");
  start2Img=loadImage("img/start2.png");
  end1Img=loadImage("img/end1.png");
  end2Img=loadImage("img/end2.png");
  treasureX=floor(random(30,500));
  treasureY=floor(random(50,400));
  hpX=40;
  enemyX[0]=0;
  enemyY[0]=floor(random(30,400));
  a=0;
  b=0;
  c=0;
  x=550;
  y=height/2;
  gameState=GAME_START;
  for (int i=0 ; i<COUNT ; i++ ){
    showing[i]=true;
  }

} 

void draw() {
  //gamestart
  switch(gameState){
    case GAME_START:
          image(start2Img,0,0);
                if( 210<mouseX && mouseX<450 && 370<mouseY&& mouseY<400 ){
                   if(mousePressed){
                   gameState=GAME_RUN;
                     x=550;
                     y=height/2;
                     hpX=40;
                    enemyX[0]=0;
                    enemyY[0]=floor(random(30,400));
                
                   }else{
                   image(start1Img,0,0);
                   }
                  }
          
           
    break;
    
    case GAME_RUN:
                
          
               //bg
              background(0);
              image(bg1Img,a,0);
              a++;
              a%=1280;
              image(bg2Img,b-640,0);
              b++;
              b%=1280;
              image(bg1Img,c-1280,0); 
              c++;
              c%=1280;
              
              //fighter
              
              image(fighterImg,x,y);
               if(upPressed){
               y-=fighterSpeed;
               }
               if(downPressed){
               y+=fighterSpeed;
               }
               if(leftPressed){
               x-=fighterSpeed;
               }
               if(rightPressed){
               x+=fighterSpeed;
               }
               
               //boundary detection
               if(x<35){
                 x=35;
               }if(x>570){
                 x=570;
               }if(y<35){
                 y=35;
               }if(y>420){
                 y=420;
               }
              
              //hp
              
              fill(255,0,0);
              rect(15,15,hpX,20);
              image(hpImg,10,10);
              if(hpX>=200){
                hpX=200;
              }
              
              //treasure
              
              image(treasureImg,treasureX,treasureY);
              
              if(x>=treasureX&& x-treasureX<=45 && y>=treasureY && y-treasureY<=45)
                {
                  hpX=hpX+20;
                    treasureX=floor(random(30,500));
                    treasureY=floor(random(50,400));
                    if(hpX>=200){
                   hpX=200;
                }
                }
                 if(x>=treasureX&& x-treasureX<=45 && y<=treasureY && treasureY-y<=45)
                {
                  hpX=hpX+20;
                    treasureX=floor(random(30,500));
                    treasureY=floor(random(50,400));
                     if(hpX>=200){
                   hpX=200;
                     }
                }
                  if(x<=treasureX&& treasureX-X<=45 && y>=treasureY && y-treasureY<=45)
                {
                  hpX=hpX+20;
                    treasureX=floor(random(30,500));
                    treasureY=floor(random(50,400));
                     if(hpX>=200){
                   hpX=200;
                     }
                }
                  if(x<=treasureX&& treasureX-x<=45 && y<=treasureY && treasureY-y<=45)
                {
                  hpX=hpX+20;
                    treasureX=floor(random(30,500));
                    treasureY=floor(random(50,400));
                     if(hpX>=200){
                     hpX=200;
                     }
                }
              
              //enemy
              
              
              counter+=1;
              speed+=4;
              
              int enemyspacingX =-70 ; 
              int enemyspacingY =50 ; 
              
       
              
              if(counter==230){                
               enemyX[0]=0;
               enemyY[0]=floor(random(30,200));
               speed=0;
               aMode=false;
               bMode=true;
                for (int i=0 ; i<COUNT ; i++ ){
                showing[i]=true;
                }
              }
              if(counter==460){ 
               
               enemyX[0]=0;
               enemyY[0]=floor(random(200,300));
               speed=0;
               bMode=false;
               cMode=true;
                  for (int i=0 ; i<COUNT ; i++ ){
                showing[i]=true;
                }
               
               }
              if(counter==690){ 
            
               enemyX[0]=0;
               enemyY[0]=floor(random(30,400));
               speed=0;
               cMode=false;
               aMode=true;
               counter=0; 
               for (int i=0 ; i<COUNT ; i++ ){
                showing[i]=true;
                }
             
              }
              
           
              //5 at a row
              if(aMode){
                  for (int i=0 ; i<COUNT ; i++ ){
                  enemyX[i]=enemyX[0]+i*enemyspacingX;
                  if(showing[i]){
                    
                    if(x>=(enemyX[i]+speed) && x-(enemyX[i]+speed)<=45 && y>=enemyY[0] && y-enemyY[0]<=45){
                       hpX=hpX-40; 
                        showing[i] = false;
                      }
                      if(x>=(enemyX[i]+speed) && x-(enemyX[i]+speed)<=45 && y<=enemyY[0] && enemyY[0]-y<=45){
                        hpX=hpX-40;
                         showing[i] = false;
                      }
                       if((enemyX[i]+speed)>=x && (enemyX[i]+speed)-x<=45 && y>=enemyY[0]&& y-enemyY[0]<=45){
                         hpX=hpX-40;
                          showing[i] = false;
                      }
                       if((enemyX[i]+speed)>=x && (enemyX[i]+speed)-x<=45 && y<=enemyY[0] && enemyY[0]-y<=45){
                         hpX=hpX-40;
                          showing[i] = false;
                      }     
                   
                   }
                    if(showing[i]==true){
                     if(i<=4){
                     image(enemyImg,enemyX[i]+speed,enemyY[0]);
                     }else{
                     showing[i]=false;
                     }
                  }
                               
                  }
              } 
                
              
              // 5 enemy row as '/'
              if(bMode){  
                  for (int i=0 ; i<COUNT ; i++ ){
                  enemyX[i]=enemyX[0]+i*enemyspacingX;
                  enemyY[i]=enemyY[0]+i*enemyspacingY;
                         
                  
                if(showing[i]){
                     if(x>=(enemyX[i]+speed) && x-(enemyX[i]+speed)<=45 && y>=enemyY[i] && y-enemyY[i]<=45){
                       hpX=hpX-40;
                       showing[i] = false;
                      }
                      if(x>=(enemyX[i]+speed) && x-(enemyX[i]+speed)<=45 && y<=enemyY[i] && enemyY[i]-y<=45){
                        hpX=hpX-40;
                         showing[i] = false;
                      }
                       if((enemyX[i]+speed)>=x && (enemyX[i]+speed)-x<=45 && y>=enemyY[i] && y-enemyY[i]<=45){
                         hpX=hpX-40;
                        showing[i] = false;
                      }
                       if((enemyX[i]+speed)>=x && (enemyX[i]+speed)-x<=45 && y<=enemyY[i] && enemyY[i]-y<=45){
                         hpX=hpX-40;
                         showing[i] = false;
                      }
                   }
                   
                    if(showing[i]==true){
                         if(i<=4){
                        image(enemyImg,enemyX[i]+speed,enemyY[i]);
                         }else{
                         showing[i]=false;
                         }
                     }
                 }
              }
              
              // 8 enemy row as '<>'
             
           if(cMode){
            
              for (int i=0 ; i<COUNT ; i++ ){
        
             if(showing[i]){
                           if(x>=(enemyX[i]+speed)&& x-(enemyX[i]+speed)<=45 && y>=enemyY[i] && y-enemyY[i]<=45){
                             hpX=hpX-40; 
                             showing[i] = false;
                            }
                            if(x>=(enemyX[i]+speed) && x-(enemyX[i]+speed)<=45 && y<=enemyY[i] && enemyY[i]-y<=45){
                              hpX=hpX-40;
                               showing[i] = false;
                            }
                             if((enemyX[i]+speed)>=x && (enemyX[i]+speed)-x<=45 && y>=enemyY[i] && y-enemyY[i]<=45){
                               hpX=hpX-40;
                              showing[i] = false;
                            }
                             if((enemyX[i]+speed)>=x && (enemyX[i]+speed)-x<=45 && y<=enemyY[i] && enemyY[i]-y<=45){
                               hpX=hpX-40;
                             showing[i] = false;
                            }
                      }
                       
                            
                if(showing[i]==true){
                  
                          if(i<=4){                           
                            enemyX[i]=enemyX[0]+i*enemyspacingX;
                                if(i<=2){
                                enemyY[i]=enemyY[0]+i*enemyspacingY;
                                }else{
                                enemyY[i]=enemyY[0]+i*enemyspacingY-4*enemyspacingY;
                                }
                              }
                                
                          if(i==5||i==6){
                            enemyX[i]=enemyX[0]+(i-4)*enemyspacingX;
                            enemyY[i]=enemyY[0]-(i-4)*enemyspacingY;
                            }
                          
                           if(i==7){
                              enemyX[i]=enemyX[0]+3*enemyspacingX;
                              enemyY[i]=enemyY[0]+1*enemyspacingY;
                              }
                              
                         image(enemyImg,enemyX[i]+speed,enemyY[i]);    
                      }
                   
                   }
               
               }
       
            //gameOver
            
            if( hpX<=0){         
             
             gameState=GAME_OVER;
            }
            
    break;
    case GAME_OVER:
       image(end2Img,0,0);
       if (210<mouseX &&mouseX<450 && 288<mouseY && mouseY<336  ){
           if(mousePressed){
           gameState = GAME_RUN;
             x=550;
              y=height/2;
              hpX=40;
              counter=0;
              speed=0;
              aMode = true;
              bMode = false;
              cMode = false;         
              enemyX[0]=0;
              enemyY[0]=floor(random(30,400));
              for (int i=0 ; i<COUNT ; i++ ){
                showing[i]=true;
                }
              
           }else{
           image(end1Img,0,0);
           }          
     break;
      
      }
  }
}

void keyPressed(){
  
     if(key==CODED){
      switch(keyCode){
      case UP:
      upPressed=true;
      break;
      case DOWN:
      downPressed=true;
      break;
      case LEFT:
      leftPressed=true;
      break;
      case RIGHT:
      rightPressed=true;
      break;
      }
     }
 
   }

void keyReleased(){
  
     if(key==CODED){
      switch(keyCode){
      case UP:
      upPressed=false;
      break;
      case DOWN:
      downPressed=false;
      break;
      case LEFT:
      leftPressed=false;
      break;
      case RIGHT:
      rightPressed=false;
      break;
      }
     }

 
    
    }
