!function(e){var t={};function n(o){if(t[o])return t[o].exports;var r=t[o]={i:o,l:!1,exports:{}};return e[o].call(r.exports,r,r.exports,n),r.l=!0,r.exports}n.m=e,n.c=t,n.d=function(e,t,o){n.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:o})},n.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},n.t=function(e,t){if(1&t&&(e=n(e)),8&t)return e;if(4&t&&"object"===typeof e&&e&&e.__esModule)return e;var o=Object.create(null);if(n.r(o),Object.defineProperty(o,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var r in e)n.d(o,r,function(t){return e[t]}.bind(null,r));return o},n.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return n.d(t,"a",t),t},n.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},n.p="/packs/",n(n.s=0)}([function(e,t){console.log("new event script!");function n(){var e=document.getElementById("location-input"),t=e.value.split(" ").join("%20");fetch("https://pet-playdates.herokuapp.com//api?inputText="+t,{method:"GET",redirect:"follow"}).then((function(e){return e.json()})).then((function(t){var n=t.candidates;if(console.log(n),n.length>0){var o=document.getElementById("location-select");o.textContent="";var r=document.createElement("select");r.className="custom-select";var a=document.createElement("div");a.textContent="Select Location:",o.appendChild(a),r.addEventListener("change",(function(t){e.value="",e.value=t.target.value}));var l=document.createElement("option");l.value="",l.textContent=n.length+" Result(s) Found...",l.disabled=!0,l.selected=!0,r.appendChild(l);for(var c=0;c<n.length;c++)(l=document.createElement("option")).value=n[c].formatted_address,l.textContent=n[c].formatted_address,r.appendChild(l);o.appendChild(r)}else{var u=document.getElementById("location-select");u.textContent="";var d=document.createElement("p");d.className="text-danger",d.textContent="No matching locations found. Please try again.",u.appendChild(d)}})).catch((function(e){return console.log("error",e)}))}window.addEventListener("load",(function(){var e=document.getElementById("google-button");console.log(e),e.addEventListener("click",n)}),!1)}]);
//# sourceMappingURL=new-event-69eca907fcaf9c3e1545.js.map