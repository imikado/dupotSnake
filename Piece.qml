import QtQuick 2.0

Rectangle {
    id:recta
    property int _x:0
    property int _y:0

    color:"transparent"
    width:mainWindow.oGame.calcul(60)
    height:mainWindow.oGame.calcul(60)
    radius: 10

    opacity:1

    AnimatedSprite {
            id: sprite
            width:parent.width
            height:parent.height
            anchors.centerIn: parent
            source: "/images/spriteNode.png"
            frameCount: 3
            frameDuration: 300

            frameWidth:  60
            frameHeight: 60
            interpolate: false
    }

    Behavior on x{
        id:behX
        enabled: false
        NumberAnimation{
            easing.type: Easing.InCirc;
            easing.amplitude: 1.0;
            duration: 300;
        }
    }
    Behavior on y{
        id:behY
        enabled: false
        NumberAnimation{
            easing.type: Easing.InCirc;
            easing.amplitude: 1.0;
            duration: 300;
        }
    }

    function error(){
        color="red";
    }

    function move(x_,y_){

        behX.enabled=true;
        behY.enabled=true;

        var x2=x_*width;
        var y2=y_*height;

        if(x2!==x){
            x=x2;
        }else if(y2!==y){
            y=y2;
        }

        _x=x_;
        _y=y_;
        //x=x_*width;
        //y=y_*width;

        //y+=mainWindow.oGame.calcul(120);

        console.debug('move to x:'+x_+' y'+y_);
    }
}
