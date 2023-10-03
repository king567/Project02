(function ($) {
    'use strict';

    var DISALLOWED_ATTRIBUTES = ['sanitize', 'whiteList', 'sanitizeFn'];

    var uriAttrs = [
        'background',
        'cite',
        'href',
        'itemtype',
        'longdesc',
        'poster',
        'src',
        'xlink:href'
    ];

    var ARIA_ATTRIBUTE_PATTERN = /^aria-[\w-]*$/i;

    var DefaultWhitelist = {
        // Global attributes allowed on any supplied element below.
        '*': ['class', 'dir', 'id', 'lang', 'role', 'tabindex', 'style', ARIA_ATTRIBUTE_PATTERN],
        a: ['target', 'href', 'title', 'rel'],
        area: [],
        b: [],
        br: [],
        col: [],
        code: [],
        div: [],
        em: [],
        hr: [],
        h1: [],
        h2: [],
        h3: [],
        h4: [],
        h5: [],
        h6: [],
        i: [],
        img: ['src', 'alt', 'title', 'width', 'height'],
        li: [],
        ol: [],
        p: [],
        pre: [],
        s: [],
        small: [],
        span: [],
        sub: [],
        sup: [],
        strong: [],
        u: [],
        ul: []
    }

    /**
     * A pattern that recognizes a commonly useful subset of URLs that are safe.
     *
     * Shoutout to Angular 7 https://github.com/angular/angular/blob/7.2.4/packages/core/src/sanitization/url_sanitizer.ts
     */
    var SAFE_URL_PATTERN = /^(?:(?:https?|mailto|ftp|tel|file):|[^&:/?#]*(?:[/?#]|$))/gi;

    /**
     * A pattern that matches safe data URLs. Only matches image, video and audio types.
     *
     * Shoutout to Angular 7 https://github.com/angular/angular/blob/7.2.4/packages/core/src/sanitization/url_sanitizer.ts
     */
    var DATA_URL_PATTERN = /^data:(?:image\/(?:bmp|gif|jpeg|jpg|png|tiff|webp)|video\/(?:mpeg|mp4|ogg|webm)|audio\/(?:mp3|oga|ogg|opus));base64,[a-z0-9+/]+=*$/i;

    function allowedAttribute(attr, allowedAttributeList) {
        var attrName = attr.nodeName.toLowerCase()

        if ($.inArray(attrName, allowedAttributeList) !== -1) {
            if ($.inArray(attrName, uriAttrs) !== -1) {
                return Boolean(attr.nodeValue.match(SAFE_URL_PATTERN) || attr.nodeValue.match(DATA_URL_PATTERN))
            }

            return true
        }

        var regExp = $(allowedAttributeList).filter(function (index, value) {
            return value instanceof RegExp
        })

        // Check if a regular expression validates the attribute.
        for (var i = 0, l = regExp.length; i < l; i++) {
            if (attrName.match(regExp[i])) {
                return true
            }
        }

        return false
    }

    function sanitizeHtml(unsafeElements, whiteList, sanitizeFn) {
        if (sanitizeFn && typeof sanitizeFn === 'function') {
            return sanitizeFn(unsafeElements);
        }

        var whitelistKeys = Object.keys(whiteList);

        for (var i = 0, len = unsafeElements.length; i < len; i++) {
            var elements = unsafeElements[i].querySelectorAll('*');

            for (var j = 0, len2 = elements.length; j < len2; j++) {
                var el = elements[j];
                var elName = el.nodeName.toLowerCase();

                if (whitelistKeys.indexOf(elName) === -1) {
                    el.parentNode.removeChild(el);

                    continue;
                }

                var attributeList = [].slice.call(el.attributes);
                var whitelistedAttributes = [].concat(whiteList['*'] || [], whiteList[elName] || []);

                for (var k = 0, len3 = attributeList.length; k < len3; k++) {
                    var attr = attributeList[k];

                    if (!allowedAttribute(attr, whitelistedAttributes)) {
                        el.removeAttribute(attr.nodeName);
                    }
                }
            }
        }
    }

    // Polyfill for browsers with no classList support
    // Remove in v2
    if (!('classList' in document.createElement('_'))) {
        (function (view) {
            if (!('Element' in view)) return;

            var classListProp = 'classList',
                protoProp = 'prototype',
                elemCtrProto = view.Element[protoProp],
                objCtr = Object,
                classListGetter = function () {
                    var $elem = $(this);

                    return {
                        add: function (classes) {
                            classes = Array.prototype.slice.call(arguments).join(' ');
                            return $elem.addClass(classes);
                        },
                        remove: function (classes) {
                            classes = Array.prototype.slice.call(arguments).join(' ');
                            return $elem.removeClass(classes);
                        },
                        toggle: function (classes, force) {
                            return $elem.toggleClass(classes, force);
                        },
                        contains: function (classes) {
                            return $elem.hasClass(classes);
                        }
                    }
                };

            if (objCtr.defineProperty) {
                var classListPropDesc = {
                    get: classListGetter,
                    enumerable: true,
                    configurable: true
                };
                try {
                    objCtr.defineProperty(elemCtrProto, classListProp, classListPropDesc);
                } catch (ex) { // IE 8 doesn't support enumerable:true
                    // adding undefined to fight this issue https://github.com/eligrey/classList.js/issues/36
                    // modernie IE8-MSW7 machine has IE8 8.0.6001.18702 and is affected
                    if (ex.number === undefined || ex.number === -0x7FF5EC54) {
                        classListPropDesc.enumerable = false;
                        objCtr.defineProperty(elemCtrProto, classListProp, classListPropDesc);
                    }
                }
            } else if (objCtr[protoProp].__defineGetter__) {
                elemCtrProto.__defineGetter__(classListProp, classListGetter);
            }
        }(window));
    }

    var testElement = document.createElement('_');

    testElement.classList.add('c1', 'c2');

    if (!testElement.classList.contains('c2')) {
        var _add = DOMTokenList.prototype.add,
            _remove = DOMTokenList.prototype.remove;

        DOMTokenList.prototype.add = function () {
            Array.prototype.forEach.call(arguments, _add.bind(this));
        }

        DOMTokenList.prototype.remove = function () {
            Array.prototype.forEach.call(arguments, _remove.bind(this));
        }
    }

    testElement.classList.toggle('c3', false);

    // Polyfill for IE 10 and Firefox <24, where classList.toggle does not
    // support the second argument.
    if (testElement.classList.contains('c3')) {
        var _toggle = DOMTokenList.prototype.toggle;

        DOMTokenList.prototype.toggle = function (token, force) {
            if (1 in arguments && !this.contains(token) === !force) {
                return force;
            } else {
                return _toggle.call(this, token);
            }
        };
    }

    testElement = null;

    // shallow array comparison
    function isEqual(array1, array2) {
        return array1.length === array2.length && array1.every(function (element, index) {
            return element === array2[index];
        });
    };

    // <editor-fold desc="Shims">
    if (!String.prototype.startsWith) {
        (function () {
            'use strict'; // needed to support `apply`/`call` with `undefined`/`null`
            var defineProperty = (function () {
                // IE 8 only supports Object.defineProperty on DOM elements
                try {
                    var object = {};
                    var $defineProperty = Object.defineProperty;
                    var result = $defineProperty(object, object, object) && $defineProperty;
                } catch (error) {
                }
                return result;
            }());
            var toString = {}.toString;
            var startsWith = function (search) {
                if (this == null) {
                    throw new TypeError();
                }
                var string = String(this);
                if (search && toString.call(search) == '[object RegExp]') {
                    throw new TypeError();
                }
                var stringLength = string.length;
                var searchString = String(search);
                var searchLength = searchString.length;
                var position = arguments.length > 1 ? arguments[1] : undefined;
                // ToInteger
                var pos = position ? Number(position) : 0;
                if (pos != pos) { // better isNaN
                    pos = 0;
                }
                var start = Math.min(Math.max(pos, 0), stringLength);
                // Avoid the indexOf call if no match is possible
                if (searchLength + start > stringLength) {
                    return false;
                }
                var index = -1;
                while (++index < searchLength) {
                    if (string.charCodeAt(start + index) != searchString.charCodeAt(index)) {
                        return false;
                    }
                }
                return true;
            };
            if (defineProperty) {
                defineProperty(String.prototype, 'startsWith', {
                    'value': startsWith,
                    'configurable': true,
                    'writable': true
                });
            } else {
                String.prototype.startsWith = startsWith;
            }
        }());
    }

    if (!Object.keys) {
        Object.keys = function (
            o, // object
            k, // key
            r  // result array
        ) {
            // initialize object and result
            r = [];
            // iterate over object keys
            for (k in o) {
                // fill result array with non-prototypical keys
                r.hasOwnProperty.call(o, k) && r.push(k);
            }
            // return result
            return r;
        };
    }

    if (HTMLSelectElement && !HTMLSelectElement.prototype.hasOwnProperty('selectedOptions')) {
        Object.defineProperty(HTMLSelectElement.prototype, 'selectedOptions', {
            get: function () {
                return this.querySelectorAll(':checked');
            }
        });
    }

    function getSelectedOptions(select, ignoreDisabled) {
        var selectedOptions = select.selectedOptions,
            options = [],
            opt;

        if (ignoreDisabled) {
            for (var i = 0, len = selectedOptions.length; i < len; i++) {
                opt = selectedOptions[i];

                if (!(opt.disabled || opt.parentNode.tagName === 'OPTGROUP' && opt.parentNode.disabled)) {
                    options.push(opt);
                }
            }

            return options;
        }

        return selectedOptions;
    }

    // much faster than $.val()
    function getSelectValues(select, selectedOptions) {
        var value = [],
            options = selectedOptions || select.selectedOptions,
            opt;

        for (var i = 0, len = options.length; i < len; i++) {
            opt = options[i];

            if (!(opt.disabled || opt.parentNode.tagName === 'OPTGROUP' && opt.parentNode.disabled)) {
                value.push(opt.value);
            }
        }

        if (!select.multiple) {
            return !value.length ? null : value[0];
        }

        return value;
    }

  //