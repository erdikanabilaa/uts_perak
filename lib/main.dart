import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:uts_papb/main_page.dart';
import 'package:uts_papb/redux_controller.dart';

void main() {
  // Membuat store Redux dengan state awal
  final store = Store<AppState>(appReducer, initialState: AppState.initial());

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'FinansialKu',
        home: MainPage(),
      ),
    );
  }
}