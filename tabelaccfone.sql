create table ccfone 
(
	clidcli int,
	clnrseq int identity(1,1),
	clfone nvarchar(11),
	clidctel int
)


insert into ccfone(clidcli,clfone,clidctel)
values(2,'11777',4),(2,'06888888888',4)

select * from tpfone
select * from ccfone