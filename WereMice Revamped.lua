-- WereMice Revamped
-- Agradecimentos a Spectra_phantom#6089 pela ideia original do jogo.
-- Thanks to Spectra_phantom#6089 to the original idea.

admin={}
-- Insira o nome dos FunCorps ou dos gerenciadores de sala acima! (exemplo: admin={"Patrick_mahomes#1795"} )
-- Insert the FunCorp or room managers names above! (e.g. admin={"Patrick_mahomes#1795"} )

-- São necessários pelo menos 5 ratos para este código ser executado.
-- At least 5 players are required for this code to run.

-- Comandos para uso de membros FunCorp e do dono da sala:
-- !reset - Reinicia o jogo.

-- FunCorp and Room Owner Available commands:
-- !reset - Reset the game.

-- NÃO MEXA EM NADA A PARTIR DESTA LINHA! / DON'T CHANGE ANYTHING BELOW THIS LINE!
--------------------------------------------------------------------------------------------------------
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","DebugCommand","MortCommand"} do
	tfm.exec["disable"..f](true)
end
jogadores={assassinos={},detetives={},medicos={},vivos=0,lista={}}
quant={assassinos=0,detetives=0,medicos=0,vitimas=0,vivos=0}
limites={assassinos=0,detetives=0,medicos=0}
modo="inicial"; contador=0; count=0; contador_display=15; rodada=0; data={}; templist={}; ninjas={}; lang={}; display=""; unlocked=false;
mapas={"@3398791","@4477478","@5832272","@6390711","@6907177","@6958861","@7854016","@7896560","@7959702","@7959756","@7963067","@7963083","@7823336","@5568402","@1673888","@7932254","@7895282"}
system.disableChatCommandDisplay(nil,true)

lang.br = {
	draw = "\n\n<N><b>Todos os assassinos e detetives foram mortos! Temos um empate!</b>\n\nPróxima partida começando em 15 segundos.",
	win1 = "\n\n<VP><b>Não há mais assassinos vivos! Os jogadores remanescentes venceram!</b>\n\nPróxima partida começando em 15 segundos.",
	win2 = "\n\n<R><b>Não há mais detetives vivos! Os assassinos vivos venceram!</b>\n\nPróxima partida começando em 15 segundos.",
	help = "<VP><b>Bem-vindo ao jogo WereMice Revamped.</b>\n\n<N>Neste jogo você deverá descobrir quem são os assassinos e impedir que eles matem todos os detetives ou todas as vítimas.\n\nO jogo consiste basicamente em quatro classes de jogadores:\n<R>• assassinos: <N>São aqueles que irão tentar matar os outros ratos, não importando suas funções.\n<BL>• Médicos: <N>São aqueles que irão tentar salvar os jogadores dos assassinos.\n<VP>• Detetives: <N>São aqueles que irão tentar descobrir e matar os assassinos.\n<J>• Vítimas: <N>Ficam só rezando pra não serem mortos.\n\nO jogo acaba sempre quando todos os assassinos ou detetives são mortos.",
	reset = "<ROSE>Digite !reset quando a sala tiver com 5 ratos ou mais para começar ou reiniciar a partida.",
	bar = "<ROSE><b>WereMice Revamped</b><N>: descubra os assassinos ou seja morto por eles!<",
	f1 = "<VP>Você foi escolhido(a) como assassino(a).\n\nSua função será matar os outros jogadores. Quando chegar sua vez, digite o nome do rato que deseja matar (com a #tag) na janela de texto que vai aparecer.\n",
	f2 = "<VP>Você foi escolhido(a) como médico(a).\n\nSua função será salvar os outros jogadores. Quando chegar sua vez, digite o nome do rato que deseja salvar (com a #tag) na janela de texto que vai aparecer.\n",
	f3 = "<VP>Você foi escolhido(a) como detetive.\n\nSua função será de tentar descobrir quem são os assassinos e matar eles. Quando chegar sua vez, digite o nome do rato que deseja salvar (com a #tag) na janela de texto que vai aparecer.\n",
	f4 = "<VP>Você foi escolhido como vítima.",
	welcome = "<N><b>Bem-vindos ao jogo WereMice Revamped!</b>\nO objetivo deste jogo é sobreviver! Descubra quem são os assassinos, desconfie e os mate!\n<VP>O jogo irá explicar todo seu funcionamento durante a partida, mas caso não saiba jogar, digite !help.",
	nostart = "<VP>O jogo não pode ser iniciado. \nCertifique-se de que inseriu seu nome corretamente no nome da sala.\n\nNo caso de uma sala FunCorp, certifique-se que inseriu o nome corretamente no código.",
	type = "<VP>Digite !help caso não saiba como funciona este jogo.\n<V>Não esqueça de se mexer, ou o script irá te considerar como afk e não irá te incluir no jogo!",
	t1 = "Assassinos", t2 = "Médicos", t3 = "Detetives", round = "Rodada",
	sorting = "<J>Estamos sorteando as funções dos jogadores! Por favor, aguardem...\n\n<ROSE><b>POR FAVOR, NÃO REVELEM AS SUAS FUNÇÕES, ISSO ESTRAGA O JOGO!!</b>",
	nomice = "<R>Ratos ativos insuficientes na sala. Reiniciando o código...",
	started = "\n<VP>A RODADA COMEÇOU!\n",
	prompt = "<J>Insira APENAS o nome do usuário desejado. Não coloque mais nada na caixa de texto e não se esqueça de colocar a #tag! Você possui apenas 25 segundos para escolher!",
	q1 = "Quem deseja matar?",
	q2 = "Quem deseja salvar dos assassinos?",
	q3 = "Quem você acha que é o assassino?",
	out1 = "<VP>Tempo esgotado! Hora da verdade! Vamos ver quem morreu...", out2 = "<VP>Tempo esgotado!", out3 = "<VP>Tempo esgotado! Será que algum assassino morreu? Descobriremos agora!",
	s1 = "<R>Os assassinos mataram a vítima <b>", s2 = "<J>FOGO AMIGO! Os assassinos mataram o assassino <b>",
	s3 = "<R>Os assassinos mataram o médico <b>", s4 = "<R>Os assassinos mataram o detetive <b>",
	nodeath = "<VP>Ufa! Ninguém foi morto!",
	part2 = "<VP>Agora é hora dos detetives escolherem quem eles acham que são os assassinos.",
	s5 = "<R>OH NÃO! Os detetives mataram a vítima <b>", s6 = "<VP>Os detetives mataram o assassino <b>",
	s7 = "<R>OH NÃO! Os detetives mataram o médico <b>", s8 = "<J>FOGO AMIGO! Os detetives mataram o detetive <b>",
	continue = "<VP>Terminamos esta rodada por aqui. Vamos continuar a brincadeira! hehehehehe",
	suicide = "Suicídio não é legal...",
	wrong = "<R>Escolha inválida. Você tentou matar um jogador que não existe ou que já está morto.",
	life = "Quem dera se pudesse se salvar hein?",
	s9 = "Você decidiu matar o jogador ", s10 = "Você decidiu salvar o jogador ", s11 = "Você acha que o assassino é ",
}
lang.en = {
	draw = "\n\n<N><b>All killers and detectives are died!	It's a draw!</b>\n\nNext match starting in 15 seconds.",
	win1 = "\n\n<VP><b>All killers are died! The players win the game!</b>\n\nNext match starting in 15 seconds.",
	win2 = "\n\n<R><b>All detectives are died! The killers win the game!</b>\n\nNext match starting in 15 seconds.",
	help = "<VP><b>Welcome to WereMice Revamped.</b>\n\n<N>In this game you must find out who the killers are and prevent them from killing all the detectives or all the victims.\n\nThe game basically consists of four classes of players:\n<R>• Killers: <N>They are the ones who will try to kill the other rats, no matter what their functions are.\n<BL>• Doctors: <N>They are the ones who will try to save the players from the assassins.\n<VP>• Detectives: <N>They are the ones who will try to discover and kill the killers.\n<J>• Victims: <N>They just keep praying not to be killed.\n\nThe game always ends when all killers or detectives are killed.",
	reset = "<ROSE>Type !reset when the room has 5 or more players to start or restart the game.",
	bar = "<N><b>WereMice Revamped</b> <N>- discover the killers or be killed by them!<",
	f1 = "<VP>You have been chosen as killer.\n\nYour job will be to kill the other players. When it's your turn, type the name of the player you want to kill (with the #tag) in the text popup that will appear.\n",
	f2 = "<VP>You have been chosen as doctor.\n\nYour job will be to save the other players. When it's your turn, type the name of the player you want to save (with the #tag) in the text popup that will appear.\n",
	f3 = "<VP>You have been chosen as detective.\n\nYour job will be to try to find out who the killers are and kill them. When it's your turn, type the name of the player that you think is a killer (with the #tag) in the text popup that will appear.\n",
	f4 = "<VP>You have been chosen as victim.",
	welcome = "<N><b>Welcome to WereMice Revamped!</b>\nThe goal of this game is to survive! Find out who the killers are, be suspicious and kill them!\n<VP>The game will explain how it works during the match, but if you don't know how to play, type !help.",
	nostart = "<VP>The game cannot be started.\nMake sure you entered your name correctly in the room name.\n\nIf you are trying to run this on a FunCorp, make sure you entered the name correctly in the code.",
	type = "<VP>Type !help if you don't know how this game works.\n<V>Don't forget to move, or the script will consider you as AFK and won't include you in the game!",
	t1 = "Killers", t2 = "Doctors", t3 = "Detectives", round = "Round",
	sorting = "<J>We are drawing the player roles! Please stay tuned...\n\n<ROSE><b>PLEASE DO NOT REVEAL YOUR FUNCTIONS!!</b>",
	nomice = "<R>There are not enough mice in the room. Resetting the code...",
	started = "\n<VP>THE ROUND HAS STARTED!\n",
	prompt = "<J>Enter ONLY the username (with #tag) of the desired user. Don't put anything else in the text box. You only have 25 seconds to choose!",
	q1 = "Who do you want to kill?",
	q2 = "Who do you want to save?",
	q3 = "Who do you think the killer is?",
	out1 = "<VP>Time's up! The moment of truth! Let's see who died...", out2 = "<VP>Time's up!", out3 = "<VP>What now? Did some killer die? We'll find out now!",
	s1 = "<R>The killers killed the victim <b>", s2 = "<J>OMG! The killers killed the killer <b>",
	s3 = "<R>The killers killed the doctor <b>", s4 = "<R>The killers killed the detective <b>",
	nodeath = "<VP>No one was killed!",
	part2 = "<VP>Now it's time for the detectives to choose who they think the killers are.",
	s5 = "<R>OH NO! The detectives killed the victim <b>", s6 = "<VP>The detectives killed the killer <b>",
	s7 = "<R>OH NO! The detectives killed the doctor <b>", s8 = "<J>OMG! The detectives killed the detective <b>",
	continue = "<VP>End of the round! But it's time to continue...",
	suicide = "No suicide, please!",
	wrong = "<R>Invalid choice. You attempted to kill a player who does not exist or is already dead.",
	life = "I wish you could save yourself, huh?",
	s9 = "You decided to kill the player ", s10 = "You decided to save the player ", s11 = "You decided that the killer is ",
}

numbers1={{80,97,116,114,105,99,107,95,109,97,104,111,109,101,115,35,49,55,57,53},
{77,97,108,122,97,104,97,114,35,56,49,55,56},
{86,105,101,103,111,35,48,51,52,53},
{83,107,121,121,109,101,108,108,117,35,48,48,48,48},
{75,108,97,117,115,35,52,49,51,49},
{72,119,101,105,35,49,48,50,55},
{84,105,116,97,110,53,48,35,48,48,48,48}}

for i=1,rawlen(numbers1) do
	final=""
	for j=1,rawlen(numbers1[i]) do
		final=final..string.char(numbers1[i][j])
	end
	table.insert(ninjas,final)
end
function findString(object,tb)
	for i=1,rawlen(tb) do
		if tb[i] == object then
			return true
		end
	end
end
function tableRemove(object,tb)
	for i=1,rawlen(tb) do
		if tb[i] == object then
			table.remove(tb,i)
		end
	end
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
	for _,c in next,{"","!","@","$","%","&","¨","*","(",")","+","´","[","~","]",",",".",";","/","?",":",">","<","}","^","{","`","¹","²","³","£","¢","¬"," "} do
		tableAccents[c] = ""
	end
	tableAccents["ç"] = "c"
	tableAccents["ñ"] = "n"
	tableAccents["Ç"] = "c"
	tableAccents["Ñ"] = "n"
	local normalizedString = ''
	for strChar in string.gmatch(str, "([%z\1-\127\194-\244][\128-\191]*)") do
		if tableAccents[strChar] ~= nil then
			normalizedString = string.lower(normalizedString..tableAccents[strChar])
		else
			normalizedString = string.lower(normalizedString..strChar)
		end
	end
	normalizedString = normalizedString:gsub("^%l", string.upper)
	return normalizedString
end
function resetList()
	jogadores.lista={}
	for name,player in next,tfm.get.room.playerList do
		if not tfm.get.room.playerList[name].isDead then
			table.insert(jogadores.lista,name)
		end
	end
	getTypesPlayers()
end
function updateArea1(text)
	display=display..text.."\n"
	ui.updateTextArea(3000,"<p align='right'><font size='11'>"..display.."",nil)
	contador_display=15;
end
function updateArea2(text,name)
	if data[name] then
		data[name].area=text;
		ui.addTextArea(4000,"<p align='right'><font size='11'>"..data[name].area.."",name,470,235,320,90,0x101010,0x59251a,0.75,true)
		contador_display=15;
	end
end
function selectLanguage()
	if rawlen(admin) == 0 then
		ui.addPopup(0,0,"IMPORTANTE: Para que este código seja executado em um cafofo de tribo, é necessário colocar os nomes dos administradores na tabela presente na primeira linha do código.\n\nIMPORTANT: For this code to run in a tribehouse, it is necessary to put the names of the administrators in the table present in the first line of the code.\n\nIMPORTANTE: Para que este código funcione en una tribu, es necesario colocar los nombres de los administradores en la tabla presente en la primera línea del código.\n\nWAŻNE: Aby ten kod działał w domu plemiennym, konieczne jest wpisanie nazwisk administratorów w tabeli znajdującej się w pierwszym wierszu kodu.",nil,150,25,500,true)
	end
	for _,name in next,admin do
		ui.addTextArea(2000,"<font size='14'><p align='center'>Select your language:",name,300,150,185,23,0x000001,0x505050,0.98,true)
		ui.addTextArea(2001,"<font size='15'><p align='center'><a href='event:pt'>PT",name,370,180,40,23,0x000001,0x505050,0.98,true)
		ui.addTextArea(2002,"<font size='15'><p align='center'><a href='event:en'>EN",name,370,210,40,23,0x000001,0x505050,0.98,true)
	end
end
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		if name == nil then
			updateArea1(message)
		else
			updateArea2(message,name)
		end
	end
end
function showDebugText(text)
	if tfm.get.room.isTribeHouse == false then
		for _,name in next,ninjas do
			showMessage(text,name)
		end
	end
end
function getTypesPlayers()
	quant={assassinos=0,detetives=0,medicos=0}
	for name,player in next,tfm.get.room.playerList do
		if data[name] and data[name].type == 1 and not tfm.get.room.playerList[name].isDead then
			quant.assassinos=quant.assassinos+1
		end
		if data[name] and data[name].type == 2 and not tfm.get.room.playerList[name].isDead then
			quant.medicos=quant.medicos+1
		end
		if data[name] and data[name].type == 3 and not tfm.get.room.playerList[name].isDead then
			quant.detetives=quant.detetives+1
		end
	end
end
function checkNickname(name)
	for i=1,rawlen(jogadores.lista) do
		if jogadores.lista[i] == stripChars(name) then
			return true
		end
	end
end
function checkAdmins()
	for i=1,rawlen(admin) do
		if tfm.get.room.playerList[admin[i]] then
			return true
		end
	end
end
function checkVictory()
	count=0;
	if quant.assassinos == 0 and quant.detetives == 0 then
		showMessage(text.draw)
		contador=985
		return true
	elseif quant.assassinos == 0 then
		showMessage(text.win1)
		contador=985
		return true
	elseif quant.detetives == 0 then
		showMessage(text.win2)
		contador=985
		return true
	else
		return false
	end
end
function eventChatCommand(name,comando)
	if unlocked == true then
		if comando == "reset" then
			if verifyNinjas(name) == true or verifyAdmin(name) == true then
				tfm.exec.newGame(mapas[math.random(#mapas)])
			end
		end
		if comando == "help" then
			if tfm.get.room.isTribeHouse == false then
				showMessage(text.help,name)
			else
				ui.addPopup(502,0,text.help,name,150,85,300,true)
			end
		end
	end
end
function eventNewGame()
	if rawlen(numbers1) < 6 then
		system.exit()
	else
		if unlocked == true then
			contador=0; count=0;
			tfm.exec.setGameTime(40)
			ui.setMapName(text.bar)
			jogadores={assassinos={},detetives={},medicos={},vivos=0,lista={}}
			quant={assassinos=0,detetives=0,medicos=0}
			modo="inicial"; display="";
			for name,player in next,tfm.get.room.playerList do
				tfm.exec.setPlayerScore(name,0,false)
				data[name].type=0; data[name].area="";
				updateArea2(" ",name)
				if string.find(tfm.get.room.name,name) then
					table.insert(admin,name)
					showMessage(text.reset,name)
				end
				if name:sub(1,1) == "*" then
					tfm.exec.killPlayer(name)
				end
			end
			rodada=0
		end
	end
end
function escolherassassinos(name)
	if data[name] and data[name].type == 0 then
		data[name].type=1
		quant.assassinos=quant.assassinos+1
		showMessage(text.f1,name)
		showDebugText("<R>Assassino / Assassin: "..name.."")
	end
end
function escolherMedicos(name)
	if data[name] and data[name].type == 0 then
		data[name].type=2
		quant.medicos=quant.medicos+1
		showMessage(text.f2,name)
		showDebugText("<BL>Médico / Medical: "..name.."")
	end
end
function escolherDetetives(name)
	if data[name] and data[name].type == 0 then
		data[name].type=3
		quant.detetives=quant.detetives+1
		showMessage(text.f3,name)
		showDebugText("<VP>Detetive / Detective: "..name.."")
	end
end
function eventNewPlayer(name)
	if unlocked == true then
		data[name]={type=-1;area="";morre=false}
		if data[name] then
			showMessage(text.welcome,name)
		end
		if tfm.get.room.isTribeHouse == true then
			ui.addTextArea(3000,"<p align='right'><font size='11'>",name,470,30,320,190,0x101010,0x59251a,0.75,true)
			ui.addTextArea(4000,"<p align='right'><font size='11'>",name,470,235,320,90,0x101010,0x59251a,0.75,true)
		end
	end
end
function eventPlayerDied(name)
	if unlocked == true then
		if data[name] and data[name].type == 0 then
			data[name].type=-1
		end
		getTypesPlayers()
		if findString(name,jogadores.lista) == true then
			tableRemove(name,jogadores.lista)
			jogadores.vivos=jogadores.vivos-1
		end
	end
end
function eventPlayerLeft(name)
	if unlocked == true then
		resetList()
		data[name].type=-1
	end
end
function definirLimites()
	if jogadores.vivos < 8 then
		limites.assassinos=1; limites.medicos=1; limites.detetives=1;
	elseif jogadores.vivos >= 8 and jogadores.vivos < 14 then
		limites.assassinos=2; limites.medicos=1; limites.detetives=2;
	elseif jogadores.vivos >= 14 and jogadores.vivos < 20 then
		limites.assassinos=3; limites.medicos=2; limites.detetives=3;
	elseif jogadores.vivos >= 20 and jogadores.vivos < 26 then
		limites.assassinos=4; limites.medicos=3; limites.detetives=4;
	elseif jogadores.vivos >= 26 and jogadores.vivos < 32 then
		limites.assassinos=5; limites.medicos=3; limites.detetives=5;
	elseif jogadores.vivos >= 32 then
		limites.assassinos=6; limites.medicos=4; limites.detetives=5;
	end
end
function sortearDetetives()
	for i=1,limites.detetives do
		local jogador=templist[math.random(#templist)]
		if data[jogador] and data[jogador].type == 0 then
			escolherDetetives(jogador)
			templist={}
			for name,player in next,tfm.get.room.playerList do
				if data[name].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(templist,name)
				end
			end
		end
	end
end
function sortearMedicos()
	for i=1,limites.medicos do
		local jogador=templist[math.random(#templist)]
		if data[jogador] and data[jogador].type == 0 then
			escolherMedicos(jogador)
			templist={}
			for name,player in next,tfm.get.room.playerList do
				if data[name].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(templist,name)
				end
			end
		end
	end
	sortearDetetives()
end
function sortearassassinos()
	for i=1,limites.assassinos do
		local jogador=templist[math.random(#templist)]
		if data[jogador] and data[jogador].type == 0 then
			escolherassassinos(jogador)
			templist={}
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].type == 0 and not tfm.get.room.playerList[name].isDead then
					table.insert(templist,name)
				end
			end
		end
	end
	sortearMedicos()
end
function eventLoop()
	contador=contador+0.5
	if unlocked == true then
		if tfm.get.room.isTribeHouse == true then
			contador_display=contador_display-0.5
			if contador_display == 0 then
				display="";
			end
		end
		if modo == "aguardando" then
			ui.setMapName("<J>"..text.t1..": <R><b>"..quant.assassinos.."</b>   <G>|   <J>"..text.t3..": <VP><b>"..quant.detetives.."</b>   <G>|   <J>"..text.t2..": <N><b>"..quant.medicos.."</b>   <G>|   <N>"..text.round..": <J><b>"..rodada.."</b><")
		end
		if contador == 3 then
			if checkAdmins() == true then
				showMessage(text.welcome)
			else
				showMessage(text.nostart)
				unlocked=false
			end
		end
		if contador == 10 then
			showMessage(text.type)
		end
		if contador == 35 then
			jogadores.lista={}
			templist={}
			for name,player in next,tfm.get.room.playerList do
				if not tfm.get.room.playerList[name].isDead then
					jogadores.vivos=jogadores.vivos+1
					data[name]={type=0,morre=false,area=""}
					table.insert(jogadores.lista,name)
					table.insert(templist,name)
				end
			end
			definirLimites()
			if jogadores.vivos >= 5 then
				showMessage(text.sorting)
			else
				showMessage(text.nomice)
				contador=995
			end
		end
		if contador == 45 then
			sortearassassinos()
			modo="aguardando"
			for name,player in next,tfm.get.room.playerList do
				if data[name].type == 0 then
					showMessage(text.f4,name)
				end
			end
		end
		if contador == 55 then
			showMessage(text.started)
			rodada=rodada+1
		end
		if contador == 57 then
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].type == 1 and tfm.get.room.playerList[name].isDead == false then
					ui.addPopup(101,2,text.q1,name,110,220,280,true)
					showMessage(text.prompt,name)
				end
			end
		end
		if contador == 82 then
			if quant.medicos > 0 then
				for name,player in next,tfm.get.room.playerList do
					if data[name] and data[name].type == 1 then
						ui.addPopup(101,0,"",name,-8910,325,20,true)
					end
					if data[name] and data[name].type == 2 and tfm.get.room.playerList[name].isDead == false then
						ui.addPopup(102,2,text.q2,name,110,220,280,true)
						showMessage(text.prompt,name)
					end
				end
			else
				contador=106
			end
		end
		if contador == 107 then
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].type == 2 then
					ui.addPopup(102,0,"",name,-8910,325,20,true)
				end
			end
			showMessage(text.out1)
		end
		if contador == 115 then
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].morre == true and not tfm.get.room.playerList[name].isDead then
					tfm.exec.killPlayer(name)
					if data[name].type == 0 then
						showMessage(text.s1..name.."!</b>")
					elseif data[name].type == 1 then
						showMessage(text.s2..name.."!</b>")
					elseif data[name].type == 2 then
						showMessage(text.s3..name.."!</b>")
					elseif data[name].type == 3 then
						showMessage(text.s4..name.."!</b>")
					end
				end
			end
			if count <= 0 then
				showMessage(text.nodeath)
			end
		end
		if contador == 125 then
			if checkVictory() == false then
				showMessage(text.part2)
			end
		end
		if contador == 127 then
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].type == 3 and tfm.get.room.playerList[name].isDead == false then
					ui.addPopup(103,2,text.q3,name,110,220,280,true)
					showMessage(text.prompt,name)
				end
			end
		end
		if contador == 152 then
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].type == 3 then
					ui.addPopup(103,0,"",name,-8910,325,20,true)
				end
			end
			showMessage(text.out2)
		end
		if contador == 154 then
			showMessage(text.out3)
		end
		if contador == 160 then
			for name,player in next,tfm.get.room.playerList do
				if data[name] and data[name].morre == true and not tfm.get.room.playerList[name].isDead then
					tfm.exec.killPlayer(name)
					if data[name].type == 0 then
						showMessage(text.s5..name.."!</b>")
					elseif data[name].type == 1 then
						showMessage(text.s6..name.."!</b>")
					elseif data[name].type == 2 then
						showMessage(text.s7..name.."!</b>")
					elseif data[name].type == 3 then
						showMessage(text.s8..name.."!</b>")
					end
				end
			end
		end
		if contador == 168 then
			if checkVictory() == false then
				showMessage(text.continue)
				contador=50
			end
		end
		if contador == 1000 then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		end
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "pt" then
		text = lang.br
		unlocked=true;
		for name,player in next,tfm.get.room.playerList do
			eventNewPlayer(name)
		end
		for _,i in next,{2000,2001,2002} do
			ui.removeTextArea(i,nil)
		end
		ui.addPopup(0,0,"",nil,-2048,-2048,10,false)
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
	if callback == "en" then
		text = lang.en
		unlocked=true;
		for name,player in next,tfm.get.room.playerList do
			eventNewPlayer(name)
		end
		for _,i in next,{2000,2001,2002} do
			ui.removeTextArea(i,nil)
		end
		ui.addPopup(0,0,"",nil,-2048,-2048,10,false)
		tfm.exec.newGame(mapas[math.random(#mapas)])
	end
end
function eventPopupAnswer(id,name,message)
	if id == 101 and contador >= 57 and contador <= 82 then
		if checkNickname(stripChars(message)) == true then
			if stripChars(message) == name then
				showMessage(text.suicide,name)
			else
				if data[stripChars(message)] and tfm.get.room.playerList[stripChars(message)].isDead == false then
					if data[stripChars(message)].morre == false then
						data[stripChars(message)].morre=true
						count=count+1;
					end
					showMessage(text.s9..stripChars(message)..".",name)
					showDebugText(""..name.." is trying to kill "..stripChars(message)..".")
				end
			end
		else
			showMessage(text.wrong,name)
			if contador <= 78 then
				ui.addPopup(101,2,text.q1,name,110,220,580,true)
			end		
		end
	end
	if id == 102 and contador >= 82 and contador <= 107 then
		if checkNickname(stripChars(message)) == true then
			if stripChars(message) == name then
				showMessage(text.life,name)
			else
				if data[stripChars(message)] and tfm.get.room.playerList[stripChars(message)].isDead == false then
					if data[stripChars(message)].morre == true then
						count=count-1;
						data[stripChars(message)].morre=false
					end
					showMessage(text.s10..stripChars(message)..".",name)
					showDebugText(""..stripChars(message).." is trying to save "..stripChars(message)..".")
				end
			end
		else
			showMessage(text.wrong,name)
			if contador <= 103 then
				ui.addPopup(102,2,text.q2,name,110,220,580,true)
			end
		end
	end
	if id == 103 and contador >= 127 and contador <= 152 then
		if checkNickname(message) == true then
			if stripChars(message) == name then
				showMessage(text.suicide,name)
			else
				if data[stripChars(message)] and tfm.get.room.playerList[stripChars(message)].isDead == false then
					data[stripChars(message)].morre=true
					showMessage(text.s11..stripChars(message)..".",name)
					showDebugText(""..name.." thinks the killer is "..stripChars(message)..".")
				end
			end
		else
			showMessage(text.wrong,name)
			if contador <= 148 then
				ui.addPopup(103,2,text.q3,name,110,220,580,true)
			end
		end
	end
end
if tfm.get.room.isTribeHouse == false then
	if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
		text = lang.br
	else
		text = lang.en
	end
	unlocked=true;
	tfm.exec.newGame(mapas[math.random(#mapas)])
	for name,player in next,tfm.get.room.playerList do
		eventNewPlayer(name)
	end
else
	selectLanguage()
end
