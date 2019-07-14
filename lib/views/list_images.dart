import 'package:flutter/material.dart';
import 'package:unsplash_api/bloc/images.dart';
import 'package:unsplash_api/models/all_images.dart';
import 'package:unsplash_api/views/staggered_view.dart';

class ListImages extends StatefulWidget {
  const ListImages({Key key, this.value}) : super(key: key);
  final int value;

  @override
  _ListImagesState createState() => _ListImagesState();
}

class _ListImagesState extends State<ListImages> {
  Stream<List<AllImages>> stream = bloc.images;
  int page = 1;
  List<AllImages> images = <AllImages>[];
  ScrollController controller = ScrollController();

  bool _handleNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        controller.position.extentAfter == 0) {
      setState(() {
        page++;
        bloc.fetchImages(page, images, widget.value);
      });
    }
    return false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.fetchImages(page, images, widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AllImages>>(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<List<AllImages>> snapshot) {
        if (snapshot.hasData) {
          print('Data Retrieved');
          return NotificationListener<ScrollNotification>(
            onNotification: _handleNotification,
            child: ListView(
              controller: controller,
              children: <Widget>[
                Container(
                  child: StaggeredView(
                    images: snapshot.data,
                    lazy: true,
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('API Limit exceeded. Try after an hour');
        }
        return Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: const CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
