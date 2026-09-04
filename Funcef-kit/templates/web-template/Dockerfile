# syntax=docker.io/docker/dockerfile:1

# Uses node slim (Debian/glibc) instead of Alpine (musl) for better
# compatibility with native modules (sharp, unrs-resolver, pdfjs-dist workers)
ARG NODE_VERSION=24.3.0-slim

##########################################
# Stage 1 — Install dependencies
##########################################
FROM node:${NODE_VERSION} AS dependencies

ENV HUSKY=0 \
    NEXT_TELEMETRY_DISABLED=1

WORKDIR /app

COPY package.json pnpm-lock.yaml* .npmrc* ./

RUN --mount=type=cache,target=/root/.local/share/pnpm/store \
    --mount=type=secret,id=FUNCEF_PACKAGES_TOKEN,env=FUNCEF_PACKAGES_TOKEN \
    corepack enable pnpm && \
    echo "//npm.pkg.github.com/:_authToken=${FUNCEF_PACKAGES_TOKEN}" >> .npmrc && \
    pnpm install --frozen-lockfile


##########################################
# Stage 2 — Build Next.js (standalone)
##########################################
FROM node:${NODE_VERSION} AS builder

ENV NEXT_TELEMETRY_DISABLED=1

WORKDIR /app

# Copy node_modules
COPY --from=dependencies /app/node_modules ./node_modules

# Copy source
COPY . .

#####################################################
# Inject ENV VARS needed at BUILD TIME (ESSENTIAL)
#####################################################
ARG NEXT_PUBLIC_BASE_PATH
ENV NEXT_PUBLIC_BASE_PATH=${NEXT_PUBLIC_BASE_PATH}

ARG NEXT_PUBLIC_APP_URL
ENV NEXT_PUBLIC_APP_URL=${NEXT_PUBLIC_APP_URL}

ARG API_URL
ENV API_URL=${API_URL}

# Consumidor TKF2 apenas (fica vazio no Full BA): URL publica da porta de entrada.
ARG NEXT_PUBLIC_ENTRADA_URL
ENV NEXT_PUBLIC_ENTRADA_URL=${NEXT_PUBLIC_ENTRADA_URL}

ARG NEXT_PUBLIC_APPINSIGHTS_CONNECTION_STRING
ENV NEXT_PUBLIC_APPINSIGHTS_CONNECTION_STRING=${NEXT_PUBLIC_APPINSIGHTS_CONNECTION_STRING}

ENV NODE_ENV=production

# Build Next.js
RUN --mount=type=cache,target=/app/.next/cache \
    corepack enable pnpm && pnpm build


##########################################
# Stage 3 — Run
##########################################
FROM node:${NODE_VERSION} AS runner

WORKDIR /app

# Runtime vars
ARG NEXT_PUBLIC_BASE_PATH
ENV NEXT_PUBLIC_BASE_PATH=${NEXT_PUBLIC_BASE_PATH}

ARG NEXT_PUBLIC_APP_URL
ENV NEXT_PUBLIC_APP_URL=${NEXT_PUBLIC_APP_URL}

ARG API_URL
ENV API_URL=${API_URL}

# Consumidor TKF2 apenas (fica vazio no Full BA): URL publica da porta de entrada.
ARG NEXT_PUBLIC_ENTRADA_URL
ENV NEXT_PUBLIC_ENTRADA_URL=${NEXT_PUBLIC_ENTRADA_URL}

ARG NEXT_PUBLIC_APPINSIGHTS_CONNECTION_STRING
ENV NEXT_PUBLIC_APPINSIGHTS_CONNECTION_STRING=${NEXT_PUBLIC_APPINSIGHTS_CONNECTION_STRING}

# Telemetria servidor — passadas em runtime (não embarcadas no bundle)
ARG APPLICATIONINSIGHTS_CONNECTION_STRING
ENV APPLICATIONINSIGHTS_CONNECTION_STRING=${APPLICATIONINSIGHTS_CONNECTION_STRING}

ARG OTEL_DEBUG=false
ENV OTEL_DEBUG=${OTEL_DEBUG}

ENV NODE_ENV=production \
    HOSTNAME="0.0.0.0" \
    PORT=3000 \
    NEXT_TELEMETRY_DISABLED=1

# Copy Next.js standalone files
COPY --from=builder --chown=node:node /app/public ./public
RUN mkdir .next && chown node:node .next

COPY --from=builder --chown=node:node /app/.next/standalone ./
COPY --from=builder --chown=node:node /app/.next/static ./.next/static

USER node

EXPOSE 3000
CMD ["node", "server.js"]
