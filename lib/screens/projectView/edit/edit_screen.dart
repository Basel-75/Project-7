// ignore_for_file: unused_import

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';

import 'package:tuwaiq_project/screens/projectView/edit/bloc/edit_bloc.dart';
import 'package:tuwaiq_project/screens/projectView/edit/edit_base.dart';
import 'package:tuwaiq_project/screens/projectView/edit/edit_logo.dart';
import 'package:tuwaiq_project/screens/projectView/edit/edit_presentation.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';
import 'package:tuwaiq_project/widget/button/custom_button.dart';
import 'package:tuwaiq_project/widget/row/date_row.dart';
import 'package:tuwaiq_project/widget/textformfeild/normal_text_form_feild.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<EditBloc>();

        var languageLayer = languageLocaitor.get<LanguageLayer>();
        return BlocListener<EditBloc, EditState>(
          listener: (context, state) {
            if (state is SucsessState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.msg)));
            }
            if (state is ErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.msg)));
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomPaint(
                    size: Size(context.getWidth(multiply: 1),
                        context.getHeight(multiply: 0.1)),
                    painter: AuthShape(),
                  ),
                  context.addSpacer(),
                  Text(
                    languageLayer.isArabic
                        ? 'عدل على مشروعك'
                        : 'Edit your project',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  SizedBox(
                    height: context.getHeight(multiply: 0.75),
                    child: PageView(
                      children: [
                        EditLogo(bloc: bloc, languageLayer: languageLayer),
                        EditBase(languageLayer: languageLayer, bloc: bloc),
                        EditPresentation(
                            bloc: bloc, languageLayer: languageLayer),
                        const Text('Edit Project Images'),
                        SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              horizontal: context.getWidth(multiply: 0.08)),
                          child: BlocBuilder<EditBloc, EditState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        languageLayer.isArabic
                                            ? 'تعديل الروابط'
                                            : 'Edit Links',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        '5 / 6 >',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  context.addSpacer(multiply: 0.025),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        languageLayer.isArabic
                                            ? 'رابط GitHub'
                                            : 'GitHub Link',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      context.addSpacer(multiply: 0.008),
                                      NormalTextFormFeild(
                                        hintText: 'GitHub URL',
                                        controller: bloc.githubController,
                                      ),
                                      Text(
                                        languageLayer.isArabic
                                            ? 'رابط Figma'
                                            : 'Figma Link',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      context.addSpacer(multiply: 0.008),
                                      NormalTextFormFeild(
                                        hintText: 'Figma URL',
                                        controller: bloc.figmaController,
                                      ),
                                      Text(
                                        languageLayer.isArabic
                                            ? 'رابط فيديو'
                                            : 'Video Link',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      context.addSpacer(multiply: 0.008),
                                      NormalTextFormFeild(
                                        hintText: 'Video URL',
                                        controller: bloc.videoController,
                                      ),
                                      Text(
                                        languageLayer.isArabic
                                            ? 'رابط Pinterest'
                                            : 'Pinterest Link',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      context.addSpacer(multiply: 0.008),
                                      NormalTextFormFeild(
                                        hintText: 'Pinterest URL',
                                        controller: bloc.pinterestController,
                                      ),
                                      Text(
                                        languageLayer.isArabic
                                            ? 'رابط Play Store'
                                            : 'Play Store Link',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      context.addSpacer(multiply: 0.008),
                                      NormalTextFormFeild(
                                        hintText: 'Play Store URL',
                                        controller: bloc.playstoreController,
                                      ),
                                      Text(
                                        languageLayer.isArabic
                                            ? 'رابط Apple Store'
                                            : 'Apple Store Link',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      context.addSpacer(multiply: 0.008),
                                      NormalTextFormFeild(
                                        hintText: 'Apple Store URL',
                                        controller: bloc.applestoreController,
                                      ),
                                      Text(
                                        languageLayer.isArabic
                                            ? 'رابط APK'
                                            : 'APK Link',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      context.addSpacer(multiply: 0.008),
                                      NormalTextFormFeild(
                                        hintText: 'APK URL',
                                        controller: bloc.apkController,
                                      ),
                                      Text(
                                        languageLayer.isArabic
                                            ? 'رابط ويب'
                                            : 'Web Link',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      context.addSpacer(multiply: 0.008),
                                      NormalTextFormFeild(
                                        hintText: 'Web URL',
                                        controller: bloc.weblinkController,
                                      ),
                                    ],
                                  ),
                                  context.addSpacer(multiply: 0.02),
                                  CustomButton(
                                    englishTitle: 'Edit Links',
                                    arabicTitle: 'تعديل الروابط',
                                    onPressed: () {
                                      bloc.add(ChangeLinksEvent());
                                    },
                                    arabic: languageLayer.isArabic,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        const Text('Edit Project Members'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
