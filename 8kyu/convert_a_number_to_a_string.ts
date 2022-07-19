// We need a function that can transform a number into a string.
// What ways of achieving this do you know?
// Examples (input --> output):
// 123  --> "123"
// 999  --> "999"
// -100 --> "-100"
export function numberToString(num: number): string {
    return num.toString();
}

//
export const numberToString = (n: number): string => n.toString();

//
export const numberToString = String

//
return String(num);
return `${num}`;

//
export function numberToString(num: number): string {
    let ans: string = '';
    let temp: number = 0;
    let polarity: string = num < 0 ? '-' : '';
    ans = num === 1 || num === -1 ? '1' : '';
    while(num > 1 || num < -1) {
      temp = num % 10;
      ans = temp + ans;
      num = Math.floor(num / 10);
    }
    return polarity + ans;
}

//
let result: string = num.toString();
return result;

