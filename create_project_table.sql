CREATE TABLE projects (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,                                                     
  project_name TEXT,                                                          
  session_date TEXT,                                                          
  gdrive_path TEXT 
);

ALTER TABLE projects {
 ADD CONSTRAINT unique_project_session UNIQUE (project_name, session_date);
};
