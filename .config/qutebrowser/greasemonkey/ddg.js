// ==UserScript==
// @name         DuckDuckGo Cookie Inserter
// @namespace    https://citrus-rin.jp/
// @version      1.2
// @description  Insert specific cookies if no cookies or only 'ax' exists
// @match        *://*.duckduckgo.com/*
// @run-at       document-start
// @grant        none
// @author       Lyna YUZUHA <hoshizorarin01[at]gmail.com>
// ==/UserScript==

(function() {
    'use strict';

    function setCookies() {
        let existingCookies = document.cookie
            ? document.cookie.split('; ').map(cookie => cookie.split('=')[0])
            : [];

        // Cookie が空、または 'ax' しかない場合に Cookie を追加。すでにCookieが存在する場合は置き換えない。モバイルでは空、Safariではaxのみがデフォルトで入ってるみたい。
        if (existingCookies.length === 0 || (existingCookies.length === 1 && existingCookies.includes('ax'))) {
            let cookieString = [
ae=t; p=-2; be=0; ak=-1; aj=m; ap=-1; bg=-1; ax=-1; t=d; au=-1; a=d; 5=1; av=1; ao=-1; aq=-1; bj=1; bc=1; psb=-1; n=1
].join("; ");

            let domain = "duckduckgo.com";

            cookieString.split("; ").forEach(cookie => {
                document.cookie = cookie + `; path=/; domain=${domain}; Secure; SameSite=Lax`;
            });

            console.log("Cookies set successfully!");
        }
    }

    setCookies();
})();
