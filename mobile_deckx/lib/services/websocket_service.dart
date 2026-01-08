import 'package:web_socket_channel/io.dart';

class WebSocketService {
  static late IOWebSocketChannel _channel;

  static Future<void> connect(String ip) async {
    _channel = IOWebSocketChannel.connect('ws://$ip:8080');
  }

  static void sendAction(String action) {
    _channel.sink.add(action);
  }

  static void disconnect() {
    _channel.sink.close();
  }
}