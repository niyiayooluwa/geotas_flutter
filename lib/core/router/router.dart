import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouteProvider = Provider<GoRouter>((ref) {
  return GoRouter(initialLocation: '/', routes: []);
});
