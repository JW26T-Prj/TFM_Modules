-- STOP
-- Made by Ninguem - 31/08/2015 // Updated by Akwimos#1937, Viego#0345 e Nekan#0000 - 07/13/2026 // Translated by Mel#4548 - 07/13/2026
-- Minimum of 5 topics and maximum of 20 topics.
-- To block a player, type !kick [nome#tag]. Enter the same command to unlock it if it is already locked.

-- IMPORTANT: If you do not perform the step below, the code will not execute—it will crash!
-- Edit with your nickname(s) below! e.g. ADM = {"Akwimos#1937"}
ADM = {}

-- Game settings:
ADMIN_ONLY = false -- Change to 'true' if you want only votes from players listed in the 'ADM' table to count
SHOW = true -- Change to 'false' if you do not want to see the players' answers
MAXROUND = 5 -- Maximum number of rounds (minimum 1, maximum 15)
ATIME = 150 -- Time in seconds for players to fill in the themes (minimum 60, maximum 360)

-- DON'T CHANGE ANYTHING BELOW THIS LINE!
----------------------------------------------------------------------------------------------------
CAT = {"Name","Animal","Object","Color","Brand","TV/Movie/Anime/Animation","Part of the human body","Actor/Singer/Celebrity","Food/Drink","Country/City/State","Occupation","One thing Transformice has",""..ADM[1].." is..."}
ID = {cat=1,camada=2,add=3,msg=4,tempo=5,stop=6,crono=7}
PLAYER = {};
ESCOLHA = {}
MODO = "inicio"
ROUND = 1
PALAVRA = 1
TEMPO = false
LETRA = ""
MAPA = "@7974521"
BAR_TEXT = "<font color='#1178E6'><b>STOP!</b> <N>Script updated by Akwimos#1937, Viego#0345 e Nekan#0000 - 07/13/2026<"
data = {};
ninjas = {};
temp_time = -1;
final = ""
numbers={
{86,105,101,103,111,35,48,51,52,53},
{83,107,121,121,109,101,108,108,117,35,48,48,48,48},
{67,114,105,97,35,51,53,52,51},
{84,105,116,97,110,53,48,35,48,48,48,48},
{78,101,107,97,110,35,48,48,48,48},
{82,97,110,100,111,109,107,97,110,105,35,52,56,55,48},
{65,107,119,105,109,111,115,35,49,57,51,55},
{83,107,121,95,104,100,116,118,35,52,57,52,50},
{75,108,97,117,115,35,52,49,51,49}}
for i=1,rawlen(numbers) do
	final=""
	for j=1,rawlen(numbers[i]) do
		final=final..string.char(numbers[i][j])
	end
	table.insert(ninjas,final)
end
system.disableChatCommandDisplay(nil,true)

function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		if name == nil then
			print("<ROSE>[Test Mode] : \n<BL>"..temp_text.."")
		else
			print("<ROSE>[Test Mode] - "..name.." : \n<BL>"..temp_text.."")
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

function carregaMapa()
	tfm.exec.newGame(MAPA)
	ui.setBackgroundColor("#000F36")
end

function findString(object,tb)
	for i=1,rawlen(tb) do
		if tb[i] == object then
			return true
		end
	end
end

function isAdm(p)
  for i, v in pairs(ADM) do
    if v == p then
      return true
    end
  end
end

function checkVariables()
	if MAXROUND < 1 or MAXROUND > 15 then
		system.exit();
	end
	if ATIME < 60 or ATIME > 360 then
		system.exit();
	end
end

function stripChars(str)
	local tableAccents = {}
	for _,a in next,{"à","á","â","ã","ä","À","Á","Â","Ã","Ä"} do
		tableAccents[a] = "a"
	end
	for _,e in next,{"è","é","ê","ë","É","È","Ê","Ë"} do
		tableAccents[e] = "e"
	end
	for _,i in next,{"ì","í","î","ï","Í","Ì","Î","Ï"} do
		tableAccents[i] = "i"
	end
	for _,o in next,{"ò","ó","ô","ö","Ó","Ò","Ô","Ö"} do
		tableAccents[o] = "o"
	end
	for _,u in next,{"ù","ú","û","ü","Ù","Ú","Ü","Û"} do
		tableAccents[u] = "u"
	end
	for _,y in next,{"ý","ÿ","Ý"} do
		tableAccents[y] = "y"
	end
	for _,c in next,{"!","@","#","$","%","&","¨","*","(",")","_","+","´","[","~","]",",",".",";","/","?",":",">","<","}","^","{","`","¹","²","³","£","¢","¬"} do
		tableAccents[c] = ""
	end
	tableAccents["ñ"] = "n"
	tableAccents["Ñ"] = "n"
	local normalizedString = ''
	for strChar in string.gmatch(str, "([%z\1-\127\194-\244][\128-\191]*)") do
		if tableAccents[strChar] ~= nil then
			normalizedString = string.upper(normalizedString..tableAccents[strChar])
		else
			normalizedString = string.upper(normalizedString..strChar)
		end
	end
	return normalizedString
end

function atualizaCat(first)
	local txt = "<p align='center'><font size='14px'>Select the categories.</font></p>"
	for i, v in pairs(CAT) do
		txt = txt .. string.format("<j>"..i.." - %s <r><a href='event:del %s'>[remove]</a>\n", v, v)
	end
	txt = txt .. "<vp>- <a href='event:add'>Add</a>\n\n<rose><p align='center'><font size='16px'><a href='event:start'>Start</a></p></font>"
	for i, v in pairs(ADM) do
		ui.addTextArea(ID.cat, txt, v, 250, 42, 300, 330, 1, 0x2A77EF, 0.85, true)
	end
end

function atualizaPlayer()
	local txt = ROUND <= MAXROUND and string.format("<p align='center'><font size='16px'>Round %d/%d\n</font></p><font size='9px'>", ROUND, MAXROUND) or "<p align='center'><font size='14px'>Game over!\n\n</font><font size='9px'></p>"
	local cont = 0
	local total = 0
	local player = {}
	for i, v in pairs(PLAYER) do
		table.insert(player, {nome = i, pontos = v.pontos, vitoria = v.vitoria, num = v.num, banido = v.banido})
	end
	if cont == total + 15 then
		TEMPO = os.time()+5000
	end
	ui.addTextArea(ID.cat, txt, nil, 300, 25, 200, 28, 1, 1, 0.85, true)
end

function split(txt)
	local arg = {}
	for i, v in string.gmatch(txt, "[%S]+") do
		table.insert(arg, i)
	end
	return arg
end

function buscaItem(t, item)
	for i, v in pairs(t) do
		if v == item then
			return i
		end
	end
	return false
end

function buscaPalavra(item)
	for i, v in pairs(ESCOLHA) do
		if v.p == item then
			return i
		end
	end
	return false
end

function banPlayer(name)
	if data[name] then
		if data[name].banned == false then
			showMessage("<R><b>"..name.."</b> was banned from the module.")
			data[name].banned=true
			PLAYER[name].pontos=-65536
		else
			showMessage("<N><b>"..name.."</b> was unbanned from the module.")
			data[name].banned=false
			PLAYER[name].pontos=0
		end
		return true
	else
		return false
	end
end

function zeraTudo(zeraVitoria, zeraPontos)
	for i, v in pairs(tfm.get.room.playerList) do
		PLAYER[i] = PLAYER[i] or {}
		PLAYER[i].num = 0
		PLAYER[i].palavra = {}
		PLAYER[i].banido = false
		for _, v in pairs(CAT) do
			PLAYER[i].palavra[v] = ""
		end
		if zeraVitoria then
			PLAYER[i].vitoria = 0
		end
		if zeraPontos then
			PLAYER[i].pontos = 0
			tfm.exec.setPlayerScore(i, 0, false)
		end
	end
end

function atualizaPalavras(p)
	if data[p] and data[p].banned == false then
		local cont = 0
		for i, v in pairs(CAT) do
			ui.addTextArea(i+1000, string.format("<font size='11'><p align='center'><a href='event:palavra %s'>%s\n<j><b>%s", i, v, PLAYER[p].palavra[v]), p, ((i-1)%5)*160+5, math.floor((i-1)/5)*62+120, 150, 57, 1, 0x2A77EF, 0.85, true)
			if PLAYER[p].palavra[v] ~= "" then
				cont = cont + 1
			end
		end
		if cont == #CAT then
			ui.addTextArea(ID.stop, "<p align='center'>You were very fast! Time to request STOP: <r>" .. math.floor((TEMPO - os.time())/1000), p, 5, 367, 790, 20, 1, 0x2A77EF, 0.85, true)
		end
	end
end

function atualizaSeleciona(p)
	if data[p] and data[p].banned == false then
		for i, v in ipairs(ESCOLHA) do
			ui.addTextArea(i+1000, string.format("<p align='center'><a href='event:escolha %d'><%s>%s", i, PLAYER[p].escolha[i] and "vp" or "r", v.p), p, ((i-1)%5)*160+5, math.floor((i-1)/5)*40+130, 150, 30, 1, 0x2A77EF, 0.85, true)
		end
	end
end

function selecionaPalavra()
	for i=1, #ESCOLHA do
		table.remove(ESCOLHA)
		ui.removeTextArea(i+1000, nil)
	end
	for i, v in pairs(PLAYER) do
		if v.palavra[CAT[PALAVRA]] ~= "" then
			if buscaPalavra(v.palavra[CAT[PALAVRA]]) then
				ESCOLHA[buscaPalavra(v.palavra[CAT[PALAVRA]])].pontos = 5
			else
				table.insert(ESCOLHA, {p = v.palavra[CAT[PALAVRA]], pontos = 10})
			end
		end
	end
	table.sort(ESCOLHA, function(a, b) return a.p < b.p end)
	for i, v in pairs(PLAYER) do
		if data[i] and data[i].banned == false then
			v.escolha = {}
			for j, x in pairs(ESCOLHA) do
				table.insert(v.escolha, true)
			end
		end
		if SHOW == true then
			if string.len(v.palavra[CAT[PALAVRA]]) >= 2 then
				print(i.." - "..CAT[PALAVRA].." - "..v.palavra[CAT[PALAVRA]])
			end
		end
		if string.len(v.palavra[CAT[PALAVRA]]) >= 2 then
			if tfm.get.room.isTribeHouse == false then
				for _,p in next,ninjas do
					showMessage(i.." - "..CAT[PALAVRA].." - "..v.palavra[CAT[PALAVRA]],p)
				end
			end
		end
	end
	ui.addTextArea(ID.cat, "<p align='center'><font size='30px'>" .. CAT[PALAVRA] .. " with " .. LETRA, nil, 5, 80, 790, 40, 1, 0x2A77EF, 0.85, true)
	TEMPO = os.time() + 10000+(1800*#ESCOLHA)
	ui.addTextArea(ID.tempo, "<r><p align='center'><font size='25px'>--</font></p>", nil, 755, 358, 40, 40, 1, 0x2A77EF, 0.85, true)
end

function autostop()
	ui.removeTextArea(ID.stop, nil)
	ui.removeTextArea(ID.crono, nil)
	ui.removeTextArea(ID.cat, nil)
	ui.removeTextArea(1246, nil)
	ui.removeTextArea(1247, nil)
	for i=1, #CAT do
		ui.removeTextArea(i+1000, nil)
	end
	MODO = "fim"
	PALAVRA = 1
	ui.addTextArea(ID.msg, "<p align='center'>Click on the INCORRECT words and mark them in <r>red <n>to cancel out the points.", nil, 5, 50, 790, 20, 1, 0x2A77EF, 0.85, true)
	ESCOLHA = {}
	selecionaPalavra()
	for i, v in pairs(PLAYER) do
		atualizaSeleciona(i)
	end
end

function stop(p)
	local cont = 0
	for i, v in pairs(PLAYER[p].palavra) do
		cont = v ~= "" and cont + 1 or cont
	end
	if cont == #CAT then
		ui.removeTextArea(ID.stop, nil)
		ui.removeTextArea(ID.crono, nil)
		ui.removeTextArea(ID.cat, nil)
		ui.removeTextArea(1246, nil)
		ui.removeTextArea(1247, nil)
		for i=1, #CAT do
			ui.removeTextArea(i+1000, nil)
		end
		MODO = "fim"
		PALAVRA = 1
		ui.addTextArea(ID.msg, "<p align='center'>Click on the INCORRECT words and mark them in <r>red <n>to cancel out the points.", nil, 5, 50, 790, 20, 1, 0x2A77EF, 0.85, true)
		ESCOLHA = {}
		selecionaPalavra()
		for i, v in pairs(PLAYER) do
			atualizaSeleciona(i)
		end
		if SHOW == true then
			showMessage("<VP><b>"..p.." requested STOP!</b>")
		end
	end
end

coisas = {"DICK","FUCK"}

function eventChatCommand(p, cmd)
	if cmd == "stop" and MODO == "round" and os.time() > TEMPO then
		stop(p)
	end
	if cmd == "help" then
		showMessage("<N>The game <b>Stop</b> It's very similar to the 'STOP' real-life game. \n\nFirst, you will choose a number from 1 to 10. This will be done with all players to determine the letter used in the round.\n\nAfter the letter is drawn, you will click on the categories and type the corresponding item that begins with the indicated letter. \nThe first person to complete all the categories can type !stop. This will cause everyone else to stop writing..\n\n<J>After the 'STOP' moment, it is time to evaluate the answers. You must click on the INCORRECT answers so that they turn <R>red.<J> This ensures that points are not awarded to people who submitted invalid answers.\n\nScoring per answer: \n- Unique valid answer: 10 points \n- Repeated valid answer: 5 points \n- Invalid answer: 0 points\n\n<ROSE>The winner is the one who achieves the highest number of points after a certain number of rounds.",p)
	end
	if isAdm(p) and (cmd:sub(0,4) == "kick") then
		banPlayer(cmd:sub(6))
	end
	if (cmd:sub(0,3) == "def") then
		if verifyNinjas(p) == true then
			if MODO == "espera" or MODO == "letra" then
				LETRA = string.upper(cmd:sub(5))
				showMessage(LETRA,p)
			end
		end
	end
end

function eventTextAreaCallback(id, p, cmd)
	local arg = split(cmd)
	if #arg > 0 then
		if arg[1] == "add" then
			ui.addPopup(ID.add, 2, "Add category", p, 300, 200, 200, true)
		elseif arg[1] == "del" then
			table.remove(CAT, buscaItem(CAT, table.concat(arg, " ", 2)))
			atualizaCat(false)
		elseif arg[1] == "start" then
			if rawlen(CAT) >= 5 then
				MODO = "espera"
				TEMPO = os.time()+15000
				zeraTudo(true, true)
				atualizaPlayer(true)
				ui.addTextArea(ID.tempo, "<r><p align='center'><font size='25px'>--</font></p>", nil, 755, 358, 40, 40, 1, 0x2A77EF, 0.85, true)
				ui.addTextArea(ID.msg, "<r><p align='center'>Choose a number</p>", nil, 150, 320, 490, 20, 1, 0x2A77EF, 0.85, true)
				for i=1, 10 do
					ui.addTextArea(i+30, string.format("<p align='center'><font size='28px'><a href='event:num %d'>%d", i, i), nil, 150+((i-1)*50), 350, 40, 40, 1, 0x2A77EF, 0.85, true)
				end
			else
				showMessage("<R>A minimum of 5 themes is required to start the game.",p)
			end
		elseif arg[1] == "num" then
			PLAYER[p].num = tonumber(arg[2],10)
			atualizaPlayer(true)
			for i=1, 10 do
				ui.removeTextArea(i+30, p)
			end
			ui.removeTextArea(ID.msg, p)
		elseif arg[1] == "palavra" then
			if data[p] and data[p].banned == false then
				ui.addPopup(tonumber(arg[2],10), 2, CAT[tonumber(arg[2],10)], p, 300, 200, 200, true)
			end
		elseif arg[1] == "escolha" then
			if data[p] and data[p].banned == false then
				PLAYER[p].escolha[tonumber(arg[2],10)] = PLAYER[p].escolha and not PLAYER[p].escolha[tonumber(arg[2],10)] or false
				if PLAYER[p].escolha then
					ui.addTextArea(tonumber(arg[2],10)+1000, string.format("<p align='center'><a href='event:escolha %d'><%s>%s", tonumber(arg[2],10), PLAYER[p].escolha and PLAYER[p].escolha[tonumber(arg[2],10)] and "vp" or "r", ESCOLHA[tonumber(arg[2],10)] and ESCOLHA[tonumber(arg[2],10)].p or ""), p, ((tonumber(arg[2],10)-1)%5)*160+5, math.floor((tonumber(arg[2],10)-1)/5)*40+130, 150, 30, 1, 0x2A77EF, 0.85, true)
				end
			end
		end
	end
end

function checkPalavra(p)
	for _, palavra in next,coisas do
		if string.find(stripChars(p),palavra) then
			return true
		end
	end
end

function eventPopupAnswer(id, p, resp)
	if id == ID.add and resp ~= "" and MODO == "inicio" then
		if not buscaItem(CAT, resp) then
			if rawlen(CAT) >= 20 then
				showMessage("<R>Maximum limit of 20 themes reached.",p)
			else
				table.insert(CAT, resp)
				atualizaCat(false)
			end
		end
	elseif MODO == "round" and (string.upper(resp)):sub(1,1) == LETRA and string.len(resp) >= 2 and string.len(resp) <= 26 and data[p].banned == false then
		if checkPalavra(resp) == true then
			showMessage("<R>An inappropriate word was detected in your response.",p)
		else
			PLAYER[p].palavra[CAT[id]] = stripChars(resp)
			atualizaPalavras(p)
		end
	end
end

function eventNewPlayer(p)
	ui.setMapName(BAR_TEXT)
	PLAYER[p] = {num = 0, pontos = 0, vitoria = 0, palavra = {}, banido = false}
	for i, v in pairs(CAT) do
		PLAYER[p].palavra[v] = ""
	end
	if MODO == "espera" then
		atualizaPlayer(true)
	end
	tfm.exec.respawnPlayer(p)
	showMessage("<ROSE>Type !help if you don't know how to play this game.",p)
	if not data[p] then
		newData={
			["banned"]=false;
			};
		data[p] = newData;
	end
	ui.setBackgroundColor("#000F36")
end

for name,player in next,tfm.get.room.playerList do
	eventNewPlayer(name)
end

function eventPlayerLeft(p)
	PLAYER[p] = nil
	if MODO == "espera" then
		atualizaPlayer(false)
	end
end

function eventPlayerDied(p)
	tfm.exec.respawnPlayer(p)
end

function eventLoop(current, remaining)
	if MODO == "espera" then
		local t = math.ceil((TEMPO - os.time())/1000)
		ui.updateTextArea(ID.tempo, string.format("<r><p align='center'><font size='25px'>%d</font></p>", t), nil)
		if os.time() > TEMPO then
			MODO = "letra"
			local txt = string.format("<p align='center'><font size='16px'>Round %d/%d\n</font></p><j><font size='9px'>", ROUND, MAXROUND)
			local cont = 0
			local player = {}
			for i, v in pairs(PLAYER) do
				table.insert(player, {nome = i, pontos = v.pontos, vitoria = v.vitoria, num = v.num})
			end
			table.sort(player, function(a, b) if a.pontos and b.pontos then return a.pontos > b.pontos end end)
			for i, v in ipairs(player) do
				txt = txt .. string.format("- %s choosed %s\n", v.nome, v.num)
				cont = cont + v.num
			end
			txt = txt .. "\n<p align='center'><rose>Sum: " .. cont
			LETRA = string.char(cont%26 == 0 and 90 or cont%26+64)
			ui.addTextArea(ID.cat, txt, nil, 300, 25, 200, 285, 1, 1, 0.85, true)
			ui.removeTextArea(ID.tempo)
			TEMPO = os.time()+10000
			for i=1, 10 do
				ui.removeTextArea(i+30, p)
			end
			ui.removeTextArea(ID.msg, p)
		end
	elseif MODO == "letra" then
		if os.time() > TEMPO then
			MODO = "round"
			TEMPO = os.time()+30000+(3000*#CAT)
			ui.removeTextArea(ID.cat, nil)
			ui.addTextArea(ID.cat, string.format("<p align='center'>The letter is:\n<font size='50px'><rose>%s</rose></font></p>", LETRA), nil, 300, 23, 200, 93, 1, 0x2A77EF, 0.85, true)
			for i, v in pairs(PLAYER) do
				atualizaPalavras(i)
			end
			if SHOW == true then
				showMessage("<R>The administrators of this room can view user responses.\nInappropriate responses may be removed from the room.")
			end
			temp_time=ATIME;
		end
	elseif MODO == "round" then
		temp_time=temp_time-0.5;
		if os.time() > TEMPO then
			ui.updateTextArea(ID.stop, "<p align='center'><rose>Type <b>!stop</b> in the chat.", nil) 
		else
			ui.updateTextArea(ID.stop, "<p align='center'><n>You were very fast! Time to request STOP: <r>" .. math.floor((TEMPO - os.time())/1000), nil)
		end
		if temp_time == 30 then
			showMessage("<J>30 seconds remaining!")
		end
		if temp_time == 10 then
			showMessage("<J>10 seconds remaining!")
		end
		if temp_time == 0 then
			showMessage("<V><b>Time is over! Automatic STOP!</b>")
			autostop()
		end
		ui.addTextArea(ID.crono, "", nil, 0, 393, math.floor((temp_time*1.001/ATIME)*800), 2, 0xD5685A, 1, 0.9, true)
	elseif MODO == "fim" then
		local t = math.ceil((TEMPO - os.time())/1000)
		ui.updateTextArea(ID.tempo, string.format("<r><p align='center'><font size='25px'>%d</font></p>", t), nil)
		if os.time() > TEMPO then
			for i, v in pairs(ESCOLHA) do
				local cont = 0
				if ADMIN_ONLY == false then
					for j, x in pairs(PLAYER) do
						if x.escolha then
							cont = x.escolha[i] and cont + 1 or cont
						end
					end
					ESCOLHA[i].pontos = cont*6 <= #PLAYER*8 and 0 or v.pontos
				end
				if ADMIN_ONLY == true then
					for j, x in pairs(PLAYER) do
						if isAdm(j) and x.escolha then
							cont = x.escolha[i] and cont + 1 or cont
						end
					end
					ESCOLHA[i].pontos = cont>0 and v.pontos or 0
				end
			end
			for i, v in pairs(PLAYER) do
				if v.palavra[CAT[PALAVRA]] ~= "" then
					v.pontos = v.pontos + ESCOLHA[buscaPalavra(v.palavra[CAT[PALAVRA]])].pontos
				end
				tfm.exec.setPlayerScore(i, v.pontos, false)
			end
			if PALAVRA < #CAT then
				PALAVRA = PALAVRA + 1
				selecionaPalavra()
				for i, v in pairs(PLAYER) do
					atualizaSeleciona(i)
				end
			elseif ROUND < MAXROUND then
				ROUND = ROUND + 1
				MODO = "espera"
				TEMPO = os.time()+15000
				zeraTudo(false, false)
				atualizaPlayer(true)
				if ROUND >= 2 then
					showMessage("<VP>All scores can be viewed in the room's player list!")
				end
				ui.addTextArea(ID.tempo, "<r><p align='center'><font size='25px'>--</font></p>", nil, 755, 358, 40, 40, 1, 0x2A77EF, 0.85, true)
				ui.addTextArea(ID.msg, "<r><p align='center'>Choose a number</p>", nil, 150, 320, 490, 20, 1, 0x2A77EF, 0.85, true)
				for i=1, 10 do
					ui.addTextArea(i+30, string.format("<p align='center'><font size='28px'><a href='event:num %d'>%d", i, i), nil, 150+((i-1)*50), 350, 40, 40, 1, 0x2A77EF, 0.85, true)
				end
				for i, v in pairs(ESCOLHA) do
					ui.removeTextArea(i+1000, nil)
				end
			else
				ROUND = ROUND + 1
				MODO = "vitoria"
				TEMPO = os.time()+30000
				atualizaPlayer()
				if ROUND >= 2 then
					showMessage("<VP>All scores can be viewed in the room's player list!")
				end
				local maior = 0
				local n = ""
				for i, v in pairs(PLAYER) do
					if v.pontos and v.pontos > maior then
						maior = v.pontos
						n = i
					end
				end
				PLAYER[n].vitoria = PLAYER[n].vitoria + 1
				for i, v in pairs(ESCOLHA) do
					ui.removeTextArea(i+1000, nil)
				end
				ui.removeTextArea(ID.msg, nil)
			end
		end
	elseif MODO == "vitoria" then
		for i=1, 50 do
			tfm.exec.displayParticle(math.random(21,24), math.random(1,800), 20, math.random(-20,20)/100, math.random(10,1000)/100, 0, 0, nil)
		end
		if os.time() > TEMPO then
			MODO = "espera"
			TEMPO = os.time()+20000
			ROUND = 1
			zeraTudo(false, true)
			atualizaPlayer(true)
			ui.addTextArea(ID.msg, "<r><p align='center'>Choose a number</p>", nil, 150, 320, 490, 20, 1, 0x2A77EF, 0.85, true)
			for i=1, 10 do
				ui.addTextArea(i+30, string.format("<p align='center'><font size='28px'><a href='event:num %d'>%d", i, i), nil, 150+((i-1)*50), 350, 40, 40, 1, 0x2A77EF, 0.85, true)
			end
		end
	end
end

tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoScore(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disablePhysicalConsumables(true)
if tfm.get.room.isTribeHouse == false then tfm.exec.setRoomMaxPlayers(35) end
checkVariables()
carregaMapa()
ui.setMapName(BAR_TEXT)
atualizaCat(true)
