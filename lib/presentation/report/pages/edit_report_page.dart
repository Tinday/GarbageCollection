import 'package:async_redux/async_redux.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:garbage_control/application/core/utils.dart';
import 'package:garbage_control/application/redux/states/app_state.dart';
import 'package:garbage_control/application/redux/view_models/user_state_view_model.dart';
import 'package:garbage_control/constants/theme.dart';
import 'package:garbage_control/infrastructure/validators.dart';
import 'package:garbage_control/models/report.dart';
import 'package:garbage_control/presentation/core/widgets/custom_appbar.dart';

class EditReportPage extends StatefulWidget {
  const EditReportPage({
    Key? key,
    required this.report,
  }) : super(key: key);
  final Report report;

  @override
  State<EditReportPage> createState() => _EditReportPageState();
}

class _EditReportPageState extends State<EditReportPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Map<String, dynamic> variables = <String, dynamic>{};
  bool isHouseWaste = false;
  bool isConstructionWaste = false;
  bool isIndustrialWaste = false;
  bool isElectronicWaste = false;
  bool isOtherWaste = false;
  String address = '';

  @override
  void initState() {
    isHouseWaste = widget.report.isHouseWaste ?? false;
    isConstructionWaste = widget.report.isConstructionWaste ?? false;
    isIndustrialWaste = widget.report.isIndustrialWaste ?? false;
    isElectronicWaste = widget.report.isElectronicWaste ?? false;
    isOtherWaste = widget.report.isOtherWaste ?? false;
    address = widget.report.addressOfDumping ?? 'false';
    super.initState();
  }

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
                      const SizedBox(height: 40),
                      const Text(
                        'Where was the dumping done ?',
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        initialValue: address,
                        decoration: inputDecoration.copyWith(
                          hintText: 'Address of the area',
                        ),
                        validator: (String? value) {
                          return validateString(value);
                        },
                        onSaved: (String? newValue) {
                          address = newValue.toString().trim();
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
                    return ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          displayLoadingDialog(context: context);
                          CollectionReference reports =
                              FirebaseFirestore.instance.collection('reports');
                          reports.doc(widget.report.id).update(
                            {
                              'address_of_dumping': address,
                              'isHouseWaste': isHouseWaste,
                              'isConstructionWaste': isConstructionWaste,
                              'isIndustrialWaste': isIndustrialWaste,
                              'isElectronicWaste': isElectronicWaste,
                              'isOtherWaste': isOtherWaste,
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
                                            'Report edited successfully'),
                                        const SizedBox(height: 30),
                                        SizedBox(
                                          width: 100,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
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
                      child: const Text('Update'),
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
