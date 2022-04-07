import 'package:oop_practice_3/person/person_sample.dart';

class Person extends PersonSample{
  String? id; 
  String? name; 
  int? _birthYear;

  Person({required this.name, required this.id});

  int getBirthYear(){
    return this._birthYear!; 
  }

  void setBirthYear({required birthYear}){
    this._birthYear = birthYear; 
  }


  @override
  int getAge() {
    // TODO: implement getAge
    return DateTime.now().year - this._birthYear!; 
  }

  @override
  void getInfor() {
    print("Tên: ${this.name}" + "\n" + "Tuổi: ${getAge()}"); 
  }

}