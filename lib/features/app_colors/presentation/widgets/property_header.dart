import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class PropertyHeader extends StatelessWidget {
  const PropertyHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: const BoxDecoration(
        color: AppColors.midLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        Expanded(
          child: Text(
            'Properties',
            style: TextStyle(
              color: AppColors.mainDark,
            ),
          ),
        ),
      ],
    );
  }
}
