for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","AutoScore","PhysicalConsumables","DebugCommand","MinimalistMode"} do
	tfm.exec["disable"..f](true)
end
for _,g in next,{"p","pw","help","powerups"} do
	system.disableChatCommandDisplay(g,true)
end
sudden=false; winner=""; data={}; players_table={}; increase=0; intensity=40; nightmode=false; night=0; mices=0; remain=10; last_win=""; times=1; imageId=-1; enabled=false;
if tfm.get.room.isTribeHouse == false then tfm.exec.setRoomMaxPlayers(35) end
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	end
end
function split(t,s)
	local a={}
	for i,v in string.gmatch(t,string.format("[^%s]+",s or "%s")) do
		table.insert(a,i)
	end
	return a
end
function menuShow(name,color,x,y,width,height,title,content)
	if data[name].opened == false then
		data[name].opened=true
		ui.addTextArea(1004,"",name,-1000,-600,2800,1600,0x000001,0x000001,0.65,true)
		ui.addTextArea(1001,"",name,x+5,y+5,width,height,color,color,0.95,true)
		ui.addTextArea(1000,"<font size='13'><i>\n\n"..content.."",name,x,y,width,height,0x151515,color,0.95,true)
		ui.addTextArea(1002,"<font color='#f8d802'><font size='14'><p align='center'><i><b>"..title.."",name,x+5,y+5,width-11,22,0x101010,0x101010,0.95,true)
		ui.addTextArea(1003,"<font color='#ff2300'><font size='14'><b><a href='event:close'>X</a>",name,x+width-25,y+5,width-10,20,0,0,0.95,true)
	end
end
function eventChatCommand(name,message)
	local arg = split(message, " ")
	if arg[1] == "p" then
		if arg[2] then
			nome = arg[2]:lower():gsub('%a', string.upper, 1)
		else
			nome = name
		end

		if tfm.get.room.playerList[nome] then
			menuShow(nome,0x686868,240,130,320,105,nome,"<font size='12'><b>Score: "..data[nome].score.."</b>\n\nWins: "..data[nome].wins.."\nMatches: "..data[nome].matches.."")
		end
	end
	if message == "help" then
		menuShow(name,0x686868,140,100,520,200,"Help","The objetive of this module is to stay alive and kill the other players using the mouse to generate spirits.\n\nAt moment, 6 powerups are available:\nF1 = Fast Spirits (700 points)\nF2 = Double Power (700 points)\nF3 = Box Meteor (550 points)\nF4 = Night Mode (400 points)\nF5 = Ultra Explosion (800 points)\nF6 = Stone Meteor (750 points)")
	end
	if message == "powerups" then
		menuShow(name,0x686868,140,100,520,240,"Powerups List","<b>F1 - Fast Spirits - 700 points</b>\nAllows you to use spirits without the default timeout.\n<b>F2 - Double Power - 700 points</b>\nDouble the power of your anvils, independently of actual intensity.\n<b>F3 - Box Meteor - 550 points</b>\nSpawns a meteor of large box on the map.\n<b>F4 - Night Mode - 400 points</b>\nBlacks out the map for 2 seconds.\n<b>F5 - Ultra Explosion - 800 points</b>\nSpawns a huge amount of spirits around the map.\n<b>F6 - Stone Meteor - 750 points</b>\nSpawns a lot of stones falling from the top of map.")
	end
end
function eventNewPlayer(name)
	system.bindMouse(name)
	if not data[name] then
		table.insert(players_table,name)
		data[name]={time=0,matches=0,wins=0,score=0,p1=false,p2=false,pcount=0,imageid=0,imaget=3,opened=false}
	end
	ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,5,25,70,24,0x000001,0x000001,0.75,true)
	for _,i in next,{72,82,85,112,113,114,115,116,117,123} do
		tfm.exec.bindKeyboard(name,i,true,true)
	end
	system.bindMouse(name,true)
	showMessage("<VP><b>Welcome to module ClickWar!</b>\n<N>Use the mouse to generate explosions, kill other mices and stay alive!",name)
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventMouse(name,x,y)
	if not tfm.get.room.playerList[name].isDead and enabled == true then
		if data[name].p1 == false then
			if data[name].time >= 2 then
				if data[name].p2 == true then
					tfm.exec.explosion(x,y,intensity,intensity*2,false)
				else
					tfm.exec.explosion(x,y,intensity/2,intensity*1.5,false)
				end
				data[name].time=0;
				tfm.exec.displayParticle(10,x,y,0,0,0,0,nil)
			end
		else
			if data[name].p2 == true then
				tfm.exec.explosion(x,y,intensity,intensity*2,false)
			else
				tfm.exec.explosion(x,y,intensity/2,intensity*1.5,false)
			end
			data[name].time=2;
			tfm.exec.displayParticle(10,x,y,0,0,0,0,nil)
		end
	end
end
function eventNewGame()
	tfm.exec.removeImage(imageId)
	ui.removeTextArea(1,nil)
	sudden=false
	tfm.exec.setGameTime(140)
	winner=""; increase=0; remain=10; enabled=false; intensity=40; prox=false;
	for name,player in pairs(tfm.get.room.playerList) do
		data[name].matches=data[name].matches+1
		data[name].p1=false
		data[name].p2=false
		data[name].pcount=0
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
			showMessage("<R>Souris aren't allowed to play on this module. Create an account or log in to play ClickWar.",name)
		end
	end
end
function eventLoop(pass,falt)
	if nightmode == true then
		night=night+1
		if night >= 4 then
			ui.removeTextArea(2571,nil)
			night=0
			nightmode=false
		end
	end
	if sudden == true then
		intensity=intensity+2
		if falt < 40000 then
			intensity=intensity+1
		end
		for name,player in pairs(tfm.get.room.playerList) do
			if not tfm.get.room.playerList[name].isDead then
				data[name].score=math.floor(data[name].score+(intensity/40))
			end
		end
	end
	if falt < 70000 and falt > 69375 then
		showMessage("<ROSE>The ultra hard mode will be enabled in 10 seconds!",nil)
	end
	if falt < 60000 and sudden == false and falt > 50000 then
		showMessage("<R><b>Ultra hard mode enabled!</b>",nil)
		imageId = tfm.exec.addImage("17a4e9a853d.png",":1",240,40,nul)
		remain=-2.5
		ui.addTextArea(1,"",nil,-1000,-1000,3000,3000,0x000001,0x000001,0.65,false)
		sudden=true;
	end
	if falt < 40000 and sudden == true and falt > 19000 then
		ui.addTextArea(1,"",nil,-1000,-1000,3000,3000,0x000001,0x000001,0.775,false)
	end
	if falt < 20000 and sudden == true and falt > 9000 then
		ui.addTextArea(1,"",nil,-1000,-1000,3000,3000,0x000001,0x000001,0.9,false)
	end
	if falt < 100 then
		tfm.exec.newGame("#10")
	end
	if prox == false then
		ui.setMapName("<J><b>"..tfm.get.room.currentMap.."</b>   <G>|   <N>Intensity: <V>"..intensity.."   <G>|   <VP>ClickWar</b>")
	else
		ui.setMapName("<b>"..winner.."</b> <N>wons the match! Next match on "..math.floor(falt/1000).." seconds.<")
	end
	remain=remain-0.5
	if remain == 3 then imageId = tfm.exec.addImage("17a4e9afa86.png",":1",358,80,nul) end
	if remain == 2.5 then tfm.exec.removeImage(imageId,true) end
	if remain == 2 then imageId = tfm.exec.addImage("17a4e9ae302.png",":1",358,80,nul) end
	if remain == 1.5 then tfm.exec.removeImage(imageId,true) end
	if remain == 1 then imageId = tfm.exec.addImage("17a4e9acb8f.png",":1",358,80,nul) end
	if remain == 0.5 then tfm.exec.removeImage(imageId,true) end
	if remain == 0 then
		imageId = tfm.exec.addImage("17a4e9ab41f.png",":1",303,80,nul)
		remain=-3
		enabled=true;
	end
	if remain == -4.5 then
		tfm.exec.removeImage(imageId,true)
	end
	for name,player in pairs(tfm.get.room.playerList) do
		data[name].time=data[name].time+1
		if data[name].pcount >= 0 then
			data[name].pcount=data[name].pcount-1
		else
			data[name].p1=false
			data[name].p2=false
		end
		if data[name].imaget >= 0 then
			data[name].imaget=data[name].imaget-0.5
		end
		if data[name].imaget == 0 then
			tfm.exec.removeImage(data[name].imageid)
			data[name].imageid=-1
		end
	end
	if enabled == true then
		if intensity < 217 then
			increase=increase+0.5
			if increase >= 2 then
				if sudden == false then
					intensity=intensity+1
					increase=0;
					for name,player in pairs(tfm.get.room.playerList) do
						if not tfm.get.room.playerList[name].isDead then
							if pass > 30000 then
								data[name].score=math.floor(data[name].score+(intensity/24))
							end
							if pass > 60000 then
								data[name].score=math.floor(data[name].score+(intensity/24))
							end
						end
					end
				end
			end
		else
			intensity=217
		end
	end
end
function eventPlayerDied(name)
	if name == last_win and times >= 2 then
		showMessage("<J>The victory sequence of <R>"..last_win.."<J> has been ended!")
		times=1
	end
	local i=0
	local n
	for pname,player in pairs(tfm.get.room.playerList) do
		if not player.isDead then
			i=i+1
			n=pname
		end
	end
	if i==0 then
		tfm.exec.newGame("#10")
	elseif i==1 then
		winner=n;
		tfm.exec.giveCheese(n)
		tfm.exec.playerVictory(n)
		data[n].wins=data[n].wins+1
		data[n].score=data[n].score+200
		tfm.exec.setGameTime(10)
		tfm.exec.setPlayerScore(n,1,true)
		prox=true;
		if winner == last_win then
			data[n].score=data[n].score+100
			times=times+1
			if times == 2 or times == 3 then
				showMessage("<J>"..last_win.." wons <b>"..times.."</b> times in a row!")
			end
			if times >= 4 then
				showMessage("<R><b>Legendary!</b><J> "..last_win.." wons <b>"..times.."</b> times in a row!")
			end
		end
		last_win=n
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,5,25,70,24,0x000001,0x000001,0.75,true)
		ui.addTextArea(298,"<p align='center'><a href='event:help'>Help</a>\n<a href='event:profile'>Profile</a>\n<a href='event:powerups'>Powerups</a>",name,5,55,90,48,0x000001,0x000001,0.80,true)
	end
	if callback == "hide_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,5,25,70,24,0x000001,0x000001,0.75,true)
		ui.removeTextArea(298,name)
	end
	if callback == "profile" then
		showMessage("Use the !p command to view your profile and !p [user] to view the profile of specified user.",name)
	end
	if callback == "close" then
		for _,i in next,{1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011} do
			ui.removeTextArea(i,name)
		end
		data[name].opened=false
	end
	if callback == "help" then
		eventChatCommand(name,"help")
	end
	if callback == "powerups" then
		eventChatCommand(name,"powerups")
	end
end
function eventKeyboard(name,key,down,x,y)
	if key == 72 then
		eventChatCommand(name,"help")
	end
	if key == 82 then
		eventChatCommand(name,"rank")
	end
	if key == 85 then
		eventChatCommand(name,"powerups")
	end
	if enabled == true then
		if not tfm.get.room.playerList[name].isDead and data[name].p1 == false and data[name].p2 == false then
			if key == 112 and data[name].score >= 700 then
				data[name].p1=true
				data[name].score=data[name].score-700
				data[name].pcount=16
				showMessage("<J>"..name.." used the powerup <ROSE><b>Fast Spirits!</b>")
			end
			if key == 113 and data[name].score >= 700 then
				data[name].p2=true
				data[name].score=data[name].score-700
				data[name].pcount=20
				showMessage("<J>"..name.." used the powerup <ROSE><b>Double Power!</b>")
			end
			if key == 114 and data[name].score >= 550 then
				data[name].score=data[name].score-550
				showMessage("<J>"..name.." used the powerup <ROSE><b>Box Meteor!</b>")
				for i=-6,19 do
					tfm.exec.addShamanObject(2,i*60,-1,0,0,0,false)
				end
			end
			if key == 115 and data[name].score >= 400 then
				data[name].score=data[name].score-400
				showMessage("<J>"..name.." used the powerup <ROSE><b>Night Mode!</b>")
				ui.addTextArea(2571,"",nil,-800,-600,3000,3000,0x010101,0x010101,0.99,true)
				nightmode=true
			end
			if key == 116 and data[name].score >= 800 then
				data[name].score=data[name].score-800
				showMessage("<J>"..name.." used the powerup <ROSE><b>Mega Explosion!</b>")
				for i=-4,12 do
					for j=-2,6 do
						tfm.exec.explosion(i*100,j*100,intensity,intensity*1.5,false)
						tfm.exec.displayParticle(10,i*100,j*100,0,0,0,0,nil)
					end
				end
			end
			if key == 117 and data[name].score >= 750 then
				data[name].score=data[name].score-750
				showMessage("<J>"..name.." used the powerup <ROSE><b>Stone Meteor!</b>")
				for i=-12,38 do
					tfm.exec.addShamanObject(85,i*30,-1,0,0,0,false)
				end
			end
		end
	end
end
tfm.exec.newGame("#10")
