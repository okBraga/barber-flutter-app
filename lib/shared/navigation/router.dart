import 'package:barber_app/modules/views/date_selection_page.dart';
import 'package:barber_app/modules/views/login_page.dart';
import 'package:barber_app/modules/views/plan_selection_page.dart';
import 'package:barber_app/modules/views/professional_selection_page.dart';
import 'package:barber_app/modules/views/service_selection_page.dart';
import 'package:barber_app/modules/views/service_type.dart';
import 'package:barber_app/modules/views/sign_up_page.dart';
import 'package:barber_app/modules/views/summary_page.dart';
import 'package:barber_app/shared/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: AppRoutes.serviceType,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (BuildContext context, GoRouterState state) => LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (BuildContext context, GoRouterState state) => SignUpPage(),
      ),
      GoRoute(
        path: AppRoutes.initialPage,
        builder: (BuildContext context, GoRouterState state) => ServiceType(),
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
        path: AppRoutes.plan,
        builder: (BuildContext context, GoRouterState state) => PlanSelectionPage(),
      ),
      GoRoute(
        path: AppRoutes.professionalSelection,
        builder: (BuildContext context, GoRouterState state) => ProfessionalSelectionPage(),
      ),
      GoRoute(
        path: AppRoutes.dateSelection,
        builder: (BuildContext context, GoRouterState state) => DateTimeSelectionPage(selectedProfessional: 'Fred'),
      ),
      GoRoute(
        path: AppRoutes.summary,
        builder: (BuildContext context, GoRouterState state) => SummaryPage(),
      ),
    ],
  );
}
