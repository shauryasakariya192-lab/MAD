import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RatingScreen(),
    );
  }
}

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Star Rating')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final selected = index < rating;
                return IconButton(
                  icon: Icon(
                    selected ? Icons.star : Icons.star_border,
                    size: 40,
                  ),
                  onPressed: () {
                    setState(() => rating = index + 1);
                  },
                );
              }),
            ),
            Text('Selected Rating: $rating / 5'),
          ],
        ),
      ),
    );
  }
}
