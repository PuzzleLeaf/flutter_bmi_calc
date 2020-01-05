import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULT'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 9,
            child: ReusableCard(
              color: kInactiveCardColor,
              cardChild: Column(
                children: <Widget>[Text('asd')],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: kBottomContainerCardColor,
              padding: EdgeInsets.only(
                bottom: 20.0,
              ),
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
