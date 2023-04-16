import 'package:flutter/material.dart';

import '../../state/slide/model/slide_item.dart';

class SlideItem extends StatelessWidget {
  final int index;
  const SlideItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            height: 300,
            width: screenWidth,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(slideList[index].imageUrl, fit: BoxFit.cover)),
        const SizedBox(
          height: 40,
        ),
        Text(
          slideList[index].title,
          style: const TextStyle(
              fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          slideList[index].description,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
