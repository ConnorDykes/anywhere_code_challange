String convertNameFromUrl(String url) {
  return url.replaceAll("https://duckduckgo.com/", '').replaceAll("_", " ");
}
