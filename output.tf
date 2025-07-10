# This does not make any explicit changes to the configurations,
# It will just give us the ouput endpoint, which means the web link of the website.
# In the termainal, just type "terraform output 'name of the output'" to get the output link.

output "static_website_endpoint" {
  value = aws_s3_bucket_website_configuration.static_website.website_endpoint  
}