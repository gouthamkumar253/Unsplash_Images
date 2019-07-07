import 'package:flutter/material.dart';
import 'package:unsplash_api/bloc/images.dart';
import 'package:unsplash_api/models/search_images.dart';
import 'package:unsplash_api/views/staggered_view.dart';

class SearchResultsView extends StatefulWidget {
  const SearchResultsView({Key key, this.query}) : super(key: key);

  final String query;

  @override
  _SearchResultsViewState createState() => _SearchResultsViewState();
}

class _SearchResultsViewState extends State<SearchResultsView> {
  Stream<SearchResults> stream = bloc.searchImages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.searchQueryImage(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Search Results Are',
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: const <Color>[
              const Color(0xFFf5f7fa),
              const Color(0xFFc3cfe2)
            ],
          ),
        ),
        child: ListView(
          children: <Widget>[
            Container(
              child: StreamBuilder<SearchResults>(
                stream: stream,
                builder: (BuildContext context,
                    AsyncSnapshot<SearchResults> snapshot) {
                  if (snapshot.hasData) {
                    print('Data Retrieved for the search');
                    print(snapshot.data.results.length);
                    return StaggeredView(
                      images: snapshot.data.results,
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return Padding(
                    padding: const EdgeInsets.all(50),
                    child: Center(
                      child: const CircularProgressIndicator(),
                    ),
                  );
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
