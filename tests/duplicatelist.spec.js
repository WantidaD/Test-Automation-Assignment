import { test, expect } from '@playwright/test';

test.describe('Duplicate Items Validation', () => {

function findDuplicates(listA, listB) {
    return [...new Set(listA.filter(item => listB.includes(item)))];
}

test('TC-01: Should return duplicate values from List A and List B', async () => {
    // Test Data
    const listA = [1, 2, 3, 5, 6, 8, 9];
    const listB = [3, 2, 1, 5, 6, 0];

    // Execute
    const result = findDuplicates(listA, listB);

    // Expected Result
    const expected = [1, 2, 3, 5, 6];

    // Validation
    expect(result.sort()).toEqual(expected.sort());
});

});