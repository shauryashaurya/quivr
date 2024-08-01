create table "public"."syncs_active" (
    "id" bigint generated by default as identity not null,
    "name" text not null,
    "syncs_user_id" bigint not null,
    "user_id" uuid not null default gen_random_uuid(),
    "settings" jsonb,
    "last_synced" timestamp with time zone not null default (now() AT TIME ZONE 'utc'::text),
    "sync_interval_minutes" integer default 360
);


alter table "public"."syncs_active" enable row level security;

create table "public"."syncs_user" (
    "id" bigint generated by default as identity not null,
    "name" text not null,
    "provider" text not null,
    "state" jsonb,
    "credentials" jsonb,
    "user_id" uuid default gen_random_uuid()
);


alter table "public"."syncs_user" enable row level security;

CREATE UNIQUE INDEX syncs_active_pkey ON public.syncs_active USING btree (id);

CREATE UNIQUE INDEX syncs_user_pkey ON public.syncs_user USING btree (id);

alter table "public"."syncs_active" add constraint "syncs_active_pkey" PRIMARY KEY using index "syncs_active_pkey";

alter table "public"."syncs_user" add constraint "syncs_user_pkey" PRIMARY KEY using index "syncs_user_pkey";

alter table "public"."syncs_active" add constraint "public_syncs_active_syncs_user_id_fkey" FOREIGN KEY (syncs_user_id) REFERENCES syncs_user(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."syncs_active" validate constraint "public_syncs_active_syncs_user_id_fkey";

alter table "public"."syncs_active" add constraint "public_syncs_active_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."syncs_active" validate constraint "public_syncs_active_user_id_fkey";

alter table "public"."syncs_user" add constraint "public_syncs_user_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."syncs_user" validate constraint "public_syncs_user_user_id_fkey";

grant delete on table "public"."syncs_active" to "anon";

grant insert on table "public"."syncs_active" to "anon";

grant references on table "public"."syncs_active" to "anon";

grant select on table "public"."syncs_active" to "anon";

grant trigger on table "public"."syncs_active" to "anon";

grant truncate on table "public"."syncs_active" to "anon";

grant update on table "public"."syncs_active" to "anon";

grant delete on table "public"."syncs_active" to "authenticated";

grant insert on table "public"."syncs_active" to "authenticated";

grant references on table "public"."syncs_active" to "authenticated";

grant select on table "public"."syncs_active" to "authenticated";

grant trigger on table "public"."syncs_active" to "authenticated";

grant truncate on table "public"."syncs_active" to "authenticated";

grant update on table "public"."syncs_active" to "authenticated";

grant delete on table "public"."syncs_active" to "service_role";

grant insert on table "public"."syncs_active" to "service_role";

grant references on table "public"."syncs_active" to "service_role";

grant select on table "public"."syncs_active" to "service_role";

grant trigger on table "public"."syncs_active" to "service_role";

grant truncate on table "public"."syncs_active" to "service_role";

grant update on table "public"."syncs_active" to "service_role";

grant delete on table "public"."syncs_user" to "anon";

grant insert on table "public"."syncs_user" to "anon";

grant references on table "public"."syncs_user" to "anon";

grant select on table "public"."syncs_user" to "anon";

grant trigger on table "public"."syncs_user" to "anon";

grant truncate on table "public"."syncs_user" to "anon";

grant update on table "public"."syncs_user" to "anon";

grant delete on table "public"."syncs_user" to "authenticated";

grant insert on table "public"."syncs_user" to "authenticated";

grant references on table "public"."syncs_user" to "authenticated";

grant select on table "public"."syncs_user" to "authenticated";

grant trigger on table "public"."syncs_user" to "authenticated";

grant truncate on table "public"."syncs_user" to "authenticated";

grant update on table "public"."syncs_user" to "authenticated";

grant delete on table "public"."syncs_user" to "service_role";

grant insert on table "public"."syncs_user" to "service_role";

grant references on table "public"."syncs_user" to "service_role";

grant select on table "public"."syncs_user" to "service_role";

grant trigger on table "public"."syncs_user" to "service_role";

grant truncate on table "public"."syncs_user" to "service_role";

grant update on table "public"."syncs_user" to "service_role";
