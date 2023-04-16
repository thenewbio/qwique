import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isEmail;
  final Function onchange;
  const InputTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isEmail = false,
    required this.onchange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          height: 60,
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            controller: controller,
            // validator: (val) => onchange,
            decoration: InputDecoration(
                hintText: hintText,
                enabledBorder: InputBorder.none,
                suffixIcon: isEmail
                    ? const SizedBox.shrink()
                    : const Icon(Icons.visibility)),
          ),
        ),
      ],
    );
  }
}
