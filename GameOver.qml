import QtQuick 2.0
import QtGraphicalEffects 1.0


Rectangle {
    id:rect
    width:parent.width
    height:parent.height
    color:"#222222"

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
    Bouton{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        _width: mainWindow.oGame.calcul(291)
        _height: mainWindow.oGame.calcul(33)
        _text: qsTr("Re-Jouer!")
        _link:mainWindow.oGame.pageGameStart
    }
    function score(text_){
        text_='0000000'+text_;
        oScore.text=text_.substr(-6);
    }


    function display(sColor){
        team._color=sColor
        team.display();

        if(sColor==='W'){
            rect.color="#5a0060";
        }else{
            rect.color="#007382";
        }
    }
}
