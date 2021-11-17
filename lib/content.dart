import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

class bao extends StatefulWidget {
  const bao({Key? key}) : super(key: key);

  @override
  _baoState createState() => _baoState();
}

class _baoState extends State<bao> {
  int count = 0;
  late Size size;
  int i = 0;
  var list1 = [
    Service().fetchdata("https://newsapi.org/v2/everything?q=apple&from=2021-11-16&to=2021-11-16&sortBy=popularity&apiKey=bca24fbb8d0d4465987de84455e2f62c"),
    Service().fetchdata("https://newsapi.org/v2/everything?q=tesla&from=2021-10-17&sortBy=publishedAt&apiKey=bca24fbb8d0d4465987de84455e2f62c"),
    Service().fetchdata("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=bca24fbb8d0d4465987de84455e2f62c")
  ];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body:  Container(
      height: size.height,
      child: FutureBuilder(
      future: list1[i],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
    NewsApi t = snapshot.data;
    return Listview(t.articles);
    }
    return Center(child: CircularProgressIndicator());
    }),
    ),
      );
  }

  Widget Listview(List<Article> ls) {
    return ListView.builder(
      itemCount: ls.length,
      itemBuilder: (BuildContext context, int index) {
        Article p = ls[index];
        return GestureDetector(
          child: Column(
            children: [
              Card(
                elevation: 1,
                child: Container(
                  child: Column(
                    children: [
                      Image.network(p.urlToImage,width: 600),
                      Text(
                        p.title,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        p.content,
                        maxLines: 2,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
