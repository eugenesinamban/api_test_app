import 'package:api_test/app.dart';
import 'package:api_test/widgets/country_name_field.dart';
import 'package:flutter/material.dart';
import '../app.dart';
import '../widgets/submit_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _validateInput(String input) {
      if (_globalKey.currentState.validate()) {
        _globalKey.currentState.save();
        Navigator.pushNamed(
          context,
          ResultScreenRoute,
          arguments: {'input': input},
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => null,
        ),
        title: Text("API Test App"),
      ),
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CountryNameField(textController),
          ],
        ),
      ),
      floatingActionButton: SubmitButton(_validateInput, textController),
    );
  }
}
