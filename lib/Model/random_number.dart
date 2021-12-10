class RandomNumber {
  String status;
  int min;
  int max;
  int random;

  RandomNumber.fromJson(Map json)
      : status = json['status'],
        min = json['min'],
        max = json['max'],
        random = json['random'];

  Map toJson() {
    return {'status': status, 'min': min, 'max': max, 'random': random};
  }
}