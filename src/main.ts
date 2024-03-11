'use strict';

import * as cp from 'child_process';
import * as path from 'path';
import * as fs from 'fs';
import * as http from 'http';
import * as assert from 'assert';
import * as EE from 'events';
import * as strm from "stream";


export const foo = 'bar';

export const r2gSmokeTest = async function () {
  // r2g command line app uses this exported function
  return true;
};

/*

 TODO: bad library design:

 module.exports = 'foo';
 export = 'foo';

 TODO: good library design:

 exports.x = 'foo'
 export const x = 'foo'
 export default = 'foo';

*/



