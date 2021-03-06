 
SELECT TOP (1000) [YYYY]
      ,[VILLID]
      ,[PP]
      ,[AA]
      ,[TT]
      ,[MM]
      ,[PP_NAME]
      ,[AA_NAME]
      ,[TT_NAME]
      ,[MM_NAME]
      ,[REGION]
      ,[ISSURVEYED]
      ,[HOUSEID]
      ,[HEADID]
      ,[HEADAGE]
      ,[HEADAGEMONTH]
      ,[HEADSEX]
      ,[HHNUMBER]
      ,[NUMMEMBER]
      ,[HAPPINESS]
      ,[EXP_COST]
      ,[EXP_NEEDED]
      ,[EXP_UNNEEDED]
      ,[EXP_DEBT]
      ,[EXP_TOTALCOST]
      ,[EXP_AVGCOST]
      ,[INC_MAIN]
      ,[INC_ALTERNATE]
      ,[INC_OTHER]
      ,[INC_SELF]
      ,[INC_TOTALINCOME]
      ,[INC_AVGINCOME]
  FROM [CRMP1_ADSDT].[dbo].[WIN_PEOPLE_HEAD_จปฐ]


  SELECT TOP 1000 * 
  FROM  [CRMP1_ADSDT].[dbo].[WIN_PEOPLE_HEAD_จปฐ]

  SELECT COUNT(*) AS CNT 
  FROM  [CRMP1_ADSDT].[dbo].[WIN_PEOPLE_HEAD_จปฐ]

  -- 11422526

  SELECT COUNT(*) AS CNT 
  FROM  [CRMP1_ADSDT].[dbo].[WIN_PEOPLE_HEAD_จปฐ]
  WHERE CIF_NUM IS NOT NULL
  --- 8,503,113

  ALTER TABLE [CRMP1_ADSDT].[dbo].[WIN_PEOPLE_HEAD_จปฐ] ADD CIF_NUM BIGINT


  UPDATE [CRMP1_ADSDT].[dbo].[WIN_PEOPLE_HEAD_จปฐ] 
  SET CIF_NUM=ACN
  FROM [CRMP1_ADSDT].[dbo].[WIN_PEOPLE_HEAD_จปฐ] A
  INNER JOIN CRMP1_IMGDT.DBO.ODS_CIF C ON A.HEADID=C.ZCIZID