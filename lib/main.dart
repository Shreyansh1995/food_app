import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/config/routes/routes.dart';
import 'package:food_app/config/theme/app_themes.dart';
import 'package:food_app/injection_container.dart';
import 'package:food_app/presentation/add_to_cart/bloc/cart_bloc.dart';
import 'package:food_app/presentation/home/bloc/home_bloc.dart';
import 'package:food_app/presentation/home/bloc/home_event.dart';
import 'package:food_app/presentation/home/screens/home_screen.dart';

import 'presentation/add_to_cart/bloc/cart_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => sl()..add(SaveFood()),
        ),
        BlocProvider<CartBloc>(create: (context) => sl()..add(CheckCartEvent()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: HomeScreen(),
      ),
    );
  }
}

