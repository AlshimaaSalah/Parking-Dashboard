import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/my_theme.dart';

import 'loginn.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String routName = 'up';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isObscure = true;
  final auth = FirebaseAuth.instance;
  late String email;
  late String pass;
  final formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Smart Parking Dashboard'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/dash2.jpeg'),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Center(
                  child: Image.asset(
                    'assets/images/dash1.PNG',
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                  flex: 5,
                  child: Form(
                      key: formkey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .35,
                              child: TextFormField(
                                onChanged: (value) {
                                  email = value;
                                },
                                controller: emailcontroller,
                                validator: (value) {
                                  if (value!.trim().isEmpty ||
                                      value!.contains('@gmail.com') == false) {
                                    return 'please enter a valid email';
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'test@gmail.com',
                                  prefixIcon: Icon(Icons.email_sharp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.black26, width: 4),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .35,
                              child: TextFormField(
                                onChanged: (value) {
                                  pass = value;
                                },
                                controller: passcontroller,
                                validator: (value) {
                                  if (value!.trim().isEmpty ||
                                      value!.length <= 6) {
                                    return 'Password must be more than six characters';
                                  }
                                },
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.password_sharp),
                                  suffixIcon: IconButton(
                                      icon: Icon(_isObscure
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      }),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.black26, width: 4),
                                  ),
                                ),
                              ),
                            ),
                            // TextButton(
                            //     style: ButtonStyle(
                            //         alignment: Alignment.bottomRight),
                            //     onPressed: () {},
                            //     child: Text(
                            //       'Forgot your password?',
                            //       style: TextStyle(
                            //           color: MyTheme.lightPrimaryColor),
                            //     )),
                            SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(20),
                                  backgroundColor: MyTheme.lightPrimaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              onPressed: () async {
                                try {
                                  if (formkey.currentState!.validate()) {
                                    var user = await auth
                                        .createUserWithEmailAndPassword(
                                            email: email, password: pass);
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                              child: Text('Sign Up'),
                            ),
                            //SizedBox(height: 5,),
                            TextButton(
                                style: ButtonStyle(
                                    alignment: Alignment.bottomRight),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(Login.routName);
                                },
                                child: Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                      color: MyTheme.lightPrimaryColor),
                                )),
                          ],
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
