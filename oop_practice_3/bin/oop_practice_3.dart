import 'package:oop_practice_3/oop_practice_3.dart' as oop_practice_3;
import 'package:oop_practice_3/person/person.dart';

void main(List<String> arguments) {

  Person lan = Person(id: "AD12244", name:"Pham Lan"); 
  lan.setBirthYear(birthYear: 2000);
  lan.getInfor();
  
}
