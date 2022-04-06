/*ceresid0

This .do file selects staff in communal establishments for reclassification as 
residents who are:
	EITHER aged 0-15 (age not imputed)
	OR aged 75 or over (age not imputed)
	OR aged 16-74 and economically inactive (age not imputed, economic activity 
	not imputed)
	OR age is imputed and economically inactive (economic activity not imputed)

Variables needed for this code:
	posp0 (position in establishment)
	pospimp (position in establishment imputation flag)
	agep0 (age in 2001)
	agepimp (imputed age)
	ecop0 (economic activity 2001)
	ecopimp (economic activity imputation flag)
*/
********************************************************************************

/*Make sure that you change your working directory to your project area
cd "P:\......"
*/

/*Open the dataset that you want to add the derived variable to. Make sure that it has all the variables that are in the variables list above)*/

gen ceresid0=posp0

replace ceresid0=3 if posp0==1 & ((agep0>-1 & agep0<16 & agepimp~=1) | (agep0>74 & agep0~=. & agepimp~=1) | (agep0>15 & agep0<75 & agepimp~=1 & ecop0>16 & ecop0<22 & ecopimp~=1)) 
*nb there are no cases where pospimp==1 i.e. where position in communal establishment 2001 has been imputed

lab var ceresid0 "Corrected position in communal establishment 2001"
lab def status -4 "NA-private HH" 1 "Staff or owner" 2 "Relative of staff or owner" 3 "Other eg resident, patient, student"
lab val ceresid0 status

*SAVE YOUR DATA