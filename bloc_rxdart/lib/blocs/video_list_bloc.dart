import 'package:api_lession/data_sources/repository.dart';
import 'package:api_lession/models/video.dart';
import 'package:rxdart/rxdart.dart';

class VideoListBloc {
  final _repository = Repository();

  // Tạo 1 subject
  final videoListSubject = PublishSubject<List<Video>>();
  // 1. Đẩy data vào bloc

  putDataIntoBloc() async {
    List<Video> videoList = await _repository.fetchAllVideo();
    videoListSubject.sink.add(videoList);
  }
  // 2 . Return data Stream
  Stream<List<Video>> get videoListStream => videoListSubject.stream;

  // close
  dispose(){
    videoListSubject.close();
  }



}