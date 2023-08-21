class Ngo {
  final String ngo;
  final String action;
  final String remarks;
  final String dated;
  final int id;
  Ngo({this.id, this.ngo, this.action, this.dated, this.remarks});

  factory Ngo.fromJson(Map<String, dynamic> json) {
    return Ngo(
      id: json['id'] as int,
      ngo: json['ngo'] as String,
      action: json['action'] as String,
      dated: json['dated'] as String,
      remarks: json['remarks'] as String,
    );
  }
  Map<String, dynamic> toJson() => _$NgoToJson(this);

  Map<String, dynamic> _$NgoToJson(Ngo instance) => <String, dynamic>{
        'id': instance.id,
        'ngo': instance.ngo,
        'action': instance.action,
        'dated': instance.dated,
        'remarks': instance.remarks,
      };
}
