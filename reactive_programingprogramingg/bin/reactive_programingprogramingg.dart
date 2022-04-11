import 'package:reactive_programingprogramingg/reactive_programingprogramingg.dart' as reactive_programingprogramingg;
import 'package:rxdart/rxdart.dart'; 

void main(List<String> arguments) {
  //demoBehaviourSubject();
  //demoPublishSubject();
  demoReplaySubject();
 
}
// Lấy tất cả các dữ liệu sau thời điểm đặt lắng nghe, lấy thêm 1 giá trị gần nhất thêm vào trước đó
demoBehaviourSubject(){
  // Tạo ra 1 Subject - Tạo ra 1 Stream 
  BehaviorSubject subject = BehaviorSubject<int>();

  // Lấy dữ liệu 
  subject.listen((number){
     print("Lấy dữ liệu lần 1: $number");
  });
  subject.add(101); 
  subject.add(102);
  subject.listen((number){
     print("Lấy dữ liệu lần 2: $number");
  });
  subject.add(201); 
  subject.add(202);
}

// Lấy tất cả các dữ liệu sau thời điểm đặt lắng nghe
demoPublishSubject(){
  // Tạo ra 1 Subject - Tạo ra 1 Stream 
  PublishSubject subject = PublishSubject<int>();

  // Lấy dữ liệu 
  subject.listen((number){
     print("Lấy dữ liệu lần 1: $number");
  });
  subject.add(101); 
  subject.add(102);
  subject.listen((number){
     print("Lấy dữ liệu lần 2: $number");
  });
  subject.add(201); 
  subject.add(202);
}

// Lấy tất cả các dữ liệu có trong Stream 
demoReplaySubject(){
  // Tạo ra 1 Subject - Tạo ra 1 Stream 
  ReplaySubject subject = ReplaySubject<int>();

  // Lấy dữ liệu 
  subject.listen((number){
     print("Lấy dữ liệu lần 1: $number");
  });
  subject.add(101); 
  subject.add(102);
  subject.listen((number){
     print("Lấy dữ liệu lần 2: $number");
  });
  subject.add(201); 
  subject.add(202);
}

