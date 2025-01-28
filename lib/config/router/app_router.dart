import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_cripto_app/config/utils/injections.dart';
import 'package:super_cripto_app/domain/usecases/get_account_info_usecase.dart';
import 'package:super_cripto_app/presentation/blocs/accounts_bloc/accounts_bloc.dart';
import 'package:super_cripto_app/presentation/cubits/cubit/cubit/selected_account_cubit.dart';
import 'package:super_cripto_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';
import 'package:super_cripto_app/presentation/screens/transfer/transfer_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
        
      routes: [
        GoRoute(
            path: '/deposit',
            builder: (context, state) => const DepositScreen()),
        GoRoute(
            path: '/transfer',
            builder: (context, state) => const TransferScreen()),
      ]),
]);
