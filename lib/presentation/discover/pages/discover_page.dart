import 'package:flutter/material.dart';
import 'package:garbage_control/application/core/utils.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';
import 'package:garbage_control/presentation/core/widgets/custom_bottom_app_bar.dart';
import 'package:garbage_control/presentation/discover/widgets/tutorial_widget.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Discover'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              'Here are some tutorials to learn a little bit more about proper waste disposal. Tap on any card card to find out more',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: litterTutorials.length,
                itemBuilder: (context, index) {
                  return TutorialItemWidget(tutorial: litterTutorials[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomAppbar(),
    );
  }
}
