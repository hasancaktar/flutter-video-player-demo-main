import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_demo/video_items.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Video Player Demo'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          VideoItems(
            videoPlayerController: VideoPlayerController.network(
                'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'),
            looping: false,
            autoplay: false,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("percentage watched: "+ "%0"),
                      Text("positions watched: " + "[[0,0]]"),
                    ],
                  ),
                ))),
          )
        ],
      ),
    );
  }
}
