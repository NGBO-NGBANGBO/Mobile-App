import 'package:bloc/bloc.dart';
import 'package:projet1/repository/calculs.data.dart';


class CalculsCubit extends Cubit<List<int>> {
  CalculsCubit() : super([]);
  CalculeJour jourCalcule = new CalculeJour();
  void calculate() {
    emit([jourCalcule.jourCalcule(state[0], state[1], state[2])]);
  }
}