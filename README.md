"# managementSystem"   
这是一套后台管理系统的java小项目，里面涵盖了各个功能点，相关内容和一些知识点，抽时间边学边完善    
前台技术：html + jquery + ajax + css + iframe   
后端框架：Spring + springMVC + Mybatis   

1、注册功能：按照注册信息填写，同时前后台分别验证；  
2、登录功能：账号密码登录，附加图片验证码，登录密码利用MD5加密；  
3、修改密码功能：以登录为主，进来之后可修改，进不来可点击忘记密码进行找回密码或密码重置；  
4、内容管理功能：（从数据库中拿数据并对数据做单删、批量删除、修改、上传图片、分页、单选、多选、全选等功能），   
5、短信验证功能：采用秒嘀短信接口，下发短信验证码进行短信验证。  
6、邮箱验证功能：利用邮箱下发邮件，并让用户点击激活才可用。  
7、二维码：点击生成，生成后的二维码也可以解析。  
8、工作流：请假，start:
			用户登录后台系统，提前一周手动填写电子版固定格式请假条，并提交到人事；
			判断请假时长，小于15天，人事审批后提交至人事领导审批，审批通过进入下一步，不通过直接返回用户原因；
			请假时长大于15天，人事审批后提交至用户所在部门领导，审批通过进入下一步，不通过直接返回用户原因；
			请假成功后正常休假，假期结束人事销假；
  			end;
上图看效果：

!["查看登录界面"](https://github.com/Killwithout/managementSystem/tree/master/image/1.jpg)  
!["查看上传界面"](https://github.com/Killwithout/managementSystem/tree/master/image/2.png)  
!["查看内容管理界面"](https://github.com/Killwithout/managementSystem/tree/master/image/3.png)  
