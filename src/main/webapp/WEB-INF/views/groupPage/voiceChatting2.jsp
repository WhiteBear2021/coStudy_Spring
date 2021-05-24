<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>KOSTA</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet" />
</head>

<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<ul
			class="navbar-nav sidebar" style="background-color:#3D5A5B"
			id="accordionSidebar"></ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop"
					class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>
				<h3 class="h3 mb-4 text-gray-800">스터디 음성채팅방</h3>
				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<br />

					<!-- Content Row -->
					<div class="row">
						<div class="col-xl-6 col-lg-6">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="font-weight-bold" style="color:#3D5A5B">나</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div class="thumnail-wrapper">
										<div class="thumnail">
											<div class="centered text-center">
												<img alt="프로필사진 없음" src="/resources/img/profile.jpg">
											</div>
										</div>
									</div>
									<!-- 음성만 사용시 video가 아닌 audio로 설정. remote audio에 대하여 모두 개별적인 audio를 사용해야함.
                      localAudio는 muted로 처리해야함. 안그러면 하울링 남-->
									<audio id="myVideo" class="remote-video center w-300 h-300"
										autoplay muted controls playsinline
										style="display:none;"></audio>

									<h6 id="waitingTv" class="m-0 font-weight-bold text-primary"
										style="z-index: 3; position: absolute; bottom: 25px; left: 45px; visibility: hidden;">
										입장하는중</h6>
									<div class="row">
										<!--Audio Input-->
										<span class="col-lg-4 mg-4">
											<div class="small mb-1">마이크 선택</div>
											<div class="small mb-3">
												<select id="audioInputSelect"
													onchange="changeAudioInputDevice()"
													class="custom-select custom-select-sm form-control form-control-sm"></select>
											</div>
										</span>

									</div>
									<div class="row">
										<div class="mt-12 ml-auto">
											<span class="mr-2"> <input id="channelNameInput"
												class="text-center" type="text" placeholder="channel name"
												autofocus value="" />
											</span> <span class="text-center"> <a id="channelBtn" href="#"
												class="btn btn-user text-center" style="background-color:#3D5A5B; color:white"> 채팅 시작 </a>
											</span>
										</div>
									</div>
									</main>
								</div>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold" style="color:#3D5A5B">스터디 참여자 목록</h6>
								</div>
								<!-- Card Body -->
								<div class="card-body">
									<main id="lvChannel" class="text-center"></main>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->

				<link rel="stylesheet"
					href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" />
				<!-- The webrtc adapter is required for browser compatibility -->
				<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/@remotemonster/sdk"></script>

				<script>
            const channelButton = document.querySelector("#channelBtn");
            const channelList = document.getElementById("lvChannel");
            const channelNameInput = document.getElementById(
              "channelNameInput"
            );
            const waitingTv = document.getElementById("waitingTv");
            const videoInputSelect = document.getElementById(
              "videoInputSelect"
            );
            const audioInputSelect = document.getElementById(
              "audioInputSelect"
            );
            const videoCodecSelect = document.getElementById(
              "videoCodecSelect"
            );
            const resolutionSelect = document.getElementById(
              "resolutionSelect"
            );
            const otherAudios= document.getElementById("otherAudios");
            const videoFPSInput = document.getElementById("videoFPSInput");
            let isConnected = false;
            let isCaster = false;
            let myChannelId;
            let remon;
            let viewerMap = {}
            let dummyRemon;
            const key = "ca804846fa2f723da39769e566573a7452b7dce2a769befcd933a5530934f9cf";
            const serviceId = "5122057a-631a-4ba4-8111-7b3457480d7d";
            var myRoomChId;
            var waitingLoop;
            let cameraList = [];
            let micList = [];
            createDummyRemonForSearchLoop();
            startSearchLoop();

            // please register your own service key from remotemonster site.
            let config = {
              credential: {
            	  key: "ca804846fa2f723da39769e566573a7452b7dce2a769befcd933a5530934f9cf",
                  serviceId: "5122057a-631a-4ba4-8111-7b3457480d7d",
                wsurl : "wss://signal.remotemonster.com/ws",
                resturl : "https://signal.remotemonster.com/rest",

            },
              view: {
                //remote: "#remoteVideo",
                local: "#myVideo"
              },
              media: {
                video: false,
                audio: true
              }
            };

            const listener = {
              onConnect(chid) {
                console.log("remon.listener.onConnect ${chid} at listener");
              },
              onComplete() {
                myRoomChId = remon.getChannelId();
                console.log("remon.listener.onComplete " + remon.getChannelId());
                setViewsViaParameters(false, "hidden", "끝내기", "hidden");
              },
              onDisconnectChannel() {
                // is called when other peer hang up.
                console.log("remon.listener.onDisconnectChannel ${remon.getChannelId()}")
                remon.close();
                isConnected = false;
                setViewsViaParameters(false, "hidden", "채팅 시작", "visible");
              },
              onClose() {
                // is called when remon.close() method is called.
                console.log("remon.listener.onClose: ${remon.getChannelId()}");
                remon.close();

                isConnected = false;
                setViewsViaParameters(false, "hidden", "채팅 시작", "visible");
              },
              onError(error) {
                console.log("remon.listener.onError: ${remon.getChannelId()} ${error}");
              },
              onStat(result) {
                // console.log(`EVENT FIRED: onStat: ${result}`);
              }
            };
            let viewerConfig = {
              credential: {
            	  key: "ca804846fa2f723da39769e566573a7452b7dce2a769befcd933a5530934f9cf",
                  serviceId: "5122057a-631a-4ba4-8111-7b3457480d7d",
                wsurl : "wss://signal.remotemonster.com/ws",
                resturl : "https://signal.remotemonster.com/rest",

              },
              view: {
                remote: null,
                local: null
              },
              media: {
                video: {
                  width: "320",
                  height: "240",
                  codec: "h264",
                  maxBandwidth: 100,
                  frameRate: { max: 25, min: 25 }
                },
                audio: true
              }
            };
            const getViewerlistener = (id)=>{

              return {
                  onConnect(chid) {
                },
                  onComplete() {
                    console.log("getViewerListener.onComplete: ${viewerMap[id].remon.getChannelId()}");
                },
                  onDisconnectChannel() {
                  // is called when other peer hang up.
                  console.log("getViewerListener.onDisconnectChannel: ${viewerMap[id].remon.getChannelId()}");
                  remon.close();
                  isConnected = false;
                },
                  onClose() {
                    console.log("getViewerListener.onClose: ${viewerMap[id].remon.getChannelId()}");
                    remon.close();
                },
                  onError(error) {
                    console.log("getViewerListener.onError: ${viewerMap[id].remon.getChannelId()}");
                },
                  onStat(result) {
                }
              }
            }

            function setViewsViaParameters(
              runWaitLoop,
              waitingTvVisibility,
              btnText,
              inputVisiblility
            ) {
              if (runWaitLoop) {
                waitingMsgLoop();
              } else {
                clearInterval(waitingLoop);
              }
              waitingTv.style.visibility = waitingTvVisibility;
              channelButton.innerHTML = btnText;
              channelNameInput.style.visibility = inputVisiblility;
            }

            function start() {
              if (isConnected) {
                isConnected = false;
                isCaster = false;
                Object.keys(viewerMap).forEach(videoId=>{
                    viewerMap[videoId].remon && viewerMap[videoId].remon.close()
                })
                remon.close();
                myChannelId = "";
                setViewsViaParameters(false, "hidden", "채팅 다시시작", "visible");
              } else {
                isConnected = true;
                isCaster = true;

                remon = new Remon({ config, listener });
                myChannelId = channelNameInput.value
                  ? channelNameInput.value
                  : getRandomId();
                remon.createRoom(myChannelId)
                setViewsViaParameters(true, "visible", "끝내기", "hidden");
              }
            }

            function getRandomId() {
              var text = "";
              var possible =
                "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
              for (var i = 0; i < 5; i++)
                text += possible.charAt(
                  Math.floor(Math.random() * possible.length)
                );
              return text;
            }

            channelButton.addEventListener(
              "click",
              evt => {
                start(false);
                evt.preventDefault();
              },
              false
            );

            function createDummyRemonForSearchLoop() {
              if (dummyRemon) dummyRemon.close();
              let cfg = {
                credential: { key: key, serviceId: serviceId },
                view: { local: "#localVideo1", remote: "#remoteVideo1" },
                media: { audio: true, video: true }
              };
              // cfg.credential.wsurl = "ws://localhost:8082/ws";
              // cfg.credential.resturl = "http://localhost:8081/rest";
              cfg.credential.wsurl = "wss://signal.remotemonster.com/ws";
              cfg.credential.resturl = "https://signal.remotemonster.com/rest";

              dummyRemon = new Remon({ config: cfg });
            }

            function waitingMsgLoop() {
              var numOfPoint = 0;
              var pointStr = "";
              waitingLoop = setInterval(async function() {
                pointStr = "";
                numOfPoint++;
                if (numOfPoint === 4) numOfPoint = 0;
                for (var i = 0; i < numOfPoint; i++) {
                  pointStr += ".";
                }
                waitingTv.innerText = "waiting" + pointStr;
              }, 3000);
            }

            function startSearchLoop() {
              setInterval(async function() {
                dummyRemon.config.credential.serviceId = serviceId;
                dummyRemon.config.credential.key = key;
                var searchResult = await dummyRemon.fetchRooms(channelNameInput.value);
                Object.keys(viewerMap).forEach(videoId=>{
                  if(!searchResult.map(x=>x.id).includes(videoId.replace("-",":"))) {
                    viewerMap[videoId].remon && viewerMap[videoId].remon.close()
                    document.getElementById(videoId).remove()
                    document.getElementById("btn-"+videoId).remove()
                    delete viewerMap[videoId]
                  }
                })
                searchResult.forEach(({id}, i) => {
                  var chid = id;
                  id = id.replace(":","-");
                  //console.log(id)
                  //TODO:
                  if ( chid !== myRoomChId && document.getElementById(id) == null) {
                    const audioAttrs = {
                      id :id,
                      class : "remote-video",
                      autoplay : true,
                      controls: true,
                      playsinline: true,
                      style :"display: none;"
                    }
                    let newAudio = document.createElement("audio")
                    Object.keys(audioAttrs).forEach(key => newAudio.setAttribute(key, audioAttrs[key]))
                    viewerMap[newAudio.id] = newAudio
                    lvChannel.appendChild(newAudio)

                    let btn = document.createElement("input");
                    btn.type = "button";
                    btn.id = "btn-"+id
                    btn.name = id;
                    btn.value = id;
                    btn.className = "btn btn-primary btn-user btn-block text-center";
                    btn.addEventListener(
                      "click",
                      evt => {
                        console.log("new remote audio id = ${newAudio.id}");
                        viewerConfig.view.remote = "#${newAudio.id}"
                        newAudio.remon = new Remon({ config: viewerConfig, listener:getViewerlistener(newAudio.id) })
                        newAudio.remon.joinCast(newAudio.id.replace("-",":"))

                      },
                      false
                    );
                    channelList.appendChild(btn);
                  }
                });
              }, 4000);
            }

            async function getDevices() {
              var devices = await navigator.mediaDevices.enumerateDevices();
              for (let i = 0; i < devices.length; i++) {
                let device = devices[i];
                if (device.kind === "audioinput") {
                  micList.push({ text: device.label, id: device.deviceId });
                }
                // else if (device.kind === 'audiooutput') {
                //     speakerList.push({ text: device.label, id: device.deviceId })
                // }
              }
              for (let i = 0; i < micList.length; i++) {
                const audioInputOption = document.createElement("option");
                audioInputOption.value = micList[i].id;
                audioInputOption.text = micList[i].text;
                audioInputSelect.appendChild(audioInputOption);
              }
            }
            function changeAudioInputDevice() {
              remon.setAudioDevice(
                audioInputSelect.options[audioInputSelect.selectedIndex].value
              );
            }
            getDevices();
          </script>
			</div>
			<!-- End of Main Content -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->


	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

</body>
</html>
