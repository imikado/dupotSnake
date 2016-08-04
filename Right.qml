import QtQuick 2.0

Item{

    width:mainWindow.oGame.calcul(80)
    height:mainWindow.oGame.calcul(80)


    Rectangle{
        id:rect1
        color:"transparent"
        width:mainWindow.oGame.calcul(40)
        height:mainWindow.oGame.calcul(80)

        Image{
            source: "/images/btnLeft.png"

            width:parent.width
            height: parent.height
        }

        MouseArea{
            anchors.fill: parent
            onClicked:mainWindow.oGame.clickLeft()
        }

    }
    Rectangle{
        id:rect2
        color:"transparent"
        width:mainWindow.oGame.calcul(40)
        height:mainWindow.oGame.calcul(80)

        anchors.left:rect1.right

        Image{
            source: "/images/btnRight.png"

            width:parent.width
            height: parent.height
        }

        MouseArea{
            anchors.fill: parent
            onClicked:mainWindow.oGame.clickRight()
        }

    }
}
