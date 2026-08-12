ALTER TABLE terms
    ALTER COLUMN language_code SET DEFAULT 'und',
    ALTER COLUMN language_code SET NOT NULL;