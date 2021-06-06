import 'package:flutter/material.dart';
import 'package:flutter_app_pharmacy/services/loading.dart';

class Loading extends StatelessWidget {
  //var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    getHomePage(context);
    return LoadingSpinner();
    //return _isLoading ? LoadingSpinner() : FloatingActionButton(onPressed: () { getHomePage(context); });
  }
}

Widget LoadingSpinner() {
  return Scaffold(
      body: Center(
    child: CircularProgressIndicator(),
  ));
}
