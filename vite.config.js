import * as elmPlugin from "vite-plugin-elm";
import { defineConfig } from "vite";
export default defineConfig(async (env) => {
  const withDebugger = true;
  const optimize = false;
  const port = 3123;
  return {
    plugins: [elmPlugin.plugin({ debug: withDebugger, optimize: optimize })],
    server: {
      hmr: false,
      host: "localhost",
      port,
      strictPort: true,
      cors: true,
      open: true,
    },
  };
});
