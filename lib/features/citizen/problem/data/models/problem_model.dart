import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:mobile/features/citizen/problem/domain/entities/problem_entity.dart';

class ProblemModel extends ProblemEntity {
  const ProblemModel({
    required super.content,
    super.image,
  });

  factory ProblemModel.fromJson(Map<String, dynamic> json) {
    return ProblemModel(
      content: json['content'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'image': image,
    };
  }

  Future<FormData> toFormData() async {
    final fileName = image?.split(Platform.pathSeparator).last;
    final mimeType = lookupMimeType(fileName ?? "");

    return FormData.fromMap(
      {
        'content': content,
        "image": (image != null)
            ? await MultipartFile.fromFile(
                image!,
                filename: fileName,
                contentType:
                    (mimeType != null) ? MediaType.parse(mimeType) : null,
              )
            : null,
      },
    );
  }
}
