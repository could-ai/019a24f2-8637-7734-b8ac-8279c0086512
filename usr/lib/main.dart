import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers/device_provider.dart';
import 'screens/home_screen.dart';
import 'screens/devices_screen.dart';
import 'screens/control_screen.dart';
import 'screens/library_screen.dart';
import 'screens/settings_screen.dart';
import 'utils/constants.dart';

void main() {
  runApp(const IQCenterApp());
}

class IQCenterApp extends StatelessWidget {
  const IQCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DeviceProvider()),
      ],
      child: MaterialApp(
        title: 'IQ CENTER',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Colors.blue,
            onPrimary: Colors.white,
            secondary: Colors.blueAccent,
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            background: Colors.white,
            onBackground: Colors.black,
            surface: Colors.grey[100]!,
            onSurface: Colors.black,
          ),
          textTheme: GoogleFonts.robotoTextTheme(),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.dark(
            primary: Colors.blueAccent,
            secondary: Colors.blue,
          ),
          textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
        ),
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/devices': (context) => const DevicesScreen(),
          '/control': (context) => const ControlScreen(),
          '/library': (context) => const LibraryScreen(),
          '/settings': (context) => const SettingsScreen(),
        },
      ),
    );
  }
}
