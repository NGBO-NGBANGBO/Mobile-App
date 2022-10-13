import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {

  String titre;
  String synop;
  String directeur;
  String image;


  DetailsPage({required this.titre,required this.synop, required this.directeur, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$titre de $directeur'),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(synop),
            GestureDetector(
              child: Image.asset('assets/images/$image'),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
