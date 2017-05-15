<%-- 
    Document   : index
    Created on : May 15, 2017, 2:27:26 PM
    Author     : edwin < edwinkun at gmail dot com >
--%>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            function getAjax(url, success) {
                var xhr = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
                xhr.open('GET', url);
                xhr.onreadystatechange = function () {
                    if (xhr.readyState > 3 && xhr.status == 200)
                        success(xhr.responseText);
                };
                xhr.send();
                return xhr;
            }
            
            function callAjax() {
                getAjax('/JWP08/ActionServlet', function(data){ 
                    var obj = JSON.parse(data);
                    document.getElementById("nama").innerHTML = obj.name;
                    document.getElementById("alamat").innerHTML = obj.alamat;
                });
            }
            
            function callXMLAjax() {
                getAjax('/JWP08/ActionXmlServlet', function(data){ 
                    var content = ( new window.DOMParser() ).parseFromString(data, "text/xml");
                    document.getElementById("nama").innerHTML = content.getElementsByTagName("nama")[0].childNodes[0].nodeValue;
                    document.getElementById("alamat").innerHTML = content.getElementsByTagName("alamat")[0].childNodes[0].nodeValue;
                });
            }
        </script>
    </head>
    <body>
        <div>API Call ke Servlet</div>
        <br />
        <br />
        <table>
            <tr>
                <td>
                    <input type="button" onclick="callAjax();" value="call JSON" />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" onclick="callXMLAjax();" value="call XML" />
                </td>
            </tr>
            <tr>
                <td>
                    isi value "Nama" hasil API Call adalah : <span id="nama"></span>
                </td>
            </tr>
            <tr>
                <td>
                    isi value "Alamat" hasil API Call adalah : <span id="alamat"></span>
                </td>
            </tr>
        </table>
    </body>
</html>
