import 'package:flutter/material.dart';
import 'package:wander_animation/configs/routes/routes.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  var _otpPin = TextEditingController();
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
                    "Mã xác thực đã được gửi.\n Vui lòng điền mã vào ô bên dưới",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Pinput(
                  length: 6,
                  controller: _otpPin,
                  onChanged: (pin){
                    if(pin.length==6)
                    {
                      setState(() {
                        isActive=true;
                      });
                    }
                    else
                    {
                      setState(() {
                        isActive=false;
                      });
                    }
                  },
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(onPressed: (){},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Gửi lại mã OTP")),
                )
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
