class Task {
  String id;
  String name;
  bool isDaily;
  bool isCompleted;

  Task({
    required this.id,
    required this.name,
    this.isDaily = false,
    this.isCompleted = false,
  });

  // Convert task data to Firestore format
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'isDaily': isDaily,
      'isCompleted': isCompleted,
    };
  }

  // Convert Firestore data to Task object
  factory Task.fromFirestore(Map<String, dynamic> data, String id) {
    return Task(
      id: id,
      name: data['name'],
      isDaily: data['isDaily'] ?? false,
      isCompleted: data['isCompleted'] ?? false,
    );
  }
}
