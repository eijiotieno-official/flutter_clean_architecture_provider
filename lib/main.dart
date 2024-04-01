import 'package:flutter/material.dart';
import 'package:clean_architecture_provider/features/todo/presentation/pages/todo_page.dart';
import 'package:clean_architecture_provider/features/todo/presentation/provider/todo_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Provide TodoNotifier using ChangeNotifierProvider
        ChangeNotifierProvider(create: (_) => TodoNotifier()..getTodos()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Hide debug banner
        title: 'Todo App', // Set app title
        theme: ThemeData(
          primarySwatch: Colors.blue, // Set primary color theme
        ),
        home: const TodoPage(), // Set TodoPage as home page
      ),
    );
  }
}
