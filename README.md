# RGgame
基于Ruby on rails 的校园桌游平台

### 实现功能：
* 用户注册
* 用户登录
* 添加桌游
* 给每项桌游打分
* 在讨论区发表帖子
* 查看他人主页和发帖记录
* 关注其他用户并查看列表


### 说明

项目中主要使用的库：

> Bootstrap, Sqlite3, Rails admin, 详情见Gemfile

使用前需要安装Bundler,Gem,Ruby,Rails等依赖环境。

### 安装

实验环境为：Ubuntu20.04 LTS，进入项目后分别执行如下：

```
$ cd RGgame
$ rake db:migrate
$ rake db:seed
$ rails s 
```
在浏览器的地址栏中输入`localhost:3000`访问项目主页

默认管理员账户为：

账号：`admin@test.com`

密码：`password`

