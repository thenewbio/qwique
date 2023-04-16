import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final String text;
  final Function() onpressed;
  const GeneralButton({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onpressed,
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue.shade700),
          height: 50,
          width: double.maxFinite,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ));
  }
}
