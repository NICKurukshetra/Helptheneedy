class Feedbackmod {
  final String requestby;
  final String requestMob;
  final String requestEmail;
  final String remarks;
  Feedbackmod(
      {this.requestby, this.requestMob, this.requestEmail, this.remarks});

  factory Feedbackmod.fromJson(Map<String, dynamic> json) {
    return Feedbackmod(
      requestby: json['srno'] as String,
      requestMob: json['srno'] as String,
      requestEmail: json['srno'] as String,
      remarks: json['dated'] as String,
    );
  }
  Map<String, dynamic> toJson() => _$NgoToJson(this);

  Map<String, dynamic> _$NgoToJson(Feedbackmod instance) => <String, dynamic>{
        'requestby': instance.requestby,
        'requestMob': instance.requestMob,
        'requestEmail': instance.requestEmail,
        'remarks': instance.remarks,
      };
}
