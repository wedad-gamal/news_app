import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/core/utilies/extensions.dart';
import 'package:news_app/data/apis/retrofit_service.dart';
import 'package:news_app/data/model/source.dart';

class NewsList extends StatefulWidget {
  final List<Source> sources;
  const NewsList({super.key, required this.sources});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  String? _selectedSourceId;

  @override
  void initState() {
    super.initState();
    _selectedSourceId = widget.sources.first.id;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: Column(
            children: [
              TabBar(
                onTap: (index) {
                  setState(() {
                    _selectedSourceId = widget.sources[index].id;
                  });
                },
                tabs: widget.sources
                    .map((source) => Text(source.name ?? "").paddingVertical(5))
                    .toList(),
                isScrollable: true,
                tabAlignment: .start,
                dividerHeight: 0,
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: RetrofitService.instance.getArticles(
              sources: _selectedSourceId,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              var articles = snapshot.data?.articles ?? [];
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  var article = articles[index];
                  return Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: context.colors.primary),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: AspectRatio(
                            aspectRatio: 345 / 220,
                            child: CachedNetworkImage(
                              imageUrl:
                                  article.urlToImage ??
                                  "https://sitechecker.pro/wp-content/uploads/2023/05/URL-meaning.jpg",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              imageBuilder: (context, imageProvider) {
                                return Image(image: imageProvider, fit: .cover);
                              },
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                                  color: context.colors.primary,
                                ),
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                color: context.colors.primary,
                              ),
                            ),
                          ),
                        ),
                        8.verticalSpace,
                        Text(
                          article.title ?? "",
                          style: context.texts.titleMedium,
                        ),
                        8.verticalSpace,
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "By: ${article.author}",
                                style: context.texts.titleSmall,
                              ),
                            ),
                            Text(
                              getDateFormate(article.publishedAt) ?? "",
                              style: context.texts.titleSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  String? getDateFormate(String? publishedAt) {
    if (publishedAt == null) return "";
    var dateTime = DateTime.now().difference(DateTime.parse(publishedAt));

    if (dateTime.inSeconds < 60) {
      return "${dateTime.inSeconds} seconds ago";
    }
    if (dateTime.inMinutes < 60) {
      return "${dateTime.inMinutes} minutes ago";
    }

    if (dateTime.inHours < 24) {
      return "${dateTime.inHours} hours ago";
    }
    if (dateTime.inDays < 30) {
      return "${dateTime.inDays} days ago";
    }
    if (dateTime.inDays >= 30 && dateTime.inDays < 365) {
      return "${dateTime.inDays ~/ 30} months ago";
    }
    if (dateTime.inDays >= 365) {
      return "${dateTime.inDays ~/ 365} years ago";
    }
    return null;
  }
}
