@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 5 Aggregation Functions'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z11_Demo05
  as select from /dmo/flight

{
  count(*)                                            as NumberOfFlights,
  count(distinct plane_type_id)                       as NumberOfDifferentPlaneTypeIDs,
  max(seats_occupied)                                 as MaxOccupiedSeats,
  min(seats_occupied)                                 as MinOccupiedSeats,
  sum(seats_occupied)                                 as SumOfOccupiedSeats,

  sum(case when seats_occupied / seats_max > 0.7 then 1
       else 0 end)                                    as NumberOfMostlyBookedUpFlights,

  sum(case when seats_occupied = 0 then 1 else 0 end) as NumberOfEmptySeats,
  avg(seats_occupied as abap.dec(16,2))                     as AverageOccupiedSeats
}
