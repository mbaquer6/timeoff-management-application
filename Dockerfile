# -------------------------------------------------------------------
# Minimal dockerfile from alpine base
#
# Instructions:
# =============
# 1. Create an empty directory and copy this file into it.
#
# 2. Create image with: 
#	docker build --tag timeoff:latest .
#
# 3. Run with: 
#	docker run -d -p 3000:3000 --name alpine_timeoff timeoff
#
# 4. Login to running container (to update config (vi config/app.json): 
#	docker exec -ti --user root alpine_timeoff /bin/sh
# --------------------------------------------------------------------
FROM 919549532909.dkr.ecr.us-east-1.amazonaws.com/alpine:3.15

EXPOSE 3000

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.docker.cmd="docker run -d -p 3000:3000 --name alpine_timeoff"

RUN apk add --no-cache \
    git \
    make \
    nodejs npm \
    python3 \
    vim

RUN adduser --system app --home /app
USER app
WORKDIR /app
RUN git clone https://github.com/mbaquer6/timeoff-management-application.git timeoff-management
WORKDIR /app/timeoff-management

RUN npm install --only=production

CMD npm start
