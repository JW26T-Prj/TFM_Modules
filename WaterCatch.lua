for _,f in next,{"AutoNewGame","AutoShaman","AutoTimeLeft","DebugCommand","AllShamanSkills","PhysicalConsumables","PrespawnPreview","MinimalistMode","WatchCommand"} do
	tfm.exec["disable"..f](true)
end
debug.disableEventLog(true)
system.disableChatCommandDisplay(nil, true)
if tfm.get.room.isTribeHouse == false then tfm.exec.setRoomMaxPlayers(35) end
barrier={type = 14,width = 10,height = 4000,miceCollision = true, friction = 0, groundCollision = true, foreground = false}
ground={type = 14,width = 3000,height = 10,miceCollision = true, friction = 1, groundCollision = true, foreground = false}
wood={type = 14,width = 800,height = 20,miceCollision = true, friction = 0.5, groundCollision = true}
shaman=""; alives=0; cannons=12; data={}; lang={}; ninjas={}; mode="load"; changed=false; loop=0; display=""; timer=0; xml=''; time_passed=0; time_remain=1024; mapa="@7967041";
active_imgs={}; active_imgs2={}; powerups_x={}; powerups_y={}; powerups_types={}; oxygen_x={}; oxygen_y={}; id=0; round=0; y_factor=600; depth_factor=1550;
dolphins={{1549,1821},{3404,1546},{5338,771},{5507,1958},{2915,1138},{1362,1228}}; dolphins_r={{2839,1928},{3945,1551},{5834,741},{6242,1488},{3792,832},{2057,878}}
dolphins2={{3952,821},{3154,1430}}; dolphins2_r={{4859,1854},{1296,1504}} 
f1={{1594,1971},{3099,1651},{4284,1401}}; f2={{1869,1971},{3119,1956},{5027,1901},{3152,1138}}; f3={{3449,1411},{1199,1191}}; f4={{2144,1893},{2977,999}}; f5={{1112,1323},{2572,2028},{6579,1306},{3564,902}}; 
f1_r={{4292,1941},{6197,1566},{1769,1131}}; f2_r={{5787,1848},{3869,963}}; f3_r={{5269,2023},{6377,1053}}; f4_r={{3444,986},{5617,792}}; f5_r={{1429,1783},{3289,1771},{2429,778}};

lang.br = {
	welcome = "<font color='#0080ff'><b>Bem-vindos ao module WaterCatch!</b>\n<VP>Fuja do shaman tubarão e sobreviva no perigoso rio!\n<J>Digite !help para ver a ajuda deste module.\n<BL>Gerenciado por Lacoste#8972",
	changelog = "• Pequenas mudanças internas",
	help = "<p align='center'><b>Bem-vindo ao module WaterCatch.</b><p align='left'>\n\nSe você for um rato, você deverá fugir do shaman (ou o tubarão), tomando cuidado para que ele não chegue muito perto de você. Se quiser ficar dentro do rio, tome cuidado: se ficar debaixo d'água por muito tempo, você pode morrer afogado!\n\nSe você for o shaman (no caso, o tubarão), seu objetivo será caçar todos os ratos, tentando não deixar nenhum sequer vivo!\n<R>Ah, e não esqueça de se mexer, ou irá morrer por inatividade!</b>\n\n<VP>Os círculos com <N>'?'<VP> são powerups, que geram efeitos aleatórios nos ratos.\nOs círculos com <N>'O2'<VP> são reposições de oxigênio.\nEstes powerups podem ser acionados pressionando ESPAÇO em cima deles.\n<N>Você pode ver os possíveis efeitos dos powerups indo no Menu e em Powerups.",
	powerups = "<font size='11'>Os seguintes powerups estão disponíveis no momento:\n<ROSE><b>• VAMPIRO</b><N>\nTransforma seu rato em um vampiro, forçando você a ir para fora do rio.\n<ROSE><b>• AFUNDAR</b><N>\nCria uma curta anomalia que puxa todos os ratos para o fundo do rio.\n<ROSE><b>• MEEP</b><N>\nTe dá o poder de usar o Meep!\n<ROSE><b>• SUFOCO</b><N>\nDiminui o seu nível de oxigênio. Caso seu nível de oxigênio esteja muito baixo e você pegue este powerup, você morrerá afogado.\n<ROSE><b>• CONGELAR</b><N>\nCongela o seu rato.\n<ROSE><b>• QUEIJO</b><N>\nDá queijo para o seu rato.\n<ROSE><b>• IMPULSO</b><N>\nTe dá um impulso para frente. Pode ajudar a fugir do shaman...\n<ROSE><b>• SUBIDA</b><N>\nGera uma força que te empurra para fora do rio.\n<ROSE><b>• CRESCER</b><N>\nAumenta temporariamente o tamanho do seu rato.",
	shark = "Tubarão",
	whale = "Baleia",
	pdn = "Peixe Diabo-Negro",
	ws = "Tubarão-Branco",
	use = "Usar!",
	tt = "Tubarão-Tigre",
	tm = "Tubarão-Martelo",
	dskins = "Desativar skins",
	shamwin = "<VP><b>O shaman matou todos os ratos e venceu o jogo!</b>\n<N>Próxima rodada iniciando em 15 segundos.",
	nosham = "<R>O shaman morreu, está AFK ou saiu da sala. Iniciando nova partida...",
	watercatch_help = "Ajuda do Module WaterCatch",
	watercatch_power = "Powerups do Module WaterCatch",
	skinwarn = "<R>As skins de tubarão serão exibidas quando você for shaman, e estiver dentro do rio!",
	loadingmap = "Carregando mapa. Por favor, aguarde...<",
	noobjects = "<VP>O shaman não pode mais usar objetos!",
	invoke1 = "<VP>O shaman agora pode usar",
	invoke2 = "objetos",
	nobjects = "<R>Você não pode mais invocar objetos! Fazer isso ocasionará na sua morte e na perda de sua vez de shaman.",
	activate = "acionou o powerup",
	vampire = "VAMPIRO", cheese = "QUEIJO", submerge = "AFUNDAR", boost = "IMPULSO", big = "CRESCER", up = "SUBIDA", suffocation = "SUFOCO", freeze = "CONGELAR",
	madeby = "desenvolvido por",
	nosouris = "<R>Jogadores convidados não podem jogar este jogo. Logue em uma conta para jogar.",
	shammove = "<ROSE>Não esqueça de se mover, ou você perderá sua vez de shaman!",
	drowned = "morreu afogado!",
	lowoxygen = "<R>Você está ficando sem oxigênio! Saia da água o mais rápido possível ou você morrerá afogado!",
	goshaman = "<J><b>O shaman foi liberado! Salvem-se quem puder!</b>\n\n<ROSE>Use o comando !tc [mensagem] para falar no chat sem que o shaman saiba.",
	timeup = "Tempo esgotado!", survived = "ratos sobreviveram! Iniciando nova partida...",
	using = "Você está agora usando a skin", disabled = "<N>Você desativou as skins de tubarão.",
	oxylevel = "Oxigênio",
	remain60 = "<ROSE>Restam 60 segundos!", remain30 = "<ROSE>Restam 30 segundos!",
	remainmices = "Ratos restantes: "
}
lang.en = {
	welcome = "<font color='#0080ff'><b>Welcome to the WaterCatch module!</b>\n<VP>Run away from the shark shaman and survive in the dangerous river!\n<J>Type !help to see the game help.\n<BL>Managed by Lacoste#8972",
	changelog = "• Small internal changes",
	help = "<p align='center'><b>Welcome to module WaterCatch.</b><p align='left'>\n\nIf you are a mice, you must run away from the shaman (the shark), being careful not to let him get too close to you. If you want to stay in the river, be careful: if you stay underwater for too long, you might drown!\n\nIf you are the shaman (in this case, the shark), your goal will be to hunt all the mices, trying not to leave a single one alive!\n<R>Oh, and don't forget to move, or you will die by inactivity!</b>\n\n<VP>The circles with '?' are powerups, which generate random effects on the players.\nThe circles with 'O2' are oxygen repositions.\nThese powerups can be activated by pressing SPACE on them.\n<N>You can see the possible effects of the powerups by going to the Menu and then Powerups.",
	powerups = "<font size='11'>The following powerups are available at moment:\n<ROSE><b>• VAMPIRE</b><N>\nTurns your mouse into a vampire, forcing you out of the river.\n<ROSE><b>• SUBMERGE</b><N>\nCreate an anomaly that pushes all the mices to the bottom of the river.\n<ROSE><b>• MEEP</b><N>\nGives the MEEP ability!\n<ROSE><b>• SUFFOCATE</b><N>\nReduces your oxygen level. If your oxygen level is very low and you enable this powerup, you will drown in the river.\n<ROSE><b>• FREEZE</b><N>\nFreeze your mice.\n<ROSE><b>• CHEESE</b><N>\nGive cheese to your mice.\n<ROSE><b>• BOOST</b><N>\nGives you a boost forward. It can help you escape the shaman...\n<ROSE><b>• GO UP</b><N>\nIt generates a force that pushes you out of the river.\n<ROSE><b>• GROW</b><N>\nIncreases temporarily the size of your mice.",
	shark = "Shark",
	whale = "Whale",
	pdn = "Black Devil Fish",
	ws = "White Shark",
	use = "Enable!",
	tt = "Tiger Shark",
	tm = "Hammer Shark",
	dskins = "Remove skins",
	shamwin = "<VP><b>The shaman killed all the mices and won the game!</b>\n<N>Next round starting in 15 seconds.",
	nosham = "<R>The shaman died, is AFK or leaved the room. Starting new round...",
	watercatch_help = "Watercatch Help",
	watercatch_power = "Watercatch Powerups",
	skinwarn = "<R>The shark skins will only be visible when you are the shaman, and when you are underwater!",
	loadingmap = "Loading map. Please wait...<",
	noobjects = "<VP>The shaman cannot invoke objects!",
	invoke1 = "<VP>The shaman now can invoke",
	invoke2 = "objects",
	nobjects = "<R>You reached the object limit! Invoke another object will cause your death and the lose of your shaman turn.",
	activate = "enabled the following powerup:",
	vampire = "VAMPIRE", cheese = "CHEESE", submerge = "SUBMERGE", boost = "BOOST", big = "GROW", up = "GO UP", suffocation = "SUFFOCATION", freeze = "FREEZE",
	madeby = "developed by",
	nosouris = "<R>Souris players cannot enter this game. Login into an account to play.",
	shammove = "<ROSE>Don't forget to move, or you will lose your shaman turn!",
	drowned = "drowned!",
	lowoxygen = "<R>Your oxygen level is very low! Get out of the water as quickly as possible or you will drown!",
	goshaman = "<J><b>The shaman was released!</b>\n\n<ROSE>Use the !tc [text] command to talk with other players, without the shaman influence.",
	timeup = "Time is up!", survived = "mices survived! Starting new round...",
	using = "You are now using the following skin:", disabled = "<N>You disabled the shark skins.",
	oxylevel = "Oxygen Level",
	remain60 = "<ROSE>60 seconds remaining!", remain30 = "<ROSE>30 seconds remaining!", 
	remainmices = "Remaining mice: "
}

if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
	text = lang.br
else
	text = lang.en
end

numbers1={{78,97,109,105,100,101,101,112,119,105,110,35,48,48,48,48},
{82,105,118,101,110,35,49,54,51,48},
{65,107,119,105,109,111,115,35,49,57,51,55},
{83,107,121,121,109,101,108,108,117,35,48,48,48,48},
{84,111,114,110,97,100,117,117,122,105,110,35,52,51,48,53},
{75,108,97,117,115,35,52,49,51,49},
{74,114,109,101,116,101,98,97,108,97,35,48,51,50,49},
{83,101,110,110,97,35,54,49,53,51},
{76,117,105,115,105,110,35,49,55,49,55},
{84,105,116,97,110,53,48,35,48,48,48,48},
{78,101,107,97,110,35,48,48,48,48}}
for i=1,rawlen(numbers1) do
	final=""
	for j=1,rawlen(numbers1[i]) do
		final=final..string.char(numbers1[i][j])
	end
	table.insert(ninjas,final)
end

function verifyNinjas(name)
	for i=1,rawlen(ninjas) do
		if ninjas[i] == name then
			return true
		end
	end
end
function showMessage(message,name)
	if changed == true then
		temp_text=string.gsub(message,"<b>","")
		temp_text=string.gsub(temp_text,"</b>","")
		if tfm.get.room.isTribeHouse == false then
			debug.disableEventLog(true)
			tfm.exec.chatMessage(message,name)
		elseif tfm.get.room.isTribeHouse == true then
			if name == nil then
				if data[name] and data[name].opened == false then
					updateArea1(message)
				end
			else
				if data[name] and data[name].opened == false then
					updateArea2(message,name)
				end
			end
		end
	end
end
function updateArea1(text)
	ui.updateTextArea(3000,"<p align='right'><font size='11'>"..text.."",nil)
	contador_display=15;
end
function updateArea2(text,name)
	if data[name] then
		data[name].area=text;
		ui.addTextArea(4000,"<p align='right'><font size='11'>"..data[name].area.."",name,470,115,320,50,0x101010,0x59251a,0.35,true)
		contador_display=15;
	end
end
function showAvailableSharks(name)
	coords={{83,60},{83,113},{83,158},{83,215},{83,272},{303,63},{293,110},{293,159},{293,207},{516,53},{503,110},{503,163},{496,214},{83,313},{493,316},{293,318},{500,268}}
	imgs={"18309d69a5a.png","18309d64e58.png","18309d7325a.png","18412b7b55e.png","18412b71ce2.png","18309d6029f.png","18412b7695c.png","1883efa677b.png","18309d6e65a.png","185c2e9722e.png","185c2ea0c4f.png","185c2e9bf2f.png","1883efb0ba3.png","19650c4bf68.png","19650c4ee4b.png","19650c51d2c.png","19650c54c10.png"}
	for i=1,rawlen(imgs) do
		image_id=tfm.exec.addImage(imgs[i],"&1",coords[i][1],coords[i][2]+5,name,0.5,0.5,0,1.0)
		table.insert(data[name].active_imgs,image_id)
	end
	image_id=tfm.exec.addImage("1883efa1974.png","&1",293,263,name,0.2,0.2,0,1.0)
	table.insert(data[name].active_imgs,image_id)
	ui.addTextArea(1006,"<font face='Ubuntu Mono,Cascadia Mono,Consolas'><font size='10'><b>"..text.shark.." 1</b>\n\n<a href='event:a1'>"..text.use.."</a>\n\n<b>"..text.shark.." 2</b>\n\n<a href='event:a2'>"..text.use.."</a>\n\n<b>"..text.shark.." 3</b>\n\n<a href='event:a3'>"..text.use.."</a>\n\n<b>"..text.shark.." 4</b>\n\n<a href='event:a6'>"..text.use.."</a>\n\n<b>Barracuda 1</b>\n\n<a href='event:a13'>"..text.use.."</a>\n\n<b>Orca</b>\n\n<a href='event:a15'>"..text.use.."</a>",name,170,60,175,345,0,0,1.0,true)
	ui.addTextArea(1007,"<font face='Ubuntu Mono,Cascadia Mono,Consolas'><font size='10'><b>"..text.ws.." 1</b>\n\n<a href='event:a4'>"..text.use.."</a>\n\n<b>"..text.ws.." 2</b>\n\n<a href='event:a7'>"..text.use.."</a>\n\n<b>"..text.ws.." 3</b>\n\n<a href='event:a5'>"..text.use.."</a>\n\n<b>"..text.tm.." 1</b>\n\n<a href='event:a8'>"..text.use.."</a>\n\n<b>"..text.whale.." 3</b>\n\n<a href='event:a14'>"..text.use.."</a>\n\n<b>"..text.tm.." 2</b>\n\n<a href='event:a17'>"..text.use.."</a>",name,380,60,175,345,0,0,1.0,true)
	ui.addTextArea(1008,"<font face='Ubuntu Mono,Cascadia Mono,Consolas'><font size='10'><b>"..text.pdn.."</b>\n\n<a href='event:a9'>"..text.use.."</a>\n\n<b>"..text.tt.."</b>\n\n<a href='event:a11'>"..text.use.."</a>\n\n<b>"..text.whale.." 1</b>\n\n<a href='event:a10'>"..text.use.."</a>\n\n<b>"..text.whale.." 2</b>\n\n<a href='event:a12'>"..text.use.."</a>\n\n<b>Barracuda 2</b>\n\n<a href='event:a18'>"..text.use.."</a>\n\n<b>"..text.whale.." 4</b>\n\n<a href='event:a16'>"..text.use.."</a>\n<b><a href='event:a0'>"..text.dskins.."</a>",name,590,60,175,345,0,0,1.0,true)
end
function removeImagePlayers(name)
	if rawlen(data[name].active_imgs) > 0 then
		for _,id in next,data[name].active_imgs do
			tfm.exec.removeImage(id)
		end
		data[name].active_imgs={}
	end
end
function displayShark(name,type,reverse)
	if type == 1 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18309d69a5a.png","$"..name.."",85,-42,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18309d69a5a.png","$"..name.."",-90,-42,nil,1,1)
		end
	elseif type == 2 then
		if reverse == true then
			data[name].shark_id=tfm.exec.addImage("18309d64e58.png","$"..name.."",85,-31,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18309d64e58.png","$"..name.."",-90,-31,nil,1,1)
		end
	elseif type == 3 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18309d7325a.png","$"..name.."",78,-50,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18309d7325a.png","$"..name.."",-80,-50,nil,1,1)
		end
	elseif type == 4 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18309d6029f.png","$"..name.."",70,-29,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18309d6029f.png","$"..name.."",-50,-29,nil,1,1)
		end
	elseif type == 5 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("1883efa677b.png","$"..name.."",-90,-45,nil,1,1)
		else
			data[name].shark_id=tfm.exec.addImage("1883efa677b.png","$"..name.."",80,-45,nil,-1,1)
		end
	elseif type == 6 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18412b7b55e.png","$"..name.."",85,-40,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18412b7b55e.png","$"..name.."",-90,-40,nil,1,1)
		end
	elseif type == 7 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18412b7695c.png","$"..name.."",65,-39,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18412b7695c.png","$"..name.."",-70,-39,nil,1,1)
		end
	elseif type == 8 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18309d6e65a.png","$"..name.."",85,-55,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18309d6e65a.png","$"..name.."",-90,-55,nil,1,1)
		end
	elseif type == 9 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("185c2e9722e.png","$"..name.."",35,-60,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("185c2e9722e.png","$"..name.."",-40,-60,nil,1,1)
		end
	elseif type == 10 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("185c2e9bf2f.png","$"..name.."",65,-44,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("185c2e9bf2f.png","$"..name.."",-70,-44,nil,1,1)
		end
	elseif type == 11 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("185c2ea0c4f.png","$"..name.."",75,-36,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("185c2ea0c4f.png","$"..name.."",-80,-36,nil,1,1)
		end
	elseif type == 12 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("1883efb5982.png","$"..name.."",-145,-30,nil,0.5,0.5)
		else
			data[name].shark_id=tfm.exec.addImage("1883efb5982.png","$"..name.."",130,-30,nil,-0.5,0.5)
		end
	elseif type == 13 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("18412b71ce2.png","$"..name.."",75,-26,nil,-1,1)
		else
			data[name].shark_id=tfm.exec.addImage("18412b71ce2.png","$"..name.."",-80,-26,nil,1,1)
		end
	elseif type == 14 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("1883efa1974.png","$"..name.."",-115,-37,nil,0.5,0.5)
		else
			data[name].shark_id=tfm.exec.addImage("1883efa1974.png","$"..name.."",100,-37,nil,-0.5,0.5)
		end
	elseif type == 15 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("19650c4a7f6.png","$"..name.."",-125,-44,nil,0.5,0.5)
		else
			data[name].shark_id=tfm.exec.addImage("19650c4a7f6.png","$"..name.."",125,-44,nil,-0.5,0.5)
		end
	elseif type == 16 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("19650c4d6da.png","$"..name.."",-125,-44,nil,0.5,0.5)
		else
			data[name].shark_id=tfm.exec.addImage("19650c4d6da.png","$"..name.."",125,-44,nil,-0.5,0.5)
		end
	elseif type == 17 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("19650c505be.png","$"..name.."",-125,-44,nil,0.5,0.5)
		else
			data[name].shark_id=tfm.exec.addImage("19650c505be.png","$"..name.."",125,-44,nil,-0.5,0.5)
		end
	elseif type == 18 then
		if reverse == false then
			data[name].shark_id=tfm.exec.addImage("19650c5349f.png","$"..name.."",-140,-46,nil,0.5,0.5)
		else
			data[name].shark_id=tfm.exec.addImage("19650c5349f.png","$"..name.."",140,-46,nil,-0.5,0.5)
		end
	end
end
function showWater(name)
	for d=1,rawlen(dolphins) do	tfm.exec.addImage("192e01914e1.png","?-1",dolphins[d][1],dolphins[d][2],name,0.5,0.5) end
	for e=1,rawlen(dolphins_r) do tfm.exec.addImage("192e01914e1.png","?-1",dolphins_r[e][1],dolphins_r[e][2],name,-0.5,0.5) end
	for d=1,rawlen(dolphins2) do tfm.exec.addImage("1860ee24f31.png","?-1",dolphins2[d][1],dolphins2[d][2],name,0.5,0.5) end
	for e=1,rawlen(dolphins2_r) do tfm.exec.addImage("1860ee24f31.png","?-1",dolphins2_r[e][1],dolphins2_r[e][2],name,-0.5,0.5) end
	for d=1,rawlen(f1) do tfm.exec.	addImage("192e0192c52.png","?-1",f1[d][1],f1[d][2],name,0.5,0.5) end
	for e=1,rawlen(f1_r) do	tfm.exec.addImage("192e0192c52.png","?-1",f1_r[e][1],f1_r[e][2],name,-0.5,0.5) end
	for d=1,rawlen(f2) do tfm.exec.addImage("192e01943c1.png","?-1",f2[d][1],f2[d][2],name)	end
	for e=1,rawlen(f2_r) do	tfm.exec.addImage("192e01943c1.png","?-1",f2_r[e][1],f2_r[e][2],name,-1) end
	for d=1,rawlen(f3) do tfm.exec.addImage("192e0195b33.png","?-1",f3[d][1],f3[d][2],name)	end
	for e=1,rawlen(f3_r) do	tfm.exec.addImage("192e0195b33.png","?-1",f3_r[e][1],f3_r[e][2],name,-1) end
	for d=1,rawlen(f4) do tfm.exec.addImage("192e01972a4.png","?-1",f4[d][1],f4[d][2],name,0.5,0.5)	end
	for e=1,rawlen(f4_r) do	tfm.exec.addImage("192e01972a4.png","?-1",f4_r[e][1],f4_r[e][2],name,-0.5,0.5) end
	for d=1,rawlen(f5) do tfm.exec.addImage("192e0198a16.png","?-1",f5[d][1],f5[d][2],name)	end
	for e=1,rawlen(f5_r) do	tfm.exec.addImage("192e0198a16.png","?-1",f5_r[e][1],f5_r[e][2],name,-1) end
	tfm.exec.addImage("187732271a7.png","?1",56,140,name) 
	tfm.exec.addImage("187732271a7.png","?1",4231,117,name,-1) 
	tfm.exec.addImage("1877321eda8.png","?1",5317,225,name)
	tfm.exec.addImage("1877321eda8.png","?1",2426,4,name,-1)
	tfm.exec.addImage("18773209c5b.png","?1",1510,166,name)
	tfm.exec.addImage("18773209c5b.png","?1",3823,-84,name,-1)
	tfm.exec.addImage("1877322de4e.png","?1",2718,122,name)
	tfm.exec.addImage("1877322de4e.png","?1",453,131,name,-1)
	tfm.exec.addImage("1877322de4e.png","?1",5900,140,name)
	tfm.exec.addImage("18a0539e298.png","?-1",123,473,name,-1)
	tfm.exec.addImage("1860ee201fd.png","?-1",6250,2048,name)
	tfm.exec.addImage("18a053b5130.png","?-1",2630,471,name)
	tfm.exec.addImage("185c2e9722e.png","?-1",6396,1403,name)
	tfm.exec.addImage("185c2e9722e.png","?-1",4029,1606,name,-1,1)
	tfm.exec.addImage("185c2e9722e.png","?-1",1562,1933,name,-1,1)
	tfm.exec.addImage("1883efb5982.png","+1",-300,125,name)
	
	tfm.exec.addPhysicObject(-1,-50,1000,barrier)
	tfm.exec.addPhysicObject(-2,7050,1000,barrier)
	tfm.exec.addPhysicObject(-3,1000,y_factor+depth_factor-25,ground)
	tfm.exec.addPhysicObject(-4,4000,y_factor+depth_factor-25,ground)
	tfm.exec.addPhysicObject(-5,7000,y_factor+depth_factor-25,ground)
	tfm.exec.addPhysicObject(-6,1000,-300,ground)
	tfm.exec.addPhysicObject(-7,4000,-300,ground)
	tfm.exec.addPhysicObject(-8,7000,-300,ground)
	
	tfm.exec.addImage("189746f8a21.png","?2",1219,1676,name)
	tfm.exec.addImage("189746c6144.png","?2",4019,1839,name)
	tfm.exec.addImage("192e019a18c.png","?1",3514,674,name)

	for i=0,4 do
		tfm.exec.addImage("189746fe3a4.png", "?-1", -1200+(i*2000), y_factor+depth_factor-70, name, 1, 1, 0, 1)
		tfm.exec.addImage("189746fe3a4.png", "?-1", -1200+(i*2000), y_factor+depth_factor+470, name, 1, -2, 0, 1)
	end

	tfm.exec.addImage("192e017de38.png", "?1", -1200, 690, name,40,10,0,0.4)
	for _,i in next,{0,2,4} do
		tfm.exec.addImage("192e0181ef2.png", "?1", -1200+(i*2400), 690, name) 
		tfm.exec.addImage("192e0184530.png", "?1", -600+(i*2400), 690, name) 
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, 690, name) 
		tfm.exec.addImage("192e018872a.png", "?1", 600+(i*2400), 690, name)
	end
	for _,i in next,{1,3,5} do
		tfm.exec.addImage("192e018872a.png", "?1", -600+(i*2400), 690, name,-1,1)
		tfm.exec.addImage("192e0186807.png", "?1", i*2400, 690, name,-1,1) 
		tfm.exec.addImage("192e0184530.png", "?1", 600+(i*2400), 690, name,-1,1) 
		tfm.exec.addImage("192e0181ef2.png", "?1", 1200+(i*2400), 690, name,-1,1)
	end
	for _,i in next,{0,2,4} do
		tfm.exec.addImage("189749dd379.png", "?1", -1200+(i*2000), 600, name, 1, 1, 0, 1)
		tfm.exec.addImage("189749dd379.png", "!-1", -1200+(i*2000), 600, name, 1, 1, 0, 0.75)
	end
	for _,i in next,{1,3,5} do
 		tfm.exec.addImage("189749dd379.png", "?1", 800+(i*2000), 600, name, -1, 1, 0, 1)
		tfm.exec.addImage("189749dd379.png", "!-1", 800+(i*2000), 600, name, -1, 1, 0, 0.75)
	end
	tfm.exec.addImage("189749ce857.png", "!-1023", -1200, 1399, name, 8, 6, 0, 0.75)
	tfm.exec.addImage("1897a80b341.png", "!-1023", -1200, 1834, name, 44, 4,0,0.5)

	for i=0,12 do tfm.exec.addImage("192e019006a.png","?1",-1200+(i*750),y_factor-80,name,1,0.5,0,1) end

	for i=0,4 do tfm.exec.addImage("181ba85ccc2.png","!1",math.random(-300,7000),math.random(-70,200),name,0.5,0.5,0,0.8) end
	for j=0,4 do tfm.exec.addImage("181ba86195e.png","!1",math.random(-300,7000),math.random(-70,200),name,0.5,0.5,0,0.8) end
	for k=0,4 do tfm.exec.addImage("181ba86655c.png","!1",math.random(-300,7000),math.random(-70,200),name,0.5,0.5,0,0.8) end
	for l=0,4 do tfm.exec.addImage("181ba86b15a.png","!1",math.random(-300,7000),math.random(-70,200),name,0.5,0.5,0,0.8) end

	for _,i in next,{0,2,4,6,8} do tfm.exec.addImage("18773217882.png","?1",-1200+(i*950),y_factor-315,name,0.5,0.5,0,0.35)	end
	for _,i in next,{1,3,5,7,9} do tfm.exec.addImage("18773217882.png","?1",-250+(i*950),y_factor-315,name,-0.5,0.5,0,0.35)	end

	tfm.exec.addImage("192e018e5fd.png","?1",-1200,-1000,name,50,3,0,0.25) 
	ui.setBackgroundColor("#1B622B")
end

function eventPlayerDied(name)
	if not tfm.get.room.playerList[name].isShaman then
		alives=alives-1
		tfm.exec.setPlayerScore(name,1,true)
	end
	if alives <= 0 then
		mode="end"
		tfm.exec.setGameTime(15)
		showMessage(text.shamwin)
	end
	data[name].o=0
	if mode == "hide" or mode == "game" then
		if tfm.get.room.playerList[name].isShaman then
			showMessage(text.nosham)
			tfm.exec.setPlayerScore(shaman,-2,false)
			mode="end"
			removePowerups()
			tfm.exec.setGameTime(10)
			for name,_ in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[name].isDead then
					tfm.exec.setPlayerScore(name,1,true)
					alives=alives+1
					ui.removeTextArea(300,name)
				end
			end
		end
	end
end
function moveShaman()
	position=math.random(1,3)
	if position == 1 then
		tfm.exec.movePlayer(shaman,894,212,false,0,0,false)
	elseif position == 2 then
		tfm.exec.movePlayer(shaman,3310,251,false,0,0,false)
	elseif position == 3 then
		tfm.exec.movePlayer(shaman,6404,276,false,0,0,false)
	end
end
function checkOxygenZones(name)
	if tfm.get.room.playerList[name].x >= 5558 and tfm.get.room.playerList[name].x <= 5704 then
		if tfm.get.room.playerList[name].y >= 834 and tfm.get.room.playerList[name].y <= 878 then
			return true
		end
	end
	if  tfm.get.room.playerList[name].x >= 3636 and tfm.get.room.playerList[name].x <= 3782 then
		if tfm.get.room.playerList[name].y >= 1152 and tfm.get.room.playerList[name].y <= 1190 then
			return true
		end
	end
	if tfm.get.room.playerList[name].x >= 2364 and tfm.get.room.playerList[name].x <= 2508 then
		if tfm.get.room.playerList[name].y >= 864 and tfm.get.room.playerList[name].y <= 906 then
			return true
		end
	end
	if tfm.get.room.playerList[name].x >= 236 and tfm.get.room.playerList[name].x <= 380 then
		if tfm.get.room.playerList[name].y >= 2050 then
			return true
		end
	end
	if tfm.get.room.playerList[name].x >= 6706 and tfm.get.room.playerList[name].x <= 6850 then
		if tfm.get.room.playerList[name].y >= 2050 then
			return true
		end
	end
end
function eventChatCommand(name,message)
	if message == "help" or message == "ajuda" then
		showMenu(name,0x109626,140,60,520,280,text.watercatch_help,text.help)
	end
	if message == "powerups" then
		showMenu(name,0x109626,140,40,520,320,text.watercatch_power,text.powerups)
	end
	if message == "skins" then
		showMessage(text.skinwarn,name)
		showMenu(name,0x949494,65,30,670,342,"Skins","")
		showAvailableSharks(name)
	end
	if message == "changelog" then
		showMenu(name,0x109626,140,115,520,115,"Watercatch Changelog - Version 7.4.1",text.changelog)
	end
	if (message:sub(0,2)== "tc") then
		if tfm.get.room.playerList[name].isShaman == false then
			for n,_ in next,tfm.get.room.playerList do
				if tfm.get.room.playerList[n].isShaman == false then
					showMessage("<R>• ["..name.."]</b> <N>"..message:sub(4).."",n)
				end
			end
		end
	end
	if verifyNinjas(name) == true then
		if (message:sub(0,4) == "kill") then
			tfm.exec.killPlayer(message:sub(6))
		end
		if message == "reset" then
			reset()
		end
		if command == "sd" then
			system.exit();
		end
	end
end
function eventSummoningEnd(name,id,x,y)
	if id >= 1 then
		cannons=cannons-1
		if cannons >= 1 then
			showMessage(""..text.invoke1.." <b>"..cannons.."</b> "..text.invoke2..".")
		elseif cannons == 0 then
			showMessage(text.noobjects)
			showMessage(text.nobjects,shaman)
		elseif cannons <= -1 then
			tfm.exec.killPlayer(shaman)
		end
	end
end
function eventSummoningStart(name,id,x,y)
	if cannons == 0 then
		showMessage(text.nobjects,name)
	end
end
function resetMap()
	if xml == '' then
		tfm.exec.disableAutoShaman(true)
		tfm.exec.newGame(mapa)
		ui.setMapName(text.loadingmap)
		changed=false
		mode="load"
	else
		if round == 0 then
			tfm.exec.newGame(xml)
			ui.setMapName(text.loadingmap)
			changed=false
		elseif round >= 1 then
			tfm.exec.disableAutoShaman(false)
			changed=true
			tfm.exec.newGame(xml)
		end
		round=round+1
	end
end
function activatePowerup(name,id,number)
	if tfm.get.room.playerList[name].isShaman == false then
		if id == 1 then
			showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>"..text.vampire.."!</b>")
			dropPlayer(name)
			tfm.exec.playSound("/transformice/son/petard.mp3", 75, nil, nil, name)
		elseif id == 2 then
			showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>"..text.cheese.."!</b>")
			queijo(name)
			tfm.exec.playSound("/transformice/son/petard.mp3", 75, nil, nil, name)
		elseif id == 3 then
			showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>"..text.submerge.."!</b>")
			timer=-1
			tfm.exec.playSound("/transformice/son/bulle2.mp3", 75, nil, nil, name)
		elseif id == 4 then
			showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>MEEP!</b>")
			tfm.exec.giveMeep(name,true)
			tfm.exec.playSound("/transformice/son/emote.mp3", 75, nil, nil, name)
		elseif id == 5 then
			showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>"..text.suffocation.."!</b>")
			if not tfm.get.room.playerList[name].isShaman then
				count=math.random(20,50)
				data[name].o=data[name].o-count
				if data[name] and data[name].o <= 1 then
					data[name].o=1
				end
			end
			tfm.exec.playSound("/cite18/combo2.mp3", 75, nil, nil, name)
		elseif id == 6 then
			showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>"..text.freeze.."!</b>")
			congelar(name)
		elseif id == 7 then
			showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>"..text.boost.."!</b>")
			boost(name)
		elseif id == 8 then
			showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>"..text.up.."!</b>")
			goup(name)
		elseif id == 9 then
			showMessage("<N>"..name.." <J>"..text.activate.." <ROSE><b>"..text.big.."!</b>")
			grow(name)
		end
		powerups_x[number]=-1024; powerups_y[number]=-1024; powerups_types[number]=-1;
		tfm.exec.removeImage(active_imgs[number])
	end
end
function activateOxygen(name,number)
	if tfm.get.room.playerList[name].isShaman == false then
		if data[name] then
			count=math.random(20,55);
			data[name].o=data[name].o+count
			if data[name].o > 100 then
				data[name].o=100
			end
		end
	end
	oxygen_x[number]=-1024; oxygen_y[number]=-1024;
	tfm.exec.removeImage(active_imgs2[number])
end
function eventKeyboard(name,key,down,x,y)
	if key == 27 then
		if data[name].opened == true then
			removeMenu(name)
		end
	end
	if key == 32 and mode == "game" and time_passed >= 125 then
		for i=1,6 do
			if x >= powerups_x[i] and x <= powerups_x[i]+51 then
				if y >= powerups_y[i] and y <= powerups_y[i]+51 then
					activatePowerup(name,powerups_types[i],i)
				end
			end
		end
		for i=1,8 do
			if x >= oxygen_x[i] and x <= oxygen_x[i]+51 then
				if y >= oxygen_y[i] and y <= oxygen_y[i]+51 then
					activateOxygen(name,i)
				end
			end
		end
	end
	if key >= 37 or key == 38 or key == 39 or key == 40 or key == 65 or key == 68 or key == 83 or key == 87 then
		if shaman == name and data[name].shark >= 1 then
			if data[name] and tfm.get.room.playerList[name].y >= 605 then
				tfm.exec.changePlayerSize(name,0.2)
				if key == 39 or key == 68 then
					tfm.exec.removeImage(data[name].shark_id)
					displayShark(name,data[name].shark,false)
				elseif key == 37 or key == 65 then
					tfm.exec.removeImage(data[name].shark_id)
					displayShark(name,data[name].shark,true)
				end
				if key == 38 or key == 40 or key == 83 or key == 87 then
					if tfm.get.room.playerList[name].movingRight then
						tfm.exec.removeImage(data[name].shark_id)
						displayShark(name,data[name].shark,false)
					else
						tfm.exec.removeImage(data[name].shark_id)
						displayShark(name,data[name].shark,true)
					end
				end
			else
				tfm.exec.changePlayerSize(name,1)
				tfm.exec.removeImage(data[name].shark_id)
			end
		end
	end
end
function showOverlay(name)
	ui.addTextArea(-3,"<font size='20'><font color='#222222'><p align='center'><font face='Catrinity,Segoe UI Emoji,Segoe UI Symbol'>☍<font size='14'><font face='Alte Haas Grotesk,Calibri,Segoe UI'> "..text.oxylevel.."</b>",name,4,343,700,30,0,0,1.0,true)
	ui.addTextArea(-4,"<font size='20'><font color='#f1f1f1'><p align='center'><font face='Catrinity,Segoe UI Emoji,Segoe UI Symbol'>☍<font size='14'><font face='Alte Haas Grotesk,Calibri,Segoe UI'> "..text.oxylevel.."</b>",name,2,341,700,30,0,0,1.0,true)
	ui.addTextArea(-9,"<font color='#222222'><font size='12'><font face='Ubuntu Mono,Cascadia Mono,Consolas'>0 | | | | | | | | | | 25 | | | | | | | | | | | 50 | | | | | | | | | | 75 | | | | | | | | | | 100</b>",name,14,364,750,30,0,0,1.0,true)
	ui.addTextArea(-10,"<font size='12'><font face='Ubuntu Mono,Cascadia Mono,Consolas'><font color='#e00000'>0 | | | | | | | | | <J>| 25 | | | | | |<font color='#f1f1f1'> | | | | | 50 | | | | | | | | | | 75 | | | | | | | | | | 100</b>",name,12,361,750,30,0,0,1.0,true)
end
function eventNewGame()
	xml=tfm.get.room.xmlMapInfo.xml
	ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
	for n,p in next,tfm.get.room.playerList do
		showWater(n)
	end
	if changed == true then
		ui.removeTextArea(0,nil)
		cannons=12; alives=0; mode="hide";
		ui.removeTextArea(22,nil)
		for n,p in next,tfm.get.room.playerList do
			tfm.exec.giveMeep(n,false)
			tfm.exec.removeImage(data[n].shark_id)
			tfm.exec.changePlayerSize(n,1)
			removeMenu(n)
			ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",n,725,372,70,24,0x000001,0x000001,0.75,true)
			ui.setMapName("<N>"..text.remainmices.."<VP>"..alives.."")
			if n:sub(1,1) == "*" then
				tfm.exec.killPlayer(n)
				showMessage(text.nosouris,name)
				tfm.exec.setPlayerScore(n,-2,false)
			end
			alives=alives+1
			data[n].o=100; data[n].i=0; data[n].t=0; data[n].c=0; data[n].opened=false; display="";
			for i=27,40 do
				tfm.exec.bindKeyboard(n,i,true,true)
			end
			for i=65,87 do
				tfm.exec.bindKeyboard(n,i,true,true)
			end
			if tfm.get.room.playerList[n].isShaman then
				tfm.exec.setShamanMode(n,0)
				tfm.exec.setPlayerScore(n,-1,false)
				if tfm.get.room.isTribeHouse == false then
					tfm.exec.setPlayerSync(n)
				end
				showMessage(text.shammove,n)
				shaman=n
				alives=alives-1
			end
			showOverlay(n)
			ui.addTextArea(300,"",n,21,387,658,2,0x161616,0x161616,1.0,true)
			ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",n,725,372,70,24,0x000001,0x000001,0.75,true)
			ui.removeTextArea(298,n)
		end
		tfm.exec.setGameTime(60)
	end
end
function showMenu(name,color,x,y,width,height,title,content)
	if data[name].opened == false then
		data[name].opened=true
		ui.addTextArea(1004,"",name,-1000,-600,2800,1600,0x000001,0x000001,0.65,true)
		ui.addTextArea(1001,"",name,x+5,y+5,width,height,color,color,0.95,true)
		ui.addTextArea(1000,"<font size='13'><font face='Alte Haas Grotesk,Calibri,Segoe UI'>\n\n"..content.."",name,x,y,width,height,0x151515,color,0.95,true)
		ui.addTextArea(1002,"<font color='#f8d802'><font size='15'><font face='Ink Free'><p align='center'><b>"..title.."",name,x+4,y+4,width-10,20,0x101010,0x101010,0.95,true)
		ui.addTextArea(1003,"<font color='#ff2300'><font size='14'><b><a href='event:close'>X</a>",name,x+width-24,y+4,width-10,20,0,0,0.95,true)
	end
end
function removeMenu(name)
	for _,i in next,{1000,1001,1002,1003,1004,1005,1006,1007,1008} do
		ui.removeTextArea(i,name)
	end
	data[name].opened=false
	removeImagePlayers(name)
end
function genPowerup()
	for i=1,6 do
		temp_x=math.random(400,6600); temp_y=math.random(650,1900); type=math.random(1,9);
		imageId = tfm.exec.addImage("1860ee33630.png","!0",temp_x,temp_y,nil)
		table.insert(powerups_x,temp_x); table.insert(powerups_y,temp_y); table.insert(powerups_types,type);
		table.insert(active_imgs,imageId)
	end
end
function genOxygen()
	for i=1,8 do
		temp_x1=math.random(400,6600); temp_y1=math.random(650,1900);
		imageId1 = tfm.exec.addImage("1860ee38326.png","!0",temp_x1,temp_y1,nil)
		table.insert(oxygen_x,temp_x1); table.insert(oxygen_y,temp_y1);
		table.insert(active_imgs2,imageId1)
	end
end
function removePowerups()
	for i=1,rawlen(active_imgs) do
		tfm.exec.removeImage(active_imgs[i])
	end
	for i=1,rawlen(active_imgs2) do
		tfm.exec.removeImage(active_imgs2[i])
	end
	active_imgs={}; active_imgs2={}; powerups_x={}; powerups_y={}; powerups_types={}; oxygen_x={}; oxygen_y={};
end
function congelar(name)
	tfm.exec.freezePlayer(name,true)
	data[name].t=8
	tfm.exec.playSound("/transformice/son/gel.mp3", 75, nil, nil, name)
end
function boost(name)
	if tfm.get.room.playerList[name].vx < 0 then
		tfm.exec.movePlayer(name,0,0,true,math.random(-240,-120),math.random(10,30),false)
	elseif tfm.get.room.playerList[name].vx > 0 then
		tfm.exec.movePlayer(name,0,0,true,math.random(120,240),math.random(10,30),false)
	end
	tfm.exec.playSound("/transformice/son/resu.mp3", 70, nil, nil, name)
end
function goup(name)
	tfm.exec.movePlayer(name,0,0,true,1,-130,false)
	tfm.exec.playSound("/transformice/son/depart.mp3", 70, nil, nil, name)
end
function queijo(name)
	tfm.exec.giveCheese(name)
	data[name].t=8
end
function dropPlayer(name)
	tfm.exec.setVampirePlayer(name, true)
	tfm.exec.setPlayerGravityScale(name, 0.35, 1)
	data[name].t=8
	tfm.exec.playSound("/transformice/son/tp.mp3", 70, nil, nil, name)
end
function grow(name)
	tfm.exec.changePlayerSize(name, 2)
	data[name].t=8
	tfm.exec.playSound("/transformice/son/chamane.mp3", 65, nil, nil, name)
end
function eventLoop(p,r)
	loop=loop+0.5
	time_passed=math.ceil(p/500)
	time_remain=math.ceil(r/500)
	if changed == true then
		ui.setMapName("<N>"..text.remainmices.."<VP>"..alives.."")
		if mode == "game" then
			if loop >= 30 then
				if time_passed >= 120 then
					removePowerups()
					genPowerup()
					genOxygen()
					loop=0
					tfm.exec.playSound("/transformice/son/invoc.mp3", 40, nil, nil, nil)
				end
			end
			if time_remain == 120 then
				showMessage(text.remain60)
			end
			if time_remain == 60 then
				showMessage(text.remain30)
			end
		end
		if mode == "game" or mode == "hide" then
			if timer > 0 then
				timer=timer-0.5
				tfm.exec.setWorldGravity(0,22)
			elseif timer == 0 then
				tfm.exec.setWorldGravity(0,10)
			end
			for n,q in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[n].isShaman then
					if not tfm.get.room.playerList[n].isDead then
						if mode == "game" or mode == "hide" then
							if tfm.get.room.playerList[n].y < 600 then
								if data[n].o < 99 then
									data[n].o=data[n].o+1.5
								end
								data[n].y=0
							else
								if checkOxygenZones(n) == true then
									data[n].o=data[n].o+0.1
								else
									tfm.exec.playSound("/transformice/son/bulle2.mp3", 6, nil, nil, n)
									if tfm.get.room.playerList[n].y <= 1750 then
										data[n].o=data[n].o-0.5
										data[n].c=0
									elseif tfm.get.room.playerList[n].y > 1750 then
										data[n].o=data[n].o-0.8
										data[n].c=0
									end
								end
							end
						end
					end
				end
			end
		else
			for i=-10,104 do
				ui.removeTextArea(i,nil)
			end
		end
		for n,q in next,tfm.get.room.playerList do
			if data[n] then
				data[n].x=tfm.get.room.playerList[n].x
				data[n].yp=tfm.get.room.playerList[n].y
				if mode == "game" then
					if q.x >= data[shaman].x - 60 and q.x <= data[shaman].x + 60 then
						if q.y >= data[shaman].yp - 60 and q.y <= data[shaman].yp + 60 then
							if not tfm.get.room.playerList[n].isShaman then
								tfm.exec.killPlayer(n)
								tfm.exec.playSound("/deadmaze/monstres/m_4/attaque1.mp3", 90, nil, nil, n)
								tfm.exec.playSound("/deadmaze/monstres/m_4/touche_0.mp3", 60, nil, nil, shaman)
							end
						end
					end
					if data[n].t > 0 then
						data[n].t=data[n].t-0.5
						if data[n].t <= 0 then
							tfm.exec.removeObject(data[n].i)
							tfm.exec.freezePlayer(n,false)
							tfm.exec.removeCheese(n)
							tfm.exec.setVampirePlayer(n, false)
							tfm.exec.setPlayerGravityScale(n, 1, 1)
							tfm.exec.changePlayerSize(n, 1)
						end
					end
					if not tfm.get.room.playerList[n].isDead then
						if data[n].o <= 0 then
							tfm.exec.playSound("/deadmaze/monstres/mort/mf0.mp3", 80, nil, nil, n)
							tfm.exec.killPlayer(n)
							showMessage("<J><b>"..n.."</b> "..text.drowned.."")
							tfm.exec.addShamanObject(59, tfm.get.room.playerList[n].x, tfm.get.room.playerList[n].y, 0, 0.1, 0.1, false)
						end
					end
				end
				if mode == "game" or mode == "hide" then
					if data[n].o > 20 then
						ui.addTextArea(10,"",n,22,387,data[n].o*6.56,2,0xe2e2e2,0,1.0,true)
						data[n].d=0
					elseif data[n].o > 0 then
						tfm.exec.playSound("/transformice/son/bulle3.mp3", 30, nil, nil, n)
						ui.addTextArea(10,"",n,22,387,data[n].o*6.56,2,0x801500,0,1.0,true)
						data[n].d=data[n].d+1
						if data[n].d == 1 and data[n].o > 0 and tfm.get.room.playerList[n].y >= 600 then
							tfm.exec.playSound("/deadmaze/monstres/mort/mh0.mp3", 35+(30-math.floor(data[n].o)), nil, nil, n)
							showMessage(text.lowoxygen,n)
						end
						if data[n].d > 10 then
							data[n].d=0
						end
					end
				else
					ui.removeTextArea(10,nil)
					ui.removeTextArea(300,nil)
				end
			end
		end
		if r <= 1500 and mode == "hide" then
			mode="game"
			tfm.exec.setGameTime(240+math.ceil(alives*4.5))
			ui.removeTextArea(22,nil)
			showMessage(text.goshaman)
			tfm.exec.changePlayerSize(shaman,1)
			moveShaman()
			tfm.exec.removeImage(data[shaman].shark_id)
			for n,p in next,tfm.get.room.playerList do
				ui.addTextArea(300,"",n,21,387,658,2,0x161616,0x161616,1.0,true)
				tfm.exec.playSound("cite18/squelette-spawn.mp3", 80, nil, nil, n)
			end
		end
		if r <= 1000 and mode == "game" then
			tfm.exec.setGameTime(15)
			mode="end"
			local lives=0
			for n,p in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[n].isShaman and not tfm.get.room.playerList[n].isDead then
					lives=lives+1
					tfm.exec.giveCheese(n)
					tfm.exec.playerVictory(n)
				end
				ui.removeTextArea(300,n)
			end
			removePowerups()
			showMessage("<VP>"..text.timeup.." <b>"..lives.."</b> "..text.survived.."")
		end
		if time_remain == 1 and mode == "end" then
			resetMap()
		end
	else
		if time_passed >= 12 and changed == false then
			resetMap()
		end
	end
end
function eventNewPlayer(name)
	newData={
		["o"]=99; ["i"]=0; ["t"]=0; ["c"]=0; ["opened"]=false; ["imageid"]=-1; ["shark_id"]=0; ["shark"]=0; ["active_imgs"]={};
	};
	data[name] = newData;
	showWater(name)
	ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,725,372,70,24,0x000001,0x000001,0.75,true)
	tfm.exec.setPlayerScore(name,0,false)
	if tfm.get.room.isTribeHouse == true then
		ui.addTextArea(3000,"<p align='right'><font size='11'>",name,470,30,320,70,0x101010,0x59251a,0.35,true)
		ui.addTextArea(4000,"<p align='right'><font size='11'>",name,470,115,320,50,0x101010,0x59251a,0.35,true)
	end
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,725,372,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,"<p align='center'><a href='event:help'>Help</a>\n<a href='event:powerups'>Powerups</a>\n<a href='event:change'>Changelog</a>\n<a href='event:skins'>Skins</a>",name,705,295,90,68,0x000001,0x000001,0.80,true)
	end
	if callback == "hide_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,725,372,70,24,0x000001,0x000001,0.75,true)
		ui.removeTextArea(298,name)
	end
	if callback == "close" then
		removeMenu(name)
	end
	if callback == "help" then
		eventChatCommand(name,"help")
	end
	if callback == "powerups" then
		eventChatCommand(name,"powerups")
	end
	if callback == "cred" then
		eventChatCommand(name,"creditos")
	end
	if callback == "change" then
		eventChatCommand(name,"changelog")
	end
	if callback == "skins" then
		eventChatCommand(name,"skins")
	end
	if callback == "a0" then
		data[name].shark=0
		tfm.exec.removeImage(data[name].shark_id)
		showMessage(text.disabled,name)
		tfm.exec.changePlayerSize(name,1)
	end
	if callback == "a1" then
		data[name].shark=1
		showMessage("<VP>"..text.using.." <b>"..text.shark.." 1.</b>",name)
	end
	if callback == "a2" then
		data[name].shark=2
		showMessage("<VP>"..text.using.." <b>"..text.shark.." 2.</b>",name)
	end
	if callback == "a3" then
		data[name].shark=3
		showMessage("<VP>"..text.using.." <b>"..text.shark.." 3.</b>",name)
	end
	if callback == "a4" then
		data[name].shark=4
		showMessage("<VP>"..text.using.." <b>"..text.ws.." 1.</b>",name)
	end
	if callback == "a5" then
		data[name].shark=5
		showMessage("<VP>"..text.using.." <b>"..text.ws.." 3.</b>",name)
	end
	if callback == "a6" then
		data[name].shark=6
		showMessage("<VP>"..text.using.." <b>"..text.shark.." 4.</b>",name)
	end
	if callback == "a7" then
		data[name].shark=7
		showMessage("<VP>"..text.using.." <b>"..text.ws.." 2.</b>",name)
	end
	if callback == "a8" then
		data[name].shark=8
		showMessage("<VP>"..text.using.." <b>"..text.tm.." 1.</b>",name)
	end
	if callback == "a9" then
		data[name].shark=9
		showMessage("<VP>"..text.using.." <b>"..text.pdn..".</b>",name)
	end
	if callback == "a10" then
		data[name].shark=10
		showMessage("<VP>"..text.using.." <b>"..text.whale.." 1.</b>",name)
	end
	if callback == "a11" then
		data[name].shark=11
		showMessage("<VP>"..text.using.." <b>"..text.tt..".</b>",name)
	end
	if callback == "a12" then
		data[name].shark=12
		showMessage("<VP>"..text.using.." <b>"..text.whale.." 2.</b>",name)
	end
	if callback == "a13" then
		data[name].shark=13
		showMessage("<VP>"..text.using.." <b>Barracuda 1.</b>",name)
	end
	if callback == "a14" then
		data[name].shark=14
		showMessage("<VP>"..text.using.." <b>"..text.whale.." 3.</b>",name)
	end
	if callback == "a15" then
		data[name].shark=15
		showMessage("<VP>"..text.using.." <b>Orca.</b>",name)
	end
	if callback == "a16" then
		data[name].shark=16
		showMessage("<VP>"..text.using.." <b>"..text.whale.." 4.</b>",name)
	end
	if callback == "a17" then
		data[name].shark=17
		showMessage("<VP>"..text.using.." <b>"..text.tm.." 2.</b>",name)
	end
	if callback == "a18" then
		data[name].shark=18
		showMessage("<VP>"..text.using.." <b>Barracuda 2.</b>",name)
	end
end
resetMap()
