# SQL-Query
Ce fichier contient les requêtes SQL les plus courantes de différents niveaux, débutant et avancé, ce qui facilite le processus d'apprentissage du SQL.
# 1.Définition

**Le SQL**(Structured Query Language) permet de communiquer avec une base de données.

- elle permet de définir, manipuler(exploiter) et protéger les données.

Ce langage informatique est notamment très utilisé par les développeurs web pour communiquer avec les données d’un site web. 

- les principales commandes sont pour lire, insérer, modifier et supprimer des données dans une base.

**SGBD** (système de gestion de base de données ):sont des programmes informatiques qui permettent aux utilisateurs **d'interagir** avec une base de données. Pour cela, le SGBD doit avoir un modèle qui définit la manière dont les données sont organisées. Le modèle relationnel est une approche d’organisation des données très populaire.

**Une requête**  est **une interrogation** d’une base de données. elle peut comporter un nombre des critère pour préciser la demande, il existe plusieurs langages de requêtes qui sont spécifier a la structure de la base de données.

**Les acteurs de SQl sont les les base de données BD2, MySQL,Oracle,SQL Server. . .**

- Modèle de données **simple,** **facile à mettre en œuvre et à gérer**.
    
    
- **Faible redondance des données**
- **Cohérence élevée des données: données homogène et garantir l’intégrité des données**(données sont fiables en totale, corrects ,et du bon qualité)
- **flexible** et fonctionne efficacement même avec **de très grandes quantités de données**.
- **Langage de requête uniforme:**SQL

- - **Explain analyze**
    
    > Explain analyze+ requête : explique comment la requête sa marche
    > 
    - MySQL : EXPLAIN
    - PostgreSQL : EXPLAIN
    - Oracle : EXPLAIN PLAN
    - SQLite : EXPLAIN QUERY PLAN
    
    Syntaxe: 
    
    **EXPLAIN analyze SELECT *
    FROM `user`
    ORDER BY `id` DESC**


    # 2. Base de données

- **La requête  Create DataBase**
    
    Create Database ****: permet de créer une base de données
    
    le syntaxe:
    
    **Create Database non_base;**
    
    ```sql
    create database "informatique";
    ```
    
    - Si on n’est sur que la base existe ou pas on fait un test d’existance
    
    **CREATE DATABASE IF NOT EXISTS ma_base**
    
    Mais elle n’est pas fonctionnel en PostgreSQL.

  Create Database ****: supprime une base de données

le syntaxe:

**Drop Database non_base;**

```sql
DROP DATABASE  "informatique";
```

- Si on n’est sur que la base existe ou pas on fait un test d’existance

**Drop DATABASE IF EXISTS ma_base**

Mais elle n’est pas fonctionnel en PostgreSQL.

- **Retourner une BD si elle était effacer**
    
    **Back up** : et la commande pour retourner la base de données
    
    ```sql
    **BACKUP DATABASE** testDB
    **TO DISK =** 'D:\backups\testDB.bak';
    ```
    
- **La normalisation des bases de données**
    
    ***Sources:*** [(180) Database Normalization 1NF 2NF 3NF - YouTube](https://www.youtube.com/watch?v=SK4H5tTT6-M)
    
    **→ 1er forme de la normalisation**
    
    - les données sont uniques.
    - une seule valeur dans la colonne
        - Exemple: table 1: id: clé primaire
        - nom + prénom : non listes dans les colonnes et on peut deviser dans 2 colonnes.
        - colonne de job
        - pas de redondance.
    
    **→ 2eme forme de la normalisation**
    
    - les données sont liées a la clé primaire et ne présentent que le clé primaire.
        - Exemple: la colonne job n’est liée à la clé primaire. donc on enlève la colonne job et créer une table job et la lier
        
        table 1 avec le clé étrange.
        
    
    **→ 3eme forme de la normalisation**
    
    - le clé primaire est liée seulement aux colonnes.
        - id  présente le nom et le prénom et le clé étranger de job.
    
     ****



  # 3. Les tables

- **La requête  Create Table**
    
    Create table ****: créer une table dans une base de données
    
    le syntaxe:
    
    **Creat Table non_base**
    
    **( “colonne” type,**
    
    **“colonne” type);**
    
    ```sql
    create table anime1( id INT PRIMARY KEY NOT NULL , nom  numeric);
    ```
    
    - **NOT NULL** : empêche d’enregistrer une valeur nulle pour une colonne.
    - **PRIMARY KEY** : indiquer si cette colonne est considérée comme clé primaire pour un index.
- **La requête  Alter Table**
    
    **Alter table** : ajouter, modifier , supprimer la colonne une table
    
    le syntaxe:
    
    **Ajouter une colonne**
    
    **Alter Table non_base ADD colonne1 type;**
    
    ```sql
    alter table public."Test" add "pays" varchar(20); /*la resultat de la colonne ajouter est par defaut null;*/
    ```
    
    **Modifier le type d’une colonne**    2 requêtes sont corrects
    
    **Alter table non_table ALTER COLUMN nom_colonne TYPE type;** /*PostergreSQL*
    
    **Alter table nom_table  Modify  nom_colonne   type;** /*Mysql*
    
    ```sql
    alter table public."Test" alter column "pays"  type char(2); /* changer le type de varchar (20) a char (2)*/
    ```
    
    **Supprimer une colonne** 2 requêtes sont corrects
    
    **Alter table nom_table   Drop COLUMN nom_colonne;**   
    
    **Alter table nom_table  Drop nom_colonne;**
    
    ```sql
    alter table public."Test" drop  "pays";
    alter table public."Test" drop column "pays"; /* les requêtes sa marchent
    ```
    
    **Renommer la colonne**
    
    **Alter table nom_table    Rename COLUMN ancien_colonne   TO    nouvelle_colonne ;** /*postgresql*/
    
    **Alter table nom_table   change   ancien_colonne      nouvelle_colonne    type ;** /*Mysql*/
    
    ```sql
    alter table public."Test" rename column "pays" to "pay1";
    ```
    
- **La requête  TRUNCATE TABLE**
    
    **Truncate table** : permet de vider la table sans la supprimer en gardant la structure de la table.
    
    le syntaxe:
    
    **Truncate table ‘non_table’**
    
    vider la table Data
    
    ```sql
    Truncate table public."Data1";
    ```
    
- **La requête  Drop Table**
    
    Create Database ****: supprime la table
    
    le syntaxe:
    
    **Drop table non_base;**
    
    ```sql
    DROP table  "anime";
    ```
    
- **Les schema**
    
    1.creation du schema
    
    ```sql
    CREATE SCHEMA "VENTE_ODS";
    ```
    
    2.utiliser le schema 
    
    ```sql
    SET SEARCH_PATH = "VENTE_ODS";
    ```
    
    3.suppression du schema

    ```sql
    DROP SCHEMA  "VENTE_ODS";
    ```





# 4. Les clés

- **La requête Clé primaire/Serial**
    
    ### 1. **clé primaire normale**
    
    **Serial**= Auto_increment
    
    - Auto_increment n’existe pas en Postgresql
    
    sytaxe :
    
    **Create table(  `ID  SERIAL PRIMARY KEY`****, ..**
    
    ```sql
    CREATE TABLE public."utilisateur" (
    "id"  int PRIMARY KEY unique NOt Null,
    "nom" VARCHAR(50),
    "email" VARCHAR(50),
    "date_inscription" DATE
    );
    ```
    
    ```sql
    CREATE TABLE public."utilisateur" (
    "id"  int ,
    "nom" VARCHAR(50),
    "email" VARCHAR(50),
    "date_inscription" DATE
    constraint pk_primarykey primary key (id) 
    	  )
    );
    ```
    
    ### 2. Ajouter la colonne de clé primaire après la création de la table
    
    ```sql
    alter table public."utilisateur" add id_id int serial primary key; --ajouter uen colonne de clé primaire
    ```
    
    ### 3. clé primaire composite
    
    ```sql
    CREATE TABLE MaTableComposite ( 
        "id" INT , "autre_id" INT , PRIMARY KEY ("id", "autre_id")       -- un clé primaire composite
    );
    ```
    
- **La requête Clé étrangère**
    
    ### 1. **clé étrangère normale**
    
    sytaxe :
    
    ```sql
    --Création de la table "Departements"
    CREATE TABLE Departements (
    **id_departement INT PRIMARY KEY,**  --clé  primaire
    nom_departement VARCHAR(50)
    );
    ```
    
    ```sql
    --Création de la table "Employes"
    CREATE TABLE Employes (
    id_employe INT PRIMARY KEY,
    nom VARCHAR(50),
    **id_departement INT,** -- Colonne pour créer la clé étrangère
    **CONSTRAINT fk_id_departement FOREIGN KEY (id_departement) REFERENCES Departements(id_departement) -- la clé etrangère**
    );
    ```
    
    ### 2. Ajouter la colonne de **clé étrangère** après la création de la table
    
    ```sql
    -- Ajout d'une clé étrangère à la table "Employes"
    ALTER TABLE Employes ADD 
    C**ONSTRAINT fk_id_departement FOREIGN KEY (id_departement) REFERENCES Departements(id_departement); -- même syntaxe que la clé étrangère normale**
    ```
    
    ### 3. **clé étrangère** composite
    
    ```sql
    CREATE TABLE Commandes (
        numero_commande INT PRIMARY KEY,
        id_client INT,
        -- Clé étrangère composite
        **CONSTRAINT fk_commande_client FOREIGN KEY (id_client, numero_commande) REFERENCES Clients(id_client, numero_commande) -- la clé etrangère composite**
    );
    ```



    # 5. Les fonctions

- **Opérateurs de comparaisons**
    
    On peut utiliser plusieurs operateurs comme:
    
    - **=** → égale
    
    ```sql
    SELECT * FROM public."Data1"  WHERE "id" **=** 20
    ```
    
    - **<>** → pas égale
    
    ```sql
    SELECT * FROM public."Data1"  WHERE "id" **<>** 20
    ```
    
    - **!=** → pas égale
    
    ```sql
    SELECT * FROM public."Data1"  WHERE "id" **!=** 20
    ```
    
    - **Is** **Not Null** → champ n’est pas nulle
    
    ```sql
    SELECT * FROM public."Data1"  WHERE "Model" **is not null**;
    ```
    
    - **IS Null** → champ est nulle
    
    ```sql
    SELECT * FROM public."Data1"  WHERE "Body Type" **is null**;
    ```
    
    - **>**  ou  **<** → supérieur à   ou    inférieur à
    - **>=**  ou  **<=** → supérieur ou égale à   ou    inférieur ou égale à
        
        ```sql
        SELECT * from public."Test" where "prix" <= '3000'
        ```
        
    - **Between / IN / And / Or / Like / ALL / Exists / NOT / AND / OR :** ce sont des operateurs de comparaison expliquer par la suite.
    - **Not** → champ n’est pas égale
    
    ```sql
    SELECT * FROM Customers
    WHERE City **NOT LIKE** 's%';
    ```
    
    - 
    
    | **+** | **Add** |
    | --- | --- |
    | - | **Subtract** |
    | * | **Multiply** |
    | / | **Divide** |
    | **%** | **Modulo** |
On peut utiliser plusieurs operateurs comme:

- **Count() →** compter le nombre des lignes
    
    sytaxe: `SELECT COUNT(*) FROM table`
    
    `SELECT COUNT(**DISTINCT** nom_colonne) FROM table`
    

```sql
select count(*) from public."Data1"
```

- **AVG()** → calculer la moyenne
    - avg est valable pour les nombres et les reéls. mais il n’existe pas pour les colonnes de type money

```sql
select  **avg**(" Passengers") from public."Data1"(" Passengers") from public."Data1"
```

- **SUM()** → faire la somme

```sql
select **sum**(" Passengers") from public."Data1"
```

- **Max** → la valeur maximal

```sql
select **max**(" Passengers") from public."Data1"
```

- **Min** → La valeur minimal

```sql
select **min**(" Passengers") from public."Data1"
```
- Rand() Dans les bases il retourne un résultat aléatoire entre 0 et 1
- syntaxe: **select RAND() →   0.33597**
- **Select RAND()*10 → 0 à 10 avec virgule**

> Si on veut retourner une resultat aléatoire on paut utiliser RAND() avec ORDER BY :
> 
> 
> ```sql
> SELECT * FROM `ville` **ORDER BY RAND()**
> ```
>

- Rand() Dans les bases il retourne un résultat aléatoire entre 0 et 1
- syntaxe: **select RAND() →   0.33597**
- **Select RAND()*10 → 0 à 10 avec virgule**

> Si on veut retourner une resultat aléatoire on paut utiliser RAND() avec ORDER BY :
> 
> 
> ```sql
> SELECT * FROM `ville` **ORDER BY RAND()**
> ```
>

- **Les fonctions ROUND()**
    - Round() retourne l’arrondir le nombre généré et retourne un entier
    - select **ROUND(9.5554) → il retourne 10**
    
    Si on veut retourner une résultat avec plusieurs chiffres après la virgule.
    
    - Syntaxe :  **select ROUND(colonne, 3) from  table**
    
    > afficher 3 chiffres après la virgule.
    > 
    > 
    > ```sql
    > select round("prix",3) from public."Test"; --  trois chiffres après la virgule :218.364
    > ```
    > 
    
    Syntaxe **select ROUND(colonne,-1) from table**
    
     1Afficher les valeurs des résultats arrondit à **la dizaine(10,20, .. ,500)**
    
    ```sql
     select round("prix",-1) from public."Test"; --  218.364 devient 220
    ```

- **Traiter plusieurs conditions.**
    - **L’operateur AND / OR**
        - **permet de traiter plusieurs conditions.**
        
        Le syntaxe de la requête est:   **Where + condition1 + Or / And + conditions2** 
        
        ```sql
        SELECT * from public."Test" where "prix" >= '3000' **and** "prix" <= '5000'
        ```
        
        ```sql
        SELECT * from public."Test" where "ville" = 'tunis' **or** "ville" like 'chine'
        ```
        
        - Pour lister 3 et 4 conditions
        
        Afficher les les villes ‘TUNIS’ Ou  ‘tunis’ et le prix doit être =>200
        
        ```sql
        SELECT * from public."Test" where "prix" >='200' /*condition1*/
         **AND**  
        ("ville" = 'TUNIS'  **OR**  "ville" like 'tunis' )/*condition combinée*/
        ```
        
        ```sql
        SELECT "id" ,"Model"," Drivetrain"," Doors" ," Transmission"   FROM public."Data1"
        WHERE ( "Model" = 'RDX' **AND** " Drivetrain"='AWD' )/*condition combinée 1 */
        **OR** 
        ( " Doors" is null **AND** " Transmission" is null)/*condition combinée 2 */
        ```
        
    - **L’operateur IN**
        - Afficher les résultats qui contiennent un des valeurs existants dans la liste.
        - **permet de traiter plusieurs conditions de la même colonne**
            
            Le syntaxe de la requête est:   **Where + colonne + IN + ( valeur1 , valeur2, valeur3 , valeur4 ..)** 
            
            - **IN** → ****liste des valeurs possibles, **dans cette requête il affiche les resultat des ville tunis et TUNIS**
            
            ```sql
            SELECT * from public."Test" where "ville" **IN** ('tunis', 'TUNIS')/* 2 posibilité*/
            ```
            
            ```sql
            SELECT "id" ,"Model"," Drivetrain"," Doors" ," Transmission"   FROM public."Data1"
            WHERE "Model" **IN** ('911','Taycan', 'Corvette','traverse','STS') /*une large liste*/
            ```
            
            - la requête **IN** est la remplaçante de la requête **OR**
                
                ```sql
                /*Avec  **IN*/**
                SELECT "id"  FROM public."Data1"
                WHERE "Model" **IN** ('911','Taycan', 'Corvette');
                
                /* Avec  **OR***/
                SELECT "id"  FROM public."Data1"
                WHERE "Model"='911' **Or** "Model" ='Taycan' **OR** "Model" = 'Corvette';
                ```
