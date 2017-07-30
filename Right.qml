import QtQuick 2.0

Item{

    width:mainWindow.oGame.calcul(180)
    height:mainWindow.oGame.calcul(180)


    Rectangle{
        id:rect1
        color:"#131564"
        width:mainWindow.oGame.calcul(90)
        height:mainWindow.oGame.calcul(180)
        radius: mainWindow.oGame.calcul(20)

        Image{
            source: "/images/btnLeft.png"

            width:parent.width- mainWindow.oGame.calcul(40)
            height: parent.height- mainWindow.oGame.calcul(40)
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter:  parent.verticalCenter;
        }

        MouseArea{
            anchors.fill: parent
            onPressed:clickBtnLeft()
        }

        SequentialAnimation on color {
            loops: 1
            id:rect1Anim;
            running:false;
            ColorAnimation { from: "#131564"; to: "#991600"; duration: 200 }
            ColorAnimation { from: "#991600"; to: "#131564"; duration: 500 }
        }

    }
    Rectangle{
        id:rect2
        color:"#131564"
        width:mainWindow.oGame.calcul(90)
        height:mainWindow.oGame.calcul(180)
        radius: mainWindow.oGame.calcul(20)

        anchors.left:rect1.right

        anchors.leftMargin: mainWindow.oGame.calcul(2);


        Image{
            source: "/images/btnRight.png"

            width:parent.width- mainWindow.oGame.calcul(40)
            height: parent.height- mainWindow.oGame.calcul(40)
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter:  parent.verticalCenter;
        }

        MouseArea{
            anchors.fill: parent
            onPressed:clickBtnRight()
        }

        SequentialAnimation on color {
            loops: 1
            id:rect2Anim;
            running:false;
            ColorAnimation { from: "#131564"; to: "#991600"; duration: 200 }
            ColorAnimation { from: "#991600"; to: "#131564"; duration: 500 }

        }

    }

    function clickBtnLeft(){
        mainWindow.oGame.clickLeft();

        rect1Anim.start();
    }

    function clickBtnRight(){
        mainWindow.oGame.clickRight();

        rect2Anim.start();
    }

}
