import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_colors.dart';
import 'package:fuzzy_greenhouse/app/presentation/app_text_style.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/app_textfield.dart';
import 'package:fuzzy_greenhouse/app/presentation/components/components_utils.dart';
import 'package:fuzzy_greenhouse/settings/domain/bloc/push_notification_bloc.dart';

class PushNotificationPanelScreen extends StatefulWidget {
  const PushNotificationPanelScreen({super.key});

  @override
  State<PushNotificationPanelScreen> createState() => _PushNotificationPanelScreenState();
}

class _PushNotificationPanelScreenState extends State<PushNotificationPanelScreen> {
  late final _pushTitleController = TextEditingController();
  late final _pushMessageController = TextEditingController();
  late final _pushMessageFocusNode = FocusNode();
  late final _selectedUserNotifier = ValueNotifier<({String id, String? token})?>(null);
  late final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _pushTitleController.dispose();
    _pushMessageController.dispose();
    _pushMessageFocusNode.dispose();
    _selectedUserNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentColor,
        title: Text('Управление уведомлениями', maxLines: 1, style: AppTextStyle.appBarStyle),
        leading: InkWell(onTap: Navigator.of(context).pop, child: Icon(Icons.arrow_back_rounded, color: Colors.white)),
      ),

      body: BlocProvider(
        create: (_) => PushNotificationBloc(),
        child: BlocBuilder<PushNotificationBloc, PushNotificationBlocState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text('Параметры отправки', maxLines: 1, style: AppTextStyle.alertTextStyle),
                    SizedBox(height: 8),
                    AppTextField(
                      controller: _pushTitleController,
                      fieldAction: TextInputAction.next,
                      onComplete: _pushMessageFocusNode.requestFocus,
                      hasClearButton: true,
                      prefixIcon: Icon(Icons.notification_add_outlined),
                      hintText: 'Заголовок',
                      validator: (text) {
                        if (text?.isEmpty ?? true) return 'Поле не может быть пустым';
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    AppTextField(
                      controller: _pushMessageController,
                      focusNode: _pushMessageFocusNode,
                      fieldAction: TextInputAction.done,
                      hasClearButton: true,
                      prefixIcon: Icon(Icons.notification_add_outlined),
                      hintText: 'Сообщение',
                      validator: (text) {
                        if (text?.isEmpty ?? true) return 'Поле не может быть пустым';
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('users').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return CircularProgressIndicator();
                        final user = snapshot.data?.docs;
                        if (user == null) return SizedBox.shrink();

                        return ValueListenableBuilder(
                          valueListenable: _selectedUserNotifier,
                          builder: (context, selectedUser, child) {
                            return DropdownButtonFormField<({String id, String? token})>(
                              initialValue: selectedUser,
                              validator: (text) {
                                if (text?.token?.isEmpty ?? true) return 'Не выбран пользователь';
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Выбрать пользователя',
                                filled: true,
                                fillColor: AppColors.inputFieldColor,
                                labelStyle: TextStyle(color: selectedUser != null ? AppColors.accentColor : null),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor)),
                                suffixIcon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: selectedUser != null ? AppColors.accentColor : null,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              items:
                                  user.map((doc) {
                                    final userInfoMap = doc.data() as Map<String, dynamic>;

                                    return DropdownMenuItem<({String id, String? token})>(
                                      value: (id: doc.id, token: userInfoMap['fcmToken']),
                                      child: Text(userInfoMap['displayName'] ?? userInfoMap['email'] ?? doc.id),
                                    );
                                  }).toList(),
                              onChanged: (value) {
                                final validate = _formKey.currentState?.validate() ?? false;
                                if (!validate) return;

                                _selectedUserNotifier.value = value;
                              },
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 8),
                    Align(
                      child: AppButton(
                        text: 'Отправить',
                        onPressed: () {
                          final validate = _formKey.currentState?.validate() ?? false;
                          if (!validate) return;

                          context.read<PushNotificationBloc>().add(
                            PushNotificationBlocEventSend(
                              token: _selectedUserNotifier.value?.token ?? '',
                              title: _pushTitleController.text,
                              body: _pushMessageController.text,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
