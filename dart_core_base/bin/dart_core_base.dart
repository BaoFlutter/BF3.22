import 'package:dart_core_base/dart_core_base.dart' as dart_core_base;

bool isChecked = true; // Biến toàn cục
void main(List<String> arguments) {
  // Khái niệm biến : variable 
  // Static 
  int number = 10 ;
  double mathPoint = 9.5; 
  String name = "Báo Flutter" ;
  bool isLogined = true; 
  List<int> numberList = [1, 6, 15, 9, 20 ];
  // Index                0  1  2   3   4
  // Độ dài : length      5
  const String API_KEY = "Khshdahda9334jaOAD"; 
  // biến hằng : 1 khi tạo ra thì không thể cập nhật lại giá trị cho nó
  number = 50; 
  //API_KEY = "ịoifhwehfwfqw"; - Sai 
  final String USER_NAME = "PHAM VAN BAO" ; 
  // USER_NAME = "Hello" ;
  final String NAME = name; 
  print("Bên trong phải là kiểu String"); 
  print("$number"); 
  print(number.toString());
  print("Biểu thức: ${number*2}"); 
  // Kiểu dữ liệu dynamic : ( var , dynamic );
  var number1 = 1;  // int 
  var number2 = "Hai";
  dynamic number4 = 8.5;  // double 
  dynamic number5 = "Hello";
  //========Khác nhau ========
  number1 = 30 ; 
  //number1 = "hihi"; // Lỗi 
  number4 = "haha"; 
  // Sử dụng hàm 
  int sum = tinhTong(number, number1);
  print("Tổng hai số là: $sum");

  double a = 5.4; 
  double b = 8.6; 
  double chuVi = tinhChuViHinhChuNhat(chieuDai: a, chieuRong: b);
  print("Chu vi hình cn: $chuVi");
  print("Tổng hai số là: $sum");

  //===== Biến toàn cục, Biến cục bộ 
  /*
  Biến toàn cục : Không được tạo ra bên trong hàm nào cả ; 
  Biến cục bộ : Được tạo ra ở bên trong hàm nào đó 
  */

  // ============ Null Safety =====================
  // phiên bản cũ và các ngôn ngữ khác 
  int size ; // khi không khởi tạo giá trị size thì size = null;
  // với Dart > 2.12 
  int? mSize ; // mSize != null  , muốn mSize = null thì int? mSize ;
  //print(mSize) // Báo đỏ vì mSize không có gịá trị gì cả 
  print(mSize);
  //number = mSize! + 1; // Đặt ! đăng sau biến null 
  number = mSize??2 + 1; 
  print("$number");
  /*
  // =============== TỔNG KẾT NullSafety =========
  1. khi biến không được khởi tạo giá trị thì đặt ? đằng sau kiểu dữ liệu 
  2. Khi sử dụng biến null safety thì thêm ! vào sau biến đó 
  3. Làm quen với ?? sau biến null 
  */
  findEvenNumbers(numberList: numberList);

  // Toán tử gán 
  // += 
  number += 2; // number = number + 2 ; 
  // Toán tử so sánh 
  // kết qủa true hoặc false
  if(3>2 ){
    print("Đúng rồi");
  }
  // ||, && 
  // || Chỉ bằng false khi cả 2 biểu thức bằng false , còn lại là true 
  if((3<2)||(1>5)) print("Sai rồi");
  //  false || false = false ;
   else print(false);
  // && : Chỉ bằng true khi cả 2 biểu thức bằng true , còn lại là false hết 

  if((3>2)||(1<5)) print("Đúng rồi");
  //  true || true = true ;
   else print(false);
  
  List<String> strList = [];
  List<String> strList1 = ["hh", "0dflfdsf"];
  List strList2 = [1, 3, true, "hello", 8.5];
  

  // Map : Sau này json là tập hơp các cặp - key : value 
  Map<String, dynamic> map = {
    "name" : "Báo Flutter",
    "age" : 31, 
    "address": "Ha noi",
    "birth_year": 1991
  };
  print(map['name']);
  Map map2 = {
    1: "ho",
    true: 5
  };
  

}
// Cấu trúc: Chỉ được dùng bên trong hàm 
// Rẽ nhánh : (if..else, switch)
// Vòng lăp: for , for...in , while, do...while




// Khai niệm về hàm 
// 1. Tạo hàm : Tách riêng không nằm trong hàm nào
// 2. Sử dụng hàm: Có thể sử dụng bên trong nhiều hàm khác 

// Tạo hàm : Nên sử dụng biến cục bộ thay vì dùng biến toàn cục 
int tinhTong(int a, int b ){
  return a+b; 
}

double tinhChuViHinhChuNhat({ required double chieuDai, required double chieuRong, double? chieuCao }){
  return (chieuDai+ chieuRong) * 2; 
}

// Khi kiểu dữ liệu đầu ra là dynamic thì có thể bỏ chữ dynamic 
tinhHieu({ required  soTru , required  soBiTru})
{
  return soTru - soBiTru;
}
// Khuyến cáo : Nên sử dụng kiệu dữ liệu tĩnh nếu mà biết kiểu dữ liệu tĩnh đó
tinhHieu2({ required  soTru , required  soBiTru}) => soTru - soBiTru;
// => a; { return a; } 

bool isEven({required int number})
{
  if(number%2 == 0 ) return true; 
  return false; 
}

void findEvenNumbers({required List<int> numberList }){
  /* For....in
  for(int number in numberList)
  {
    if(isEven(number: number)) print("Số chẵn: " +  number.toString());
  }
  */
  /*
  List<int> numberList = [1, 6, 15, 9, 20 ];
  // Index                0  1  2   3   4
  // Độ dài : length      5
  //    numberList[3] = 9;
  */
  /* For với index

  for(int i = 0 ; i< numberList.length; i++ ) // i++ ' i = i+1;
  {
     
    if(isEven(number: numberList[i]))  print("Số chẵn: " +  numberList[i].toString());
    // break;  gặp là thoát khỏi vòng for 
    // return;  : Kết thúc hàm đó và không chạy lệnh bên dưới 
    // continue; sẽ ngưng vòng lặp đó và bắt vòng mới 
    

  }
  */
  /* while
  int count = 0 ; 
  while(count<numberList.length)
  {
    if(isEven(number: numberList[count]))  print("Số chẵn: " +  numberList[count].toString());
    count++; 

  }
  */
  // do...while
  int count = 0 ; 
  
  do {
    if(isEven(number: numberList[count]))  print("Số chẵn: " +  numberList[count].toString());
    count++; 

  }while(count<numberList.length);

  print("Vòng for đã kết thúc");

}

void checkNumber({required int number})
{
  switch(number%2){
    case 0:
    print("$number là số chẵn");
    break;

    case 1: 
    print("$number là số lẻ");
    break;

    default:
    print("Số không hợp lệ");
    break;

  }
}