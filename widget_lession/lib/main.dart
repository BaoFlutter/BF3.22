import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController birthYearController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String ageStr = "Chưa xác định";
  String userName = "Chưa xác định" ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Màn hình tuổi"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              inputWidget(
                  lableText: "Họ Tên",
                  hintText: "Nhập họ tên",
                  controler: nameController),
              inputWidget(
                  lableText: "Năm sinh",
                  hintText: "Nhập năm sinh",
                  controler: birthYearController),
              ElevatedButton(
                child: Text("Tính tuổi"),
                onPressed: (){
                  setState(() {
                    ageStr = (DateTime.now().year - int.parse(birthYearController.text) ).toString();
                    userName = nameController.text;
                  });
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
                child: Card(
                  color: Colors.deepOrange,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text(userName),
                        const SizedBox(width: 20,),
                        Text(ageStr),
                      ],
                    )
                  )
                ),
              )
            ],
          ),
      ),
    );
  }

  Widget inputWidget({required String lableText, required String hintText, required controler })
  {
    return Container(
      padding: const EdgeInsets.only(right: 30, left: 30, top: 20, bottom: 20),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: lableText,
          hintText: hintText
        ),
        controller: controler,
      )
    );
  }
}





