import 'package:clone_riverpod_hooks/login/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MaterialApp(
    home: LoginPage(),
  )));
}
