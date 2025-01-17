ALTER TABLE projects 
ADD CONSTRAINT unique_project_session UNIQUE (project_name, session_date);
