import 'package:auto_route/auto_route.dart';
import 'package:bou/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  final void Function(bool result) onLoginResult;

  LoginPage({super.key, required this.onLoginResult});

  @override
  Widget build(BuildContext context) {
    var myWidth = MediaQuery.of(context).size.width / 5;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: myWidth, right: myWidth),
                child: Container(
                  alignment: Alignment.center,
                  child: _LoginPage(onLoginResult),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            )
          ],
        ),
      ),
    );
  }
}

// ------------------------------------

class _AccountsLoginInfo {
  late String username;
  late String password;

  _AccountsLoginInfo({required this.username, required this.password});
}

var _adminAccount = _AccountsLoginInfo(username: 'admin', password: 'admin');

// ------------------------------------

class _LoginPage extends StatefulWidget {
  final void Function(bool result) onLoginResult;

  _LoginPage(this.onLoginResult);

  @override
  State<_LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<_LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hasError = false;
  bool _logoAnimationDone = false;

  @override
  void initState() {
    super.initState();
    // Start the animation after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _logoAnimationDone = true;
      });
    });
  }

  void _loginSubmit() {
    setState(() {
      _hasError = false;
    });
    if (_formKey.currentState!.validate()) {
      if (_usernameController.text == _adminAccount.username &&
          _passwordController.text == _adminAccount.password) {
        AuthProvider.authProvider.login();
        widget.onLoginResult(true);
      } else {
        setState(() {
          _hasError = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid username or password!')),
        );
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode:
          _hasError ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: _logoAnimationDone
                  ? 20
                  : MediaQuery.of(context).size.height / 3,
            ),
            child: AnimatedDefaultTextStyle(
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'sfpro',
                fontSize: _logoAnimationDone ? 30 : 60,
                fontWeight: FontWeight.bold,
              ),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: const Text(
                'bou',
              ),
            ),
          ),
          Expanded(
            child: AnimatedOpacity(
              opacity: _logoAnimationDone ? 1.0 : 0.0,
              duration: const Duration(seconds: 2),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      autocorrect: false,
                      maxLength: 30,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        counterText: '',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: _hasError
                                  ? Colors.red
                                  : const Color(0xffEEF2F3)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: const Color(0xffEEF2F3),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          gapPadding: 4,
                          borderSide: BorderSide(
                              width: _hasError ? 1 : 0,
                              color: _hasError
                                  ? Colors.red
                                  : const Color(0xffEEF2F3)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Username",
                        hintStyle: const TextStyle(
                            fontFamily: 'vazir',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff536471)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        errorStyle:
                            const TextStyle(height: 0), // Hide error text
                      ),
                      validator: (value) {
                        if (_hasError && (value == null || value.isEmpty)) {
                          return ''; // Return empty string to trigger error state
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onFieldSubmitted: (_) {
                        _loginSubmit();
                      },
                      controller: _passwordController,
                      obscureText: true,
                      autocorrect: false,
                      maxLength: 30,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        counterText: '',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: _hasError
                                  ? Colors.red
                                  : const Color(0xffEEF2F3)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: const Color(0xffEEF2F3),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          gapPadding: 4,
                          borderSide: BorderSide(
                              width: _hasError ? 1 : 0,
                              color: _hasError
                                  ? Colors.red
                                  : const Color(0xffEEF2F3)),
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                            fontFamily: 'vazir',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff536471)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        errorStyle:
                            const TextStyle(height: 0), // Hide error text
                      ),
                      validator: (value) {
                        if (_hasError && (value == null || value.isEmpty)) {
                          return ''; // Return empty string to trigger error state
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            const Size(double.maxFinite, 50)),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF1B95E0)),
                      ),
                      onPressed: _loginSubmit,
                      child: const Text("Log In"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
