name: "Ansible Playbook Execution on Amazon Linux 2 with app XXX"
description: "This is a sample component that demonstrates how to download and execute an Ansible playbook against Amazon Linux 2."
schemaVersion: 1.0
phases:
  - name: build
    steps:
      - name: InstallAnsible
        action: ExecuteBash
        inputs:
          commands:
            - sudo amazon-linux-extras install -y ansible2
      - name: DownloadPlaybook
        action: S3Download
        inputs:
          - source: "s3://${bucket_name}/${key}/*"
            destination: "/tmp/"
