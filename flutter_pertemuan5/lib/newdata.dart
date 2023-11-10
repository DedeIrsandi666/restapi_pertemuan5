//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class NewData extends StatefulWidget {
  const NewData({Key? key}) : super(key: key);
  @override
  _NewDataState createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {
  TextEditingController name = TextEditingController();
  TextEditingController address= TextEditingController();
  TextEditingController salary= TextEditingController();
  void addData() {
    var url = Uri.parse(
        'http://10.10.0.101/restapi5/create.php'); //Inserting Api Calling
    http.post(url, body: {
      "name": name.text,
      "address": address.text,
      "salary": salary.text
    }); // parameter passed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Tambahkan Data Karyawan"),
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
              child: const Text("Tambah Data Karyawan"),
              color: Colors.blue,
              onPressed: () {
                addData();
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
