!function(t,e){for(var n in e)t[n]=e[n]}(window,function(t){var e={};function n(o){if(e[o])return e[o].exports;var r=e[o]={i:o,l:!1,exports:{}};return t[o].call(r.exports,r,r.exports,n),r.l=!0,r.exports}return n.m=t,n.c=e,n.d=function(t,e,o){n.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:o})},n.r=function(t){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},n.t=function(t,e){if(1&e&&(t=n(t)),8&e)return t;if(4&e&&"object"==typeof t&&t&&t.__esModule)return t;var o=Object.create(null);if(n.r(o),Object.defineProperty(o,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var r in t)n.d(o,r,function(e){return t[e]}.bind(null,r));return o},n.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return n.d(e,"a",e),e},n.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},n.p="",n(n.s=555)}({0:function(t,e){t.exports=window.jQuery},29:function(t,e){t.exports=window.blueimpGallery},555:function(t,e,n){"use strict";n.r(e);n(556)},556:function(t,e,n){var o,r,i;!function(a){"use strict";r=[n(0),n(29)],void 0===(i="function"==typeof(o=function(t,e){if(!window.postMessage)return e;t.extend(e.prototype.options,{youTubeVideoIdProperty:"youtube",youTubePlayerVars:{wmode:"transparent"},youTubeClickToPlay:!0});var n=e.prototype.textFactory||e.prototype.imageFactory,o=function(t,e,n){this.videoId=t,this.playerVars=e,this.clickToPlay=n,this.element=document.createElement("div"),this.listeners={}};return t.extend(o.prototype,{canPlayType:function(){return!0},on:function(t,e){return this.listeners[t]=e,this},loadAPI:function(){var t,e=this,n=window.onYouTubeIframeAPIReady,o="//www.youtube.com/iframe_api",r=document.getElementsByTagName("script"),i=r.length;for(window.onYouTubeIframeAPIReady=function(){n&&n.apply(this),e.playOnReady&&e.play()};i;)if(r[i-=1].src===o)return;(t=document.createElement("script")).src=o,r[0].parentNode.insertBefore(t,r[0])},onReady:function(){this.ready=!0,this.playOnReady&&this.play()},onPlaying:function(){this.playStatus<2&&(this.listeners.playing(),this.playStatus=2)},onPause:function(){e.prototype.setTimeout.call(this,this.checkSeek,null,2e3)},checkSeek:function(){this.stateChange!==YT.PlayerState.PAUSED&&this.stateChange!==YT.PlayerState.ENDED||(this.listeners.pause(),delete this.playStatus)},onStateChange:function(t){switch(t.data){case YT.PlayerState.PLAYING:this.hasPlayed=!0,this.onPlaying();break;case YT.PlayerState.PAUSED:case YT.PlayerState.ENDED:this.onPause()}this.stateChange=t.data},onError:function(t){this.listeners.error(t)},play:function(){var t=this;this.playStatus||(this.listeners.play(),this.playStatus=1),this.ready?!this.hasPlayed&&(this.clickToPlay||window.navigator&&/iP(hone|od|ad)/.test(window.navigator.platform))?this.onPlaying():this.player.playVideo():(this.playOnReady=!0,window.YT&&YT.Player?this.player||(this.player=new YT.Player(this.element,{videoId:this.videoId,playerVars:this.playerVars,events:{onReady:function(){t.onReady()},onStateChange:function(e){t.onStateChange(e)},onError:function(e){t.onError(e)}}})):this.loadAPI())},pause:function(){this.ready?this.player.pauseVideo():this.playStatus&&(delete this.playOnReady,this.listeners.pause(),delete this.playStatus)}}),t.extend(e.prototype,{YouTubePlayer:o,textFactory:function(t,e){var r=this.options,i=this.getItemProperty(t,r.youTubeVideoIdProperty);return i?(void 0===this.getItemProperty(t,r.urlProperty)&&(t[r.urlProperty]="//www.youtube.com/watch?v="+i),void 0===this.getItemProperty(t,r.videoPosterProperty)&&(t[r.videoPosterProperty]="//img.youtube.com/vi/"+i+"/maxresdefault.jpg"),this.videoFactory(t,e,new o(i,r.youTubePlayerVars,r.youTubeClickToPlay))):n.call(this,t,e)}}),e})?o.apply(e,r):o)||(t.exports=i)}()}}));