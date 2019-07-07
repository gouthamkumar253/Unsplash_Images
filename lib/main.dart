import 'package:flutter/material.dart';
import 'package:unsplash_api/bloc/images.dart';
import 'package:unsplash_api/models/all_images.dart';
import 'package:unsplash_api/views/search_image/search_image.dart';
import 'package:unsplash_api/views/staggered_view.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  Stream<List<AllImages>> stream = bloc.images;

  @override
  void initState() {
    super.initState();
    bloc.fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Unsplash Images',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.grey,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
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
              child: StreamBuilder<List<AllImages>>(
                stream: stream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<AllImages>> snapshot) {
                  if (snapshot.hasData) {
                    print('Data Retrieved');
                    return StaggeredView(
                      images: snapshot.data,
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
