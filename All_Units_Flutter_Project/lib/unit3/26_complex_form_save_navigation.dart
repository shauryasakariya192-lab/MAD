import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ComplexFormScreen(),
    );
  }
}

class FormData {
  String name = '';
  String course = '';
  bool agree = false;
}

class ComplexFormScreen extends StatefulWidget {
  const ComplexFormScreen({super.key});

  @override
  State<ComplexFormScreen> createState() => _ComplexFormScreenState();
}

class _ComplexFormScreenState extends State<ComplexFormScreen> {
  final formKey = GlobalKey<FormState>();
  final data = FormData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complex Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) =>
                    v == null || v.isEmpty ? 'Enter name' : null,
                onSaved: (v) => data.name = v!.trim(),
              ),
              DropdownButtonFormField<String>(
                initialValue: data.course.isEmpty ? null : data.course,
                decoration: const InputDecoration(labelText: 'Course'),
                items: const [
                  DropdownMenuItem(value: 'BCA', child: Text('BCA')),
                  DropdownMenuItem(value: 'MCA', child: Text('MCA')),
                  DropdownMenuItem(
                    value: 'Flutter Development',
                    child: Text('Flutter Development'),
                  ),
                ],
                validator: (v) => v == null ? 'Select course' : null,
                onChanged: (v) => data.course = v ?? '',
                onSaved: (v) => data.course = v ?? '',
              ),
              FormField<bool>(
                initialValue: false,
                validator: (value) =>
                    value == true ? null : 'Please accept the terms',
                onSaved: (value) => data.agree = value ?? false,
                builder: (field) {
                  return Column(
                    children: [
                      CheckboxListTile(
                        title: const Text('I agree to the terms'),
                        value: field.value ?? false,
                        onChanged: (value) => field.didChange(value),
                      ),
                      if (field.errorText != null)
                        Text(
                          field.errorText!,
                          style: const TextStyle(color: Colors.red),
                        ),
                    ],
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SummaryScreen(data: data),
                      ),
                    );
                  }
                },
                child: const Text('Save and Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SummaryScreen extends StatelessWidget {
  final FormData data;

  const SummaryScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${data.name}'),
            Text('Course: ${data.course}'),
            Text('Agreed: ${data.agree ? 'Yes' : 'No'}'),
          ],
        ),
      ),
    );
  }
}
