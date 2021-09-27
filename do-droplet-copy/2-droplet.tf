resource "digitalocean_droplet" "terraform-droplet" {
  image              = "ubuntu-20-04-x64"
  name               = "terraform-droplet"
  region             = "fra1"
  size               = "s-2vcpu-4gb"
  private_networking = true
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.pvt_key)
    timeout     = "2m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update",
      "sudo curl https://releases.rancher.com/install-docker/19.03.sh | sh",
      "wget https://github.com/alexellis/arkade/releases/download/0.7.12/arkade",
      "wget https://github.com/wercker/stern/releases/download/1.11.0/stern_linux_amd64 -O stern",
      "wget -qO- https://github.com/derailed/k9s/releases/download/v0.24.7/k9s_Linux_x86_64.tar.gz | tar -xvz k9s",
      "chmod a+x arkade",
      "chmod a+x stern",
      "./arkade get helm",
      "export PATH=$PATH:$HOME/.arkade/bin/ && source ~/.bashrc",
      "alias k=kubectl",
      "curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC='--disable=traefik' sh -",
      "cp /etc/rancher/k3s/k3s.yaml ~/.kube/config",
      "kubectl create namespace cattle-system",
      "kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.0.4/cert-manager.crds.yaml",
      "helm repo add jetstack https://charts.jetstack.io",
      "helm repo add rancher-stable https://releases.rancher.com/server-charts/stable",
      "helm repo update",
      "helm install cert-manager jetstack/cert-manager --namespace cert-manager   --version v1.0.4   --create-namespace",
      "helm install rancher rancher-stable/rancher   --namespace cattle-system   --set hostname=knowledgecenter.site --create-namespace"
    ]
  }
}