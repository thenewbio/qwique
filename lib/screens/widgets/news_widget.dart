import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class NewsFeedsWidget extends StatelessWidget {
  final String urlImage;
  final String title;
  final String desc;
  final String author;
  final String publishedAt;
  const NewsFeedsWidget(
      {super.key,
      required this.urlImage,
      required this.title,
      required this.desc,
      required this.author,
      required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 15,
      ),
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.maxFinite,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.network(
              urlImage,
              height: 120,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          ReadMoreText(
            desc,
            trimLength: 100,
            trimLines: 3,
            trimExpandedText: "Readmore",
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 70,
            width: double.maxFinite,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(urlImage),
                    // radius: 20,
                  ),
                ),
                SizedBox(
                  width: 110,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        author,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      Text(publishedAt.replaceRange(10, null, ""))
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      size: 20,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
