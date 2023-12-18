import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ht/Signup_login/signup.dart';

import '../component/inputfield.dart';
import '../component/mainbutton.dart';
import '../component/toast.dart';
import '../component/validations.dart';
import '../payment/subscription_plan.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = true;
  final _cemail = TextEditingController();
  final _cpassword = TextEditingController();
  dynamic deviceid;

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
           color: Colors.black
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 30, left: 30, top: 50, bottom: 20),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('HumanTek Test', style: TextStyle(color: Colors.yellow, fontSize: 30),)
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Text("Log in",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 23,
                      ),
                      InputField(
                        hinttext: "Username / Email",
                        text: _cemail,
                        isObscureText: false,
                        eye: null,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 20,
                      ),
                      InputField(
                        hinttext: "Password",
                        text: _cpassword,
                        isObscureText: _passwordVisible,
                        eye: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                            size: 17,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const ForgetPassword()));
                            },
                            child: Text("Forgot password",
                            
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: Colors.yellow,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.yellow,
                                  
                                ))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Mainbutton(
                          buttontext: "Log in",
                          onPressed: () {
                            if (_cemail.text.isEmpty) {
                              alertDialog("Please Enter Your Email",
                                  const Color(0xffE9D502), Colors.black);
                            } else if (_cpassword.text.isEmpty) {
                              alertDialog("Please Enter Your Password",
                                  const Color(0xffE9D502), Colors.black);
                            } else if (!validateemail(_cemail.text)) {
                              alertDialog(
                                  "Email Formate Incorrect",
                                  const Color.fromARGB(255, 230, 9, 9),
                                  Colors.white);
                            } else if (!validatepassword(_cpassword.text)) {
                              alertDialog(
                                  "Password Should Contain Eight Alphabets and a Number",
                                  const Color.fromARGB(255, 230, 9, 9),
                                  Colors.white);
                            } else {
                             
                              Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SubscriptionPlanScreen(
                                  )));
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.020,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Don't have an account",
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 15,
                                
                              )),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const  SignupScreen()));
                            },
                            child: Text('SignUp',
                                style: GoogleFonts.inter(
                                  decoration: TextDecoration.underline,
                                  color: Colors.white,
                                fontSize: 15,
                                decorationColor: Colors.yellow,
                                )),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async {
        exit(0);
      },
    );
  }
}
