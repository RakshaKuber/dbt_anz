{% snapshot orders_snapshot %}

{{
    config(
        target_database='analytics',
        target_schema='rdt_rkuber',
        unique_key='o_order_key',
        strategy='updtime',
        updated_at='o_orderdate'
    )
}}

select * from {{ source('src', 'checkorders') }}

{%endsnapshot%}