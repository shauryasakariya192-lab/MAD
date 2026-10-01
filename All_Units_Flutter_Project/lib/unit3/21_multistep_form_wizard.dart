import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PersonalStep(),
    );
  }
}

class WizardData {
  String name = '';
  String email = '';
  String address = '';
}

class PersonalStep extends StatefulWidget {
  const PersonalStep({super.key});

  @override
  State<PersonalStep> createState() => _PersonalStepState();
}

class _PersonalStepState extends State<PersonalStep> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void next() {
    if (!formKey.currentState!.validate()) return;

    final data = WizardData()
      ..name = nameController.text
      ..email = emailController.text;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddressStep(data: data)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Step 1: Personal Info')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (v) =>
                    v == null || !v.contains('@') ? 'Enter valid email' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: next, child: const Text('Next')),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressStep extends StatefulWidget {
  final WizardData data;

  const AddressStep({super.key, required this.data});

  @override
  State<AddressStep> createState() => _AddressStepState();
}

class _AddressStepState extends State<AddressStep> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController(text: widget.data.address);
  }

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  void next() {
    if (!formKey.currentState!.validate()) return;

    widget.data.address = addressController.text;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ReviewStep(data: widget.data)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Step 2: Address')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Enter address' : null,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Back'),
                  ),
                  ElevatedButton(
                    onPressed: next,
                    child: const Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReviewStep extends StatelessWidget {
  final WizardData data;

  const ReviewStep({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Step 3: Review')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${data.name}'),
            Text('Email: ${data.email}'),
            Text('Address: ${data.address}'),
            const SizedBox(height: 20),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Form Submitted')),
                    );
                  },
                  child: const Text('Finish'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
