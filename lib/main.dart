import 'package:clone_riverpod_hooks/login/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login/view/register_page.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(
    home: RegisterPage(),
  )));
}
