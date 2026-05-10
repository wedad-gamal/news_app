import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/core/utilies/extensions.dart';
import 'package:news_app/data/apis/api_client.dart';
import 'package:news_app/data/apis/retrofit_service.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/data/model/category.dart';
import 'package:news_app/data/model/sources_response.dart';
import 'package:news_app/ui/home/widgets/news_list.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key, required this.category});
  final Category category;

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  List<NewsSource> sources = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RetrofitService.instance.getSources(category: widget.category.id),
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

        return NewsList(sources: snapshot.data?.sources ?? []);
      },
    );
  }
}
