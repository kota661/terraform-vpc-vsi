terraform {
  required_version = ">= 1.8.0"
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">=1.65.0"
    }
  }
}
