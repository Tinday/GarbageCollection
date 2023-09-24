import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garbage_control/constants/assets_strings.dart';
import 'package:garbage_control/constants/strings.dart';

class ResetEmailSentPage extends StatelessWidget {
  const ResetEmailSentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SvgPicture.asset(successImageUrl),
              const SizedBox(height: 30),
              const Text(
                resetEmailSent,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                resetEmailDescription,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: find a better navigation option for this case
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text(done.toUpperCase()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
