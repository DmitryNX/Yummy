import 'package:flutter/material.dart';
import 'package:yummy/core/theme/app_colors.dart';

import 'code_page.dart';

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
  // final DraggableScrollableController _controller =
  //     DraggableScrollableController();
  _ToolsBarMode _mode = _ToolsBarMode.hide;

  // static double initialChildSize = 0.30;

  @override
  void initState() {
    super.initState();
    // _controller = DraggableScrollableController();
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.midLight,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
        ),
        padding: const EdgeInsets.all(6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _mode = _ToolsBarMode.normal;
                  });
                },
                child: const Text('Code')),
          ],
        ),
      ),
    );
  }

  Widget _buildToolBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: _buildCodePage(context),



      // DraggableScrollableSheet(
      //   controller: _controller,
      //   initialChildSize: initialChildSize,
      //   minChildSize: initialChildSize,
      //   builder: (context, scrollController) {
      //     return _buildCodePage(context);
      //   },
      // ),
    );
  }

  Widget _buildCodePage(BuildContext context) {
    return SingleChildScrollView(
      child: CodePage(
        onClose: () {
          setState(() {
            // _controller.animateTo(
            //   0.5,
            //   duration: const Duration(milliseconds: 300),
            //   curve: Curves.easeIn,
            // );
            _mode = _ToolsBarMode.hide;
          });
        },
      ),
    );
  }
}
