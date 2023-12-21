
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

-- {{ config(materialized='table') }}


-- SQL model to build a hash column based on the values of this record
-- depends_on: __dbt__cte__sheet1_ab2

create table "postgres".public."sheet1__dbt_tmp"
  as (
    select _airbyte_emitted_at,
        (current_timestamp at time zone 'utc')::timestamp as _airbyte_normalized_at,
        cast(jsonb_extract_path_text(_airbyte_data, 'city') as varchar) as city,
        cast(jsonb_extract_path_text(_airbyte_data, 'commune') as varchar) as commune,
        cast(jsonb_extract_path_text(_airbyte_data, 'district') as varchar) as district,
        cast(jsonb_extract_path_text(_airbyte_data, 'id') as varchar) as id,
        cast(jsonb_extract_path_text(_airbyte_data, 'store') as varchar) as store,
        cast(jsonb_extract_path_text(_airbyte_data, 'admin_name') as varchar) as admin_name
        -- cast(jsonb_extract_path_text(_airbyte_data, 'service') as varchar) as service_,
    from "postgres".public."sheet1__dbt_tmp"
);