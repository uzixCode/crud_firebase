import 'dart:convert';

class TodoModel {
  TodoModel({this.nama, this.todo});
  final String? nama;
  final String? todo;

  factory TodoModel.fromMap(Map<String, dynamic> data) =>
      TodoModel(nama: data["nama"], todo: data["todo"]);

  Map<String, dynamic> toMap() => {
        "nama": nama,
        "todo": todo,
      };
  factory TodoModel.fromJSON(String json) =>
      TodoModel.fromMap(jsonDecode(json));
}
