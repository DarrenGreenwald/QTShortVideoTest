import QtQuick 2.0
import QtMultimedia 5.0


Rectangle {
    width: 1024
    height: 768
    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Rectangle {
        id: innerRect;
        width: 800
        height: 600
        color: "black"

        MediaPlayer {
            id: player
            source: "file:///C:/Users/darren/Desktop/sample_mpeg.mp4"
            autoPlay: true

            onStopped: {
                console.log("Video stoppped");
                player.play();
            }

            onPlaying: {
                console.log("Video playing");
                animation.running=true;
            }
            onPlaybackStateChanged: {
                console.log("Video playback state changed");
            }
        }

        VideoOutput {
            id: videoOutput
            source: player
            anchors.fill: parent
        }

        PropertyAnimation {
            id: animation
            target: innerRect;
            properties: "opacity";
            from: 0.0;
            to: 1.0;
            duration: 3000;
            running: false;
        }
    }
}


