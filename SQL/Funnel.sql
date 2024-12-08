
WITH
visitors_info as
	(
		SELECT
			s.visitor_id,
            v.user_id,
            v.first_visit_date,
            IFNULL(REPLACE(s.utm_source, ',', ';'), "Organic") as channel,
            i.date_registered,
            MIN(p.date_purchased) as first_purchase_date,
            i.first_watch_date
        FROM
			front_visitors AS v
            INNER JOIN
            front_sessions AS s ON v.visitor_id = s.visitor_id
            LEFT JOIN
            student_info AS i ON v.user_id = i.user_id
            LEFT JOIN
            student_purchases AS p ON v.user_id = p.user_id
		WHERE
			v.first_visit_date >= '2022-07-01'
            AND (v.first_visit_date < i.date_registered OR i.date_registered IS NULL)
		GROUP BY
			s.visitor_id
    ),
count_total as
	(
		SELECT
			COUNT(*) as count_visitors,
            first_visit_date,
            channel
		FROM visitors_info
        GROUP BY first_visit_date, channel
    ),
count_free as
	(
		SELECT
			COUNT(*) as count_free,
            first_visit_date,
            channel
		FROM visitors_info
        WHERE
			date_registered IS NOT NULL
            AND
            (first_purchase_date IS NULL
            OR TIMESTAMPDIFF(minute, date_registered, first_purchase_date) > 30)
        GROUP BY first_visit_date, channel
    ),
count_watched as
	(
		SELECT
			COUNT(*) as count_watched,
            first_visit_date,
            channel
		FROM visitors_info
        WHERE
			first_watch_date IS NOT NULL
            AND
            (first_purchase_date IS NULL OR first_watch_date < first_purchase_date)
        GROUP BY first_visit_date, channel
    ),
count_paid as
	(
		SELECT
			COUNT(*) as count_paid,
            first_visit_date,
            channel
		FROM visitors_info
        WHERE first_purchase_date IS NOT NULL
        GROUP BY first_visit_date, channel
    )
SELECT
	t.first_visit_date,
    t.channel,
    t.count_visitors,
    IFNULL(f.count_free, 0) as count_free,
    IFNULL(w.count_watched, 0) as count_watched,
    IFNULL(p.count_paid, 0) as count_paid
FROM
	count_total as t
    LEFT JOIN
    count_free as f ON t.first_visit_date = f.first_visit_date AND t.channel = f.channel
    LEFT JOIN
    count_watched as w ON t.first_visit_date = w.first_visit_date AND t.channel = w.channel
    LEFT JOIN
    count_paid as p ON t.first_visit_date = p.first_visit_date AND t.channel = p.channel
ORDER BY first_visit_date, count_visitors DESC;    
    