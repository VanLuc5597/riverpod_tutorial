import 'package:clone_riverpod_hooks/login/view_model/login_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Providers {
  static final login = ChangeNotifierProvider<LoginProvider>(
    (ref) => LoginProvider(),
  );
}
