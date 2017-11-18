-- =============================================
-- Author:		loveshullf
-- Create date: 2017.11
-- Description:	<设置临时表表中null为0>
-- =============================================
ALTER PROCEDURE [dbo].[TempTableSetNULLtoZero]
	-- 表名
	@tableName varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @cmd varchar(MAX)
	declare @column varchar(MAX)
	declare @index int
	declare @count int
	select @count=count(name) from tempdb.dbo.syscolumns where id=object_id('tempdb..'+@tableName)
	select @index=0
	 while @index <=@count
		begin
			 select top 1 @column=name from tempdb.dbo.syscolumns where colid>@index and id=object_id('tempdb..'+@tableName) order by colid
			 select @index=@index+1
			 
			 select @cmd= 'update '+@tableName+' set '+@column+'=0 where '+@column+' is null'
			 exec(@cmd)
		end
END
