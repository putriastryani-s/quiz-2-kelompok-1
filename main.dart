import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new Halsatu(),
    title: "Navigasi",
    routes: <String,WidgetBuilder>{
  '/Halsatu' : (BuildContext context) => new Halsatu(),
  '/Haldua' : (BuildContext context) => new Haldua(),
  
}
  ));
}




class Halsatu extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:new AppBar(title: new Text("Home"),),
      body: new Center(
        child:new IconButton(
          icon: new Icon(Icons.android, size : 50.0, color: Colors.green,),
          onPressed: (){
            Navigator.pushNamed(context, '/Haldua');
          },
          
        ),
      ),
     
    );
  }
}

class DataMahasiswa{
  String nama;
  String jurusan;
  String jkelamin;
  
  
  DataMahasiswa({this.nama, this.jurusan, this.jkelamin});
  
}


class Haldua extends StatefulWidget {
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Haldua> {
  
  final txtnamamhs = TextEditingController();
  final txtjurusan = TextEditingController();
  final txtjkelamin = TextEditingController();
  

  List<Widget> data = [];

  onTambah() {
    setState(() {
      data.add(ListTile(
        leading: Icon(Icons.people),
        title: Text(txtnamamhs.text),
        subtitle: Text(txtjkelamin.text),
        trailing: Text(txtjurusan.text),
      ));
      txtnamamhs.clear();
      txtjurusan.clear();
      txtjkelamin.clear();
    });
  }

  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                controller: txtnamamhs,
                decoration: InputDecoration(hintText: 'Nama Mahasiswa'),
              ),
              TextField(
                controller: txtjurusan,
                decoration: InputDecoration(hintText: 'Jurusan'),
              ),
              TextField(
                controller: txtjkelamin,
                decoration: InputDecoration(hintText: 'Jenis Kelamin'),
              ),
              Divider(height: 5.0),
              ElevatedButton(child: Text("Tambah"), onPressed: onTambah),
            ],
          ),
        ),
        new Column(
          children: data,
        )
      ],
    );
  }
}