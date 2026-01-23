@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Genre Text'

define view entity ZI_11_GenreVH as select distinct from DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                        p_domain_name: 'ZABAP_GENRE')
  
      
{
  key domain_name,
  key value_position,
  key language,
  
    @EndUserText.label: 'Genre Text'
    @EndUserText.quickInfo: 'Genre Text'
    
      value_low as Genre,
      text      as GenreText
}
where language = $session.system_language
