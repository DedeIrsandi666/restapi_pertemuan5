//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'editdata.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class Details extends StatefulWidget {
  List list;
  int index;
  Details({required this.list, required this.index});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  void delete() {
    var url =
        Uri.parse('http://10.10.0.101/restapi5/delete.php'); //deletion api
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Are You Sure?"), //confirming the deletion of record
      actions: [
        MaterialButton(
          child: const Text("YES DELETE"),
          onPressed: () {
            delete();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => Home()));
          },
        ),
        MaterialButton(
          child: const Text("NO.."),
          onPressed: () {},
        ),
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('${widget.list[widget.index]['name']}')),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Nama : ${widget.list[widget.index]['name']}",
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Address : ${widget.list[widget.index]['address']}",
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Salary : ${widget.list[widget.index]['salary']}",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: MaterialButton(
                        child: const Text("Edit Data"),
                        color: Colors.blue,
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Edit(list: widget.list, index: widget.index)),
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: MaterialButton(
                          child: const Text("Delete"),
                          color: Colors.red,
                          onPressed: () {
                            confirm();
                          })),
                ],
              )
            ],
          ),
        ));
  }
}
