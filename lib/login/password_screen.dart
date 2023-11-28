import 'package:flutter/material.dart';
import 'package:wander_animation/configs/routes/routes.dart';

class PassPage extends StatefulWidget {
  const PassPage({super.key});

  @override
  State<PassPage> createState() => _PassPageState();
}

class _PassPageState extends State<PassPage> {
  var _passController = TextEditingController();
  var _confirmController = TextEditingController();
  var isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color(0xFF639854),
        ),
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10))
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 70, bottom: 40),
                  child: Text(
                    "Đã xác thực thành công.\n Vui lòng điền mật khẩu mới vào ô bên dưới",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  obscureText: true,
                  obscuringCharacter: '⬤',
                  controller: _passController,
                  onChanged: (text){
                    if(text.length>=8 && _passController.text==_confirmController) {
                      setState(() {
                        isActive=true;
                      });
                    } else {
                      setState(() {
                        isActive=false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: (_passController.text.length>=8)?Color(0xFF76C115):Color(0xFFF6E2A1), width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Nhập mật khẩu mới...",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  obscureText: true,
                  obscuringCharacter: '⬤',
                  controller: _confirmController,
                  onChanged: (text){
                    if(text.length>=8 && _passController.text==_confirmController) {
                      setState(() {
                        isActive=true;
                      });
                    } else {
                      setState(() {
                        isActive=false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: (_confirmController.text==_passController.text)?Color(0xFF76C115):Color(0xFFF6E2A1), width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Nhập lại mật khẩu...",
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: TextButton(onPressed: (){},
                //       style: TextButton.styleFrom(
                //         padding: EdgeInsets.all(0),
                //         foregroundColor: Colors.white,
                //       ),
                //       child: const Text("Gửi lại mã OTP")),
                // )
              ],
            ),
            SizedBox(
              width: 400,
              height: 50,
              child: ElevatedButton(
                  onPressed: isActive?(){
                    Navigator.pushNamed(context, RouteName.passScreen);
                  }:null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF6E2A1),
                    disabledBackgroundColor: Color(0xFFC4C4C4),
                  ),
                  child: const Text("Tiếp tục")),
            )
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF639854),
    );
  }
}
