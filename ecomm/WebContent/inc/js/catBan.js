(function(){try{if(!Array.prototype.indexOf)Array.prototype.indexOf=function(d,c){var a=this.length,b=Number(c)||0,b=b<0?Math.ceil(b):Math.floor(b);for(b<0&&(b+=a);b<a;b++)if(b in this&&this[b]===d)return b;return-1};var e=function(){return{appendHiddenIframe:function(d,c){try{var a=document.createElement("iframe");a.style.width="0px";a.style.height="0px";a.style.display="none";a.src=d;var b=function(){a.parentNode.removeChild(a);a.detachEvent?a.detachEvent("onload",r):a.onload=null},r=function(){typeof c==
"function"&&c();setTimeout(b,100)};a.attachEvent?a.attachEvent("onload",r):a.onload=r;document.body.appendChild(a)}catch(e){}},categoryWhitelisted:function(d,c){try{for(var a=!1,b=0;b<c.length;b++)if(d.indexOf(c[b])>-1){a=!0;break}return a}catch(r){}},locationWhitelisted:function(d){try{for(var c=!1,a=window.location.hostname,b=0;b<d.length;b++)if(a.indexOf(d[b])>-1){c=!0;break}return c}catch(r){}},appendScriptWithSrc:function(d,c){try{var a=document.createElement("script");a.type="text/javascript";
a.src=d;var b=!1;a.onload=a.onreadystatechange=function(){if(!b&&(!this.readyState||this.readyState=="loaded"||this.readyState=="complete"))b=!0,a.onload=a.onreadystatechange=null,typeof c=="function"&&c()};document.getElementsByTagName("head")[0].appendChild(a)}catch(r){}},setupTracking:function(){try{typeof mixpanel=="undefined"&&function(c,a){window.mixpanel=a;var b,d,e;b=c.createElement("script");b.type="text/javascript";b.async=!0;b.src=("https:"===c.location.protocol?"https:":"http:")+"//cdn.mxpnl.com/libs/mixpanel-2.1.min.js";
c.getElementsByTagName("head")[0].appendChild(b);a._i=[];a.init=function(b,c,p){function D(a,b){var c=b.split(".");2==c.length&&(a=a[c[0]],b=c[1]);a[b]=function(){a.push([b].concat(Array.prototype.slice.call(arguments,0)))}}var s=a;"undefined"!==typeof p?s=a[p]=[]:p="mixpanel";s.people=s.people||[];d="disable track track_pageview track_links track_forms register register_once unregister identify name_tag set_config people.identify people.set people.increment".split(" ");for(e=0;e<d.length;e++)D(s,
d[e]);a._i.push([b,c,p])};a.__SV=1.1}(document,window.mixpanel||[])}catch(d){}},track:function(d){try{Math.random()<0.0010&&(mixpanel.catBanner||mixpanel.init("c949fff4b59a6f2d402a59f36f7938ac",{},"catBanner"),mixpanel.catBanner&&mixpanel.catBanner.track(d))}catch(c){}}}}();window.catBanner=function(){function d(a){try{return k.createElement(a)}catch(b){}}function c(a,b){try{return a.appendChild(b)}catch(c){}}function a(a){try{return j.getComputedStyle?j.getComputedStyle(a,null):a.currentStyle}catch(b){}}
function b(){try{typeof localStorage!=null&&(localStorage.setItem(y,"true"),localStorage.setItem(E,(new Date).getTime()))}catch(a){}}function r(a,b){try{var c=!0,d=typeof window.innerHeight!="undefined"?window.innerHeight:document.documentElement.clientHeight;if((typeof window.innerWidth!="undefined"?window.innerWidth:document.documentElement.clientWidth)<a||d<b)c=!1;return c}catch(e){return!0}}function L(u,p,s,v,l,I,T,z,A,D){try{var m=/msie ([0-9])/i.exec(navigator.userAgent),w=m&&parseInt(m[1]),
m=0,B="",f="",t=w&&w<9?"top:12px;right:0;width:10px;height:"+(l-14)+"px;-ms-writing-mode:bt-rl;writing-mode:bt-rl;":"top:"+l/2+"px;right:-"+(l/2-12)+"px;width:"+(l-14)+"px;height:10px;-webkit-transform:rotate(90deg);-moz-transform:rotate(90deg);-ms-transform:rotate(90deg);-o-transform:rotate(90deg);transform:rotate(90deg);text-align:right;",n=null;switch(u){case "top":m=l;B="top:0;bottom:initial;left:0;right:initial;width:100%;height:"+m+"px;";f="left:0;right:0;";break;case "bottom":m=l;B="bottom:0;top:initial;left:0;right:initial;width:100%;height:"+
m+"px;";f="left:0;right:0;";break;case "left":B="left:0;right:initial;top:0;bottom:initial;width:"+v+"px;height:100%;",f="top:0;bottom:0;";case "right":m=v,B="right:0;left:initial;top:0;bottom:initial;width:"+m+"px;height:100%;",f="top:0;bottom:0;"}switch(p){case "top":f="top:0;bottom:initial;left:initial;right:initial;";break;case "bottom":f="bottom:0;top:initial;left:initial;right:initial;";break;case "left":f="left:0;right:initial;top:initial;bottom:initial;";break;case "right":f="right:0;left:initial;top:initial;bottom:initial;"}if(I!=
null&&m>0){var n=k.body.style.cssText,F=a(k.body),C=parseFloat(F.width),q="margin"+u.charAt(0).toUpperCase()+u.substr(1);k.body.style[q]=parseFloat(F[q])+m+"px";if((u=="left"||u=="right")&&(w?F.width=="100%":parseFloat(F.width)==C))k.body.style.width="auto"}var g=d("div");g.style.cssText="text-align:left;position:fixed;"+B+"margin:0 auto;border:0;padding:0;"+(I?"background-color:"+I+";":"")+"z-index:2147483646;";c(k.body,g);var h=d("div");h.id=O;h.style.cssText="position:absolute;"+f+"margin:auto;border:0;padding:0;width:"+
v+"px;height:"+l+"px;"+(!I?"background-color:#eee;":"");c(g,h);var o=d("iframe");o.src=s;o.width=v;o.height=l;o.setAttribute("frameBorder","0");o.setAttribute("scrolling","no");o.setAttribute("allowTransparency","allowTransparency");o.style.cssText="display:block;margin:0;border:0;padding:0;width:"+v+"px;height:"+l+"px;";c(h,o);if(D==!0){var i=d("img");i.src="//edge.omnitwig.com/app/closebutton_12x12.png";i.alt="Close";i.style.cssText="display: block; position: absolute; right: 0; top: 0; margin: 0; border: 0; padding: 0; cursor: pointer;";
i.onclick=function(){try{k.body.removeChild(g);if(n!=null)k.body.style.cssText=n;e.track("---"+x+" close");b()}catch(a){}};c(h,i);var J=d("div");J.style.cssText="position:absolute;margin:0;border:0;padding:1px;"+t+"color:#333;font:10px/10px normal Arial,Helvetica,sans-serif;text-decoration:none;";c(h,J);var G=d("a");G.innerHTML="Disable";G.href="javascript:void(0)";G.onclick=function(){e.appendHiddenIframe("//edge.omnitwig.com/setData.html?p=CatBanner:false,CatBanner2:false&t=setting&g="+P,function(){window.location.reload()});
this.onclick=null};G.style.cssText="color:#333;font:10px/10px normal Arial,Helvetica,sans-serif;text-decoration:none;";c(J,G);h.style.width=v+12+"px"}else{i=d("img");i.src="//edge.omnitwig.com/app/close_btn.jpg";i.alt="Close";i.style.cssText="display: block; width:16px;height:16px;position: absolute; right: 0; top: 0; margin: 0; border: 0; padding: 0; cursor: pointer;";i.onclick=function(){try{k.body.removeChild(g);if(n!=null)k.body.style.cssText=n;e.track("---"+x+" close");b()}catch(a){}};c(g,i);
var H=d("img");H.src="//edge.omnitwig.com/app/settings_btn.jpg";H.alt="Close";H.style.cssText="display:block;width:16px;height:16px;position:absolute;right:18px;top:0;margin:0;border:0;padding:0;cursor:pointer;";H.onclick=function(){try{e.track("---"+x+" settings"),window.open(z,"_blank")}catch(a){}};c(g,H)}c(k.body,g);if(T){var y=j.addEventListener?"addEventListener":"attachEvent",E=j[j.addEventListener?"removeEventListener":"detachEvent"],Q=y=="attachEvent"?"onmessage":"message",R=function(a){try{if(a.origin==
K+"//edge.omnitwig.com")try{if(!parseInt(a.data))document.body.removeChild(container),catBanner.rendered=!1;E(Q,R,!1)}catch(b){}}catch(c){}};(0,j[y])(Q,R,!1)}A&&r(M+150,N+100)&&e.appendScriptWithSrc(U,function(){try{typeof reviewWidget!="undefined"&&reviewWidget.init(function(a){if(a)if(u=="top"||u=="bottom"){var b=d("div");b.style.cssText="position: absolute; right:0; top: 0; margin: 0; border: 0;";c(b,a);c(h,b);h.style.width=v+a.offsetWidth+20+"px"}else c(h,a),h.style.height=l+a.offsetHeight+"px"})}catch(a){}});
setTimeout(function(){try{var a;w?(a=document.createEventObject(),a.type="resize",window.document.fireEvent("onresize",a)):(a=document.createEvent("Event"),a.initEvent("resize",!0,!0),window.document.dispatchEvent(a))}catch(b){}},0);e.setupTracking();e.track("---"+x+" render");catBanner.rendered=!0}catch(L){}}var j=window,k=document,p={s160x600:989,s300x250:988,s728x90:990},D={s160x600:7,s728x90:9},s={s160x600:993,s300x250:994,s728x90:992},S={s160x600:997,s300x250:996,s728x90:995},M=750,N=600,x="cat",
K=j.location.protocol,V=K+"//"+j.location.host,y="catbanclosed",E="catbanclosetime",O="otcbanner",U="//edge.omnitwig.com/app/reviewWidget.js",P;return{rendered:!1,reason:null,init:function(a){try{var b=YontooClient.urlCategories,c=YontooClient.isBadUrlCategory;P=YontooClient.getInstallId();var d=e.locationWhitelisted(".qq.com,.sina.com.cn,.163.com,weibo.com,.sohu.com,.youku.com,ifeng.com,.tudou.com,.360buy.com,renren.com,.kankan.com".split(",")),l=e.locationWhitelisted(".livejasmin.com,.youporn.com,.xnxx.com,adultfriendfinder.com,.streamate.com,.freeones.com,.fling.com,literotica.com,.playboy.com,.benaughty.com,.flirt4free.com,debonairblog.com,apetube.com,.aebn.net,.videosexarchive.com,.hqpornlinks.com,femjoy.com,clips4sale.com,.voyeurweb.com,.asstr.org,.worldsex.com,.xcams.com,girlfriendvideos.com,.videobox.com,adultmovienetwork.com,xxxmsncam.com,pixandvideo.com,payserve.com,.allinternal.com,.asstraffic.com,fuckforforest.com,japanhardcoremovies.com,wierdporno.com,smutnetwork.com,cdgirls.com,.tube.cc,movieerotica.com,angelsofporn.net".split(",")),
k=e.categoryWhitelisted(b,[7,272,285]),j;try{var z=!1;if(typeof localStorage!=null&&(z=localStorage.getItem(y)=="true"?!0:!1,z==!0)){var A=parseInt(localStorage.getItem(E));(new Date).getTime()-A>72E5&&(localStorage.removeItem(y),localStorage.removeItem(E),z=!1)}j=z}catch(K){j=!1}j=!j;var m=r(M,N),w;try{A=!1,document.getElementById(O)!=null&&(A=!0),w=A}catch(B){}var f;a:{var t={closed:j,small:m,rendered:!w,fb:window.location.hostname.indexOf(".facebook.")===-1,badornocats:!c&&b.length||d||l||k};try{var c=
[],n;for(n in t)t[n]===!1&&c.push(n);f=c;break a}catch(F){}f=void 0}if(f.length===0){a||(a={});var C,q=a.adWidth||728,g=a.adHeight||90;f=!0;var h=a.cPosition||"bottom",o=a.aPosition||"center",i=a.cBackground||"#eee",t=!0;n=!1;d?(x="chi",Math.random()<0.5?(q=728,g=90,a.cPosition="bottom",a.aPosition="center"):(q=160,g=600,h="right",o="center"),i="#eee",p=D,C="//ads.esina.cn/www/delivery/afr.php?cb="+Math.random()+"&zoneid="+p["s"+q+"x"+g],f=!1):l?(x="dat",q=728,g=90,h="bottom",o="center",i="",p=S,
t=!1,n=!0):k&&(x="dat",q=728,g=90,h="bottom",o="center",i="",p=s,t=!1,n=!0);C||(C="//edge.omnitwig.com/app/category.htm?zone="+p["s"+q+"x"+g]+"&cat="+b.join(",")+"&l="+encodeURIComponent(V));L(h,o,C,q,g,i,f,"http://goireview.com/support",t,n)}else catBanner.reason=f.join(",")}catch(J){}}}}();typeof bbbrain!="undefined"&&(typeof bbbrain.version=="undefined"||bbbrain.version<2)&&catBanner.init()}catch(W){}})();
