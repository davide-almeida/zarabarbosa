!function(){"use strict";var t=tinymce.util.Tools.resolve("tinymce.PluginManager"),n=tinymce.util.Tools.resolve("tinymce.dom.DOMUtils"),o=function(t){return t.getParam("code_dialog_width",600)},i=function(t){return t.getParam("code_dialog_height",Math.min(n.DOM.getViewPort().h-200,500))},c=function(t,n){t.focus(),t.undoManager.transact(function(){t.setContent(n)}),t.selection.setCursorLocation(),t.nodeChanged()},d=function(t){return t.getContent({source_view:!0})},e=function(n){var t=o(n),e=i(n);n.windowManager.open({title:"Source code",body:{type:"textbox",name:"code",multiline:!0,minWidth:t,minHeight:e,spellcheck:!1,style:"direction: ltr; text-align: left"},onSubmit:function(t){c(n,t.data.code)}}).find("#code").value(d(n))},u=function(t){t.addCommand("mceCodeEditor",function(){e(t)})},a=function(t){t.addButton("code",{icon:"code",tooltip:"Source code",onclick:function(){e(t)}}),t.addMenuItem("code",{icon:"code",text:"Source code",onclick:function(){e(t)}})};t.add("code",function(t){return u(t),a(t),{}})}();
