import 'package:basic_template/common/dimensions.dart';
import 'package:flutter/material.dart';

@immutable
class BodyWidget extends StatelessWidget {
  const BodyWidget({
    required this.child,
    super.key,
    this.isLoading = false,
    this.padding,
    this.formKey,
  });

  final bool isLoading;
  final Widget child;
  final EdgeInsets? padding;
  final Key? formKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IgnorePointer(
          ignoring: isLoading,
          child: SafeArea(
            child: Padding(
              padding: padding ?? horizontalPadding16,
              child: Form(
                key: formKey,
                child: child,
              ),
            ),
          ),
        ),
        if (isLoading) const CustomProgressBar(),
      ],
    );
  }
}

@immutable
class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer.withOpacity(.8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
