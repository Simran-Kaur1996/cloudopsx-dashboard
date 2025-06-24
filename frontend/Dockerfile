# Stage 1: Build React App
FROM node:18 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Install wget for healthcheck
RUN apk --no-cache add wget

# Copy built frontend
COPY --from=builder /app/build /usr/share/nginx/html

# Healthcheck: ping the web server
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost || exit 1

# Expose port and run Nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

# Stage 3: Metadata
LABEL org.opencontainers.image.title="Frontend Service"
