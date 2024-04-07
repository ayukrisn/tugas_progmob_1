import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_progmob_1/login_page.dart';
import 'package:tugas_progmob_1/home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  bool _passwordVisible = true;
  String? _email ='';
  String? _password ='';
  String? _confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF7EE),
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
            Text("Glad to see you!",
                style: GoogleFonts.baloo2(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF446F84))),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Start with entering your ',
                    style: TextStyle(fontSize: 14, color: Color(0xFF446F84)),
                  ),
                  TextSpan(
                    text: 'e-mail and password',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF446F84),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' below, and we will be ready to embark to our new journey!',
                    style: TextStyle(fontSize: 14, color: Color(0xFF446F84)),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email.';
                      }
                      if (!RegExp(r'\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b',
                              caseSensitive: false)
                          .hasMatch(value)) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    onSaved: (value) => _email = value,
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'Enter your e-mail',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: !_passwordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password.';
                      }
                      // print(value);
                      return null;
                    },
                    onSaved: (value) => _password = value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xFF446F84),
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          }),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: !_passwordVisible,
                    onSaved: (value) => _confirmPassword = value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password.';
                      }
                      if (_confirmPassword != _password) {
                        print(_password);
                        print(_confirmPassword);
                        return "Password doesn't match";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm your password',
                      suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Color(0xFF446F84),
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          }),
                    ),
                  ),
                  const SizedBox(height: 120),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState?.save();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            }
                          },
                          child: Text('Sign Up',
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
                        "Have an account? ",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF446F84)),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF446F84),
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
