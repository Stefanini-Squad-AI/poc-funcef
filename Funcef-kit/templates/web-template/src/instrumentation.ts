export async function register() {
  if (process.env.NEXT_RUNTIME === 'nodejs') {
    // Telemetria de servidor é opt-in via @funcef-componentes/observability:
    // ao adotá-la, importe e chame registerServerObservability() aqui.
    const shutdown = async (signal: string) => {
      console.log(`[Shutdown] Received ${signal}, shutting down gracefully...`);

      await new Promise((res) => setTimeout(res, 1000));

      console.log('[Shutdown] Goodbye!');

      process.exit(0);
    };

    process.on('SIGTERM', () => shutdown('SIGTERM'));
    process.on('SIGINT', () => shutdown('SIGINT'));
  }
}
