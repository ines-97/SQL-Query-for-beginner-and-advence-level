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
