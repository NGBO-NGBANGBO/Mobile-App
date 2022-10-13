import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet1/cubit/calculs.cubit.dart';
import 'screens/menu.page.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context)=>CalculsCubit())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark,primaryColor:Colors.green),
          home: MyHomePage(),
          routes: mesRoutes,
        ),
    );
  }
}
//-----------------------------------------------------
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(title: Text('Flutter application'),),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
               child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
              'assets/images/background.jpeg',
              fit: BoxFit.cover),
        ),
      ),
      ],
    ),
    ),
    );
  }
}

