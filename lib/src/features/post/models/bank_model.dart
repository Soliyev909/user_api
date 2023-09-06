class Bank {
  String? cardExpire;
  String? cardNumber;
  String? cardType;
  String? currency;
  String? iban;

  Bank(
      {this.cardExpire,
      this.cardNumber,
      this.cardType,
      this.currency,
      this.iban});

  Bank.fromJson(Map<String, Object?> json) {
    cardExpire = json["cardExpire"] as String?;
    cardNumber = json["cardNumber"] as String?;
    cardType = json["cardType"] as String?;
    currency = json["currency"] as String?;
    iban = json["iban"] as String?;
  }

  Map<String, Object?> toJson() {
    final Map<String, Object?> data = <String, Object?>{};
    data["cardExpire"] = cardExpire;
    data["cardNumber"] = cardNumber;
    data["cardType"] = cardType;
    data["currency"] = currency;
    data["iban"] = iban;
    return data;
  }


}
