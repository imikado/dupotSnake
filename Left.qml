import QtQuick 2.0

Item{

    width:mainWindow.oGame.calcul(80)
    height:mainWindow.oGame.calcul(80)


    Rectangle{
        id:rect1
        color:"#223322"
        width:mainWindow.oGame.calcul(80)
        height:mainWindow.oGame.calcul(40)


        MouseArea{
            anchors.fill: parent
            onClicked:mainWindow.oGame.clickUp()
        }
    }
    Rectangle{
        id:rect2
        color:"#443366"
        width:mainWindow.oGame.calcul(80)
        height:mainWindow.oGame.calcul(40)

        anchors.top:rect1.bottom

        MouseArea{
            anchors.fill: parent
            onClicked:mainWindow.oGame.clickDown()
        }


    }
}
