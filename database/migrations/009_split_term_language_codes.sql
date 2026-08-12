BEGIN;

ALTER TABLE terms
    RENAME COLUMN language_code TO term_language_code;

ALTER TABLE terms
    ADD COLUMN definition_language_code VARCHAR(20);

UPDATE terms
SET definition_language_code = 'zh-TW'
WHERE definition IS NOT NULL;

ALTER TABLE terms
    ALTER COLUMN definition_language_code SET DEFAULT 'zh-TW';

COMMIT;