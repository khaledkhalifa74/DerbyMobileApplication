import 'package:champions/firebase_options.dart';
import 'package:champions/global_helpers/constants.dart';
import 'package:champions/screens/acting/acting_home.dart';
import 'package:champions/screens/acting/instructions.dart';
import 'package:champions/screens/auction/auction_home.dart';
import 'package:champions/screens/auction/instructions.dart';
import 'package:champions/screens/home_screen.dart';
import 'package:champions/screens/password_challenge/instructions.dart';
import 'package:champions/screens/password_challenge/password_home.dart';
import 'package:champions/screens/stopwatch/instructions.dart';
import 'package:champions/screens/stopwatch/stopwatch_home.dart';
import 'package:champions/screens/team/instructions.dart';
import 'package:champions/screens/team/team_home.dart';
import 'package:champions/screens/who_iam/instructions.dart';
import 'package:champions/screens/who_iam/who_iam_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const DerbyApp());
}

class DerbyApp extends StatelessWidget {
  const DerbyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar'), // arabic
          ],
          locale:  const Locale('ar'),
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            useMaterial3: true,
            hintColor: kSecondaryColor,
            fontFamily: "PFD",
            textTheme: TextTheme(
              titleLarge: TextStyle(
                color: kWhiteColor,
                fontWeight: FontWeight.w500,
                fontSize: 24.spMin,
              ),
              titleMedium: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 20.spMin,
              ),
              bodyLarge: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.w500,
              ),
              bodyMedium: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w500,
              ),
              bodySmall: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 14.spMin,
                  fontWeight: FontWeight.w400,
              ),
              headlineSmall: TextStyle(
                color: kPrimaryColor,
                fontSize: 30.spMin,
                fontWeight: FontWeight.w500,
              ),
              headlineMedium: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 32.spMin,
                  fontWeight: FontWeight.w500,
              ),
              headlineLarge: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 40.spMin,
                  fontWeight: FontWeight.w400,
              ),
            ),
          ),
          initialRoute: HomeScreen.id,
          routes: {
            HomeScreen.id:(context)=> const HomeScreen(),
            ActingInstructions.id:(context)=> const ActingInstructions(),
            AuctionInstructions.id:(context)=> const AuctionInstructions(),
            PasswordInstructions.id:(context)=> const PasswordInstructions(),
            StopwatchInstructions.id:(context)=> const StopwatchInstructions(),
            TeamInstructions.id:(context)=> const TeamInstructions(),
            WhoIamInstructions.id:(context)=> const WhoIamInstructions(),
            ActingHome.id:(context)=> const ActingHome(),
            PasswordHome.id:(context)=> const PasswordHome(),
            AuctionHome.id:(context)=> const AuctionHome(),
            TeamHome.id:(context)=> const TeamHome(),
            StopwatchHome.id:(context)=> const StopwatchHome(),
            WhoIamHome.id:(context)=> const WhoIamHome(),
          },
        );
      },
    );
  }
}
