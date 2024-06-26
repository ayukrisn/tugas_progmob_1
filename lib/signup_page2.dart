import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_progmob_1/login_page.dart';
import 'package:tugas_progmob_1/nav_menu.dart';

class CustomDropdownFormField extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String? hint;
  final ValueChanged<String?> onChanged;

  const CustomDropdownFormField({
    Key? key,
    required this.value,
    required this.items,
    this.hint,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: "Career",
        prefixIcon: Icon(Icons.work),
      ),
      items: [
        if (hint != null)
          DropdownMenuItem<String>(
            value: null,
            child: Text(
              hint!,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ...items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }),
      ],
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'Please choose your career';
        }
        return null;
      },
    );
  }
}

class SignupPage2 extends StatefulWidget {
  const SignupPage2({Key? key}) : super(key: key);

  @override
  State<SignupPage2> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage2> {
  final _formKey = GlobalKey<FormState>();

  bool genderError = false;
  String? _name = '';
  String? _gender = '';
  String? _career;
  DateTime? _birthDate;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _careerController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (_picked != null) {
      setState(() {
        _birthDate = _picked;
        _dateController.text =
            "${_picked.day}/${_picked.month}/${_picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 32),
            Center(
              child: Image.asset(
                'assets/logo.png',
                height: 30,
              ),
            ),
            const SizedBox(height: 48),
            Text("Great Start!",
                style: GoogleFonts.baloo2(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF263E4A))),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'One step left! ',
                    style: TextStyle(fontSize: 14, color: Color(0xFF263E4A)),
                  ),
                  TextSpan(
                    text: 'Fill up your biodata below',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF263E4A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' to continue our fantastic journey shortly.',
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
                    controller: _nameController,
                    validator: (_nameController) {
                      if (_nameController == null || _nameController.isEmpty) {
                        return 'Please enter your name.';
                      }
                      return null;
                    },
                    onSaved: (_nameController) => _name = _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      prefixIcon: Icon(Icons.face),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      labelText: 'Birth Date',
                      hintText: 'Enter your birth date',
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectDate();
                    },
                    validator: (value) {
                      if (_birthDate == null) {
                        return 'Please select your birth date';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomDropdownFormField(
                    value: _career,
                    hint: 'Career',
                    items: [
                      'Student',
                      'Teacher',
                      'Freelance',
                      'Salesman',
                      'Prefer not to say',
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        _career = newValue;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  IntlPhoneField(
                    controller: _phoneNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'ID',
                    onChanged: (phone) {
                      print(phone.number);
                    },
                    validator: (phone) {
                      if (phone == null || phone.number.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      print("test" + phone.number);
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Text("Gender",
                      style: GoogleFonts.baloo2(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF263E4A))),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF7F3EB),
                            border: Border.all(
                                width: 2,
                                color: genderError
                                    ? Color(0xFFeb4444)
                                    : _gender == 'male'
                                        ? Color(0xFF263E4A)
                                        : Color(0xFFEFCD9F)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title: Text('Male'),
                            leading: Radio(
                              value: 'male',
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value as String?;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF7F3EB),
                            border: Border.all(
                                width: 2,
                                color: genderError
                                    ? Color(0xFFeb4444)
                                    : _gender == 'female'
                                        ? Color(0xFF263E4A)
                                        : Color(0xFFEFCD9F)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title: Text('Female'),
                            leading: Radio(
                              value: 'female',
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value as String?;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  if (genderError)
                    const Text(
                      'Please select a gender',
                      style: TextStyle(color: Color(0xFFeb4444), fontSize: 12),
                    ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_gender == null || _gender == "") {
                              setState(() {
                                genderError = true;
                              });
                            } else {
                              setState(() {
                                genderError = false;
                              });
                            }
                            if (_formKey.currentState!.validate() &&
                                !genderError) {
                              _formKey.currentState?.save();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NavBar()),
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
                            TextStyle(fontSize: 14, color: Color(0xFF263E4A)),
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
