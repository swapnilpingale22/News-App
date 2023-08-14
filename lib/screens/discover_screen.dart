// ignore_for_file: unused_element

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/helper/news.dart';
import 'package:flutter_news_app/screens/article_screen.dart';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/widgets/bottom_nav_bar.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);
  static const routeName = '/discover';

  get tabs => null;

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<String> tabs = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology',
  ];
  List<Article> articles = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _fetchCategoryNews(tabs[0]);
  }

  // Future<void> _fetchCategoryNews() async {
  //   CategoryNews newsClass = CategoryNews();
  //   await newsClass.getNews(tabs[0]);

  //   setState(() {
  //     articles = newsClass.news;
  //     isLoading = false;
  //   });
  // }

  Future<void> _fetchCategoryNews(String category) async {
    CategoryNews newsClass = CategoryNews();
    await newsClass.getNews(category);
    // print(
    //     "Number of articles fetched for '$category': ${newsClass.news.length}");

    setState(() {
      articles = newsClass.news;
      isLoading = false;
    });
  }

  Future<void> _refreshNews() async {
    return await _fetchCategoryNews(widget.tabs);
  }

  // Callback to fetch news for the selected category
  Future<void> _onTabChange(String category) async {
    setState(() {
      isLoading = true;
    });
    await _fetchCategoryNews(category);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBar(index: 1),
        body: LiquidPullToRefresh(
          onRefresh: _refreshNews,
          color: Colors.deepPurple.shade100,
          backgroundColor: Colors.deepPurple,
          showChildOpacityTransition: false,
          animSpeedFactor: 2.0,
          borderWidth: 3,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const _DiscoverNews(),
              isLoading
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 120),
                          CircularProgressIndicator(),
                          SizedBox(height: 10),
                          Text('Loading...')
                        ],
                      ),
                    )
                  : _CategoryNews(
                      tabs: tabs,
                      articles: articles,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryNews extends StatefulWidget {
  const _CategoryNews({
    Key? key,
    required this.tabs,
    required this.articles,
  }) : super(key: key);

  final List<String> tabs;
  final List<Article> articles;

  @override
  State<_CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<_CategoryNews> {
  late List<List<Article>> articlesByCategory;

  @override
  void initState() {
    super.initState();
    articlesByCategory = List.generate(
      widget.tabs.length,
      (_) => [],
    );
    _groupArticlesByCategory();
  }

  void _groupArticlesByCategory() {
    for (var article in widget.articles) {
      String category = _extractCategoryFromUrl(article.url);
      int categoryIndex = widget.tabs.indexOf(category);
      if (categoryIndex >= 0 && categoryIndex < widget.tabs.length) {
        articlesByCategory[categoryIndex].add(article);
      }
    }
  }

  String _extractCategoryFromUrl(String url) {
    return widget.tabs[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          tabs: widget.tabs
              .map(
                (tab) => Tab(
                  icon: Text(
                    tab,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child:
                //chatgpt code
                TabBarView(
              children: widget.tabs
                  .map(
                    (tab) => Scrollbar(
                      radius: const Radius.circular(10),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount:
                            articlesByCategory[widget.tabs.indexOf(tab)].length,
                        itemBuilder: (context, index) {
                          Article article =
                              articlesByCategory[widget.tabs.indexOf(tab)]
                                  [index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ArticleScreen.routeName,
                                arguments: article,
                              );
                            },
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: CachedNetworkImage(
                                      imageUrl: article.imageUrl,
                                      cacheKey: article.imageUrl,
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          Image.asset(
                                        'assets/images/placeholder.png',
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error_rounded),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        article.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.clip,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.schedule,
                                            size: 18,
                                            color: Colors.black54,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            '${DateTime.now().difference(article.createdAt).inHours} hours ago',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          const Icon(
                                            Icons.visibility,
                                            size: 18,
                                            color: Colors.black54,
                                          ),
                                          const SizedBox(width: 5),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  )
                  .toList(),
            )

            //  TabBarView(
            //   children: tabs
            //       .map(
            //         (tab)
            //          => Scrollbar(
            //           radius: const Radius.circular(10),
            //           child: ListView.builder(
            //             shrinkWrap: true,
            //             physics: const BouncingScrollPhysics(),
            //             itemCount: articles.length,
            //             itemBuilder: (context, index) {
            //               return
            //                InkWell(
            //                 onTap: () {
            //                   Navigator.pushNamed(
            //                       context, ArticleScreen.routeName,
            //                       arguments: articles[index]);
            //                 },
            //                 child: Row(
            //                   children: [
            //                     // ImageContainer(
            //                     //   width: 80,
            //                     //   height: 80,
            //                     //   borderRadius: 5,
            //                     //   margin: const EdgeInsets.all(10.0),
            //                     //   imageUrl: articles[index].imageUrl,
            //                     // ),
            //                     Container(
            //                       margin: const EdgeInsets.all(10.0),
            //                       child: ClipRRect(
            //                         borderRadius: BorderRadius.circular(5.0),
            //                         child: CachedNetworkImage(
            //                           imageUrl: articles[index].imageUrl,
            //                           cacheKey: articles[index].imageUrl,
            //                           height: 80,
            //                           width: 80,
            //                           fit: BoxFit.cover,
            //                           placeholder: (context, url) => Image.asset(
            //                             'assets/images/placeholder.png',
            //                           ),
            //                           errorWidget: (context, url, error) =>
            //                               const Icon(Icons.error_rounded),
            //                         ),
            //                       ),
            //                     ),
            //                     Expanded(
            //                       child: Column(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         crossAxisAlignment: CrossAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                             articles[index].title,
            //                             maxLines: 2,
            //                             overflow: TextOverflow.clip,
            //                             style: Theme.of(context)
            //                                 .textTheme
            //                                 .bodyLarge!
            //                                 .copyWith(
            //                                   fontWeight: FontWeight.bold,
            //                                 ),
            //                           ),
            //                           const SizedBox(height: 10),
            //                           Row(
            //                             children: [
            //                               const Icon(
            //                                 Icons.schedule,
            //                                 size: 18,
            //                                 color: Colors.black54,
            //                               ),
            //                               const SizedBox(width: 5),
            //                               Text(
            //                                 '${DateTime.now().difference(articles[index].createdAt).inHours} hours ago',
            //                                 style: const TextStyle(
            //                                   fontSize: 12,
            //                                   color: Colors.black54,
            //                                 ),
            //                               ),
            //                               const SizedBox(width: 20),
            //                               const Icon(
            //                                 Icons.visibility,
            //                                 size: 18,
            //                                 color: Colors.black54,
            //                               ),
            //                               const SizedBox(width: 5),
            //                             ],
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               );
            //             },
            //           ),
            //         ),
            //       )
            //       .toList(),
            // ),

            )
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 5),
          Text(
            'News from all over the world',
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Search',
                fillColor: Colors.grey.shade200,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.tune,
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                )),
          ),
        ],
      ),
    );
  }
}
