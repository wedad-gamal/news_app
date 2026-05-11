import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utilies/extensions.dart';
import 'package:news_app/presentation/home/tabs/news_tab/news_tab_view_model.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsTabViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            DefaultTabController(
              length: viewModel.sources.length,
              child: Column(
                children: [
                  TabBar(
                    onTap: viewModel.getArticles,
                    tabs: viewModel.sources
                        .map(
                          (source) =>
                              Text(source.name ?? "").paddingVertical(5),
                        )
                        .toList(),
                    isScrollable: true,
                    tabAlignment: .start,
                    dividerHeight: 0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (viewModel.articleIsLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: context.colors.primary,
                      ),
                    );
                  }
                  if (viewModel.articleErrorMessage.isNotEmpty) {
                    return Center(
                      child: Text(viewModel.articleErrorMessage.toString()),
                    );
                  }
                  if (viewModel.articles.isEmpty) {
                    return Center(child: Text("No articles found"));
                  }
                  return ListView.builder(
                    itemCount: viewModel.articles.length,
                    itemBuilder: (context, index) {
                      var article = viewModel.articles[index];
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
                                    return Image(
                                      image: imageProvider,
                                      fit: .cover,
                                    );
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
            //  FutureBuilder(
            //   future: RetrofitService.instance.getArticles(
            //     sources: _selectedSourceId,
            //   ),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return Center(
            //         child: CircularProgressIndicator(
            //           color: Theme.of(context).primaryColor,
            //         ),
            //       );
            //     }
            //     if (snapshot.hasError) {
            //       return Center(child: Text(snapshot.error.toString()));
            //     }
            //     var articles = snapshot.data?.articles ?? [];
            //     return ListView.builder(
            //       itemCount: articles.length,
            //       itemBuilder: (context, index) {
            //         var article = articles[index];
            //         return Container(
            //           margin: EdgeInsets.all(16),
            //           padding: EdgeInsets.all(16),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             border: Border.all(color: context.colors.primary),
            //           ),
            //           child: Column(
            //             children: [
            //               ClipRRect(
            //                 borderRadius: BorderRadius.circular(12),
            //                 child: AspectRatio(
            //                   aspectRatio: 345 / 220,
            //                   child: CachedNetworkImage(
            //                     imageUrl:
            //                         article.urlToImage ??
            //                         "https://sitechecker.pro/wp-content/uploads/2023/05/URL-meaning.jpg",
            //                     fit: BoxFit.cover,
            //                     width: double.infinity,
            //                     imageBuilder: (context, imageProvider) {
            //                       return Image(image: imageProvider, fit: .cover);
            //                     },
            //                     placeholder: (context, url) => Center(
            //                       child: CircularProgressIndicator(
            //                         color: context.colors.primary,
            //                       ),
            //                     ),
            //                     errorWidget: (context, url, error) => Icon(
            //                       Icons.error,
            //                       color: context.colors.primary,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               8.verticalSpace,
            //               Text(
            //                 article.title ?? "",
            //                 style: context.texts.titleMedium,
            //               ),
            //               8.verticalSpace,
            //               Row(
            //                 mainAxisAlignment: .spaceBetween,
            //                 children: [
            //                   Flexible(
            //                     child: Text(
            //                       "By: ${article.author}",
            //                       style: context.texts.titleSmall,
            //                     ),
            //                   ),
            //                   Text(
            //                     getDateFormate(article.publishedAt) ?? "",
            //                     style: context.texts.titleSmall,
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     );
            //   },
            //  ),
          ],
        );
      },
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
