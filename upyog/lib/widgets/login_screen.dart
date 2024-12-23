import 'package:flutter/material.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color color = const Color(0xFF2A3170);
  Color color2 = const Color(0xFF8D143F);
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white,
          child: Column(children: [
            Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/image2.png',
                    height: 100,
                    width: 300,
                  ),
                  const Text(
                    'UPYOG',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        decorationThickness: 0.5),
                  )
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Mobile Number',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'MPIN',
                        hintText: 'Enter your MPIN',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black),
                          child: const Text('Forgot MPIN ?'),
                          onPressed: () {},
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black),
                          child: const Text('Login with OTP'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [color, color2],
                          ),
                        ),
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ))),
                  ],
                )),
            const SizedBox(height: 20),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'New on UPYOG ?',
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ));
                          },
                          child: const Text(
                            'Register Now',
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'OR',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: MouseRegion(
                    onEnter: (_) => setState(() => isHovered = true),
                    onExit: (_) => setState(() => isHovered = false),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 50,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: isHovered
                                ? Colors.blue.withOpacity(0.8)
                                : Colors.white,
                            border: Border.all(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Center(
                            child: Text("Login/Register with MeriPehchaan",
                                style: TextStyle(fontSize: 20)),
                          )),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
