import 'package:oop_dart/vehicles/xe.dart';

class XeTai extends Xe{

  XeTai({String? brand, int? productionYear}):super(brand: brand, productionYear: productionYear);

  // Tất cả thuộc tính và phương thức public của class cha thì cũng thuộc về class con
  // Khi class cha có hàm khởi tạo không phải mặc đinh thì class con khởi tạo cũng phải khởi tạo cho class cha
  // Super, override 
  void printInformation(){
    print("Xe tải ${super.brand} có tuổi là: ${super.getAge()}");
  }

  @override
  void chuyenCho() {
    // TODO: implement chuyenCho
    print("Chuyên chở vật liệu xây dưng");
  }





}