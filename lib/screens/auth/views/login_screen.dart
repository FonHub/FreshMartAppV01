import 'package:flutter/material.dart';
import 'package:shop/constants.dart';
import 'package:shop/route/route_constants.dart';

import 'components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          
          Positioned.fill(
            child: Image.asset(
              "assets/images/BGwelcome.png", 
              fit: BoxFit.cover,
            ),
          ),
          
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.2),
                
                Center(
                  child: Image.asset(
                    "assets/images/FreshMart-logo24.png",
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ยินดีต้อนรับ",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: defaultPadding / 2),
                      const Text(
                        "กรุณาเข้าสู่ระบบด้วยข้อมูลที่คุณกรอกในระหว่างการลงทะเบียน",
                      ),
                      const SizedBox(height: defaultPadding),
                      LogInForm(formKey: _formKey),
                      Align(
                        child: TextButton(
                          child: const Text("ลืมรหัสผ่าน"),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, passwordRecoveryScreenRoute);
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height > 700
                            ? size.height * 0.1
                            : defaultPadding,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                entryPointScreenRoute,
                                ModalRoute.withName(logInScreenRoute));
                          }
                        },
                        child: const Text("เข้าสู่ระบบ"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("ไม่ได้เป็นสมาชิกใช่ไหม?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, signUpScreenRoute);
                            },
                            child: const Text("สมัครสมาชิก"),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
