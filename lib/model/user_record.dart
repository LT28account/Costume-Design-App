enum Classification{
  firstYear, secondYear, thirdYear, fourthYear, graduate, 
}

enum Major{
  cs, se, ce, ds, other, 
}

enum ProgLanguage{
  dart, java, javascript, python, cpp, cshart,
}

class UserRecord {
  late String email;
  late String password;
  late String name;
  late String phone;
  late int age;
  late Classification classification;
  late Major major;
  late Map<ProgLanguage, bool> progLanguage;

  UserRecord({
    this.email = '',
    this.password = '',
    this.name = '',
    this.phone = '',
    this.age = 0,
    this.classification = Classification.firstYear,
    this.major = Major.cs,
  }) {
    progLanguage = {};
    for (var e in ProgLanguage.values) {
      progLanguage[e] = false;
    }
  }

  UserRecord clone() {
    var copy = UserRecord(
      email: email,
      password: password,
      name: name,
      phone: phone,
      age: age,
      classification: classification,
      major: major,
    );
    copy.progLanguage = {...progLanguage};
    return copy;
  }

  void copyFrom(UserRecord obj) {
    // a = b ==> a.copyFrom(b)
    email = obj.email;
    password = obj.password;
    name = obj.name;
    phone = obj.phone;
    age = obj.age;
    classification = obj.classification;
    major = obj.major;
    progLanguage = {...obj.progLanguage};
  }

  @override
  String toString() {
    return 'UserRecord[name=$name ($email, $password)]';
  }
}

List<UserRecord> fakeDB = [
  UserRecord(
      email: '1@test.com',
      password: '1111111',
      name: 'One John',
      phone: '1112223344'),
  UserRecord(
      email: '2@test.com',
      password: '2222222',
      name: 'Two Mary',
      phone: '4443332211'),
];
