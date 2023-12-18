import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Signup_login/loginscreen.dart';
import '../component/mainbutton.dart';

class PaymentSuccessfulScreen extends StatefulWidget {
  const PaymentSuccessfulScreen({super.key});

  @override
  State<PaymentSuccessfulScreen> createState() => _PaymentSuccessfulScreenState();
}

class _PaymentSuccessfulScreenState extends State<PaymentSuccessfulScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
      color: Colors.black
      ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration:  BoxDecoration(
            color: const Color.fromARGB(218, 254, 255, 255).withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(20))
                    ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.verified ,size: MediaQuery.of(context).size.height * 0.16,color: Colors.yellow,),
                  Text("Successful!",style: GoogleFonts.inter(textStyle: Theme.of(context).textTheme.headlineLarge,color: Colors.yellow,)),
                  Padding(
                    padding:  EdgeInsets.symmetric( horizontal: MediaQuery.of(context).size.height * 0.035),
                    child: Text("Voila! you have successfully made the payment.",textAlign: TextAlign.center, style:  GoogleFonts.inter(color: Colors.yellow,textStyle: Theme.of(context).textTheme.bodySmall,)),
                  ),
                  Mainbutton(buttontext: "Continue", 
                  onPressed: (){
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen(
                                  )));
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}