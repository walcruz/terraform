locals {
  common_tags = map(
      "createdby", "unity-terraform",
      "role", "control",
      "family", var.familyName,
      "country", var.country
  )
}

provider "aws" {

}

provider "aws" {
  alias = "certificates"
  region  = var.certificatesRegion
  #profile = var.profile
}