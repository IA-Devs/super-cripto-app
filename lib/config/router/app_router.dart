import 'package:go_router/go_router.dart';
import 'package:super_cripto_app/presentation/screens/screens.dart';
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
