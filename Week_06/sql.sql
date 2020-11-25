用户表
CREATE TABLE `shopper_user` (

  `id` bigint(10) primary key  NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_no` varchar(32) NOT NULL COMMENT '用户编号',
  `user_name` varchar(32) NOT NULL COMMENT '用户姓名',
  `user_sex` int(2)  DEFAULT 0 COMMENT '用户性别(0未知,1男,2女)',
  `user_birthdate` datetime NULL COMMENT '用户出生日期时',
  `user_icon_url` varchar(500) DEFAULT NULL COMMENT '用户头像url',
  `user_phone` varchar(16) NOT NULL COMMENT '用户手机号',
  `user_id_card_type` int  NOT NULL COMMENT '用户身份证件类型',
  `user_id_card` varchar(30) NOT NULL COMMENT '用户身份证件信息',
  `user_address` varchar(256) NOT NULL COMMENT '用户住址',
  `user_status` int(5) DEFAULT 1 COMMENT '用户状态（0已锁定,1正常,2异常,3其他状态）',
  `user_nickname` varchar(32) NOT NULL COMMENT '用户昵称',
  `last_login_time` datetime not NULL COMMENT '最后一次上线时间',
  `create_time` datetime not NULL COMMENT '新建时间',
  `update_time` datetime  not NULL COMMENT '更新时间'
)

用户收货信息表
create TABLE 'shopper_user_receiving _info`'(

  `id` bigint(10) primary key  NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  ` shopper_user_id` bigint(10) NOT NULL COMMENT '用户表外键ID',
  ` receiving _user` varchar(32) NOT NULL COMMENT '收货人',
  ` receiving _phone` varchar(32) NOT NULL COMMENT '收货电话',
  ` receiving_postcode` varchar(10) NOT NULL COMMENT '收货邮编',
  ` receiving _province` varchar(10) NOT NULL COMMENT '省份',
  ` receiving _city` varchar(10) NOT NULL COMMENT '城市',
  ` receiving _region` varchar(10) NOT NULL COMMENT '地区',
  ` receiving _town` varchar(10) NOT NULL COMMENT '城镇',
  ` receiving _address` varchar(30) NOT NULL COMMENT '收货详细地址', 
  `create_time` datetime not NULL COMMENT '新建时间',
  `update_time` datetime  not NULL COMMENT '更新时间'
)

用户支付信息表
create TABLE 'shopper_user_pay_info`'(

  `id` bigint(10) primary key  NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  ` shopper_user_id` bigint(10) NOT NULL COMMENT '用户表外键ID',
  ` pay_type` int(10) NOT NULL COMMENT '支付类型',
  ` pay_account` varchar(32) NOT NULL COMMENT '支付账户',
  ` is_user` int NOT NULL COMMENT '是否可用',
  `create_time` datetime not NULL COMMENT '新建时间',
  `update_time` datetime  not NULL COMMENT '更新时间'
)

商品基本表

CREATE TABLE `goods_info`(

  `id` bigint(10)  NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `goods_no` varchar(32) NOT NULL COMMENT '商品编号',
  `goods_name` varchar(32) NOT NULL COMMENT '商品名称',
  `goods_desc` varchar(64) NOT NULL COMMENT '商品描述',
  `goods_barcode` varchar(64) NOT NULL COMMENT '商品条形码',
  `goods_type` tinyint(5) COMMENT '商品类别',
  `goods_status` tinyint(5) COMMENT '商品状态(0未上架,1已上架,2审核中,3违规下架,4其他)',
  `product_time` bigint(10) NULL COMMENT '生产日期时间戳',
  `expired_time` bigint(10)  NULL COMMENT '过期日时间戳',
  `product_address` varchar(32) NOT NULL COMMENT '产地',
  `product_company` varchar(32) NOT NULL COMMENT '生产商',
  `company_address` varchar(32) NOT NULL COMMENT '生产商地址',
  `company_phone` varchar(32) NOT NULL COMMENT '生产商联系方式',
  `create_time` datetime not NULL COMMENT '新建时间',
  `update_time` datetime  not NULL COMMENT '更新时间'
)

商品库存信息
create table 'goods_info_stock'(
	`id` bigint(10)  NOT NULL AUTO_INCREMENT COMMENT '自增ID',
	`goods_info_id` bigint(10) NOT NULL COMMENT '商品ID',
	`num` int not null COMMENT '库存'
)

商品图片表
CREATE TABLE `goods_info`(
	`id` bigint(10)  NOT NULL AUTO_INCREMENT COMMENT '自增ID',
	`goods_info_id` bigint(10) NOT NULL AUTO '商品ID',
	`goods_img` varchar(128)  NULL COMMENT '商品图片',
)

订单表

CREATE TABLE `order_record` (
  `id` bigint(10)  NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_no` varchar(32) NOT NULL COMMENT '订单编号',
  `buyer_user_id` varchar(32) NOT NULL COMMENT '买方ID',
  `seller_user_id` varchar(32) NOT NULL COMMENT '卖方ID',
  `goods_info_id` bigint(10) NOT NULL AUTO '商品ID',
  `order_amount` decimal(12, 4) NOT NULL COMMENT '订单金额',
  `pay_amount` decimal(12, 4) NOT NULL COMMENT '实际支付金额',
  `pay_id` tinyint(5)  NOT NULL COMMENT '支付方式',
  `merchant_pay_no` varchar(32) DEFAULT NULL COMMENT '商户支付流水号',
  `order_status` tinyint(5)  DEFAULT 0 COMMENT '订单状态 (0未支付,1已支付,2支付未确认,3已退费,4部分退费,5确认失败)',
)

