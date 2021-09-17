------------------------------------------------- PART-1 Script --------------------------------------------

DECLARE @Json varchar(max) = '{
	"type": "Feature",
	"geometry": {
		"type": "Point",
		"coordinates": [
			-89.7600464,
			50.474242
		]
	},
	"properties": {
		"rego": "WWI-321-A",
		"sensor": 1,
		"when": "2016-01-01T07:00:00",
		"temp": 3.96
	},
	"comments": "system parameters show normal behaviour"
}'

									------ ISJSON -------
/* is it a valid json? */
SELECT ISJSON(@Json)

									------ JSON_VALUE -------

/* get me the "comments" value from the json */
SELECT JSON_VALUE(@Json, '$.comments')

/* get me the value of the field "type" inside the "geometry" object */
SELECT JSON_VALUE(@Json, '$.geometry.type')

/* get me the first element of array "coordinates" inside the "geometry" object */
SELECT JSON_VALUE(@Json, '$.geometry.coordinates[1]')

/* get me the object "properties" from the json */
--SELECT JSON_VALUE(@Json, 'strict $.properties') -- Error

									------ JSON_QUERY -------
/* get me the object "properties" from the json */
SELECT JSON_QUERY(@Json, 'strict $.properties')

/* get me the array "coordinates" inside the "geometry" object of the json */
SELECT JSON_QUERY(@Json, '$.geometry.coordinates')

									------ JSON_MODIFY -------

/* update "sensor" value from 1 to 2 */
SELECT JSON_MODIFY(@Json, '$.properties.sensor', 2)

/* append another value to an array*/
SELECT JSON_MODIFY(@Json, 'append $.geometry.coordinates', 55.355114)

/* insert a new key value pair */
SELECT JSON_MODIFY(@Json, '$.status', 'ok')

/* delete an existing field */
SELECT JSON_MODIFY(@Json, '$.comments', NULL)

/* rename an existing field */
SELECT JSON_MODIFY(
				JSON_MODIFY(@Json, '$.remarks', JSON_VALUE(@Json, '$.comments'))
				, '$.comments'
				, NULL
				)



									------- USE OF THESE FUNCTIONS IN A TABLE -------

/* update formatting of the field FullSensorData that has JSON values */
SELECT * FROM VehicleTemperatures

UPDATE dbo.VehicleTemperatures
SET FullSensorData = JSON_MODIFY(
							JSON_QUERY(FullSensorData, '$.Recordings[0]')
							, '$.comments'
							, 'system parameters show normal behaviour'
							)

SELECT * FROM VehicleTemperatures

/* get min and max temp reading from sensor 2 */
SELECT  MIN(CAST(JSON_VALUE(FullSensorData, '$.properties.temp') as float)) as MinTemp
	,  MAX(CAST(JSON_VALUE(FullSensorData, '$.properties.temp') as float)) as MaxTemp
FROM dbo.VehicleTemperatures
WHERE CAST(JSON_VALUE(FullSensorData, '$.properties.sensor') as tinyint) = 2

/* get avg temp reading from both sensors 1 and 2 */
SELECT JSON_VALUE(FullSensorData, '$.properties.sensor') as SensorNo
	,	AVG(CAST(JSON_VALUE(FullSensorData, '$.properties.temp') as float)) as AverageTemp
FROM dbo.VehicleTemperatures
GROUP BY JSON_VALUE(FullSensorData, '$.properties.sensor')

------------------------------------------------- End of PART-1 --------------------------------------------



------------------------------------------------- PART-2 Script --------------------------------------------

										--------- OPENJSON -----------

DECLARE @Json_value varchar(max) = '{
	"type": "Feature",
	"geometry": {
		"type": "Point",
		"coordinates": [
			-89.7600464,
			50.474242
		]
	},
	"properties": {
		"rego": "WWI-321-A",
		"sensor": 1,
		"when": "2016-01-01T07:00:00",
		"temp": 3.96
	},
	"comments": "system parameters show normal behavior"
}'

/* Auto parse JSON  */
SELECT *
FROM OPENJSON(@Json_value)

/* Auto parse JSON  */
SELECT *
FROM OPENJSON(@Json_value, '$.geometry')

/* Parse JSON as per the defined Schema */
SELECT *
FROM OPENJSON(@Json_value)
WITH (
		sensor		tinyint '$.properties.sensor',
		capture_date datetime '$.properties.when',
		temperature float '$.properties.temp',
		coordinates_x float '$.geometry.coordinates[0]',
		coordinates_y float '$.geometry.coordinates[1]'
	 )

/* Parse only the "properties" object with in the json */
SELECT *
FROM OPENJSON(@Json_value, '$.properties')
WITH (
		rego		varchar(20) '$.rego',
		sensor		tinyint '$.sensor',
		capture_date datetime '$.when',
		temperature float '$.temp'
	 )


										--------- FOR JSON -----------

/* Convert selected columns from Customers table into JSON where CustomerID = 1 */
SELECT CustomerName, AccountOpenedDate, PhoneNumber, DeliveryAddressLine1, DeliveryAddressLine2, DeliveryPostalCode, ValidFrom, ValidTo
FROM dbo.Customers
WHERE CustomerID = 1
FOR JSON AUTO

/* Use PATH mode to add more control on how JSON should be formatted. Data related to Address is combined into the "Address" object */
SELECT CustomerName, AccountOpenedDate, PhoneNumber
		, DeliveryAddressLine1 as 'Address.AddressLine1', DeliveryAddressLine2 as 'Address.AddressLine2'
		, DeliveryPostalCode 'Address.PostalCode', ValidFrom, ValidTo
FROM dbo.Customers
WHERE CustomerID = 1
FOR JSON PATH

/* Adding the WITHOUT_ARRAY_WRAPPER option if there is only one root element i.e just converting one row into JSON */
SELECT CustomerName, AccountOpenedDate, PhoneNumber
		, DeliveryAddressLine1 as 'Address.AddressLine1', DeliveryAddressLine2 as 'Address.AddressLine2'
		, DeliveryPostalCode 'Address.PostalCode', ValidFrom, ValidTo
FROM dbo.Customers
WHERE CustomerID = 1
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER

/* Adding the ROOT (top level) element into the new-formed JSON */
SELECT CustomerName, AccountOpenedDate, PhoneNumber
		, DeliveryAddressLine1 as 'Address.AddressLine1', DeliveryAddressLine2 as 'Address.AddressLine2'
		, DeliveryPostalCode 'Address.PostalCode', ValidFrom, ValidTo
FROM dbo.Customers
WHERE CustomerID in (1,2)
FOR JSON PATH, ROOT('CustomerInfo')


/* Convert each row of a table to JSON and join it back with the original table */
DECLARE @NewJson NVARCHAR(MAX)
SELECT @NewJson = (SELECT CustomerID, CustomerName, AccountOpenedDate, PhoneNumber
		, DeliveryAddressLine1 as 'Address.AddressLine1', DeliveryAddressLine2 as 'Address.AddressLine2'
		, DeliveryPostalCode 'Address.PostalCode', ValidFrom, ValidTo
FROM dbo.Customers
FOR JSON PATH, ROOT('CustomerInfo'))

--SELECT * FROM OPENJSON(@NewJson, '$.CustomerInfo')

SELECT J.value AS JsonValue, CustomerID, CustomerName, AccountOpenedDate, PhoneNumber, DeliveryAddressLine1, DeliveryAddressLine2
		, DeliveryPostalCode, ValidFrom, ValidTo
INTO dbo.Customer_New
FROM dbo.Customers C
JOIN OPENJSON(@NewJson, '$.CustomerInfo') J ON JSON_VALUE(J.value, '$.CustomerID') = C.CustomerID

SELECT * FROM dbo.Customer_New


------------------------------------------------- End of PART-2 --------------------------------------------
