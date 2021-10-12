import 'package:cf_hand2/src/models/main_manu_model.dart';
import 'package:cf_hand2/src/viewmodels/main_menu_viewmodel.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  final List<MainMenuModel> _menus = MainMenuViewModel().getMainMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      height: 300,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 1.25,
        ),
        itemBuilder: (context, index) {
          final MainMenuModel menu = _menus[index];
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 50,
                height: 70,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(
                        color: Colors.black26,
                      )),
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  onPressed: () {},
                  child: Image.network(
                    menu.image,
                    color: menu.color,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                menu.title,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
        itemCount: _menus.length,
      ),
    );
  }
}
