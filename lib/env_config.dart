class EnvConfig {
  static const APP_ENV_MOCK = "mock";
  static const APP_ENV_DEV = "dev";
  static const APP_ENV_PROD = "prod";

  static const APP_ENV = String.fromEnvironment(
    'JIZT_APP_ENV',
    defaultValue: 'dev',
  );

  static const APP_NAME = APP_ENV == APP_ENV_PROD ? "Jizt" : "Jizt.$APP_ENV";
}
