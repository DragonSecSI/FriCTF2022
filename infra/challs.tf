# PWN
module "chall_pwn_sea_shell" {
  source = "./modules/challs/pwn"

  name = "sea-shell"
  ip   = azurerm_public_ip.challs_pwn.ip_address
  port = 13370

  k8s_namespace = "default"
  k8s_image = "frictf2022.azurecr.io/challs/sea-shell:latest"
  k8s_registry_secret = kubernetes_secret.acr.metadata.0.name
}

module "chall_pwn_segfault_handler" {
  source = "./modules/challs/pwn"

  name = "segfault-handler"
  ip   = azurerm_public_ip.challs_pwn.ip_address
  port = 13371

  k8s_namespace = "default"
  k8s_image = "frictf2022.azurecr.io/challs/segfault-handler:latest"
  k8s_registry_secret = kubernetes_secret.acr.metadata.0.name
}

module "chall_pwn_pop_rdi" {
  source = "./modules/challs/pwn"

  name = "pop-rdi"
  ip   = azurerm_public_ip.challs_pwn.ip_address
  port = 13372

  k8s_namespace = "default"
  k8s_image = "frictf2022.azurecr.io/challs/pop-rdi:latest"
  k8s_registry_secret = kubernetes_secret.acr.metadata.0.name
}

module "chall_pwn_ret2win" {
  source = "./modules/challs/pwn"

  name = "ret2win"
  ip   = azurerm_public_ip.challs_pwn.ip_address
  port = 13373

  k8s_namespace = "default"
  k8s_image = "frictf2022.azurecr.io/challs/ret2win:latest"
  k8s_registry_secret = kubernetes_secret.acr.metadata.0.name
}

# REV
module "chall_rev_jswhat" {
  source = "./modules/challs/web_www-data"

  name = "jswhat"
  hostname = "jswhat.frictf.dragonsec.si"

  k8s_namespace = "default"
  k8s_image = "frictf2022.azurecr.io/challs/jswhat:latest"
  k8s_registry_secret = kubernetes_secret.acr.metadata.0.name
}

# WEB
#module "chall_web_burp_demo" {
#  source = "./modules/challs/web_raw"
#  ip = azurerm_public_ip.challs_web_path.ip_address
#
#  name = "burp"
#  hostname = "burp.frictf.dragonsec.si"
#
#  k8s_namespace = "default"
#  k8s_image = "frictf2022.azurecr.io/challs/web-burp-demo:latest"
#  k8s_registry_secret = kubernetes_secret.acr.metadata.0.name
#}

module "chall_web_legit" {
  source = "./modules/challs/web_www-data"

  name = "legit"
  hostname = "legit.frictf.dragonsec.si"

  k8s_namespace = "default"
  k8s_image = "frictf2022.azurecr.io/challs/legit:latest"
  k8s_registry_secret = kubernetes_secret.acr.metadata.0.name
}

module "chall_web_just_werify_it" {
  source = "./modules/challs/web"

  name = "just-werify-it"
  hostname = "just-werify-it.frictf.dragonsec.si"

  k8s_namespace = "default"
  k8s_image = "frictf2022.azurecr.io/challs/just-werify-it:latest"
  k8s_registry_secret = kubernetes_secret.acr.metadata.0.name
}

module "chall_web_xxxs" {
  source = "./modules/challs/bot"

  name = "xxxs"
  hostname = "xxxs.frictf.dragonsec.si"

  k8s_namespace = "default"
  k8s_image = "frictf2022.azurecr.io/challs/xxxs:latest"
  k8s_image_bot = "frictf2022.azurecr.io/challs/xxxs-bot:latest"
  k8s_registry_secret = kubernetes_secret.acr.metadata.0.name
}

# SSH
module "chall_ssh_suspicious_traffic_two" {
  source = "./modules/challs/ssh"

  name = "suspicious-traffic-two"
  ip   = azurerm_public_ip.challs_pwn.ip_address
  port = 2222

  k8s_namespace = "default"
  k8s_image = "frictf2022.azurecr.io/challs/suspicious-traffic-two:latest"
  k8s_registry_secret = kubernetes_secret.acr.metadata.0.name
}
