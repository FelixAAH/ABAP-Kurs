@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'AverageRating'


define view entity ZC_11_AverageRating
  as select from zabap_rating_a

{
  key movie_uuid  as MovieUuid,

      

      avg(rating as abap.dec(15,2)) as AverageRating
}

group by movie_uuid
