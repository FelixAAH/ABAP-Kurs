@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Movie TP'

define root view entity ZR_11_MovieTP
  as select from ZI_11_MOVIE

    association [1..1] to ZC_11_AverageRating as _AverageRating on $projection.MovieUuid = _AverageRating.MovieUuid
    
    association [1..1] to ZI_11_GenreText as _GenreText on $projection.Genre = _GenreText.Genre
    

    composition [0..*] of ZR_11_RatingTP as _Ratings

{
  key MovieUuid,

      Title,
      @ObjectModel.text.element: [ 'Langweise' ]
      Genre,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,

      /* Transient Data */
      case when _AverageRating.AverageRating <= 10 and  _AverageRating.AverageRating >= 6.7 then 3
           when _AverageRating.AverageRating < 6.6 and _AverageRating.AverageRating >= 3.4  then 2
           when _AverageRating.AverageRating < 3.4 and _AverageRating.AverageRating > 0    then 1
                                                                  else 0 end          as RatingCriticality,

      _AverageRating.AverageRating as AverageRating,
      
      _GenreText.Langweise as Langweise,

      _Ratings
}
