import 'package:oop_dart/vehicles/xe.dart';

class XeVeSinh extends Xe{
  
  XeVeSinh({required String? brand, required int? productionYear}) : super(brand: brand, productionYear: productionYear);

  // Tất cả thuộc tính và phương thức public của class cha thì cũng thuộc về class con

}