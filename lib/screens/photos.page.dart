import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet1/model/photos.model.dart';
import 'package:projet1/repository/photos.data.dart';

class PhotoPage extends StatefulWidget{
  const PhotoPage({Key? key}) : super(key: key);

  @override
  _PhotoPageState createState() => _PhotoPageState();
}
class _PhotoPageState extends State<PhotoPage> {
  TextEditingController _ctr = TextEditingController();
  late int page=1;
  late Future<List<Photos>>photos;


  @override
  void initState() {
    setState(() {
      photos=getPhotos('car', page);
    });
//
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("PHOTOS"),  titleTextStyle: TextStyle(fontSize: 40),),
        body: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
              children: [
                TextField(
                  controller: _ctr,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                  labelText: 'Keyword'),
                ),
                ElevatedButton(onPressed:(){
                  setState(() {
                    photos=getPhotos(_ctr.text, page);
                  });},
                    child:Icon(Icons.search, size: 30,),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                    ),
                ),
                Expanded(child: FutureBuilder <List<Photos>>(
                    future: photos,
                    builder: (context,snp) {
                      if (snp.hasData) {
                        return ListView.builder(
                            itemCount: snp.data!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 8,
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment(-0.85, 0),
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              snp.data![index].url),
                                          radius: 80,
                                        ),

                                      ),
                                      Align(
                                        alignment:Alignment(0.9,-0.1) ,
                                        child: Text(snp.data![index].name, style: TextStyle(fontSize: 18, color: Colors.white),),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                      else {
                        return Text('Aucune donnée présente', style: TextStyle(color: Colors.red, fontSize: 20),);
                      }
                    })
                ),
                const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed:(){
                      setState(() {
                        page--;
                        photos=getPhotos(_ctr.text, page);
                      });},
                        child:Icon(Icons.navigate_before, size: 30,),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent,
                      ),
                    ),
                    ElevatedButton(onPressed:(){
                      setState(() {
                        page++;
                        photos=getPhotos(_ctr.text, page);
                      });},
                        child:Icon(Icons.navigate_next, size: 30,),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent,
                      ),
                    ),
                  ],
                )
              ]),

        ));
  }
}

