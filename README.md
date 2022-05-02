**项目说明**
- fast-generator是一款低代码生成器，可根据自定义模板内容，快速生成代码，可实现项目的快速开发、上线，减少重复的代码编写，开发人员只需专注业务逻辑即可。

<br>

**本地部署**
- 通过git下载源码
- idea、eclipse需安装lombok插件，不然会提示找不到entity的get set方法
- 创建数据库fast_generator，数据库编码为utf8mb4
- 执行db/mysql.sql文件，初始化数据
- 修改application.yml，更新MySQL账号和密码、数据库名称
- Eclipse、IDEA启动GeneratorApplication.java，则可启动项目
- 项目访问路径：http://localhost:8088
