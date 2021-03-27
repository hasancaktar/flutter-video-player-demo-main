import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_demo/video_items.dart';

class HomeScreen extends StatelessWidget {
  final percentNotifier = ValueNotifier<int>(0);
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
            progressListener: (currentPostion, percent) {
              // print('Video at $currentPostion percent=$percent%');
              percentNotifier.value = percent;
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ValueListenableBuilder<int>(
                      valueListenable: percentNotifier,
                      builder:
                          (BuildContext context, int percent, Widget child) {
                        return Column(
                          children: [
                            Text("percentage watched: " + "%$percent"),
                            Text("positions watched: " + "[[0,0]]"),
                          ],
                        );
                      }),
                ))),
          )
        ],
      ),
    );
  }
}
