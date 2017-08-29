import QtQuick 2.2
import QtGraphicalEffects 1.0


Rectangle{
    id:sceneArea
    visible:true
    color:'#1868b2'
    width:mainWindow.oGame.width
    height:mainWindow.oGame.height

    gradient: Gradient {
            GradientStop { position: 0.0; color: "lightsteelblue" }
            GradientStop { position: 1.0; color: "blue" }
        }

    Text{
        id:oScore
        text:'000000'
        anchors.right: parent.right
        font.pixelSize: mainWindow.oGame.calcul( 30)
        font.bold: true
        color:"white"
    }
    DropShadow {
        anchors.fill: oScore
        horizontalOffset: 3
        verticalOffset: 3
        radius: 1.0
        samples: 8
        color: "#80000000"
        source: oScore
    }

    function score(text_){
        text_='0000000'+text_;
        oScore.text=text_.substr(-6);
    }



    Joystick{
        x:0
        y:0
        width:parent.width
        height:parent.height

    }

}



