this.clientInstanceStorage = new Journalist.Tools.LocalStorage.Storages.ClientInstance();
this.sign_in_status = new Journalist.Models.SignIn();
this.sign_in_status.bind('change', function(){
  var client_instance = new Journalist.Tools.ClientSession();
  if (this.attributes.signed_in == false) {
    client_instance.unAuthorized();
  }
});
chrome.browserAction.setPopup({"popup" : "main.html"});
chrome.tabs.onRemoved.addListener(function(tabId, removeInfo){
  this.clientInstanceStorage.remove(tabId);
});
this.sign_in_status.startLongPolling();

