import 'package:flutter/material.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';
import 'package:garbage_control/presentation/core/widgets/custom_bottom_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final YoutubePlayerController controller = YoutubePlayerController(
    initialVideoId: '5xrWrKIVBgo',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Discover'),
      body: ListView(
        children: <Widget>[
          YoutubePlayer(
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
        ],
      ),
      bottomNavigationBar: const CustomBottomAppbar(),
    );
  }
}
