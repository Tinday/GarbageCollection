import 'package:async_redux/async_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/application/core/utils.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/application/redux/view_models/user_state_view_model.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/infrastructure/validators.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';

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
                                onChanged: (bool? val) {
                                  setState(() {
                                    isHouseWaste = !isHouseWaste;
                                  });
                                },
                              ),
                              const Text('Household Waste')
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: isConstructionWaste,
                                onChanged: (bool? val) {
                                  setState(() {
                                    isConstructionWaste = !isConstructionWaste;
                                  });
                                },
                              ),
                              const Text('Construction Debris')
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: isIndustrialWaste,
                                onChanged: (bool? val) {
                                  setState(() {
                                    isIndustrialWaste = !isIndustrialWaste;
                                  });
                                },
                              ),
                              const Text('Industrial')
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: isElectronicWaste,
                                onChanged: (bool? val) {
                                  setState(() {
                                    isElectronicWaste = !isElectronicWaste;
                                  });
                                },
                              ),
                              const Text('Electronics')
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: isOtherWaste,
                                onChanged: (bool? val) {
                                  setState(() {
                                    isOtherWaste = !isOtherWaste;
                                  });
                                },
                              ),
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
                          displayLoadingDialog(context: context);

                          FirebaseFirestore.instance.collection('reports').add(
                            {
                              'reporter': documentId,
                              'address_of_dumping':
                                  variables['address_of_dumping'],
                              'isHouseWaste': isHouseWaste,
                              'isConstructionWaste': isConstructionWaste,
                              'isIndustrialWaste': isIndustrialWaste,
                              'isElectronicWaste': isElectronicWaste,
                              'isOtherWaste': isOtherWaste,
                              'is_scheduled': false,
                            },
                          );
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: SizedBox(
                                  height: 160,
                                  width: 160,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(height: 10),
                                        const Text(
                                            'Report submitted successfully'),
                                        const SizedBox(height: 30),
                                        SizedBox(
                                          width: 100,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('Ok'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
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
    );
  }
}
