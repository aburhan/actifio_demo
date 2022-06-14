# The name of this view in Looker is "Actifio Stats"
view: actifio_stats {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `actifio_reports.actifio_stats`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: _partitiondate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONDATE ;;
  }

  dimension_group: _partitiontime {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._PARTITIONTIME ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "App ID" in Explore.

  dimension: app_id {
    type: number
    sql: ${TABLE}.AppID ;;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}.AppName ;;
  }

  dimension: app_size_gb_ {
    type: number
    sql: ${TABLE}.AppSize_GB_ ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_app_size_gb_ {
    type: sum
    sql: ${app_size_gb_} ;;
  }

  measure: average_app_size_gb_ {
    type: average
    sql: ${app_size_gb_} ;;
  }

  dimension: bytes_read_mb_ {
    type: number
    sql: ${TABLE}.BytesRead_MB_ ;;
  }

  dimension: data_copied_mb_ {
    type: number
    sql: ${TABLE}.DataCopied_MB_ ;;
  }

  dimension: duration {
    type: string
    sql: ${TABLE}.Duration ;;
  }

  dimension: host_name {
    type: string
    sql: ${TABLE}.HostName ;;
  }

  dimension: job_class {
    type: string
    sql: ${TABLE}.JobClass ;;
  }

  dimension: job_name {
    type: string
    sql: ${TABLE}.JobName ;;
  }

  dimension: policy_name {
    type: string
    sql: ${TABLE}.PolicyName ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.StartDate ;;
  }

  dimension: total_sent_mb_ {
    type: number
    sql: ${TABLE}.TotalSent_MB_ ;;
  }

  dimension: virt_size_gb_ {
    type: number
    sql: ${TABLE}.VirtSize_GB_ ;;
  }

  dimension: wrote_local_mb_ {
    type: number
    sql: ${TABLE}.WroteLocal_MB_ ;;
  }

  measure: count {
    type: count
    drill_fields: [job_name, app_name, policy_name, host_name]
  }
}
