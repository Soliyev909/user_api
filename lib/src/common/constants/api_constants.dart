abstract final class ApiConst {
  static const _baseUrl = String.fromEnvironment(
    "base_url",
    defaultValue: "...",
  );

  static const apiKey = String.fromEnvironment(
    "api_key",
    defaultValue: "...",
  );

  static const allusersPath = "$_baseUrl/users";
  static const searchusersPath = "$_baseUrl/users/search";
  static const createNewPostPath = "$_baseUrl/users/add";

  static String getPostFromId(int id) => "$_baseUrl/users/$id";

  static String getUsers(int id) => "$_baseUrl/users/$id";

  static String getPostComments(int id) => "$_baseUrl/users/$id/comments";

  static String updatePost(int id) => "$_baseUrl/users/$id";

  static String deletePost(int id) => "$_baseUrl/users/$id";

  static Map<String, List<String>> searchQuery(String searchText) => {
        "q": [searchText],
      };

  static Map<String, List<String>> paginationQuery(int limit, int skip) => {
        "limit": ["$limit"],
        "skip": ["$skip"],
      };
  static Map<String, List<String>> limitQuery(int limit) => {
        "limit": ["$limit"]
      };
}
