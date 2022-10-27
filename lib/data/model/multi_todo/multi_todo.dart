/// userId : 1
/// id : 1
/// title : "delectus aut autem"
/// completed : false

class MultiTodo {
  MultiTodo({
      this.userId, 
      this.id, 
      this.title, 
      this.completed,});

  MultiTodo.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }
  int? userId;
  int? id;
  String? title;
  bool? completed;
MultiTodo copyWith({  int? userId,
  int? id,
  String? title,
  bool? completed,
}) => MultiTodo(  userId: userId ?? this.userId,
  id: id ?? this.id,
  title: title ?? this.title,
  completed: completed ?? this.completed,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['completed'] = completed;
    return map;
  }

}