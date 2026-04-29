import 'package:my_flutter_app/domain/entities/message.dart';

final class YesNoModel {
  final String answer;
  final bool forSure;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forSure,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
    answer: json['answer'],
    forSure: json['forced'],
    image: json['image'],
  );

  Map<String, dynamic> toJson() => {
    'answer': answer,
    'forSure': forSure,
    'image': image,
  };

  Message toMessageEntity() {
    return Message(
      text: answer == 'yes' ? 'Sí' : 'No',
      fromWho: FromWho.hers,
      imageUrl: image,
    );
  }
}
