import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModel {
  final int? id;
  final String title;
  final String description;
  final int isComplete;
  final String date;
  final String startTime;
  final String endTime;
  final int? remind;
  final String? repeat;
  TodoModel({
    this.id,
    required this.title,
    required this.description,
    required this.isComplete,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.remind,
    this.repeat,
  });

  TodoModel copyWith({
    int? id,
    String? title,
    String? description,
    int? isComplete,
    String? date,
    String? startTime,
    String? endTime,
    int? remind,
    String? repeat,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isComplete: isComplete ?? this.isComplete,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      remind: remind ?? this.remind,
      repeat: repeat ?? this.repeat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'isComplete': isComplete,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'remind': remind,
      'repeat': repeat,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] as String,
      description: map['description'] as String,
      isComplete: map['isComplete'] as int,
      date: map['date'] as String,
      startTime: map['startTime'] as String,
      endTime: map['endTime'] as String,
      remind: map['remind'] != null ? map['remind'] as int : null,
      repeat: map['repeat'] != null ? map['repeat'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TodoModel(id: $id, title: $title, description: $description, isComplete: $isComplete, date: $date, startTime: $startTime, endTime: $endTime, remind: $remind, repeat: $repeat)';
  }

  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.isComplete == isComplete &&
        other.date == date &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.remind == remind &&
        other.repeat == repeat;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        isComplete.hashCode ^
        date.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        remind.hashCode ^
        repeat.hashCode;
  }
}
