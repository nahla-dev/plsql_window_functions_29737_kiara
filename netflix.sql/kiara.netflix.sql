REATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    country VARCHAR(50),
    subscription_plan VARCHAR(20)
);

CREATE TABLE Content (
    content_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    release_year INT
);

CREATE TABLE Views (
    view_id INT PRIMARY KEY,
    user_id INT,
    content_id INT,
    view_date DATE,
    minutes_watched INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (content_id) REFERENCES Content(content_id)


);

       value inserted


INSERT INTO Users (user_id, user_name, country, subscription_plan) VALUES (1, &#39;Alice&#39;, &#39;USA&#39;, &#39;Premium&#39;);
INSERT INTO Users(user_id, user_name, country, subscription_plan) VALUES (2, &#39;Bob&#39;, &#39;USA&#39;, &#39;Standard&#39;);
INSERT INTO Users(user_id, user_name, country, subscription_plan) VALUES (3, &#39;David&#39;, &#39;UK&#39;, &#39;Premium&#39;);
INSERT INTO Users (user_id, user_name, country, subscription_plan)VALUES (4, &#39;Charlie&#39;, &#39;UK&#39;, &#39;Basic&#39;); 

INSERT INTO Content (content_id, title, genre, release_year) VALUES (101, &#39;Stranger Things&#39;, &#39;Sci-Fi&#39;, 2022);
INSERT INTO Content (content_id, title, genre, release_year)VALUES (102, &#39;The Crown&#39;, &#39;Drama&#39;, 2023);
INSERT INTO Content(content_id, title, genre, release_year) VALUES (103, &#39;Squid Game&#39;, &#39;Thriller&#39;, 2021);
INSERT INTO Content(content_id, title, genre, release_year) VALUES (104, &#39;Wednesday&#39;, &#39;Comedy&#39;, 2022);
INSERT INTO Content (content_id, title, genre, release_year)VALUES (105, &#39;The Silent Sea&#39;, &#39;Sci-Fi&#39;, 2021);


INSERT INTO Views(view_id, user_id, content_id, view_date, minutes_watched) VALUES (501, 1, 101, DATE&#39;2026-01-05&#39;, 45);
INSERT INTO Views(view_id, user_id, content_id, view_date, minutes_watched) VALUES (502, 1, 103,DATE &#39;2026-01-06&#39;, 60);
INSERT INTO Views (view_id, user_id, content_id, view_date, minutes_watched)VALUES (503, 2, 101,DATE &#39;2026-01-10&#39;, 30);
INSERT INTO Views(view_id, user_id, content_id, view_date, minutes_watched) VALUES (504, 3, 102, DATE&#39;2026-01-15&#39;, 55);
INSERT INTO Views(view_id, user_id, content_id, view_date, minutes_watched) VALUES (505, 1, 104, DATE&#39;2026-02-01&#39;, 50);
INSERT INTO Views(view_id, user_id, content_id, view_date, minutes_watched) VALUES (506, 2, 104, DATE&#39;2026-02-02&#39;, 40);

         JOINS

       RIGHT JOIN

SELECT c.title, v.view_id
FROM Views v
RIGHT JOIN Content c ON v.content_id = c.content_id
WHERE v.view_id IS NULL;
    INNER JOIN

SELECT 
    u.user_name, 
    u.subscription_plan, 
    c.title AS movie_title, 
    c.genre, 
    v.view_date, 
    v.minutes_watched
FROM Users u
INNER JOIN Views v ON u.user_id = v.user_id
INNER JOIN Content c ON v.content_id = c.content_id
ORDER BY v.view_date DESC;

    FULL JOIN
SELECT u.user_name, c.title
FROM Users u
FULL OUTER JOIN Views v ON u.user_id = v.user_id
FULL OUTER JOIN Content c ON v.content_id = c.content_id;

    LEFT JOIN


SELECT u.user_name, v.view_id
FROM Users u
LEFT JOIN Views v ON u.user_id = v.user_id
WHERE v.view_id IS NULL;

    SELF JOIN


SELECT a.user_name AS User_1, b.user_name AS User_2, a.country
FROM Users a
JOIN Users b ON a.country = b.country AND a.user_id &lt; b.user_id;


          SUM()

SELECT 
    view_date, 
    minutes_watched,
    
    SUM(minutes_watched) OVER (ORDER BY view_date ) as running_total_rows,
    SUM(minutes_watched) OVER (ORDER BY view_date ) as running_total_range
FROM Views;


       LAG()

SELECT 
    user_id, 
    view_date, 
    minutes_watched,
    LAG(minutes_watched) OVER (PARTITION BY user_id ORDER BY view_date) as prev_session_minutes,
    minutes_watched - LAG(minutes_watched) OVER (PARTITION BY user_id ORDER BY view_date) as engagement_diff
FROM Views;

     NTILE()

SELECT 
    user_id, 
    SUM(minutes_watched) as total_time,
    NTILE(4) OVER (ORDER BY SUM(minutes_watched) DESC) as user_tier
FROM Views
GROUP BY user_id;

      SUM()LANK()

SELECT 
    c.title, 
    SUM(v.minutes_watched) as total_minutes,
    RANK() OVER (ORDER BY SUM(v.minutes_watched) DESC) as popularity_rank
FROM Content c
JOIN Views v ON c.content_id = v.content_id