import 'package:flutter/material.dart';
import 'package:garbage_control/constants/strings.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/infrastructure/validators.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';
import 'package:garbage_control/presentation/core/widgets/custom_bottom_app_bar.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, dynamic> variables = <String, dynamic>{};
  @override
  Widget build(BuildContext context) {
    // final Widget appbarIcon = TextButton(
    //   onPressed: () async {
    //     if (formKey.currentState!.validate()) {
    //       formKey.currentState!.save();
    //       formKey.currentState!.reset();
    //     }
    //   },
    //   child: const Text(
    //     update,
    //     style: TextStyle(color: whiteColor, fontSize: 16),
    //   ),
    // );
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Report Dumping',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  'Thank you for choosing to report littering within your area. The environment is a lot safer with responsible people like yourself. Please note that the report and anything you choose to share with us is confidential ',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: inputDecoration.copyWith(
                    hintText: 'Brief description of the dumping',
                  ),
                  validator: (String? value) {
                    return validateString(value);
                  },
                  onSaved: (String? newValue) {
                    variables['current_password'] = newValue.toString().trim();
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: inputDecoration.copyWith(
                    hintText: 'Brief description of the location',
                  ),
                  validator: (String? value) {
                    return validateString(value);
                  },
                  onSaved: (String? newValue) {
                    variables['current_password'] = newValue.toString().trim();
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: inputDecoration.copyWith(
                    hintText: 'Any other information you would like to add',
                  ),
                  validator: (String? value) {
                    return validateString(value);
                  },
                  onSaved: (String? newValue) {
                    variables['current_password'] = newValue.toString().trim();
                  },
                ),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: Text('')),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppbar(),
    );
  }
}
