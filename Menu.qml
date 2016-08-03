import QtQuick 2.0
import QtQuick.Controls 1.5


Rectangle {
    visible:true
    color: "#ffffff"
    width:mainWindow.oGame.width
    height:mainWindow.oGame.height


    Image{
        source:"/images/startGame.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        width:mainWindow.oGame.calcul(400)
        height:mainWindow.oGame.calcul(650)

        Bouton{
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            _width: mainWindow.oGame.calcul(291)
            _height: mainWindow.oGame.calcul(33)
            _text: qsTr("Jouer!")
            _link:mainWindow.oGame.pageGameStart
        }


        /*Button {
            id: button1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            width: mainWindow.oGame.calcul(291)
            height: mainWindow.oGame.calcul(33)
            text: qsTr("Jouer!")
            smooth: true


            onClicked:mainWindow.oGame.pageGameStart()
        }*/
    }
}


