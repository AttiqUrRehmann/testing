# Use the official R Shiny image as the base
FROM rocker/shiny:latest

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy your app files into the Docker image
WORKDIR /srv/shiny-server
COPY . /srv/shiny-server

# Run setup.R to install R libraries
RUN Rscript setup.R

# Expose the port for the Shiny app
EXPOSE 3838

# Start Shiny server
CMD ["/usr/bin/shiny-server"]