variable "ami" {
  description = "AWS AMI 64 bits to be used "
  default     = "ami-0574da719dca65348"
}

variable "instance_type" {
  description = "AWS Instance type defines the hardware configuration of the machine "
  default     = "t2.micro"

}
