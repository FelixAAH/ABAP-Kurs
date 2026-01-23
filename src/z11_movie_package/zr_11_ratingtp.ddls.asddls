@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RatingTP'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_11_RatingTP as select from ZI_11_Rating

  association to parent ZR_11_MovieTP as _Movies
    on $projection.MovieUuid = _Movies.MovieUuid
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  
  _Movies
}
