[![RAZRLAB](https://img.shields.io/badge/company-razrlab-blue)](https://razrlab.com)

# TITAN MQTT Broker

A quick starter using docker-compose to get started with a customized instance of Eclipse-Mosquitto.

## Usage/Examples

For TLS based communication we will first need to generate certificates. There are scripts to assistance you in this process.

1. Generate CA and server Certificate

   ```bash
   ./scripts/generate_server_ca_certs.sh
   ```

   You'll be prompted to enter a specific CN for the ceriticates. Use a DNS name.

1. Generate Client Certificate

   ```bash
   ./scripts/generate_client_certs.sh
   ```

   You'll be prompted to enter a specific CN, which will be used to identify the client keys with.

1. Generate password file

   ```bash
   ./scripts/set_password.sh
   ```

## Tech Stack

**Server:** Eclipse-Mosquitto, Docker, docker-compose
