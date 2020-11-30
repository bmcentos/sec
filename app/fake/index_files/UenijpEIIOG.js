if (self.CavalryLogger) { CavalryLogger.start_js(["exE2x"]); }

__d("RTWebPreCallContext",["React"],(function(a,b,c,d,e,f){"use strict";a=b("React");c=a.createContext(null);e.exports=c}),null);
__d("getRequestConstUri",["ConstUriUtils","unrecoverableViolation"],(function(a,b,c,d,e,f){"use strict";e.exports=a;function a(){var a=b("ConstUriUtils").getUri(window.location.href);if(a==null)throw b("unrecoverableViolation")("Cannot create ConstUriImpl of current request","comet_infra");return a}}),null);