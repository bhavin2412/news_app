import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/countryPage/view/countryPage.dart';
import 'screens/homePage/view/homePage.dart';
import 'screens/phonePage/provider/phoneProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PhoneProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: HomePage(),
      ),
    ),
  );
}
