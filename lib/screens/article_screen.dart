import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/web_view_screen.dart';
import 'package:flutter_news_app/widgets/custom_tag.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/article_model.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});
  static const routeName = '/article';

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          image: CachedNetworkImageProvider(
            article.imageUrl,
            cacheKey: article.imageUrl,
            errorListener: () => Image.asset(
              'assets/images/placeholder.png',
            ),
          ),
        ),
      ),
      width: double.infinity,
      child: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            _NewsHeadline(article: article),
            _NewsBody(article: article),
          ],
        ),
      ),
    );
  }
}

class _NewsBody extends StatefulWidget {
  const _NewsBody({
    required this.article,
  });

  final Article article;

  @override
  State<_NewsBody> createState() => _NewsBodyState();
}

class _NewsBodyState extends State<_NewsBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          CustomTag(
            backgroundColor: Colors.black,
            children: [
              const CircleAvatar(
                radius: 10,
                child: Icon(
                  Icons.person,
                  size: 18,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.article.author,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTag(
                backgroundColor: Colors.grey.shade200,
                children: [
                  const Icon(
                    Icons.timer,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  Text(
                      '${DateTime.now().difference(widget.article.createdAt).inHours} h',
                      style: Theme.of(context).textTheme.bodyMedium!),
                ],
              ),
              const SizedBox(width: 7),
              CustomTag(
                backgroundColor: Colors.grey.shade200,
                children: [
                  const Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '643',
                    style: Theme.of(context).textTheme.bodyMedium!,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Text(
          //   widget.article.title,
          //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //         fontWeight: FontWeight.bold,
          //       ),
          // ),
          const SizedBox(height: 20),
          Text(
            widget.article.body != "--"
                ? '${widget.article.body.substring(0, widget.article.body.length - 15)}...'
                : widget.article.body,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 1.5),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    launchUrl(
                      Uri.parse(widget.article.url),
                      mode: LaunchMode.inAppWebView,
                    );
                  });
                },
                child: const Text(
                  '🔗 Read the full article',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GridView.builder(
            itemCount: 2,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.25,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewScreen(
                        url: widget.article.imageUrl,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 5, bottom: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      width: MediaQuery.of(context).size.width * 0.42,
                      imageUrl: widget.article.imageUrl,
                      cacheKey: widget.article.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Image.asset(
                        'assets/images/placeholder.png',
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error_rounded),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class _NewsHeadline extends StatefulWidget {
  const _NewsHeadline({
    required this.article,
  });
  final Article article;

  @override
  State<_NewsHeadline> createState() => _NewsHeadlineState();
}

class _NewsHeadlineState extends State<_NewsHeadline> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          const SizedBox(height: 10),
          Text(
            widget.article.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.25,
                ),
          ),
          Text(
            widget.article.subtitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
