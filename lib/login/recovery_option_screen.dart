import 'package:flutter/material.dart';
import 'package:wander_animation/configs/routes/routes.dart';

class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({super.key});

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  int? value = null;
  List<String> options=[
    "Gửi mã xác nhận qua số điện thoại",
    "Gửi mã xác nhận qua Gmail",];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color(0xFF639854),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:80),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text("Hãy chọn một trong ba phương án sau đây",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children:
                      List<Widget>.generate(options.length, (index){
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              children: [
                                ChoiceChip(
                                  backgroundColor: Colors.white,
                                  selectedColor: Colors.white,
                                  label: Icon(
                                    value==index?Icons.radio_button_checked:Icons.radio_button_unchecked,
                                    color: Color(0xFFF6E2A1),
                                  ),
                                  selected: value==index,
                                  onSelected: (choice){
                                    setState(() {
                                      value=choice?index:null;
                                    });
                                  },
                                ),
                                Text(options[index])
                              ],
                            ),
                          ),
                        );
                      }),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 400,
                height: 50,
                child: ElevatedButton(
                  onPressed: value!=null?(){
                    switch(value){
                      case 0:
                        Navigator.pushNamed(context, RouteName.otpScreen);
                        break;
                      case 1:
                        Navigator.pushNamed(context, RouteName.otpScreen);
                        break;
                      case 2:
                        Navigator.pushNamed(context, RouteName.otpScreen);
                        break;
                    }
                  }:null,
                  child: Text("Tiếp tục"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF6E2A1),
                      disabledBackgroundColor: Color(0xFFC4C4C4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xFF639854),
    );
  }
}

