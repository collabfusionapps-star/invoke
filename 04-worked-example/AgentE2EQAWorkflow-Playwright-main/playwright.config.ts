import { defineConfig, devices } from '@playwright/test';

// Load .env if present (credentials, app URL, etc.)
try { require('dotenv').config(); } catch (_) {}

export default defineConfig({
  testDir: './tests',
  // Playwright clears this directory before every run. It must NOT be the bare
  // 'test-results/' folder, because this project also keeps a hand-authored
  // test-results/[STORY_ID]-test-report.md there (per WORKFLOW_MANIFEST.json's
  // artifacts.test_reports convention) — a bare outputDir would delete that
  // report on every test run. Found and fixed after a real run wiped it once.
  outputDir: 'test-results/.playwright-artifacts',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,
  reporter: [
    ['html', { outputFolder: 'playwright-report' }],
    ['list']
  ],
  use: {
    baseURL: process.env.APP_URL || 'https://www.saucedemo.com',
    trace: 'on-first-retry',
    screenshot: 'only-on-failure',
  },
  projects: [
    {
      name: 'chromium',
      use: { ...devices['Desktop Chrome'] },
    },
    {
      name: 'firefox',
      use: { ...devices['Desktop Firefox'] },
    },
    {
      name: 'webkit',
      use: { ...devices['Desktop Safari'] },
    },
  ],
});
