import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  
  // Health check for Render
  const expressInstance = app.getHttpAdapter().getInstance();
  expressInstance.get('/health', (req, res) => res.status(200).send('OK'));

  const frontendUrl = process.env.FRONTEND_URL || 'http://localhost:3000';
  // Permitir la URL con y sin barra diagonal al final para evitar errores comunes de CORS
  const allowedOrigins = [
    frontendUrl.replace(/\/$/, ''), 
    `${frontendUrl.replace(/\/$/, '')}/`,
    'http://localhost:3000'
  ];

  app.enableCors({
    origin: allowedOrigins,
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE',
    credentials: true,
  });

  const port = process.env.PORT || 3001;
  await app.listen(port);
  console.log(`Application is running on: http://localhost:${port}`);
}
bootstrap();
