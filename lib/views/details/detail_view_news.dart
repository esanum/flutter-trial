import 'package:flutter/material.dart';
import 'package:flutter_starter/model/news_detail.dart';
import 'package:flutter_starter/views/widgets/txt.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsDetail newsDetail;

  NewsDetailScreen(this.newsDetail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Txt(
          text: newsDetail.title,
          style: Theme.of(context).textTheme.headline1,
        )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, newsDetail),
        ));
  }

  List<Widget> _renderBody(BuildContext context, NewsDetail newsDetail) {
    var result = List<Widget>();
    result.add(_bannerImage(newsDetail.url, 170.0));
    result.addAll(_renderInfo(context, newsDetail));
    return result;
  }

  List<Widget> _renderInfo(BuildContext context, NewsDetail newsDetail) {
    var result = List<Widget>();
    result.add(_sectionTitle(context, newsDetail.title));
    result.add(_sectionText(context, newsDetail.description));
    return result;
  }

  Widget _sectionTitle(BuildContext context, String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
        child: Txt(
            text: text,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1));
  }

  Widget _sectionText(BuildContext context, String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
        child: Txt(
          text: text,
          style: Theme.of(context).textTheme.bodyText2,
        ));
  }

  Widget _bannerImage(String url, double height) {
    return Container(
        constraints: BoxConstraints.tightFor(height: height),
        child: Image.network(url, fit: BoxFit.fitWidth));
  }
}
