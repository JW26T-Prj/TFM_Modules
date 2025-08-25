for _,f in next,{"AutoNewGame","AutoTimeLeft","AfkDeath","AutoShaman","AutoScore","DebugCommand","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
number_scale={8240,7400,6760,6230,5760,5350,4970,4620,4260,4000,3693,3417,3175,2900,2650,2390,2180,1950,1750,1550,1360,1150,935,770}
data={}; lang={}; loop=0; map_count=0; event_selected=0; running=false; pass_int=0; falt_int=0; run_int=0; event_int=0; endgame=false; changed=false; vencedor=""; map="@7901662"; xml2='';
ground={type = 12,width = 10,height = 210,foregound = 1,friction = 0.0,restitution = 1.0,angle = 0,color = 0xffffff,miceCollision = true,groundCollision = true,dynamic = false}
powerups={wind=false,meteor=false,gravity=false,cheese=false}
events_pt={"Fúria da Tormenta","Chuva de Caixas","Anomalia Gravitacional","Queijo para Todos"}
events_en={"Wind Fury","Box Rain","Gravity Anomaly","Cheese for All"}
power_d={p2={8,10,12,14},p3={12,14,16,18,20,22}}
lang.br = {
	mapname = "<N><b>Mountain</b>  <V>-  <N>versão <ROSE>v1.5.1<",
	enter = "<N>Bem-vindo ao module <J><b>Mountain!</b>\n<N>Você tem pouco mais que 3 minutos para escalar a grande montanha que há pelo caminho!",
	newgame = "<N>Caso não saiba o que fazer neste module, vá no Menu e clique em Ajuda.",
	getready = "<J>Se prepare! A estrada para a montanha será liberada em breve!",
	start = "<VP><b>E que comece a batalha!</b>",
	event1 = "O evento",
	event2 = "será iniciado em instantes, e terá duração de ",
	event3 = "segundos!",
	event4 = " começou! Salve-se quem puder!",
	t10secs = "<font color='#ff8000'>Restam apenas 10 segundos! Apenas o rato que estiver mais alto sobreviverá!",
	winner = "é o grande vencedor!",
	scaled = "Ele(a) subiu ",
	recognized = "metros e agora é reconhecido pelos deuses da montanha!",
	event5 = " foi encerrado!",
	reached2 = "<G>Você atingiu os 2000 metros de altura.\nVentos bem gelados começam a te rodear e você começa a sentir falta de ar.",
	reached3 = "<G>Você atingiu os 5000 metros de altura.\nJá está impossível de suportar o extremo frio, e você começa a ter sérias dificuldades para respirar.",
	reached4 = "<G>Você atingiu os 10000 metros de altura.\nAs correntes geladas começam a te fazer congelar, e seu rato passa a ter um sério problema de asfixia devido a falta de ar.",
	reached5 = "<G>Você atingiu os 20000 metros de altura.\nVocê começa a ver as estrelas muito mais claramente, mesmo no dia claro. No entanto, isto é um péssimo sinal. O ar rarefeito e as baixíssimas temperaturas fazem seu rato morrer aos poucos.",
	reached6 = "<VP>Você chegou no pico da montanha! Os deuses reconheceram sua bravura e coragem e te acolheram para o céu!",
	reached7 = " <VP>chegou até o topo da montanha!\n<N>Ele(a) agora se integra nas estrelas e passa a brilhar como nunca!",
	nowinners = "<R>Não há vencedores!",
	help = "<p align='center'><VP><b>Bem-vindo ao module Mountain.</b>\n\n<p align='left'><N>Este modo é bem simples. O objetivo é subir o máximo possível a grande montanha que há pela frente.\n\nNo entanto, os deuses da montanha estão furiosos, e podem atacar com vários contratempos.\n\nA partida acaba depois de 3 minutos, quando todos os ratos morrem ou quando alguém chega no pico da montanha.",
	powerups = "<G>• Fúria da Tormenta: <N>Correntes de vento começam a pairar em volta da montanha.\n<G>• Chuva de Caixas: <N>Caixas começam a cair do céu, fazendo com que você caia.\n<G>• Anomalia Gravitacional: <N>Um campo gravítico intenso aparece na montanha, alterando de forma aleatória a gravidade do mapa.\n<G>• Queijo para Todos: <N>Todos os jogadores recebem queijo.",
	memory_error = "<R>Aviso: Não há mais memória disponível para o Transformice. Para continuar jogando este module, saia do jogo e entre novamente.",
}
lang.en = {
	mapname = "<N><b>Mountain</b>  <V>-  <N>version <ROSE>v1.5.1",
	enter = "<N>Welcome to the <J><b>Mountain</b> module!\n<N>You have about 3 minutes to scale the big mountain that is on your way!",
	newgame = "<N>If you don't know about this module, go to the Menu and access the Help.",
	getready = "<J>Get ready! The road to the mountain will be opened!",
	start = "<VP><b>Go!</b>",
	event1 = "The event",
	event2 = "will start in a few seconds, and will last for ",
	event3 = "seconds!",
	event4 = " started!",
	t10secs = "<font color='#ff8000'>10 seconds remaining! The player that scaled more will survive!",
	winner = "is the winner!",
	scaled = "(S)he scaled ",
	recognized = "meters and now is recognized by the mountain gods!",
	event5 = " is gone!",
	reached2 = "<G>You reached 2000 meters of height.\nThe cold wings starts to surround you, and the air starts to be rarefied...",
	reached3 = "<G>You reached 5000 meters of height.\nIt's almost impossible to tolerate the extreme cold temperatures, and you starts to have serious difficulties to breathe correctly.",
	reached4 = "<G>You reached 10000 meters of height.\nThe strong cold wings starts to freeze you, and your mice starts to have serious suffocation problems because of lack of air...",
	reached5 = "<G>You reached 20000 meters of height.\nYou starts to see the stars with much more clarity, even on the clear day. However, the rarified air and the extremely low temperatures is making your mice to die.",
	reached6 = "<VP>You reached the peak of the mountain! The gods recognized your bravery and courage. Now, you is part of the heaven!",
	reached7 = " <VP>reached the top of the mountain!\n<N>(S)he now is part of the stars and will bright many more!",
	nowinners = "<R>No winners!",
	help = "<p align='center'><VP><b>Welcome to the Mountain module.</b>\n\n<p align='left'><N>This game is very simple. The objective is scale the big mountain that is in front of you.\n\nHowever, the mountain gods are furious, and can attack you with various events.\n\nThe match will end after 3 minutes, when there is no more alive mices or when someone reaches the top of the mountain.",
	powerups = "<G>• Wind Fury: <N>Strong winds hover around the mountain.\n<G>• Box Rain: <N>Some boxes will fall from the heaven, making you go down.\n<G>• Gravity Anomaly: <N>A strong gravitational field appears on the mountain, randomly changing the gravity of the map.\n<G>• Cheese For All: <N>All the players will have cheese.",
	memory_error = "<R>Warning: There's no more available memory for Transformice. To continue playing this game, log out of your account and enter again.",
}
if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
	text = lang.br
else
	text = lang.en
end
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		print(temp_text)
	end
end
function showMenu(name,color,x,y,width,height,title,content)
	if data[name].opened == false then
		data[name].opened=true
		ui.addTextArea(1004,"",name,-1000,-600,2800,1600,0x000001,0x000001,0.65,true)
		ui.addTextArea(1001,"",name,x+5,y+5,width,height,color,color,0.95,true)
		ui.addTextArea(1000,"<font size='13'><i>\n\n"..content.."",name,x,y,width,height,0x151515,color,0.95,true)
		ui.addTextArea(1002,"<font color='#f8d802'><font size='14'><p align='center'><i><b>"..title.."",name,x+5,y+5,width-10,22,0x101010,0x101010,0.95,true)
		ui.addTextArea(1003,"<font color='#ff2300'><font size='14'><b><a href='event:close'>X</a>",name,x+width-25,y+5,width-10,20,0,0,0.95,true)
	end
end
function defineVencedor()
	max_score=10800
	winner=""
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].y < max_score and data[name].enabled == true then
			winner=name
			max_score=tfm.get.room.playerList[name].y
		end
	end
	return winner
end
function showImages(name)
	for a=1,2 do tfm.exec.addImage("182d6e2305b.png","?1",math.random(1300,4700),math.random(-450,1000),name) end
	for b=1,2 do tfm.exec.addImage("182d6e2305b.png","?1",math.random(1300,4700),math.random(-450,1000),name,-1,1) end
	for c=1,3 do tfm.exec.addImage("182d6e1e45c.png","?1",math.random(1300,4700),math.random(-450,1000),name) end
	for d=1,3 do tfm.exec.addImage("182d6e1e45c.png","?1",math.random(1300,4700),math.random(-450,1000),name,-1,1) end
	for e=1,12 do tfm.exec.addImage("182d6e197bb.png","?1",math.random(1300,4700),math.random(-250,1200),name) end
	for k=0,6 do
		tfm.exec.addImage("181ba85ccc2.png","!1",math.random(1700,4300),math.random(4500,8600),name)
	end
	for l=0,6 do
		tfm.exec.addImage("181ba86195e.png","!1",math.random(1700,4300),math.random(4500,8600),name)
	end
	for m=0,6 do
		tfm.exec.addImage("181ba86655c.png","!1",math.random(1700,4300),math.random(4500,8600),name)
	end
	for n=0,6 do
		tfm.exec.addImage("181ba86b15a.png","!1",math.random(1700,4300),math.random(4500,8600),name)
	end
	for j=0,5 do
		tfm.exec.addImage("181b9de5c95.png","?1",-800+(1920*j),-1240,name)
		tfm.exec.addImage("181b9de5c95.png","?1",-800+(1920*j),-160,name)
		tfm.exec.addImage("181b9de5c95.png","?1",-800+(1920*j),920,name)
	end
	for i=0,1 do
		tfm.exec.addImage("17fe373d035.jpg","?1",-400+(i*3400),9592,name,1,1)
	end
	tfm.exec.addImage("17fe3741e5f.jpg","?1",-400,800,name,10,10,0,1)
end
function resetEvents()
	wind=false; meteor=false; gravity=false; cheese=false;
	run_int=0;
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.removeCheese(name)
	end
	tfm.exec.setWorldGravity(0,10)
end
function eventNewPlayer(name)
	ui.setMapName(text.mapname)
	newData={
		["x"]=0; ["a"]=0; ["enabled"]=false; ["opened"]=false; }
	data[name]=newData;
	showImages(name)
	ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",n,365,25,70,24,0x000001,0x000001,0.75,true)
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
end
function eventPlayerDied(name)
	data[name].enabled=false
	if changed == true then
	local i=0
	local n
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead then
			i=i+1
			n=pname
		end
	end
	if i==0 then
		showMessage(text.nowinners)
		tfm.exec.setGameTime(15)
		endgame=true; running=false;
		tfm.exec.newGame(xml2,false)
	end
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,"<p align='center'><a href='event:help'>Help</a>\n<a href='event:powerups'>Powerups</a>\n<a href='event:change'>Changelog</a>",name,355,57,90,45,0x000001,0x000001,0.80,true)
	end
	if callback == "hide_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,365,25,70,24,0x000001,0x000001,0.75,true)
		ui.removeTextArea(298,name)
	end
	if callback == "close" then
		for i=1000,1004 do
			ui.removeTextArea(i,name)
		end
		data[name].opened=false
	end
	if callback == "help" then
		showMenu(name,0x808080,150,120,500,210,"Help",text.help)
	end
	if callback == "powerups" then
		showMenu(name,0xf2a267,150,120,500,140,"Powerups",text.powerups)
	end
	if callback == "cred" then
		showMenu(name,0xb6e980,140,90,520,130,"Credits",text.credits)
	end
	if callback == "change" then
		showMenu(name,0x2578f6,140,60,520,265,"Changelog","<font size='11'>[v1.5.1]:\n• Souris players cannot play this game anymore\n\n[v1.5.0]:\n• Several internal changes\n\n[v1.4.0]:\n• Some code cleaning\n• Changes on the commands handling\n• Added copyright information\n\n[v1.3.0]:\n• New module owner\n\n[v1.2.1]:\n• The powerup 'Meteor Rain' was changed to 'Box Rain'\n• Some changes on timers and match time")
	end
end
function eventNewGame()
	ui.setBackgroundColor("#000000")
	if changed == true then
		resetEvents()
		running=false; map_count=map_count+1; run_int=0; pass_int=0; event_int=0; endgame=false; vencedor="";
		tfm.exec.setGameTime(236)
		for i=0,1 do
			tfm.exec.addPhysicObject(i, 180+(i*5680), 10475, ground)
		end
		for name,player in next,tfm.get.room.playerList do
			if name:sub(1,1) == "*" then
		   		tfm.exec.killPlayer(name)
		   		showMessage("<R>Souris aren't allowed to play on this module. Create an account or log in to play this game.",name)
			end
			data[name].a=0;
			data[name].enabled=true;
			showImages(name)
			ui.setMapName(text.mapname)
		end
		showMessage(text.newgame)
		for i=1,24 do
			ui.addTextArea(i,"<p align='center'>"..tostring(i*1000).."",nil,2980,number_scale[i],40,16,0x010101,0x010101,1.0,false)
		end
	else
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
function eventLoop(passado,faltando)
	pass_int=pass_int+1
	falt_int=math.floor(faltando/500)
	if changed == true then
	if pass_int == 14 then
		showMessage(text.getready)
	elseif pass_int == 28 then
		showMessage("<BL><b>3...</b>")
		for name,player in next,tfm.get.room.playerList do
			if tfm.get.room.playerList[name].y <= 400 and not tfm.get.room.playerList[name].isDead then
				tfm.exec.killPlayer(name)
				data[name].enabled=false
				showMessage(text.memory_error,name)
			end
		end
	elseif pass_int == 30 then
		showMessage("<BL><b>2...</b>")
	elseif pass_int == 32 then
		showMessage("<BL><b>1...</b>")
	elseif pass_int == 34 then
		showMessage(text.start)
		for i=0,1 do
			tfm.exec.removePhysicObject(i)
		end	
		running=true
	end
	if running == true then
		if wind == true then
			for i=1,24 do
				x=math.random(2800,3200)
				y=math.random(2000,10000)
				tfm.exec.explosion(x, y, -8, 100, true)
				tfm.exec.displayParticle(math.random(26,27), x, y, 1, 1, 1, 1)
			end
		end
		if meteor == true then
			loop=loop+1
			if loop == 4 then
				for i=1,2 do
					x=math.random(2500,3500)
					tfm.exec.addShamanObject(1, x, 0, 0, 0, 0, false)
				end
				loop=0
			end
		end
		if gravity == true then
			loop=loop+1
			if loop == 4 then
				tfm.exec.setWorldGravity(0,math.random(10,15))
				loop=0
			end
		end
		if cheese == true then
			for name,player in next,tfm.get.room.playerList do
				tfm.exec.giveCheese(name)
			end
		end
		run_int=run_int+0.5
		if run_int == 25 and falt_int >= 48 then
			event_selected=math.random(1,4)
			if event_selected == 2 then
				event_int=power_d.p2[math.random(#power_d.p2)]
			elseif event_selected == 3 then
				event_int=power_d.p3[math.random(#power_d.p3)]
			else
				event_int=math.random(12,24)
			end
			if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
				showMessage("<VP>"..text.event1.." <V><b>"..events_pt[event_selected].."</b> <VP>"..text.event2.."<J><b>"..event_int.."</b> <VP>"..text.event3.."")
			else
				showMessage("<VP>"..text.event1.." <V><b>"..events_en[event_selected].."</b> <VP>"..text.event2.."<J><b>"..event_int.."</b> <VP>"..text.event3.."")
			end
		end
		if run_int == 30 and falt_int >= 48 then
			if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
				showMessage("<VP>"..text.event1.." <V><b>"..events_pt[event_selected].."</b><VP>"..text.event4.."")
			else
				showMessage("<VP>"..text.event1.." <V><b>"..events_en[event_selected].."</b><VP>"..text.event4.."")
			end
			if event_selected == 1 then
				wind=true
			elseif event_selected == 2 then
				meteor=true
			elseif event_selected == 3 then
				gravity=true
			elseif event_selected == 4 then
				cheese=true
			end
		end
		if falt_int == 20 and endgame == false then
			showMessage(text.t10secs)
		end
		if falt_int <= 2 and endgame == false then
			while vencedor == "" do
				vencedor = defineVencedor()
			end
			for name,player in next,tfm.get.room.playerList do
				if not name == vencedor then
					tfm.exec.killPlayer(name)
				end
			end
			tfm.exec.giveCheese(vencedor)
			tfm.exec.playerVictory(vencedor)
			tfm.exec.setPlayerScore(vencedor,data[vencedor].a,true)
			showMessage("<VP><V><b>"..vencedor.."</b> <VP>"..text.winner.."\n<N>"..text.scaled.."<V>"..math.floor(math.pow((tfm.get.room.playerList[vencedor].y/-1+10565)/100,2.2)).." <N>"..text.recognized.."")
			tfm.exec.setGameTime(15)
			falt_int=15
			endgame=true
		end
		if falt_int <= 1 and endgame == true then
			tfm.exec.newGame(xml2,false)
		end
		if wind == true or meteor == true or gravity == true or cheese == true then
			event_int=event_int-0.5
			if event_int == 0 then
				resetEvents()
				if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
					showMessage("<VP>"..text.event1.." <V><b>"..events_pt[event_selected].."</b><VP>"..text.event5.."")
				else
					showMessage("<VP>"..text.event1.." <V><b>"..events_en[event_selected].."</b><VP>"..text.event5.."")
				end
				event_selected=0;
			end
		end
	end
	for name,player in next,tfm.get.room.playerList do
		if data[name].enabled == true then
		if running == true then
			data[name].x=math.floor(math.pow((tfm.get.room.playerList[name].y/-1+10565)/100,2.2))
			if data[name].x >= 1000 and data[name].a == 0 then
				data[name].a=1
			end
			if data[name].x >= 2000 and data[name].a == 1 then
				showMessage(text.reached2,name)
				data[name].a=2
			end
			if data[name].x >= 5000 and data[name].a == 2 then
				showMessage(text.reached3,name)
				data[name].a=3
			end
			if data[name].x >= 10000 and data[name].a == 3 then
				showMessage(text.reached4,name)
				data[name].a=4
			end
			if data[name].x >= 20000 and data[name].a == 4 then
				showMessage(text.reached5,name)
				data[name].a=5
			end
			if data[name].x >= 24650 and data[name].a == 5 then
				showMessage(text.reached6,name)
				data[name].a=10
				for n,player in next,tfm.get.room.playerList do
					if not name == n then
						tfm.exec.killPlayer(name)
					else
						tfm.exec.giveCheese(name)
						tfm.exec.playerVictory(name)
						tfm.exec.setPlayerScore(name,data[name].a,true)
						showMessage("<b>"..name.."</b>"..text.reached7.."")
						tfm.exec.setGameTime(15)
						falt_int=15
						endgame=true
						data[name].enabled=false
					end
				end
			end
		end
		end
	end
	else
		if faltando <= 1 then
			changed=true
			tfm.exec.newGame(xml2,false)
			ui.removeTextArea(0,nil)
		end
	end
end
tfm.exec.newGame(map)
