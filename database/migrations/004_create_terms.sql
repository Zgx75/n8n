CREATE TABLE terms (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    canonical_term VARCHAR(255) NOT NULL,
    term_type VARCHAR(50),
    definition TEXT,
    language_code VARCHAR(20),

    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT uq_terms_canonical_language
        UNIQUE (canonical_term, language_code)
);