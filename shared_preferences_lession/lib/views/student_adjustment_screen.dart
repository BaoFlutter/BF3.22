import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_lession/resources/widgets/custom_button.dart';
import 'package:state_lession/resources/widgets/information_card.dart';
import 'package:state_lession/resources/widgets/input_widget.dart';
import 'package:state_lession/views/information_screen.dart';

import '../resources/strings.dart';
class StudentAdjustmentScreen extends StatefulWidget {
  const StudentAdjustmentScreen({Key? key}) : super(key: key);
  //1. createState : Tạo ra state - đối tượng , gán với buildcontext ( context)
  @override
  State<StudentAdjustmentScreen> createState() => _StudentAdjustmentScreenState();
}

class _StudentAdjustmentScreenState extends State<StudentAdjustmentScreen> {

  //2 . Biến mounted = true ;
  TextEditingController? mathController, liteturController , englishController;
  double? averageMark;
  String  adjustment = "Chưa xác định";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  //3. khởi động State

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mathController = TextEditingController();
    liteturController = TextEditingController();
    englishController  = TextEditingController();
  }
  //4. DidchangeDependencies
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  // 5. Hàm build
  @override
  Widget build(BuildContext context) {
    if(mounted) print("Biến mounted là true");
    return Scaffold(
      appBar: AppBar(
        title: Text(STUDENT_ADJUSTMENT),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(right: 30, left: 30),
          child: Column(
            children: [
              // TextField Điểm Toán
              InputWidget(
                  lableText: MATH_SCORE,
                  hintText: MATH_HINT,
                  controler: mathController),
              // TextField Điểm Văn
              InputWidget(
                  lableText: LITETURE_SCORE,
                  hintText: LITETURE_HINT,
                  controler: liteturController),
              // TextField Điểm Anh
              InputWidget(
                  lableText: ENGLISH_SCORE,
                  hintText: ENGLISH_HINT,
                  controler: englishController),
              CustomButton(
                  onPressed: (){
                    // 7. SetState - build lại với giá trị mới cập nhật đặt trong nó
                    setState(() {
                      averageMark = (double.parse(mathController!.text)+double.parse(liteturController!.text)+ double.parse(englishController!.text))/3;
                      adjustment = adjustStudent(mark: averageMark!);
                    });
                    saveInformationToLocalStorage(
                        averageScore: averageMark!,
                        adjustment: adjustment);
                  },
                  buttonText: ADJUSTMENT),
              // Button Đánh giá
              InformationCard(
                  lable1: AVERAGE_SCORE,
                  averageMark: averageMark??0,
                  lable2: GRADE,
                  adjustment: adjustment),
              TextButton(
                  onPressed: (){
                    var route = MaterialPageRoute(builder: (context)=>InformationScreen());
                    Navigator.push(context, route);
                  },
                  child: Text(CHANGE_PAGE))
              // Information Card
            ],
          ),
        ),
      )
    );
  }

  saveInformationToLocalStorage({ required double averageScore , required String adjustment}) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setDouble("average_score", averageScore);
    await prefs.setString("adjustment", adjustment);
  }
  // 8. deactivate - Không cho state hoạt động
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }
  // 9. dispose - Xoá state đi
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mathController!.dispose();
    englishController!.dispose();
    liteturController!.dispose();
  }
  // 6. did update widget
  @override
  void didUpdateWidget(covariant StudentAdjustmentScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  // 10. mounted = false


  String adjustStudent({required double mark})
  {
    if((mark > 10)|| (mark< 0)) return "Điểm không hợp lệ";
    if(mark < 5) return "Chưa Đạt";
    if(mark < 8.5) return "Đạt";
    return "Xuất sắc";
  }


}
