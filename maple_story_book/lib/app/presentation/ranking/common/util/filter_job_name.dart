String filterJobName(String jobName) {
  final RegExp regExp = RegExp(r'\((.*?)\)');

  final match = regExp.firstMatch(jobName);
  if(match != null) {
    return match.group(1)!;
  }
  return jobName;
}