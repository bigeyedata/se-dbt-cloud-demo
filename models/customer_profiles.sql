with
    contacts as (
        select companyid, cb_seniority
        from elt.hubspot_raw.contacts
        where cb_seniority is not null
    ),

    companies as (
        select companyid, property_revenue_estimate from elt.hubspot_raw.companies
    ),
    final as (
        select cb_seniority, avg(property_revenue_estimate)
        from contacts
        inner join companies on contacts.companyid = contacts.companyid
        group by 1
    )

select *
from final
