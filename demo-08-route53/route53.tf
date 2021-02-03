resource "aws_route53_zone" "davor19890806" {
    name = "davor1989080620061108bianca20200622"
}

resource "aws_route53_record" "server1-record" {
    zone_id = aws_route53_zone.davor19890806.zone_id
    name = "freedns1.registrar-servers.com"
    type = "A"
    ttl = 300
    records = ["18.232.140.33"]
}

resource "aws_route53_record" "www-record" {
  zone_id = aws_route53_zone.davor19890806.zone_id
  name = "www.davor19890806bianca20200621.com"
  type = "A"
  ttl = 300
  records = ["18.232.140.33"]
}

output "ns-servers" {
  value = aws_route53_zone.davor19890806.name_servers
}

