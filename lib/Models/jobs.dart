/// name : "Michelle Bailey"
/// Jobtype : "Producer"
/// Company : "plug-and-play"
/// Logo : "https://loremflickr.com/640/480/business"
/// Detail : "Laudantium sapiente deserunt beatae placeat autem unde tempora animi. Aspernatur temporibus voluptates. Illo perferendis occaecati optio quam rerum necessitatibus natus ex dolorum."
/// Location : "Sierra Leone"
/// Salary : 39
/// sortdetail : "Modi labore nostrum odio tempora et.\nRerum minus ullam consectetur velit asperiores cupiditate."
/// id : "1"

class Jobs {
  Jobs({
      String? name, 
      String? jobtype, 
      String? company, 
      String? logo, 
      String? detail, 
      String? location, 
      num? salary, 
      String? sortdetail, 
      String? id,}){
    _name = name;
    _jobtype = jobtype;
    _company = company;
    _logo = logo;
    _detail = detail;
    _location = location;
    _salary = salary;
    _sortdetail = sortdetail;
    _id = id;
}

  Jobs.fromJson(dynamic json) {
    _name = json['name'];
    _jobtype = json['Jobtype'];
    _company = json['Company'];
    _logo = json['Logo'];
    _detail = json['Detail'];
    _location = json['Location'];
    _salary = json['Salary'];
    _sortdetail = json['sortdetail'];
    _id = json['id'];
  }
  String? _name;
  String? _jobtype;
  String? _company;
  String? _logo;
  String? _detail;
  String? _location;
  num? _salary;
  String? _sortdetail;
  String? _id;
Jobs copyWith({  String? name,
  String? jobtype,
  String? company,
  String? logo,
  String? detail,
  String? location,
  num? salary,
  String? sortdetail,
  String? id,
}) => Jobs(  name: name ?? _name,
  jobtype: jobtype ?? _jobtype,
  company: company ?? _company,
  logo: logo ?? _logo,
  detail: detail ?? _detail,
  location: location ?? _location,
  salary: salary ?? _salary,
  sortdetail: sortdetail ?? _sortdetail,
  id: id ?? _id,
);
  String? get name => _name;
  String? get jobtype => _jobtype;
  String? get company => _company;
  String? get logo => _logo;
  String? get detail => _detail;
  String? get location => _location;
  num? get salary => _salary;
  String? get sortdetail => _sortdetail;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['Jobtype'] = _jobtype;
    map['Company'] = _company;
    map['Logo'] = _logo;
    map['Detail'] = _detail;
    map['Location'] = _location;
    map['Salary'] = _salary;
    map['sortdetail'] = _sortdetail;
    map['id'] = _id;
    return map;
  }

}