import 'package:flutter/material.dart';
import 'package:flutter_gradient_text/flutter_gradient_text.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Color color = const Color(0xFF2A3170);
  Color color2 = const Color(0xFF8D143F);
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Container(
            child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/image1.png',
                  height: 80,
                  width: 100,
                ),
              ),
              GradientText(
                  const Text('UPYOG',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  colors: [color, color2]),
            ],
          ),
        )),
        const SizedBox(height: 20),
        Container(
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Text(
                'Let us start by verifying your mobile ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Center(
                child: Text('number',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              SizedBox(height: 10),
              Text('We will send an OTP on this number for verification.')
            ]),
          ),
        ),
        const SizedBox(height: 40),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Mobile Number',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  prefixText: '+91-',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                    'Remember, this mobile number will be used for login')),
          ]),
        ),
        Container(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                const Column(
                  children: [
                    Text('I agree to the terms and condition of the'),
                    Text(
                      'End-user-license-agreement(EULA)',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue),
                    )
                  ],
                ),
              ],
            )),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('You have been registered successfully'))),
          child: Container(
            // padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [color, color2])),
            height: 50,
            width: 330,
            // color: Colors.transparent,
            child: const Center(
                child: Text('Register',
                    style: TextStyle(fontSize: 20, color: Colors.white))),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account ? ',
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
              child: const Text(
                'Login Here',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
            )
          ],
        )
      ]),
    );
  }
}
