import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'controller/tenants_bloc/tenants_bloc.dart';
import 'model/tenants_data/tenants_repository.dart';
import 'theme/themes.dart';
import 'utils/string_constants.dart';
import 'views/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(ConstantStrings.localDB);
  runApp(
    BlocProvider(create: (context) => TenantsBloc(repository: TenantsRepository()),
    child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: ConstantStrings.projectName,
        theme: CustomTheme.lightTheme(),
        darkTheme: CustomTheme.darkTheme(),
        themeMode: ThemeMode.system,
        home: const SplashScreen());
  }
}
