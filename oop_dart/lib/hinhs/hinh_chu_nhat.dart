class HinhChuNhat {
double? chieuDai; 
double? chieuRong; 


HinhChuNhat({ required this.chieuDai, required this.chieuRong});

double tinhChuVi(){
  return (this.chieuDai! + this.chieuRong! )* 2; 
}

double tinhDienTich(){
  return this.chieuDai! * this.chieuRong!;
}

}