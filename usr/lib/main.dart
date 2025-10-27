import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'providers/device_provider.dart';
import 'providers/notification_provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/devices_screen.dart';
import 'screens/control_screen.dart';
import 'screens/library_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/notifications_screen.dart';
import 'utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'integrations/supabase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SupabaseConfig.supabaseUrl,
    anonKey: SupabaseConfig.supabaseAnonKey,
  );
  runApp(const IQCenterApp());
}

class IQCenterApp extends StatelessWidget {
  const IQCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =&gt; AuthProvider()),
        ChangeNotifierProvider(create: (_) =&gt; DeviceProvider()),
        ChangeNotifierProvider(create: (_) =&gt; NotificationProvider()),
      ],
      child: MaterialApp(
        title: 'IQ CENTER',
        debugShowCheckedModeBanner: false,
        theme: Constants.getLightTheme(),
        darkTheme: Constants.getDarkTheme(),
        themeMode: ThemeMode.system,
        initialRoute: '/login',
        routes: {
          '/login': (context) =&gt; const LoginScreen(),
          '/': (context) =&gt; const HomeScreen(),
          '/devices': (context) =&gt; const DevicesScreen(),
          '/control': (context) =&gt; const ControlScreen(),
          '/library': (context) =&gt; const LibraryScreen(),
          '/settings': (context) =&gt; const SettingsScreen(),
          '/profile': (context) =&gt; const ProfileScreen(),
          '/notifications': (context) =&gt; const NotificationsScreen(),
        },
      ),
    );
  }
}