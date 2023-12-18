import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../component/inputfield.dart';
import '../component/mainbutton.dart';
import '../component/toast.dart';
import '../component/validations.dart';
import '../payment/subscription_plan.dart';
import 'loginscreen.dart';

class SignupScreen extends StatefulWidget {
  final dynamic deviceid;
  const SignupScreen({this.deviceid,super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _passwordVisible = true;
  final TextEditingController _signupname = TextEditingController();
  final TextEditingController _signupphone = TextEditingController();
  final TextEditingController _signupemail = TextEditingController();
  final TextEditingController _signuppassword = TextEditingController();
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //final signupauthviewmodel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: Colors.black
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 30, left: 30, top: 50, bottom: 20),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: const Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.key, color: Colors.yellow,size: 80,)
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    Text("Sign Up",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          textStyle: Theme.of(context).textTheme.headlineLarge,
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                    ),
                    InputField(
                      hinttext: "John William",
                      text: _signupname,
                      isObscureText: false,
                      eye: null,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 20,
                    ),
                    InputField(
                      hinttext: "Phone",
                      text: _signupphone,
                      isObscureText: false,
                      eye: null,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 20,
                    ),
                    InputField(
                      hinttext: "Email",
                      text: _signupemail,
                      isObscureText: false,
                      eye: null,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 20,
                    ),
                    InputField(
                      hinttext: "Password",
                      text: _signuppassword,
                      isObscureText: _passwordVisible,
                      eye: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.001,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.070),
                          child: Checkbox(
                            value: isChecked,
                            checkColor: Colors.white,
                            activeColor: Colors.red,
                            side:
                                const BorderSide(width: 1, color: Colors.white),
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.020,
                        ),
                        Text(
                          'I Agree with terms and conditions',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 15,
                            textStyle:
                                Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Mainbutton(
                        buttontext: "Sign up",
                        onPressed: () async {
                          // String? referralCode = await initReferrerDetails();
                          if (_signupname.text.isEmpty) {
                            alertDialog("Please Enter Your Name",
                                const Color(0xffE9D502), Colors.black);
                          } else if (_signupphone.text.isEmpty) {
                            alertDialog("Please Enter Your Phome Number",
                                const Color(0xffE9D502), Colors.black);
                          } else if (_signupemail.text.isEmpty) {
                            alertDialog("Please Enter Your Email",
                                const Color(0xffE9D502), Colors.black);
                          } else if (_signuppassword.text.isEmpty) {
                            alertDialog("Please Enter Your Password",
                                const Color(0xffE9D502), Colors.black);
                          } else if (!validatename(_signupname.text)) {
                            alertDialog(
                                "Name Formate Incorrect",
                                const Color.fromARGB(255, 230, 9, 9),
                                Colors.white);
                          } else if (!validatephonenumber(_signupphone.text)) {
                            alertDialog(
                                "Phone Number Should Contain Only Digits",
                                const Color.fromARGB(255, 230, 9, 9),
                                Colors.white);
                          } else if (!validateemail(_signupemail.text)) {
                            alertDialog(
                                "Email Formate Incorrect",
                                const Color.fromARGB(255, 230, 9, 9),
                                Colors.white);
                          } else if (!validatepassword(_signuppassword.text)) {
                            alertDialog(
                                "Password Sould Contain Eight Characters, At Least and One Number",
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
                      height: MediaQuery.of(context).size.height * 0.010,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Already have an account",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 15,
                              textStyle:
                                  Theme.of(context).textTheme.headlineMedium,
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const LoginScreen()));
                          },
                          child: Text('Log in',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                color: Colors.yellow,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.yellow,
                                textStyle:
                                    Theme.of(context).textTheme.headlineMedium,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 20,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
