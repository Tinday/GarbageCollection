import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import 'dashboard.dart';

class RegistrationController extends ChangeNotifier {
  var firstName = ''.obs;
  var lastName = ''.obs;
  var email = '';
  var password = '';
  var isLoading = false;

  Future<dynamic> register() async {
    isLoading = true;
    notifyListeners();
    var response = await http.post(
      Uri.parse('https://martin.kimworks.buzz/registerr.php'),
      body: {'firstName': firstName.value, 'lastName': lastName.value, 'email': email, 'password': password},
    );
    isLoading = false;
    notifyListeners();
    return response;
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setFirstName(String value) {
    firstName.value = value;
    notifyListeners();
  }

  void setLastName(String value) {
    lastName.value = value;
    notifyListeners();
  }
}

class RegistrationScreen extends StatelessWidget {
  final RegistrationController _registrationController = RegistrationController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Join the Green Club'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    prefixIcon: Icon(Icons.person, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                  ),
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _registrationController.setFirstName(value!);
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    prefixIcon: Icon(Icons.person, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                  ),
                  style: TextStyle(color: Colors.white),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _registrationController.setLastName(value!);
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                  ),
                  style: TextStyle(color: Colors.white),


                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
    } else if (!value.contains('@')) {
    return 'Please enter a valid email';
    }
    return null;
    },
    onSaved: (value) {
    _registrationController.setEmail(value!);
    },
    ),
    SizedBox(height: 16),
    TextFormField(
    decoration: InputDecoration(
    hintText: 'Password',
    prefixIcon: Icon(Icons.lock, color: Colors.white),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.white.withOpacity(0.2),
    ),
    style: TextStyle(color: Colors.white),
    obscureText: true,
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter your password';
    } else if (value.length < 6) {
    return 'Password must be at least 6 characters long';
    }
    return null;
    },
    onSaved: (value) {
    _registrationController.setPassword(value!);
    },
    ),
    SizedBox(height: 32),
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    primary: Colors.green,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    ),
    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
    ),
    child: _registrationController.isLoading
    ? CircularProgressIndicator(
    color: Colors.white,
    )
        : Text(
    'Join Now',
    style: TextStyle(fontSize: 18),
    ),
    onPressed: () async {
    final form = _formKey.currentState!;
    if (form.validate()) {
    form.save();
    var response = await _registrationController.register();
    if (response.statusCode == 200) {Get.offAll(() => HomePage());
    } else {
      Get.snackbar(
        'Error',
        'Registration failed. Please try again later.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    }
    },
    ),
    ],
    ),
    ),
    ),
        ),
    );
  }
}





