import 'package:flutter/material.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    this.next = false,
    this.fieldAction = TextInputAction.done,
    this.keyboardType = TextInputType.name,
    this.hintText = '',
    this.textColor = Colors.black,
    this.inputFieldBorderColor = AppColors.accentColor,
    this.inputFieldColor = AppColors.inputFieldColor,
    this.hasClearButton = false,
    this.showObscuredText = false,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.controller,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onComplete,
    this.onSaved,
    this.onChanged,
    super.key,
  });

  /// Переключать фокус с одного текстового поля на другое
  final bool next;

  /// Действие после заполнения поля
  final TextInputAction fieldAction;

  /// Формат клавиатуры
  final TextInputType keyboardType;

  /// Текст поля, когда оно пустое
  final String hintText;

  /// Цвет вводимого текста
  final Color textColor;

  /// Цвет текстового поля
  final Color inputFieldColor;

  /// Цвет рамки текстового поля
  final Color inputFieldBorderColor;

  /// Кнопка стирания текста
  final bool hasClearButton;

  /// Кнопка показа скрытого текста
  final bool showObscuredText;

  /// Скрывать текст при написании
  final bool obscureText;

  /// Подсказки клавиатуры
  final bool enableSuggestions;

  /// Автоисправление
  final bool autocorrect;

  /// Контроллер поля
  final TextEditingController? controller;

  final FocusNode? focusNode;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  /// Валидатор поля
  final String? Function(String? text)? validator;

  /// Событие после заполнения поля
  final VoidCallback? onComplete;

  /// Событие при сохранении заполненных данных
  final void Function(String? text)? onSaved;

  /// Событие при вводе текста
  final void Function(String? text)? onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;
  late TextEditingController _textController;
  late final ValueNotifier<bool> _obscureTextNotifier;
  TextEditingController? _controller;
  FocusNode? _node;

  @override
  void initState() {
    super.initState();
    _obscureTextNotifier = ValueNotifier<bool>(widget.obscureText);
    _initTextController();
    _initFocusNode();
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_controller != null && widget.controller != null) {
      _controller?.dispose();
      _initTextController();
    }

    if (_node != null && widget.focusNode != null) {
      _node?.dispose();
      _initFocusNode();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    _node?.dispose();
    _obscureTextNotifier.dispose();
    super.dispose();
  }

  void _initTextController() => _textController = widget.controller ?? (_controller = TextEditingController());

  void _initFocusNode() => _focusNode = widget.focusNode ?? (_node = FocusNode());

  @override
  Widget build(BuildContext context) {
    final prefixIcon = widget.prefixIcon;

    return ValueListenableBuilder(
      valueListenable: _obscureTextNotifier,
      builder: (context, obscureText, child) {
        return TextFormField(
          controller: _textController,
          focusNode: _focusNode,
          textInputAction: widget.fieldAction,
          style: TextStyle(color: widget.textColor),
          cursorColor: widget.inputFieldBorderColor,
          keyboardType: widget.keyboardType,
          obscureText: obscureText,
          enableSuggestions: widget.enableSuggestions,
          autocorrect: widget.autocorrect,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: EdgeInsets.all(8),
            focusColor: widget.inputFieldBorderColor,
            prefixIcon: prefixIcon != null ? Padding(padding: const EdgeInsets.only(left: 8), child: prefixIcon) : null,
            suffixIcon: _SuffixIcon(
              controller: _textController,
              obscureTextNotifier: _obscureTextNotifier,
              hasClearButton: widget.hasClearButton,
              showObscuredText: widget.showObscuredText,
              suffixIcon: widget.suffixIcon,
            ),
            prefixIconConstraints: BoxConstraints(),
            suffixIconConstraints: BoxConstraints(),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: widget.inputFieldBorderColor, width: 1),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            fillColor: widget.inputFieldColor,
            filled: true,
          ),
          onEditingComplete: () {
            if (widget.next) {
              FocusScope.of(context).nextFocus();
            } else {
              FocusScope.of(context).unfocus();
              widget.onComplete?.call();
            }
          },
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
        );
      },
    );
  }
}

class _SuffixIcon extends StatefulWidget {
  const _SuffixIcon({
    required this.controller,
    required this.obscureTextNotifier,
    required this.hasClearButton,
    required this.showObscuredText,
    required this.suffixIcon,
  });

  final TextEditingController controller;
  final ValueNotifier<bool> obscureTextNotifier;
  final bool hasClearButton;
  final bool showObscuredText;
  final Widget? suffixIcon;

  @override
  State<_SuffixIcon> createState() => _SuffixIconState();
}

class _SuffixIconState extends State<_SuffixIcon> {
  late final _textValueNotifier = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_listenText);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listenText);
    _textValueNotifier.dispose();
    super.dispose();
  }

  void _listenText() => widget.controller.addListener(() => _textValueNotifier.value = widget.controller.text);

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    if (widget.suffixIcon != null) return Padding(padding: const EdgeInsets.only(left: 8), child: widget.suffixIcon);

    return ValueListenableBuilder(
      valueListenable: _textValueNotifier,
      builder: (_, text, __) {
        if (text.isEmpty) return SizedBox.shrink();

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.showObscuredText)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: InkWell(
                  onTap: () => widget.obscureTextNotifier.value = !widget.obscureTextNotifier.value,
                  child: ValueListenableBuilder(
                    valueListenable: widget.obscureTextNotifier,
                    builder: (_, obscureText, __) {
                      return Icon(obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined);
                    },
                  ),
                ),
              ),
            if (widget.hasClearButton) ...[
              if (widget.showObscuredText) Container(width: 1, color: Colors.grey, height: 24),
              Padding(
                padding: EdgeInsets.only(left: widget.showObscuredText ? 4 : 0, right: 8),
                child: InkWell(onTap: () => controller.clear(), child: Icon(Icons.clear_rounded)),
              ),
            ],
          ],
        );
      },
    );
  }
}
