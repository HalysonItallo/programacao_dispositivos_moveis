import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:slide_image/app/interfaces/session_manager_client_interface.dart';

class SessionManagerClient implements ISessionManagerClient {
  SessionManager sessionManager;

  SessionManagerClient(this.sessionManager);

  @override
  Future delete(String key) async {
    await sessionManager.remove(key);
  }

  @override
  Future get(String key) async {
    return await sessionManager.get(key);
  }

  @override
  Future put(String key, dynamic value) async {
    await sessionManager.set(key, value);
  }
}
