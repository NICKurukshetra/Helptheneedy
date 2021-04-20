class Ngo {
  final String ngo;
  final String action;
  final DateTime dated;
  final String id;
  Ngo({this.id, this.ngo, this.action, this.dated});

  factory Ngo.fromJson(Map<String, dynamic> json) {
    return Ngo(
      id: json['srno'] as String,
      ngo: json['srno'] as String,
      action: json['srno'] as String,
      dated: json['dated'] as DateTime,
    );
  }
  Map<String, dynamic> toJson() => _$NgoToJson(this);

  Map<String, dynamic> _$NgoToJson(Ngo instance) => <String, dynamic>{
        'id': instance.id,
        'ngo': instance.ngo,
        'action': instance.action,
        'dated': instance.dated,
      };
}
