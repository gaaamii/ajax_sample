create table comments(
  id integer primary key not null,
  user_id text,
  body text,
  created_at,
  updated_at
);
