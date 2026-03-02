-- FunCorp, este script é usado para que os ratos possam votar em até 6 scripts diferentes.
-- Substitua na linha 7 do código na variável 'admin' o meu nome pelo seu nickname com a #tag. Ao rodar o código, digite !start, digite os nomes dos scripts e aguarde a votação.
-- Caso você queira, antes de rodar o código, substitua na linha 8 do código a variável 'tempo', para definir a quantidade de tempo para votar.
-- Se por algum motivo você precise reiniciar a votação, digite !reset para reiniciar tudo. Neste caso, volte a definir os scripts novamente.
-- As instruções também serão exibidas no chat quando o código for iniciado. NÃO SE ESQUEÇA DE COLOCAR SEU NOME ABAIXO!

admin="" -- INSIRA SEU NOME AQUI!
tempo=60
scripts={name1="",name2="",name3="",name4="",name5="",name6="",count1=0,count2=0,count3=0,count4=0,count5=0,count6=0}
for _,f in next,{"AutoShaman","AutoScore","AutoNewGame","AutoTimeLeft","PhysicalConsumables","AfkDeath"} do
	tfm.exec["disable"..f]()
end
for i=1,6 do
	system.disableChatCommandDisplay(tostring(i))
end
for _,c in next,{"start","reset"} do
	system.disableChatCommandDisplay(c)
end
script=0; p_id=100;
iniciado=false
data={}
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	elseif tfm.get.room.isTribeHouse == true then
		ui.addPopup(p_id,0,message,name,250,60,350,true)
		p_id=p_id+1
	end
end
function eventNewPlayer(name)
	newData={
		["script"]=0
	}
	data[name]=newData;
	tfm.exec.respawnPlayer(name)
	tfm.exec.movePlayer(name,math.random(450,1150),185)
	if iniciado == true then
		if script == 2 then
			showMessage("<br><br><br><br><br><br><br><br><ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1.."</b><br>ou digite !2 para votar no script <b>"..scripts.name2.."</b>.<br><br>A votação só pode ocorrer uma vez por rato, e sua escolha pode não ser alterada.",name)
		elseif script == 3 then
			showMessage("<br><br><br><br><br><br><br><br><ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1..",</b><br>!2 para votar no script <b>"..scripts.name2.."</b><br>ou !3 para votar no script <b>"..scripts.name3.."</b>.<br><br>A votação só pode ocorrer uma vez por rato, e sua escolha pode não ser alterada.",name)
		elseif script == 4 then
			showMessage("<br><br><br><br><br><br><br><br><ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1..",</b><br>!2 para votar no script <b>"..scripts.name2.."</b>,<br>!3 para votar no script <b>"..scripts.name3..",</b><br>ou !4 para votar no script <b>"..scripts.name4.."</b>.<br><br>A votação só pode ocorrer uma vez por rato, e sua escolha pode não ser alterada.",name)
		elseif script == 5 then
			showMessage("<br><br><br><br><br><br><br><br><ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1..",</b><br>!2 para votar no script <b>"..scripts.name2.."</b>,<br>!3 para votar no script <b>"..scripts.name3..",</b><br>!4 para votar no script <b>"..scripts.name4.."</b>,<br>ou !5 para votar no script <b>"..scripts.name5.."</b>.<br><br>A votação só pode ocorrer uma vez por rato, e sua escolha pode não ser alterada.",name)
		elseif script == 6 then
			showMessage("<br><br><br><br><br><br><br><br><ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1..",</b><br>!2 para votar no script <b>"..scripts.name2.."</b>,<br>!3 para votar no script <b>"..scripts.name3..",</b><br>!4 para votar no script <b>"..scripts.name4.."</b>,<br>!5 para votar no script <b>"..scripts.name5.."</b><br>!6 para votar no script <b>"..scripts.name6.."</b>.<br><br>A votação só pode ocorrer uma vez por rato, e sua escolha pode não ser alterada.",name)
		end
	end
end
for name,player in pairs(tfm.get.room.playerList) do
	eventNewPlayer(name)
end
function eventPlayerDied(name)
	tfm.exec.respawnPlayer(name)
	tfm.exec.movePlayer(name,math.random(450,1150),185)
end
function eventNewGame()
	iniciado=false; p_id=100;
	ui.setMapName("<N>Votação de Modules <VP>v2.5")
	scripts={name1="",name2="",name3="",name4="",name5="",name6="",count1=0,count2=0,count3=0,count4=0,count5=0,count6=0}
	showMessage("FunCorp, este script é usado para que os ratos possam votar em até 6 scripts diferentes.<br><br>Digite !start, escolha os scripts e aguarde a votação.<br>Se por algum motivo você precise reiniciar a votação, digite !reset. Neste caso, volte a definir os scripts novamente. Para alterar o tempo de votação, siga as instruções no começo do código.",admin)
	for name,player in pairs(tfm.get.room.playerList) do
		data[name].script=0
	end	
	tfm.exec.setGameTime(720000)
end
function eventChatCommand(name,command)
	if name == admin and command == "start" then
		ui.addPopup(1,2,"Digite o script nº1:",admin,350,175,200,true)
	end
	if name == admin and command == "reset" then
		tfm.exec.newGame("@5113656")
	end
	if command == "1" then
		if iniciado == true then
			if data[name].script == 0 then
				data[name].script=1
				showMessage("<VP>Você votou no script "..scripts.name1..".",name)
				scripts.count1=scripts.count1+1
			else
				showMessage("<R>Você já votou em um script e não pode mais alterar.",name)
			end
		else
			showMessage("não permitido",name)
		end
	end
	if command == "2" then
		if iniciado == true then
			if data[name].script == 0 then
				data[name].script=2
				showMessage("<VP>Você votou no script "..scripts.name2..".",name)
				scripts.count2=scripts.count2+1
			else
				showMessage("<R>Você já votou em um script e não pode mais alterar.",name)
			end
		else
			showMessage("não permitido",name)
		end
	end
	if command == "3" then
		if iniciado == true and script >= 3 then
			if data[name].script == 0 then
				data[name].script=2
				showMessage("<VP>Você votou no script "..scripts.name3..".",name)
				scripts.count3=scripts.count3+1
			else
				showMessage("<R>Você já votou em um script e não pode mais alterar.",name)
			end
		else
			showMessage("não permitido",name)
		end
	end
	if command == "4" then
		if iniciado == true and script >= 4 then
			if data[name].script == 0 then
				data[name].script=4
				showMessage("<VP>Você votou no script "..scripts.name4..".",name)
				scripts.count4=scripts.count4+1
			else
				showMessage("<R>Você já votou em um script e não pode mais alterar.",name)
			end
		else
			showMessage("não permitido",name)
		end
	end
	if command == "5" then
		if iniciado == true and script >= 5 then
			if data[name].script == 0 then
				data[name].script=5
				showMessage("<VP>Você votou no script "..scripts.name5..".",name)
				scripts.count5=scripts.count5+1
			else
				showMessage("<R>Você já votou em um script e não pode mais alterar.",name)
			end
		else
			showMessage("não permitido",name)
		end
	end
	if command == "6" then
		if iniciado == true and script >= 6 then
			if data[name].script == 0 then
				data[name].script=6
				showMessage("<VP>Você votou no script "..scripts.name6..".",name)
				scripts.count6=scripts.count6+1
			else
				showMessage("<R>Você já votou em um script e não pode mais alterar.",name)
			end
		else
			showMessage("não permitido",name)
		end
	end
end
function eventLoop(passou, faltando)
	if faltando <= 100 and iniciado == true then
		iniciado=false
		showMessage("<br><br><br><br><br><br><br><br><br><br><VP>Estes são os resultados da votação!<br>")
		if script >= 2 then
			showMessage("<N>"..scripts.name1.." - <b>"..scripts.count1.." votos</b>.")
			showMessage("<N>"..scripts.name2.." - <b>"..scripts.count2.." votos</b>.")
		end
		if script >= 3 then
			showMessage("<N>"..scripts.name3.." - <b>"..scripts.count3.." votos</b>.")
		end
		if script >= 4 then
			showMessage("<N>"..scripts.name4.." - <b>"..scripts.count4.." votos</b>.")
		end
		if script >= 5 then
			showMessage("<N>"..scripts.name5.." - <b>"..scripts.count5.." votos</b>.")
		end
		if script >= 6 then
			showMessage("<N>"..scripts.name6.." - <b>"..scripts.count6.." votos</b>.")
		end
	end
end
function iniciarVotacao()
	iniciado=true
	tfm.exec.setGameTime(tempo)
	if script == 2 then
		showMessage("<br><br><br><br><br><br><br><br><ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1.."</b><br>ou digite !2 para votar no script <b>"..scripts.name2.."</b>.<br><br>A votação só pode ocorrer uma vez por rato, e sua escolha pode não ser alterada.")
	elseif script == 3 then
		showMessage("<br><br><br><br><br><br><br><br><ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1..",</b><br>!2 para votar no script <b>"..scripts.name2.."</b><br>ou !3 para votar no script <b>"..scripts.name3.."</b>.<br><br>A votação só pode ocorrer uma vez por rato, e sua escolha pode não ser alterada.")
	elseif script == 4 then
		showMessage("<br><br><br><br><br><br><br><br><ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1..",</b><br>!2 para votar no script <b>"..scripts.name2.."</b>,<br>!3 para votar no script <b>"..scripts.name3..",</b><br>ou !4 para votar no script <b>"..scripts.name4.."</b>.<br><br>A votação só pode ocorrer uma vez por rato, e sua escolha pode não ser alterada.")
	elseif script == 5 then
		showMessage("<br><br><br><br><br><br><br><br><ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1..",</b><br>!2 para votar no script <b>"..scripts.name2.."</b>,<br>!3 para votar no script <b>"..scripts.name3..",</b><br>!4 para votar no script <b>"..scripts.name4.."</b>,<br>ou !5 para votar no script <b>"..scripts.name5.."</b>.<br><br>A votação só pode ocorrer uma vez por rato, e sua escolha pode não ser alterada.")
	elseif script == 6 then
		showMessage("<br><br><br><br><br><br><br><br><ROSE><b>VOTAÇÃO INICIADA!</b><br><br><N>Digite !1 para votar no script <b>"..scripts.name1..",</b><br>!2 para votar no script <b>"..scripts.name2.."</b>,<br>!3 para votar no script <b>"..scripts.name3..",</b><br>!4 para votar no script <b>"..scripts.name4.."</b>,<br>!5 para votar no script <b>"..scripts.name5.."</b><br>ou !6 para votar no script <b>"..scripts.name6.."</b>.<br><br>A votação só pode ocorrer uma vez por rato, e sua escolha pode não ser alterada.")
	end
end
function eventPopupAnswer(id,name,answer)
	if id == 1 then
		if answer == "" then
			showMessage("<R>Número insuficiente de scripts para iniciar a votação.",admin)
		else
			scripts.name1=answer
			script=1
			showMessage("Script 1 escolhido: "..scripts.name1.."",name)
			ui.addPopup(2,2,"Digite o script nº2:",admin,350,175,200,true)
		end
	end
	if id == 2 then
		if answer == "" then
			showMessage("<R>Número insuficiente de scripts para iniciar a votação.",admin)
		else
			scripts.name2=answer
			script=2
			showMessage("Script 2 escolhido: "..scripts.name2.."",name)
			ui.addPopup(3,2,"Digite o script nº3 (se quiser):",admin,350,175,200,true)
		end
	end
	if id == 3 then
		if answer == "" then
			iniciarVotacao()
		else
			scripts.name3=answer
			script=3
			showMessage("Script 3 escolhido: "..scripts.name3.."",name)
			ui.addPopup(4,2,"Digite o script nº4 (se quiser):",admin,350,175,200,true)
		end
	end
	if id == 4 then
		if answer == "" then
			iniciarVotacao()
		else
			scripts.name4=answer
			script=4
			showMessage("Script 4 escolhido: "..scripts.name4.."",name)
			ui.addPopup(5,2,"Digite o script nº5 (se quiser):",admin,350,175,200,true)
		end
	end
	if id == 5 then
		if answer == "" then
			iniciarVotacao()
		else
			scripts.name5=answer
			script=5
			showMessage("Script 5 escolhido: "..scripts.name5.."",name)
			ui.addPopup(6,2,"Digite o script nº6 (se quiser):",admin,350,175,200,true)
		end
	end
	if id == 6 then
		if not answer == "" then
			scripts.name6=answer
			script=6
			showMessage("Script 6 escolhido: "..scripts.name6.."",name)
		end
		iniciarVotacao()
	end
end
tfm.exec.newGame("@5113656")
