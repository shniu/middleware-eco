
### ApacheBench

ab命令会创建很多的并发访问线程，模拟多个访问者同时对某一个URL地址进行访问。测试目标是基于URL的，所以可以用来测试Apache、Nginx、lighthttp等服务器的负载能力。

#### 安装和使用

```
// ubuntu install
sudo apt-get install apache2-utils

// dokcer
docker pull mocoso/apachebench
docker run mocoso/apachebench ab -n 10 -c 10 https://www.baidu.com/

```

#### 常见命令

```

ab [options] [http://]hostname[:port]/path

参数(options)：
-n requests  Number of multiple requests to make  // 在测试会话中所执行的请求个数（本次测试总共要访问页面的次数）。默认时，仅执行一个请求。

-c concurrency  Number of multiple requests to make  // 一次产生的请求个数（并发数）。默认是一次一个。

-t timelimit Seconds to max. wait for responses  // 测试所进行的最大秒数。其内部隐含值是-n 50000。它可以使对服务器的测试限制在一个固定的总时间以内。默认时，没有时间限制。

-p postfile File containing data to POST  // 包含了需要POST的数据的文件，文件格式如“p1=1&p2=2”.使用方法是 -p 111.txt 。 （配合-T）

-T content-type Content-type header for POSTing  // POST数据所使用的Content-type头信息，如 -T “application/x-www-form-urlencoded” 。 （配合-p）

-v verbosity How much troubleshooting info to print   // 设置显示信息的详细程度 – 4或更大值会显示头信息， 3或更大值可以显示响应代码(404, 200等), 2或更大值可以显示警告和其他信息。 -V 显示版本号并退出。

-i Use HEAD instead of GET  // 执行HEAD请求，而不是GET

```

- 使用 ab 并发测试 Restful API

```

ab -n 50 -c 50 -T 'application/json' -H 'Authorization:Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJVU0VSX0lEIjoiODEwMWUyYmMtMmI1Yi00MDcwLWFmNTMtYjc5YTY3YzdhNTFjIiwiVVNFUl9UWVBFIjoiRW50ZXJwcmlzZSIsIlJFTEFURV9JRCI6Miwic3ViIjoiODEwMWUyYmMtMmI1Yi00MDcwLWFmNTMtYjc5YTY3YzdhNTFjIiwiaXNzIjoiU1lQSCIsImF1ZCI6IjgxMDFlMmJjLTJiNWItNDA3MC1hZjUzLWI3OWE2N2M3YTUxYyIsImV4cCI6MTc0NTE2MDAyMCwibmJmIjoxNTY1MTYwMDIwfQ.5hhSd2p1ivpfldqVAhZuweyQqbkCV9NpTTllMO5IppsLkywfJiAiCuPz4AFsK6i1bWYgqUcEWOuyqR8NWy1lPQ' -p post.json http://10.1.3.131:4320/api/financing/cases

// post.json
{
  “id”:123,
  "name":"nnn"
}

```


