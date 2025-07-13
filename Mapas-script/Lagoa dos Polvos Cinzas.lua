for _,f in next,{"AutoNewGame","AfkDeath","AutoShaman","MinimalistMode","PhysicalConsumables","AutoTimeLeft"} do
	tfm.exec["disable"..f](true)
end
debug.disableEventLog(true)
system.disableChatCommandDisplay("reset")
tfm.exec.newGame("@7833508")
changed=false; xml2='';

function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	else
		ui.addPopup(0,0,temp_text,name,250,75,400,true)
	end
end

function showWater(name)
	for w=1,4 do
		tfm.exec.addImage("181ba85ccc2.png","?1",math.random(50,3600),math.random(-60,250),name,0.5,0.5)
	end
	for x=1,4 do
		tfm.exec.addImage("181ba86195e.png","?1",math.random(50,3600),math.random(-60,250),name,0.5,0.5)
	end
	for y=1,4 do
		tfm.exec.addImage("181ba86655c.png","?1",math.random(50,3600),math.random(-60,250),name,0.5,0.5)
	end
	for z=1,4 do
		tfm.exec.addImage("181ba86b15a.png","?1",math.random(50,3600),math.random(-60,250),name,0.5,0.5)
	end
	tfm.exec.addImage("17e937f4f5a.png","?1",-800,-730,name,20,0.25)
end
function eventChatCommand(name,message)
	if message == "reset" then
		if name == "Morganadxana#0000" or name == "Leblanc#5342" or name == "Irelia#7317" then
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
		end
	end
end
function eventPlayerWon(name)
	if changed == true then
		tfm.exec.respawnPlayer(name)
	end
end
function eventPlayerDied(name)
	if changed == true then
		tfm.exec.respawnPlayer(name)
	end
end
function eventNewGame(name)
	if changed == true then
		for name,_ in next,tfm.get.room.playerList do
			showMessage("<VP><b>Bem-vindo(a) a Lagoa dos Polvos Cinzas.</b>\n\n<p align='left'><N>Este é um mapa-script bem simples de lagoa.\nNão é muito profunda, e possui muita terra firme! Apenas aproveite e curta!\n\n<R>Aviso: Este mapa pode consumir até 1GB de RAM dependendo de casos específicos.\n\nAgradecimentos especiais para Reksai_void2600#6638 e Spectra_phantom#6089.<b></b>\n\n<N>Deseja usar este mapa-script no cafofo de sua tribo? Use o link a seguir:\n<N><VP>raw.githubusercontent.com/JW26T-Prj/TFM_Modules/refs/heads/master/Mapas-script/Lagoa%20dos%20Polvos%20Cinzas.lua\n\nRevisão 1.1",name)
			showWater(name)
		end
		ui.setMapName("<VP>Lagoa dos Polvos Cinzas<")
		tfm.exec.setGameTime(4800)
	else
		tfm.exec.setGameTime(5)
		if changed == false then
			xml2=tfm.get.room.xmlMapInfo.xml
			ui.addTextArea(0,"",nil,-800,-400,2400,1200,0x6a7495,0x6a7495,1.0,true)
			ui.setMapName("<J>Carregando mapa. Por favor, aguarde...<")
		else
			ui.removeTextArea(0,nil)
		end
	end
end
function eventNewPlayer(name)
	tfm.exec.respawnPlayer(name)
	if changed == true then
		ui.setMapName("<VP>Lagoa dos Polvos Cinzas<")
		showMessage("<VP><b>Bem-vindo(a) a Lagoa dos Polvos Cinzas.</b>\n\n<p align='left'><N>Este é um mapa-script bem simples de lagoa.\nNão é muito profunda, e possui muita terra firme! Apenas aproveite e curta!\n\n<R>Aviso: Este mapa pode consumir até 1GB de RAM dependendo de casos específicos.\n\n<J>Agradecimentos especiais para Reksai_void2600#6638 e Spectra_phantom#6089.<b></b>\n\n<N>Deseja usar este mapa-script no cafofo de sua tribo? Use o link a seguir:\n<N><VP>raw.githubusercontent.com/JW26T-Prj/TFM_Modules/refs/heads/master/Mapas-script/Lagoa%20dos%20Polvos%20Cinzas.lua\n\nRevisão 1.1",name)
		showWater(name)
	end
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventLoop(p,f)
	if f <= 1 and changed == false then
		changed=true
		tfm.exec.newGame(xml2,false)
		ui.removeTextArea(0,nil)
	end
end
