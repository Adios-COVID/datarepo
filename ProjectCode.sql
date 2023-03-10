/*
The following SQL was used to create the project's secondary quantitative data database (test1). Each code block has a corresponding
comment, which explains what the code does as well as what that table was used for. The comments may contain the following labels:
import: indicates tables created to hold the data imported directly from the CSVs downloaded from the AWS S3 Buckets. Typically
		named '_TEMP'
final: indicates tables/views created to add to the GitHub repository. Usually a combination/aggregation of several import/_TEMP
		tables, but not always.
import & final: indicates tables that were used to hold imported data from a CSV that were also added to GitHub. In essence, the CSV was
				added directly without any additional joining or aggregation.
endpoint: indicates that there is an endpoint connected to the table.

Information on how to import data into tables using DBeaver can be found in the Data Pipeline Documentation document in our
GitHub repository.
*/

-- set database to use
USE test1

/*
create table OCCUPATION_WA_NON_MSA
	import: yes
	final: yes
	endpoint: no
*/
CREATE TABLE OCCUPATION_WA_NON_MSA (
  OccNonMetID INT NOT NULL,
  Area_Title varchar(100) NOT NULL,
  Primary_State varchar(100) NOT NULL,
  Occupation_Title varchar(100) NOT NULL,
  Occupation_Group varchar(100) NOT NULL,
  Total_Employees_NonMet int NOT NULL,
  Employee_PCT_NonMet NUMERIC(10, 5) NOT NULL,
  Jobs_1000_NonMet NUMERIC(10, 5) NOT NULL,
  Loc_Quotient_NonMet NUMERIC(10, 5) NOT NULL,
  H_Mean_NonMet NUMERIC(10, 5) NOT NULL,
  A_Mean_NonMet NUMERIC(10, 5) NOT NULL,
  Mean_PCT_NonMet NUMERIC(10, 5) NOT NULL,
  H_PCT10_NonMet NUMERIC(10, 5) NOT NULL,
  H_PCT25_NonMet NUMERIC(10, 5) NOT NULL,
  H_Median_NonMet NUMERIC(10, 5) NOT NULL,
  H_PCT75_NonMet NUMERIC(10, 5) NOT NULL,
  H_PCT90_NonMet NUMERIC(10, 5) NOT NULL,
  A_PCT10_NonMet NUMERIC(10, 5) NOT NULL,
  A_PCT25_NonMet NUMERIC(10, 5) NOT NULL,
  A_Median_NonMet NUMERIC(10, 5) NOT NULL,
  A_PCT75_NonMet NUMERIC(10, 5) NOT NULL,
  A_PCT90_NonMet NUMERIC(10, 5) NOT NULL,
  Annual_NonMet varchar(100) NOT NULL,
  Hourly_NonMet varchar(100) NOT NULL,
  PRIMARY KEY (OccNonMetID)
)

/*
create table GOV_TRUST
	import: no
	final: yes
	endpoint: no
*/
CREATE TABLE GOV_TRUST (
  GovTrustID int NOT NULL,
  YR int NOT NULL,
  Lib_Dem_Lean_Dem int NOT NULL,
  Cons_Mod_Dem_Lean_Dem int NOT NULL,
  Mod_Lib_Rep_Lean_Rep int NOT NULL,
  Cons_Rep_Lean_Rep int NOT NULL,
  Dem_Lean_Dem int NOT NULL,
  Rep_Lean_Rep int NOT NULL,
  Hispanic int NOT NULL,
  Black int NOT NULL,
  White int NOT NULL,
  Asian int NOT NULL,
  PRIMARY KEY (GovTrustID)
)

/*
create table HEALTHCARE_METRICS
	import: yes
	final: yes
	endpoint: no
*/
CREATE TABLE HEALTHCARE_METRICS (
  HealthCareID int NOT NULL,
  DateRangeStart date NOT NULL,
  DateRangeEnd date NOT NULL,
  SevenDayAdmit int NOT NULL,
  SevenDayAdmitRatePer100K NUMERIC(3,2) NOT NULL,
  PRIMARY KEY (HealthCareID)
)

/*
create table OCCUPATION_WA_MSA
	import: yes
	final: yes
	endpoint: no
*/
CREATE TABLE OCCUPATION_WA_MSA (
  OccMetID int NOT NULL,
  Area_Title varchar(100) NOT NULL,
  Primary_State varchar(100) NOT NULL,
  Occupation_Title varchar(100) NOT NULL,
  Occupation_Group varchar(100) NOT NULL,
  Total_Employees_Met int NOT NULL,
  Employee_PCT_Met NUMERIC(10, 5) NOT NULL,
  Jobs_1000_Met NUMERIC(10, 5) NOT NULL,
  Loc_Quotient_Met NUMERIC(10, 5) NOT NULL,
  H_Mean_Met NUMERIC(10, 5) NOT NULL,
  A_Mean_Met NUMERIC(10, 5) NOT NULL,
  Mean_PCT_Met NUMERIC(10, 5) NOT NULL,
  H_PCT10_Met NUMERIC(10, 5) NOT NULL,
  H_PCT25_Met NUMERIC(10, 5) NOT NULL,
  H_Median_Met NUMERIC(10, 5) NOT NULL,
  H_PCT75_Met NUMERIC(10, 5) NOT NULL,
  H_PCT90_Met NUMERIC(10, 5) NOT NULL,
  A_PCT10_Met NUMERIC(10, 5) NOT NULL,
  A_PCT25_Met NUMERIC(10, 5) NOT NULL,
  A_Median_Met NUMERIC(10, 5) NOT NULL,
  A_PCT75_Met NUMERIC(10, 5) NOT NULL,
  A_PCT90_Met NUMERIC(10, 5) NOT NULL,
  Annual_Met varchar(100) NOT NULL,
  Hourly_Met varchar(100) NOT NULL,
  PRIMARY KEY (OccMetID)
)

/*
create CASES_CLEANED_TEMP table
	import: yes
	final: no
	endpoint: no
*/
CREATE TABLE CASES_CLEANED_TEMP (
  EarliestSpecCollectDate date,
  County varchar(100),
  TotalCases int,
  ConfirmedCases int,
  ProbableCases int,
  TotalCases_7DAvg NUMERIC(10,5),
  SevDayCaseCount NUMERIC(10,5),
  SevDayCaseRate NUMERIC(10,5),
  FourteenDayCaseCount NUMERIC(10,5),
  FourteenDayCaseRate NUMERIC(10,5),
  DateTimeUpdated datetime
)

/*
create CENSUS_CLEANED_TEMP table
	import: yes
	final: no
	endpoint: no
*/
CREATE TABLE CENSUS_CLEANED_TEMP (
	County varchar(100),
	Pop_Estimate INT,
	Pct_Latino NUMERIC(5, 4),
	Estimated_Latino_Pop INT
)

/*
create EWAINCOME_CLEANED_TEMP
	import: yes
	final: no
	endpoint: no
NOTE: CHECKING IF THIS TABLE SHOULD BE INCLUDED
*/
CREATE TABLE EWAINCOME_CLEANED_TEMP (
	County varchar(100),
	Total varchar(100),
	Less_10000 varchar(100),
	BTWN_10000_14999 varchar(100),
	BTWN_15000_19999 varchar(100),
	BTWN_20000_24999 varchar(100),
	BTWN_25000_29999 varchar(100),
	BTWN_30000_34999 varchar(100),
	BTWN_35000_39999 varchar(100),
	BTWN_40000_44999 varchar(100),
	BTWN_45000_49999 varchar(100),
	BTWN_50000_59999 varchar(100),
	BTWN_60000_74999 varchar(100),
	BTWN_75000_99999 varchar(100),
	BTWN_100000_124999 varchar(100),
	BTWN_125000_149999 varchar(100),
	BTWN_150000_199999 varchar(100),
	More_200000 varchar(100)
)

/*
create AGE_GROUP_ESTIMATE
	import: yes
	final: yes
	endpoint: yes
*/
CREATE TABLE AGE_GROUP_ESTIMATE (
	AgeGroup varchar(100),
	Hospitalized varchar(100),
	Count INT,
	Estimate INT,
	EstimateLow INT,
	EstimateHigh INT
)

/*
create GENDER_GROUP_ESTIMATE
	import: yes
	final: yes
	endpoint: yes
*/
CREATE TABLE GENDER_GROUP_ESTIMATE (
	GenderGroup varchar(100),
	Hospitalized varchar(100),
	Count INT,
	Estimate INT,
	EstimateLow INT,
	EstimateHigh INT
)

/*
create PHYSICIANS_WA_TEMP
	import: yes
	final: yes
	endpoint: yes
*/
CREATE TABLE PHYSICIANS_WA_TEMP (
	County varchar(100),
	Standard varchar(100),
	Total_Physicians INT
)

/*
create table LATINO_INCOME_CLEANED
	import: yes
	final: no
	endpoint: no
NOTE: CHECKING IF THIS TABLE SHOULD BE INCLUDED OR RENAMED
*/
CREATE TABLE LATINO_INCOME_CLEANED (
  County VARCHAR(255),
  Total INT,
  Income_less_10000 INT,
  Income_10000_to_14999 INT,
  Income_15000_to_19999 INT,
  Income_20000_to_24999 INT,
  Income_25000_to_29999 INT,
  Income_30000_to_34999 INT,
  Income_35000_to_39999 INT,
  Income_40000_to_44999 INT,
  Income_45000_to_49999 INT,
  Income_50000_to_54999 INT,
  Income_55000_to_59999 INT,
  Income_60000_to_74999 INT,
  Income_75000_to_99999 INT,
  Income_100000_to_124999 INT,
  Income_125000_to_149999 INT,
  Income_150000_to_199999 INT,
  Income_200000_or_more INT,
  PRIMARY KEY (County)
);

/*
create table LATINO_WORK_TRANSPORT_CLEANED_TEMP
	import: yes
	final: no
	endpoint: no
*/
CREATE TABLE LATINO_WORK_TRANSPORT_CLEANED_TEMP (
    county VARCHAR(50) PRIMARY KEY,
    total INT,
    drove_alone INT,
    carpooled INT,
    public_transportation INT,
    walked INT,
    other_transportation INT,
    worked_at_home INT
    PRIMARY KEY (County)
);

/*
create table LATINO_HOUSEHOLD_CLEANED_TEMP
	import: yes
	final: no
	endpoint: no
*/
CREATE TABLE LATINO_HOUSEHOLD_CLEANED_TEMP  (
    County VARCHAR(255),
    total INT,
    family_households INT,
    married_couple_family INT,
    other_family INT,
    male_householder_no_wife_present INT,
    female_householder_no_husband_present INT,
    nonfamily_households INT,
    householder_living_alone INT,
    householder_not_living_alone INT
    PRIMARY KEY (County)
);

/*
create LATINO_DATA view, which combines several tables containing County-level data.
	import: no
	final: no
	endpoint: no
NOTE: CHECKING IF THIS VIEW SHOULD BE INCLUDED OR IF IT CAN BE DELETED
 */
CREATE VIEW LATINO_DATA AS
SELECT 
	lhct.County 
	,lhct.total AS Household_Total
	,lhct.family_households 
	,lhct.married_couple_family 
	,lhct.other_family 
	,lhct.male_householder_no_wife_present 
	,lhct.female_householder_no_husband_present 
	,lhct.nonfamily_households 
	,lhct.householder_living_alone 
	,lhct.householder_not_living_alone 
	,lic.Total AS Income_Total
	,lic.Income_less_10000
	,lic.Income_10000_to_14999 
	,lic.Income_15000_to_19999 
	,lic.Income_20000_to_24999 
	,lic.Income_25000_to_29999 
	,lic.Income_30000_to_34999 
	,lic.Income_35000_to_39999 
	,lic.Income_40000_to_44999 
	,lic.Income_45000_to_49999 
	,lic.Income_50000_to_54999 
	,lic.Income_55000_to_59999 
	,lic.Income_60000_to_74999 
	,lic.Income_75000_to_99999 
	,lic.Income_100000_to_124999 
	,lic.Income_125000_to_149999 
	,lic.Income_150000_to_199999 
	,lic.Income_200000_or_more 
	,lwtct.total AS Transportation_Total
	,lwtct.drove_alone
	,lwtct.carpooled 
	,lwtct.public_transportation 
	,lwtct.walked 
	,lwtct.other_transportation 
	,lwtct.worked_at_home 
FROM LATINO_HOUSEHOLD_CLEANED_TEMP lhct 
	JOIN LATINO_INCOME_CLEANED lic ON lhct.County = lic.County 
	JOIN LATINO_WORK_TRANSPORT_CLEANED_TEMP lwtct ON lhct.County = lwtct.county 
	
	
/*
create COUNTY_LATINO_DATA view, which combines several tables containing County-level data.
	import: no
	final: yes
	endpoint: yes
 */
CREATE VIEW COUNTY_LATINO_DATA AS(
	
	SELECT 
		ld.County
		,cct.Pop_Estimate 
		,cct.Pct_Latino
		,cct.Estimated_Latino_Pop
		,ld.Household_Total 
		,ld.family_households 
		,ld.married_couple_family 
		,ld.other_family 
		,ld.male_householder_no_wife_present
		,ld.female_householder_no_husband_present 
		,ld.nonfamily_households 
		,ld.householder_living_alone 
		,ld.householder_not_living_alone 
		,ld.Income_Total 
		,ld.Income_less_10000 
		,ld.Income_10000_to_14999 
		,ld.Income_15000_to_19999 
		,ld.Income_20000_to_24999 
		,ld.Income_25000_to_29999 
		,ld.Income_30000_to_34999 
		,ld.Income_35000_to_39999 
		,ld.Income_40000_to_44999 
		,ld.Income_45000_to_49999 
		,ld.Income_50000_to_54999 
		,ld.Income_55000_to_59999 
		,ld.Income_60000_to_74999 
		,ld.Income_75000_to_99999 
		,ld.Income_100000_to_124999 
		,ld.Income_125000_to_149999 
		,ld.Income_150000_to_199999 
		,ld.Income_200000_or_more 
		,ld.Transportation_Total 
		,ld.drove_alone 
		,ld.carpooled 
		,ld.public_transportation 
		,ld.walked 
		,ld.other_transportation 
		,ld.worked_at_home 
	FROM LATINO_DATA ld 
		LEFT JOIN CENSUS_CLEANED_TEMP cct ON ld.County = cct.County
)

/*
create CASES_BY_COUNTY view, which aggregates COVID-19 cases on the County level.
	import: no
	final: yes
	endpoint: yes
 */
CREATE VIEW CASES_BY_COUNTY AS (

WITH cases AS (
	SELECT 
		County
		,SUM(TotalCases) AS TotalCases 
		,SUM(ConfirmedCases) AS ConfirmedCases 
		,SUM(ProbableCases) AS ProbableCases 
		,AVG(TotalCases_7DAvg) AS TotalCases_7DAvg 
		,AVG(SevDayCaseCount) AS SevDayCaseCount 
		,AVG(SevDayCaseRate) AS SevDayCaseRate 
		,AVG(FourteenDayCaseCount) AS FourteenDayCaseCount 
		,AVG(FourteenDayCaseRate) AS FourteenDayCaseRate 
	FROM CASES_CLEANED_TEMP cct 
	GROUP BY County 
),

joined AS (
	SELECT 
		c.County
		,c.TotalCases
		,c.ConfirmedCases
		,c.ProbableCases
		,c.TotalCases_7DAvg
		,c.SevDayCaseCount
		,c.SevDayCaseRate
		,c.FourteenDayCaseCount
		,c.FourteenDayCaseRate
		,cct.Pop_Estimate 
		,cct.Pct_Latino 
		,cct.Estimated_Latino_Pop 
	FROM cases c
		LEFT JOIN CENSUS_CLEANED_TEMP cct ON c.County = cct.County
)

SELECT *
FROM joined

)

