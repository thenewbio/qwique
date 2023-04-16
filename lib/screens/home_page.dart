import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qwique/screens/widgets/app_bar_widget.dart';
import 'package:qwique/screens/widgets/news_widget.dart';
import 'package:qwique/state/new_firstore/providers/all_news_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final news = ref.watch(allPostsProvider);
    return Scaffold(
      appBar: MyAppBar(),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('News').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, i) {
                    return NewsFeedsWidget(
                      urlImage: snapshot.data!.docs[i].get('urlToImage'),
                      title: snapshot.data!.docs[i].get('title'),
                      desc: snapshot.data!.docs[i].get('description'),
                      author: snapshot.data!.docs[i].get('author'),
                      publishedAt: snapshot.data!.docs[i].get('publishedAt'),
                    );
                  });
            }
          }),
    );
  }
}
