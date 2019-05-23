'use strict';

export const foo = 'bar';

export const r2gSmokeTest = function () {
  // r2g command line app uses this exported function
  return true;
};

/*

 bad library design:
 module.exports = 'foo';
 export = 'foo';

 good library design:
 exports.x = 'foo'
 export const x = 'foo'
 export default = 'foo';

*/



