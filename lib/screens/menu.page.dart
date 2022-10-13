import 'package:flutter/material.dart';
import 'calculs.page.dart';
import 'films.page.dart';
import 'photos.page.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Drawer(
      child:Material(
        color: Colors.lightBlueAccent,
        child: ListView(
          children: [
            _header(),
            itemMenu(titre: "Photos",
              icon: Icons.image,
              allerVers: ()=>Navigator.pushNamed(context, '/photos'),
            ),
            itemMenu(titre: "Movies",
              icon: Icons.video_call_outlined,
              allerVers: ()=>Navigator.pushNamed(context, '/films'),),
            itemMenu(titre: "Calculations",
              icon: Icons.calculate_outlined,
              allerVers: ()=>Navigator.pushNamed(context, '/calculs'),),
          ],
        ),
      ),
    );
  }
}

_header(){
  return DrawerHeader(
      decoration: BoxDecoration(color: Colors.blueGrey),
      child:Stack(
        children: [
          Align(alignment: Alignment(-1,0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.png"),
              radius: 50,
            ),

          ),
          Align(
            alignment: Alignment(0.7,0),
            child: Text("Mini Project", style: TextStyle(fontSize: 24,color: Colors.white),),
          ),
        ],
      ) );
}
//---------------------------------------
Widget itemMenu({required String titre, required IconData icon, VoidCallback? allerVers}){
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: ListTile(
      leading: Icon(icon, color: Colors.white, size: 30,),
      title: Text(titre, style: TextStyle(color: Colors.white,fontSize: 20),),
      onTap: allerVers,
    ),
  );
}
//------------------Routes
final mesRoutes = {
  '/photos':(context)=>PhotoPage(),
  '/films':(context)=>FilmPage(),
  '/calculs':(context)=>CalculPage(),
};