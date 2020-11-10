import 'package:flutter/material.dart';
import 'package:slak/constant.dart';
import 'package:slak/components/customBar.dart';

class ActorFilterEntry {
  const ActorFilterEntry(this.name);
  final String name;
//final String initials;
}

class SelectDimensions extends StatefulWidget {
  bool isSelected = false;
  @override
  _SelectDimensionsState createState() => _SelectDimensionsState();
}

class _SelectDimensionsState extends State<SelectDimensions> {
  final List<ActorFilterEntry> _cast = <ActorFilterEntry>[
    const ActorFilterEntry('Relationship'),
    const ActorFilterEntry('Finance'),
    const ActorFilterEntry('Learning'),
    const ActorFilterEntry('Purpose'),
    const ActorFilterEntry('Achievements'),
    const ActorFilterEntry('Lesiure'),
  ];
  List<String> _filters = <String>[];
  Iterable<Widget> get actorWidgets sync* {
    for (final ActorFilterEntry actor in _cast) {
      yield Padding(
        padding: const EdgeInsets.all(8.0),
        child: FilterChip(

          avatar: CircleAvatar(child: Text('asdf')),
          selectedColor: slPrimaryColor,
          backgroundColor: Colors.grey,
          showCheckmark: false,
          pressElevation: 5,
          label: Text(actor.name),
          labelStyle: TextStyle(
              color: Colors.white,
            fontSize: textSizeLarge
          ),
          selected: _filters.contains(actor.name),
          shape: RoundedRectangleBorder(),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filters.add(actor.name);
                widget.isSelected = !widget.isSelected;
              } else {
                //widget.isSelected = !widget.isSelected;
                _filters.removeWhere((String name) {
                  return name == actor.name;
                });
              }
            });
          },
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customBar(context),
        //backgroundColor: background_home_color,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
              ' Choose Your Areas of Focus',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: textSizeXXXLarge
              ),
            ),
          ),


            Container(
              height: MediaQuery.of(context).size.height* 0.63,
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 1.0, // gap between adjacent chips
                  runSpacing: -12.0, // gap between lines
                  direction: Axis.horizontal,
                  children: actorWidgets.toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
