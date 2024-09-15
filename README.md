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
