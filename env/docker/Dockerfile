# This Dockerfile attempts to install dependencies, run the tests and build the pocket-core binary
# The result of this Dockerfile will put the pocket-core executable in the $GOBIN/bin, which in turn
# is part of the $PATH

# Dynamically pull Go-lang version for the image
ARG GOLANG_IMAGE_VERSION=golang:1.16-alpine

# First build step to build the app binary
FROM ${GOLANG_IMAGE_VERSION} AS builder

# Install dependencies
RUN apk -v --update --no-cache add \
	curl \
	git \
	groff \
	less \
	mailcap \
	gcc \
	libc-dev \
	bash && \
	rm /var/cache/apk/* || true

# Environment and system dependencies setup
ENV POCKET_PATH=/go/src/github.com/pokt-network/pocket-core/
ENV GO111MODULE="on"

# Create node root directory
RUN mkdir -p ${POCKET_PATH}
WORKDIR $POCKET_PATH

# Creating the BRANCH_NAME variable
#ARG BRANCH_NAME="experimental/tm33.7"
ARG BRANCH_NAME="RC-0.6.3"

# Copying deps sh to tmp folder
COPY deps.sh /tmp/

# Clone the repository
#COPY pocket-core ${POCKET_PATH}
RUN git clone --branch ${BRANCH_NAME} https://github.com/pokt-network/pocket-core.git ${POCKET_PATH}

# Install rest of source code
COPY . .

# Run tests
# As the tests were removed recently for the fact that most of them were broken, I commented this line,
# It should be uncommented as soon as the new tests are available.
#RUN go test ./tests/...

# Install project dependencies and builds the binary
#RUN go build -mod=vendor -o ${GOBIN}/bin/pocket-core ./app/cmd/pocket_core/main.go
RUN go build -o ${GOBIN}/bin/pocket-core ./app/cmd/pocket_core/main.go

# Second build step: reduce image size to only use app binary

FROM ${GOLANG_IMAGE_VERSION} AS debugger 

COPY --from=builder /bin/pocket-core /bin/pocket-core
COPY entrypoint.sh /tmp/
COPY command.sh /tmp/
RUN apk add --update --no-cache expect bash
# Create app user and add permissions
RUN addgroup -S app \
	&& adduser -S -G app app
RUN mv /tmp/entrypoint.sh /home/app/ && mv /tmp/command.sh /home/app/command.sh
RUN chown -R app /bin/pocket-core
RUN mkdir -p /home/app/.pocket/config
RUN chown -R app /home/app/.pocket
USER app

# Setup the WORKDIR with app user
ENTRYPOINT ["/home/app/entrypoint.sh"]
