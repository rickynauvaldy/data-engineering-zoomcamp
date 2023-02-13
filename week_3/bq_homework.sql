SELECT count(*) FROM `zoomcamp-376315.trips_data_all.fhv_tripdata`;

SELECT count(*) FROM `zoomcamp-376315.trips_data_all.fhv_tripdata_materialized`;

CREATE OR REPLACE TABLE `zoomcamp-376315.trips_data_all.fhv_tripdata_partitioned`
PARTITION BY DATE(pickup_datetime)
CLUSTER BY affiliated_base_number AS (
  SELECT * FROM `zoomcamp-376315.trips_data_all.fhv_tripdata_materialized`
);

select count(*) FROM `zoomcamp-376315.trips_data_all.fhv_tripdata` where PUlocationID is null and DOlocationID is null;

SELECT count(*) FROM `zoomcamp-376315.trips_data_all.fhv_tripdata_partitioned`;

SELECT count(distinct Affiliated_base_number) FROM  `zoomcamp-376315.trips_data_all.fhv_tripdata_materialized`
WHERE pickup_datetime BETWEEN '2019-03-01' AND '2019-03-31';

SELECT count(distinct Affiliated_base_number) FROM  `zoomcamp-376315.trips_data_all.fhv_tripdata_partitioned`
WHERE pickup_datetime BETWEEN '2019-03-01' AND '2019-03-31';