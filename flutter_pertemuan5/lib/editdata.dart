//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class Edit extends StatefulWidget {
  final List list;
  final int index;
  Edit({Key? key, required this.list, required this.index}) : super(key: key);
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController name;
  late TextEditingController address;
  late TextEditingController salary;
  void editData() {
    var url =
        Uri.parse('http://10.10.0.101/restapi5/update.php'); //update api calling
    http.post(url, body: {
      'id': widget.list[widget.index]['id'],
      'name': name.text,
      'address': address.text,
      'salary': salary.text
    });
  }

  @override
  void initState() {
    name = TextEditingController(
        text: widget.list[widget.index]
            ['name']); //setting up the existing values in textediting control;
    address = TextEditingController(text: widget.list[widget.index]['address']);
    salary = TextEditingController(text: widget.list[widget.index]['salary']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Edit Data Karyawan yang bernama ${widget.list[widget.index]['name']}"),
        ),
        
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: name,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukan Nama Karyawan Baru',
                hintText: 'Masukan Nama Karyawan Baru',
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.title),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              maxLines: 5,
              controller: address,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukan Alamat Karyawan Baru',
                hintText: 'Masukan Alamat Karyawan Baru',
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.add_home_work_sharp),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              maxLines: 5,
              controller: salary,
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Masukan Gaji Karyawan Baru',
                hintText: 'Masukan Gaji Karyawan Baru',
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.money),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: MaterialButton(
              child: const Text("Edit Data Karyawan"),
              color: Colors.blue,
              onPressed: () {
                editData();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Home()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
