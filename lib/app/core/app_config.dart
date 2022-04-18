const bool debug = true;

final String baseUrl = <String, String>{
  // 本地调试
  'localhost': 'http://localhost:5000/',
  // 真机调试
  'mobile': 'http://172.20.10.2:5000/',
  // 使用外网 API，同时适用于本地调试或真机调试
  'network': 'http://codedog996.com:5000/',
}['network']!;

/// 是否启用缓存
const cacheEnabled = false;

/// 缓存最大时间，单位：秒
const cacheMaxAge = 1000;

/// 缓存最大条目数
const cacheMaxCount = 100;

/// 是否启用代理服务
const proxyEnabled = false;

/// 代理服务器主机
const proxyHost = "127.0.0.1";

/// 代理服务器端口
const proxyPort = 8866;

/// 连接超时毫秒数
const int connectTimeout = 10000;

const int receiveTimeout = 5000;

/// 发行渠道
const String distributionChannel = 'xiao mi';
