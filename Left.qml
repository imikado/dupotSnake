import QtQuick 2.0

Item{


    width:mainWindow.oGame.calcul(180)
    height:mainWindow.oGame.calcul(180)


    Rectangle{
        id:rect1
        color:"#131564"
        width:mainWindow.oGame.calcul(180)
        height:mainWindow.oGame.calcul(90)
        radius: mainWindow.oGame.calcul(20)


        Image{
            source: "/images/btnUp.png"

            width:parent.width- mainWindow.oGame.calcul(40)
            height: parent.height- mainWindow.oGame.calcul(40)
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter:  parent.verticalCenter;
        }

        MouseArea{
            anchors.fill: parent
            onPressed:clickBtnUp();

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
        width:mainWindow.oGame.calcul(180)
        height:mainWindow.oGame.calcul(90)
        radius: mainWindow.oGame.calcul(20)


        anchors.top:rect1.bottom
        anchors.topMargin: mainWindow.oGame.calcul(2);

        Image{
            source: "/images/btnDown.png"

            width:parent.width- mainWindow.oGame.calcul(40)
            height: parent.height- mainWindow.oGame.calcul(40)
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter:  parent.verticalCenter;
        }

        MouseArea{
            anchors.fill: parent
            onPressed:clickBtnDown();
        }

        SequentialAnimation on color {
            loops: 1
            id:rect2Anim;
            running:false;
            ColorAnimation { from: "#131564"; to: "#991600"; duration: 200 }
            ColorAnimation { from: "#991600"; to: "#131564"; duration: 500 }
        }


    }

    function clickBtnUp(){
        mainWindow.oGame.clickUp();

        rect1Anim.start();
    }

    function clickBtnDown(){
        mainWindow.oGame.clickDown();

        rect2Anim.start();
    }

}
