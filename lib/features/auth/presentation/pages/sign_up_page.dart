import 'package:barber_app/core/components/buttons/primary_button.dart';
import 'package:barber_app/core/navigation/app_routes.dart';
import 'package:barber_app/features/auth/data/services/auth_service.dart';
import 'package:barber_app/features/auth/presentation/widgets/password_visibility_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  bool _isPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Criar conta',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _emailController,
                          validator: (email) {
                            if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
                              return 'Digite um e-mail válido';
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.grey[600]),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _isPasswordVisible,
                          validator: (password) {
                            if (_passwordController.text.length < 6) {
                              return 'A senha deve ter pelo menos 6 caracteres';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            labelStyle: TextStyle(color: Colors.grey[600]),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            suffixIcon: PasswordVisibilityIcon(
                              isVisible: _isPasswordVisible,
                              onPressed: () {
                                setState(() => _isPasswordVisible = !_isPasswordVisible);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: _isPasswordVisible,
                          validator: (password) {
                            if (_confirmPasswordController.text != _passwordController.text) {
                              return 'As senhas não coincidem';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Confirmar senha',
                            labelStyle: TextStyle(color: Colors.grey[600]),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            suffixIcon: PasswordVisibilityIcon(
                              isVisible: _isPasswordVisible,
                              onPressed: () {
                                setState(() => _isPasswordVisible = !_isPasswordVisible);
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                        Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                final error = await AuthService().signUp(
                                  _emailController.text,
                                  _passwordController.text,
                                );
                                if (error != null) {
                                  showSnackBar(error);
                                } else {
                                  showSnackBar('Conta criada com sucesso!');
                                  GoRouter.of(context).go(AppRoutes.login);
                                }
                              }
                            },
                            isPrimary: true,
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              GoRouter.of(context).go(AppRoutes.login);
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Já tem uma conta? ',
                                style: TextStyle(color: Colors.grey[600]),
                                children: const [
                                  TextSpan(
                                    text: 'Entrar',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
