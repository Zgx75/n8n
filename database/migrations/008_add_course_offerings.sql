BEGIN;

-- =========================================================
-- 1. 建立每學期實際開課資料
-- =========================================================

CREATE TABLE course_offerings (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    course_id UUID NOT NULL,

    academic_year SMALLINT NOT NULL,
    semester VARCHAR(20) NOT NULL,

    section_no SMALLINT NOT NULL DEFAULT 1,

    offering_name VARCHAR(200) NOT NULL,
    instructor_name VARCHAR(100),

    language_code VARCHAR(20) NOT NULL DEFAULT 'zh-TW',

    description TEXT,

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_course_offerings_course
        FOREIGN KEY (course_id)
        REFERENCES courses(id)
        ON DELETE RESTRICT,

    CONSTRAINT chk_course_offerings_academic_year
        CHECK (academic_year > 0),

    CONSTRAINT chk_course_offerings_section_no
        CHECK (section_no > 0),

    CONSTRAINT uq_course_offerings
        UNIQUE (
            course_id,
            academic_year,
            semester,
            section_no
        )
);


-- =========================================================
-- 2. courses 只保留相對穩定的課程基本資料
-- =========================================================

ALTER TABLE courses
    DROP COLUMN instructor_name;

ALTER TABLE courses
    DROP COLUMN language_code;


-- =========================================================
-- 3. course_contents 改成屬於某一次實際開課
-- =========================================================

ALTER TABLE course_contents
    DROP CONSTRAINT fk_course_contents_course;

ALTER TABLE course_contents
    DROP CONSTRAINT uq_course_contents_course_code;

ALTER TABLE course_contents
    RENAME COLUMN course_id TO course_offering_id;


ALTER TABLE course_contents
    ADD CONSTRAINT fk_course_contents_offering
        FOREIGN KEY (course_offering_id)
        REFERENCES course_offerings(id)
        ON DELETE RESTRICT;


ALTER TABLE course_contents
    ADD CONSTRAINT uq_course_contents_offering_code
        UNIQUE (course_offering_id, content_code);

COMMIT;