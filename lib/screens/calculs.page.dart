import 'package:flutter/material.dart';
import 'package:projet1/cubit/calculs.cubit.dart';
import 'package:projet1/repository/correspondance.jour.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculPage extends StatefulWidget {
  const CalculPage({Key? key}) : super(key: key);

  @override
  _CalculPageState createState() => _CalculPageState();
}

class _CalculPageState extends State<CalculPage> {


  bool validation(String jour, String mois, String annee) {
    if (jour != "" && mois != "" && annee != "")
      return true;
    else
      return false;
  }


  @override
  Widget build(BuildContext context) {

    TextEditingController _ctrjour = TextEditingController();
    TextEditingController _ctrmois = TextEditingController();
    TextEditingController _ctrannee = TextEditingController();


    CalculsCubit _jourCalcule = context.read<CalculsCubit>();
    ConversionDeDate reponse = ConversionDeDate(jour: 0);
    String reponseText = reponse.ToJour();


    return Scaffold(
      appBar: AppBar(
        title: const Text("DATE -> DAY",), titleTextStyle: TextStyle(fontSize: 30),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10, right: 20, left: 20),
        child: Column(
          children: [
            TextField(
              controller: _ctrjour,
              style: TextStyle(fontSize: 18, color: Colors.blue),
              decoration: InputDecoration(border: UnderlineInputBorder(), hintText: 'dd'),
            ),

            const SizedBox(height: 10,),

            TextField(
              controller: _ctrmois,
              style: TextStyle(fontSize: 18, color: Colors.blue),
              decoration: InputDecoration(border: UnderlineInputBorder(), hintText: 'mm'),
            ),

            const SizedBox(height: 10,),

            TextField(
              controller: _ctrannee,
              style: TextStyle(fontSize: 18, color: Colors.blue),
              decoration: InputDecoration(border: UnderlineInputBorder(), hintText: 'yyyy'),
            ),

            const SizedBox(height: 10,),

            ElevatedButton(onPressed:(){
              if (validation(_ctrjour.text, _ctrmois.text, _ctrannee.text)) {
                _jourCalcule.emit([
                  int.parse(_ctrjour.text),
                  int.parse(_ctrmois.text),
                  int.parse(_ctrannee.text)
                ]);
                _jourCalcule.calculate();
                reponse.jour = _jourCalcule.state[0];
                reponseText = reponse.ToJour();
                print(reponseText);
              } else {
                print(
                    "Make sure you put all informations");
              }



            }, child: Icon(Icons.search, size: 30,),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent,
              ),
            ),

            const SizedBox(height: 30,),

            BlocBuilder<CalculsCubit, List<int>>(
                builder: (context, state) {
                  return SizedBox(
                      width: double.infinity,
                      height: 100.0,
                      child: Card(child:Text(
                        reponse.ToJour(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )

                      ));
                })

          ],
        ),
      ),
    );
  }
}