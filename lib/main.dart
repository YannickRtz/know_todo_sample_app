import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knowunity_todo/routing/app_root_location.dart';

void main() {
  runApp(ProviderScope(child: TodosApp()));
}

class TodosApp extends StatelessWidget {
  TodosApp({super.key});

  final beamerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(beamLocations: [AppRootLocation()]),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      routeInformationParser: BeamerParser(),
      routerDelegate: beamerDelegate,
      backButtonDispatcher: BeamerBackButtonDispatcher(
        fallbackToBeamBack: false,
        delegate: beamerDelegate,
      ),
    );
  }
}
