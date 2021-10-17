import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cf_hand2/src/pages/camera/home.dart';

class Header extends StatefulWidget {
  final TrackingScrollController scrollController;

  const Header(this.scrollController);
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Color _backgroundColor;
  Color _backgroundColorSearch;
  Color _colorIcon;
  double _opacity;
  double _offset;
  final _opacityMax = 0.01;

  @override
  void initState() {
    _backgroundColor = Colors.white;
    _backgroundColorSearch = Colors.transparent;
    _colorIcon = Colors.black;
    _opacity = 0.0;
    _offset = 0.0;

    widget.scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _buildInputSearch(),
              SizedBox(width: 8),
              // _buildInputButton(
              //     onPressed: () => print("click!!"),
              //     icon: Icons.shopping_basket,
              //     notification: 22),
              _buildInputButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                icon: Icons.camera_alt,
              ),
              //notification: 22),
            ],
          ),
        ),
      ),
    );
  }

  _buildInputSearch() {
    final sizeIcon = BoxConstraints(
      minWidth: 40,
      minHeight: 40,
    );

    final border = OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.deepOrange,
          width: 0,
        ),
        borderRadius: const BorderRadius.all(
          const Radius.circular(4.0),
        ));

    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),

          isDense: true,
          enabledBorder: border,
          focusedBorder: border,
          hintText: "ค้นหา",
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),

          prefixIconConstraints: sizeIcon,
          // suffixIcon: Icon(Icons.camera_alt),
          // suffixIconConstraints: sizeIcon,
          filled: true,
          fillColor: _backgroundColorSearch,
        ),
      ),
    );
  }

  _buildInputButton(
          {VoidCallback onPressed, IconData icon, int notification = 0}) =>
      Stack(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
            color: _colorIcon,
            iconSize: 28,
          ),
          notification == 0
              ? SizedBox()
              : Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.deepOrange,
                      border: Border.all(color: Colors.black),
                    ),
                    constraints: BoxConstraints(
                      minHeight: 22,
                      minWidth: 22,
                    ),
                    child: Text(
                      '$notification',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
        ],
      );

  void _onScroll() {
    final scrollOffset = widget.scrollController.offset;
    if (scrollOffset >= _offset && scrollOffset >= 5) {
      _opacity = double.parse((_opacity + _opacityMax).toStringAsFixed(2));
      if (_opacity >= 1.0) {
        _opacity = 1.0;
      }
    } else if (scrollOffset <= 100) {
      _opacity = double.parse((_opacity - _opacityMax).toStringAsFixed(2));
      if (_opacity <= 1.0) {
        _opacity = 0.0;
      }
    }
    setState(() {
      if (scrollOffset <= 0) {
        _backgroundColorSearch = Colors.red.shade100;
        _colorIcon = Colors.black;
        _opacity = 0.0;
        _offset = 0.0;
      } else {
        _backgroundColorSearch = Colors.black;
        _colorIcon = Colors.deepOrange;
      }
      _backgroundColorSearch = Colors.white.withOpacity(_opacity);
    });
  }
}
