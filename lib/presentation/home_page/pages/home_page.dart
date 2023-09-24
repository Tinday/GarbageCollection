import 'package:flutter/material.dart';
import 'package:garbage_control/application/core/utils.dart';
import 'package:garbage_control/constants/assets_strings.dart';
import 'package:garbage_control/presentation/core/routes.dart';
import 'package:garbage_control/presentation/core/widgets/custom_bottom_app_bar.dart';
import 'package:garbage_control/presentation/onboarding/widgets/home_page_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.red.withOpacity(1.0),
                  BlendMode.dstATop,
                ),
                image: const AssetImage(blendedBackgroundImg),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    getGreetingMessage(),
                    style: const TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'What would you like to do today ?',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Wrap(
            children: <Widget>[
              HomePageCard(
                iconUrl: reportCollectionImg,
                title: 'Report dumping',
                onTap: () =>
                    Navigator.of(context).pushNamed(reportDumpingRoute),
              ),
              HomePageCard(
                iconUrl: scheduleImage,
                title: 'Check collection schedule',
                onTap: () => Navigator.of(context).pushNamed(scheduleRoute),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: const CustomBottomAppbar(),
    );
  }
}
