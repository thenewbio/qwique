import 'package:flutter/material.dart';

class SubNewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  const SubNewsCard({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          height: 100,
          width: 100,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 100,
          child: Column(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 20,
                child: Row(
                  children: const [Icon(Icons.visibility), Text('1000')],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
