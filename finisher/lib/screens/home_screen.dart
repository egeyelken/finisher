import 'package:flutter/material.dart';
import '../services/task_service.dart';  // Import the TaskService
import '../models/task_model.dart';

class HomeScreen extends StatelessWidget {
  final String userId;

  HomeScreen({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks')),
      body: StreamBuilder<List<Task>>(
        stream: TaskService().getTasks(userId), // Fetch tasks from Firestore
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No tasks yet.'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final task = snapshot.data![index];
              return ListTile(
                title: Text(task.name),
                trailing: Checkbox(
                  value: task.isCompleted,
                  onChanged: (bool? newValue) {
                    task.isCompleted = newValue ?? false;
                    TaskService().updateTask(task, userId); // Update task status
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
