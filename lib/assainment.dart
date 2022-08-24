import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class Assainment extends StatefulWidget {
  const Assainment({Key? key}) : super(key: key);

  @override
  State<Assainment> createState() => _AssainmentState();
}

class _AssainmentState extends State<Assainment> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  Box<String>? userBox;

  @override
  void initState() {
    userBox = Hive.box<String>("users");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text(
            "Contact",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        leading: Icon(
          Icons.account_circle,
          size: 38,
          color: Colors.green,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: userBox!.listenable(),
                builder: (context, Box<String> users, _) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      final key = users.keys.toList()[index];
                      final value = users.get(key);
                      return ListTile(
                        title: Text(
                          value!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        subtitle: Text(
                          key!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) => const Divider(),
                    itemCount: users.keys.toList().length,
                  );
                }),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {}, 
                child: Text("Add Users"),
                )
            ],
          ),
        ],
      ),
    );
  }
}
