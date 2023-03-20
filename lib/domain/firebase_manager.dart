import 'package:firebase_core/firebase_core.dart';
import 'package:e_commerce_app/domain/firebase_options.dart';

class FirebaseManager {
  Future<FirebaseApp> initFirebase() async {
    return await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
