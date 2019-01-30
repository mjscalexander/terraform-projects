aws_profile = "terrafansible"
aws_region  = "us-east-1"
vpc_cidr    = "10.0.0.0/16"
cidrs       = {
  public1  = "10.0.1.0/24"
  public2  = "10.0.2.0/24"
  private1 = "10.0.3.0/24"
  private2 = "10.0.4.0/24"
  rds1     = "10.0.5.0/24"
  rds2     = "10.0.6.0/24"
  rds3     = "10.0.7.0/24"
}
localip    = "174.221.142.147/32" #run "curl canhazip.com" to get ip
domain_name = "learnterraform"
db_instance_class = "db.t2.micro"
dbname = "wdprs_db"
dbuser = "superhero"
dbpassword = "superheropass"
elb_healthy_threshold = "2"
elb_unhealthy_threshold = "2"
elb_timeout = "3"
elb_interval = "30"
dev_instance_type = "t2.micro"
dev_ami = "ami-b73b63a0"
public_key_path = "/root/.ssh/terrafansible.pub"
key_name = "terrafansible"
lc_instance_type = "t2.micro"
asg_max = "2"
asg_min = "1"
asg_hct = "EC2"
asg_grace = "300"
asg_cap = "2"
//delegation_set = "N1HDAZB520Q3IV"





























