-- Script Fall Racing, antes chamado de Queda Livre de Velocidade.
-- Atenção: Script com alta exigência de memória.

for _,f in next,{"AutoNewGame","AutoShaman","AfkDeath","AutoScore","PhysicalConsumables","MortCommand","DebugCommand","MinimalistMode"} do
	tfm.exec["disable"..f](true)
end
if not tfm.get.room.isTribeHouse then tfm.exec.setRoomMaxPlayers(20) end
xml2=''; creator=""; position=0; objective=40; enabled=false; map=""; ninjas={}; lobby="0"; changed=false;
mapas={"@7411648","@7568910","@7410842","@7568917","@7568919","@7568922","@7568923","@7568928","@7568964","@7568967","@7568965","@7354962","@7569413","@7721624","@6621726","@6316396"}
system.disableChatCommandDisplay("obj")
numbers={
{68,104,97,114,97,107,35,55,54,48,51},
{66,97,114,111,100,105,117,115,35,57,53,54,50},
{83,107,121,121,109,101,108,108,117,35,48,48,48,48},
{90,101,100,35,57,52,51,49},
{76,97,99,111,115,116,101,35,56,57,55,50}}
for i=1,rawlen(numbers) do
	final=""
	for j=1,rawlen(numbers[i]) do
		final=final..string.char(numbers[i][j])
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
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	end
end
function eventChatCommand(name,message)
	if(message:sub(1,3) == "obj") then
		if verifyNinjas(name) == true then
			objective=tonumber(message:sub(5))
			showMessage("<J>Objective changed to: "..objective,name)
		end
	end
end
function eventNewGame()
	if enabled == true then
		position=0
		if changed == false and enabled == true then
			xml2=tfm.get.room.xmlMapInfo.xml
			creator=tfm.get.room.xmlMapInfo.author
			map=tfm.get.room.currentMap
			ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
			ui.setMapName("<J>Loading map. Please wait...<")
		else
			ui.removeTextArea(0,nil)
		end
	else
		ui.addTextArea(10,"<font face='Eras Demi ITC'><font color='#000000'><font size='39'>Fall Racing v2.6",nil,40,42,400,100,0,0,1.0,true)
		ui.setMapName("<N>Welcome to <J>Fall Racing v2.6!<")
		tfm.exec.setGameTime(60)
	end
end
function eventLoop(p,f)
	if p >= 5000 and p <= 6000 and changed == false and enabled == true then
		tfm.exec.newGame(xml2)
		changed=true
		ui.setMapName("<J>#fall v2.6   <BL>|   <J>"..creator.." <BL>- "..map.."   <BL>|   <J>Objective : <J>"..objective.." points<")
	end
	if f <= 1 and enabled == true then
		changed=false
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
	if enabled == false and f >= 1000 then
		ui.addTextArea(11,"<font face='Eras Demi ITC'><font size='18'><font color='#ffffff'>Get ready! The match will start on "..math.floor(f/1000).." seconds.",nil,220,375,600,32,0,0,1.0,true)
	end
	if f <= 10000 and f >= 9000 and enabled == false then
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.setPlayerScore(name,0,false)
			changed=false
		end
	end
	if f <= 1 and enabled == false then
		for i=10,11 do
			ui.removeTextArea(i,nil)
		end
		enabled=true
		tfm.exec.newGame(mapas[math.random(#mapas)])
		for name,player in pairs(tfm.get.room.playerList) do
			tfm.exec.setPlayerScore(name,0,false)
		end
	end
	for name,player in pairs(tfm.get.room.playerList) do
		if tfm.get.room.playerList[name].score >= objective and enabled == true then
			enabled=false
			tfm.exec.newGame(lobby)
			showMessage("<VP><b>Congratulations!</b> "..name.." wins the game with "..tfm.get.room.playerList[name].score.." points!")
		end
	end
end
function eventPlayerWon(name)
	position=position+1
	if position == 1 then
		tfm.exec.setGameTime(20)
	end
	if position <= 8 then
		tfm.exec.setPlayerScore(name,10-position,true)
		showMessage("+ "..tostring(10-position).." points",name)
	else
		tfm.exec.setPlayerScore(name,1,true)
		showMessage("+ 1 points",name)
	end
end
function eventPlayerDied(name)
	if tfm.get.room.playerList[name].x > 2400 then
		tfm.exec.respawnPlayer(name)
		tfm.exec.giveCheese(name)
		tfm.exec.playerVictory(name)
	end
end
function eventNewPlayer(name)
	if enabled == false then
		ui.addTextArea(10,"<font face='Eras Demi ITC'><font color='#000000'><font size='39'>Fall Racing v2.6",nil,330,42,400,100,0,0,1.0,true)
		ui.setMapName("<N>Welcome to <J>Fall Racing v2.6!<")
	end
	showMessage("<J>Welcome to the #fall2 module!<br><br>The objective of this room is fall to the end of the map!<br>The player that score more points will win the game!<br><br><R>WARNING: This script require at least 1.8GB of RAM to work without problems.",name)
end
tfm.exec.newGame(lobby)
