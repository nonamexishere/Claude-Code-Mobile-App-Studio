---
name: setup-supabase
description: "Set up Supabase services: Auth, Database, Realtime, Edge Functions, and Storage with Row Level Security."
argument-hint: "[services: auth,database,realtime,storage,functions]"
user-invocable: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, AskUserQuestion
---

When this skill is invoked:

1. **Detect the project platform** from config files.

2. **Ask which services to set up** using `AskUserQuestion`:

   - Tab "Services" — "Which Supabase services?"
     Options (multi): Authentication / Database (Postgres) / Realtime / Edge Functions / Storage
   - Tab "Auth" — "Auth providers?" (if Auth selected)
     Options (multi): Email-Password / Google / Apple / GitHub / Phone OTP / Magic Link

3. **Set up Supabase client**:

   **React Native**:
   - Install @supabase/supabase-js
   - Configure AsyncStorage for session persistence
   - Set up Supabase client with environment variables

   **Flutter**:
   - Install supabase_flutter
   - Configure Supabase initialization
   - Set up deep link callback for auth

   **iOS (Swift)**:
   - Install Supabase Swift SDK via SPM
   - Configure client

   **Android (Kotlin)**:
   - Install supabase-kt
   - Configure client with Ktor engine

4. **For each service, generate**:
   - **Auth**: Auth service wrapper, session management, deep link handling for OAuth
   - **Database**: Table definitions as SQL migrations, Row Level Security policies, TypeScript/Dart types generation
   - **Realtime**: Channel subscriptions, presence tracking, broadcast setup
   - **Edge Functions**: Example function with Deno, CORS configuration, local dev setup
   - **Storage**: Bucket policies, upload/download helpers, image transformation URLs

5. **Generate RLS policies** template with common patterns:
   - Users can only read/write their own data
   - Public read, authenticated write
   - Role-based access

6. **Suggest next steps**:
   1. "Run `/setup-auth` to build complete auth flows"
   2. "Run `/design-database` to design your schema"
   3. "Talk to `@supabase-specialist` for advanced patterns"
