require('dotenv').config()

/** @type {import('next').NextConfig} */
module.exports = {
  reactStrictMode: true,
  swcMinify: true,
  images: {
    remotePatterns: [
      {
        hostname: process.env.NEXT_PUBLIC_PAYLOAD_URL,
      },
      {
        hostname: 'localhost',
      },
    ],
  },
}
