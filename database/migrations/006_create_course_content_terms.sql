CREATE TABLE course_content_terms (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    course_content_id UUID NOT NULL,
    term_id UUID NOT NULL,

    importance VARCHAR(20),

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_course_content_terms_content
        FOREIGN KEY (course_content_id)
        REFERENCES course_contents(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_course_content_terms_term
        FOREIGN KEY (term_id)
        REFERENCES terms(id)
        ON DELETE CASCADE,

    CONSTRAINT uq_course_content_terms
        UNIQUE (course_content_id, term_id),

    CONSTRAINT chk_course_content_terms_importance
        CHECK (
            importance IS NULL
            OR importance IN ('LOW', 'MEDIUM', 'HIGH')
        )
);