enum MissionStatus {
  not_started,
  in_progress,
  finished,
  cancelled,
}

MissionStatus getMissionStatusFromString(String role) {
  switch (role) {
    case 'IN_PROGRESS':
      return MissionStatus.in_progress;
    case 'FINISHED':
      return MissionStatus.finished;
    case 'CANCELLED':
      return MissionStatus.cancelled;
    default:
      return MissionStatus.not_started;
  }
}
