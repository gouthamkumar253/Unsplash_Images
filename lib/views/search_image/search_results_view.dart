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
      body: SafeArea(
        child: NestedScrollView(
          controller: ScrollController(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(
                  color: Colors.black, //change your color here
                ),
                title: const Text(
                  'Search Results',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: Container(
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
                        return snapshot.data.total == 0
                            ? Center(
                                child: const Padding(
                                  padding: const EdgeInsets.all(50.0),
                                  child: const Text(
                                      'No results. Please try again.'),
                                ),
                              )
                            : StaggeredView(
                                images: snapshot.data.results,
                                lazy: false,
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
        ),
      ),
    );
  }
}

