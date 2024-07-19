import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, this.id});
  final String? id;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final namaCon = TextEditingController();
  final todoCon = TextEditingController();
  void add() async {
    final todo = FirebaseFirestore.instance.collection("todo");
    await todo.add({"nama": namaCon.text, "todo": todoCon.text});
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  void get(String? id) async {
    if (id == null) return;
    final todo =
        await FirebaseFirestore.instance.collection("todo").doc(id).get();
    final data = todo.data();
    namaCon.text = data?["nama"] ?? "";
    todoCon.text = data?["todo"] ?? "";
  }

  void simpan(String? id) async {
    if (id == null) return;
    await FirebaseFirestore.instance
        .collection("todo")
        .doc(id)
        .update(TodoModel(nama: namaCon.text, todo: todoCon.text).toMap());
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  @override
  void initState() {
    get(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: namaCon,
              decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "nama todo anda",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: todoCon,
              decoration: InputDecoration(
                  labelText: "Todo",
                  hintText: "tulis todo anda",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
                onPressed: () {
                  if (widget.id != null) {
                    simpan(widget.id);
                    return;
                  }
                  add();
                },
                child: const Text("Simpan"))
          ],
        ),
      ),
    );
  }
}
