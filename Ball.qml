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
            frameDuration: 300

            frameWidth:  60
            frameHeight: 60
            interpolate: false
    }

    AnimatedSprite {
            id: sprite2b
            width:parent.width
            height:parent.height
            anchors.centerIn: parent
            source: "/images/ballSprite2.png"

            frameCount: 3
            frameDuration: 300

            frameWidth:  60
            frameHeight: 60
            interpolate: false

            loops: 1;

            enabled: false;
            visible: false;

            onRunningChanged:{
                if (!running) {
                   die2();
                }else{
                    console.log('still running');
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
        sprite.visible=false;

       sprite2b.visible=true;
        sprite2b.start();

        //die2();

        console.debug('die');

    }
    function die2(){

        console.debug('die 2');
        destroy();
    }
}
