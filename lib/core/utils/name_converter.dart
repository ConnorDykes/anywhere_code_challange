String convertNameFromUrl(String url) {
  return url.replaceAll("https://duckduckgo.com/", '').replaceAll("_", " ");
}

String removeNameFromText(String text, String name) {
  return text.replaceFirst(name, '').replaceFirst(" - ", '');
}
