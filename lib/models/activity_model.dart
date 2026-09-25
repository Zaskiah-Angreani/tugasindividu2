class ActivityModel {
  final String id;
  String title;
  String description;
  String course;
  DateTime dueDate;
  String category;
  bool isCompleted;
  bool isFavorite;

  ActivityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.course,
    required this.dueDate,
    required this.category,
    this.isCompleted = false,
    this.isFavorite = false,
  });
}