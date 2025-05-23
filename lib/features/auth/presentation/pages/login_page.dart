import 'package:barber_app/core/components/buttons/primary_button.dart';
import 'package:barber_app/core/navigation/app_routes.dart';
import 'package:barber_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:barber_app/features/auth/presentation/widgets/password_visibility_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.black,
            ),
          );
        } else if (state is AuthLoading) {
          Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AuthSuccess) {
          GoRouter.of(context).pop();
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Entrar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Form(
                        key: _formKey,
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return state is AuthLoading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 20),
                                      TextFormField(
                                        controller: _emailController,
                                        validator: (email) {
                                          if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
                                            return 'Digite um e-mail válido';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          labelText: 'E-mail',
                                          labelStyle: TextStyle(color: Colors.grey[600]),
                                          focusedBorder: const UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black),
                                          ),
                                        ),
                                        keyboardType: TextInputType.emailAddress,
                                      ),
                                      const SizedBox(height: 24),
                                      TextFormField(
                                        controller: _passwordController,
                                        validator: (password) {
                                          if (_passwordController.text.length < 6) {
                                            return 'A senha deve ter pelo menos 6 caracteres';
                                          }
                                          return null;
                                        },
                                        obscureText: _isPasswordVisible,
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
                                      const SizedBox(height: 8),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Esqueci a senha',
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 32),
                                      SizedBox(
                                        width: double.infinity,
                                        child: PrimaryButton(
                                          onPressed: () async {
                                            FocusScope.of(context).unfocus();
                                            if (_formKey.currentState!.validate()) {
                                              context.read<AuthBloc>().add(
                                                    AuthSignInEvent(
                                                      _emailController.text,
                                                      _passwordController.text,
                                                    ),
                                                  );
                                            }
                                          },
                                          isPrimary: true,
                                          child: const Text(
                                            'Entrar',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      Row(
                                        children: [
                                          Expanded(child: Divider(color: Colors.grey[300])),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16),
                                            child: Text(
                                              'OU',
                                              style: TextStyle(color: Colors.grey[500]),
                                            ),
                                          ),
                                          Expanded(child: Divider(color: Colors.grey[300])),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                      PrimaryButton(
                                        onPressed: () async {
                                          FocusScope.of(context).unfocus();
                                          context.read<AuthBloc>().add(
                                                AuthSignInWithGoogleEvent(),
                                              );
                                        },
                                        isPrimary: false,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/images/google-logo.png',
                                              height: 24,
                                              width: 24,
                                            ),
                                            const SizedBox(width: 12),
                                            const Text(
                                              'Entrar com Google',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Center(
                                        child: TextButton(
                                          onPressed: () {
                                            GoRouter.of(context).push(AppRoutes.signUp);
                                          },
                                          child: RichText(
                                            text: TextSpan(
                                              text: 'Não tem uma conta? ',
                                              style: TextStyle(color: Colors.grey[600]),
                                              children: const [
                                                TextSpan(
                                                  text: 'Cadastre-se',
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
                                      SizedBox(height: 16),
                                    ],
                                  );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
