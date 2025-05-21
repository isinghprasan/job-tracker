CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE applications (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    company_name TEXT NOT NULL,
    job_title TEXT NOT NULL,
    job_url TEXT,
    applied_at TIMESTAMPTZ,
    status TEXT NOT NULL DEFAULT 'APPLIED',
    email_thread_id TEXT,
    notes TEXT,
    tags TEXT[],
    resume_version TEXT,
    status_history JSONB,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_applications_user_id ON applications(user_id);
