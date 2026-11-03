-- SCHOOL KA SASTAGRAM: profile creation trigger
-- Run this in Supabase SQL Editor after the starter tables have been created.
-- The trigger creates a private profile whenever a user signs up.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  requested_username text;
begin
  requested_username := lower(coalesce(new.raw_user_meta_data->>'username', 'user_' || substr(new.id::text, 1, 8)));
  insert into public.profiles (id, username, display_name, is_private)
  values (new.id, requested_username, requested_username, true)
  on conflict (id) do nothing;
  return new;
end;
$$;

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
after insert on auth.users
for each row execute procedure public.handle_new_user();

-- Allow a signed-in user to read their own profile; the previous policy
-- "View permitted profiles" already covers this if it was created successfully.
-- NOTE: Do not add public read policies or expose private profile data.
