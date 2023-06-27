class Bachelor{
  String _firstname;
  String _lastname;
  Gender _gender;
  String _avatar;
  List<Gender>? _searchFor;
  String? _job;
  String? _description;

  Bachelor(
      this._firstname,
      this._lastname,
      this._gender,
      this._avatar,
      [
        this._searchFor,
        this._job,
        this._description
      ]
    );

  String? get description => _description;

  String? get job => _job;

  List<Gender>? get searchFor => _searchFor;

  String get avatar => _avatar;

  Gender get gender => _gender;

  String get lastname => _lastname;

  String get firstname => _firstname;
}

enum Gender{
  man,
  woman
}