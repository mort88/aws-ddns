# aws-ddns
A simple AWS route53 dynamic DNS updater

# DESCRIPTION
A simple script that keeps a (route53) DNS record updated. It first checks if the currently registered IP matches the local IP and updates route53 if they don't match.

# PREREQS
- `python3` with:
- `click`
- `boto3`
- `requests`
- A configured AWS CLI profile that boto3 can use (with correct permissions to modify R53)

# INSTALLATION
Clone the repository and run `install.sh`.  
Edit `/etc/default/aws-ddns`.  
You need to at least add `DDNS_R53_ZONE_ID` and `DDNS_HOSTNAME` for a working setup.  

Example AWS IAM policy:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "R53ddnsRWpermissions",
            "Effect": "Allow",
            "Action": [
                "route53:ChangeResourceRecordSets",
                "route53:ListResourceRecordSets",
                "route53:GetHostedZone"
            ],
            "Resource": "arn:aws:route53:::hostedzone/<R53 zone Id>"
        }
    ]
}
```
