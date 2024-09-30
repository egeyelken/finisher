import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch tasks for a specific user
  Stream<List<Task>> getTasks(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Task.fromFirestore(doc.data(), doc.id);
      }).toList();
    });
  }

  // Add a new task to Firestore
  Future<void> addTask(Task task, String userId) async {
    await _firestore.collection('users').doc(userId).collection('tasks').add(task.toFirestore());
  }

  // Update an existing task
  Future<void> updateTask(Task task, String userId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('tasks')
        .doc(task.id)
        .update(task.toFirestore());
  }

  // Delete a task from Firestore
  Future<void> deleteTask(String taskId, String userId) async {
    await _firestore.collection('users').doc(userId).collection('tasks').doc(taskId).delete();
  }
}
