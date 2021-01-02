import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weight_tracker/auth.dart';
import 'package:weight_tracker/models/session.dart';
import 'package:weight_tracker/models/user.dart';
import 'package:weight_tracker/screens/home/widgets/header/index.dart';
import 'package:weight_tracker/screens/home/widgets/weight_progress/index.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements AuthStateListener {
  AuthStateProvider authStateProvider;

  @override
  void initState() {
    authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
    super.initState();
  }

  @override
  void onAuthStateChanged(AuthState state, User user) {
    if (state == AuthState.LOGGED_OUT) Navigator.pushReplacementNamed(context, '/sign-up');
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    bool isReady = authStateProvider.ready;

    //todo find a better solution :(
    if (!isReady) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Header(),
              ),
              WeightProgress(
                target: 10.0,
                current: 70.0,
                initial: 100.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: MediaQuery.of(context).size.width / 1.5,
        height: 55,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(
            'NEW WEIGHT',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}