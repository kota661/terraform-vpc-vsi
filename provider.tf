/******************************************
 IBM Cloud Provider
 ref. https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs

 認証情報は環境変数を利用
 export IC_API_KEY="ibmcloud_api_key"
 export IAAS_CLASSIC_USERNAME="iaas_classic_username"
 export IAAS_CLASSIC_API_KEY="iaas_classic_api_key"
 terraform plan
 *****************************************/
provider "ibm" {
  # Credential
  # ibmcloud_api_key = ""

  # Regsion, Vpc
  region = var.region
}
