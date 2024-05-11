import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';  // Import dotenv
import 'chat_page.dart';

Future main() async {
  await dotenv.load(fileName: ".env");  // Load environment variables
  runApp(const MyApp());
}
