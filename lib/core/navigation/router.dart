import 'package:barber_app/features/appointment/presentation/pages/appointment_page.dart';
import 'package:barber_app/features/appointment/presentation/pages/booking_page.dart';
import 'package:barber_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:barber_app/features/auth/presentation/pages/login_page.dart';
import 'package:barber_app/features/appointment/presentation/pages/plan_selection_page.dart';
import 'package:barber_app/features/profile/presentation/pages/profile_page.dart';
import 'package:barber_app/features/appointment/presentation/pages/service_selection_page.dart';
import 'package:barber_app/features/appointment/presentation/pages/service_type_page.dart';
import 'package:barber_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:barber_app/features/appointment/presentation/pages/summary_page.dart';
import 'package:barber_app/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: AppRoutes.serviceType,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) => AuthBloc(),
          child: LoginPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
          create: (context) => AuthBloc(),
          child: SignUpPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.serviceType,
        builder: (BuildContext context, GoRouterState state) => ServiceType(),
      ),
      GoRoute(
        path: AppRoutes.serviceSelection,
        builder: (BuildContext context, GoRouterState state) => ServiceSelectionPage(),
      ),
      GoRoute(
        path: AppRoutes.summary,
        builder: (BuildContext context, GoRouterState state) => SummaryPage(),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (BuildContext context, GoRouterState state) => ProfilePage(),
      ),
      GoRoute(
        path: AppRoutes.appointments,
        builder: (BuildContext context, GoRouterState state) => AppointmentsPage(),
      ),
      GoRoute(
        path: AppRoutes.booking,
        builder: (BuildContext context, GoRouterState state) => BookingPage(),
      ),
      GoRoute(
        path: AppRoutes.planSelection,
        builder: (BuildContext context, GoRouterState state) => PlanSelectionPage(),
      ),
    ],
  );
}
