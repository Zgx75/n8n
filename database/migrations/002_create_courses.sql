CREATE TABLE courses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    department_id UUID NOT NULL,
    course_code VARCHAR(50),
    name VARCHAR(200) NOT NULL,
    instructor_name VARCHAR(100),
    language_code VARCHAR(20) NOT NULL DEFAULT 'zh-TW',
    description TEXT,

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_courses_department
        FOREIGN KEY (department_id)
        REFERENCES departments(id)
        ON DELETE RESTRICT,

    CONSTRAINT uq_courses_department_code
        UNIQUE (department_id, course_code)
);