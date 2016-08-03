import QtQuick 2.0

Rectangle{
    visible:true
    color:'#d95e22'
    opacity:1.0;

    width:mainWindow.oGame.width
    height:mainWindow.oGame.height

    Image{
        id:logo
        width:mainWindow.oGame.calcul(237)
        height:mainWindow.oGame.calcul(105)
        source:"/images/logoMobileDupot.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Timer {
       id:timerSplashscreen
       interval: 4000;
       running: false
       repeat: false
       onTriggered: mainWindow.oGame.pageMenu();
    }
    Behavior on opacity {
        NumberAnimation {
            id:animationSplashscreen
            duration: 800
            easing.type: Easing.InCurve;

            onRunningChanged: {
               if (animationSplashscreen.running === false) {
                 visible=false;
               }
           }
        }

    }


    function display(){
        visible=true;
        opacity=1;
        logo.opacity=1;

        timerSplashscreen.running=true;
        timerSplashscreen.start();
    }
    function hide(){
        opacity=0;
        logo.opacity=0;

        timerSplashscreen.running=false;
        timerSplashscreen.stop();
    }
}


