WITH target_content AS (
    SELECT
        cc.id AS course_content_id
    FROM course_contents cc
    JOIN course_offerings co
        ON cc.course_offering_id = co.id
    JOIN courses c
        ON co.course_id = c.id
    JOIN departments d
        ON c.department_id = d.id
    JOIN institutions i
        ON d.institution_id = i.id
    WHERE
        i.code = 'NCCU'
        AND d.code = 'MIS'
        AND c.name = '企業資料通訊'
        AND co.academic_year = 114
        AND co.semester = '1'
        AND co.section_no = 1
        AND cc.content_code = 'CH03_04'
),
term_list (
    canonical_term,
    importance
) AS (
    VALUES
        ('Go-Back-N', 'HIGH'),
        ('Stop-and-Wait', 'MEDIUM'),
        ('Pipelining', 'MEDIUM'),
        ('Sender Window', 'HIGH'),
        ('SendBase', 'HIGH'),
        ('NextSeqNum', 'HIGH'),
        ('ACK', 'HIGH'),
        ('Duplicate ACK', 'HIGH'),
        ('Cumulative ACK', 'HIGH'),
        ('Timeout', 'HIGH'),
        ('Retransmission', 'HIGH'),
        ('ExpectedSeqNum', 'HIGH')
)

INSERT INTO course_content_terms (
    course_content_id,
    term_id,
    importance
)
SELECT
    tc.course_content_id,
    t.id,
    tl.importance
FROM target_content tc
CROSS JOIN term_list tl
JOIN terms t
    ON t.canonical_term = tl.canonical_term
    AND t.term_language_code = 'en'

ON CONFLICT (course_content_id, term_id)
DO UPDATE SET
    importance = EXCLUDED.importance;