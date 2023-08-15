// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/article_screen.dart';
// import 'package:flutter_news_app/models/article_model.dart';
import 'package:flutter_news_app/models/newscatcher_model.dart';
import 'package:flutter_news_app/screens/discover_screen.dart';
import 'package:flutter_news_app/widgets/custom_tag.dart';
import '../helper/news_catcher_api.dart';
import '../widgets/bottom_nav_bar.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    News newsClass = News();
    await newsClass.getNews();

    setState(() {
      articles = newsClass.news.cast<Article>();
      isLoading = false;
    });
  }

  Future<void> _refreshNews() async {
    return await _fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    Article? article = articles.isNotEmpty ? articles[3] : null;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      body: LiquidPullToRefresh(
        onRefresh: _refreshNews,
        height: 100,
        animSpeedFactor: 2.0,
        color: Colors.deepPurple.shade100,
        backgroundColor: Colors.deepPurple,
        showChildOpacityTransition: false,
        borderWidth: 3,
        child: isLoading
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    CircularProgressIndicator(),
                    SizedBox(height: 10),
                    Text('Loading news...')
                  ],
                ),
              )
            : ListView(
                padding: EdgeInsets.zero,
                children: [
                  if (article != null) _NewsOfTheDay(news: article),
                  _BreakingNews(news: articles),
                ],
              ),
      ),
    );
  }
}

class _BreakingNews extends StatelessWidget {
  const _BreakingNews({
    required this.news,
  });

  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breaking News',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    DiscoverScreen.routeName,
                  );
                },
                child: Text(
                  'More',
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: news.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ArticleScreen.routeName,
                        arguments: news[index],
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            placeholder: (context, url) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                    'assets/images/placeholder.png'),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return const Icon(Icons.error_rounded);
                            },
                            cacheKey: news[index].media.toString(),
                            imageUrl: news[index].media.toString(),
                            height: 120,
                            width: MediaQuery.of(context).size.width * 0.5,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          news[index].title.toString(),
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold, height: 1.5),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${DateTime.now().difference(news[index].publishedDate as DateTime).inHours} hours ago',
                          style: Theme.of(context).textTheme.bodySmall!,
                        ),
                        Text(
                          'by ${news[index].author}',
                          style: Theme.of(context).textTheme.bodySmall!,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay({
    required this.news,
  });

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            news.media.toString(),
            cacheKey: news.media,
            errorListener: () {
              Image.asset('assets/images/placeholder.png');
            },
          ),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                'News of the Day',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            news.title.toString(),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.25,
                ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, ArticleScreen.routeName,
                  arguments: news);
            },
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Row(
              children: [
                Text(
                  'Learn More',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_right_alt,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
