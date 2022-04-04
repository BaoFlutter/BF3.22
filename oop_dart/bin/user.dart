class User {
// Thuộc tính - các biến 
String? userName; // public
int? birthYear;  // public 
String? address;  // public 
String? _phoneNumber; // private 

static String API_KEY = "bngfkom9525knfkwfn";

// Phương thức - các hàm 
// Hàm khởi tạo 
//User(); 
User({ required this.userName, required this.address, required this.birthYear});

int getAge(){
  return DateTime.now().year - this.birthYear!;
}
// Biến private, hàm private : Chỉ được sử dụng bên trong class, không được sử dụng bên ngoài 
int _showMoney({ required int asset}){  // private 
  return asset; 
}
// Getter 
String getPhoneNumber(){
  return this._phoneNumber!;
}
String get phoneNumber => this._phoneNumber!;

// Hàm setter 
void setPhoneNumber({required String phoneNumber}){
  this._phoneNumber = phoneNumber;
}



}