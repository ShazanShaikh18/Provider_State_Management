import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // ValueNotifier<bool> toggle = ValueNotifier<bool>(false);


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        title: const Text('Login', style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email'
              ),
            ),
            const SizedBox(height: 20,),

            // ValueListenableBuilder(valueListenable: toggle, builder: (context, value, child) {
            //   return TextFormField(
            //   obscureText: true,
            //   controller: passwordController,
            //   decoration: InputDecoration(
            //     hintText: 'Password',
            //     suffix: InkWell(
            //       onTap: () {
            //         toggle.value = ! toggle.value;
            //       },
            //       // this is ternary operator
            //       child: Icon(toggle.value? Icons.visibility_off_outlined : Icons.visibility))
            //   ),
            // );
            // },),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                suffix: InkWell(
                  onTap: () {
                    toggle.value = ! toggle.value;
                  },
                  // this is ternary operator
                  child: Icon(toggle.value? Icons.visibility_off_outlined : Icons.visibility))
              ),
            ),
            SizedBox(height: 50,),

            InkWell(
              onTap: () {
                authProvider.login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: authProvider.loading ? const CircularProgressIndicator(color: Colors.white,) : const Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}