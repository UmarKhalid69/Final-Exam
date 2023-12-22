import 'package:final_exam_app/Screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(const LinearGradient(
        colors: [Colors.blue, Colors.red],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).hashCode), //Color(0xFFE5E5E5)
      body:
          //Email text field
          Column(
        children: [
          const SizedBox(
            height: 180,
          ),

          Center(
            child: SizedBox(
              width: 470,
              child: TextFormField(
                controller: emailController,
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  label: Text('Email'),
                  suffixIcon: Icon(Icons.email, color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //Password text field
          Center(
            child: SizedBox(
              width: 470,
              child: TextFormField(
                controller: passwordController,
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your password.',
                  label: Text('Password'),
                  suffixIcon: Icon(Icons.password, color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      //Login button
      floatingActionButton: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text)
              .then((value) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
              (Route<dynamic> route) => false,
            );
          }).onError((error, stackTrace) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error.toString()),
            ));
          });
        },
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Login'),
            Icon(Icons.arrow_forward_outlined),
          ],
        ),
      ),
    );
  }
}
