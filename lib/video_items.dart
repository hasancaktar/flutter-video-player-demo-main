import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoItems extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;
  final Function(Duration, int) progressListener;

  VideoItems(
      {@required this.videoPlayerController,
      this.looping,
      this.autoplay,
      this.progressListener,
      Key key})
      : super(key: key);

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  ChewieController _chewieController;
  int durationInSeconds;
  int currentPositionInSeconds;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.videoPlayerController.initialize().then((x) {
      durationInSeconds = widget.videoPlayerController.value.duration.inSeconds;
      widget.videoPlayerController.addListener(() {
        final currentPosition = widget.videoPlayerController.value.position;
        currentPositionInSeconds = currentPosition.inSeconds;
        double progressPercent =
            (currentPositionInSeconds / durationInSeconds) * 100;
        widget.progressListener(currentPosition, progressPercent.toInt());
      });
    });

    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 3 / 5,
        autoInitialize: true,
        autoPlay: widget.autoplay,
        looping: widget.looping,
        showControls: true,
        allowPlaybackSpeedChanging: true,
        errorBuilder: (context, errorMesaage) {
          return Center(
            child: Text(
              errorMesaage,
              style: TextStyle(color: Colors.red),
            ),
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
