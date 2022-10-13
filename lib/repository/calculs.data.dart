class CalculeJour {
  List fnc = [0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5];
  int jourCalcule(int d, int m, int y) {
    //print((d + (y - 1900) + ((y - 1900) / 4).toInt() + fnc[m > 0 ? m - 1 : 0]));
    return ((d +
        (y - 1900) +
        ((y - 1900) / 4).toInt() +
        fnc[m > 0 ? m - 1 : 0]) %
        7)
        .toInt();
  }
}
