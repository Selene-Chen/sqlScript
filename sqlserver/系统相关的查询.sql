 --判断数据库是否存在
 if exists (select * from sys.databases where name = '数据库名') 
--判断表是否存在
 if exists (select * from sysobjects where id = object_id(N'[表名]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) 
--判断存储过程是否存在
if exists (select * from sysobjects where id = object_id(N'[存储过程名]') and OBJECTPROPERTY(id, N'IsProcedure') = 1) 
--判断临时表是否存在
if object_id('tempdb..#临时表名') is not null 
--判断视图是否存在
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = N'视图名称')
--判断函数是否存在 
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[函数名]') and xtype in (N'FN', N'IF', N'TF'))
--判断列是否存在
if exists(select * from syscolumns where id=object_id('表名') and name='列名') 
--判断列是否自增列
if columnproperty(object_id('table'),'col','IsIdentity')=1 print '自增列' else print '不是自增列'
SELECT * FROM sys.columns WHERE object_id=OBJECT_ID('表名') AND is_identity=1
--判断表中是否存在索引
if exists(select * from sysindexes where id=object_id('表名') and name='索引名') print '存在' else print '不存在'
--查看数据库中对象
SELECT * FROM sys.sysobjects WHERE name='对象名' SELECT * FROM sys.sysobjects WHERE name='对象名'

--查询表的列数
select count(name) from syscolumns where id=object_id('表名')
--查询表中所有的列名
select name from syscolumns where id=object_id('表名')
--查询临时表列
select * from tempdb.dbo.syscolumns where id=object_id('tempdb..#Table')
