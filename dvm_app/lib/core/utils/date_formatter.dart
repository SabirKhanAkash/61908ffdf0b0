import 'package:intl/intl.dart';

class DateFormatter {
  /// Format DateTime to readable string
  /// Default: "Jan 20, 2024 10:30 AM" (both false)
  /// Date only: "Jan 20, 2024" (excludeTime: true)
  /// Time only: "10:30 AM" (excludeDate: true)
  static String format(
    DateTime dateTime, {
    bool excludeDate = false,
    bool excludeTime = false,
  }) {
    if (!excludeDate && !excludeTime) {
      return DateFormat('MMM dd, yyyy hh:mm a').format(dateTime);
    } else if (excludeTime) {
      return DateFormat('MMM dd, yyyy').format(dateTime);
    } else if (excludeDate) {
      return DateFormat('hh:mm a').format(dateTime);
    }
    return '';
  }

  /// Format DateTime to ISO8601 for API
  static String formatForApi(DateTime dateTime) {
    return dateTime.toUtc().toIso8601String();
  }

  /// Parse ISO8601 string to DateTime
  static DateTime parseFromApi(String dateString) {
    return DateTime.parse(dateString);
  }

  /// Get relative time (e.g., "2 minutes ago")
  static String getRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else {
      return format(dateTime, excludeTime: true);
    }
  }
}
