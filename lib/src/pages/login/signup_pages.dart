import 'package:flutter/material.dart';
import 'package:cf_hand2/src/pages/login/open_login.dart';

class signup extends StatefulWidget {
  // const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  // Define a key to access the form
  final _formKey = GlobalKey<FormState>();

  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';

  // This function is triggered when the user press the "Sign Up" button
  void _trySubmitForm() {
    final isValid = _formKey.currentState.validate();
    if (isValid) {
      print('สำเร็จ!');
      print(_userEmail);
      print(_userName);
      print(_password);
      print(_confirmPassword);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => openlogin()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: 1000,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.amberAccent, Colors.red]),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              'สร้างบัญชี',
              style: TextStyle(
                  // your text
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 35),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /////////////////////////////////////////
                          /// Eamil
                          TextFormField(
                            decoration: InputDecoration(labelText: 'อีเมล'),
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'กรุณากรอกอีเมลของคุณ';
                              }
                              // Check if the entered email has the right format
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return 'ต้องระบุข้อมูลในช่องนี้';
                              }
                              // Return null if the entered email is valid
                              return null;
                            },
                            onChanged: (value) => _userEmail = value,
                          ),

                          /////////////////////////////////////////
                          /// username
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'ชื่อผู้ใช้'),
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'ต้องระบุข้อมูลในช่องนี้';
                              }
                              if (value.trim().length < 4) {
                                return 'รหัสผ่านต้องมีความยาวอย่างน้อย 8 ตัวอักษร';
                              }
                              // Return null if the entered username is valid
                              return null;
                            },
                            onChanged: (value) => _userName = value,
                          ),

                          ////////////////////////////////////
                          /// Password
                          TextFormField(
                            decoration: InputDecoration(labelText: 'รหัสผ่าน'),
                            obscureText: true,
                            validator: (value) {
                              if (value.trim().isEmpty) {
                                return 'ต้องระบุข้อมูลในช่องนี้';
                              }
                              if (value.trim().length < 8) {
                                return 'รหัสผ่านต้องมีความยาวอย่างน้อย 8 ตัวอักษร';
                              }
                              // Return null if the entered password is valid
                              return null;
                            },
                            onChanged: (value) => _password = value,
                          ),
                          //////////////////////////////////
                          /// Confirm Password
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'ยืนยันรหัสผ่าน'),
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'ต้องระบุข้อมูลในช่องนี้';
                              }

                              if (value != _password) {
                                return 'รหัสผ่านยืนยันไม่ตรงกับรหัสผ่านที่ป้อน';
                              }

                              return null;
                            },
                            onChanged: (value) => _confirmPassword = value,
                          ),
                          SizedBox(height: 20),
                          // Container(
                          //     width: 200.0,
                          //     height: 40,
                          //     alignment: Alignment.center,
                          //     child: OutlinedButton(
                          //       onPressed: _trySubmitForm,
                          //       child: Text('สร้างบัญชี',
                          //           style: TextStyle(color: Colors.deepOrange)),
                          //     ))
                        ],
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
              minWidth: 200.0,
              height: 40,
              child: RaisedButton(
                onPressed: _trySubmitForm,
                child: Text('สร้างบัญชี'),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                color: Colors.white,
                splashColor: Colors.blue,
                textColor: Color(0xfffe67e22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
