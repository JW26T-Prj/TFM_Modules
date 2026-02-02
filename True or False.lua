for _,f in next,{"per","skip","limits","return","cancel","at","shamdef"} do
	system.disableChatCommandDisplay(f)
end
for _,G in next,{"DebugCommand","AutoScore","AutoNewGame","AfkDeath","PhysicalConsumables","AllShamanSkills"} do
	tfm.exec["disable"..G](true)
end
blue_ground={type = 12,width = 380,height = 100,foregound = 0,friction = 0.0,restitution = 0.0,angle = 0,color = 0xFFFFFF,miceCollision = true,groundCollision = false,dynamic = true, fixedRotation = true, mass = 999999}
red_ground={type = 12,width = 380,height = 100,foregound = 0,friction = 0.0,restitution = 0.0,angle = 0,color = 0xFFFFFF,miceCollision = true,groundCollision = false,dynamic = true, fixedRotation = true, mass = 999999}
center_ground={type = 12,width = 20,height = 300,foregound = 0,friction = 0.0,restitution = 0.0,angle = 0,color = 0xFFFFFF,miceCollision = true,groundCollision = true,dynamic = false}
if tfm.get.room.isTribeHouse == false then tfm.exec.setRoomMaxPlayers(35); end
limits={questions=10,time=7,mices_alive=0}
questions={question="",answer="",round=0}
current_mode=""; answer_time=20; remain_time=0; game_map="@7967059"; ninjas={};
numbers1={{83,107,121,121,109,101,108,108,117,35,48,48,48,48},
{86,105,101,103,111,35,48,51,52,53},
{71,105,108,108,35,50,57,54,54},
{83,104,117,110,95,107,97,122,97,109,105,35,55,48,49,52},
{71,108,111,98,111,95,114,117,114,97,108,35,54,53,51,50},
{84,105,116,97,110,53,48,35,48,48,48,48},
{75,97,122,97,114,105,110,97,35,52,56,55,56},
{82,117,97,110,98,114,35,57,50,50,55},
{82,105,118,101,110,35,49,54,51,48},
{83,107,121,95,104,100,116,118,35,52,57,52,50},
{75,108,97,117,115,35,52,49,51,49},
{76,117,105,115,105,110,35,49,55,49,55},
{78,101,107,97,110,35,48,48,48,48},
{66,97,114,111,100,105,117,115,35,57,53,54,50},
{83,101,110,110,97,35,54,49,53,51}}
for i=1,rawlen(numbers1) do
	final=""
	for j=1,rawlen(numbers1[i]) do
		final=final..string.char(numbers1[i][j])
	end
	table.insert(ninjas,final)
end
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		if name == nil then
			ui.addPopup(1024,0,temp_text,nil,300,100,200,true)
		else
			ui.addPopup(1025,0,temp_text,name,300,200,200,true)
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
function showTrueFalse(name)
	ui.addTextArea(251,"<font color='#010101'><font size='32'>True",name,178,248,224,128,0,0,1.0,true)
	ui.addTextArea(250,"<VP><font size='32'>True",name,180,250,224,128,0,0,1.0,true)
	ui.addTextArea(253,"<font color='#010101'><font size='32'>False",name,538,248,224,128,0,0,1.0,true)
	ui.addTextArea(252,"<R><font size='32'>False",name,540,250,224,128,0,0,1.0,true)
end
function eventNewGame()
	ui.removeTextArea(0,nil)
	limits.mices_alive=0
	for name,player in next,tfm.get.room.playerList do
		for _,i in next,{10,11,20} do
			ui.addPopup(i,0,"",name,-1000,-1000,128,false)
		end
		if not tfm.get.room.playerList[name].isShaman then
			limits.mices_alive=limits.mices_alive+1
		else
			tfm.exec.setPlayerScore(name,-1,false)
			showMessage("<VP>Type <b>!per</b> to make a question, or type <b>!skip</b> to skip your turn.",name)
		end
		if name:sub(1,1) == "*" then
			tfm.exec.killPlayer(name)
			tfm.exec.setPlayerScore(name,-10,true)
			showMessage("<R>Guest players cannot play this module. Create an account or log in to play True or False.",name)
		end
	end
	questions.round=0
end
function eventNewPlayer(name)
	tfm.exec.setPlayerScore(name,0,false)
	ui.setBackgroundColor("#202020")
	ui.setMapName("<VP>True or False")
	showTrueFalse(name)
end
for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end
function eventPlayerDied(name)
	if not tfm.get.room.playerList[name].isShaman then
		limits.mices_alive=limits.mices_alive-1
	end
end
function reset()
	tfm.exec.newGame(game_map)
	tfm.exec.setGameTime(60)
	current_mode="waiting"
	for name,player in next,tfm.get.room.playerList do
		ui.setBackgroundColor("#202020")
		if tfm.get.room.playerList[name].isShaman then
			tfm.exec.setPlayerScore(name,-1,false)
		end
		showTrueFalse(name)
	end
	ui.setMapName("<VP>True or False")
end
function isTrue()
	showMessage("<VP>The answer is TRUE!")
	tfm.exec.addPhysicObject(1, 610, -400, red_ground)
end
function isFalse()
	showMessage("<VP>The answer is FALSE!")
	tfm.exec.addPhysicObject(0, 190, -400, blue_ground)
end
function eventPopupAnswer(id,name,answer)
	if id == 0 then
		if tonumber(answer) >= 1 and tonumber(answer) <= 15 then
			limits.questions=tonumber(answer)
			ui.addPopup(1,2,"Type the time limit of the round in minutes (min: 1, max: 12)",name,350,175,200,true)
		end
	end
	if id == 1 then
		if tonumber(answer) >= 1 and tonumber(answer) <= 12 then
			limits.time=tonumber(answer)
			showMessage("Questions limit changed to "..limits.questions.." and time limit changed to "..limits.time.."")
		end
	end
	if id == 10 then
		if string.len(answer) >= 10 and string.len(answer) <= 170 then
			questions.question=answer
			ui.addPopup(11,1,"Click YES if your answer is TRUE.\nClick NO if your answer is FALSE.",name,350,175,200,true)
		else
			ui.addPopup(10,2,"Type your question:",name,350,175,200,true)
			showMessage("<R>Your question is too large or too short. Please make a new question.",name)
		end
	end
	if id == 11 then
		if remain_time > 1 and tfm.get.room.playerList[name].isShaman then
			questions.answer=answer
			questions.round=questions.round+1
			current_mode="truefalse"
			tfm.exec.setGameTime(answer_time)
			for name,player in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[name].isShaman then
					tfm.exec.movePlayer(name,400,325)
				else
					tfm.exec.movePlayer(name,400,190)
				end
			end
			showMessage("<N>"..questions.question.."")
			ui.addTextArea(0,"<font size='14'><p align='center'><font face='Segoe UI,Arial'><N>"..questions.question.."",nil,15,25,770,60,0x010101,0x520899,0.99,true)
			for _,i in next,ninjas do
				showMessage(questions.answer,i)
			end
		end
	end
	if id == 20 then
		if answer == "yes" then
			showMessage("<R>"..name.." skipped your turn.")
			reset()
		end
	end
end
function eventChatCommand(name,message)
	if verifyNinjas(name) == true then
		if message == "limits" then
			ui.addPopup(0,2,"Type the limit of questions (min: 1, max: 15)",name,350,175,200,true)
		end
		if(message:sub(0,2) == "at") then
			tt={}; for i=5,30 do table.insert(tt,tostring(i)) end
			if findString(message:sub(4),tt) then
				answer_time=tonumber(message:sub(4))
				showMessage("Answer time: "..answer_time.."s.",name)
			end
		end
		if(message:sub(0,7) == "shamdef") then
			if current_mode == "waiting" then
				tfm.exec.setPlayerScore(message:sub(9),10001,false)
				reset()
			end
		end
		if message == "return" then
			if current_mode == "truefalse" then
				for name,player in next,tfm.get.room.playerList do
					if not tfm.get.room.playerList[name].isShaman then
						tfm.exec.movePlayer(name,400,65)
					end
				end
				current_mode="waiting"
				tfm.exec.setGameTime(60)
				showMessage("<R>This question has been cancelled.")
				ui.removeTextArea(0,nil)
			end
		end
		if message == "cancel" then
			if current_mode == "truefalse" or current_mode == "waiting" then
				for name,player in next,tfm.get.room.playerList do
					tfm.exec.killPlayer(name)
				end
				showMessage("<R>This shaman has been skipped.")
				reset()
			end
		end
	end
	if tfm.get.room.playerList[name].isShaman and current_mode == "waiting" then
		if message == "per" and limits.mices_alive >= 2 then
			ui.addPopup(10,2,"Type your question:",name,350,175,200,true)
		end
		if message == "skip" then
			ui.addPopup(20,1,"Skip your turn?",name,350,175,200,true)
		end
	end
end
function eventLoop(time,remaining)
	remain_time=remaining/1000
	if remain_time < 1 and current_mode == "waiting" then
		reset()
		showMessage("<R>Time is up! Other shaman will be choosed.")
	end
	if remain_time < 1 and current_mode == "truefalse" then
		ui.removeTextArea(0,nil)
		tfm.exec.addPhysicObject(2, 370, 300, center_ground)
		tfm.exec.addPhysicObject(3, 430, 300, center_ground)
		tfm.exec.setGameTime(5)
		current_mode="wait"
	end
	if remaining < 300 and current_mode == "wait" then
		if questions.answer == "yes" then
			isTrue()
		else
			isFalse()
		end
		for name,player in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[name].isShaman then
				if player.x >= 370 and player.x <= 430 then
					tfm.exec.killPlayer(name)
				end
			end
		end
		tfm.exec.setGameTime(7)
		current_mode="answer"
	end
	if remaining <= 1 and current_mode == "answer" then
		if questions.answer == "yes" then
			for name,player in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[name].isShaman then
					if player.x > 400 then
						tfm.exec.killPlayer(name)
					else
						tfm.exec.movePlayer(name,400,65)
					end
				end
			end
		else
			for name,player in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[name].isShaman then
					if player.x < 400 then
						tfm.exec.killPlayer(name)
					else
						tfm.exec.movePlayer(name,400,65)
					end
				end
			end
		end
		for i=2,3 do
			tfm.exec.removePhysicObject(i)
		end
		current_mode="waiting"
		tfm.exec.setGameTime(60)
	end
	if remain_time < 55 and limits.mices_alive <= 0 and current_mode == "waiting" then
		reset()
		showMessage("<R>No winners!")
	end
	if remain_time < 55 and limits.mices_alive == 1 and current_mode == "waiting" then
		for name,player in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[name].isDead and not tfm.get.room.playerList[name].isShaman then
				tfm.exec.setPlayerScore(name,10000,false)
				reset()
			end
		end
	end
	if remain_time < 55 and remain_time >= 54 and limits.mices_alive >= 2 and questions.round >= 1 and current_mode == "waiting" then
		for name,player in next,tfm.get.room.playerList do
			if not tfm.get.room.playerList[name].isDead then
				tfm.exec.setPlayerScore(name,1,true)
				tfm.exec.displayParticle(15,player.x,player.y)
			end
		end
		if questions.round >= limits.questions and current_mode == "waiting" then
			reset()
			showMessage("<R>Questions limit reached!")
		end
	end
	if time > limits.time*60000 and current_mode == "waiting" then
		reset()
		showMessage("<R>Time limit reached!")
	end
end
function eventSummoningEnd(name)
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.killPlayer(name)
	end
	showMessage("<R>This shaman has been skipped.")
	reset()
end
reset()
