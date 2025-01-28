import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:super_cripto_app/config/constants/environment.dart';
import 'package:super_cripto_app/config/router/app_router.dart';
import 'package:super_cripto_app/config/theme/app_theme.dart';
import 'package:super_cripto_app/config/utils/injections.dart';
import 'package:super_cripto_app/domain/usecases/get_account_info_usecase.dart';
import 'package:super_cripto_app/presentation/blocs/accounts_bloc/accounts_bloc.dart';
import 'package:super_cripto_app/presentation/cubits/selected_account_cubit/selected_account_cubit.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initInjections();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // builder: (context, state) => MultiBlocProvider(
    //   providers: [
    //     BlocProvider(
    //       create: (context) => AccountsBloc(
    //           getAccountInfoUseCase: sl<GetAccountInfoUseCase>()),
    //     ),
    //     BlocProvider(
    //       create: (context) => SelectedAccountCubit(),
    //     ),
    //   ],
    //   child: const HomeScreen(),
    // ),
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SelectedAccountCubit(),
        ),
        BlocProvider(
          create: (context) =>
              AccountsBloc(getAccountInfoUseCase: sl<GetAccountInfoUseCase>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        routerConfig: appRouter,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(Environment.defaultLocale),
      ),
    );
  }
}
