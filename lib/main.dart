import 'package:flutter/material.dart';
import 'package:unsplash_api/views/list_images.dart';
import 'package:unsplash_api/views/search_image/search_all_images.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(App());
}


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
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            controller: ScrollController(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.white,
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      iconSize: 34.0,
                      onPressed: () {
                        showSearch(context: context, delegate: DataSearch());
                      },
                    ),
                  ],
                  title: const Text(
                    'Unsplash Images',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
//                  pinned: false,
//                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.black,
                    indicatorWeight: 2.5,
                    tabs: const <Tab>[
                      Tab(
                        child: Text('Popular'),
                      ),
                      Tab(
                        child: Text('Latest'),
                      ),
                      Tab(
                        child: Text('Oldest'),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: const <Widget>[
                ListImages(value: 1),
                ListImages(value: 2),
                ListImages(value: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
