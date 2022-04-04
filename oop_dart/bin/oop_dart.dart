

import 'package:oop_dart/hinhs/hinh_vuong.dart';
import 'package:oop_dart/vehicles/xe_tai.dart';

import 'user.dart';

void main(List<String> arguments) {
  //User bao = User(); // Tạo đối tượng , tạo instance
  User bao = User(userName: "Bao Flutter", address:"Ha Noi", birthYear:1991); 

  bao.userName = "Bao";
  print("Họ và tên là: "+ bao.userName!+ " Địa chỉ: " + bao.address!);
  int age = bao.getAge();
  print("Có tuổi là: $age");

  User hoa = User(userName: "Pham Thi Hoa ", address:"Da Nang", birthYear:1996);
  User lan = User(userName: "Thu Lan ", address:"TPHCM", birthYear:1990);
  List<User> userList = []; 
  userList.add(bao);
  userList.add(hoa); 
  userList.add(lan); 

  User user = findOldestUser(userList: userList);
  print("NGười có tuổi lớn nhất là : ${user.userName}" + " có tuổi là: ${user.getAge()}");

  bao.setPhoneNumber(phoneNumber: "0349582808");
  String soDienThoai = bao.phoneNumber;

  print(soDienThoai);

  String key = User.API_KEY ; 
  //================= Đặc tính OOP ===========
  XeTai xeTaiHuynDai = XeTai(brand: "HuynDai", productionYear: 2009); 
  xeTaiHuynDai.printInformation();
  xeTaiHuynDai.chuyenCho();

  HinhVuong hinhVuong = HinhVuong(canh: 12.0);
  double dienTichHinhVuong = hinhVuong.tinhDienTich();
  print("Diện tích $dienTichHinhVuong");


}

User findOldestUser({ required List<User> userList})
{
  User? result; 
  int age = 0; 
  for(User user in userList)
  {
    if(age <= user.getAge()) {
      age = user.getAge();
      result = user;
    }
  }
  return result!; 
}
