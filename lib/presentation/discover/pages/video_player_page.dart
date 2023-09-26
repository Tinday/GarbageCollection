import 'package:flutter/material.dart';
import 'package:garbage_control/models/tutorial.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({Key? key, this.tutorial}) : super(key: key);

  final Tutorial? tutorial;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: widget.tutorial?.youtubeId ?? '',
    );

    return Scaffold(
      appBar: CustomAppBar(title: widget.tutorial?.title ?? ''),
      body: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        bottomActions: <Widget>[
          CurrentPosition(),
          RemainingDuration(),
          ProgressBar(isExpanded: true),
          PlayPauseButton(),
          const PlaybackSpeedButton(),
        ],
      ),
    );
  }
}
