---
title: com.example.proto3
description: API Specification for the com.example.proto3 package.
---

<a name="field_presence-proto"></a><p align="right"><a href="#top">Top</a></p>

<!-- begin services -->

<!-- begin services -->



<a name="com-example-proto3-MyMessage"></a>

### MyMessage





| Field | Type | Description |
| ----- | ---- | ----------- |
| not_tracked |int32|   |
| tracked (optional) |int32| Explicit presence   |




 <!-- end nested messages -->

 <!-- end nested enums -->




<a name="com-example-proto3-AnotherMessage"></a>

### AnotherMessage





| Field | Type | Description |
| ----- | ---- | ----------- |
| id |int32|   |
|<tr><td colspan=2>Union field `payload`.   `payload` can be only one of the following:</td></tr>|
| my_message |[MyMessage](#com-example-proto3-MyMessage)|   |
| my_string |string|   |





 <!-- end nested messages -->

 <!-- end nested enums -->


 <!-- end messages -->

<!-- begin file-level enums -->
 <!-- end file-level enums -->

<!-- begin file-level extensions -->
 <!-- end file-level extensions -->

