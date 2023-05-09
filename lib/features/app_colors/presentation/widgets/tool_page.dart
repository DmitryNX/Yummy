import 'package:flutter/material.dart';
import 'package:yummy/core/theme/app_colors.dart';

enum ToolPageSide {
  left,
  top,
  right,
  bottom,
}

class ToolPage extends StatelessWidget {
  final Widget header;
  final Widget body;
  final ToolPageSide side;

  const ToolPage({
    Key? key,
    required this.header,
    required this.body,
    required this.side,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildDecoration(),
      child: Column(
        children: <Widget>[
          _buildHeader(),
          _buildBody(),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    const radius = Radius.circular(10);

    final topLeftRadius =
         side == ToolPageSide.right
      || side == ToolPageSide.bottom
        ? radius
        : Radius.zero;

    final topRightRadius =
        side == ToolPageSide.left
     || side == ToolPageSide.bottom
        ? radius
        : Radius.zero;

    final bottomRightRadius =
        side == ToolPageSide.left
     || side == ToolPageSide.top
        ? radius
        : Radius.zero;

    final bottomLeftRadius =
        side == ToolPageSide.right
     || side == ToolPageSide.top
        ? radius
        : Radius.zero;

    return BoxDecoration(
      color: AppColors.midDark,
      borderRadius: BorderRadius.only(
        topLeft: topLeftRadius,
        topRight: topRightRadius,
        bottomRight: bottomRightRadius,
        bottomLeft: bottomLeftRadius,
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 35,
      decoration: _buildHeaderDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          children: <Widget>[
            Expanded(child: header),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildHeaderDecoration() {
    const radius = Radius.circular(10);

    final topLeftRadius =
      side != ToolPageSide.left
        ? radius
        : Radius.zero;

    final topRightRadius =
      side != ToolPageSide.right
        ? radius
        : Radius.zero;

    return BoxDecoration(
      color: AppColors.midLight,
      borderRadius: BorderRadius.only(
        topLeft: topLeftRadius,
        topRight: topRightRadius,
        bottomRight: radius,
        bottomLeft: radius,
      ),
    );
  }

  Widget _buildBody() {
    return body;
  }
}
