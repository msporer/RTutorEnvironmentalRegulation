
mf <- function(formula, controls){
  contr.string <- paste(controls,collapse="+")
  formula.string <- paste0(formula,"+",contr.string)
  my.formula <- formula(formula.string)
  return(my.formula)
}




mf.iv <- function(formula,controls,instr){
  contr.string <- paste(controls,collapse="+")
  instr.string <- paste(instr, collapse="+")
  formula.string <- paste0(formula,"+",contr.string ,"|", instr.string)
  my.formula <- formula(formula.string)
  return(my.formula)
}





my.controls = c("total_housing_units_dif", "share_units_occupied_dif", "share_occ_own_dif", "share_black_dif",  "share_latino_dif", "share_kids_dif", "share_over_65_dif", "share_foreign_born_dif",  "share_female_hhhead_dif", "share_same_house_dif",  "share_unemployed_dif", "share_manuf_empl_dif", "share_poor_dif", "share_public_assistance_dif", "ln_med_fam_income_dif", "share_edu_less_hs_dif", "share_edu_16plus_dif", "share_heat_coal_dif", "share_heat_wood_dif",  "share_kitchen_none_dif", "share_plumbing_full_dif", "pop_dense_dif",  "share_bdrm2_own_dif", "share_bdrm3_own_dif", "share_bdrm4_own_dif", "share_bdrm5_own_dif", "share_single_unit_d_own_dif", "share_single_unit_a_own_dif", "share_mobile_home_own_dif", "share_blt_5_10_own_dif", "share_blt_10_20_own_dif", "share_blt_20_30_own_dif", "share_blt_30_40_own_dif", "share_blt_40_50_own_dif", "share_blt_50plus_own_dif", "share_bdrm2_rnt_dif", "share_bdrm3_rnt_dif", "share_bdrm4_rnt_dif", "share_bdrm5_rnt_dif", "share_single_unit_d_rnt_dif", "share_single_unit_a_rnt_dif", "share_mobile_home_rnt_dif", "share_blt_5_10_rnt_dif", "share_blt_10_20_rnt_dif", "share_blt_20_30_rnt_dif", "share_blt_30_40_rnt_dif" ,"share_blt_40_50_rnt_dif", "share_blt_50plus_rnt_dif", "factor")





area.map=function(){
  library(leaflet)
  library(XML)
  library(maps)
  lat1 = 31.2197
  long1 =  -85.4828
  lat2 = 32.7542
  long2 = -117.1961
  lat3 = 40.101
  long3 = -74.2959
  mapStates <- map('county', c("alabama", "california", "new york"), fill = TRUE, plot=FALSE)
  m <- leaflet() %>%
    addTiles() %>%  
    addPolygons(data=mapStates, fillColor = heat.colors(3, alpha = NULL), stroke = FALSE)%>%
    addCircleMarkers(lng=c(long1,long2,long3), lat=c(lat1,lat2,lat3), fillColor= c('green', 'red', 'green') , color=c('green', 'red', 'green'),
    popup=c("Alabama: Houston (1069)","California: San Diego (6073)","New York: Essex (36031)"))
  
   m
  return (m)
}





reg.summary = function(...,dep.var="",digits=5, type="html"){
  if (nchar(dep.var)>0) {
    dep.var = paste0("Dep. Variable: ", dep.var)
  }
  library(stargazer)
  omit = paste0("(", c("share_black_dif_80", "pop_dif_80", "total_housing_units_dif_80", "ln_avg_fam_income_dif_80", "Constant", "total_housing_units_dif", "share_units_occupied_dif", "share_occ_own_dif", "share_black_dif",  "share_latino_dif", "share_kids_dif", "share_over_65_dif", "share_foreign_born_dif",  "share_female_hhhead_dif", "share_same_house_dif",  "share_unemployed_dif", "share_manuf_empl_dif", "share_poor_dif", "share_public_assistance_dif", "ln_med_fam_income_dif", "share_edu_less_hs_dif", "share_edu_16plus_dif", "share_heat_coal_dif", "share_heat_wood_dif",  "share_kitchen_none_dif", "share_plumbing_full_dif", "pop_dense_dif",  "share_bdrm2_own_dif", "share_bdrm3_own_dif", "share_bdrm4_own_dif", "share_bdrm5_own_dif", "share_single_unit_d_own_dif", "share_single_unit_a_own_dif", "share_mobile_home_own_dif", "share_blt_5_10_own_dif", "share_blt_10_20_own_dif", "share_blt_20_30_own_dif", "share_blt_30_40_own_dif", "share_blt_40_50_own_dif", "share_blt_50plus_own_dif", "share_bdrm2_rnt_dif", "share_bdrm3_rnt_dif", "share_bdrm4_rnt_dif", "share_bdrm5_rnt_dif", "share_single_unit_d_rnt_dif", "share_single_unit_a_rnt_dif", "share_mobile_home_rnt_dif", "share_blt_5_10_rnt_dif", "share_blt_10_20_rnt_dif", "share_blt_20_30_rnt_dif", "share_blt_30_40_rnt_dif" ,"share_blt_40_50_rnt_dif", "share_blt_50plus_rnt_dif", "factor"),
                ")", collapse="|")
  
  if (type=="html")
    cat("<center>")
  stargazer(..., 
            type = type, 
            style = "aer",  
            digits = digits,
            df = FALSE,
            report = "vc*p",
            star.cutoffs = c(0.05, 0.01, 0.001),
            model.names = FALSE,
            object.names = TRUE,
            model.numbers = FALSE,
            dep.var.labels.include = FALSE,
            dep.var.caption = dep.var,
            omit.labels = "Controls?",
            omit = omit,
            keep.stat = c("rsq", "f")
  )
  if (type=="html")
    cat("</center>")
  
}

