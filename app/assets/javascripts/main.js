function faye_client(){
  if(typeof fayeclient == 'undefined'){
    var fayeclient = new Faye.Client('/quick'); }
  return fayeclient;
}
