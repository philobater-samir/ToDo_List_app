class Task {
  String id;

  String title;

  String description;

  int date;

  bool isChecked;

  Task(
      {this.id = '',
      required this.description,
      required this.title,
      required this.date,
      this.isChecked = false});

  Task.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          date: json['date'] as int,
          description: json['description'] as String,
          title: json['title'] as String,
          isChecked: json['isChecked'] as bool,
        );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'id': id,
      'dateTime': date,
      'isChecked': isChecked,
    };
  }
}
