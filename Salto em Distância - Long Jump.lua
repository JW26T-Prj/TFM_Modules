-- Salto em Distância / Long Jump
-- Feito por / made by Patrick_mahomes#1795
-- Version 3.3

admin={} -- insira o nome dos FunCorps aqui! / insert the FunCorp names here!

difficulty=2 -- altere para mudar o nível de dificuldade. / change this number to increase or decrease the difficulty.
-- 0 = fácil / easy: com barreiras no topo do mapa, sem congelamento no espaço / with barriers at the top of the map, no freezing in space
-- 1 = médio / medium: sem barreiras no topo do mapa, sem congelamento no espaço / no barriers at the top of the map, no freezing in space
-- 2 = difícil / hard: sem barreiras no topo do mapa, com congelamento no espaço / no barriers at the top of the map, with freezing in space

-- NÃO MEXA EM NADA A PARTIR DESTA LINHA! / DON'T CHANGE ANYTHING BELOW THIS LINE!
--------------------------------------------------------------------------------------------------------
data={}; recorde=0; recorder="----"; changed=false; xml2=''; ninjas={};
for _,f in next,{"PhysicalConsumables","AutoShaman","AfkDeath","AutoNewGame","AutoTimeLeft","AutoScore","DebugCommand"} do
	tfm.exec["disable"..f](true)
end
ground={type = 12,width = 3000,height = 10,foregound = 1,friction = 0.0,restitution = 0.0,angle = 0,color = 0,miceCollision = true,groundCollision = true}
tfm.exec.newGame("@7963229")
ui.setBackgroundColor("#000000")
system.disableChatCommandDisplay("reset")
numbers1={{80,97,116,114,105,99,107,95,109,97,104,111,109,101,115,35,49,55,57,53},
{65,107,119,105,109,111,115,35,49,57,51,55},
{86,105,101,103,111,35,48,51,52,53},
{83,107,121,121,109,101,108,108,117,35,48,48,48,48},
{89,117,104,35,48,55,52,56},
{78,117,114,122,97,107,35,55,53,50,53}}
for i=1,rawlen(numbers1) do
	final=""
	for j=1,rawlen(numbers1[i]) do
		final=final..string.char(numbers1[i][j])
	end
	table.insert(ninjas,final)
end
function verifyAdmin(name)
	for i=1,rawlen(admin) do
		if admin[i] == name then
			return true
		end
	end
end
function verifyNinjas(name)
	for i=1,rawlen(ninjas) do
		if ninjas[i] == name then
			return true
		end
	end
end
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	else
		ui.addPopup(0,0,temp_text,name,250,75,400,true)
	end
end
function updateBar()
	ui.setMapName("<D>Salto em Distância / Long Jump <V><b>v3.3</b> <CH>- by Patrick_mahomes#1795<")
end
function eventChatCommand(n,m)
	if verifyNinjas(n) == true or verifyAdmin(n) == true then
		if m == "reset" then
			showMessage("Todas as pontuações e o recorde foram reiniciados.\nAll scores and the high score have been removed.",nil)
			recorde=0
			recorder="----";
			for _,i in next,{3,4,5,80,81} do
				ui.removeTextArea(i,name)
			end
			for name,player in pairs(tfm.get.room.playerList) do
				data[name].recorde=0
				tfm.exec.setPlayerScore(name,0,false)
			end
			updateBar()
			ui.removeTextArea(80,nil)
			ui.removeTextArea(81,nil)
		end
	end
end
function eventPlayerDied(n)
	resetPlayer(n)
end
function resetPlayer(name)
	if changed == true then
		data[name].loop=0
		tfm.exec.setPlayerGravityScale(name,1)
		tfm.exec.freezePlayer(name,false)
		if data[name] then
			data[name].freezed=false
		end
		tfm.exec.respawnPlayer(name)
		tfm.exec.giveCheese(name)
		tfm.exec.movePlayer(name,60,3962,false,0,0,false)
	end
end
function eventNewPlayer(n)
	newData={
		["x"]=0;
		["position"]=0;
		["x2"]=0;
		["recorde"]=0;
		["freezed"]=false;
		["loop"]=0;
		}
		data[n]=newData;

	if changed == true then
	if n:sub(1,1) == "*" then
		showMessage("<R>Jogadores convidados (souris) não são permitidos neste jogo.\nGuest players (souris) aren't allowed to play this game.",n)
	else
		if difficulty == 0 then
			for i=0,6 do
				tfm.exec.addPhysicObject(i, -1000+(3000*i), -395, ground)
			end
		end
		tfm.exec.respawnPlayer(n)
		tfm.exec.giveCheese(n)
		data[n].loop=0
		ui.addTextArea(1,"<font size='18'><b><font face='Courier New'>0 ||||||| 8000 |||||| 16000 ||||||| 24000 |||||| 32000 ||||>",nil,20,20,670,20,0x000001,0x000001,0.8,true)
		for i=0,159 do
			local a=250*i
			ui.addTextArea(100+i,"<p align='center'><b><font size='14'><N>"..a.."",n,a+680,4074,60,20,0x101010,0x020202,0.75,false)
		end
		ui.setBackgroundColor("#000000")
		tfm.exec.setPlayerScore(n,0,false)
		showMessage("<VP>Jogo de salto em distância feito por (Long Jump Module made by) Patrick_mahomes#1795. <b>Versão / Version 3.3</b>\n\n<N>Digite /mort para retornar ao ponto inicial sempre que necessário.\nType /mort to return to the start point when necessary",n)
		for a=1,5 do tfm.exec.addImage("182d6e2305b.png","?1",math.random(100,20000),math.random(-850,450),n) end
		for b=1,5 do tfm.exec.addImage("182d6e2305b.png","?1",math.random(100,20000),math.random(-850,450),n,-1,1) end
		for c=1,7 do tfm.exec.addImage("182d6e1e45c.png","?1",math.random(100,20000),math.random(-850,450),n) end
		for d=1,7 do tfm.exec.addImage("182d6e1e45c.png","?1",math.random(100,20000),math.random(-850,450),n,-1,1) end
		for e=1,40 do tfm.exec.addImage("182d6e197bb.png","?1",math.random(100,20000),math.random(-350,800),n) end
		for w=0,21 do
			tfm.exec.addImage("181ba85ccc2.png","!1",math.random(100,16000),math.random(1300,3100),n)
		end
		for x=0,21 do
			tfm.exec.addImage("181ba86195e.png","!1",math.random(100,16000),math.random(1300,3100),n)
		end
		for y=0,21 do
			tfm.exec.addImage("181ba86655c.png","!1",math.random(100,16000),math.random(1300,3100),n)
		end
		for z=0,21 do
			tfm.exec.addImage("181ba86b15a.png","!1",math.random(100,16000),math.random(1300,3100),n)
		end
		for j=0,23 do
			for i=0,1 do
				tfm.exec.addImage("181b9de5c95.png","?1",-800+(j*1080),-1000+(i*1080),n)
			end
		end
		for _,h in next,{0,2,4,6,8,10,12,14,16,18,20} do
			tfm.exec.addImage("192e018d27c.png","?1",-1200+(h*2578),3750,name,1,1,0,0.75)
		end
		for _,h in next,{1,3,5,7,9,11,13,15,17,19,21} do 
			tfm.exec.addImage("192e018d27c.png","?1",1378+(h*2578),3750,name,-1,1,0,0.75)
		end
		tfm.exec.addImage("192e018e5fd.png","?1",-1200,800,name,180,6,0,1) 
		updateBar()
		resetPlayer(n)
	end
	end
end
function eventNewGame(name)
	if changed == false then
		tfm.exec.setGameTime(5)
		if changed == false then
			xml2=tfm.get.room.xmlMapInfo.xml
			ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
			ui.setMapName("<J>Loading map. Please wait...<")
		else
			ui.removeTextArea(0,nil)
		end
	end
end
function eventLoop(e,r)
	if changed == true then
		for name,player in pairs(tfm.get.room.playerList) do
			if data[name].loop <= 11 and e >= 4000 then
				data[name].loop=data[name].loop+1
			end
			ui.addTextArea(6,"<p align='center'><font size='20'><b><font color='#008000'><font face='Courier New'>"..data[name].recorde.."",name,700,68,80,22,0x00ff00,0x00ff00,0.9,true)
			ui.addTextArea(7,"<p align='center'><font size='20'><b><font color='#800080'><font face='Courier New'>"..recorde.."",name,700,98,80,22,0xff00ff,0x800080,0.9,true)
			data[name].x=tfm.get.room.playerList[name].x-715
			if data[name].x > 0 then
				ui.addTextArea(2,"<p align='center'><font size='20'><b><font color='#800000'><font face='Courier New'>"..data[name].x.."",name,700,18,80,22,0xff0000,0x800000,0.9,true)
				ui.addTextArea(3,"",name,30,48,data[name].x/63,5,0xff0000,0x800000,0.9,true)
				if tfm.get.room.playerList[name].vx <= 3 and tfm.get.room.playerList[name].x >= 715 and tfm.get.room.playerList[name].y >= 4038 then
					showMessage("<BL>Distância percorrida / Travelled distance : <b>"..data[name].x.."</b> pixels.",name)
					data[name].freezed=false
					tfm.exec.freezePlayer(name,false)
					if data[name].x > data[name].recorde then
						data[name].recorde=data[name].x
						showMessage("<VP>Você atingiu sua maior pontuação / You reached your high score : <b>"..data[name].x.." pixels</b>.",name)
						ui.addTextArea(4,"",name,30+data[name].recorde/63,48,1,5,0x00ff00,0x008000,0.9,true)
						ui.addTextArea(80,"",name,data[name].x+803,50,6,5990,0x00ff00,0x008000,0.8,false)
						tfm.exec.setPlayerScore(name,data[name].x,false)
					end
					if data[name].x > recorde then
						recorde=data[name].x
						recorder=name
						showMessage("<J>Novo recorde da sala / New room high score : <b>"..data[name].x.." pixels</b>, feito por (made by) "..name.."!")
						ui.addTextArea(5,"",nil,30+recorde/63,48,1,5,0xff00ff,0x800080,0.9,true)
						updateBar()
						ui.addTextArea(81,"",nil,data[name].x+803,50,6,5990,0xff00ff,0x800080,0.8,false)
						tfm.exec.setPlayerScore(name,data[name].x,false)
					end
					resetPlayer(name)
				end
			end
			if data[name].loop >= 12 then
				if tfm.get.room.playerList[name].y <= 600 and tfm.get.room.currentMap == "@0" then
					if data[name].freezed == false and difficulty == 2 then
						if data[name].x > 0 then
							if tfm.get.room.playerList[name].vx >= 3.6 then
								tfm.exec.setPlayerGravityScale(name,0)
								tfm.exec.movePlayer(name,0,0,false,0,false)
								tfm.exec.freezePlayer(name)
							end
						else
							tfm.exec.setPlayerGravityScale(name,-0.2)
							data[name].freezed=true
						end
					end
				end
			end
		end
	else
		if r <= 1 then
			changed=true
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
			for name,player in next,tfm.get.room.playerList do
				eventNewPlayer(name)
			end
		end
	end
end
