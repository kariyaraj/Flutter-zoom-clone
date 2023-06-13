import 'package:flutter/material.dart';
import 'package:zoom_clone/Widgets/custom_button.dart';
import 'package:zoom_clone/resources/auth_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods=AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Start or join a meeting",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image.asset("Assets/images/zoomonboarding.jpeg"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: CustomButton(text: "Google Sign in", onPressed: ()async {
            bool res=await _authMethods.signInWithGoogle(context);
            if(res){
            Navigator.pushNamed(context, '/home');
            }else{
            }
            },),
          ),
        ],
      ),
    );
  }
}
