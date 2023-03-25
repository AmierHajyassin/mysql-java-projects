use projects;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;


CREATE TABLE project(
    project_id INT AUTO_INCREMENT NOT NULL,
    project_name VARCHAR (128) NOT NULL,
    estimated_hours DECIMAL(7,2),
    actual_hours DECIMAL (7,2),
    difficulty INT,
    notes TEXT,
    PRIMARY KEY (project_id)
);


CREATE TABLE material(
    material_id INT NOT NULL,
    project_id  INT NOT NULL,  
    material_name VARCHAR(128) NOT NULL,
    num_required INT,
    cost DECIMAL(7,2),
    PRIMARY KEY (material_id),
    FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE step(
    step_id INT NOT NULL,
    project_id INT NOT NULL,
    step_text TEXT NOT NULL,
    step_order INT NOT NULL,
    PRIMARY KEY (step_id),
    FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE category(
    category_id INT NOT NULL,
    category_name VARCHAR(128) NOT NULL,
    PRIMARY KEY(category_id)
);

CREATE TABLE project_category(
    project_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY(project_id) REFERENCES project (project_id) ON DELETE CASCADE,
    FOREIGN KEY(category_id) REFERENCES category (category_id) ON DELETE CASCADE,
    UNIQUE KEY(project_id, category_id)
);


insert into project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes) values(1, 'Hang New Door', 5, 4, 4, 'The door is too old, time for a new one!');

insert into material (material_id, project_id, material_name, num_required, cost) values (1,1, 'door hinges', 2, 10);
insert into material (material_id, project_id, material_name, num_required, cost) values (2,1, 'screws', 12, 5);
insert into material (material_id, project_id, material_name, num_required, cost) values (3,1, 'door', 1, 50);

insert into step (step_id, project_id, step_text, step_order) values (1,1,'Make sure the door is the right size.', 1);
insert into step (step_id, project_id, step_text, step_order) values (2,1,'Remove old door and screws.', 2);
insert into step (step_id, project_id, step_text, step_order) values (3,1,'Clean the door molding.', 3);
insert into step (step_id, project_id, step_text, step_order) values (4,1,'Hang new door.', 4);

insert into category (category_id, category_name) values (1, 'New Door');

insert into project_category (project_id, category_id) values (1, 1);





















