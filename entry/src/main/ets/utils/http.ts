import http from '@ohos.net.http';

export default function getHttpData(url?: string, params?: any): Promise<any> {
  return new Promise(async (resolve, reject) => {
    let httpRequest = http.createHttp();
    let response = httpRequest.request(
      // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
      url = "https://api.apiopen.top/api/sentences",
      {
        method: http.RequestMethod.GET, // 可选，默认为http.RequestMethod.GET
        // 开发者根据自身业务需要添加header字段
        header: {
          'Content-Type': 'application/json'
        },
        expectDataType: http.HttpDataType.STRING, // 可选，指定返回数据的类型
        readTimeout: 60000,
      }
    );
    // 使用await和async，等待请求完成处理数据后返回
    await response.then((data) => {
      if (data.responseCode == 200) {
        // 处理返回结果
        const response = data.result + "";
        const res = JSON.parse(response)
        resolve(res)
      } else {
        reject(data)
        // todo 请求失败，进行失败逻辑处理
      }
    }).catch((err) => {
      // todo 请求失败，进行失败逻辑处理
      console.info('error:' + JSON.stringify(err));
      reject(err)
    })
  })
}