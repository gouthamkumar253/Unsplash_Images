import 'package:flutter/material.dart';
import 'package:unsplash_api/views/search_image/search_results_view.dart';

class DataSearch extends SearchDelegate<String> {
  final List<String> searchItems = <String>[
    'animation',
    'aeroplane',
    'banana',
    'ball',
    'balloon',
    'cat',
    'cake',
    'dog',
    'door',
    'egg',
    'elephant',
    'frog',
    'fish',
    'goat',
    'goal',
    'home',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestionItems = query.isEmpty
        ? searchItems.sublist(0, 4)
        : searchItems
            .where((String item) =>
                item.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute<Widget>(
                  builder: (BuildContext context) =>
                      SearchResultsView(query: suggestionItems[index]),
                ),
              );
            },
            child: ListTile(
              leading: const Icon(Icons.image),
              title: RichText(
                text: TextSpan(
                  text: suggestionItems[index].substring(0, query.length),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: suggestionItems[index].substring(query.length),
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ),
      itemCount: suggestionItems.length,
    );
  }
}
