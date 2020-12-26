import 'package:grpc/grpc.dart';

class ClientChannelManager {
  static Map<String, ClientChannelManagerObject> clientChannels = Map();
  // 连接上限数
  static int maxChannelNumber = 10;
  // 优先级最低的key
  static String exitKey = '';

  static int port = 50051;

  static ClientChannel getChannel(String host) {
    host = host.trim();
    //连接存在 取缓存 不存在则创建
    if (clientChannels.containsKey(host + '$port')) {
      //每取一次请求数量加1
      clientChannels[host + '$port'].number++;
      Future(() {
        sort();
      });
      return clientChannels[host + '$port'].clientChannel;
    } else {
      return createChannel(host, port);
    }
  }

  static ClientChannel createChannel(String host, int port) {
    //如果超过连接上限数
    if (clientChannels.length >= maxChannelNumber) {
      ClientChannelManagerObject object = clientChannels[exitKey];
      object.clientChannel.shutdown(); // 关闭优先级最低的连接
      clientChannels.remove(exitKey); // 清出连接池
    }
    ClientChannel channel = new ClientChannel(host,
        port: port,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure()));
    clientChannels[host + '$port'] = ClientChannelManagerObject()
      ..clientChannel = channel
      ..number = 1
      ..createTime = new DateTime.now().millisecondsSinceEpoch;
    Future(() {
      sort();
    });
    return channel;
  }

  static void sort() {
    // 计算优先级
    int currentTime = new DateTime.now().millisecondsSinceEpoch;
    double maxProportion = 0.0;
    clientChannels.forEach((String key, ClientChannelManagerObject value) {
      value.proportion = (currentTime - value.createTime) /
          (value.number * 1.0); //时长除以次数，越小优先级越高
      if (value.proportion > maxProportion) {
        maxProportion = value.proportion;
        exitKey = key;
      }
    });
  }
}

class ClientChannelManagerObject {
  ClientChannel clientChannel;
  int number; //总共请求次数
  int createTime; //第一次创建时间
  double proportion; //时长除以次数，越小优先级越高
}
