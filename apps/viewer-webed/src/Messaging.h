#ifndef _Avida_Webviewer_Messaging_h
#define _Avida_Webviewer_Messaging_h

#include "json.hpp"
#include <string>
#include <cstdint>
#include <string>
#include <emscripten.h>


namespace Avida{
  namespace WebViewer{
    
    typedef std::uint32_t EMStringPtr;
    typedef nlohmann::json WebViewerMsg;
    typedef char* ReceivedMessage;
    
    namespace Feedback{
      typedef enum FEEDBACK_TYPE {FATAL, WARNING, NOTIFICATION, UNKNOWN} FEEDBACK_TYPE;
    }
    
    const WebViewerMsg MSG_READY = {
      {"type", "userFeedback"},
      {"level", "notification"},
      {"message", "ready"}
    };
    
    
    
    extern "C"
    EMStringPtr GetMessages()
    {
      return EM_ASM_INT_V(return doGetMessages());
    }
    
    
    void PostMessage(const WebViewerMsg& msg)
    {
      // We're enforcing a rule that all messages
      // sent or received must be JSON objects.
      // In reality, emscripten requires these
      // messages must be strings or numbers
      // We're defaulting to strings only.
      EM_ASM_ARGS(
                  {
                    doPostMessage(Pointer_stringify($0));
                  }, 
                    msg.dump().c_str()
                  );
    }
    
    
    WebViewerMsg FeedbackMessage(Feedback::FEEDBACK_TYPE err)
    {
      WebViewerMsg ret = {{ "type","userFeedback" }};
      switch(err){
        case Feedback::FATAL:
          ret["level"] = "fatal";
          break;
        case Feedback::WARNING:
          ret["level"] = "warning";
          break;
        case Feedback::NOTIFICATION:
          ret["level"] = "notification";
          break;
        case Feedback::UNKNOWN:
        default:
          ret["level"] = "unknown";
          break;
      }
      return ret;
    }
    
    WebViewerMsg ReturnMessage(const WebViewerMsg& received)
    {
      WebViewerMsg return_msg;
      return_msg["type"] = "response";
      return_msg["request"] = received;
      return return_msg;
    }
    
    
    WebViewerMsg DefaultAddEventMessage(const WebViewerMsg& received)
    {
      WebViewerMsg return_msg(received);
      return_msg["triggerType"] =
        (received.find("triggerType") != received.end()) ? received["triggerType"] : "update";
      if (return_msg["triggerType"] == "i" || return_msg["triggerType"] == "immediate")
        return return_msg;
      return_msg["start"] = 
        (received.find("start") != received.end()) ? received["start"] : "now";
      return_msg["interval"] = 
        (received.find("interval") != received.end()) ? received["interval"] : "always";
      return_msg["end"] = 
        (received.find("end") != received.end()) ? received["end"] : "";
      return return_msg;
    }
    
    
    string DeQuote(const string& str_in)
    {
      ostringstream oss;
      for (char c : str_in)
        if (c != '"' && c != '\'')
          oss << c;
      return oss.str();
    }
    
  }  //WebViewer
}  //Avida

#endif

