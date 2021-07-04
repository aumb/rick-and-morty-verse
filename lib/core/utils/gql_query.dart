mixin GqlQuery {
  static String charactersQuery = '''
  query (\$page: Int!, \$query: String){
    characters(page: \$page, filter: { name: \$query }){
      results{
        id
        name
        status
        gender
        type
        species
        image
        location {
          name
        }
        episode {
          name
        }
      }
    }
  }
  ''';

  static String locationsQuery = '''
  query (\$page: Int!, \$query: String){
    locations(page: \$page, filter: { name: \$query }){
      results{
        id
        name
        type
        dimension
      }
    }
  }
  ''';

  static String episodesQuery = '''
  query (\$page: Int!, \$query: String){
    episodes(page: \$page, filter: { name: \$query }){
      results{
        id
        name
        episode
        air_date
      }
    }
  }
  ''';
}
