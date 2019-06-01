class userFields {
  final int thanks;
  final String country;

  userFields(Map<String, Object> map, { this.thanks, this.country });

  Map<String, dynamic> getJson() {
    return {
      "thanks": this.thanks,
      "country": this.country
    };
  }
}