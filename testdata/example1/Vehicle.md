---
title: com.example
description: API Specification for the com.example package.
---

<a name="vehicle-proto"></a><p align="right"><a href="#top">Top</a></p>

<!-- begin services -->

<!-- begin services -->



<a name="com-example-Manufacturer"></a>

### Manufacturer

Represents a manufacturer of cars.




| Field | Type | Description |
| ----- | ---- | ----------- |
| id |int32|  The unique manufacturer ID.  |
| code |string|  A manufacturer code, e.g. "DKL4P".  |
| details |string|  Manufacturer details (minimum orders et.c.).  |
| category |[Manufacturer.Category](#com-example-Manufacturer-Category)| Manufacturer category.   |




 <!-- end nested messages -->



<a name="com-example-Manufacturer-Category"></a>

### Manufacturer.Category
Manufacturer category. A manufacturer may be either inhouse or external.



| Name | Number | Description |
| ---- | ------ | ----------- |
| CATEGORY_INHOUSE | 0 |  The manufacturer is inhouse.  |
| CATEGORY_EXTERNAL | 1 |  The manufacturer is external.  |


 <!-- end nested enums -->




<a name="com-example-Model"></a>

### Model

Represents a vehicle model.




| Field | Type | Description |
| ----- | ---- | ----------- |
| id |string|  The unique model ID.  |
| model_code |string|  The car model code, e.g. "PZ003".  |
| model_name |string|  The car model name, e.g. "Z3".  |
| daily_hire_rate_dollars |sint32|  Dollars per day.  |
| daily_hire_rate_cents |sint32|  Cents per day.  |




 <!-- end nested messages -->

 <!-- end nested enums -->




<a name="com-example-Vehicle"></a>

### Vehicle

Represents a vehicle that can be hired.




| Field | Type | Description |
| ----- | ---- | ----------- |
| id |int32|  Unique vehicle ID.  |
| model |[Model](#com-example-Model)|  Vehicle model.  |
| reg_number |string|  Vehicle registration number.  |
| mileage |sint32|  Current vehicle mileage, if known.  |
| category |[Vehicle.Category](#com-example-Vehicle-Category)|  Vehicle category.  |
| daily_hire_rate_dollars |sint32| Dollars per day.   |
| daily_hire_rate_cents |sint32| Cents per day.   |



| Extension | Type | Base | Number | Description |
| --------- | ---- | ---- | ------ | ----------- |
| series | Vehicle.series | Vehicle | 100 | Vehicle model series.   |





<a name="com-example-Vehicle-Category"></a>

### Category

Represents a vehicle category. E.g. "Sedan" or "Truck".




| Field | Type | Description |
| ----- | ---- | ----------- |
| code |string|  Category code. E.g. "S".  |
| description |string|  Category name. E.g. "Sedan".  |




 <!-- end nested messages -->

 <!-- end nested enums -->


 <!-- end nested messages -->

 <!-- end nested enums -->


 <!-- end messages -->

<!-- begin file-level enums -->


<a name="com-example-Coolness"></a>

### Coolness



| Name | Number | Description |
| ---- | ------ | ----------- |
| COOLNESS_UNSPECIFIED | 0 |  The coolness is unknown.  |
| COOLNESS_MAX | 1 |  The coolness is maximum.  |


 <!-- end file-level enums -->

<!-- begin file-level extensions -->

<a name="vehicle-proto-extensions"></a>

### Extensions
| Extension | Type | Extension Point | Number | Description |
| --------- | ---- | ---- | ------ | ----------- |
| country | com.example.country | Manufacturer | 100 | Manufacturer country.   |

 <!-- end file-level extensions -->

