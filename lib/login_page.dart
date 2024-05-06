import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/auth_service.dart';
import 'package:login/my_buttons.dart';
import 'package:login/my_text_field.dart';
import 'package:login/square_tile.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in
  void signUserIn() async {
    //loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    //sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      ///wrong email
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      }
      //wrong password
      else {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Incorrect Details'),
          );
        });
  }

  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xff653a1e),
            title: Text('Incorrect Details'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffaba76),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              //welcome back message
              Text(
                "Hey Buddy!",
                style: TextStyle(
                    color: Color(0xff653a1e),
                    fontSize: 40,
                    fontFamily: GoogleFonts.anton().fontFamily,
                    fontWeight: FontWeight.bold),
              ),

              //logo
              Container(
                height: 200,
                alignment: Alignment.center,
                child: Image.asset('assets/icons/logo.png'),
              ),
              //email
              MyTextField(
                controller: usernameController,
                hintText: 'E-mail or Username',
                obSecureText: false,
                prefixIcon: Icons.email,
              ),
              const SizedBox(
                height: 10,
              ),
              //password
              MyTextField(
                controller: passwordController,
                prefixIcon: Icons.lock,
                hintText: 'Password',
                obSecureText: true,
              ),
              const SizedBox(
                height: 10,
              ),

              //forgot
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false, // Set the initial value of the checkbox
                          onChanged: (bool? value) {
                            // Handle checkbox changes here
                          },
                        ),
                        const Text(
                          'Remember me',
                        ),
                      ],
                    ),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //signinnn button
              MyButton(
                text: 'Sign In',
                onTap: signUserIn,
              ),

              const SizedBox(
                height: 20,
              ),

              //continue with Text with a divider

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "Or Continue with:",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //sign in with other methods
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    imgPath: 'assets/icons/google.png',
                    onTap: () => AuthService().signInWithGoogle(),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  SquareTile(imgPath: 'assets/icons/apple.png', onTap: () {}),
                ],
              ),

              const SizedBox(
                height: 10,
              ),
              //register now
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // Add your functionality here
                      widget.onTap!();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.brown),
                      minimumSize: MaterialStateProperty.all(Size(580, 70)),
                      // Set the background color of the button
                      padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12)), // Adjust padding as needed
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white, // Set the text color of the button
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
