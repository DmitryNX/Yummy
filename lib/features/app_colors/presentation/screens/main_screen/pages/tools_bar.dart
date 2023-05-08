import 'package:flutter/material.dart';

enum _ToolsBarMode {
  hide,
  normal,
  full,
}

class ToolsBar extends StatefulWidget {
  const ToolsBar({Key? key}) : super(key: key);

  @override
  State<ToolsBar> createState() => _ToolsBarState();
}

class _ToolsBarState extends State<ToolsBar> {
  late final DraggableScrollableController _controller;
  final _ToolsBarMode _mode = _ToolsBarMode.hide;


  static double initialChildSize = 0.07;

  @override
  void initState() {
    super.initState();
    _controller = DraggableScrollableController();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    switch (_mode) {
      case _ToolsBarMode.hide:
        return _buildToolsMenu(context);
      case _ToolsBarMode.normal:
      case _ToolsBarMode.full:
        return _buildToolBody(context);
    }
  }

  Widget _buildToolsMenu(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      right: 10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(onPressed: () {}, child: const Text('Tool 1')),
          const SizedBox(width: 10),
          ElevatedButton(onPressed: () {}, child: const Text('Tool 2')),
        ],
      ),
    );
  }

  Widget _buildToolBody(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _controller,
      initialChildSize: initialChildSize,
      minChildSize: initialChildSize,
      builder: (context, scrollController) {
        return _buildBody(context);
      },
    );
  }
}
