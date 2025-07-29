import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:list_assets/core/di/injection.dart';
import 'package:list_assets/feature/list_assets_screen/presentation/bloc/list_assets_bloc.dart';
import 'package:list_assets/feature/list_assets_screen/presentation/ui/list_assets_screen.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // регистрируем все зависимости
  configureDependencies(getIt);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => getIt<ListAssetsBloc>()..add(LoadCryptoEvent())),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'List Assets',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true,
          ),
          home: const ListAssetsScreen(),
        );
      }),
    );
  }
}
