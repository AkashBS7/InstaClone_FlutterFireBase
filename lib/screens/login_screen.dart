import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instaclone_flutterfirebase/resources/auth_methods.dart';
import 'package:instaclone_flutterfirebase/utils/colors.dart';
import 'package:instaclone_flutterfirebase/utils/utils.dart';
import 'package:instaclone_flutterfirebase/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64),
              TextFieldInput(
                  textEditingController: _emailController,
                  hintText: "Enter your Email",
                  textInputType: TextInputType.emailAddress),
              SizedBox(height: 24),
              TextFieldInput(
                  textEditingController: _passwordController,
                  hintText: "Enter your Password",
                  isPass: true,
                  textInputType: TextInputType.text),
              SizedBox(height: 24),
              InkWell(
                onTap: () {
                  loginuser();
                },
                child: Container(
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        )
                      : const Text('Log In'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Flexible(child: Container(), flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text('Dont have an account?'),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  SizedBox(width: 3),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: const Text('Sign Up',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      padding: const EdgeInsets.symmetric(vertical: 8),
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

  void loginuser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);

    if (res == 'Success') {
      print('LOgged in');
    } else {
      showSnackBar(context, res);
    }
    setState(() {
      isLoading = false;
    });
  }
}
