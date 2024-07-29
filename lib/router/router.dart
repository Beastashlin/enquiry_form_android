import 'package:enquiry_form_android/models/user.dart';
import 'package:enquiry_form_android/pages/auth_wrapper.dart';
import 'package:enquiry_form_android/pages/dashboard.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthWrapper(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) {
        User user = state.extra as User;
        return DashboardWidget(user: user);
      },
    ),
  ],
);
