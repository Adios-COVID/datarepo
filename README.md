Data Repository for the Adios COVID Research Project
=====

## S3 Bucket Section


## ERD Section


## Data
* `AGE_GROUP_ESTIMATE.csv` contains the estimated number of Latinos in Washington state who were affected by Long Covid; grouped by age ranges. The age ranges are: Under 18, 18 to 49, and 50+. We used two datasets obtained from the [Washington state COVID-19 Data Dashboard](https://doh.wa.gov/emergencies/covid-19/data-dashboard#CurrentStatus) for the estimation.

* `GENDER_GROUP_ESTIMATE.csv` contains the estimated number of Latinos in Washington state affected by Long Covid; grouped by gender. The gender groups were categorized into male and female. We used two datasets obtained from the [Washington state COVID-19 Data Dashboard](https://doh.wa.gov/emergencies/covid-19/data-dashboard#CurrentStatus) for the estimation.

* `GOV_TRUST.csv` contains Public Trust in Government from 1958-2022 for different party, race and ethnicity groups. The data was collected by the [Pew Research Center](https://www.pewresearch.org/politics/2022/06/06/public-trust-in-government-1958-2022/).

* `HEATHCARE_METRICS.csv` contains hospital admission rates for Washington State over time. It contains these date ranges: 7-day admission count, 7-day admission rate per 100,000; and the population at the time of the date range. There are 858 rows of data. This data should be representative of the hospital admission rates for Washington in the given time frame. The data is compiled by the [Washington State Department of Health](https://doh.wa.gov/emergencies/covid-19/data-dashboard#tables), who have primary access to these figures from the hospitals themselves.

* `OCCUPATION_WA_MSA.csv` contains data about the occupations of residents of metropolitan areas in Eastern Washington state. It was collected by the [U.S. Bureau of Labor Statistics](https://www.bls.gov/oes/current/oes_5300007.htm). This data should be representative of the prevalence of various occupations in Eastern Washington.

* `OCCUPATION_WA_NON_MSA.csv` contains data about the occupations of residents of non-metropolitan areas in Eastern Washington state. It was collected by the [U.S. Bureau of Labor Statistics](https://www.bls.gov/oes/current/oes_5300007.htm).

* `PHYSICIANS_WA.csv` contains data about the number of physicians in Eastern Washington counties. It was collected by the [Washington Office of Financial Management Health Care Research Center](https://ofm.wa.gov/sites/default/files/public/dataresearch/healthcare/workforce/physician_supply_2019-20.pdf).

## API SECTION
Our open-source research system offers APIs that provides access to our quantitative research data. The APIs are designed to be easy to use and flexible, allowing researchers to query our data and integrate it into their own applications for further analysis.

### Base URL
https://rprwae53w2.execute-api.us-west-2.amazonaws.com/v-1/

### Endpoints
#### 1. **Age Group Estimate**

Returns the data for low end and high end estimate of COVID-19 hospitalizations by age group.

URL: `/age-group-estimate`

Method: `GET`

Parameters: None

Sample Response:

```json
{
  "AgeGroup": "Age 0-17",
  "Hospitalized": "Hos",
  "Count": 134,
  "Estimate": 39,
  "EstimateLow": 24,
  "EstimateHigh": 109
}
```

#### 2. **Gender Group Estimate**

Returns the data for low end and high end estimate of COVID-19 hospitalizations by age group.

URL: `/gender-group-estimate`

Method: `GET`

Parameters: None

Sample Response:

```json
{
  "GenderGroup": "Male",
  "Hospitalized": "Hos",
  "Count": 4351,
  "Estimate": 2350,
  "EstimateLow": 1914,
  "EstimateHigh": 2741
}
```

#### 3. **Cases By County**

Returns the data for total number of cases, confirmed cases, 7 day average, fourteen day case rate, etc. for a specified county.

URL: `/cases-by-county`

Method: `GET`

Parameters:

|Name|Type|Description|Required|
|----|----|-----------|--------|
|County|`String`|The name of the county.|Yes|

Valid County Values:

`Adams, Asotin, Benton, Better Health Together, Cascade Pacific Action Alliance, Chelan, Clallam, Clark, Columbia, Cowlitz, Douglas ,Elevate Health, Ferry
Franklin, Garfield, Grant, Grays Harbor, Greater Columbia, Healthier Here, Island, Jefferson, King, Kitsap, Kittitas, Klickitat, Lewis, Lincoln, Mason, North Central, North Sound, Okanogan, Olympic Community of Health, Pacific, Pend Oreille, Pierce, San Juan, Skagit, Skamania, Snohomish, Southwest  Washington, Spokane, Stevens, Thurston, Unassigned, Unassigned ACH, Unassigned Region, Wahkiakum, Walla Walla, Western Washington, Whatcom, Whitman, Yakima`

Sample Response:

```json
{
  "EarliestSpecCollectDate": "King",
  "County": "544594",
  "TotalCases": "510263",
  "ConfirmedCases": "34331",
  "ProbableCases": "486.761708407",
  "TotalCases_7DAvg": "3407.332737030",
  "SevDayCaseCount": "150.713595706",
  "SevDayCaseRate": "6805.925760286",
  "FourteenDayCaseCount": "301.040429338",
  "FourteenDayCaseRate": null,
  "Pop_Estimate": null,
  "Pct_latino": null
}
```

#### 4. **Latino By County**

Returns the data for Latinos by county including estimated population, household income, household size, and transportation statisitcs.

URL: `/latino-by-county`

Method: `GET`

Parameters:

|Name|Type|Description|Required|
|----|----|-----------|--------|
|County|`String`|The name of the county.|Yes|

Valid County Values:

`Washington, Adams, Asotin, Benton, Chelan, Columbia, Douglas, Ferry, Franklin, Garfield, Grant, Kittitas, Klickitat, Lincoln, Okanogan, Pend Oreille, Spokane, Stevens, Walla Walla, Whitman, Yakima`

Sample Response:

```json
{
  "County": "Yakima",
  "Pop_Estimate": 256035,
  "pct_Latino": "0.5180",
  "estimated_Latino_Pop": 132626,
  "household_Total": 30542,
  "family_households": 25731
  "married_couple_family": 15350,
  "other_family": 10381,
  "male_householder_no_wife_present": 3384,
  "female_householder_no_husband_present": 6997,
  "nonfamily_households": 4811,
  "householder_living_alone": 3678,
  "householder_not_living_alone": 1133,
  "income_total": 30542,
  "income_less_10000": 1754,
  "income_10000_to_14999": 1452,
  "income_15000_to_19999": 1643,
  "income_20000_to_24999": 2220,
  "income_25000_to_29999": 1864,
  "income_30000_to_34999": 2743,
  "income_35000_to_39999": 2256,
  "income_40000_to_44999": 2154,
  "income_45000_to_49999": 1610,
  "income_50000_to_54999": 2868,
  "income_55000_to_59999": 3759,
  "income_60000_to_74999": 3371,
  "income_75000_to_99999": 3371,
  "income_100000_to_124999": 1498,
  "income_125000_to_149999": 635,
  "income_150000_to_199999": 433,
  "income_200000_or_more": 282,
  "transportation_Total": 48157,
  "drove_alone": 36103,
  "carpooled": 8904,
  "public_transportation": 220,
  "walked": 797,
  "other_transportation": 716,
  "worked_at_home": 1417
}
```

#### 5. **Physicians By County**

Returns the data for Accountability Community of Health(ACH) and number of physicians by county.

URL: `/physicians-by-county`

Method: `GET`

Parameters:

|Name|Type|Description|Required|
|----|----|-----------|--------|
|County|`String`|The name of the county.|Yes|

Valid County Values:

`Adams, Asotin, Benton, Chelan, Clallam, Clark, Columbia, Cowlitz, Douglas, Ferry, Franklin, Garfield, Grant, Grays Harbor, Island, Jefferson, King, Kitsap, Kittitas, Klickitat, Lewis, Lincoln, Mason, Okanogan, Pacific, Pend Oreille, Pierce, San Juan, Skagit, Skamania, Snohomish, Spokane, Stevens, Thurston, Wahkiakum, Walla Walla, Whatcom, Whitman, Yakima`

Sample Response:

```json
{
  "County": "King",
  "ACH": " King County ACH",
  "Total_Physicians": 8806
}
```

#### 6. **Latino Income**

Returns the data for household income brackets by county for Latinos in Washington.

URL: `/latino-income`

Method: `GET`

Parameters: None

Sample Response:

```json
{
  "County": "Adams",
  "total": 2958,
  "Income_less_10000": 166,
  "Income_10000_to_14999": 256,
  "Income_15000_to_19999": 228,
  "Income_20000_to_24999": 247,
  "Income_25000_to_29999": 137,
  "Income_30000_to_34999": 70,
  "Income_35000_to_39999": 171,
  "Income_40000_to_44999": 277,
  "Income_45000_to_49999": 68,
  "Income_50000_to_54999": 206,
  "Income_55000_to_59999": 401,
  "Income_60000_to_74999": 455,
  "Income_75000_to_99999": 455,
  "Income_100000_to_124999": 108,
  "Income_125000_to_149999": 83,
  "Income_150000_to_199999": 42,
  "Income_200000_or_more": 43
}
```

#### 7. **Latino Population**

Returns data for total population estimate, Latino population, and percentage of Latinos for each county in Washington.

URL: `/latino-population`

Method: `GET`

Parameters: None

Sample Response:

```json
{
  "County": "Okanogan",
  "Pop_Estimate": 42634,
  "Pct_Latino": "0.2130",
  "Estimated_Latino_Pop": 9081
}
```
## Disclaimer
The data presented in the repository was collected from a variety of sources, including medical journals, public health organizations, and Government website. While we have made every effort to ensure the accuracy of the data, we cannot guarantee its completeness or accuracy.

## Contact
If you have any questions regarding our open-source research project, you can to reach out to us through [email](mailto:research@adioscovid.org).<br>
**research@adioscovid.org**
