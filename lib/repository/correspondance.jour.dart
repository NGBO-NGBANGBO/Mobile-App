class ConversionDeDate {
  int jour;
  ConversionDeDate({required this.jour});
  String ToJour() {
    switch (this.jour) {
      case 7:
        return "Dimanche";
        break;
      case 1:
        return "Lundi";
        break;
      case 2:
        return "Mardi";
        break;
      case 3:
        return "Mercredi";
        break;
      case 4:
        return "Jeudi";
        break;
      case 5:
        return "Vendredi";
        break;
      case 6:
        return "Samedi";
        break;
    }
    return "";
  }
}
