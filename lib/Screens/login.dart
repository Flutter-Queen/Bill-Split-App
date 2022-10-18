import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isLoading = false;
  Color buttonColor = Colors.grey;
  bool value = false;
  bool passwordVisible = true;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFFFF575B)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: FocusScope(
          debugLabel: 'Scope',
          autofocus: true,
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Text(
                'Login to your Account',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Focus(
                    debugLabel: 'TextField1',
                    child: Builder(builder: (context) {
                      final FocusNode focusNode = Focus.of(context);
                      final bool hasFocus = focusNode.hasFocus;
                      return TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: hasFocus
                                ? Colors.purple[100]
                                : Colors.grey[100],
                            prefixIcon: Icon(
                              Icons.email,
                              color: hasFocus ? Colors.purple : Colors.grey,
                            ),
                            contentPadding: const EdgeInsets.all(8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            focusedBorder: inputBorder,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: hasFocus ? Colors.black : Colors.grey,
                            )),
                        keyboardType: TextInputType.emailAddress,
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Focus(
                    debugLabel: 'TextField2',
                    child: Builder(builder: (context) {
                      final FocusNode focusNode = Focus.of(context);
                      final bool hasFocus = focusNode.hasFocus;
                      return TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock,
                                color: hasFocus ? Colors.purple : Colors.grey),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              icon: Icon(
                                  passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color:
                                      hasFocus ? Colors.purple : Colors.grey),
                            ),
                            filled: true,
                            fillColor: hasFocus
                                ? Colors.purple[100]
                                : Colors.grey[100],
                            contentPadding: const EdgeInsets.all(8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            focusedBorder: inputBorder,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: hasFocus ? Colors.black : Colors.grey,
                            )),
                        obscureText: passwordVisible,
                        keyboardType: TextInputType.visiblePassword,
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 10,
                ),
                Theme(
                  data: ThemeData(unselectedWidgetColor: Colors.purple),
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    activeColor: Colors.purple,
                    value: value,
                    onChanged: (bool? value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Remember me',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  buttonColor = Colors.purple;
                });
              },
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.purple,
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height / 13,
                      width: MediaQuery.of(context).size.width - 18,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: buttonColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0),
                      ),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot the password?',
                  style: TextStyle(fontSize: 18, color: Colors.purple),
                )),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                const Text(
                  'or continue with.',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                Expanded(
                  child: Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.grey.shade500)),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.facebook,
                        size: 30,
                        color: Color(0xFF209BEF),
                      )),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.grey.shade500)),
                  child: Image.network(
                    'http://pngimg.com/uploads/google/google_PNG19635.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.grey.shade500)),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.apple,
                        size: 30,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    "Don't have an account?",
                    style:
                        TextStyle(letterSpacing: 0.5, color: Colors.grey[500]),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.purple),
                    )),
              ],
            ),
          ]),
        ),
      ),
    ));
  }
}
