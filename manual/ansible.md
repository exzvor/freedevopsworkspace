# Onboarding Clients with Ansible

This guide walks you through the process of onboarding new clients using Ansible. It includes creating encrypted vault files for sensitive data, setting up necessary configurations, and running the playbook.

## Setting Up Ansible Vault for Sensitive Data

1. **Creating an Encrypted Vault**

   Use the `ansible-vault` command to create an encrypted file for storing sensitive information such as database credentials and private registry passwords:

    ```bash
    ansible-vault create vault/clients/onboarding.yml
    ```

   After executing this command, you'll be prompted to create a password for the vault. Once inside the vault file, enter the sensitive data:

    ```yaml
    # Postgres credentials
    postgres_pass: 'xxxxxxx'
    postgres_user: 'user'
    postgres_db: 'your_db'

    # Docker Private Registry credentials
    registry_pass: 'xxxxxxx'
    ```

   Save and close the file. The data is now encrypted and can only be accessed with the vault password.

## Running the Onboarding Playbook

1. **Executing the Playbook**

   With the vault set up and populated with the necessary credentials, you can now run the onboarding playbook. Make sure to replace the placeholders with your actual file paths and names:

    ```bash
    ansible-playbook playbooks/clients/onboarding.yml -i inventory/clients.yaml --ask-vault-pass
    ```

   You'll be prompted to enter the vault password you created earlier. Once authenticated, Ansible will proceed with executing the playbook according to the configurations and tasks defined within it.

## Notes

- Ensure the Ansible Vault password is stored securely and is accessible to those who execute the playbooks.
- Regularly review and update the credentials and configurations within the vault to maintain security and relevance.
- The `--ask-vault-pass` flag prompts for the vault password interactively. For automated environments, consider using `--vault-password-file` or Ansible Tower/AWX for more secure vault password handling.

This guide should streamline the process of securely onboarding new clients using Ansible and Ansible Vault for sensitive data management.
