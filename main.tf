/******************************************
 Resource Group
 *****************************************/
data "ibm_resource_group" "this" {
  name = var.resource_group_name
}


/******************************************
 Project
 *****************************************/
resource "ibm_code_engine_project" "this" {
  name              = var.ce_project_name
  resource_group_id = data.ibm_resource_group.this.id
}

// data "ibm_code_engine_project" "code_engine_project" {
//     id = "15314cc3-85b4-4338-903f-c28cdee6d005"
// }


/******************************************
 App
 *****************************************/
resource "ibm_code_engine_app" "this" {
  image_port      = 8080
  image_reference = "icr.io/codeengine/helloworld"
  # image_secret = "my-secret"
  managed_domain_mappings = "local_public" # (local_public, local_private, local)
  name                    = "my-app"
  project_id              = ibm_code_engine_project.this.id
  # project_id = ibm_code_engine_project.this.id
  # # run_as_user = 1001
  # run_env_variables {
  #   key = "MY_VARIABLE"
  #   name = "SOME"
  #   prefix = "PREFIX_"
  #   reference = "my-secret"
  #   type = "literal"
  #   value = "VALUE"
  # }
  # run_service_account = "default"
  # run_volume_mounts {
  #   mount_path = "/app"
  #   name = "codeengine-mount-b69u90"
  #   reference = "my-secret"
  #   type = "secret"
  # }
  # scale_concurrency = 100
  # scale_concurrency_target = 80
  # scale_cpu_limit = "1"
  # scale_ephemeral_storage_limit = "4G"
  # scale_initial_instances = 1
  # scale_max_instances = 10
  # scale_memory_limit = "4G"
  # scale_min_instances = 1
  # scale_request_timeout = 300
}
