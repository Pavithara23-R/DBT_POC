-----Example snapshot config to track changes in the electric_vehicles table VINs --and price:

{% snapshot electric_vehicle_snapshot %}

    {{
      config(
        target_schema='dbt_target_sc',
        unique_key='vin',
        strategy='timestamp',
        updated_at='current_timestamp' 
      )
    }}

    select * from {{ source('ev_source', 'electric_vehicles') }}

{% endsnapshot %}


