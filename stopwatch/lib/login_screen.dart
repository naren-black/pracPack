import 'package:flutter/material.dart';
import './stopwatch.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';
  // const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loggedIn = false;
  late String name;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login maadi')),
      ),
      body: Center(
        child: _buildLoginForm(),
      ),
    );
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.check, color: Colors.orangeAccent),
        Text('Hello there $name'),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Runner'),
              validator: (txt) =>
                  txt!.isEmpty ? 'Enter the runner\'s name.' : null,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Thy Email'),
              validator: (txt) {
                if (txt!.isEmpty) {
                  return 'Enter the runner\'s email';
                }
                final regy = RegExp('[^@]+@[^\.]+\..+');
                if (!regy.hasMatch(txt)) {
                  return 'Enter a valid email please';
                }
                return null;
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _validate,
              child: const Text('Continue now!'),
            ),
          ],
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }
    print(_nameController.text);
    print(_emailController.text);

    Navigator.of(context).pushReplacementNamed(Stopwatch.route, arguments: {
      'theName': _nameController.text,
      'theEmail': _emailController.text
    });

    // Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (_) => Stopwatch(
    //         name: _nameController.text, email: _emailController.text)));

    // setState(() {
    //   loggedIn = true;
    //   name = _nameController.text;
    // });
  }
}
