#Change Table Name
ALTER TABLE ces_capstone_1793035317728
RENAME TO ces_capstone;

#Count of observations
SELECT COUNT(*)
FROM ces_capstone;

#Summary statistics and Count
SELECT
  COUNT(*) AS total_rows,
  COUNT(HOUSB) AS total_valid_observations,
  MIN(HOUSB) AS Minimum_Housing_Burden,
  MAX(HOUSB) AS Maximum_Housing_Burden,
  AVG(HOUSB) AS avg_burden,
  SUM(CASE WHEN HOUSB < 0 THEN 1
      ELSE 0
    END
  ) AS below_zero,
  SUM( CASE WHEN HOUSB > 1 THEN 1
      ELSE 0
    END
  ) AS above_one
FROM
  ces_capstone;

#Count and averages
SELECT
  CUTENURE,
  COUNT(*) AS row_count,
  AVG(HOUSB) AS avg_housing_burden,
  AVG(AdjHLTHINPQ) AS avg_adjHealth,
  AVG(AdjVEHINSPQ) AS avg_adjVehicle,
  AVG(AdjPERINSPQ) AS avg_adjPersonal,
  AVG(AdjLIFINSPQ) AS avg_adjLife
FROM ces_capstone
GROUP BY CUTENURE
ORDER BY CUTENURE;

#Count and averages by quarter
SELECT
  QSQ118,
  COUNT(*) AS row_count,
  AVG(HOUSB) AS avg_housing_burden,
  AVG(AdjHLTHINPQ) AS avg_adjHealth,
  AVG(AdjVEHINSPQ) AS avg_adjVehicle,
  AVG(AdjPERINSPQ) AS avg_adjPersonal,
  AVG(AdjLIFINSPQ) AS avg_adjLife
FROM ces_capstone
GROUP BY QSQ118
ORDER BY QSQ118;

#Count and averages by housing tenure (unadjusted)
SELECT
  CUTENURE,
  COUNT(*) AS row_count,
  AVG(HOUSB) AS avg_housing_burden,
  AVG(HLTHINPQ) AS avg_Health,
  AVG(VEHINSPQ) AS avg_Vehicle,
  AVG(PERINSPQ) AS avg_Personal,
  AVG(LIFINSPQ) AS avg_Life
FROM ces_capstone
GROUP BY CUTENURE
ORDER BY CUTENURE;

#Count and averages by quarter (unajusted expenditures)
SELECT
  QSQ118,
  COUNT(*) AS row_count,
  AVG(HOUSB) AS avg_housing_burden,
  AVG(HLTHINPQ) AS avg_Health,
  AVG(VEHINSPQ) AS avg_Vehicle,
  AVG(PERINSPQ) AS avg_Personal,
  AVG(LIFINSPQ) AS avg_Life
FROM ces_capstone
GROUP BY QSQ118
ORDER BY QSQ118;

#Averages with housing burden groups
SELECT
  CASE
    WHEN HOUSB < 0
    OR HOUSB > 1 THEN 'Review'
    WHEN HOUSB < 0.30 THEN 'Lower burden'
    WHEN HOUSB < 0.50 THEN 'Moderate burden'
    WHEN HOUSB <= 1 THEN 'Higher burden'
    ELSE 'Review'
  END AS burden_band,
  COUNT(*) AS N,
  AVG(HOUSB) AS avg_housb,
  AVG(AdjVEHINSPQ) AS mean_vehicle_insurance,
  AVG(AdjLIFINSPQ) AS mean_life_insurance,
  AVG(AdjPERINSPQ) AS mean_personal_insurance,
  AVG(AdjHLTHINPQ) AS mean_health_insurance
FROM ces_capstone
GROUP BY
  CASE
    WHEN HOUSB < 0
    OR HOUSB > 1 THEN 'Review'
    WHEN HOUSB < 0.30 THEN 'Lower burden'
    WHEN HOUSB < 0.50 THEN 'Moderate burden'
    WHEN HOUSB <= 1 THEN 'Higher burden'
    ELSE 'Review'
  END;

#Averages by State
SELECT
  STATE,
  COUNT(*) AS N,
  AVG(HOUSB) AS avg_housb,
  AVG(VEHINSPQ) AS mean_vehicle_insurance,
  AVG(LIFINSPQ) AS mean_life_insurance,
  AVG(PERINSPQ) AS mean_personal_insurance,
  AVG(HLTHINPQ) AS mean_health_insurance
FROM ces_capstone
GROUP BY STATE,
ORDER BY STATE;

#Averages by STATE (adjusted expenditures)
SELECT
  STATE,
  COUNT(*) AS N,
  AVG(HOUSB) AS avg_housb,
  AVG(AdjVEHINSPQ) AS mean_adjvehicle_insurance,
  AVG(AdjLIFINSPQ) AS mean_adjlife_insurance,
  AVG(AdjPERINSPQ) AS mean_adjpersonal_insurance,
  AVG(AdjHLTHINPQ) AS mean_adjhealth_insurance
FROM ces_capstone
GROUP BY STATE,
ORDER BY STATE;
