this.clientInstanceStorage = new Journalist.Tools.LocalStorage.Storages.ClientInstance();
chrome.browserAction.setPopup({"popup" : "main.html"});
chrome.tabs.onRemoved.addListener(function(tabId, removeInfo){
  this.clientInstanceStorage.remove(tabId);
});
