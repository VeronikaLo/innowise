import 'package:flutter/material.dart';

// class AppTheme{

// static const Color _bodyBg = Colors.blueGrey.shade800 ;
// static const Color _appBarBg = Colors.black54 ;
// static const Color _primary = Colors.teal;
// static const Color _onPrimary = Colors.white;
// static const Color _secondary = Colors.pink;



// static final ThemeData appTheme = ThemeData {
//       scaffoldBackgroundColor: _bodyBg,
//       appBarTheme: const AppBarTheme(
//           color: _appBarBg,
//           iconTheme:  IconThemeData(color: _white)),
//       colorScheme:  ColorScheme.light(
//           primary: _teal,
//           onPrimary: _white,
//           secondary: _pink,
//           ),    
// }
 
// }

class AppTheme {
  
  static const Color _teal = Color.fromARGB(255, 80, 228, 213);
  static final Color _pink = Colors.pink.shade300;
  static const Color _appBarBg = Colors.black54 ;
  static final Color _bodyBg = Colors.blueGrey.shade800;
  static const Color _white = Colors.white;
  static const Color _error = Color.fromARGB(255, 205, 17, 17);


  static final ThemeData theme = ThemeData(
      scaffoldBackgroundColor: _bodyBg,
      appBarTheme: const AppBarTheme(
          backgroundColor: _appBarBg,
          iconTheme:  IconThemeData(color: _white)),
      bottomAppBarColor: _teal,
      colorScheme:  ColorScheme.light(
          primary: _teal,
          onPrimary: _white,
          secondary: _pink,
          ),    
      textTheme: _textTheme);

    static const TextTheme _textTheme = TextTheme(
    headline1: TextStyle(
      color: _white,
      fontFamily: "CabinSketch",
      fontSize: 30,
      fontWeight: FontWeight.bold),  
    bodyText1:TextStyle(
      color: _white,
      fontFamily: "CabinSketch",
      fontSize: 35,
      fontWeight: FontWeight.bold
      ),
    bodyText2:TextStyle(
      color: _error,
      fontFamily: "CabinSketch",
      fontSize: 30,
      fontWeight: FontWeight.bold
      ),  
    button: TextStyle(
      color: _white,
      fontFamily: "CabinSketch",
      fontSize: 20,
      fontWeight: FontWeight.bold),  
  );


  

  

} 