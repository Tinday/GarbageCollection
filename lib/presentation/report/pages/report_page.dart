import 'package:async_redux/async_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/application/redux/view_models/user_state_view_model.dart';
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
  bool isHouseWaste = false;
  bool isConstructionWaste = false;
  bool isIndustrialWaste = false;
  bool isElectronicWaste = false;
  bool isOtherWaste = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Report Dumping'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: <Widget>[
                      const SizedBox(height: 10),
                      const Text(
                        'Thank you for choosing to report littering within your area. Please note that the report and anything you choose to share with us is confidential ',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Where was the dumping done ?',
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: inputDecoration.copyWith(
                          hintText: 'Address of the area',
                        ),
                        validator: (String? value) {
                          return validateString(value);
                        },
                        onSaved: (String? newValue) {
                          variables['address_of_dumping'] =
                              newValue.toString().trim();
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'How would you classify the type of dumping',
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(
                                  value: isHouseWaste,
                                  onChanged: (bool? val) {}),
                              const Text('Household Waste')
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                  value: isConstructionWaste,
                                  onChanged: (bool? val) {}),
                              const Text('Construction Debris')
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                  value: isIndustrialWaste,
                                  onChanged: (bool? val) {}),
                              const Text('Industrial')
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                  value: isElectronicWaste,
                                  onChanged: (bool? val) {}),
                              const Text('Electronics')
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                  value: isOtherWaste,
                                  onChanged: (bool? val) {}),
                              const Text('Other')
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'If you chose other above please explain what type',
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: inputDecoration.copyWith(
                          hintText: 'Description of the dumping',
                        ),
                        onSaved: (String? newValue) {
                          variables['other_description'] =
                              newValue.toString().trim();
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: StoreConnector<AppState, UserStateViewModel>(
                  converter: (Store<AppState> store) =>
                      UserStateViewModel.fromStore(store),
                  builder: (BuildContext context, UserStateViewModel vm) {
                    final String? documentId = vm.documentId;
                    return ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          CollectionReference users =
                              FirebaseFirestore.instance.collection('users');
                          users.add({
                            'reporter': documentId,
                            'address_of_dumping':
                                variables['address_of_dumping'],
                            'isHouseWaste': isHouseWaste,
                            'isConstructionWaste': isConstructionWaste,
                            'isIndustrialWaste': isIndustrialWaste,
                            'isElectronicWaste': isElectronicWaste,
                            'isOtherWaste': isOtherWaste,
                          });
                        }
                      },
                      child: const Text('Submit report'),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppbar(),
    );
  }
}
