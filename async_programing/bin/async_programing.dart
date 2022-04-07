import 'package:async_programing/async_programing.dart' as async_programing;

void main(List<String> arguments) async {
  /*
  // async , await, future 
  /*
  static - future 
  future -> static : đặt await trước kiểu dữ liệu future và kèm vs async ở đầu hàm 
  */
  print("Chương trình bắt đầu"); 
  var number = await makeLateNumber(); 
  print(number); 
  print("Chương trình kết thúc"); 
  */
  // then : ( dữ liệu future ). then((value){})
  print("Chương trình bắt đầu"); 
   makeLateNumber().then((number) {
    print("Số nhận được sau 5s là: $number");
   });
 
  print("Chương trình kết thúc"); 

  //lấy dữ liệu trong stream 
  Stream<int> numberStream1 = makeNumberStream(); 
  Stream<int> numberStream2 = makeStream(); 
  // Cách 1: dùng listen 
  /*
  numberStream1.listen((number) {
    print("Số lấy từ Stream 1 là : $number"); 
   });
   */
  numberStream2.listen((number) {
    print("Số lấy từ Stream 2 là : $number"); 
   });
  //
  // Cách 2: Lấy dữ liệu từ Stream bằng await async + for 
  readStream(numberStream: numberStream1);
 

  // Stream , listen , yield + async* 


}

void readStream({required Stream<int> numberStream}) async
{
  await for(int number in numberStream ) {
    if(number == 5 ) break;
    print ("Dữ liệu từ Stream là: $number ");

  }

}

Future<int> makeLateNumber(){
  return Future.delayed(Duration(seconds: 5), (){
    return 2; 
  });
}
// tạo stream 
// cách 1: 
Stream<int> makeNumberStream(){
  return Stream<int>.periodic(Duration(seconds: 2), makeNumberUp); 
}
// cách 2 
Stream<int> makeStream() async* {
  for(int i = 1; i<= 10; i++)
  {
    yield i; 
  }
}





int makeNumberUp(int value)=> value + 1; 

