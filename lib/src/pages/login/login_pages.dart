import 'package:flutter/material.dart';
import 'package:cf_hand2/src/pages/home/home_pages.dart';
import 'package:cf_hand2/src/pages/home/manu_customer.dart';

class login extends StatefulWidget {
  // const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _User = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.amberAccent, Colors.red]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // add Column
            children: <Widget>[
              Center(
                child: Text(
                  'เข้าสู่ระบบ',
                  style: TextStyle(
                      // your text
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Wrap(
                // crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'ชื่อ         ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Material(
                    elevation: 20.0,
                    shadowColor: Colors.grey,
                    child: Container(
                        width: 200,
                        height: 40,
                        child: TextField(
                          controller: _User,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'User',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(7)),
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                // crossAxisAlignment: WrapCrossAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'รหัสผ่าน',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Material(
                    elevation: 20.0,
                    shadowColor: Colors.grey,
                    child: Container(
                        width: 200,
                        height: 40,
                        child: TextField(
                          controller: _password,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'password',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(7)),
                          ),
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              ButtonTheme(
                minWidth: 200.0,
                height: 40,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => manu()),
                    );
                  },
                  child: Text('เข้าสู่ระบบ'),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.white,
                  splashColor: Colors.blue,
                  textColor: Color(0xfffe67e22),
                ),
              ),
              // your button beneath text
            ],
          ),
        ),
      ),
    );
  }
}
