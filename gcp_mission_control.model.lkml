connection: "gap-demo"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: bigquery_data_access {
  view_label: "BigQuery Data Access"
  label: "BigQuery Data Access Logs"

  always_filter: {
    filters: {
      field: bigquery_data_access_protopayload_auditlog.service_name
      value: "bigquery.googleapis.com"
    }
    filters: {
      field: bigquery_data_access_protopayload_auditlog.method_name
      value: "jobservice.jobcompleted"
    }
    filters: {
      field: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event.event_name
      value: "query_job_completed"
    }
  }

  join: bigquery_data_access_protopayload_auditlog {
    view_label: "BigQuery Data Access"
    sql: LEFT JOIN UNNEST([${bigquery_data_access.protopayload_auditlog}]) as bigquery_data_access_protopayload_auditlog ;;
    relationship: one_to_one
  }

  join: bigquery_data_access_resource {
    view_label: "BigQuery Data Access: Resource"
    sql: LEFT JOIN UNNEST([${bigquery_data_access.resource}]) AS bigquery_data_access_resource ;;
    relationship: one_to_one
  }

  join: bigquery_data_access_resource_labels {
    view_label: "BigQuery Data Access: Resource Labels"
    sql: LEFT JOIN UNNEST([${bigquery_data_access_resource.labels}]) as bigquery_data_access_resource_labels ;;
    relationship: one_to_one
  }

  join: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery {
    view_label: "BigQuery Data Access: Service Data"
    sql: LEFT JOIN UNNEST([${bigquery_data_access_protopayload_auditlog.servicedata_v1_bigquery}]) AS bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery;;
    relationship: one_to_one
  }

  join: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event {
    view_label: "BigQuery Data Access: Query Data"
    sql: LEFT JOIN UNNEST([${bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery.job_completed_event}]) AS bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event ;;
    relationship: one_to_one
  }

  join: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job {
    view_label: "BigQuery Data Access: Query Data"
    sql: LEFT JOIN UNNEST([${bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event.job}]) AS bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job ;;
    relationship: one_to_one
  }

  join: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_statistics {
    view_label: "BigQuery Data Access: Query Statistics"
    sql: LEFT JOIN UNNEST([${bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job.job_statistics}]) AS bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_statistics ;;
    relationship: one_to_one
  }

  join: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_configuration {
    view_label: "BigQuery Data Access: Config"
    sql: LEFT JOIN UNNEST([${bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job.job_configuration}]) AS bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_configuration ;;
    relationship: one_to_one
  }

  join: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_configuration_query {
    view_label: "BigQuery Data Access: Query"
    sql: LEFT JOIN UNNEST([${bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_configuration.query}]) AS bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_configuration_query ;;
    relationship: one_to_one
  }

  join: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_configuration_query_destination_table {
    view_label: "BigQuery Data Access: Query"
    sql: LEFT JOIN UNNEST([${bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_configuration_query.destination_table}]) AS bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_configuration_query_destination_table ;;
    relationship: one_to_one
  }

  join: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_status {
    view_label: "BigQuery Data Access: Status"
    sql: LEFT JOIN UNNEST([${bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job.job_status}]) AS bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_status ;;
    relationship: one_to_one
  }

  join: bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_status_error {
    view_label: "BigQuery Data Access: Status"
    sql: LEFT JOIN UNNEST([${bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_status.error}]) AS bigquery_data_access_protopayload_auditlog_servicedata_v1_bigquery_job_completed_event_job_job_status_error ;;
    relationship: one_to_one
  }

  join: bigquery_data_access_protopayload_auditlog_authentication_info {
    view_label: "BigQuery Data Access"
    sql: LEFT JOIN UNNEST([${bigquery_data_access_protopayload_auditlog.authentication_info}]) AS bigquery_data_access_protopayload_auditlog_authentication_info ;;
    relationship: one_to_one
  }
}

explore: gcp_billing_export {
  view_label: "GCP Billing"
  label: "GCP Billing"

  join: gcp_billing_export_project {
    view_label: "GCP Project"
    sql: LEFT JOIN UNNEST([${gcp_billing_export.project}]) AS gcp_billing_export_project ;;
    relationship: one_to_one
  }

  join: gcp_billing_export_usage {
    view_label: "GCP Usage"
    sql: LEFT JOIN UNNEST([${gcp_billing_export.usage}]) AS gcp_billing_export_usage ;;
    relationship: one_to_one
  }
}
