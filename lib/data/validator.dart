String? validateNotEmpty(String? value, String errorText) {
  if (value == null || value.isEmpty) {
    return errorText;
  }
  return null;
}