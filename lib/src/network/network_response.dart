// /// A utility class for managing network responses.
// /// Can standardize and parse responses for better consistency across the app.
// class NetworkResponse<T> {
//   final T? data;
//   final String? message;
//   final bool isSuccess;
//
//   /// Constructor to initialize the network response.
//   NetworkResponse({
//     required this.isSuccess,
//     this.data,
//     this.message,
//   });
//
//   /// Factory method for a successful response.
//   factory NetworkResponse.success({required T data}) {
//     return NetworkResponse<T>(
//       isSuccess: true,
//       data: data,
//       message: null,
//     );
//   }
//
//   /// Factory method for a failed response.
//   factory NetworkResponse.failure({required String message}) {
//     return NetworkResponse<T>(
//       isSuccess: false,
//       data: null,
//       message: message,
//     );
//   }
//
//   /// Helper method to print the response for debugging.
//   @override
//   String toString() {
//     return 'NetworkResponse{isSuccess: $isSuccess, message: $message, data: $data}';
//   }
// }
