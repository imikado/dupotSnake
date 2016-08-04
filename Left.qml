import QtQuick 2.0

Item{

    width:mainWindow.oGame.calcul(80)
    height:mainWindow.oGame.calcul(80)


    Rectangle{
        id:rect1
        color:"transparent"
        width:mainWindow.oGame.calcul(80)
        height:mainWindow.oGame.calcul(40)


        Image{
            source: "/images/btnUp.png"

            width:parent.width
            height: parent.height
        }

        MouseArea{
            anchors.fill: parent
            onClicked:mainWindow.oGame.clickUp()
        }
    }
    Rectangle{
        id:rect2
        color:"transparent"
        width:mainWindow.oGame.calcul(80)
        height:mainWindow.oGame.calcul(40)

        anchors.top:rect1.bottom

        Image{
            source: "/images/btnDown.png"

            width:parent.width
            height: parent.height
        }

        MouseArea{
            anchors.fill: parent
            onClicked:mainWindow.oGame.clickDown()
        }


    }
}
