/**
 异步函数:
    返回Future或者Stream对象的函数

  1. Future.then, 获取异步结果
  2. Future.catchError, 捕获异步错误
  3. Future.whenComplete, 无论异步成功还是失败，都会执行
  4. Future.wait, 等待多个异步任务完成
  5. Future.any, 等待多个异步任务完成，返回最快完成的异步任务的结果
  6. Future.all, 等待多个异步任务完成，返回所有异步任务的结果
  7. Future.forEach, 遍历异步任务
  8. Future.map, 映射异步任务

  
 */


void main(List<String> args) {
  // 1. Future.then
  Future.delayed(Duration(seconds: 2), () {
    return "hi world!";
  }).then((data) {
    print(data);
  });
}
