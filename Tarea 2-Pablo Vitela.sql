--Pablo Vitela
--197263
--Tarea 2 

create table super_heroes (
 first_name character varying(10) NOT NULL,
 last_name character varying(20) NOT NULL,
 email character varying(100)
);

insert into super_heroes values('Wanda','Maximoff', 'wanda.maximoff@avengers.org');
insert into super_heroes values('Pietro','Maximoff', 'pietro@mail.sokovia.ru');
insert into super_heroes values('Erik','Lensherr', 'fuck_you_charles@brotherhood.of.evil.mutants.space');
insert into super_heroes values('Charles','Xavier', 'i.am.secretely.filled.with.hubris@xavier-school-4-gifted-youngste.');
insert into super_heroes values('Anthony ','Stark', 'iamironman@avengers.gov');
insert into super_heroes values('Steve',' Rogers', 'americas_ass@anti_avengers');
insert into super_heroes values('The','Vision', 'vis@westview.sword.gov');
insert into super_heroes values('Clint ','Barton', 'bul@lse.ye');
insert into super_heroes values('Thor','Thor', 'god_of_thunder-^_^@royalty.asgard.gov');
insert into super_heroes values('Logan','Wolverine', 'wolverine@cyclops_is_a_jerk.com');
insert into super_heroes values('Ororo ','Monroe', 'ororo@weather.co');
insert into super_heroes values('Scott ','Summers', 'o@x');
insert into super_heroes values('Nathan','Summers', 'cable@xfact.or');
insert into super_heroes values('Groot','-', 'iamgroot@asgardiansofthegalaxyledbythor.quillsux');
insert into super_heroes values('Nebula','-', '	idonthaveelektras@complex.thanos');
insert into super_heroes values('Gamora','-', '	thefiercestwomaninthegalaxy@thanos.');
insert into super_heroes values('Rocket','-', '	shhhhhhhh@darknet.ru');

select * from super_heroes;

select first_name, email from super_heroes s 
where s.email not like '%_@__%_.__%'
or s.email like '%^%';