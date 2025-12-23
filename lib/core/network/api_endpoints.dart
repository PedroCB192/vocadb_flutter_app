class ApiEndpoints {
  // Base endpoints
  static const songs = '/songs';
  static const albums = '/albums';
  static const artists = '/artists';

  // Specific endpoints
  static const highlightedSongs = '/songs/highlighted';

  // Query parameters comunes
  static const defaultSongParams = {
    'languagePreference': 'Romaji',
    'fields': 'MainPicture',
  };

  static const defaultListParams = {
    'childTags': 'false',
    'unifyTypesAndTags': 'false',
    'childVoicebanks': 'false',
    'includeMembers': 'false',
    'onlyWithPvs': 'true',
    'getTotalCount': 'false',
    'preferAccurateMatches': 'false',
    'lang': 'Romaji',
  };
}
