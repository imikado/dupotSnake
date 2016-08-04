import QtQuick 2.0

Rectangle {
    id:recta
    property int _x:0
    property int _y:0

    width:mainWindow.oGame.calcul(60)
    height:mainWindow.oGame.calcul(60)
    color:"transparent"

    AnimatedSprite {
            id: sprite
            width:parent.width
            height:parent.height
            anchors.centerIn: parent
            source: "/images/ballSprite.png"
            frameCount: 3
            frameDuration: 1000

            frameWidth:  60
            frameHeight: 60
            interpolate: true
    }

    AnimatedSprite {
            id: sprite2
            width:parent.width
            height:parent.height
            anchors.centerIn: parent
            source: "/images/ballSprite2.png"
            frameCount: 2
            frameDuration: 500
            loops: 1
            frameWidth:  60
            frameHeight: 60
            interpolate: true
            visible: false
            enabled: false
            running: false

            onRunningChanged:{
                if (!running) {
                   die2();
                }


            }

    }




    function move(x_,y_){

        _x=x_;
        _y=y_;

        var x=x_*width;
        var y=y_*height;


    }
    function die(){
        sprite2.start();
        sprite2.visible=true;
        console.debug('die');
        //destroy();
    }
    function die2(){
        destroy();
    }
}
