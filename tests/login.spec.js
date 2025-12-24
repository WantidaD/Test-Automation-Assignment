import { test, expect } from '@playwright/test';

const LOGIN_URL = 'http://the-internet.herokuapp.com/login';

test.describe('Login Functionality Tests', () => {

test('TC-01: Login success with correct username and password', async ({ page }) => {
    // Step 1: Open login page
    await page.goto(LOGIN_URL);

    // Step 2: Input valid username and password
    await page.fill('#username', 'tomsmith');
    await page.fill('#password', 'SuperSecretPassword!');

    // Step 3: Click Login button
    await page.click('button[type="submit"]');

    // Expected Result: Login success message is shown
    await expect(page.locator('#flash'))
    .toContainText('You logged into a secure area!');

    // Step 4: Click Logout button
    await page.click('a.button.secondary.radius');

    // Expected Result: Logout success message is shown
    await expect(page.locator('#flash'))
    .toContainText('You logged out of the secure area!');
});

test('TC-02: Login failed with incorrect password', async ({ page }) => {
    // Step 1: Open login page
    await page.goto(LOGIN_URL);

    // Step 2: Input valid username and invalid password
    await page.fill('#username', 'tomsmith');
    await page.fill('#password', 'Password!');

    // Step 3: Click Login button
    await page.click('button[type="submit"]');

    // Expected Result: Password invalid message is shown
    await expect(page.locator('#flash'))
    .toContainText('Your password is invalid!');
});

test('TC-03: Login failed with username not found', async ({ page }) => {
    // Step 1: Open login page
    await page.goto(LOGIN_URL);

    // Step 2: Input invalid username and valid password
    await page.fill('#username', 'tomholland');
    await page.fill('#password', 'Password!');

    // Step 3: Click Login button
    await page.click('button[type="submit"]');

    // Expected Result: Username invalid message is shown
    await expect(page.locator('#flash'))
    .toContainText('Your username is invalid!');
});

});