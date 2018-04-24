CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT a.name as name, b.size as size
    from dogs as a, sizes as b 
    where a.height > b.min and a.height <= b.max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_height AS
  SELECT child
    from parents, dogs
    where parent = name
    order by -height;

-- Sentences about siblings that are the same size

CREATE TABLE sentences AS
  WITH
    siblings(first, second, first_size, second_size) as (
      SELECT a.child, b.child, c.size, d.size
        from parents as a, parents as b, size_of_dogs as c, size_of_dogs as d
        where a.parent = b.parent and a.child < b.child and a.child = c.name and b.child = d.name)
  SELECT first || " and " || second || " are " || first_size || " siblings"
    from siblings
    where first_size = second_size;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks AS
  SELECT a.name || ", " || b.name || ", " || c.name || ", " || d.name,
    a.height + b.height + c.height + d.height
    from dogs as a, dogs as b, dogs as c, dogs as d
    where a.height + b.height + c.height + d.height > 170
      and a.height < b.height
      and b.height < c.height
      and c.height < d.height
    order by a.height + b.height + c.height + d.height;
