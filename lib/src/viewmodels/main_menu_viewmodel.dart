import 'package:cf_hand2/src/models/main_manu_model.dart';
import 'package:flutter/material.dart';

class MainMenuViewModel{
  List<MainMenuModel> getMainMenu(){
    return [
      MainMenuModel(
          image: "https://cdn.datta.store/auxapi/files/image/alcohol-fi_wkEKr7k.png",
          title: "alcohol",
          color: Colors.red,
      ),
      MainMenuModel(
        image: "https://cdn.datta.store/auxapi/files/image/papel-fi.png",
        title: "tissue",
        color: Colors.red,
      ),
      MainMenuModel(
        image: "https://cdn.datta.store/auxapi/files/image/fever-fi.png",
        title: "fever",
        color: Colors.red,
      ),
      MainMenuModel(
        image: "https://cdn.datta.store/auxapi/files/image/jabon-fi.png",
        title: "jabon",
        color: Colors.red,
      ),
      MainMenuModel(
        image: "https://cdn.datta.store/auxapi/files/image/mask-fi.png",
        title: "mask",
        color: Colors.red,
      ),
      MainMenuModel(
        image: "https://cdn.datta.store/auxapi/files/image/tos2-fi.png",
        title: "tos",
        color: Colors.red,
      ),
    ];
  }
}