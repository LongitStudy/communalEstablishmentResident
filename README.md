# CommunalEstablishmentResident in 2001
This syntax selects staff in communal establishments and reclassifies them as residents if they are:
- aged 0-15 years.
- 75+ years.
- 16-74 years and economically inactive.
- if their age is imputed and they are economically inactive.

Researchers using the ONS Longitudinal Study will need to ensure that they have the following variables in their dataset:
- posp0
- agep0
- agepimp
- ecop0
- ecopimp

The code could be adapted to do the same for the 1981 Census (rescl8, age8 and econact8), the 1991 Census (using resclas9, age9 and econp09) and the 2011 Census using (posp11, agep11, agep11_imp, ecop11 and ecop11_imp).
For the 1971 Census the required variables do not exist.
