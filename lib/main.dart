import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_assets/feature/list_assets_screen/data/list_assets_repository_impl.dart';
import 'package:list_assets/feature/list_assets_screen/domain/list_assets_interactor_impl.dart';
import 'package:list_assets/feature/list_assets_screen/presentation/bloc/list_assets_bloc.dart';
import 'package:list_assets/feature/list_assets_screen/presentation/ui/list_assets_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(lazy: false, create: (context) => ListAssetsRepositoryImpl()),
        RepositoryProvider(lazy: false, create: (context) => ListAssetsInteractorImpl(listAssetsRepository: context.read<ListAssetsRepositoryImpl>())),
        RepositoryProvider(create: (context) => ListAssetsBloc(listAssetsInteractor: context.read<ListAssetsInteractorImpl>())..add(LoadCryptoEvent())),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'List Assets',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              useMaterial3: true,
            ),
            home: const ListAssetsScreen(),
          );
        }
      ),
    );
  }
}

