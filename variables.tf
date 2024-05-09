variable "region" {
  type        = string
  description = "Region"
  default     = "jp-osa"
}

variable "zone" {
  default     = "jp-osa-1"
  description = "VSIを配置するゾーン名: us-south-1"
}

variable "resource_group_name" {
  type        = string
  default     = "default"
  description = "Resource Group名"
}

variable "tags" {
  description = "tags"
  default     = ["tf"]
  type        = list(string)
}


/******************************************
 Network
 *****************************************/
variable "vpc_name" {
  description = "VSIを配置するVPC名"
}


variable "subnet_id" {
  description = "VSIを配置するサブネットID: 0727-xxxxxxxx"
}

variable "floating_ip" {
  description = "floating_ipの割当を行うか。: true, false"
  type        = bool
  default     = false
}

/******************************************
 Instance
 *****************************************/
variable "instance_name" {
  description = "インスタンス名"
}

variable "vsi_image_name" {
  description = "イメージ名 "
  default     = "ibm-ubuntu-24-04-minimal-amd64-1"
}

variable "profile" {
  description = "bx2-2x8, bx2-4x16, bx2-8x32"
  default     = "bx2-2x8"
}

/******************************************
 Credential
 *****************************************/
variable "ssh_key_names" {
  description = "登録済みのssh keyの名前"
  type        = list(string)
}

/******************************************
 Firewall
 *****************************************/
variable "security_groups" {
  description = "適用するセキュリティグループ"
  type        = map(string)
  default     = {}
}
