import 'package:animations/animations.dart';
import 'package:cinema/repositorie/film.data.dart';
import 'package:cinema/screens/details.page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilmService filmService = FilmService();
    final films = filmService.allFilms();
    ContainerTransitionType _transition = ContainerTransitionType.fadeThrough;
    return Scaffold(
      appBar: AppBar(title: Text("Films"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 3/4,
            ),
            itemCount: films.length,
            itemBuilder: (context,index){
              return OpenContainer(
                transitionType: _transition,
                  transitionDuration: Duration(seconds: 1),
                  closedBuilder: (context,action){
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage('assets/images/${films[index].image}'),
                          fit: BoxFit.cover,
                        )
                    ),

                  );
                  },
                  openBuilder: (context,action){
                  return DetailsPage(
                      titre: films[index].titre,
                      synop: films[index].synop,
                      directeur: films[index].directeur,
                      image: films[index].image);

                  }
              );
            }
        ),
      )
    );
  }
}
