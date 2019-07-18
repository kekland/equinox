import 'package:equinox/equinox.dart';
import 'package:flutter/widgets.dart';

/// A Widget that is used to receive text information from user. Can be styled using [EqTextFieldTheme].
class EqTextFieldForm extends FormField<String> {
  final TextEditingController controller;
  EqTextFieldForm({
    Key key,
    @required String hint,
    EqWidgetShape shape = EqWidgetShape.rectangle,
    EqWidgetStatus status,
    EqWidgetStatus errorStatus = EqWidgetStatus.danger,
    bool enabled = true,
    this.controller,
    VoidCallback onTap,
    VoidCallback onEditingComplete,
    ValueChanged<String> onFieldSubmitted,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
    IconData icon,
    EqPositioning iconPosition = EqPositioning.left,
    String label,
    String description,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    FocusNode focusNode,
    EqWidgetSize size = EqWidgetSize.medium,
    EdgeInsets padding,
    bool autovalidate = false,
    String initialValue,
  }) : super(
            key: key,
            initialValue:
                controller != null ? controller.text : (initialValue ?? ''),
            onSaved: onSaved,
            validator: validator,
            autovalidate: autovalidate,
            enabled: enabled,
            builder: (field) {
              final _EqTextFieldFormState state = field;

              return EqTextField(
                hint: hint,
                controller: state._effectiveController,
                description: description,
                enabled: enabled,
                error: field.errorText,
                focusNode: focusNode,
                icon: icon,
                iconPosition: iconPosition,
                keyboardType: keyboardType,
                onChanged: field.didChange,
                label: label,
                obscureText: obscureText,
                onEditingComplete: onEditingComplete,
                onTap: onTap,
                padding: padding,
                shape: shape,
                size: size,
                status: (field.hasError) ? errorStatus : status,
                onSubmitted: onFieldSubmitted,
              );
            });

  @override
  _EqTextFieldFormState createState() => _EqTextFieldFormState();
}

class _EqTextFieldFormState extends FormFieldState<String> {
  TextEditingController _controller;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller;

  @override
  EqTextFieldForm get widget => super.widget;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _controller = TextEditingController(text: widget.initialValue);
    } else {
      widget.controller.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(EqTextFieldForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null)
        _controller =
            TextEditingController.fromValue(oldWidget.controller.value);
      if (widget.controller != null) {
        setValue(widget.controller.text);
        if (oldWidget.controller == null) _controller = null;
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    super.dispose();
  }

  @override
  void reset() {
    super.reset();
    setState(() {
      _effectiveController.text = widget.initialValue;
    });
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value)
      didChange(_effectiveController.text);
  }
}
