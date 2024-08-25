select "Model" as mo , "Make" as m, "Year" AS y,id as i from public."Data1"; 
select * from public."Data1"  D; 
select count("id" ) from public."Data1" D where "Year" = 2023;
SELECT id  FROM public."Data1"  WHERE "Year" = 2022;
SELECT "id", "Model" FROM public."Data1"  WHERE "Model" Like 'S_5';

SELECT "id" ,"Model"," Drivetrain"," Doors" ," Transmission"   FROM public."Data1"
WHERE ( "Model" = 'RDX' AND " Drivetrain"='AWD' )
OR 
( " Doors" is null AND " Transmission" is null);
 
SELECT "id" ,"Model"," Drivetrain"," Doors" ," Transmission"   FROM public."Data1"
WHERE "Model" IN ('911','Taycan', 'Corvette','traverse','STS');

SELECT "id" , "Model"  FROM public."Data1" WHERE "Model"='911' Or "Model" ='Taycan' OR "Model" = 'Corvette';


select "id", "Model" , " Doors", "Make" from public."Data1" where "id" between 3 and 8;

select "Model", sum("price") from public."Data1" group by "Model";

select max(" Passengers") from public."Data1";

select "Model", sum("price") from public."Data1" group by "Model" Having sum("price") > 100000;


Select "Kilometres" , "Model" from public."Data1" order by "Kilometres"  , "Model" desc;/* la resultat est fause puisquele champ est varchar il faut avoir une
autre solution de traitement*/


select * from public."Data1" limit 5 offset 3;


SELECT "sex", "age" , "charges" , CASE
 WHEN "age" < 20 THEN "charges" 
 WHEN "age" <30 THEN "charges" *2
 WHEN "age" < 40 THEN "charges" *3
 WHEN "age" < 50 THEN "charges" *4
 ELSE "charges" *5
 END
 FROM public."couples";


Insert into public."couples" ("age", "sex", "bmi" , "children", "smoker" , "region", "charges") 
Values  ('55' ,'femme' , '20' , '3', 'no', 'northwest', 19444),
				 ('3' ,'male' , '28' , '7', 'yes', 'northwest', 196);

select * from public."couples" order by "age" desc;

update public."couples"  set 
"bmi" ='80', 
"children"='15', 
"smoker"='yes' , "region" = 'tunis', 
"charges" ='8888888'
where "age" = 64 and "sex" ='male';

select * from public."couples" order by "age" desc;


select * from public."Test" where "ville" LIKE 'tunis';

delete from public."couples" where "bmi" =80;

truncate table public."vgsales";


create database "informatique";

DROP DATABASE  "informatique";

create table anime1( id INT  NOT NULL , nom  varchar(2) not null);

select* from public."anime1";

insert into public."couples"
 ("age", "sex", "bmi" , "children", "smoker" , "region", "charges") 
values ('80', 'male',200,3, default, default ,222222222222);


drop table "anime1";


alter table public."Test" add "pays" varchar(20);



alter table public."Test" alter column "pays"  type char(2);


alter table public."Test" drop  "pays";

alter table public."Test" rename column "pays" to "pay";

select *from public."Test";




alter table public."Test" add  "id_manage" numeric;
select * from public."Test" order by "id" asc;
insert into public."Test" ("nom", "ville",  "prix", "pay", "id" , "id_manage"     ) values ('Sousou', 'roma' ,'8522158' , 'italie' ,6 ,6),
('Toutou', 'canada' ,'8522158' , 'canada'   ,2,6     ),('wouwowu', 'roma' ,'8522158' , 'italie'    ,5,7     );







explain select * from public."Test" inner join public."Data1" on  public."Test".id= public."Data1".id; /*la commande expain avan select
permet de voir le systeme marche en arrier plan*/


select * from public."Data1" left outer join public."Test" on public."Test".id= public."Data1".id where public."Test".id is null ;


select * from public."Test" right outer join public."Data1" on public."Test".id= public."Data1".id  where public."Data1".id is null;


explain select * from public."Test"  full outer join public."Data1" on public."Test".id= public."Data1".id ;



select * from public."Test" as t1 inner join public."Test" t2 on t1.id=t2.id_manage;


select * from public."Test"  natural join public."Data1" ;


select * from public."Test" where exists ( 
SELECT id, "Model", "Year"
 FROM public."Data1"
 WHERE "Model"='MDX'
);



CREATE INDEX "Name" ON public."Test" ("nom"); --create index



select "id" , "nom" , COALESCE("id_manage",0) from public."Test";


update public."Test" set  "id_manage"=0 where id is null;

select * from public."Test";

update public."Test" set "nom" = replace ("nom",'Sami','ines') where "nom" like '%Sami%';


alter table public."couples" add id numeric;


 update public."Test" set id= 20 where "nom"='Ali';
 
 select * from public."Data1"
inner join public."couples" on public."Data1".id=public."couples".id
inner join public."Test" on public."couples".id= public."Test".id;

select "Model"," Fuel Type", sum("price") as somme from public."Data1" group by "Model"," Fuel Type" order by "Model"," Fuel Type" ;

select "Model"," Fuel Type", sum("price") , grouping("Model"," Fuel Type") from public."Data1"
group by cube (" Fuel Type","Model") order by "Model"," Fuel Type" ;

select "Model"," Fuel Type", sum("price") as somme  from public."Data1" group by rollup ("Model"," Fuel Type")  
order by "Model"," Fuel Type" ;



select * from public."couples" where "children"= (select max("children") from public."couples");  ----- SUb_Query



 select  * from public."Data1"
 join public."couples" on public."Data1".id=public."couples".id    --- join = inner join



CREATE TABLE public."utilisateur9" (
"id"  serial PRIMARY KEY,                -- auto_increment de la clé primaire
"nom" VARCHAR(50),
"email" VARCHAR(50),
"date_inscription" DATE
);


create index IX_Model on public."Data1"("Model"); --creation d'un index

explain analyze select "Model" from public."Data1" where "Model"='TL'; 

 Drop index IX_Model;   --supprimer l'index


SELECT *  INTO  public."Data_copie" --copier le contenue d'une table et créer une autre table qui contient les données copier.
FROM  public."Data1"
where "Year"= 2021;




insert into public."Data_copie"("id","Year","Model"," City") --copier le contenue d'une table a une autre table 
																--deja existante et a les même types des données
select "id","Year","Model"," City" from public."Data1"
Where "Year"=2005;



select "Year" ,"Model", SUBStr("Model",3), --commencer a partir de 3eme caractère
SUBSTRING("Model", 1,2)                    --commencer a partir de 1er caractère et finir au 2eme caratère
 from public."Data1" where "Year"=2005;



select "Model" , left("Model",2) from public."Data1";    -- 2 permiers caractères

select "Model" , right("Model",2) from public."Data1";   -- 2 deniers caractères


select "Model" , reverse("Model") from public."Data1"; --inverse de la chaine



select "CITE"  from public."Delegation1";
select "CITE", trim("CITE") from public."Delegation1"; -- enlever les espaces
select "CITE", trim(BOTH 'E' from "CITE") from public."Delegation1"; --supprimer la lettre E de premier et dernier caractère

update public."Delegation1" set
"CITE"=trim("CITE"); --modifier la colonne CITE enlever les espaces au debut et a la fin

select "CITE", trim("CITE",'S') from public."Delegation1"; -- enlever la lettre S au debut

select "CITE", Ltrim("CITE",'S') from public."Delegation1"; -- enlever la lettre S au debut

select "CITE", Rtrim("CITE",'S') from public."Delegation1"; -- enlever la lettre S  la fin



select upper("nom") from public."Test";         ---majuscule   

select * from public."Test" where upper("nom")= 'ALI';



select lower("nom") from public."Test";

select * from public."Test" where lower("nom")= 'ali';



select coalesce("prix",0) from public."Test";--mettre les nulles en 0





--Les fonctions du temps

SELECT DATE_FORMAT('2018-09-24 22:21:20', "%d/%m/%Y");

SELECT DATEDIFF('2014-01-09', '2014-01-01');
SELECT (DATE '2001-02-16', DATE '2001-12-21')


SELECT EXTRACT(MONTH FROM TIMESTAMP '2001-02-16 20:38:40'); --retourner le mois

select date '2001-09-28' + integer '7'; --ajouter 7 jours

select age(timestamp '2023-05-31', timestamp '1997-08-09'); --la difference entre les deux dates


select 	age(timestamp '1957-06-13'); --la difference entre la date indiqué et la date currante(now())


alter table public."couples" add id_id serial primary key; --ajouter uen colonne de clé primaire

alter table public."couples" alter column id type character varying(20); -- modifier le type d'une colonne
 



CREATE TABLE MaTableComposite ( -- un clé primaire composite
    id INT, autre_id INT , PRIMARY KEY (id, autre_id)
);



CREATE TABLE Clients (
    id INT PRIMARY KEY,
    nom VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Commandes (
    numero_commande INT PRIMARY KEY,
    id_client INT,
    CONSTRAINT fk_id_client FOREIGN KEY (id_client) REFERENCES Clients(id)
);


ALTER TABLE Commandes
ADD CONSTRAINT fk_id_client FOREIGN KEY (id_client) REFERENCES Clients(id); -- si la colonnes id_client deja existe dans la table 
                                                                            -- mais pas identifier comme clé étranger


select NOW();

SELECT DATE( NOW() );

SELECT CAST(NOW() AS DATE);


SELECT TIMESTAMP("2018-09-15");




select "id", "Year",cast(" Passengers" as integer ) from public."Data1"; -- en post resql


select "id", "Year",cast(" Passengers" as SIGNED INTEGER ) from public."Data1"; --en autres SGBD



SELECT VERSION();-- version de sql














