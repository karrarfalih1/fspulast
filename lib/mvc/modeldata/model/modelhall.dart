class ModelHall {
  int? hallId;
  int? hallSize;
  int? hallPrice;
  int? hallTaple;
  int? hallMic;
  int? hallWc;
  int? hallDesk;
  int? hallSpekers;
  int? hallKtichin;
  int? hallStudio;
  String? hallDescription;
  String? hallLocation;
  double? hallLangtude;
  double? hallLatitude;

  ModelHall(
      {this.hallId,
      this.hallSize,
      this.hallPrice,
      this.hallTaple,
      this.hallMic,
      this.hallWc,
      this.hallDesk,
      this.hallSpekers,
      this.hallKtichin,
      this.hallStudio,
      this.hallDescription,
      this.hallLocation,
      this.hallLangtude,
      this.hallLatitude});

  ModelHall.fromJson(Map<String, dynamic> json) {
    hallId = json['hall_id'];
    hallSize = json['hall_size'];
    hallPrice = json['hall_price'];
    hallTaple = json['hall_taple'];
    hallMic = json['hall_mic'];
    hallWc = json['hall_wc'];
    hallDesk = json['hall_desk'];
    hallSpekers = json['hall_spekers'];
    hallKtichin = json['hall_ktichin'];
    hallStudio = json['hall_studio'];
    hallDescription = json['hall_description'];
    hallLocation = json['hall_location'];
    hallLangtude = json['hall_langtude'];
    hallLatitude = json['hall_latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hall_id'] = this.hallId;
    data['hall_size'] = this.hallSize;
    data['hall_price'] = this.hallPrice;
    data['hall_taple'] = this.hallTaple;
    data['hall_mic'] = this.hallMic;
    data['hall_wc'] = this.hallWc;
    data['hall_desk'] = this.hallDesk;
    data['hall_spekers'] = this.hallSpekers;
    data['hall_ktichin'] = this.hallKtichin;
    data['hall_studio'] = this.hallStudio;
    data['hall_description'] = this.hallDescription;
    data['hall_location'] = this.hallLocation;
    data['hall_langtude'] = this.hallLangtude;
    data['hall_latitude'] = this.hallLatitude;
    return data;
  }
}