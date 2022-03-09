import 'package:equatable/equatable.dart';

class PizzaItem extends Equatable {
  final String image;
  final String label;
  final String uuid;

  const PizzaItem({
    required this.image,
    required this.label,
    required this.uuid,
  });

  factory PizzaItem.fromFireStore(Map<String, dynamic> json) => PizzaItem(
        image: json['image'] as String,
        label: json['label'] as String,
        uuid: json['uuid'] as String,
      );

  Map<String, dynamic> toFirestore() => {
        'image': image,
        'label': label,
        'uuid': uuid,
      };

  @override
  String toString() => 'PizzaItem(image: $image, label: $label, uuid: $uuid)';

  @override
  List<Object> get props => [image, label, uuid];
}
