curl -v -d userID=4926447 -d apiKey=7A5E98CAAB4B4484845CB27EA595A612EBFCA0093AEF4078B16C57070C31A8E5 http://api.eve-online.com/account/Characters.xml.aspx

http://games.chruker.dk/eve_online/test_eve_api.php

curl -v -d userID=4926447 -d apiKey=7A5E98CAAB4B4484845CB27EA595A612EBFCA0093AEF4078B16C57070C31A8E5 -d characterID=280802741 http://api.eve-online.com/char/Notifications.xml.aspx

< HTTP/1.1 200 OK
< Cache-Control: private
< Transfer-Encoding: chunked
< Content-Type: application/xml; charset=utf-8
< Server: Microsoft-IIS/7.0
< X-AspNet-Version: 2.0.50727
< X-Powered-By: ASP.NET
< Date: Mon, 04 Jan 2010 05:27:51 GMT
< 
<?xml version='1.0' encoding='UTF-8'?>
<eveapi version="2">
  <currentTime>2010-01-04 05:27:52</currentTime>
  <result>
    <rowset name="notifications" key="notificationID" columns="notificationID,typeID,senderID,sentDate,read">
      <row notificationID="293800585" typeID="16" senderID="1132552194" sentDate="2010-01-03 20:16:00" read="0" />
      <row notificationID="293727793" typeID="76" senderID="1000137" sentDate="2010-01-03 05:05:00" read="1" />
    </rowset>
  </result>
  <cachedUntil>2010-01-04 05:57:52</cachedUntil>
  
< HTTP/1.1 200 OK
< Cache-Control: private
< Transfer-Encoding: chunked
< Content-Type: application/xml; charset=utf-8
< Server: Microsoft-IIS/7.0
< X-AspNet-Version: 2.0.50727
< X-Powered-By: ASP.NET
< Date: Mon, 04 Jan 2010 06:01:30 GMT
< 
<?xml version='1.0' encoding='UTF-8'?>
<eveapi version="2">
  <currentTime>2010-01-04 06:01:30</currentTime>
  <result>
    <rowset name="notifications" key="notificationID" columns="notificationID,typeID,senderID,sentDate,read" />
  </result>
  <cachedUntil>2010-01-04 06:31:30</cachedUntil>
  

  curl -v -d userID=4926447 -d apiKey=7A5E98CAAB4B27EA595A612EBFCA0093AEF4078B16C57070C31A8E5 -d characterID=280802741 http://api.eve-online.com/char/MailMessages.xml.aspx
  * About to connect() to api.eve-online.com port 80 (#0)
  *   Trying 87.237.39.199... connected
  * Connected to api.eve-online.com (87.237.39.199) port 80 (#0)
  > POST /char/MailMessages.xml.aspx HTTP/1.1
  > User-Agent: curl/7.19.4 (universal-apple-darwin10.0) libcurl/7.19.4 OpenSSL/0.9.8k zlib/1.2.3
  > Host: api.eve-online.com
  > Accept: */*
  > Content-Length: 108
  > Content-Type: application/x-www-form-urlencoded
  > 
  < HTTP/1.1 200 OK
  < Cache-Control: private
  < Transfer-Encoding: chunked
  < Content-Type: application/xml; charset=utf-8
  < Server: Microsoft-IIS/7.0
  < X-AspNet-Version: 2.0.50727
  < X-Powered-By: ASP.NET
  < Date: Mon, 04 Jan 2010 05:34:03 GMT
  < 
  <?xml version='1.0' encoding='UTF-8'?>
  <eveapi version="2">
    <currentTime>2010-01-04 05:34:03</currentTime>
    <result>
      <rowset name="mailMessages" key="messageID" columns="messageID,senderID,sentDate,title,toCorpOrAllianceID,toCharacterIDs,toListIDs,read">
        <row messageID="291140357" senderID="204039891" sentDate="2010-01-04 01:30:00" title="Found random crap at Jita" toCorpOrAllianceID="145087126" toCharacterIDs="" toListIDs="" read="0" />
        <row messageID="291008646" senderID="204039891" sentDate="2009-12-29 21:57:00" title="Re: w0rd" toCorpOrAllianceID="145087126" toCharacterIDs="688064565" toListIDs="" read="1" />
      </rowset>
    </result>
    <cachedUntil>2010-01-04 06:04:03</cachedUntil>
