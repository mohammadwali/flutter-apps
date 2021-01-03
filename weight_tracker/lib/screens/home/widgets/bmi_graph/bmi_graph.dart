import 'package:flutter/material.dart';
import 'package:weight_tracker/util/list_utils.dart';

class BMIGraph extends StatelessWidget {
  final double graphWidth;
  final double currentValue;
  final double lineGap = 4.1;

  const BMIGraph({Key key, this.graphWidth = 100, this.currentValue = 0})
      : assert(graphWidth != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double startValue = 14;
    final double endValue = 40;
    final ThemeData theme = Theme.of(context);
    final List<double> graphItems = range(startValue, endValue, step: .5);
    final List<Widget> graph = graphItems
        .map((v) => _buildGraphItem(
              v,
              startValue,
              ((graphWidth + lineGap) / graphItems.length),
              theme,
            ))
        .toList();

    return Container(
      width: graphWidth,
      child: Column(
        children: [
          Row(children: graph),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text('15'),
              ),
              Expanded(
                flex: 3,
                child: Text('18.5'),
              ),
              Expanded(
                flex: 2,
                child: Text('25'),
              ),
              Expanded(
                flex: 4,
                child: Text('30'),
              ),
              Expanded(
                child: Text(
                  '40',
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildGraphItem(double value, double startValue, double width, ThemeData theme) {
    Color color = Colors.blueAccent;

    if (value < 18.5) {
      color = Colors.blue;
    } else if (value >= 18.5 && value <= 24.9) {
      color = theme.colorScheme.primary;
    } else if (value >= 25.0 && value <= 29.9) {
      color = Colors.yellow;
    } else {
      color = Colors.red;
    }
    return Container(
      color: color,
      width: width,
      height: currentValue == value ? 35 : 25,
      padding: EdgeInsets.symmetric(vertical: 0),
      margin: EdgeInsets.only(left: value != startValue ? lineGap : 0),
    );
  }
}
