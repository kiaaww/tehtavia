import { add } from '../src/calculator.js'

describe('add', () => {
    it('adds two positive numbers', () => {
        expect(add(2, 3)).toBe(5);
    });

    it('adds two negative numbers', () => {
        expect(add(-2, -3)).toBe(-5);
    });

    it('throws error when inputs are not numbers', () => {
        expect(() => add('2', 3)).toThrow('add expects two numbers');
    });
});