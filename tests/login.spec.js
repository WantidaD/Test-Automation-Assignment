import { test, expect } from '@playwright/test';

const LOGIN_URL = 'http://the-internet.herokuapp.com/login';

test.describe('Login Functionality Tests', () => {

test('TC-01: Login success with correct username and password', async ({ page }) => {
    // Step 1: Open login page
    await page.goto(LOGIN_URL);
    await page.screenshot({ path: 'screenshots/TC01_open_login.png' });

    // Step 2: Input valid username and password
    await page.fill('#username', 'tomsmith');
    await page.fill('#password', 'SuperSecretPassword!');
    await page.screenshot({ path: 'screenshots/TC01_fill_credentials.png' });

    // Step 3: Click Login button
    await page.click('button[type="submit"]');
    await page.screenshot({ path: 'screenshots/TC01_login_success.png' });

    // Expected Result: Login success message is shown
    await expect(page.locator('#flash'))
    .toContainText('You logged into a secure area!');

    // Step 4: Click Logout button
    await page.click('a.button.secondary.radius');
    await page.screenshot({ path: 'screenshots/TC01_logout_success.png' });

    // Expected Result: Logout success message is shown
    await expect(page.locator('#flash'))
    .toContainText('You logged out of the secure area!');
});

test('TC-02: Login failed with incorrect password', async ({ page }) => {
    // Step 1: Open login page
    await page.goto(LOGIN_URL);
    await page.screenshot({ path: 'screenshots/TC02_open_login.png' });

    // Step 2: Input valid username and invalid password
    await page.fill('#username', 'tomsmith');
    await page.fill('#password', 'Password!');
    await page.screenshot({ path: 'screenshots/TC02_fill_invalid_password.png' });

    // Step 3: Click Login button
    await page.click('button[type="submit"]');
    await page.screenshot({ path: 'screenshots/TC02_login_failed.png' });

    // Expected Result: Password invalid message is shown
    await expect(page.locator('#flash'))
    .toContainText('Your password is invalid!');
});

test('TC-03: Login failed with username not found', async ({ page }) => {
    // Step 1: Open login page
    await page.goto(LOGIN_URL);
    await page.screenshot({ path: 'screenshots/TC03_open_login.png' });

    // Step 2: Input invalid username and valid password
    await page.fill('#username', 'tomholland');
    await page.fill('#password', 'Password!');
    await page.screenshot({ path: 'screenshots/TC03_fill_invalid_username.png' });

    // Step 3: Click Login button
    await page.click('button[type="submit"]');
    await page.screenshot({ path: 'screenshots/TC03_login_failed.png' });

    // Expected Result: Username invalid message is shown
    await expect(page.locator('#flash'))
    .toContainText('Your username is invalid!');
});

});