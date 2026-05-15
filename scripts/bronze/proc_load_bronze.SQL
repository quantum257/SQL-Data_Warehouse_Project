EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS

BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME
	BEGIN TRY 

SET @start_time =GETDATE()
TRUNCATE TABLE bronze.crm_cust_info
BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\ssmsd\Desktop\DATA_WAREHOUSE\cust_info.csv'
WITH  (   
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
)
SET @end_time =GETDATE()
PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'

SET @start_time =GETDATE()
TRUNCATE TABLE bronze.crm_prd_info
BULK INSERT bronze.crm_prd_info
FROM 'C:\Users\ssmsd\Desktop\DATA_WAREHOUSE\prd_info.csv'
WITH  (   
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
)
SET @end_time =GETDATE()
PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'

SET @start_time = GETDATE()
TRUNCATE TABLE bronze.crm_sales_details
BULK INSERT bronze.crm_sales_details
FROM 'C:\Users\ssmsd\Desktop\DATA_WAREHOUSE\sales_details.csv'
WITH  (   
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
)
SET @end_time =GETDATE()
PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'

SET @start_time = GETDATE()
TRUNCATE TABLE bronze.erp_loc_a101
BULK INSERT bronze.erp_loc_a101
FROM 'C:\Users\ssmsd\Desktop\DATA_WAREHOUSE\LOC_A101.csv'
WITH  (   
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
)
SET @end_time =GETDATE()
PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'

SET @start_time = GETDATE()
TRUNCATE TABLE bronze.erp_cust_az12
BULK INSERT bronze.erp_cust_az12
FROM 'C:\Users\ssmsd\Desktop\DATA_WAREHOUSE\CUST_AZ12.csv'
WITH  (   
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
)
SET @end_time =GETDATE()
PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'

SET @start_time = GETDATE()
TRUNCATE TABLE bronze.erp_px_cat_g1v2
BULK INSERT bronze.erp_px_cat_g1v2
FROM 'C:\Users\ssmsd\Desktop\DATA_WAREHOUSE\PX_CAT_G1V2.csv'
WITH  (   
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
)
SET @end_time =GETDATE()
PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'


SET @end_time =GETDATE()
PRINT 'bronze layer Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds'
	END TRY 
	BEGIN CATCH 
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
	END CATCH 
END
