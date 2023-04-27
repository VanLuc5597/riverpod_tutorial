import 'package:clone_riverpod_hooks/global/ultil/global_context_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppProviderContainer {
  static ProviderContainer get instance {
    return ProviderScope.containerOf(
        GlobalContextKey.instance.globalKey.currentContext!,
        listen: false);
  }
}
