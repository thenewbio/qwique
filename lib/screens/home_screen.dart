import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qwique/screens/header_card.dart';
import 'package:qwique/screens/login/login_screen.dart';
import 'package:qwique/screens/short_article_card.dart';
import 'package:qwique/screens/widgets/category_card.dart';
import 'package:qwique/screens/widgets/news_widget.dart';
import 'package:qwique/state/api/helper/data.dart';
import 'package:qwique/state/api/model/category_model.dart';
import 'package:qwique/state/auth/providers/auth_state_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategorieModel> categories = <CategorieModel>[];

  @override
  void initState() {
    super.initState();

    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  height: 90,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/dummy_image1.jpg',
                              fit: BoxFit.cover,
                            )),
                      ),
                      const HeaderCard(),
                      const SizedBox(
                        width: 50,
                      ),
                      Consumer(
                          builder: (BuildContext context, WidgetRef ref, _) {
                        final auth = ref.watch(authenticationProvider);
                        return IconButton(
                            onPressed: () {
                              auth.logout().whenComplete(
                                    () => Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (_) => const LoginScreen(),
                                      ),
                                    ),
                                  );
                            },
                            icon: const Icon(Icons.logout));
                      })
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Search for Article",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.searchengin,
                            color: Colors.blue,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 40,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          imageAssetUrl: categories[index].imageAssetUrl,
                          categoryName: categories[index].categorieName,
                        );
                      }),
                ),

                /// News Article
                Container(
                  height: 260,
                  margin: const EdgeInsets.only(top: 16),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('News')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text('Error'),
                          );
                        } else {
                          return ListView.builder(
                              itemExtent: 230,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, i) {
                                return NewsFeedsWidget(
                                  urlImage:
                                      snapshot.data!.docs[i].get('urlToImage'),
                                  title: snapshot.data!.docs[i].get('title'),
                                  desc:
                                      snapshot.data!.docs[i].get('description'),
                                  author: snapshot.data!.docs[i].get('author'),
                                  publishedAt:
                                      snapshot.data!.docs[i].get('publishedAt'),
                                );
                              });
                        }
                      }),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Short for you"),
                      TextButton(
                          onPressed: () {}, child: const Text('View all'))
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('News')
                          .snapshots(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                            itemExtent: 230,
                            itemCount: snapshot.data!.docs.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SubNewsCard(
                                imageUrl: snapshot.data!.docs[index]
                                    .get('urlToImage'),
                                title: snapshot.data!.docs[index].get('title'),
                              );
                            });
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
