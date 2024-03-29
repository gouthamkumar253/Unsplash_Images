import 'package:rxdart/rxdart.dart';
import 'package:unsplash_api/models/all_images.dart';
import 'package:unsplash_api/models/search_images.dart';
import 'package:unsplash_api/services/image_repo.dart';

class ImagesBloc {
  final Repository _repository = Repository();
  final PublishSubject<List<AllImages>> _imagesFetcher =
  PublishSubject<List<AllImages>>();
  final PublishSubject<SearchResults> _searchImagesFetcher =
  PublishSubject<SearchResults>();

  Observable<List<AllImages>> get images => _imagesFetcher.stream;
  Observable<SearchResults> get searchImages=>_searchImagesFetcher.stream;

  void fetchImages(int page, List<AllImages> images,int value) async {
    final List<AllImages> image = await _repository.fetchAllImages(page,value);
    images.addAll(image);
    print(images.length.toString()+'is the length of images');
    _imagesFetcher.sink.add(images);
  }
  void searchQueryImage(String query) async {
    final SearchResults results = await _repository.searchQueryImages(query);
    _searchImagesFetcher.sink.add(results);
  }
  void dispose() {
    _imagesFetcher.close();
  }
}

final ImagesBloc bloc = ImagesBloc();
