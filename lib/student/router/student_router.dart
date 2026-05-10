import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

final studentRouteProvider = Provider<GoRouter>((ref) {
  return GoRouter(initialLocation: '/', routes: []);
});
