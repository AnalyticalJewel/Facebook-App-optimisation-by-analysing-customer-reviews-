SELECT * FROM facbook.facebookp;
UPDATE facebookp
SET Good_review = CASE 
    WHEN Good_review IN ('true', 'yes', '1') THEN 1
    ELSE 0
END;
UPDATE facebookp
SET Bad_review = CASE 
    WHEN Bad_review IN ('true', 'yes', '1') THEN 1
    ELSE 0
END;

/* Query for overall sentamental analysis*/
SELECT 
    sum(Good_review) AS GoodReviews,
    sum(Bad_review) AS BadReviews
FROM facebookp;

/* Query to do version performance analysis */
SELECT 
    AppVersion,
    sum(Good_review) AS GoodReviews,
    sum(Bad_review) AS BadReviews,
    SUM(ThumbsUpCount) AS TotalThumbsUp
FROM facebookp
GROUP BY AppVersion
ORDER BY GoodReviews desc
Limit 10;

