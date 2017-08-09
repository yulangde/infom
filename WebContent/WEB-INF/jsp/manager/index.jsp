<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="zh-cn">
	<head>
		<title>后台管理登陆界面</title>
		<meta charset="utf-8">
		<style type="text/css">
			body {
				background-color: #326696;
				margin: 0px;
				overflow: hidden;
				font-family:Monospace;
				font-size:13px;
				text-align:center;
				font-weight: bold;
				text-align:center;
			}
			a {
				color:#0078ff;
			}
			
#divcomi{
	position: absolute;
	left: 580px;
	top: 256px;
	background-color: #ffffff;
	border: 1px solid black;
	/* for IE */
	filter: alpha(opacity=60);
	/* CSS3 standard */
	opacity: 0.6;
		}
.form-wrapper {
    padding-top: 10%;
    border-radius: 2px;
    margin: 50px auto;
    position: relative;
    width: 375px;
}

form {
    padding: 30px 20px 0;
}

.form-item {
    margin-bottom: 10px;
    width: 320px;
}

.form-item input {
    border: 1px solid #ccc;
    border-radius: 2px;
    color: #000;
    font-family: 'Open Sans', sans-serif;
    font-size: 1em;
    height: 50px;
    padding: 0 16px;
    transition: background 0.3s ease-in-out;
    width: 320px;
}

.form-item input:focus {
    outline: none;
    border-color: #9ecaed;
    box-shadow: 0 0 10px #9ecaed;
}

.button-panel {
    margin: 20px 5px 0;
    width: 150px;
	float:left;
}

.button-panel .button {
    background: #009dff;
    border: none;
    border-radius: 2px;
    color: #fff;
	/*光标变成一只手*/
    cursor: pointer;
    height: 50px;
    font-family: 'Open Sans', sans-serif;
    font-size: 1.2em;
    letter-spacing: 0.05em;
    text-align: center;
    transition:width 2s;
	-moz-transition:width 2s; /* Firefox 4 */
	-webkit-transition:width 2s; /* Safari and Chrome */
	-o-transition:width 2s; /* Opera */
    width: 150px;
}

.button:hover {
	width:200px;
    background: #00c8ff;
}
		</style>
	</head>
	<body>
    
    
    
		<script type="text/javascript" src="theme/three.min.js"></script>
		<script type="text/javascript" src="theme/Detector.js"></script>
		<script id="vs" type="x-shader/x-vertex">

			varying vec2 vUv;

			void main() {

				vUv = uv;
				gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );

			}
		</script>


    <div id="divcomi" style="width:380px; height:350px; margin:auto;"><h2>欢迎进入后台管理登陆界面！</h2>
    	<form name="form" action="adminIndex.action">
		<div class="form">
			<div class="form-item">
				<input type="text" name="user" required placeholder="用户名" autocomplete="off">
			</div>
			<div class="form-item">
				<input type="password" name="password" required placeholder="密码" autocomplete="off">
              
			</div>
		<div class="button-panel">
        <input type="submit" class="button" title="登陆" value="登陆">
      </div>
	</div>
</form>
    </div>

		<script id="fs" type="x-shader/x-fragment">

			uniform sampler2D map;

			uniform vec3 fogColor;
			uniform float fogNear;
			uniform float fogFar;

			varying vec2 vUv;

			void main() {

				float depth = gl_FragCoord.z / gl_FragCoord.w;
				float fogFactor = smoothstep( fogNear, fogFar, depth );

				gl_FragColor = texture2D( map, vUv );
				gl_FragColor.w *= pow( gl_FragCoord.z, 20.0 );
				gl_FragColor = mix( gl_FragColor, vec4( fogColor, gl_FragColor.w ), fogFactor );

			}

		</script>

		
		<script type="text/javascript">

			if ( ! Detector.webgl ) Detector.addGetWebGLMessage();

			var container;
			var camera, scene, renderer;
			var mesh, geometry, material;

			var mouseX = 0, mouseY = 0;
			var start_time = Date.now();

			var windowHalfX = window.innerWidth / 2;
			var windowHalfY = window.innerHeight / 2;

			init();

			function init() {

				container = document.createElement( 'div' );
				document.body.appendChild( container );

				// Bg gradient

				var canvas = document.createElement( 'canvas' );
				canvas.width = 32;
				canvas.height = window.innerHeight;

				var context = canvas.getContext( '2d' );

				var gradient = context.createLinearGradient( 0, 0, 0, canvas.height );
				gradient.addColorStop(0, "#1e4877");
				gradient.addColorStop(0.5, "#4584b4");

				context.fillStyle = gradient;
				context.fillRect(0, 0, canvas.width, canvas.height);

				container.style.background = 'url(' + canvas.toDataURL('image/png') + ')';
				container.style.backgroundSize = '32px 100%';

				//

				camera = new THREE.PerspectiveCamera( 30, window.innerWidth / window.innerHeight, 1, 3000 );
				camera.position.z = 6000;

				scene = new THREE.Scene();

				geometry = new THREE.Geometry();

				var texture = THREE.ImageUtils.loadTexture( 'theme/cloud10.png', null, animate );
				texture.magFilter = THREE.LinearMipMapLinearFilter;
				texture.minFilter = THREE.LinearMipMapLinearFilter;

				var fog = new THREE.Fog( 0x4584b4, - 100, 3000 );

				material = new THREE.ShaderMaterial( {

					uniforms: {

						"map": { type: "t", value: texture },
						"fogColor" : { type: "c", value: fog.color },
						"fogNear" : { type: "f", value: fog.near },
						"fogFar" : { type: "f", value: fog.far },

					},
					vertexShader: document.getElementById( 'vs' ).textContent,
					fragmentShader: document.getElementById( 'fs' ).textContent,
					depthWrite: false,
					depthTest: false,
					transparent: true

				} );

				var plane = new THREE.Mesh( new THREE.PlaneGeometry( 64, 64 ) );

				for ( var i = 0; i < 8000; i++ ) {

					plane.position.x = Math.random() * 1000 - 500;
					plane.position.y = - Math.random() * Math.random() * 200 - 15;
					plane.position.z = i;
					plane.rotation.z = Math.random() * Math.PI;
					plane.scale.x = plane.scale.y = Math.random() * Math.random() * 1.5 + 0.5;

					THREE.GeometryUtils.merge( geometry, plane );

				}

				mesh = new THREE.Mesh( geometry, material );
				scene.add( mesh );

				mesh = new THREE.Mesh( geometry, material );
				mesh.position.z = - 8000;
				scene.add( mesh );

				renderer = new THREE.WebGLRenderer( { antialias: false } );
				renderer.setSize( window.innerWidth, window.innerHeight );
				container.appendChild( renderer.domElement );

				document.addEventListener( 'mousemove', onDocumentMouseMove, false );
				window.addEventListener( 'resize', onWindowResize, false );

			}

			function onDocumentMouseMove( event ) {

				mouseX = ( event.clientX - windowHalfX ) * 0.25;
				mouseY = ( event.clientY - windowHalfY ) * 0.15;

			}

			function onWindowResize( event ) {

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();

				renderer.setSize( window.innerWidth, window.innerHeight );

			}

			function animate() {

				requestAnimationFrame( animate );

				position = ( ( Date.now() - start_time ) * 0.03 ) % 8000;

				camera.position.x += ( mouseX - camera.position.x ) * 0.01;
				camera.position.y += ( - mouseY - camera.position.y ) * 0.01;
				camera.position.z = - position + 8000;

				renderer.render( scene, camera );

			}

		</script>
	</body>
</html>
