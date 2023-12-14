// import 'package:codelab/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('LoginPage UI elements', (WidgetTester tester) async {
    // Build the LoginPage widget
    await tester.pumpWidget(const LoginPage());

    // Verify if the app title is displayed in the app bar
    expect(find.text('Login Page'), findsOneWidget);

    // Verify if the email TextField is displayed
    expect(find.widgetWithText(TextField, 'Email'), findsOneWidget);

    // Verify if the password TextField is displayed
    expect(find.widgetWithText(TextField, 'Password'), findsOneWidget);

    // // Verify if the login button is displayed
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const _appTitle = 'Login Page';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_appTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
