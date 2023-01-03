// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'big_square_button.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class BigSquareButton extends StatelessWidget {
  const BigSquareButton({
    Key? key,
    required this.size,
    required this.icon,
    required this.color,
    required this.subText,
    this.onTap,
  }) : super(key: key);

  final double size;

  final IconData icon;

  final Color color;

  final String subText;

  final void Function()? onTap;

  @override
  Widget build(BuildContext _context) => bigSquareButton(
        _context,
        size: size,
        icon: icon,
        color: color,
        subText: subText,
        onTap: onTap,
      );
}
