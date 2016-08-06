import QtQuick 2.3
import QtQuick.Window 2.2


import "/js/game.js" as Game

Window{
    id:mainWindow
    visible: true



    property var oGame

    contentOrientation :Qt.PortraitOrientation

    Rectangle{
        id:canvas
        color:"#ff22ff"
    }

    function initApplication(){
        oGame=Game;
        oGame.start(Screen.width,Screen.height);
        //oGame.start(400,650);

        width=mainWindow.oGame.width;
        height=mainWindow.oGame.height;

        canvas.width=width;
        canvas.height=height;
    }



    Component.onCompleted: initApplication()

    Timer{
        id:tickTimer
        interval: 1000;
        running: false
        repeat: true
        onTriggered: mainWindow.oGame.tick();
    }
}
