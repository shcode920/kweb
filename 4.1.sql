CREATE TABLE students (
    name VARCHAR(20) NOT NULL,
    entry_yr INT NOT NULL,
    major_id INT NOT NULL,
    student_id INT NOT NULL,
    phone_num INT NOT NULL,
    address VARCHAR(30) NOT NULL,
    agg_points INT NOT NULL DEFAULT 0,
    avg_score DOUBLE NOT NULL DEFAULT 0.0,
    attending TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
