## *首页*
1. 获取轮播作品list
2. 获取所有作品list
3. 根据works的id和user的id,在dd_follow_history中记录下收藏信息

## *搜索_1,搜索_2,搜索_3*
1. 根据user.id展示历史查询记录list
2. 根据user.id删除全部历史查询记录

## *搜索结果_用户*
1. 根据用户名称模糊匹配查询用户list,同时查出用户的粉丝数和作品数(查询结果根据'我'的id分为'我'已关注的用户list和未关注的用户list)
## *搜索结果_用户_取消关注弹窗*
1. 根据user.id和'我'的id,在dd_follow_history中记录下关注信息
2. 根据user.id和'我'的id,在dd_follow_history中删除关注信息

## *搜索用户详情_Ta的资料*
1. 根据id查询user
## *搜索用户详情_Ta的粉丝*
1. 根据id查询user的粉丝list,同时查出用户的粉丝数和作品数(查询结果根据'我'的id分为'我'已关注的用户list和未关注的用户list)
2. 根据user.id和'我'的id,在dd_follow_history中记录下关注信息
3. 根据user.id和'我'的id,在dd_follow_history中删除关注信息
## *搜索用户详情_Ta的作品*
1. 根据id查询user的作品list
2. 根据works的id和'我'的id,在dd_follow_history中记录下收藏信息
## *搜索用户详情_粉丝详情_Ta的资料*
1. 取消两个标题的页面
## *搜索用户详情_粉丝详情_Ta的作品*
1. 取消两个标题的页面

## *搜索结果_作品_1,搜索结果_作品_2*
1. 根据works.name模糊匹配查询作品(比如根据'红玉'能查出'小红玉','红玉','红玉小')
2. 根据works.name模糊匹配查询作品(按上架时间排序)
3. 根据works.name模糊匹配查询作品(按离我最近排序)
4. 根据works的id和user的id,在dd_follow_history中记录下收藏信息

## *搜索结果_作品详情*
1. 根据works的id查询works
2. 根据works的id查询works_level
3. 根据works的id查询images(type为作品图片,诠释图片,认证证书),
4. 根据works的id查询consumer(type分别为provideBy和collectBy),
5. 根据works的id查询report,
6. 根据works的id查询user list(收藏者)(通过中间表dd_follow_history)
7. 根据works的id查询user list(浏览者)(通过中间表dd_browse_history)
8. 根据works的id查询interpretation list(诠释列表)
## *搜索结果_作品详情_管理员新增的作品时*
1. 根据works的id查询works,works_level,images,consumer(provideBy和collectBy),report,value_report,follow_history(收藏者),browse_history,interpretation
2. 根据'我的'id判断是否是管理员
## *搜索结果_作品详情_诠释弹窗*
1. 根据works的id来保存interpretation(若是递归评论再插入parent_id)
## *搜索作品_详情页_诠释详情*
1. 根骨id查询interpretation

## *登记申请_物品信息*
1. 根据页面传送的数据和user的id保存works(要判断是否草稿),consumer(type为provideBy提供者),images
## *登记申请_作品信息*
1. 根据页面传送的数据和works的id(之前保存works时将works的id和name存入session,name在页面中显示)将works更新
## *登记申请_作品等级*
1. 根据页面传送的数据和works的id(之前保存works时将works的id和name存入session,name在页面中显示)保存works_level
## *登记申请_作品等级_选择弹窗*
1. 无
## *登记申请_评估报告_未上传证书*
1. 根据works的id(之前在'登记申请_物品信息'保存时,存入session)保存images(type要保存为认证证书)
## *登记申请_评估报告_已上传证书*
1. 根据works的id(之前在'登记申请_物品信息'保存时,存入session)删除images(type为认证证书)
## *登记申请_评估报告_提交弹窗*
1. 根据works的id(之前在'登记申请_物品信息'保存时,存入session)保存report
## *登记申请_评估报告_管理员填写时*
1. 根据'我的'id判断是否是管理员
## *登记申请_评估报告_点击证书选项*
1. 根据works的id(之前在'登记申请_物品信息'保存时,存入session)保存或删除images(type为认证证书)
## *登记申请_申请须知弹窗*
1. 无
## *登记申请_收藏信息*
1. 根据works的id保存consumer(type为collectBy收藏者)
## *登记申请_收藏信息_提交弹窗*
1. 无

## *个人中心*
1. 根据'我'的id查询user,根据openId查询微信头像,昵称
## *设置*
1. 根据'我'的id查询user,根据openId查询微信头像,昵称
## *积分中心*
1. 根据'我'的id查询dd_score_history(积分收支情况)list,根据dd_score_history的id级联查询scoreCalc,最后的返回类型?
## *积分中心_积分充值*
1. 根据'我'的id及页面传来的充值数值,保存dd_score_history,充值的接口???
## *积分中心_积分提现_弹窗提示*
1. 根据'我'的id及页面传来的提现数值,保存dd_score_history,钱转出的接口???

## *关注用户*
1. 根据'我'的id查询'我'关注的用户list,同时将用户作品数和粉丝数查出
## *关注用户_取消关注弹窗*
1. 根据'我'的id(user_id)和user的id(target_id),删除dd_follow_history中的关注记录(type为关注用户)
## *关注用户_用户详情页_Ta的资料*
1. 根据id查询user
## *关注用户_用户详情页_Ta的粉丝*
1. 根据id查询user的粉丝list,同时查出用户的粉丝数和作品数(查询结果根据'我'的id分为'我'已关注的用户list和未关注的用户list)
2. 根据user.id和'我'的id,在dd_follow_history中记录下关注信息
3. 根据user.id和'我'的id,在dd_follow_history中删除关注信息
## *关注用户_用户详情页_Ta的作品*
1. 根据id查询user的作品list
2. 根据works的id和'我'的id,在dd_follow_history中记录下收藏信息
## *关注用户_用户详情页_Ta的粉丝详情页_Ta的资料*
1. 取消两个标题
## *关注用户_用户详情页_Ta的粉丝详情页_Ta的作品*
1. 取消两个标题

## *收藏作品_查看详情*
1. 同'搜索结果_作品详情'
## *收藏作品_有作品*
1. 根据'我'的id查出我的收藏作品list(通过中间表dd_follow_history)
## *收藏作品_无作品*
1. 无

## *转入作品_无作品*
1. 无
## *转入作品_有作品*
1.  根据'我'的id查出转让作品list(通过中间表dd_transfer_history)
## *转让作品_除转入的作品外_查看详情_作品详情*

## *转入作品_转让作品_待确认转入的作品_查看详情*

## *转入作品_转让历史*
1. 根据作品的id,查出(转让历史dd_transfer_history及转让的双方用户user1和user2)list[这个SQL好像有点难写,然后查出来之后用什么来接这个查询出来的数据?]

## *转入作品_转让作品_转入的作品_查看详情*
1. 同'收藏作品_查看详情'

## *我的作品_审核中_查看详情*
1. 同'搜索结果_作品详情'
## *我的作品_审核中_有作品*
1. 根据我的id和works.type为审核中查出'我'审核中作品list
## *我的作品_审核中_无作品*
1. 无

## *我的作品_草稿箱_编辑*
1. 根据works的id查出works,将信息显示在页面上
## *我的作品_草稿箱_查看详情*
1. 同'收藏作品_查看详情'
## *我的作品_草稿箱_无作品*
1. 无
## *我的作品_草稿箱_有作品*
1. 根据根据我的id和works.type为草稿查出'我'草稿箱作品list
## *我的作品_草稿箱_有作品_弹窗*
1. 根据works的id删除该works
## *我的作品_审核通过(失败)同草稿箱*


## *问题*
1. 那天建的图片表,有类型字段,可以根据type判断是什么图片(作品图片[一个作品能有多张图片],认证图片,诠释图片[一个诠释能有多张图片]等).但是在作品详情页,可以有很多诠释详情,在jsp中多个诠释详情的多个images如何找到属于自己的诠释详情?
2. 几乎所有表都带有del_flag字段,页面上要删除数据时,是改变del_flag还是真的将数据库中的数据也删除?
3. del_flag默认为空.在保存数据的时候,del_flag都是设置为未被删除的状态,是否要将del_flag的默认值改动一下?类似的还有createDate,updateDate默认为空.
