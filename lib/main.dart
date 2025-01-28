import 'package:flutter/material.dart';
import 'package:todo_with_dependency_injection/core/di.dart';

void main() {
  setupDependencies(); // Set up Dependency Injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoScreen(),
    );
  }
}
class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the TodoService instance
    final todoService = serviceLocator<TodoService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Center(
        child: Text(todoService.fetchData()), // Use the service method
      ),
    );
  }
}
