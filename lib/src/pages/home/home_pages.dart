import 'dart:io';

import 'package:cf_hand2/src/pages/home/widgets/banner_slider.dart';
import 'package:cf_hand2/src/pages/home/widgets/header.dart';
import 'package:cf_hand2/src/pages/home/widgets/mainmenu.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  //HomePage({Key key, this.title}) : super(key: key);
  //final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _loading = true;
  File _image;
  List _output;
  final picker = ImagePicker();
  var detection = "";

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 36,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output;
      detection = output.toString();
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  final _scrollController = TrackingScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: Colors.red.shade200,
      //   title: Text(
      //     'Shodee',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 20,
      //       letterSpacing: 0.8,
      //     ),
      //   ),
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.centerLeft,
      //         end: Alignment.centerRight,
      //         colors: <Color>[Colors.amberAccent, Colors.red],
      //       ),
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: Stack(children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              BannerSlider(),
              SizedBox(
                height: 15,
              ),
              Text(
                'หมวดหมู่สินค้า',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline),
              ),
              MainMenu(),
              TextButton(
                  onPressed: pickImage,
                  child: Text(detection == "" ? "button" : detection)),
              Container(
                margin: EdgeInsets.only(top: 50),
                color: Colors.red,
                child: Text("ทดสอบ"),
                height: 1000,
                width: 500,
              ),
            ],
          ),
        ),
        Header(_scrollController),
      ]),
    );
  }
}
