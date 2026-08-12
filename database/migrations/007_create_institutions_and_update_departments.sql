-- =========================================================
-- Create institutions table
-- =========================================================

CREATE TABLE institutions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    name VARCHAR(200) NOT NULL,
    short_name VARCHAR(100),
    code VARCHAR(50),

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_institutions_name
        UNIQUE (name),

    CONSTRAINT uq_institutions_code
        UNIQUE (code)
);


-- =========================================================
-- Link departments to institutions
-- =========================================================

ALTER TABLE departments
    ADD COLUMN institution_id UUID NOT NULL;


ALTER TABLE departments
    ADD CONSTRAINT fk_departments_institution
        FOREIGN KEY (institution_id)
        REFERENCES institutions(id)
        ON DELETE RESTRICT;


-- =========================================================
-- Department code should only be unique inside one school
-- =========================================================

ALTER TABLE departments
    DROP CONSTRAINT departments_code_key;


ALTER TABLE departments
    ADD CONSTRAINT uq_departments_institution_code
        UNIQUE (institution_id, code);


ALTER TABLE departments
    ADD CONSTRAINT uq_departments_institution_name
        UNIQUE (institution_id, name);