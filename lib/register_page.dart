import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/my_buttons.dart';
import 'package:login/my_text_field.dart';


class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user up
  void signUserUp() async {
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
      if (passwordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );
      } else {
        showErrorMessage('password dont match');
      }
      //pop loadibg circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      ///wrong email
      Navigator.pop(context);
      ///showw error mssg
      showErrorMessage(e.code);
    }
  }

//error message
  void showErrorMessage(String Message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(Message),
        );
      },
    );
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
              MyTextField(
                controller: confirmpasswordController,
                prefixIcon: Icons.lock,
                hintText: 'Confirm Password',
                obSecureText: true,
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
                text: 'Sign Up',
                onTap: signUserUp,
              ),

              const SizedBox(
                height: 10,
              ),

              //Login now
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
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
                      'Login Now',
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
