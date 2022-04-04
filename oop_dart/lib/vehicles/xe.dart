class Xe {
  String? brand; 
  int? productionYear; 

  Xe({required this.brand, required this.productionYear});
  


  int getAge(){
    return DateTime.now().year - this.productionYear!;
  }

  void chuyenCho(){
    print("Chuyen cho"); 
  }

}