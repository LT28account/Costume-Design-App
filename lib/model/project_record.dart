enum Fabric {
  Chiffon,
  Cotton,
  Crepe,
  Denim,
  Lace,
  Leather,
  Linen,
  Metal,
  Satin,
  Silk,
  Synthetic,
  Velvet,
  Wool,
}

enum Reason {
  Self,
  Commissioned,
  Event,
}

class ProjectRecord {
  late String projectName;
  late double cost;
  late String sliderTime;
  late String sliderLengthOfFabric;
  late Reason reason;
  late Map<Fabric, bool> fabric;

  ProjectRecord({
    this.projectName = '',
    this.cost = 0,
    this.sliderTime = '',
    this.sliderLengthOfFabric = '',
    this.reason = Reason.Self,
  }) {
    fabric = {};
    for (var e in Fabric.values) {
      fabric[e] = false;
    }
  }

  ProjectRecord clone() {
    var copy = ProjectRecord(
      projectName: projectName,
      cost: cost,
      sliderTime: sliderTime,
      sliderLengthOfFabric: sliderLengthOfFabric,
      reason: reason,
    );
    copy.fabric = {...fabric};
    return copy;
  }

  void copyFrom(ProjectRecord obj) {
    projectName = obj.projectName;
    cost = obj.cost;
    sliderTime = obj.sliderTime;
    sliderLengthOfFabric = obj.sliderLengthOfFabric;
    reason = obj.reason;
    fabric = {...obj.fabric};
  }

  @override
  String toString() {
    return 'ProjectRecord[name=$projectName]';
  }
}

List<ProjectRecord> projectDB = [
  ProjectRecord(
    projectName: 'Wednesday Addams',
    cost: 45.89,
  ),
  ProjectRecord(
    projectName: 'Mary Queen of Scots',
    cost: 228.71,
  ),
  ProjectRecord(
    projectName: 'Spiderman',
    cost: 76.43,
  ),
];
