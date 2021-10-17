import 'package:flutter/material.dart';
import 'package:cf_hand2/src/pages/login/login_pages.dart';
import 'package:cf_hand2/src/pages/login/signup_pages.dart';

class openlogin extends StatefulWidget {
  // const openlogin({Key? key}) : super(key: key);

  @override
  _openloginState createState() => _openloginState();
}

class _openloginState extends State<openlogin> {
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
              Material(
                elevation: 4.0,
                shape: CircleBorder(),
                clipBehavior: Clip.hardEdge,
                color: Colors.transparent,
                child: Ink.image(
                  image: AssetImage('assets/imgIcon/shopping-bag.png'),
                  fit: BoxFit.cover,
                  width: 200.0,
                  height: 200.0,
                  child: InkWell(
                    onTap: () {},
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text('Shodee',
                  style: TextStyle(
                      // your text
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(
                height: 10, // <-- Your width
              ),
              ButtonTheme(
                minWidth: 200.0,
                height: 40,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
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
              SizedBox(
                height: 5,
              ),
              ButtonTheme(
                minWidth: 200.0,
                height: 40,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signup()),
                    );
                  },
                  child: Text('สร้างบัญชี'),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  color: Colors.white,
                  splashColor: Colors.blue,
                  textColor: Color(0xfffe67e22),
                ),
              ), // your button beneath text
            ],
          ),
        ),
      ),
    );
  }
}
