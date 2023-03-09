Data Repository for the Adios COVID Research Project
=====

## S3 Bucket Section


## ERD Section



## Data
* `AGE_GROUP_ESTIMATE.csv` contains the estimated number of Latinos population were affected by Long Covid for different age group. For the age group, we categorized the age group dataset into smaller subsets, mainly three categories: Under 18, 18 to 49, and 50+. We used two datasets obtained from the [Washington state COVID-19 Data Dashboard](https://doh.wa.gov/emergencies/covid-19/data-dashboard#CurrentStatus) for the estimation.

* `GENDER_GROUP_ESTIMATE.csv`contains the estimated number of Latinos population were affected by Long Covid for different gender group. For the gender group, we categorized them into male and female group. We used two datasets obtained from the [Washington state COVID-19 Data Dashboard](https://doh.wa.gov/emergencies/covid-19/data-dashboard#CurrentStatus) for the estimation.

* `GOV_TRUST.csv` contains Public Trust in Government from 1958-2022 for different party,race and ethnicity groups and the data was collected by [Pew Research Center](https://www.pewresearch.org/politics/2022/06/06/public-trust-in-government-1958-2022/).

* `HEATHCARE_METRICS.csv` contains hospital admission rates for Washington State over time. It contains a date range, 7-day admission count, 7-day admission rate per 100,000, and the population at the time of the date range. There are 858 rows of data. This data should be representative of the hospital admission rates for Washington in the given time frame. The data is compiled by the [Washington State Department of Health](https://doh.wa.gov/emergencies/covid-19/data-dashboard#tables), who have primary access to these figures from the hospitals themselves.

* `OCCUPATION_WA_MSA.csv` contains data about the occupations of residents of metropolitan area in Eastern Washington state and it was collected by the [U.S. Bureau of Labor Statistics](https://www.bls.gov/oes/current/oes_5300007.htm). This data should be representative of the prevalence of various occupations in Eastern Washington.

* `OCCUPATION_WA_NON_MSA.csv` contains data about the occupations of residents of nonmetropolitan area in Eastern Washington state and it was collected by the [U.S. Bureau of Labor Statistics](https://www.bls.gov/oes/current/oes_5300007.htm).

## API SECTION
Our open-source research project offers APIs that provides access to our research data. The APIs are designed to be easy to use and flexible, allowing developers to query our data and integrate it into their own applications.

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

Returns the data for total number of cases, confirmed cases, 7 day average, fourteen day case rate, etc. for a specified county.

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


## Disclaimer
The data presented in the repository was collected from a variety of sources, including medical journals, public health organizations, and Government website. While we have made every effort to ensure the accuracy of the data, we cannot guarantee its completeness or accuracy.

## Contact
If you have any questions regarding our open-source research project, you can to reach out to us through [email](mailto:research@adioscovid.org).<br>
**research@adioscovid.org**
