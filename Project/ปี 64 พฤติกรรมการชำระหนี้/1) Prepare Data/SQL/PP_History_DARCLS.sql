 
 /**************  DARCLS 4 YEAR *****************/

SELECT TOP (1000) [MNTH_ID]
      ,[CID]
      ,[TYPE_COL]
      ,[DARCLS]
      ,[STAT_COL]
  FROM [CRMP1_ADSDT].[dbo].[WIN_PB_DARCLS_HISTORY]
  WHERE DARCLS IS NOT NULL

    SELECT MNTH_ID,COUNT(*) AS CNT
    FROM [CRMP1_ADSDT].[dbo].[WIN_PB_DARCLS_HISTORY]
    GROUP BY MNTH_ID ORDER BY MNTH_ID


  
SELECT DISTINCT CID INTO #CIDDARCLS
FROM [CRMP1_ADSDT].[dbo].WIN_PB_PREPARE_DATA
WHERE MNTH_ID=202109

	
	SELECT [MNTH_ID]
	, [CID]
	, DARCLS_CNT
	, DARCLS_AVG
	, DARCLS_1_CNT
	, DARCLS_2_CNT
	, DARCLS_NORMAL_CNT
	, DARCLS_NPL_CNT
	, ROUND((cast(DARCLS_NORMAL_CNT AS decimal(18,2))/cast(DARCLS_CNT AS decimal(18,2)))*100.00,2) AS NORMAL_PERS
	, ROUND((cast(DARCLS_NPL_CNT AS decimal(18,2))/cast(DARCLS_CNT AS decimal(18,2)))*100.00,2) AS NPL_PERS
	INTO [CRMP1_ADSDT].[dbo].[WIN_PB_DARCLS_SUMMARY]
	FROM (
		  SELECT  202109 AS [MNTH_ID]
			  ,A.[CID] 
			  ,COUNT([DARCLS]) AS DARCLS_CNT
			  ,AVG([DARCLS]) AS DARCLS_AVG
			  ,SUM( CASE WHEN DARCLS IN (1) THEN 1 ELSE 0 END) AS DARCLS_1_CNT
			  ,SUM( CASE WHEN DARCLS IN (2) THEN 1 ELSE 0 END) AS DARCLS_2_CNT
			  ,SUM( CASE WHEN DARCLS IN (1,2) THEN 1 ELSE 0 END) AS DARCLS_NORMAL_CNT
			  ,SUM( CASE WHEN DARCLS>=3 THEN 1 ELSE 0 END) AS DARCLS_NPL_CNT 
		  FROM [CRMP1_ADSDT].[dbo].[WIN_PB_DARCLS_HISTORY] A
		  INNER JOIN #CIDDARCLS B ON A.CID=B.CID
		  WHERE DARCLS IS NOT NULL
		  GROUP BY A.[CID] 
		  ) A 

  --- INTO  [CRMP1_ADSDT].[dbo].[WIN_PB_DARCLS_SUMMARY]
  SELECT TOP 100 * FROM [CRMP1_ADSDT].[dbo].[WIN_PB_DARCLS_SUMMARY]

 -- DROP TABLE [CRMP1_ADSDT].[dbo].[WIN_PB_DARCLS_SUMMARY]