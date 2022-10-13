import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
class modified_text extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const modified_text({Key? key, required this.text,  required this.color, required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.roboto(color: color, fontSize: size));
  }
}