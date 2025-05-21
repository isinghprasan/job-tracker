-- name: InsertApplication :one
INSERT INTO applications (
  user_id, company_name, job_title, job_url,
  applied_at, status, email_thread_id,
  notes, tags, resume_version, status_history
)
VALUES (
  $1, $2, $3, $4,
  $5, $6, $7,
  $8, $9, $10, $11
)
RETURNING *;

-- name: GetApplicationByID :one
SELECT * FROM applications
WHERE id = $1;

-- name: GetApplicationsByUser :many
SELECT * FROM applications
WHERE user_id = $1
ORDER BY applied_at DESC;

-- name: UpdateApplicationStatus :exec
UPDATE applications
SET status = $2,
    updated_at = NOW()
WHERE id = $1;

-- name: UpdateApplicationThreadID :exec
UPDATE applications
SET email_thread_id = $2,
    updated_at = NOW()
WHERE id = $1;

-- name: DeleteApplication :exec
DELETE FROM applications
WHERE id = $1;
