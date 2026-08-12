CREATE TABLE course_contents (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    course_id UUID NOT NULL,

    content_code VARCHAR(50),
    title VARCHAR(255) NOT NULL,
    sequence_no INTEGER,
    description TEXT,

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_course_contents_course
        FOREIGN KEY (course_id)
        REFERENCES courses(id)
        ON DELETE RESTRICT,

    CONSTRAINT uq_course_contents_course_code
        UNIQUE (course_id, content_code),

    CONSTRAINT chk_course_contents_sequence_no
        CHECK (sequence_no IS NULL OR sequence_no > 0)
);