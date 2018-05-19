//
// Simple Tetris Game for further tweaking.
//
// author: Thomas Diewald, 2017
// web: http://thomasdiewald.com
//
// This version is a direct 1 to 1 port of my processing sketch in java.
//
//
// Video of this version with some radiosity:
// https://vimeo.com/243877934
//

var shapelist = 
  [
    [   8    
    ],
    [   0, 2, 
        2, 2, 
    ],
    [  
        7, 7, 
        7, 7,    
    ],
    [   0, 3, 0, 
        3, 3, 3, 
        0, 3, 0, 
    ],
    [   0, 2, 0, 
        0, 2, 0, 
        0, 2, 2, 
    ],
    [   0, 4, 0, 
        0, 4, 0, 
        4, 4, 0, 
    ],
    [   4, 4, 0, 
        0, 4, 4, 
        0, 0, 0, 
    ],
    [   0, 5, 5, 
        5, 5, 0, 
        0, 0, 0, 
    ],
    [  
        0, 0, 0, 
        6, 6, 6, 
        0, 6, 0, 
    ],
    [   0, 0, 0, 
        7, 7, 7, 
        7, 0, 7, 
    ],
    [   0, 0, 1, 0, 
        0, 0, 1, 0, 
        0, 0, 1, 0, 
        0, 0, 1, 0, 
    ],
];



var pallette_mono = [];
var pallette = [
    [255,255,255], // 0, void
    [255, 32,  0], // 1
    [255,224,  0], // 2
    [255,  0, 96], // 3
    [ 32,255,  0], // 4
    [ 16,128,255], // 5
    [255, 96, 16], // 6
    [  0,196,255], // 7
    [128,  0,255], // 8 
];




function setup() { 
  createCanvas(720, 720);
  this.tetris = new TetrisGame(11, 21);
  this.timer = new Timer();
  frameRate(120);
  
  
  var mix = 0.80;
  pallette_mono = [];
  for(var i = 0; i < pallette.length; i++){
    var rgb = pallette[i];
    var gray = (rgb[0] + rgb[1] + rgb[2]) / 3.0; 
    pallette_mono[i] = [];
    pallette_mono[i][0] = 255 * (1-mix) + gray * mix;
    pallette_mono[i][1] = 255 * (1-mix) + gray * mix;
    pallette_mono[i][2] = 255 * (1-mix) + gray * mix;
  }
  
} 


function draw(){
  
  if(this.timer.updateStep()){
    applyInput(25);
  }
      
  this.tetris.update();
  this.tetris.display(this);
}


function genRandomShape(){
  var len = 9;
  var shp = []; shp.length = len;
  var lut = []; lut.length = len;

  for(var i = 0; i < len; i++){
    lut[i] = i;
    shp[i] = 0;
  }
  
  var idx_pallette = 1 + parseInt(random(pallette.length-1));
  var filled = 1 + parseInt(random(len-1));

  for(var i = 0; i < filled; i++){
    var idx_lut = parseInt(random(len - i));
    var idx = lut[idx_lut];
    lut[idx_lut] = lut[len - 1 - i];

    shp[idx] = idx_pallette;
  }
  
  return shp;
}


var keypress_UP    = false;
var keypress_DOWN  = false;
var keypress_LEFT  = false;
var keypress_RIGHT = false;


function applyInput(new_delay){
  if(this.tetris.pause) return;
    
  if(keypress_UP   ) this.tetris.rotate = true;
  if(keypress_DOWN ) this.tetris.ty = +1;
  if(keypress_LEFT ) this.tetris.tx = -1;
  if(keypress_RIGHT) this.tetris.tx = +1;

  this.timer.reset(new_delay);
}


function keyPressed(){
  if(key == 'P') this.tetris.pause = !this.tetris.pause;
  if(key == 'R') this.tetris.restart = true;
  
  // WASD / ARROW
  keypress_UP    |= (key === 'W') || (keyCode === UP_ARROW   ) || (keyCode === 32);
  keypress_DOWN  |= (key === 'S') || (keyCode === DOWN_ARROW );
  keypress_LEFT  |= (key === 'A') || (keyCode === LEFT_ARROW );
  keypress_RIGHT |= (key === 'D') || (keyCode === RIGHT_ARROW);

  applyInput(200);
}


function keyReleased(){
  // WASD / ARROW   
  keypress_UP    ^= (key === 'W') || (keyCode === UP_ARROW   ) || (keyCode === 32);
  keypress_DOWN  ^= (key === 'S') || (keyCode === DOWN_ARROW );
  keypress_LEFT  ^= (key === 'A') || (keyCode === LEFT_ARROW );
  keypress_RIGHT ^= (key === 'D') || (keyCode === RIGHT_ARROW);
}








class TetrisGame {
  
  constructor(nx, ny){
    this.tgrid = new TGrid(nx, ny);
    this.timer = new Timer();

    this.restartGame();
    
    this.random_shape_chance = 0.01; // set this to 0, to skip random shapes
    this.shape_next = undefined;
    this.pickNextShape();
  }
  
  
  restartGame(){
    this.tgrid.clearGrid();
    this.restart = false;
    this.pause = false;
    this.game_over = false;
    this.spawn = true;
    

    
    this.rotate = false;
    this.tx = this.ty = 0;
    
    this.level = 1;
    this.rows_per_level = 5;
    this.rows_completed = 0;
    this.shapes_count = 0;
    
    this.timer.reset(600);
  }
  
  
  pickNextShape(){
    this.shape_curr = this.shape_next;
    
    if(random(1) < this.random_shape_chance){
      this.shape_next = genRandomShape();
    } else {
      var idx_next = parseInt(random(shapelist.length));
      this.shape_next = shapelist[idx_next].slice();
    }
  }

  
  update(){
    
    if(this.restart){
      this.restartGame();
    }
    
    if(this.pause){
      return;
    }
    
    // spawn new shape
    if(this.spawn){
      this.pickNextShape();
      this.tgrid.setShape(this.shape_curr);
      this.shapes_count++;
      this.spawn = false;
    }
    
    // update level/rows/difficulty
    this.level += floor(this.rows_completed / this.rows_per_level);
    this.rows_completed %= this.rows_per_level;
    this.timer.duration = ceil(800 / sqrt(this.level));

    // game over check
    this.game_over = this.tgrid.collision(0, 0);
    if(this.game_over){
      return;
    }

    // apply user input: transforms
    if(this.rotate) this.tgrid.rotateShape();
    if(!this.tgrid.collision(this.tx, 0)) this.tgrid.sx += this.tx;
    if(!this.tgrid.collision(0, this.ty)) this.tgrid.sy += this.ty;
    
    // apply game step
    if(this.timer.updateStep()){
      if(!this.tgrid.collision(0, 1)){
        if(this.ty == 0){
          this.tgrid.sy++;
        }
      } else {
        this.tgrid.splatShape();
        this.rows_completed += this.tgrid.updateRows();
        this.spawn = true;
      }
    }
    
    // reset transforms
    this.rotate = false;
    this.tx = this.ty = 0;

  }
  
  
  display(canvas){
    var off, x, y, w, h, cell;
    var canvas_w = canvas.width;
    var canvas_h = canvas.height;
    
    off = 40;
    h = canvas_h - 2 * off;
    w = canvas_w - 2 * off;
    cell = ceil(Math.min(w / this.tgrid.nx, h / this.tgrid.ny));
    w = this.tgrid.nx * cell;
    h = this.tgrid.ny * cell;
    x = parseInt((canvas_w - w) / 2.0);
    y = parseInt((canvas_h - h) / 2.0);
    
    canvas.background(32);
    canvas.strokeWeight(1);
    canvas.noStroke();
    canvas.fill(16);
    canvas.rect(x-4,y-4,w+8,h+8);
    canvas.fill(32);
    canvas.rect(x-1,y-1,w+3,h+3);
    
    // game screen
    var colors = (this.pause || this.game_over) ? pallette_mono : pallette;
    this.displayGameGrid(canvas, x, y, w ,h, colors);
    
    // shape preview
    {
      var w_ = x - 2 * off;
      var h_ = canvas_h - 2 * off;
      var y_ = off;
      var x_ = off + x + w;
      this.displayNextShape(canvas, x_, y_, w_ ,h_);
    }
    
    // text - header
    {
      var ty = off + 12;
      var tx1 = x + w + x/2;
      var txt1_title = "TETRIS '17";
      var txt2_title = "by Thomas Diewald";
      canvas.textAlign(CENTER, CENTER);
      canvas.noStroke();
      canvas.textSize(24);
      canvas.fill(200);
      canvas.text(txt1_title, tx1, ty);
      canvas.textSize(12);
      canvas.fill(96);
      canvas.text(txt2_title, tx1, ty + 22);
    }
    
    // text - game level, ... 
    {
      var progress = round(100 * this.rows_completed / this.rows_per_level);
      var ty = canvas_h/2 -130;
      var tx1 = x + w + x/2;
      var txt_level    = "LEVEL "+this.level;
      var txt_progress = "ROW "+this.rows_completed+"/"+this.rows_per_level;
      var txt_shapes   = "SHAPE "+this.shapes_count;
      canvas.textAlign(CENTER, CENTER);
      canvas.noStroke();
      canvas.fill(200);
      canvas.textSize(18);
      canvas.text(txt_level, tx1, ty);
      canvas.fill(96);
      canvas.textSize(12);
      canvas.text(txt_progress, tx1, ty+=24);
      canvas.text(txt_shapes, tx1, ty+=16);
    }
    
    // text - game status 
    var txt_game_status = undefined;
    if(this.game_over) txt_game_status = "GAME OVER";
    if(this.pause    ) txt_game_status = "PAUSE";
    
    if(txt_game_status !== undefined){
      canvas.textSize(48);
      canvas.textAlign(CENTER, CENTER);
      canvas.noStroke();
      canvas.fill(  0,   0, 0); canvas.text(txt_game_status, canvas_w/2+2, canvas_h/2+1);
      canvas.fill(255, 224, 0); canvas.text(txt_game_status, canvas_w/2  , canvas_h/2  );
    }
    
    // text - controlls
    {
      var ty = canvas_h - 6 * 15 - off;
      var tx1 = x + w + 30;
      var tx2 = tx1 + 60;
      canvas.textAlign(LEFT);
      canvas.noStroke();
      canvas.textSize(10);
      canvas.fill(96);
      canvas.text("W / UP"   , tx1, ty);  canvas.text("- ROTATE"    , tx2, ty);  ty += 15;
      canvas.text("A / LEFT" , tx1, ty);  canvas.text("- MOVE LEFT" , tx2, ty);  ty += 15;
      canvas.text("D / RIGHT", tx1, ty);  canvas.text("- MOVE RIGHT", tx2, ty);  ty += 15;
      canvas.text("S / DOWN" , tx1, ty);  canvas.text("- MOVE DOWN" , tx2, ty);  ty += 25;
      canvas.text("P"        , tx1, ty);  canvas.text("- PAUSE"     , tx2, ty);  ty += 15;
      canvas.text("R"        , tx1, ty);  canvas.text("- RESTART"   , tx2, ty);  ty += 15;
    }
  }
  
  
  displayGameGrid(pg, x, y, w, h, pallette){
    
    var nx = this.tgrid.nx;
    var ny = this.tgrid.ny;
    
    var cw = w / nx;
    var ch = h / ny;
    
    // BG tiles
    for(var gy = 0; gy < ny; gy++){
      for(var gx = 0; gx < nx; gx++){
        var cx = x + gx * cw;
        var cy = y + gy * ch;
        pg.stroke(48);
        if(((gx)&1) == 1){
          pg.fill(64);
        } else {
          pg.fill(72);
        }
        pg.rect(cx, cy, cw, ch);
      }
    }
    
    // FG tiles
    for(var gy = 0; gy < ny; gy++){
      for(var gx = 0; gx < nx; gx++){
        var cx = x + gx * cw;
        var cy = y + gy * ch;
        
        var val_grid = this.tgrid.getGridVal(gx, gy);
        if(val_grid > 0){
          pg.stroke(0);
          var rgb = pallette[val_grid % pallette.length];
          pg.fill(rgb[0], rgb[1], rgb[2]);
          pg.rect(cx, cy, cw, ch);
        } 
      }
    }
    
    // shape tiles
    var ks = this.tgrid.shape_size;
    var kr = ceil(this.tgrid.shape_size / 2.0);

    for(var ky = 0; ky < ks; ky++){
      for(var kx = 0; kx < ks; kx++){
        var gx = this.tgrid.sx + kx - kr;
        var gy = this.tgrid.sy + ky - kr; 
        var cx = x + gx * cw;
        var cy = y + gy * ch;

        var val_shape = this.tgrid.getShapeVal(kx, ky);
        if(val_shape != 0){
          pg.stroke(0);
          var rgb = pallette[val_shape % pallette.length];
          pg.fill(rgb[0], rgb[1], rgb[2]);
          pg.rect(cx, cy, cw, ch);
        } 
      }
    }
     
  }
  
  
  displayNextShape(pg, x, y, w, h){

    var shape = this.shape_next;
    var shape_size = parseInt(sqrt(shape.length));
    
    var ks = shape_size;
    var kr = shape_size / 2.0;
    
    var cw = min(w / 5.0, h / 5.0);
    var ch = cw;
    

    for(var ky = 0; ky < ks; ky++){
      for(var kx = 0; kx < ks; kx++){
        var gx = kx - kr;
        var gy = ky - kr; 
        var cx = x + gx * cw + w/2.0;
        var cy = y + gy * ch + h/2.0;
        
        cx = parseInt(cx);
        cy = parseInt(cy);
        
        var val_shape = shape[ky * shape_size + kx];
        if(val_shape != 0){
          pg.fill(200);
        } else {
          pg.fill(32);
        }
        pg.stroke(64);
        pg.rect(cx, cy, cw, ch);
      }
    }
    
  }
  
}





class Timer {
  
  constructor(){
    this.duration = 600;
    this.time = 0;
  }
  
  reset(duration){
    this.setTime();
    this.duration = duration;
  }
  
  setTime(){
    this.time = millis();
  }
  
  getTime(){
    return millis() - this.time;
  }
  
  updateStep(){
    if(this.getTime() >= this.duration){
      this.setTime();
      return true;
    }
    return false;
  }
  
}




class TGrid {

  constructor(nx, ny){
    this.nx = nx;
    this.ny = ny;
    this.grid = []; 
    this.grid.length = nx * ny;
    this.clearGrid();
    this.setShape([0]);
  }
 
  setShape(shape){
    this.shape = shape;
    this.shape_size = parseInt(sqrt(shape.length));
    
    this.sx = ceil(this.nx         / 2);
    this.sy = ceil(this.shape_size / 2);
  }
  
  clearGrid(){
    for(var i = 0; i < this.grid.length; i++){
      this.grid[i] = 0;
    }
  }
  
  isInsideGrid(x, y){
    return x >= 0 && x < this.nx && y >= 0 && y < this.ny;
  }
  
  getGridVal(x, y){
    if(!this.isInsideGrid(x, y)){
      return -1;
    } else {
      return this.grid[y * this.nx + x];
    }
  }
  
  getShapeVal(x, y){
    return this.shape[y * this.shape_size + x];
  }
  
  setGridVal(x, y, val){
    this.grid[y * this.nx + x] = val;
  }
  

  //  IMG      CCW      CW
  //  0 1 2    2 5 8    6 3 0
  //  3 4 5    1 4 7    7 4 1
  //  6 7 8    0 3 6    8 5 2
  rotateShapeDir(CW){

    var size = this.shape_size;
    var cpy = this.shape.slice(0);

    if(CW){
      var ib = 0, ia = size * size;
      for(var y = 1; y <= size; y++, ia++){
        for(var x = 1; x <= size; x++, ib++){
          this.shape[ib] = cpy[ia - x * size];
        }
      }
    } else {
      var ib = 0, ia = -1;
      for(var y = 1; y <= size; y++, ia--){
        for(var x = 1; x <= size; x++, ib++){
          this.shape[ib] = cpy[ia + x * size];
        }
      }
    }
  }
  
  
  rotateShape(){
    this.rotateShapeDir(true);
    if(this.collision(0, 0)){
      this.rotateShapeDir(false);
    }
  }


  collision(tx, ty){
    var ks = this.shape_size;
    var kr = ceil(this.shape_size / 2);
    for(var ky = 0; ky < ks; ky++){
      for(var kx = 0; kx < ks; kx++){
        var px = this.sx + kx - kr + tx;
        var py = this.sy + ky - kr + ty;

        var val_grid  = this.getGridVal (px, py);
        var val_shape = this.getShapeVal(kx, ky);
        if(val_grid * val_shape != 0){
          return true;
        }
      }
    }
    
    return false;
  }
  

  updateRows(){
    var rows = 0;
    for(var gy = 0; gy < this.ny; gy++){
      var row_completed = true;
      for(var gx = 0; gx < this.nx; gx++){  
        var gi = gy * this.nx + gx;
        if(this.grid[gi] == 0) row_completed = false;
      }
      
      if(row_completed){
        this.grid.copyWithin(this.nx, 0, gy * this.nx)
        rows++;
      }
    }
    
    // completely clear first row just to be sure
    if(rows > 0){
      for(var gx = 0; gx < this.nx; gx++){ 
        this.grid[gx] = 0;
      }
    }
    
    return rows;
  }
  
  
  splatShape(){
    var ks = this.shape_size;
    var kr = ceil(this.shape_size / 2);
    for(var ky = 0; ky < ks; ky++){
      for(var kx = 0; kx < ks; kx++){
        var px = this.sx + kx - kr;
        var py = this.sy + ky - kr;
        
        var val_shape = this.getShapeVal(kx, ky);
        if(val_shape != 0){
          this.setGridVal(px, py, val_shape);
        } 
      }
    }
  }
  

}