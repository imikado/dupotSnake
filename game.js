var width;
var height;


var originalWidth=480;
var originalHeight=680;



var global_iScore=0;

var global_deltaY=0;

var global_iter=0;

var iRatio;

var oPageSplashscreen;
var oPageMenu;
var oPageScene;
var oPageGameover;

var global_oPiece;

var global_tPositionSnake=Array();
var global_oBall=null;

var global_maxX2=parseInt(originalWidth/60);
var global_maxY2=parseInt(originalHeight/60);


console.debug('maxX2:'+global_maxX2+' max y'+global_maxY2);

function savePositionSnake(){
    global_tPositionSnake=Array();

    global_tPositionSnake.push( {'x2':global_oPiece.getX2(),'y2':global_oPiece.getY2(),'error':1} );
    for(var iNode in global_oPiece._tNode){
        var error=0;
        if(global_oPiece._tNode[iNode].getX2()===global_oPiece.getX2() && global_oPiece._tNode[iNode].getY2()===global_oPiece.getY2()){
            error=1;
        }

        global_tPositionSnake.push({'x2':global_oPiece._tNode[iNode].getX2(),'y2':global_oPiece._tNode[iNode].getY2(),'error':error}  );
    }
}
function placeSnakeOnGameOver(){
    for(var iNode in global_tPositionSnake){
        console.debug(global_tPositionSnake[iNode].x2+' '+global_tPositionSnake[iNode].y2);


        var oPieceGO=new PieceGameOver(global_tPositionSnake[iNode].x2,global_tPositionSnake[iNode].y2,global_tPositionSnake[iNode].error);
    }
}

function start(width_,height_){


    if(width_> height_){
        width=height_*(this.originalWidth/this.originalHeight)
    }else{
        width=width_;
    }

    height=width*(this.originalHeight/this.originalWidth);
    if(height<height_){
        height=height_;
    }

    iRatio=this.width/this.originalWidth;

    this.pageSplashscreen();


}
function ComponentQml(src_,x_,y_){
    this.oComponent =   Qt.createComponent( src_);
    this.object=this.oComponent.createObject(canvas,{"x": x_, "y": y_});

    if( this.oComponent.status === Component.Error ){
        console.debug("Error:"+ this.oComponent.errorString() );
    }
}

function PieceGameOver(x_,y_,error_){


    this.oComponent =   Qt.createComponent('/Piece.qml' );
    this.object=this.oComponent.createObject(oPageGameover.object,{"x": x_*calcul(60), "y": y_*calcul(60)});

    if(error_===1){
        this.object.error();
    }

    if( this.oComponent.status === Component.Error ){
        console.debug("Error:"+ this.oComponent.errorString() );
    }
}



function scoreUp(){

    global_iScore+=10;
    oPageScene.object.score(global_iScore);
}


function startParty(){

    global_oPiece=new Piece(2,3);

    global_oBall=null;

    tickTimer.start();


}

function getIntRandom( max_) {
  return Math.floor(Math.random() * (max_ )) ;
}

function tick(){

    var prevX=global_oPiece.getLastX2();
    var prevY=global_oPiece.getLastY2();


    global_oPiece.run();

    global_iter+=1;

    if(!global_oBall && (global_iter%5)===0){
        //global_oPiece.addNode(prevX,prevY);

        if(global_oBall){
            global_oBall.die();
        }




        global_oBall=new Ball(getIntRandom(global_maxX2),getIntRandom(global_maxY2));

        //scoreUp();
    }
}

function clickLeft(){
    global_oPiece._side='left';
}
function clickRight(){
    global_oPiece._side='right';
}
function clickUp(){
    global_oPiece._side='up';
}
function clickDown(){
    global_oPiece._side='down';
}


function calcul(iValue_){
    return (iValue_*iRatio);
}

function pageSplashscreen(){
    oPageSplashscreen=new ComponentQml('/Splashscreen.qml',0,0);
    oPageSplashscreen.object.display();
}
function pageMenu(){
    resetPages();
    oPageMenu=new ComponentQml('/Menu.qml',0,0);
}
function pageGameStart(){
    resetPages();
    oPageScene=new ComponentQml('/Scene.qml',0,0);

    startParty();
}
function pageGameOver(){
    tickTimer.stop();

    savePositionSnake();

    resetPages();
    oPageGameover=new ComponentQml('/GameOver.qml',0,0);
    oPageGameover.object.score(global_iScore);

    placeSnakeOnGameOver();

}

function resetPages(){
    if(oPageSplashscreen ){
        oPageSplashscreen.object.destroy();
        oPageSplashscreen=null;
    }
    if(oPageMenu){
        oPageMenu.object.destroy();
        oPageMenu=null;
    }
    if(oPageScene){
        oPageScene.object.destroy();
        oPageScene=null;
    }
    if(oPageGameover){
        oPageGameover.object.destroy();
        oPageGameover=null;
    }
}


//---------------
//-------enemy

function Ball(x_,y_){


    var x2=x_*calcul(60);
    var y2=y_*calcul(60);

    this.oComponent =   Qt.createComponent( "/Ball.qml");
    this.object=this.oComponent.createObject(oPageScene.object,{"x": x2, "y": y2,"_x":x_,"_y":y_});

    if( this.oComponent.status === Component.Error ){
        console.debug("Error:"+ this.oComponent.errorString() );
    }

    this.getX2=function(){
        return this.object._x;
    }
    this.getY2=function(){
        return this.object._y;
    }

    this.die=function (){
        this.object.die();
    }

}

function Piece(x_,y_){

    var x2=x_*calcul(60);
    var y2=y_*calcul(60);
    y2+=calcul(global_deltaY);

    this._side='right';

    this._tNode=Array();


    this.oComponent =   Qt.createComponent( "/Piece.qml");
    this.object=this.oComponent.createObject(oPageScene.object,{"x": x2, "y": y2,"_x":x_,"_y":y_});



    if( this.oComponent.status === Component.Error ){
        console.debug("Error:"+ this.oComponent.errorString() );
    }


    this.run=function(){
        var prevX=this.getX2();
        var prevY=this.getY2();

        if(this._side==='right'){
            this.move(this.getX2()+1,this.getY2());
        }else if(this._side==='left'){
            this.move(this.getX2()-1,this.getY2());
        }else if(this._side==='up'){
            this.move(this.getX2(),this.getY2()-1);
        }else if(this._side==='down'){
            this.move(this.getX2(),this.getY2()+1);
        }

        var tmpArray=Array();
        for(var iNode1 in this._tNode){
            tmpArray[iNode1]={'x2':this._tNode[iNode1].getX2(),'y2':this._tNode[iNode1].getY2()};

        }

        for(var iNode in this._tNode){


            if(iNode==="0"){
                this._tNode[iNode].move(prevX,prevY);
             }else{
                this._tNode[iNode].move(  tmpArray[iNode-1].x2 ,tmpArray[iNode-1].y2);


            }


        }
    }

    this.checkTarget=function(x_,y_){
        var tmpWith=calcul(60);
        var tmpHeight=calcul(60);

        var x2=x_*tmpWith;
        var y2=y_*tmpHeight;

        if((x2+tmpWith) > width || x2 < 0 || (y2+tmpHeight)>height || y2<0){

            pageGameOver();


            return false;
        }

        for(var iNode in this._tNode){
            if(this._tNode[iNode].getX2()===x_ && this._tNode[iNode].getY2()===y_){
                console.debug('collision node: '+iNode+' x'+x_+' y'+y_);

                var prevPos=new Node(this.getX2(),this.getY2());
                this._tNode.push(prevPos);


                this.object.move(x_,y_)
                pageGameOver();
                return false;
            }
        }

        if(global_oBall && x_===global_oBall.getX2() && y_===global_oBall.getY2()  ){

            global_oBall.die();
            global_oBall=null;
            scoreUp();
            this.addNode(this.getLastX2(),this.getLastY2());
        }


        return true;
    }

    this.move=function(x_,y_){

        //check target
        if(this.checkTarget(x_,y_)){

            this.object.move(x_,y_);
        }
    }

    this.getLastX2=function(){
        if(this._tNode.length){
            return this._tNode[this._tNode.length-1].getX2();
        }else{
            return this.getX2();
        }
    }
    this.getLastY2=function(){
        if(this._tNode.length){
            return this._tNode[this._tNode.length-1].getY2();
        }else{
            return this.getY2();
        }
    }

    this.getX2=function(){
        return this.object._x;
    }
    this.getY2=function(){
        return this.object._y;
    }

    this.addNode=function(x_,y_){
        var oNode=new Node(x_,y_);
        this._tNode.push(oNode);
    }

}
function Node(x_,y_){

    console.debug('addNode x'+x_+' y'+y_);

    var x2=x_*calcul(60);
    var y2=y_*calcul(60);
    y2+=calcul(global_deltaY);


    this.oComponent =   Qt.createComponent( "/Piece.qml");
    this.object=this.oComponent.createObject(oPageScene.object,{"x": x2, "y": y2,"_x":x_,"_y":y_});

    this.getX2=function(){
        return this.object._x;
    }
    this.getY2=function(){
        return this.object._y;
    }
    this.move=function(x_,y_){
        this.object.move(x_,y_);
    }

}


