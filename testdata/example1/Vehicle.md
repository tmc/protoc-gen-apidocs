# Vehicle.proto

<a name="Vehicle-proto"></a><p align="right"><a href="#top">Top</a></p>







<a name="com-example-Manufacturer"></a>

### Manufacturer

Represents a manufacturer of cars.




| Field | Type | Description |
| ----- | ---- | ----------- |
| id |int32|  The unique manufacturer ID.  |
| code |string|  A manufacturer code, e.g. &#34;DKL4P&#34;.  |
| details |string|  Manufacturer details (minimum orders et.c.).  |
| category |[Manufacturer.Category](#com-example-Manufacturer-Category)| Manufacturer category.   |





 



<a name="com-example-Manufacturer-Category"></a>

### Manufacturer.Category
Manufacturer category. A manufacturer may be either inhouse or external.



| Name | Number | Description |
| ---- | ------ | ----------- |
| CATEGORY_INHOUSE | 0 |  The manufacturer is inhouse.  |
| CATEGORY_EXTERNAL | 1 |  The manufacturer is external.  |


 




<a name="com-example-Model"></a>

### Model

Represents a vehicle model.




| Field | Type | Description |
| ----- | ---- | ----------- |
| id |string|  The unique model ID.  |
| model_code |string|  The car model code, e.g. &#34;PZ003&#34;.  |
| model_name |string|  The car model name, e.g. &#34;Z3&#34;.  |
| daily_hire_rate_dollars |sint32|  Dollars per day.  |
| daily_hire_rate_cents |sint32|  Cents per day.  |





 

 




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

Represents a vehicle category. E.g. &#34;Sedan&#34; or &#34;Truck&#34;.




| Field | Type | Description |
| ----- | ---- | ----------- |
| code |string|  Category code. E.g. &#34;S&#34;.  |
| description |string|  Category name. E.g. &#34;Sedan&#34;.  |





 

 


 

 


 




<a name="com-example-Coolness"></a>

### Coolness



| Name | Number | Description |
| ---- | ------ | ----------- |
| COOLNESS_UNSPECIFIED | 0 |  The coolness is unknown.  |
| COOLNESS_MAX | 1 |  The coolness is maximum.  |


 



<a name="Vehicle-proto-extensions"></a>

### File-level Extensions
| Extension | Type | Base | Number | Description |
| --------- | ---- | ---- | ------ | ----------- |
| country | com.example.country | (none) | 100 | Manufacturer country.   |

 

