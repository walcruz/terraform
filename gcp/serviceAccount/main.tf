provider "google" {
  #credentials = file("ruta/a/tu/archivo-de-credenciales.json") ### Configured by gcloud cli.
  project     = "kubecloud-404510"
  region      = "us-central1"
}