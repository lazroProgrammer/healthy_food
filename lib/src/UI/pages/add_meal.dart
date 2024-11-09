import 'package:flutter/material.dart';

class AddMealPage extends StatefulWidget {
  const AddMealPage({super.key});

  @override
  State<AddMealPage> createState() => _AddMealPageState();
}

class _AddMealPageState extends State<AddMealPage> {
  final nameTEC = TextEditingController();

  // final typeTEC= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add meal"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Form(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: TextFormField(
                // controller: numberTEC,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "name",
                  prefixIcon: const Icon(Icons.numbers),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim() == "") {
                    return "insert a name";
                  }
                  return null;
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
