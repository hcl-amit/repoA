FROM hashicorp/terraform:1.10 AS terraform
FROM ghcr.io/terraform-linters/tflint:v0.55.0 AS tflint
FROM aquasecurity/trivy:0.53.0 AS trivy
FROM openpolicyagent/opa:1.1.0-static AS opa



FROM alpine:3.20
LABEL maintainer="DevOps Team" \
      description="Production image containing Terraform, Git, TFLint, TFSec, OPA, and Trivy."

RUN apk add --no-cache \
    git \
    openssh-client \
    ca-certificates \
    curl \
    bash \
    jq

COPY --from=terraform /bin/terraform /usr/local/bin/terraform
COPY --from=tflint /usr/local/bin/tflint /usr/local/bin/tflint
COPY --from=trivy /usr/local/bin/trivy /usr/local/bin/trivy
COPY --from=opa /opa /usr/local/bin/opa
COPY --from=tfsec /usr/bin/tfsec /usr/local/bin/tfsec

RUN addgroup -g 10001 appgroup && \
    adduser -u 10001 -G appgroup -h /home/appuser -D appuser

WORKDIR /workspace
RUN chown -R appuser:appgroup /workspace

USER appuser

RUN terraform --version && \
    tflint --version && \
    trivy --version && \
    tfsec --version && \
    opa version

CMD ["/bin/bash"]
