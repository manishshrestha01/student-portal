// making same like ui of figma
class StatusMapper {
  static String mapCourseStatus(String? status) {
    if (status == null || status.isEmpty) {
      return 'Unknown';
    }

    final normalizedStatus = status.toLowerCase().trim();

    switch (normalizedStatus) {
      case 'approved':
        return 'Enrolled';
      case 'pending':
        return 'Pending';
      case 'rejected':
        return 'Rejected';
      case 'active':
        return 'Active';
      case 'completed':
        return 'Completed';
      case 'enrolled':
        return 'Enrolled';
      default:
        return status;
    }
  }
}
