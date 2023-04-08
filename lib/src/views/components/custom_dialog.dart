import 'package:chool_check/src/utils/index.dart';

class CustomDialog extends Dialog {
  final String title;
  final String message;
  final String positiveButtonTitle;
  final String negativeButtonTitle;
  final VoidCallback positiveButtonPressed;
  final VoidCallback negativeButtonPressed;
  final bool usePositiveButton;

  const CustomDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.positiveButtonTitle,
    required this.negativeButtonTitle,
    required this.positiveButtonPressed,
    required this.negativeButtonPressed,
    required this.usePositiveButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: negativeButtonPressed,
          child: Text(
            negativeButtonTitle,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        usePositiveButton
            ? TextButton(
                onPressed: positiveButtonPressed,
                child: Text(
                  positiveButtonTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: CustomColor.fullGreen),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
