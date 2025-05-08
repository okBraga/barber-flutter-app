import 'package:barber_app/shared/navigation/app_routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;

  void togglePasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed(AppRoutes.home);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50.0),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Please sign in to your account',
                ),
                const SizedBox(height: 60.0),
                // CustomTextField(
                //   controller: _emailController,
                //   image: 'user.svg',
                //   hintText: 'Email',
                //   obscureText: false,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Por favor, insira seu email';
                //     }
                //     return null;
                //   },
                // ),
                // CustomTextField(
                //   controller: _passwordController,
                //   image: obscureText ? 'hide.svg' : 'visibility.svg',
                //   hintText: 'Password',
                //   obscureText: obscureText,
                //   onIconTap: togglePasswordVisibility,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Por favor, insira sua senha';
                //     }
                //     return null;
                //   },
                // ),
                const SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 90.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Entrar'),
                      ),
                      const SizedBox(height: 20.0),
                      // MainButton(
                      //   onTap: () {
                      //     _submitForm();
                      //   },
                      //   text: 'Sign in with google',
                      //   image: 'google-logo.png',
                      //   buttonColor: AppColors.white,
                      //   textColor: AppColors.blackBG,
                      //),
                      //const SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(fontSize: 14),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(AppRoutes.signUp);
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
