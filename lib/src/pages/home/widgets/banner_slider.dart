import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: [
        BannerSection(),
        CashInfo(),
      ],
    );
  }
}

class BannerSection extends StatefulWidget {
  @override
  _BannerSectionState createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  final List<String> _imgList = [
    'assets/images/banner_1.jpg',
    'assets/images/banner_2.jpg',
    'assets/images/banner_3.jpg',
    'assets/images/banner_4.jpg',
    'assets/images/banner_5.jpg',
    'assets/images/banner_6.jpg',
    'assets/images/banner_7.jpg',
    'assets/images/banner_8.jpg',
  ];

  int _current;
  @override
  void initState() {
    _current = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBanner(),
        _buildIndicator(),
      ],
    );
  }

  Container _buildBanner() {
    return Container(
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.873,
          viewportFraction: 1.0,
          autoPlay: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
              //print("$index");
            });
          },
        ),
        items: _imgList
            .map((item) => Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ))
            .toList(),
      ),
    );
  }

  _buildIndicator() => Positioned(
        bottom: 15,
        left: 8,
        child: Row(
          children: _imgList.map(
            (url) {
              int index = _imgList.indexOf(url);
              return Container(
                width: 8,
                height: _current == index ? 8 : 1,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  shape:
                      _current == index ? BoxShape.circle : BoxShape.rectangle,
                  color: Colors.transparent,
                ),
              );
            },
          ).toList(),
        ),
      );
}

class CashInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final verticalDivider = VerticalDivider(
      indent: 5,
      endIndent: 5,
      thickness: 2.5,
      width: 24,
      color: Colors.grey[300],
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(8),
      /*decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 7,
              offset: Offset(0, 1),
            )
          ]),
      child: IntrinsicHeight(
          child: Row(
            children: [
              Image.network(
                "https://cdn1.iconfinder.com/data/icons/fintech-app-1/64/Artboard_4-512.png",
                height: 45,
                color: Colors.black54,
              ),
              verticalDivider,
              _buildInfo(
                  image:
                      "https://cdn1.iconfinder.com/data/icons/clothes-outfit-line-shop-aholic/512/Polo_shirt-512.png",
                  title: "เสื้อราคา 50-250.00",
                  subTitle: "จัดส่งฟรีทุก 100 ครั้ง"),
              verticalDivider,
              _buildInfo(
                  image:
                      "https://cdn1.iconfinder.com/data/icons/clothes-ios/64/clo-pants-512.png",
                  title: "กางเกงราคา 50-250.00",
                  subTitle: "จัดส่งฟรีทุก 100 ครั้ง"),
            ],
          ),
        )*/
    );
  }

  _buildInfo({String image, String title, String subTitle}) => Expanded(
      flex: 3,
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                image,
                height: 22,
                color: Colors.deepPurple,
              ),
              SizedBox(
                width: 4,
              ),
              Text(title, style: TextStyle(fontSize: 14, color: Colors.black)),
            ],
          ),
          Text(subTitle,
              style: TextStyle(fontSize: 11, color: Colors.grey[700])),
        ],
      ));
}
