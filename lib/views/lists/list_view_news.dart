import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_starter/model/news_detail.dart';
import 'package:flutter_starter/core/styles.dart';
import 'package:flutter_starter/views/details/detail_view_news.dart';
import 'package:http/http.dart' as http;

// https://medium.com/stackavenue/flutter-fetch-data-from-api-display-in-listview-33c49670e490

class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsScreenState();
  }
}

class _NewsScreenState extends State<NewsScreen> {
  final List<NewsDetail> items = [];

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Latest News",
          style: Styles.navBarTitle,
        )),
        body: ListView.builder(
            itemCount: this.items.length, itemBuilder: _listViewItemBuilder));
  }

  void getNews() async {
    final http.Response response = await http.get(
        "https://newsapi.org/v2/top-headlines?country=de&apiKey=30158a5e9bcd4b80870bf921271c7fc5");
    final Map<String, dynamic> responseData = json.decode(response.body);
    responseData['articles'].forEach((newsDetail) {
      final NewsDetail news = NewsDetail(
          description: newsDetail['description'],
          title: newsDetail['title'],
          url: newsDetail['urlToImage']);
      setState(() {
        items.add(news);
      });
    });
  }

  Widget _itemThumbnail(NewsDetail newsDetail) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: newsDetail.url == null
          ? null
          : Image.network(newsDetail.url, fit: BoxFit.fitWidth),
    );
  }

  Widget _itemTitle(NewsDetail newsDetail) {
    return Text(newsDetail.title, style: Styles.textDefault);
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var newsDetail = this.items[index];
    return ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: _itemThumbnail(newsDetail),
        title: _itemTitle(newsDetail),
        onTap: () {
          _navigationToNewsDetail(context, newsDetail);
        });
  }

  void _navigationToNewsDetail(BuildContext context, NewsDetail newsDetail) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NewsDetailScreen(newsDetail);
    }));
  }
}
