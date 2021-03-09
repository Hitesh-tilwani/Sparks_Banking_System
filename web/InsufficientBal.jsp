<%-- 
    Document   : Successful
    Created on : Mar 8, 2021, 11:58:31 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>      
        <title>Banking System</title>
              <style>
                  
                  .container{
  height: 0px;
  width: 0px;
  background: #000;
  margin: 0 auto;
  position: relative;
}

.wheel{
  border-radius: 50%;
  height: 100px;
  position: absolute;
  width: 100px;
  /*background: #000;*/
}
.wheel:after{
  background: none repeat scroll 0 0 #111111;
  border-radius: 36px;
  content: "";
  height: 60px;
  width: 60px;
  left: 50%;
  margin-left: -28px;
  margin-top: -28px;
  position: absolute;
  top: 50%;
  z-index: 3;
}
.wheel.one {
  left: 10px;
  top: 12px;
}
.wheel.two {
  left: 119px;
  top: 44px;
}
.wheel.three {
  left: 200px;
  top: 122px;
}

.wheel-inner {
  animation-iteration-count: infinite;
  background: none repeat scroll 0 0 #555555;
  border: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 50%;
  height: 100%;
  position: relative;
  width: 100%;
}
.wheel-inner .bar {
  background: none repeat scroll 0 0 #555555;
  border-left: 1px solid rgba(255, 255, 255, 0.1);
  border-radius: 2px;
  border-right: 1px solid rgba(255, 255, 255, 0.1);
  height: 25px;
  left: 50%;
  margin-left: -60px;
  margin-top: -12px;
  position: absolute;
  top: 50%;
  width: 120px;
}
.wheel-inner .bar:nth-child(2) {
  transform: rotate(60deg);
  -webkit-transform: rotate(60deg);
}
.wheel-inner .bar:nth-child(3) {
  transform: rotate(120deg);
  -webkit-transform: rotate(120deg);
}
@-webkit-keyframes clockwise {
  0% {
    -webkit-transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
  }
}
@-webkit-keyframes anticlockwise {
  0% {
    -webkit-transform: rotate(360deg);
  }
  100% {
    -webkit-transform: rotate(0deg);
  }
}
.wheel.one .wheel-inner, .wheel.three .wheel-inner {
  -webkit-animation: clockwise 5s linear infinite;
}
.wheel.two .wheel-inner {
  -webkit-animation: anticlockwise 5s linear infinite;
}
              </style>
    </head>
    <body>
        <h1 style="text-align: center; color: #3333ff; background-color: #ccffff; font-size: 70px;">Sorry For Inconvenience</h1>
        
        <h3 style="text-align: center; color : #003333; background-color: #ccffff;font-size: 40px;"> Insufficient Balance</h3>
        
 <a href="Customer.jsp"><button  style="margin-left: 20px; color: #3333ff; background-color: #99ffff;"type="button" class="btn btn-secondary">Back</button></a>        
        
        
        
        <div class="container">
  <div class="wheelbox">
    <div class="wheel one">
      <div class="wheel-inner">
        <div class="bar"></div>
        <div class="bar"></div>
        <div class="bar"></div>
      </div>
    </div>
    <div class="wheel two">
      <div class="wheel-inner">
        <div class="bar"></div>
        <div class="bar"></div>
        <div class="bar"></div>
      </div>
    </div>
    <div class="wheel three">
      <div class="wheel-inner">
        <div class="bar"></div>
        <div class="bar"></div>
        <div class="bar"></div>
      </div>
    </div>
  </div>
            <br>
            <br>
         
        
            
    </body>
</html>
