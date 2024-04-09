# Nginx and Logstash Integration Guide

This guide details the setup for integrating Nginx with Logstash to enable logging and data analysis. It covers Nginx configuration for logging in JSON format, Logstash configuration for processing these logs, and running Logstash in a Docker container.

## Configuring Nginx

1. **Nginx Logging Configuration**

   Edit the Nginx configuration to log in JSON format. This configuration enables detailed logging suitable for ingestion by Logstash:

    ```nginx
    http {
        log_format json escape=json '{'
            '"msec": "$msec", '
            '"connection": "$connection", '
            '"connection_requests": "$connection_requests", '
            '"pid": "$pid", '
            '"request_id": "$request_id", '
            '"request_length": "$request_length", '
            '"remote_addr": "$remote_addr", '
            '"remote_user": "$remote_user", '
            '"remote_port": "$remote_port", '
            '"time_local": "$time_local", '
            '"time_iso8601": "$time_iso8601", '
            '"request": "$request", '
            '"request_uri": "$request_uri", '
            '"args": "$args", '
            '"status": "$status", '
            '"body_bytes_sent": "$body_bytes_sent", '
            '"bytes_sent": "$bytes_sent", '
            '"http_referer": "$http_referer", '
            '"http_user_agent": "$http_user_agent", '
            '"http_x_forwarded_for": "$http_x_forwarded_for", '
            '"http_host": "$http_host", '
            '"server_name": "$server_name", '
            '"request_time": "$request_time", '
            '"upstream": "$upstream_addr", '
            '"upstream_connect_time": "$upstream_connect_time", '
            '"upstream_header_time": "$upstream_header_time", '
            '"upstream_response_time": "$upstream_response_time", '
            '"upstream_response_length": "$upstream_response_length", '
            '"upstream_cache_status": "$upstream_cache_status", '
            '"ssl_protocol": "$ssl_protocol", '
            '"ssl_cipher": "$ssl_cipher", '
            '"scheme": "$scheme", '
            '"request_method": "$request_method", '
            '"server_protocol": "$server_protocol", '
            '"pipe": "$pipe", '
            '"gzip_ratio": "$gzip_ratio", '
            '"http_cf_ray": "$http_cf_ray"'
       '}';

        access_log syslog:server=10.98.0.72:5555 json;
    }
    ```

    This configuration formats Nginx logs as JSON and forwards them to Logstash at `10.98.0.72` on port `5555`.

2. **Nginx Server Configuration**

   Configure the Nginx server to serve your application. Here's an example server block:

    ```nginx
    server {
        root /opt/minervakms/frontend;
        index index.html;
        client_max_body_size 10g;
        large_client_header_buffers 4 128k;
        listen 80;
        server_name _;
        #access_log /var/log/nginx/access.log json;
        error_log /var/log/nginx/error.log;
        sendfile on;
        ...
    }
    ```

    Adjust the `root`, `index`, and `server_name` directives according to your application's requirements.

## Configuring Logstash

1. **Logstash Input Configuration**

   Configure Logstash to receive logs from Nginx. Create a file named `nginx.conf` in the Logstash pipeline directory with the following content:

    ```nginx
    
    input {
      syslog {
        port => 5555
        tags => "nginx"
      }
    }
    ...
    ```

    This input configuration listens on port `5555` for syslog messages tagged as "nginx".

2. **Logstash Filter and Output Configuration**

   Process and filter logs as needed, then output them to Elasticsearch:

    ```nginx
    filter{
        json{
            source => "message"
        }
    
        date {
           match  => ["RequestTime","ISO8601"]
        }
    
        mutate {
            remove_field => ["message","timestamp","RequestTime","facility","facility_label","severity","severity_label","priority"]
        }
    }

    output {
      if [program] == "nginx" {
        elasticsearch {
          hosts => [ "http://10.97.0.109:9200" ]
          index => "nginx-index"
        }
      }
    }
    ```

    This configuration filters logs and outputs them to an Elasticsearch instance running at `10.97.0.109` on port `9200`.

## Running Logstash in Docker

Run Logstash within a Docker container, mapping necessary configuration files and setting the heap size:

```bash
docker run -p 5555:5555 -p 10.98.0.72:5555:5555/udp \
  -v /opt/minervakms/logstash/nginx.conf:/usr/share/logstash/pipeline/logstash.conf \
  -v /opt/minervakms/logstash/logstash.yml:/usr/share/logstash/config/logstash.yml \
  -e "LS_HEAP_SIZE=3g" --name logstash --net host logstash:7.17.5