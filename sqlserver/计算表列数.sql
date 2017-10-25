 select   count(syscolumns.name)
   from   syscolumns   ,   sysobjects    
   where   syscolumns.id   =   sysobjects.id  
   and   sysobjects.name   =   '表名'