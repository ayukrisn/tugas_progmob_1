import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_progmob_1/signup_page.dart';
import 'package:tugas_progmob_1/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();  

  bool _passwordVisible = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Center(
              child: Image.asset(
                'assets/logo.png',
                height: 30,
              ),
            ),
            const SizedBox(height: 48),
            Text("Welcome Back!",
                style: GoogleFonts.baloo2(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF263E4A))),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Start with entering your ',
                    style: TextStyle(fontSize: 14, color: Color(0xFF263E4A)),
                  ),
                  TextSpan(
                    text: 'e-mail and password',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF263E4A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' below, and we will be ready to continue our journey!',
                    style: TextStyle(fontSize: 14, color: Color(0xFF263E4A)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    validator: (_emailController) {
                      if (_emailController == null || _emailController.isEmpty) {
                        return 'Please enter your email.';
                      }
                      if (!RegExp(r'\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b',
                              caseSensitive: false)
                          .hasMatch(_emailController)) {
                        return 'Please enter a valid email address.';
                      }
                      if (_emailController != 'ayukrisna@gmail.com') {
                        return 'Wrong email. Please try again.';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'Enter your e-mail',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_passwordVisible, // Hides the entered text
                    validator: (_passwordController) {
                      if (_passwordController == null || _passwordController.isEmpty) {
                        return 'Please enter your password.';
                      }
                      if (_passwordController != 'progmobkecebadai') {
                        return 'Wrong password. Please try again.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xFF263E4A),
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          }),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Forgot Password? ",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF263E4A)),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to login page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()),
                          );
                        },
                        child: const Text(
                          'Reset Password',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF263E4A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 160),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            }
                          },
                          child: Text('Log In',
                              style: GoogleFonts.baloo2(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF263E4A)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()),
                          );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF263E4A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
