import 'package:flutter/material.dart';
import 'package:wander_animation/configs/routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final id = TextEditingController();
  final pass = TextEditingController();
  bool loginButtonState = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginButtonState = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color(0xFF639854),
        ),
        backgroundColor: const Color(0xFFffffff),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10) ,bottomRight: Radius.circular(10))
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:80),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Đăng nhập", style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: TextField(
                        controller: id,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "Mã đăng nhập",
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: Color(0xFFF6E2A1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xFFF6E2A1),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      ),
                    ),
                    TextField(
                      onChanged: (text){
                        if(id.text.isNotEmpty&&pass.text.isNotEmpty)
                        {
                          setState(() {
                            loginButtonState = true;
                          });
                        }
                        else if(id.text.isEmpty||pass.text.isEmpty)
                        {
                          setState(() {
                            loginButtonState = false;
                          });
                        }
                      },
                      controller: pass,
                      obscureText: true,
                      obscuringCharacter: "⬤",
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: "Mật khẩu",
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFFF6E2A1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color(0xFFF6E2A1)
                            ),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(onPressed: (){
                        Navigator.pushNamed(context, RouteName.recoveryScreen);
                      },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Quên mật khẩu?"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 400,
                height: 50,
                child: ElevatedButton(onPressed: loginButtonState?(){
                  Navigator.pushNamed(context, RouteName.homePage);
                }:null,
                    child: Text("Đăng nhập"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF6E2A1),
                        disabledBackgroundColor: Color(0xFFC4C4C4),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        )
                    )
                ),
              ),
            ],
          )
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF639854),
    );
  }
}

