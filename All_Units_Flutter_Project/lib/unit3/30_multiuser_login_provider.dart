import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User {
  final String email;
  final String password;
  final String name;

  const User({
    required this.email,
    required this.password,
    required this.name,
  });
}

class UserModel extends ChangeNotifier {
  final List<User> users = const [
    User(email: 'ansh@example.com', password: '123456', name: 'Ansh'),
    User(email: 'rahul@example.com', password: 'rahul123', name: 'Rahul'),
    User(email: 'neel@example.com', password: 'neel123', name: 'neel'),
  ];

  User? authenticate(String email, String password) {
    for (final user in users) {
      if (user.email == email && user.password == password) {
        return user;
      }
    }
    return null;
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? error;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (!formKey.currentState!.validate()) return;

    final user = context.read<UserModel>().authenticate(
          emailController.text.trim(),
          passwordController.text,
        );

    if (user == null) {
      setState(() => error = 'Invalid email or password');
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen(user: user)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multi-user Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Enter email' : null,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Enter password' : null,
              ),
              if (error != null)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    error!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ElevatedButton(
                onPressed: login,
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Sample: ansh@example.com / 123456',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Text(
          'Welcome, ${user.name}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
