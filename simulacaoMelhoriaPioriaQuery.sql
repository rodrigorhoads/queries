
if object_id('tempdb..#cliente') is not null drop table #cliente

create table #cliente (clidcli int ,clcodcli int,
						clnomecli nvarchar(50),
						ppidprop int,ppidcli int,clfonefisico nvarchar(11),clfonecobranca nvarchar(11),clfonecontato nvarchar(11))

insert into #cliente(clidcli,clcodcli,clnomecli,ppidprop,clfonefisico,clfonecobranca,clfonecontato)
select top 1 cl.clidcli,cl.clcodcli,cl.clnomecli,ppidprop,cf.clfone,cc.clfone,ct.clfone  from 
cclip as cl join cprop on cl.clidcli = ppidcli
left join ccfone as cf on cf.clidcli = cl.clidcli and cf.clidctel = (select top 1 tpidtel from tpfone where tpcodfone ='001')
left join ccfone as cc on cc.clidcli = cl.clidcli and cc.clidctel = (select top 1 tpidtel from tpfone where tpcodfone ='002')
left join ccfone as ct on cc.clidcli = cl.clidcli and ct.clidctel = (select top 1 tpidtel from tpfone where tpcodfone ='003')
where
ppidprop = 4
order by cf.clnrseq asc,cc.clnrseq asc,ct.clnrseq

select * from #cliente

insert into #cliente(clidcli,clcodcli,clnomecli,ppidprop)
select top 1 cl.clidcli,cl.clcodcli,cl.clnomecli,ppidprop from
cclip as cl join cprop on cl.clidcli = ppidcli
where
ppidprop = 2


update #cliente set clfonefisico = cf.clfone,clfonecobranca = cc.clfone,clfonecontato= ct.clfone  from #cliente as cl
left join ccfone as cf on cf.clidcli = cl.clidcli and cf.clidctel = (select top 1 tpidtel from tpfone where tpcodfone ='001')
left join ccfone as cc on cc.clidcli = cl.clidcli and cc.clidctel = (select top 1 tpidtel from tpfone where tpcodfone ='002')
left join ccfone as ct on ct.clidcli = cl.clidcli and ct.clidctel = (select top 1 tpidtel from tpfone where tpcodfone ='003')
where cl.ppidprop = 2

