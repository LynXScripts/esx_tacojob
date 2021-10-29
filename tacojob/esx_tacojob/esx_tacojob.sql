INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_taco', 'taco', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_taco', 'taco', 1),
  ('society_taco_fridge', 'taco(fridge)', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    ('society_taco', 'taco', 1)
;

INSERT INTO `jobs` (name, label, whitelisted) VALUES
  ('taco', 'taco', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('taco', 0, 'recruit', 'Trainee', 800, '{}', '{}'),
  ('taco', 1, 'novice', 'Cashier', 800, '{}', '{}'),
  ('taco', 2, 'chef', 'Chef', 800, '{}', '{}'),
  ('taco', 3, 'viceboss', 'Assistant Manager', 800, '{}', '{}'),
  ('taco', 4, 'boss', 'Manager', 800, '{}', '{}')
;