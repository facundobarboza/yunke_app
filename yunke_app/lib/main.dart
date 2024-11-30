import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yunke_app/screens/screens.dart';
import 'package:yunke_app/services/services.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService()),
        ChangeNotifierProvider(create: ( _ ) => SponsorsService()),
        ChangeNotifierProvider(create: ( _ ) => MatchsService()),
        ChangeNotifierProvider(create: ( _ ) => CalendarsService()),
        ChangeNotifierProvider(create: ( _ ) => PlayersService())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yunke FC',
      initialRoute: 'home',
      routes: {
        'login'    : (_) => LoginScreen(),
        'register' : (_) => RegisterScreen(),
        'home'     : (_) => HomeScreen(),
        'details'  : (_) => DetailsScreen(),
        'calendar' : (_) => CalendarScreen(),
        'checking' : (_) => CheckAuthScreen(),
        'players'  : (_) => PlayersScreen()
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.red
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245)
      ),
    );
  }
}
