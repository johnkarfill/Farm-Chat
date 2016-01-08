<%
    
         String username = (String)session.getAttribute("LoginUsername");

    %>
<!DOCTYPE html>
<html>  

    <title>Camera</title> 

   <head>
        <meta charset="utf-8" />
        <title>Add Contact</title>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Roboto:300' rel='stylesheet' type='text/css'>
        <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
<meta charset="utf-8">
<style>
#container { 
    margin: 100px auto;
    width: 200px;
    height: 175px;
    border: 10px #333 solid;
}
#video {
    width: 200px;
    height: 175px;
    background-color: #666;
}

#container2 {
    margin: 100px auto;
    width: 200px;
    height: 175px;
    border: 10px #333 solid;
}
#canvas {
    width: 200px;
    height: 175px;
    background-color: #666;
}


.wrapper {
    text-align: center;
    
}

body {
	    background-color:#555557;
	    padding:0;
	    margin:0;
	    overflow:hidden;
	    font-family:sans-serif;
	    -webkit-user-select: none;
	    -khtml-user-select: none;
	    -moz-user-select: none;
	    -ms-user-select: none;
	    user-select: none;
	}
	canvas {
	    border:1px solid #000;
	    float:left;
	    clear:both;
	}
	#download {
	    float:left;
	    cursor:pointer;
	    color:#ccc;
	    padding:3px;
	}
	#download:hover {
	    color:#fff;
	}
	
	div, input {
	    font-size:16px;
	    font-family:sans-serif;
	    border:1px solid #000;
	    border-radius: 5px;
	    float:left;
	    padding:5px;
	    width:50px;
	    margin:1px 1px;
	    background-color:#bbb;
	}
	input[type='text'] {
	    font-size:16px;
	    font-weight:bold;
	    width:70px;
	    text-align:center;
	    background-color:#fff;
	    padding-bottom:4px;
	}
	input[type='button'] {
	    font-size:16px;
	    font-weight:bold;
	    width:110px;
	    text-align:center;
	    background-color:#333;
	    color:#eee;
	    padding-bottom:4px;
	}
	input[type='button']:hover {
	    background-color:#fff463;
	    color:#000;
	}
	input[type='range'] {
	    width:100px;
	    margin:0 0 0 10px;
	}

</style>
</head>
  
<body>
    <div style="width:900px;height:800px; align-content: center;">
    
        <div style="width:500px;height:400px">
    
    <div id="container">
        <video id="video"></video>
    </div>
    
    <div class="wrapper">
    <button id="startbutton">chatPat!</button>
    <button id="deletebutton"> <a href="">Delete</a></button>
    <div id="btn-download"> <a href="#" class="button" id="btn-download"></a></div>
    </div>
    
    <div id="container2">
        <canvas id="canvas"></canvas>
    </div>
    
        </div>
    
    <div style="width:400px;height:200px;;">
    <a style="color:red;" id="download">Download as image</a>
    
  
    
    
    
    <form method="post" action="../hello" enctype="multipart/form-data">
            <table border="0">
                <tr>
                    <td>SEND TO  </td>
                <input type="hidden" name="firstname" value="<% out.print(username);%>" />
                    <td><input type="text" name="lastName" size="50"/></td>
                </tr>
               
                <tr>
                    <td>Photo: </td>
                    <td><input type="file" name="photo" size="250"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" width="200" value="Send">
                    </td>
                </tr>
            </table>
        </form>
    
    
    
    </div>
    </div>
    
    

    
    
    
    
    
    
    
    
    
    
    
    <script> var data=1;
    
    
    
    
    
    
    /**
 *    Ken Fyrstenberg Nilsen
 *    Abidas Software
*/
var canvas = document.getElementById('canvas'),
    ctx = canvas.getContext('2d');

/**
 * Demonstrates how to download a canvas an image with a single
 * direct click on a link.
 */
function doCanvas() {
    /* draw something */
    ctx.fillStyle = '#f90';
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    ctx.fillStyle = '#fff';
    ctx.font = '60px sans-serif';
    ctx.fillText('Code Project', 10, canvas.height / 2 - 15);
    ctx.font = '26px sans-serif';
    ctx.fillText('Click link below to save this as image', 15, canvas.height / 2 + 35);
}

/**
 * This is the function that will take care of image extracting and
 * setting proper filename for the download.
 * IMPORTANT: Call it from within a onclick event.
*/
function downloadCanvas(link, canvasId, filename) {
    link.href = document.getElementById(canvasId).toDataURL();
    link.download = filename;
}

/** 
 * The event handler for the link's onclick event. We give THIS as a
 * parameter (=the link element), ID of the canvas and a filename.
*/
document.getElementById('download').addEventListener('click', function() {
    downloadCanvas(this, 'canvas', 'test.png');
}, false);

/**
 * Draw something to canvas
 */
doCanvas();
    
    
    
    
    
    
    
    
    
    </script>
            <!--<img id="photo" alt="photo">-->
<script id="jsbin-javascript">
    
 
    
(function() {

  var streaming = false,
      video        = document.querySelector('#video'),
      canvas       = document.querySelector('#canvas'),
      photo        = document.querySelector('#photo'),
      startbutton  = document.querySelector('#startbutton'),
      width = 120,
      height = 0;

var button = document.getElementById('btn-download');
        button.addEventListener('click', function (e) {
            var dataURL = canvas.toDataURL('image/png');
            button.href = dataURL;
    });
  navigator.getMedia = ( navigator.getUserMedia ||
                         navigator.webkitGetUserMedia ||
                         navigator.mozGetUserMedia ||
                         navigator.msGetUserMedia);

  navigator.getMedia(
    {
      video: true,
      audio: false
    },
    function(stream) {
      if (navigator.mozGetUserMedia) {
        video.mozSrcObject = stream;
      } else {
        var vendorURL = window.URL || window.webkitURL;
        video.src = vendorURL.createObjectURL(stream);
      }
      video.play();
    },
    function(err) {
      console.log("An error occured! " + err);
    }
  );

  video.addEventListener('canplay', function(ev){
    if (!streaming) {
      height = video.videoHeight / (video.videoWidth/width);
      video.setAttribute('width', width);
      video.setAttribute('height', height);
      canvas.setAttribute('width', width);
      canvas.setAttribute('height', height);
      streaming = true;
    }
  }, false);

  function takepicture() {
    canvas.width = width;
    canvas.height = height;
    canvas.getContext('2d').drawImage(video, 0, 0, width, height);
    data = canvas.toDataURL('image/png');
    photo.setAttribute('src', data);
    
  }

  startbutton.addEventListener('click', function(ev){
      takepicture();
    ev.preventDefault();
  }, false);

})();

function sendInfo2()  
{  

alert("OK");
var to=$("#friendname").val();
var msg=$("#msg").val();

alert(data);
$("#icon").value=data;

var url="/Farm-Chat/controllers/AddMsg.jsp?friendname="+to+"&msg="+msg+"&data=data";
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
request=new ActiveXObject("Microsoft.XMLHTTP");  
}  
  
try{  
request.onreadystatechange=getInfo2;  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  




function getInfo2(){  
if(request2.readyState==4){  
var val=request2.responseText;  
//document.getElementById("amit2").innerHTML=val;  
}  
}   
</script>

</body>
</html> 