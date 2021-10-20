import 'package:cf_hand2/src/pages/me/me_customer.dart';
import 'package:flutter/material.dart';
import 'package:cf_hand2/src/pages/home/home_pages.dart';
import 'package:cf_hand2/src/pages/trolley/trolley_customer.dart';

class manu extends StatefulWidget {
  // const manu({Key? key}) : super(key: key);

  @override
  _manuState createState() => _manuState();
}

class _manuState extends State<manu> {
  int selectedPage = 0;
  final _pageOptions = [HomePage(), trolley(), me()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.red.shade200,
          title: Text(
            'Shodee',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              letterSpacing: 0.8,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Colors.amberAccent, Colors.red],
              ),
            ),
          ),
        ),
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (int index) {
            setState(() {
              selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('หน้าหลัก')),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), title: Text('รถเข็น')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('ฉัน'))
          ],
        ),
      ),
    );
  }
}

// class _manuState extends State<manu> {
//   int _selectedIndex = 0;
//   static const List<Widget> _widgetOptions = <Widget>[
//     // HomePage(),
//     // trolley(),
//     // me(),
//     Text('หน้าหลัก',
//         style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//     Text('รถเข็น', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//     Text('ฉัน', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       // HomePage();
//       // trolley();
//       // me();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // backgroundColor: Colors.red.shade200,
//         title: Text(
//           'Shodee',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//             letterSpacing: 0.8,
//           ),
//         ),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               colors: <Color>[Colors.amberAccent, Colors.red],
//             ),
//           ),
//         ),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 title: Text('หน้าหลัก'),
//                 backgroundColor: Colors.green),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.shopping_cart),
//                 title: Text('รถเข็น'),
//                 backgroundColor: Colors.yellow),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               title: Text('ฉัน'),
//               backgroundColor: Colors.blue,
//             ),
//           ],
//           type: BottomNavigationBarType.shifting,
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.black,
//           iconSize: 40,
//           onTap: _onItemTapped,
//           elevation: 5),
//     );
//   }
// }
