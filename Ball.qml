import QtQuick 2.0

Rectangle {
    id:recta
    property int _x:0
    property int _y:0

    color:"yellow"
    width:mainWindow.oGame.calcul(60)
    height:mainWindow.oGame.calcul(60)
    radius: 20

    opacity:0.8

    function move(x_,y_){

        _x=x_;
        _y=y_;

        var x=x_*width;
        var y=y_*height;


    }
    function die(){
        destroy();
    }
}
