import 'package:try_catchcatchh/try_catchcatchh.dart' as try_catchcatchh;

void main(List<String> arguments) {
  var input = "Flutter";
  /*
  // 1. đặt khối lệnh nghi có ngoại lệ vào khối try 
  try{
     int number = int.parse(input);
  }
  catch(e)  // 1. Không làm cho chương trình dừng lại và chạy tiếp ; 2. cho biết exception đó là loại gì 
  {
    print(e.toString());
  }
  */
 /*
  try{
     int number = int.parse(input);
  }
  on FormatException{  // Xử lý với 1 exception cụ thể
    print("dữ liệu đầu vào không phải là số");
  }
  catch(e)   
  {
    print(e.toString());
  }
  */

  try{
     int number = int.parse(input);
  }
   catch(e)   
  {
    print(e.toString());
  }

  finally{
    print("Khối lệnh bắt buộc phải được thực hiện");
  }


  print("Chương trinhf kết thúc");

  danhGiaHocSinh(diemTB: 9);
  try{
    danhGiaHocSinh(diemTB: -3.6);
    }
  catch(e)
  {
    print(e.toString());
  }
  
}
// throw Exception 

void danhGiaHocSinh({ required double diemTB}){
  if((diemTB<0) ||(diemTB >10)) throw Exception("MarkExcetion - Điểm không được âm và lớn hơn 10");
  if(diemTB < 5 ) print("Không Đạt"); 
  else if(diemTB <8.5) print("Đạt"); 
  else print("Xuất sắc");
}

