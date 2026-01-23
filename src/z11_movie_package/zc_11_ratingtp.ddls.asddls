@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RatingTP'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_11_RatingTP as projection on ZR_11_RatingTP
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  /* Associations */
  _Movies : redirected to parent ZC_11_MovieTP
}
