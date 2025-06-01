// 引入express
const express = require('express');
// 引入文件模块
const fs = require('fs');
// 创建express实例
const server = express();

server.get("/api/category", (req, res) => {
  fs.readFile('../assets/json/category.json', function(err, data) {
    if (err) {
      res.send(err);
    }
    res.send(JSON.parse(data.toString()));
  })
})

server.get("/api/meal", (req, res) => {
  fs.readFile('../assets/json/meal.json', (err, data) => {
    if (err) {
      res.send(err);
    }
    res.send(JSON.parse(data.toString()));
  })
})

// 运行端口
server.listen(1997, () => {
  console.log("The server is running at http://localhost:1997");
})
