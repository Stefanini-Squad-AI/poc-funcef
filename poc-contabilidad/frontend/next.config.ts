import type { NextConfig } from 'next'
import pkg from './package.json'

const nextConfig: NextConfig = {
  env: {
    NEXT_PUBLIC_APP_VERSION: pkg.version,
  },
  reactStrictMode: true,
  experimental: {
    typedRoutes: true,
  },
}

export default nextConfig
