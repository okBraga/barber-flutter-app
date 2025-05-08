import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPh = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40.0),
                  const Text(
                    'Create new account',
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'Please fill in the form to continue',
                  ),
                  const SizedBox(height: 60.0),
                  // CustomTextField(
                  //   controller: userName,
                  //   image: 'user.svg',
                  //   keyBordType: TextInputType.name,
                  //   hintText: 'Full Name',
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter your full name';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // CustomTextField(
                  //   controller: userEmail,
                  //   keyBordType: TextInputType.emailAddress,
                  //   image: 'user.svg',
                  //   hintText: 'Email',
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter your email';
                  //     }
                  //     const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                  //     if (!RegExp(emailPattern).hasMatch(value)) {
                  //       return 'Please enter a valid email address';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // CustomTextField(
                  //   controller: userPh,
                  //   image: 'user.svg',
                  //   keyBordType: TextInputType.phone,
                  //   hintText: 'Phone Number',
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter your phone number';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // CustomTextField(
                  //   controller: userPass,
                  //   obscureText: true,
                  //   image: 'hide.svg',
                  //   hintText: 'Password',
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter your password';
                  //     }
                  //     if (value.length < 6) {
                  //       return 'Password must be at least 6 characters long';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  const SizedBox(height: 80.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Cadastrar'),
                  ),

                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have an account? ',
                        style: TextStyle(fontSize: 14),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
