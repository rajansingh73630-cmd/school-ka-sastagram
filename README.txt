# SCHOOL KA SASTAGRAM — starter website

This is a starter MVP, not a finished social network.

## Files
- `index.html`: responsive website with signup/login, basic feed and post creation.
- `setup.sql`: creates a private profile automatically after signup.

## Setup
1. Create the Supabase project and run your database table SQL and privacy SQL.
2. In Supabase, open Project Settings → API.
3. Copy the Project URL and the `anon` / publishable public key.
4. Open `index.html` and replace:
   - `PASTE_YOUR_SUPABASE_PROJECT_URL`
   - `PASTE_YOUR_SUPABASE_ANON_KEY`
5. Run `setup.sql` in Supabase SQL Editor.
6. Upload `index.html` to your GitHub repository root.
7. Connect the repository to Cloudflare Pages. Choose no framework; build command blank; output directory `/`.

Never put a Supabase `service_role` or secret key in browser code. Do not launch publicly until access policies are tested. Stories, chat, notifications, image uploads, likes, comments, blocking/reporting UI and admin moderation are not implemented in this starter yet.
