/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/application.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/application.js":
/*!*********************************************!*\
  !*** ./app/javascript/packs/application.js ***!
  \*********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /Users/gwendal/Desktop/mycryptowallet-final/app/javascript/packs/application.js: 'import' and 'export' may only appear at the top level. (52:2)\n\n  50 |   burger();\n  51 |   flip();\n> 52 |   import { createChart } from 'lightweight-charts';\n     |   ^\n  53 |\n  54 | const chart = createChart(document.body, { width: 400, height: 300 });\n  55 | const lineSeries = chart.addLineSeries();\n    at Parser._raise (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:810:17)\n    at Parser.raiseWithData (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:803:17)\n    at Parser.raise (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:764:17)\n    at Parser.parseStatementContent (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:12644:18)\n    at Parser.parseStatement (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:12551:17)\n    at Parser.parseBlockOrModuleBlockBody (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:13140:25)\n    at Parser.parseBlockBody (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:13131:10)\n    at Parser.parseBlock (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:13115:10)\n    at Parser.parseFunctionBody (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:12029:24)\n    at Parser.parseArrowExpression (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:12001:10)\n    at Parser.parseParenAndDistinguishExpression (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:11579:12)\n    at Parser.parseExprAtom (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:11268:21)\n    at Parser.parseExprSubscripts (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:10941:23)\n    at Parser.parseUpdate (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:10921:21)\n    at Parser.parseMaybeUnary (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:10899:23)\n    at Parser.parseExprOps (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:10756:23)\n    at Parser.parseMaybeConditional (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:10730:23)\n    at Parser.parseMaybeAssign (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:10693:21)\n    at /Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:10660:39\n    at Parser.allowInAnd (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:12356:12)\n    at Parser.parseMaybeAssignAllowIn (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:10660:17)\n    at Parser.parseExprListItem (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:12116:18)\n    at Parser.parseCallExpressionArguments (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:11142:22)\n    at Parser.parseCoverCallAndAsyncArrowHead (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:11050:29)\n    at Parser.parseSubscript (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:10985:19)\n    at Parser.parseSubscripts (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:10958:19)\n    at Parser.parseExprSubscripts (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:10947:17)\n    at Parser.parseUpdate (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:10921:21)\n    at Parser.parseMaybeUnary (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:10899:23)\n    at Parser.parseExprOps (/Users/gwendal/Desktop/mycryptowallet-final/node_modules/@babel/parser/lib/index.js:10756:23)");

/***/ })

/******/ });
//# sourceMappingURL=application-4c39dfd78acd85f69398.js.map