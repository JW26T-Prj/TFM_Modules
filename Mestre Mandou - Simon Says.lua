-- LEIA, IMPORTANTE! / READ, IMPORTANT!

-- Esta é a última atualização do Mestre Mandou sob o comando de Shun_kazami#7014, pois a partir do dia 19 de janeiro de 2026, estarei abandonando o Transformice para focar em novos projetos e tomar novos rumos na minha vida.
-- Caso você tenha o interesse de assumir o comando do module, entre em contato comigo pelo Discord através do seguinte usuário: ventus_ninja_
-- This is the last Simon Says release under the Shun_kazami#7014 command, because starting from January 19th 2026, I will be abandoning Transformice to focus on new projects and take new directions in my life.
-- If you are interested in taking over the command of the module, please contact me under Discord through the following user: ventus_ninja_

-- Mestre Mandou / Simon Says / Simón Dice / Szymon Mówi!
-- Version 7.31 Final-hotfix
-- Managed by Shun_kazami#7014

admin={} -- insira o nome dos FunCorps aqui! / insert the FunCorp names here! / inserte los nombres de los FunCorps aquí! / wpisz tutaj imiona FunCorp!
-- Caso esteja tentando rodar este código no cafofo de tribo, insira seus nomes na tabela acima para que o código possa ser executado.
-- If you are trying to run this code in your tribehouse, enter your names in the table, so the code can be executed.
-- Si estás intentando ejecutar este código en tu casa tribal, ingresa tus nombres en la tabla para que se pueda ejecutar el código.
-- Jeśli próbujesz uruchomić ten kod w swoim dom plemienny, wpisz swoje imiona do tabeli, aby kod mógł zostać wykonany.

testmode=false; -- leia abaixo! / read below! / leer abajo! / przeczytaj poniżej!
-- Altere a variável acima para 'true' somente se quiser ver as mensagens do chat no cafofo da tribo.
-- Change the above variable to 'true' only if you want to see chat messages in the tribehouse.
-- Cambia la variable anterior a 'true' solo si quieres ver mensajes de chat en la casa tribal.
-- Zmień powyższą zmienną na 'true' tylko wtedy, gdy chcesz widzieć wiadomości czatu w dom plemienny.

-- Comandos para uso de membros FunCorp e do dono da sala:
-- !command [número de 1 a 143] - Executa um comando manualmente.
-- !run [@número] - Executa o mapa especificado.
-- !kill [nick#tag] - Mata o jogador especificado.
-- !limit [número] - Altera o limite de jogadores na sala.
-- !pw [texto] - Adiciona uma senha na sala.

-- FunCorp and Room Owner Available commands:
-- !command [1-143] - Run a command manually.
-- !run [@code] - Run the specified map.
-- !kill [player#tag] - Kill the specified player.
-- !limit [number] - Limit the number of maximum players on the room.
-- !pw [password] - Lock the room with a password.

-- Comandos disponibles del propietario de la sala y FunCorps:
-- !command [1-143] - Ejecutar un comando manualmente.
-- !run [@code] - Ejecutar el mapa especificado.
-- !kill [jugador#tag] - Mata al jugador especificado.
-- !limit [número] - Limite el número máximo de jugadores en la sala.
-- !pw [contraseña] - Bloquee la habitación con una contraseña.

-- Właściciel w FunCorp pokoju Dostępne polecenia:
-- !command [1-143] - Uruchom konkretną komendę.
-- !run [@code] - Uruchom konkretną mapę.
-- !kill [player#tag] - Zabij wybranego gracza.
-- !limit [liczba] - Ogranicz maksymalną liczbę graczy w pokoju.
-- !pw [hasło] - Zamknij pokój na hasło.

-- NÃO MEXA EM NADA A PARTIR DESTA LINHA! / DON'T CHANGE ANYTHING BELOW THIS LINE! / NO CAMBIES NADA DEBAJO DE ESTA LÍNEA! / NIE ZMIENIAJ NICZEGO PONIŻEJ TEJ LINII!
--------------------------------------------------------------------------------------------------------
for _,f in next,{"AutoShaman","AutoNewGame","AutoTimeLeft","DebugCommand","PhysicalConsumables"} do
	tfm.exec["disable"..f](true)
end
mapas={"@6788174","@6788154","@6788715","@6788728","@6789271","@6790527","@6791838","@6789356","@6822331","@7290275","@7686598","@7750148","@7688066","@6788183","@6784965","@6402930","@6789235","@6789853","@6790385","@6791944","@6801706","@6792470","@6806109","@6821950","@6866406","@6866437","@6885971","@5328362","@5957905","@7055459","@7214363","@6792516","@6825340","@6788693","@6789272","@6799996","@6803018","@6859175","@6907177","@7404327","@7382263","@6885799","@6790912","@6833993","@7721192","@7309605","@6788861","@6789249","@6790484","@7921432","@6794050","@6830799","@6866549","@6834529","@6876563","@6888512","@6893463","@7431981","@7146925","@6937148","@6356881","@6789280","@6790895","@6799997","@6789324","@6803128","@6900149","@3832586","@1468299","@6791871","@6811934","@6876638","@6892608","@6982387","@2048617","@7404106","@7405103","@7400694","@7400678","@7412412","@7412422","@7755685","@6843950","@6810292","@3110915","@6789263","@7354947","@7201360","@6897042","@6809461","@7242361","@7224471","@6932585","@7863458","@7897912","@7899697","@7910742","@7236120","@2802178","@5549355","@7230453","@7938319","@7904062","@7216097","@7951509","@7368748","@7950420","@7958330","@6777390","@2637755","@2684847","@1445145","@7759938","@7923068","@7949791","@7219676","@7926398","@3999392","@7398849","@6701393","@6313533","@6532621","@7423346","@6997379","@3344330","@6223501","@5166134","@7974225","@7961894"}
active=-2; vivo=0; rato=0; dificuldade=1; rodadas=0; rodada=0; number=""; count=0; xpos=0; xpos2=0; pid=-1; ypos=0; data={}; cmds={}; grounds={}; images={}; lang={}; alives={}; fire_id={}; final=""; tempo=10; counter=0; q=""; a=""; qtime=10; maker=""; sd_vivo=0; lobby_map="@7970278"; unlocked=false;
spiderweb={type = 15,width = 60,height = 60}
cobweb={type = 15,width = 2400,height = 1200,miceCollision = false,groundCollision = false}
acidb={type = 19,width = 10,height = 25,miceCollision = true,groundCollision = false,dynamic = true,fixedRotation = true,mass = 5000}
acid2={type = 19,width = 25,height = 25,miceCollision = true,groundCollision = false,dynamic = true,fixedRotation = true,mass = 5000}
acidg={type = 19,width = 30,height = 30}
lava={type = 3,width = 2400,height = 100,miceCollision = false,groundCollision = false, foreground = true}
gelo={type = 1,width = 2400,height = 140,miceCollision = true,groundCollision = true, foreground = true}
upacid={type = 19,width = 1600,height = 10,miceCollision = true,groundCollision = false, foreground = true}
acids={type = 19,width = 2400,height = 80,miceCollision = true,groundCollision = false}
laser={type = 12,width = 2400,height = 10,miceCollision = false,groundCollision = false, foreground = true, color = 0xff0000}
laserv={type = 12,width = 10,height = 800,miceCollision = false,groundCollision = false, foreground = true, color = 0xff0000}
acids2={type = 19,width = 2400,height = 10,miceCollision = true,groundCollision = false, foreground = true}
acids3={type = 19,width = 10,height = 800,miceCollision = true,groundCollision = false, foreground = true}
system.disableChatCommandDisplay(nil,true)
lang.br = {
	welcome = "<N><b>Bem-vindos ao module Mestre Mandou!</b>\nSiga tudo o que o jogo mandar e teste seus limites até o fim!\n\n<BL>Gerenciado por Shun_kazami#7014\nIdeia original de Jessiewind26#2546\n<R>Versão 7.31 Final-hotfix",
	dancar = "Dance!",
	sentar = "Sente!",
	confetar = "Atire 5 confetes!",
	mouse = "Clique na tela 10 vezes!",
	beijos = "Dê 10 beijos!",
	dormir = "Vocês estão com sono. Durmam para descansar.",
	raiva = "Tigrounette é do mal! Fiquem com raiva dele!",
	chorem = "Vocês não ganharam queijo :( Chorem!",
	nchorem = "Não chorem!",
	esquerda = "Não vá para a esquerda!",
	direita = "Não vá para a direita!",
	digitar = "Digite qualquer coisa e mande para mim.",
	falar = "Não falem nada!",
	pular = "Não pulem!",
	mexer = "Não se mexam!",
	bandeira = "Balance a bandeira de qualquer país!",
	ano = "Em que ano estamos?",
	vesquerda = "Fique virado para a esquerda!",
	vdireita = "Fique virado para a direita!",
	quadradoa = "Fique no quadrado azul!",
	quadradov = "Fique no quadrado vermelho!",
	quadrado = "Fique no quadrado branco!",
	nquadrado = "Não fique no quadrado branco!",
	retangulo = "Fique dentro do retângulo branco!",
	retangulov = "Fique dentro do retângulo vermelho!",
	nretangulo = "Não fique dentro do retângulo branco!",
	nretangulov = "Não fique dentro do retângulo vermelho!",
	preesquerda15 = "Pressione 15 vezes a tecla para ESQUERDA!",
	predireita15 = "Pressione 15 vezes a tecla para DIREITA!",
	preesquerda30 = "Pressione 30 vezes a tecla para ESQUERDA!",
	predireita30 = "Pressione 30 vezes a tecla para DIREITA!",
	preesquerda60 = "Pressione 60 vezes a tecla para ESQUERDA!",
	predireita60 = "Pressione 60 vezes a tecla para DIREITA!",
	preesquerda100 = "Pressione 100 vezes a tecla para ESQUERDA!",
	predireita100 = "Pressione 100 vezes a tecla para DIREITA!",
	espaco = "Pressione a barra de espaço 20 vezes!",
	nome = "Digite o seu nome no jogo (com #número).",
	ndance = "Não dance!",
	key1 = "Não se abaixe!",
	action1 = "Dance, sente e durma!",
	laugh = "Agora RIAM!",
	laugh2 = "Quem rir agora vai morrer.",
	stone = "Olha a pedra!",
	noob = "Digite: EU SOU NOOB",
	action2 = "Chore depois ria!",
	jump = "Pulem!",
	number = "Digite o seguinte número: ",
	key = "Pressione qualquer tecla!",
	jump2 = "Pulem 5 vezes!",
	jump3 = "Pulem 15 vezes!",
	action3 = "Dê um beijo depois chore!",
	area = "Descubra onde está o texto escondido e clique nele!",
	dancing = "É hora da festa!",
	freeze = "Todo mundo parado!",
	transform = "Dance e durma!",
	down1 = "Abaixem 3 vezes!",
	down2 = "Abaixem 10 vezes!",
	mestre = "Mestre Mandou",
	map = "Mapa",
	time = "Tempo",
	mice = "Ratos",
	round = "Rodada",
	help = "Ajuda",
	hcontent = "O objetivo deste module é muito simples:\n<b>Siga tudo o que o jogo mandar e teste seus limites até o fim!</b>\n\nTenha cuidado, pois alguns comandos podem te matar de surpresa, portanto, é preciso ficar muito esperto!",
	mices = "Esta sala requer pelo menos 4 ratos.",
	mices2 = "Esta sala requer pelo menos 2 ratos.",
	difficulty = "Dificuldade",
	segundos = "segundos.",
	fim = "Partida encerrada! Próxima partida iniciando em ",
	dofim = "Ninguém ganhou... Próxima partida iniciando em ",
	abaixar = "Abaixem e se levantem!",
	action = "Façam qualquer ação!",
	naction = "Não façam nenhuma ação!",
	math = "Quanto é 1+1?",
	math1 = "Quanto é 2+2?",
	math2 = "Quanto é 3-4?",
	ds = "Dance e sente!",
	seq4 = "Dance, sente, durma e bata palmas!",
	seq5 = "Dance, bata palmas e ria!",
	seq6 = "Dance e chore!",
	seq7 = "Dance, dê um beijo e fique com raiva!",
	seq8 = "Dê um beijo, durma e chore!",
	seq9 = "Durma, pule e taque um confete!",
	seq10 = "Dê um beijo, solte um confete e dance!",
	seq11 = "Ria, dance, durma, chore e coloque a mão no rosto!",
	seq12 = "Fique com raiva, sente, solte um confete, dance e sente de novo!",
	seq13 = "Dance, sente, durma, ria, chore, dê um beijo e pule!",
	seq14 = "Sente, chore, dê um beijo, dance e se abaixe!",
	seq15 = "Bata palmas, fique com raiva, dance, durma e se abaixe!",
	seq16 = "Chore, solte um confete, durma, chore de novo, dance e solte confete novamente!",
	spider = "Cuidado com as teias de aranha!",
	spider1 = "Essa não! Uma aranha passou no mapa e o encheu de teias!",
	key2 = "Pressione F4!",
	clap = "Bata palmas 5 vezes!",
	completed = "Você completou o comando com sucesso!",
	rain = "Chuva de ovelhas!",
	skull = "Cuidado com as caveiras!",
	gravity = "A gravidade foi alterada!",
	version = "Versão",
	black = "Um buraco negro surgiu e está puxando todos vocês!",
	creator = "Pressione F10!",
	counts = "Há quantos ratos nesta sala?",
	counts_alive = "Há quantos ratos vivos nesta sala?",
	facepalm = "Coloque a mão no rosto 5 vezes!",
	enterprise = "Qual é a empresa que criou o Transformice?",
	collect = "Cuidado com a chuva ácida!",
	balls = "Está chovendo bolas!",
	explosion = "Olha a explosão!",
	queijo = "Todos os ratos que estiverem com queijo vão morrer!",
	caps = "Pressione a tecla CAPS LOCK 10 vezes",
	acid = "Cuidado com o ácido!",
	water = "Saia da água, ou seja engolido por ela!",
	lava = "Saia da lava, ou seja engolido por ela!",
	nowater = "Fique dentro da água!",
	select = "<VP>O modo de comando seletivo está ativo nesta sala.",
	balloon = "Voar, voar, subir, subir...",
	lava1 = "Cuidado! O chão está se transformando em lava!",
	lava2 = "O chão é lava!",
	lava3 = "Cuidado! O chão está se transformando em ácido!",
	lava4 = "Cuidado! O chão está se transformando em gelo!",
	ice = "O chão é gelo!",
	light = "Acabou a luz!",
	ndurma = "Não durma!",
	move = "Se mexam!",
	clickhere = "<font size='8'>CLIQUE AQUI",
	apple = "Está chovendo maçãs!",
	cn = "Está chovendo canhões!",
	people = "Há quantos humanos aqui nesta sala?",
	fall = "ATENÇÃO! O dano de queda está habilitado!",
	collide = "ATENÇÃO! A colisão com os ratos está habilitada!",
	ufo = "Cuidado! Os ratos estão sendo abduzidos!",
	emoji = "Utilize um emoticon!",
	emoji1 = "Utilize os seguintes emoticons em sequência: 1 4 7 5 9 2 8 6",
	emoji2 = "Utilize os seguintes emoticons em sequência: 5 9 6 1 7 3 4 8",
	emoji3 = "Utilize os seguintes emoticons em sequência: 7 2 8 3 6",
	meep = "O MEEP está habilitado!",
	portal = "Tenham cuidado! Entrar no portal te levará para a morte!",
	vampires = "Todos os ratos foram transformados em vampiros!",
	kills = "Se matem!",
	catch = "Pegue o '+1' antes que ele desapareça!",
	raster = "ATENÇÃO! As áreas em vermelho serão tomadas pelo ácido!",
	space = "Os ratos agora estão no espaço!",
	chicken = "Está chovendo galinhas!",
	ccr = "Tá pegando fogo bicho!",
	nocheese = "Sem queijo para você! ^_^",
	submitter = "Quem é o criador deste mapa?",
	verify = "<J>Para que possamos verificar a estabilidade do module e coletar estatísticas, a partir deste momento, todas as informações desta sala estão sendo registradas no banco de dados interno do module.",
	souris = "<R>Jogadores convidados não podem participar deste module. Crie uma conta ou faça login para jogar.",
	avcommands = "Comandos disponíveis:\n!command [número de 1 a 143] - Executa um comando manualmente.\n!run [@número] - Executa o mapa especificado.\n!kill [nick#tag] - Mata o jogador especificado.\n!limit [número] - Altera o limite de jogadores na sala.\n!pw [password] - Adiciona uma senha na sala.",
	cds = "Comandos",
}
lang.en = {
	welcome = "<N><b>Welcome to Simon Says module!</b>\nFollow everything the game told and test your limits until the end!\n\n<BL>Original idea from Jessiewind26#2546, managed by Shun_kazami#7014\n<R>Version 7.31 Final-hotfix",
	dancar = "Dance!",
	sentar = "Sit down!",
	confetar = "Throw 5 confetti!",
	mouse = "Click 10 times on the screen!",
	beijos = "Give 10 kisses!",
	dormir = "You are so much sleepy. Sleep to rest.",
	raiva = "Tigrounette is evil! Be mad at him.",
	chorem = "You didn't get cheese :( Cry!",
	nchorem = "Don't cry!",
	esquerda = "Don't go to the left!",
	direita = "Don't go to the right!",
	digitar = "Type anything and send it to me.",
	falar = "Don't speak!",
	pular = "Don't jump!",
	mexer = "Don't move!",
	bandeira = "Swing any flag of a country!",
	ano = "What year are we in?",
	vesquerda = "Stay turned to the left!",
	vdireita = "Stay turned to the right!",
	quadradoa = "Stay on the blue square!",
	quadradov = "Stay on the red square!",
	quadrado = "Stay on the white square!",
	nquadrado = "Don't stay on the white square!",
	retangulo = "Stay inside of the white rectangle!",
	retangulov = "Stay inside of the red rectangle!",
	nretangulo = "Don't stay inside of the white rectangle!",
	nretangulov = "Don't stay inside of the red rectangle!",
	preesquerda15 = "Press the left key 15 times!",
	predireita15 = "Press the right key 15 times!",
	preesquerda30 = "Press the left key 30 times!",
	predireita30 = "Press the right key 30 times!",
	preesquerda60 = "Press the left key 60 times!",
	predireita60 = "Press the right key 60 times!",
	preesquerda100 = "Press the left key 100 times!",
	predireita100 = "Press the right key 100 times!",
	espaco = "Press the space bar 20 times!",
	nome = "Type your nickname in game (with #number).",
	ndance = "Don't dance!",
	key1 = "Don't turn down!",
	action1 = "Dance, sit and sleep!",
	laugh = "Laugh now!",
	laugh2 = "Who laughs now dies.",
	stone = "Watch out the rocks!",
	noob = "Type: I AM A NOOB",
	action2 = "Cry and then laugh!",
	jump = "Jump!",
	number = "Type the following number: ",
	key = "Press any key!",
	jump2 = "Jump 5 times!",
	jump3 = "Jump 15 times!",
	action3 = "Give a kiss and then cry!",
	area = "Find out where is the hidden text and click on it!",
	dancing = "It's party time!",
	freeze = "Everyone STOP!",
	transform = "Dance and sleep!",
	down1 = "Get down 3 times!",
	down2 = "Get down 10 times!",
	mestre = "Simon Says",
	map = "Map",
	time = "Time",
	mice = "Mice",
	round = "Round",
	help = "Help",
	hcontent = "The objective of this module is very simple:\n<b>Follow everything that the game says and test your limits to the maximum!</b>\n\nTake care, because some commands can surprise you and kill your mice, so, you have to be very smart!",
	mices = "This room request at least 4 mice.",
	mices2 = "This room request at least 2 mice.",
	difficulty = "Difficulty",
	segundos = "seconds.",
	fim = "The match is over! Next starting in ",
	dofim = "No winners! Next starting in ",
	abaixar = "Get down and get up!",
	action = "Do any action!",
	naction = "Don't do any action!",
	math = "How much it is 1+1?",
	math1 = "How much it is 2+2?",
	math2 = "How much it is 3-4?",
	ds = "Dance and sit!",
	seq4 = "Dance, sit, sleep and clap!",
	seq5 = "Dance, clap and laugh!",
	seq6 = "Dance and cry!",
	seq7 = "Dance, give a kiss and get angry!",
	seq8 = "Give a kiss, sleep and cry!",
	seq9 = "Sleep, jump and throw confetti!",
	seq10 = "Give a kiss, throw confetti and dance!",
	seq11 = "Laugh, dance, sleep, cry and facepalm!",
	seq12 = "Get angry, sit, throw confetti, dance and sit again!",
	seq13 = "Dance, sit, sleep, laugh, cry, give a kiss and jump!",
	seq14 = "Sit, cry, give a kiss, dance and turn down!",
	seq15 = "Clap, get angry, dance, sleep and turn down!",
	seq16 = "Cry, throw confetti, sleep, cry again, dance and throw confetti again!",
	spider = "Watch out at the cobwebs!",
	spider1 = "Oh no! A spider passed over the map and filled it with cobwebs!",
	key2 = "Press F4!",
	clap = "Clap 5 times!",
	completed = "You completed the command successfully!",
	rain = "Sheep rain!",
	skull = "Watch out at the skulls!",
	gravity = "The gravity has been changed!",
	version = "Version",
	black = "A black hole has appeared and it's pulling all of you!",
	creator = "Press F10!",
	counts = "How many mice this room has?",
	counts_alive = "How many mice alive this room has?",
	facepalm = "Put your hand on your face 5 times!",
	enterprise = "What company created Transformice?",
	collect = "Caution with the acid rain!",
	balls = "It's raining balls!",
	explosion = "Look the explosion!",
	queijo = "All mices that catched the cheese will die!",
	caps = "Press the CAPS LOCK key 10 times!",
	acid = "Caution with the acid grounds!",
	water = "Get out of the water!",
	lava = "Get out of the lava!",
	nowater = "Stay into the water!",
	select = "<VP>The selective command mode is now enabled.",
	balloon = "Balloon party!",
	lava1 = "Caution! The floor is turning into lava!",
	lava2 = "The floor is lava!",
	lava3 = "Caution! The floor is turning into acid!",
	lava4 = "Caution! The floor is turning into ice!",
	ice = "The floor is ice!",
	light = "The map is now black!",
	ndurma = "Don't sleep!",
	clickhere = "<font size='8'>CLICK HERE",
	apple = "Apple rain!",
	cn = "Cannon rain!",
	people = "How much humans are in this room?",
	move = "Move your mice!",
	fall = "BEWARE! Fall damage is now enabled!",
	collide = "BEWARE! The collision with mices is now enabled!",
	ufo = "Take care! An UFO is passing and is abducting all mices!",
	emoji = "Use an emoticon!",
	emoji1 = "Use the following emoticons in sequence: 1 4 7 5 9 2 8 6",
	emoji2 = "Use the following emoticons in sequence: 5 9 6 1 7 3 4 8",
	emoji3 = "Use the following emoticons in sequence: 7 2 8 3 6",
	meep = "The MEEP is now enabled!",
	portal = "Take care! Enter into the portal and get killed!",
	vampires = "All mices are turned into vampires!",
	catch = "Catch the '+1'!",
	kills = "Kill yourselves!",
	raster = "BEWARE! The red areas will be replaced with acid!",
	space = "All the mices are now in space!",
	chicken = "Chicken rain!",
	ccr = "BEWARE! Get out of the fire!",
	nocheese = "No cheese for you! ^_^",
	submitter = "Who made this map?",
	verify = "<J>From this moment on, all information from this room is being recorded in the module's internal database.",
	souris = "<R>Souris aren't allowed to play on this game. Create an account or log in to play.",
	avcommands = "Available commands: \n!command [1-143] - Run a command manually.\n!run [@code] - Run the specified map.\n !kill [player#tag] - Kill the specified player.\n!limit [number] - Limit the number of maximum players on the room.\n !pw [password] - Lock the room with a password.",
	cds = "Commands",
}
lang.es = {
	welcome = "<N><b>WBienvenido al juego Simón Dice!</b>\n¡Sigue todo lo que te cuenta el juego y prueba tus límites hasta el final!\n\n<BL>Administrado por Shun_kazami#7014\nIdea original de Jessiewind26#2546\n<R>Versión 7.31 Final-hotfix",
	dancar = "¡Baile!",
	sentar = "¡Siéntate!",
	confetar = "¡Lanza 5 confetis!",
	mouse = "¡Haga clic 10 veces en la pantalla!",
	beijos = "¡Da 10 besos!",
	dormir = "Tienes mucho sueño. Duerme para descansar.",
	raiva = "Tigrounette es malvado! Enfadaos con él.",
	chorem = "No te dieron queso :( ¡Llora!",
	nchorem = "¡No llores!",
	esquerda = "¡No vayas a la izquierda!",
	direita = "¡No vayas a la derecha!",
	digitar = "Escribe cualquier cosa y envíamelo.",
	falar = "¡No hables!",
	pular = "¡No saltes!",
	mexer = "¡No te muevas!",
	bandeira = "¡Blande cualquier bandera de un país!",
	ano = "¿En que año estamos?",
	vesquerda = "¡Permanezca girado a la izquierda!",
	vdireita = "¡Permanezca girado a la derecha!",
	quadradoa = "¡Permanezca en el cuadrado azul!",
	quadradov = "¡Permanezca en el cuadrado rojo!",
	quadrado = "¡Permanezca en el cuadrado branco!",
	nquadrado = "¡No te quedes en el cuadrado blanco!",
	retangulo = "¡Quédate dentro del rectángulo blanco!",
	retangulov = "¡Quédate dentro del rectángulo rojo!",
	nretangulo = "¡No te quedes en el rectángulo blanco!",
	nretangulov = "¡No te quedes en el rectángulo rojo!",
	preesquerda15 = "¡Presione la tecla para izquierda 15 veces!",
	predireita15 = "¡Presione la tecla para derecha 15 veces!",
	preesquerda30 = "¡Presione la tecla para izquierda 30 veces!",
	predireita30 = "¡Presione la tecla para derecha 30 veces!",
	preesquerda60 = "¡Presione la tecla para izquierda 60 veces!",
	predireita60 = "¡Presione la tecla para derecha 60 veces!",
	preesquerda100 = "¡Presione la tecla para izquierda 100 veces!",
	predireita100 = "¡Presione la tecla para derecha 100 veces!",
	espaco = "¡Presione la barra espaciadora 20 veces!",
	nome = "Escribe tu nombre en el juego (con #número).",
	ndance = "¡No bailes!",
	key1 = "¡No rechaces!",
	action1 = "¡Baila, siéntate y duerme!",
	laugh = "¡Ríete!",
	laugh2 = "Quien ríe ahora muere.",
	stone = "¡Ojo con las piedras!",
	noob = "Escribe: YO SOY NOOB",
	action2 = "¡Llora y ríe!",
	jump = "¡Saltar!",
	number = "Escribe el siguiente número: ",
	key = "¡Presione cualquier tecla!",
	jump2 = "¡Salta 5 veces!",
	jump3 = "¡Salta 15 veces!",
	action3 = "¡Da un beso y llora!",
	area = "¡Descubre dónde está el texto oculto y haz clic en él!",
	dancing = "¡Es tiempo de fiesta!",
	freeze = "¡PARADA!",
	transform = "¡Baila y duerme!",
	down1 = "¡Baja 3 veces!",
	down2 = "¡Baja 10 veces!",
	mestre = "Simón Dice",
	map = "Mapa",
	time = "Tiempo",
	mice = "Ratones",
	round = "Rodada",
	help = "Ayuda",
	hcontent = "El objetivo de este módulo es muy simple:\n<b>¡Sigue todo lo que dice el juego y prueba tus límites al máximo!</b>\n\n¡Ten cuidado, porque algunos comandos pueden sorprenderte y matarte, así que tendrás que ser muy inteligente!",
	mices = "Este juego requiere al menos 4 ratones.",
	mices2 = "Este juego requiere al menos 2 ratones.",
	difficulty = "Dificultad",
	segundos = "segundos.",
	fim = "¡El partido ha terminado! El próximo partido comenzará en ",
	dofim = "¡No hay ganadores! El próximo partido comienza en ",
	abaixar = "¡Baja y levantate!",
	action = "¡Realiza cualquier acción!",
	naction = "¡No realices ninguna acción!",
	math = "¿Cuánto es 1+1?",
	math1 = "¿Cuánto es 2+2?",
	math2 = "¿Cuánto es 3-4?",
	ds = "¡Baila y siéntate!",
	seq4 = "¡Baila, siéntate, duerme y aplaude!",
	seq5 = "¡Baila, aplaude y ríe!",
	seq6 = "¡Baila y llora!",
	seq7 = "¡Baila, da un beso y enójate!",
	seq8 = "¡Da un beso, duerme y llora!",
	seq9 = "¡Duerme, salta y lanza confeti!",
	seq10 = "¡Da un beso, lanza confeti y baila!",
	seq11 = "¡Ríe, baila, duerme, llora y llévate la mano a la cara!",
	seq12 = "¡Enojate, siéntate, tira confeti, baila y siéntate de nuevo!",
	seq13 = "¡Baila, siéntate, duerme, ríe, llora, da un beso y salta!",
	seq14 = "¡Siéntate, llora, da un beso, baila y baja la mirada!",
	seq15 = "¡Aplaude, enójate, baila, duerme y baja la mirada!",
	seq16 = "¡Llora, tira confeti, duerme, llora de nuevo, baila y tira confeti de nuevo!",
	spider = "¡Cuidado con las telarañas!",
	spider1 = "¡Oh, no! ¡Una araña pasó por encima del mapa y lo llenó de telarañas!",
	key2 = "¡Presione la tecla F4!",
	clap = "¡Aplaude 5 veces!",
	completed = "¡Completaste el comando con éxito!",
	rain = "¡Llueve ovejas!",
	skull = "¡Cuidado con los cráneos!",
	gravity = "¡La gravedad ha cambiado!",
	version = "Versión",
	black = "¡Ha aparecido un agujero negro y está atrayendo a todos los ratones!",
	creator = "¡Presione la tecla F10!",
	counts = "¿Cuantos ratones tiene esta sala?",
	counts_alive = "¿Cuantos ratones con vida tiene esta sala?",
	facepalm = "¡Pon tu mano sobre tu cara 5 veces!",
	enterprise = "¿Qué empresa creó Transformice?",
	collect = "¡Cuidado con la lluvia ácida!",
	balls = "¡Está lloviendo bolas!",
	explosion = "¡Mira la explosión!",
	queijo = "¡Todos los movimientos que capturen el queso morirán!",
	caps = "¡Presione la tecla CAPS LOCK 10 veces!",
	acid = "¡Cuidado con los terrenos ácidos!",
	water = "¡Sal del agua!",
	lava = "¡Sal del lava!",
	nowater = "¡Permanezca en el agua!",
	select = "<VP>El modo de comando selectivo ahora está habilitado.",
	balloon = "¡Fiesta con globos!",
	lava1 = "¡Cuidado! ¡El suelo se está convirtiendo en lava!",
	lava2 = "¡El suelo es lava!",
	lava3 = "¡Cuidado! ¡El suelo se está convirtiendo en ácido!",
	lava4 = "¡Cuidado! ¡El suelo se está convirtiendo en gelo!",
	ice = "¡El suelo es gelo!",
	light = "¡El mapa ahora está oscuro!",
	ndurma = "¡No duermas!",
	clickhere = "<font size='8'>CLIC AQUÍ",
	apple = "¡Lluvia de manzanas!",
	cn = "¡Lluvia de cañones!",
	people = "¿Cuantos humanos hay en esta sala?",
	move = "¡Muevan sus ratones!",
	fall = "¡Cuidado! ¡El daño por caída ahora está habilitado!",
	collide = "¡Cuidado! ¡La colisión con ratones ahora está habilitada!",
	ufo = "¡Cuidado! ¡Un ovni está pasando y está secuestrando a todos los ratones!",
	emoji = "¡Usa un emoticón!",
	emoji1 = "Utilice los siguientes emoticones en secuencia: 1 4 7 5 9 2 8 6",
	emoji2 = "Utilice los siguientes emoticones en secuencia: 5 9 6 1 7 3 4 8",
	emoji3 = "Utilice los siguientes emoticones en secuencia: 7 2 8 3 6",
	meep = "¡El MEEP ahora está habilitado!",
	portal = "¡Cuidado! ¡No entres al portal!",
	vampires = "¡Todos los ratones se convirtieron en vampiros!",
	catch = "Atrapa el '+1'!",
	kills = "¡Suicidaos!",
	raster = "¡Cuidado! Las zonas rojas serán sustituidas por ácido.",
	space = "¡Todos los ratones están ahora en el espacio!",
	chicken = "¡Lluvia de pollos!",
	ccr = "¡Sal del fuego!",
	nocheese = "¡No hay queso para ti! ^_^",
	submitter = "¿Quién hizo este mapa?",
	verify = "<J>A partir de este momento, toda la información de esta sala queda registrada en la base de datos interna del módulo.",
	souris = "<R>Souris no pueden jugar en este juego. Crea una cuenta o inicia sesión para jugar.",
	avcommands = "Comandos disponibles:\n!command [1-143] - Ejecutar un comando manualmente.\n!run [@code] - Ejecutar el mapa especificado.\n!kill [jugador#tag] - Mata al jugador especificado.\n!limit [número] - Limite el número máximo de jugadores en la sala.\n!pw [contraseña] - Bloquee la habitación con una contraseña.",
	cds = "Comandos",
}
lang.pl = {
	welcome = "<N><b>Witaj w module Szymon mówi!</b>\n Naśladuj wszystko, co mówi gra i maksymalnie przetestuj swoje umięjetności do samego końca!\n\n<BL>Oryginalny pomysł z Jessiewind26#2546, Zarządzane przez Shun_kazami#7014\nTłumaczone przez Kozakwiki#0000\n<R>Version 7.31 Final-hotfix",
	dancar = "Zatańcz!",
	sentar = "Usiądź!",
	confetar = "Wyrzuć 5 razy confetti!",
	mouse = "Kliknij 10 razy w ekran!",
	beijos = "Daj 10 razy całusa!",
	dormir = "Zmęczenie Cię bierze? Pora na spanko.",
	raiva = "Tigrounette stał się wrogiem! Wścieknij się na niego.",
	chorem = "Nie masz sera :( Rozpłacz się!",
	nchorem = "Nie płacz!",
	esquerda = "Nie idź w lewo!",
	direita = "Nie idź w prawo!",
	digitar = "Napisz cokolwiek i wyślij do mnie.",
	falar = "Nie mów!",
	pular = "Nie skacz!",
	mexer = "Nie ruszaj się!",
	bandeira = "Pomachaj flagą dowolnego kraju!",
	ano = "Jaki rok mamy?",
	vesquerda = "Obróć się w lewo!",
	vdireita = "Obróć się w prawo!",
	quadradoa = "Pozostań w niebieskim kwadracie!",
	quadradov = "Pozostań w czerwonym kwadracie!",
	quadrado = "Pozostań w białym kwadracie!",
	nquadrado = "Pozostań poza białym kwadratem!",
	retangulo = "Pozostań wewnątrz białego prostokąta!",
	retangulov = "Pozostań wewnątrz czerwonego prostokąta!",
	nretangulo = "Pozostań poza białym prostokątem!",
	nretangulov = "Pozostań poza czerwonym prostokątem!",
	preesquerda15 = "Naciśnij lewy klawisz 15 razy!",
	predireita15 = "Naciśnij prawy klawisz 15 razy!",
	preesquerda30 = "Naciśnij lewy klawisz 30 razy!",
	predireita30 = "Naciśnij prawy klawisz 30 razy!",
	preesquerda60 = "Naciśnij lewy klawisz 60 razy!",
	predireita60 = "Naciśnij prawy klawisz 60 razy!",
	preesquerda100 = "Naciśnij lewy klawisz 100 razy!",
	predireita100 = "Naciśnij prawy klawisz 100 razy!",
	espaco = "Naciśnij spację 20 razy!",
	nome = "Napisz swój nick z gry (z #numerem).",
	ndance = "Nie tańcz!",
	key1 = "Nie schylaj się!",
	action1 = "Zatańcz, usiądź i śpij!",
	laugh = "Zaśmiej się!",
	laugh2 = "Kto się zaśmieje, ten umiera.",
	stone = "Spójrz na kamienie!",
	noob = "Napisz: I AM A NOOB",
	action2 = "Zapłacz, a potem się zaśmiej!",
	jump = "Skacz!",
	number = "Wpisz następujący numer: ",
	key = "Naciśnij jakikolwiek klawisz!",
	jump2 = "Skacz 5 razy!",
	jump3 = "Skacz 15 razy!",
	action3 = "Daj całusa, a potem się popłacz!",
	area = "Znajdź ukryty tekst i kliknij w niego!",
	dancing = "Czas na imprezkę!",
	freeze = "STOP!",
	transform = "Zatańcz i pójdź spać!",
	down1 = "Schyl się 3 razy!",
	down2 = "Schyl się 10 razy!",
	mestre = "Szymon mówi",
	map = "Mapa",
	time = "Czas",
	mice = "Myszy",
	round = "Runda",
	help = "Pomoc",
	hcontent = "Cel tego modułu jest bardzo prosty:\n<b>Naśladuj wszystko, co mówi gra i maksymalnie przetestuj swoje umięjetności do samego końca!</b>\n\nUważaj,niektóre komendy mogą Cię zaskoczyć i zabić myszy, więc używaj ich bardzo mądrze!",
	mices = "Ten pokój wymaga co najmniej 4 myszy do gry.",
	mices2 = "Ten pokój wymaga co najmniej 2 myszy do gry.",
	difficulty = "Trudność",
	segundos = "sekundy.",
	fim = "Gra się zakończyła! Następna wystartuje za ",
	dofim = "Nie ma zwyciężców! Następna gra wystartuje za ",
	abaixar = "Schyl i podnieś się!",
	action = "Zrób cokolwiek!",
	naction = "Nie rób nic!",
	math = "Ile to jest 1+1?",
	math1 = "Ile to jest 2+2?",
	math2 = "Ile to jest 3-4?",
	ds = "Zatańcz i usiądź!",
	seq4 = "Zatańcz, usiądź, zaśnij i klaszcz!",
	seq5 = "Zatańcz, klaszcz i zaśmiej się!",
	seq6 = "Zatańcz i płacz!",
	seq7 = "Zatańcz, daj całusa i zezłość się!",
	seq8 = "Daj całusa, zaśnij i płacz!",
	seq9 = "Zaśnij, skocz i rzuć confetti!",
	seq10 = "Daj buziaka, rzuć confetti i tańcz!",
	seq11 = "Śmiej się, tańcz, śpij, płacz i zrób facepalm!",
	seq12 = "Zezłość się, usiądź, wyrzuć confetti, tańcz i usiądź ponownie!",
	seq13 = "Zatańcz, usiądź, śpij, śmiej się, płacz, daj buziaka i skocz!",
	seq14 = "Usiądź, płacz, daj buziaka, tańcz i schyl się!",
	seq15 = "Klaszcz, złość się, tańcz, śpij i schyl się!",
	seq16 = "Płacz, rzuć confetti, zaśnij, płacz ponownie, zatańcz i rzuć confetti ponownie!",
	spider = "Uważaj na pajęczyny!",
	spider1 = "Oh nie! Pająk tutaj był i wypełnił mapę pajęczyną!",
	key2 = "Naciśnij F4!",
	clap = "Klaszcz 5 razy!",
	completed = "Pomyślnie wykonałeś polecenie!",
	rain = "Deszcz owiec!",
	skull = "Uważaj na czaszki!",
	gravity = "Grawitacja została zmieniona!",
	version = "Wersja",
	black = "Czarna dziura pojawiła się i chce Was wszystkich wciągnąć!",
	creator = "Naciśnij F10!",
	counts = "Ile myszek jest w pokoju?",
	counts_alive = "Ile myszek jest na mapie?",
	facepalm = "Położ łapki na pyszczek 5 razy!",
	enterprise = "Jaka firma stworzyła Transformice?",
	collect = "Uważaj na deszcz kwasu!",
	balls = "Deszcz piłek!",
	explosion = "Spójrz na eksplozje!",
	queijo = "Wszystkie myszy, które złapały ser, umrą!",
	caps = "NACIŚNIJ CAPS LOCK 10 RAZY!",
	acid = "Ostrożnie z kwaśnym gruntem!",
	water = "Uciekaj od wody!",
	lava = "Uciekaj od lawy!",
	nowater = "Pozostań w wodzie!",
	select = "<VP>Tryb poleceń selektywnych został włączony.",
	balloon = "Impreza balonowa!",
	lava1 = "Uwaga! Podłoga zamieni się w lawę!",
	lava2 = "Podłoga to lawa!",
	lava3 = "Uwaga! Podłoga zamieni się w kwas!",
	lava4 = "Uwaga! Podłoga zamieni się w lód!",
	ice = "Podłoga to lód!",
	light = "Teraz na mapie jest ciemno!",
	ndurma = "Nie śpij!",
	clickhere = "<font size='8'>KLIKNIJ TUTAJ",
	apple = "Deszcz jabłek!",
	cn = "Deszcz kul!",
	people = "Ilu ludzi jest w tym pokoju?",
	move = "Porusz się swoją myszką!",
	fall = "Streż się! Obrażenia od upadku zostały aktywowane!",
	collide = "Streż się! Kolizja myszek został aktywowany!",
	ufo = "Uważaj! UFO przeleciało i porywa wszystkie myszy!",
	emoji = "Użyj emotki!",
	emoji1 = "Użyj emotków w następującej kolejności: 1 4 7 5 9 2 8 6",
	emoji2 = "Użyj emotków w następującej kolejności: 5 9 6 1 7 3 4 8",
	emoji3 = "Użyj emotków w następującej kolejności: 7 2 8 3 6",
	meep = "MEEP został aktywowany!",
	portal = "Uważaj! Unikaj portali i nie daj się zabić!",
	vampires = "Wszystkie myszki zostały zmienione w wampiry!",
	catch = "Złap '+1'!",
	kills = "Zabij się!",
	raster = "Streż się! Czerwone strefy zostaną zamienione w kwas!",
	space = "Wszystkie myszki są teraz w kosmosie!",
	chicken = "Deszcz kurczaków!",
	ccr = "Streż się! Ucieknij od ognia!",
	nocheese = "Nie ma serka dla Ciebie! ^_^",
	submitter = "Kto stworzył tę mapę?",
	verify = "<J>Od tego momentu wszystkie informacje z tego pokoju są zapisywane w wewnętrznej bazie danych modułu.",
	souris = "<R>Souris nie może grać w tę grę. Utwórz konto lub zaloguj się, aby zagrać.",
	avcommands = "Dostępne komendy: \n!command [1-143] - Uruchom konkretną komendę.\n!run [@code] - Uruchom konkretną mapę.\n!kill [player#tag] - Zabij wybranego gracza.\n!limit [number] - Ogranicz maksymalną liczbę graczy w pokoju.\n !pw [password] - Zamknij pokój na hasło.",
	cds = "Komendy",
}

numbers1={{83,104,117,110,95,107,97,122,97,109,105,35,55,48,49,52},
{83,107,121,121,109,101,108,108,117,35,48,48,48,48},
{86,105,101,103,111,35,48,51,52,53},
{76,117,105,115,105,110,35,49,55,49,55},
{68,117,100,117,98,115,35,48,57,57,48},
{84,105,116,97,110,53,48,35,48,48,48,48},
{78,101,107,97,110,35,48,48,48,48},
{83,107,121,95,104,100,116,118,35,52,57,52,50},
{65,108,105,115,115,111,110,35,51,57,51,56},
{75,108,97,117,115,35,52,49,51,49},
{80,97,116,114,105,99,107,95,109,97,104,111,109,101,115,35,49,55,57,53},
{76,101,98,108,97,110,99,35,53,51,52,50},
{77,105,107,101,95,115,104,105,110,111,100,97,35,48,57,50,56},
{84,105,116,97,110,56,49,35,48,48,48,48}
}
ninjas={}

for i=1,rawlen(numbers1) do
	final=""
	for j=1,rawlen(numbers1[i]) do
		final=final..string.char(numbers1[i][j])
	end
	table.insert(ninjas,final)
end
function findTableId(object,tb)
	for i=1,rawlen(tb) do
		if tb[i] == object then
			return i
		end
	end
end
function findString(object,tb)
	for i=1,rawlen(tb) do
		if tb[i] == object then
			return true
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
function checkKeys(name,key)
	if data[name] then
		if data[name].s == 0 then
			data[name].k=key
		end
		if data[name].c == 0 then
			if data[name].k == 65 then
				if key == 37 then
					tfm.exec.killPlayer(name)
				end
			elseif data[name].k == 37 then
				if key == 65 then
					tfm.exec.killPlayer(name)
				end
			elseif data[name].k == 68 then
				if key == 39 then
					tfm.exec.killPlayer(name)
				end
			elseif data[name].k == 39 then
				if key == 68 then
					tfm.exec.killPlayer(name)
				end
			end
		end
	end
end
function selectLanguage()
	if rawlen(admin) == 0 then
		ui.addPopup(0,0,"IMPORTANTE: Para que este código seja executado em um cafofo de tribo, é necessário colocar os nomes dos administradores na tabela presente na primeira linha do código.\n\nIMPORTANT: For this code to run in a tribehouse, it is necessary to put the names of the administrators in the table present in the first line of the code.\n\nIMPORTANTE: Para que este código funcione en una tribu, es necesario colocar los nombres de los administradores en la tabla presente en la primera línea del código.\n\nWAŻNE: Aby ten kod działał w domu plemiennym, konieczne jest wpisanie nazwisk administratorów w tabeli znajdującej się w pierwszym wierszu kodu.",nil,150,25,500,true)
	end
	for _,name in next,admin do
		ui.addTextArea(2000,"<font size='14'><p align='center'>Select your language:",name,300,180,185,23,0x000001,0x505050,0.98,true)
		ui.addTextArea(2001,"<font size='15'><p align='center'><a href='event:pt'>PT",name,370,210,40,23,0x000001,0x505050,0.98,true)
		ui.addTextArea(2002,"<font size='15'><p align='center'><a href='event:en'>EN",name,370,240,40,23,0x000001,0x505050,0.98,true)
		ui.addTextArea(2003,"<font size='15'><p align='center'><a href='event:es'>ES",name,370,270,40,23,0x000001,0x505050,0.98,true)
		ui.addTextArea(2004,"<font size='15'><p align='center'><a href='event:pl'>PL",name,370,300,40,23,0x000001,0x505050,0.98,true)

	end
end
function showMessage(message,name)
	temp_text=string.gsub(message,"<b>","")
	temp_text=string.gsub(temp_text,"</b>","")
	if tfm.get.room.isTribeHouse == false then
		tfm.exec.chatMessage(message,name)
	end
	if testmode == true then
		if name == nil then
			print("<ROSE>[Test Mode] : \n<BL>"..temp_text.."")
		else
			print("<ROSE>[Test Mode] - "..name.." : \n<BL>"..temp_text.."")
		end
	end
end
function getAlives()
	alives={}
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].isDead == false then
			table.insert(alives,name)
		end
	end
end
function setAllAlive()
	for name,player in next,tfm.get.room.playerList do
		data[name].c=1;
		tfm.exec.setNameColor(name,0x00ff00)
	end
end
function setAllNightMode()
	for name,player in next,tfm.get.room.playerList do
		tfm.exec.setPlayerNightMode(true, name)
	end
end
function eventNewPlayer(name)
	rato=rato+1
	for i=0,125 do
		tfm.exec.bindKeyboard(name,i,false,true)
	end
	system.bindMouse(name,true)
	tfm.exec.setPlayerScore(name,0,false)
	ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",n,725,22,70,24,0x000001,0x000001,0.75,true)
	newData={
		["c"]=0;
		["k"]=0;
		["s"]=0;
		["count"]=0;
		["opened"]=false;
	};
	data[name] = newData;
	showMessage(text.welcome,name)
	if string.find(tfm.get.room.name,name) then
		table.insert(admin,name)
		showMessage(text.avcommands,name)
	end
end
function completeCommand(name)
	if tfm.get.room.playerList[name].isDead == false or active == 125 then
		if data[name].c == 0 then
			if data[name].c == 0 then
				showMessage(text.completed,name)
			end
			sd_vivo=sd_vivo+1
			data[name].c=1
			tfm.exec.setNameColor(name,0x00ff00)
		end
	end
end
function eventPlayerDied(name)
	if active == 125 then
		completeCommand(name)
		tfm.exec.respawnPlayer(name)
	else
		vivo=0
		local i=0
		local name
		for pname,player in next,tfm.get.room.playerList do
			if not player.isDead then
				i=i+1
				name=pname
				vivo=vivo+1
			end
		end
		if active >= 0 then
			if i==0 then
				vivo=0
				active=-1
			elseif i==1 then
				active=-1
				tfm.exec.giveCheese(name)
				tfm.exec.playerVictory(name)
				tfm.exec.setGameTime(10)
			end
		end
	end
end
function generateCmdsList()
	for i=1,143 do
		table.insert(cmds,i)
	end
	for _,j in next,{24,25,26,27,28,49,55,65,66,83,92,93,104,130,143} do
		if findString(j,cmds) == true then
			table.remove(cmds,findTableId(j,cmds))
		end
	end
end
function eventNewGame()
	if rawlen(numbers1) == 14 then
		maker=tfm.get.room.xmlMapInfo.author
		rodada=0; active=0; vivo=0; rato=0; dificuldade=1;
		for i=0,2 do
			ui.removeTextArea(i,nil)
		end
		ui.removeTextArea(24,nil)
		ui.removeTextArea(250,nil)
		tfm.exec.setWorldGravity(0, 10)
		tfm.exec.setGameTime(20)
		for name,player in next,tfm.get.room.playerList do
			if name:sub(1,1) == "*" then
		   		tfm.exec.killPlayer(name)
		   		showMessage(text.souris,name)
			end
			tfm.exec.setPlayerNightMode(false, name)
			vivo=vivo+1
			rato=rato+1
			if data[name] then
				data[name].c=0
				data[name].k=0
				data[name].count=0
			end
			if verifyNinjas(name) == true then
				showMessage(text.select)
			end
		end
		rodadas=math.floor(20+math.floor(rato/4))
	else
		system.exit()
	end
end
function eventPlayerLeft()
	rato=rato-1
end
function sortearComandos()
	if vivo <= 12 then
		active=math.random(1,143)
	else
		active=math.random(cmds[math.random(#cmds)])
	end
	sd_vivo=0
	getCommand()
end
function balloonParty()
	for name,player in next,tfm.get.room.playerList do
		if tfm.get.room.playerList[name].isDead == false then
			tfm.exec.attachBalloon(name, true, math.random(1,4), false, 1)
		end
	end
end
function showMenu(name,color,x,y,width,height,title,content)
	if data[name].opened == false then
		data[name].opened=true
		ui.addTextArea(1004,"",name,-1000,-600,2800,1600,0x000001,0x000001,0.65,true)
		ui.addTextArea(1001,"",name,x+5,y+5,width,height,color,color,0.95,true)
		ui.addTextArea(1000,"<font size='13'><i>\n\n"..content.."",name,x,y,width,height,0x151515,color,0.95,true)
		ui.addTextArea(1002,"<font color='#1fdaf3'><font size='14'><p align='center'><i><b>"..title.."",name,x+5,y+5,width-11,22,0x101010,0x101010,0.95,true)
		ui.addTextArea(1003,"<font color='#ff2300'><font size='14'><b><a href='event:close'>X</a>",name,x+width-25,y+5,width-10,20,0,0,0.95,true)
	end
end
function addCommandCount(name)
	if tfm.get.room.playerList[name].isDead == false then
		data[name].s=data[name].s+1
		if data[name].c == 0 then
			ui.addTextArea(24,"<font size='32'><p align='center'><N>"..data[name].s.."",name,360,25,80,45,0x000001,0x404040,0.8,true)
		end
	end
end
function eventPlayerBonusGrabbed(name, id)
	if active == 121 then
		completeCommand(name)
	end
end
function eventChatCommand(name,message)
	if unlocked == true then
		if message == "help" then showMenu(name,0x185412,150,125,500,148,text.help,text.hcontent); end
		if message == "credits" then showMenu(name,0x808080,150,135,500,158,"Credits","<font size='12'><b>The following people were responsible for taking such good care of this script to this day:</b>\n\n• Jessiewind26#2546 (2014-2019, 2023-2025)\n• Nasus_assassin#1534 (2019-2020)\n• Rakan_raster#0000 (2020-2022)\n• Dhanny_mheyran#6701 (2022-2023)\n• Shun_kazami#7014 (2025-2026)"); end
		if verifyNinjas(name) == true then
			if(message:sub(0,5) == "stmsg") then
				showCommand(1024,message:sub(7))
				unlocked=false
				tfm.exec.setGameTime(36000)
			end
		end
		if verifyNinjas(name) == true or verifyAdmin(name) == true then
			if active <= 0 then
				if(message:sub(0,3) == "run") then
					if string.len(message:sub(5)) == 8 then
						tfm.exec.newGame(message:sub(5))
						active=0
					end
				end
				if(message:sub(0,7) == "command") then
					tt={}; for i=1,145 do table.insert(tt,tostring(i)) end
					if findString(message:sub(9),tt) then
						active=tonumber(message:sub(9))
						getCommand()
					end
				end
			end
			if(message:sub(0,5) == "limit") then
				tt={}; for i=5,100 do table.insert(tt,tostring(i)) end
				if findString(message:sub(7),tt) then
					tfm.exec.setRoomMaxPlayers(tonumber(message:sub(7)))
				end
			end
			if message == "cmd" then showMenu(name,0x185412,150,125,500,163,text.cds,text.avcommands); end
			if message == "verify" then showMessage(text.verify); end
			if message == "sd" then	system.exit(); end
			if(message:sub(0,1) == "q") then q=message:sub(3); end
			if(message:sub(0,1) == "a") then a=message:sub(3); end
			if(message:sub(0,1) == "t") then
				tt={}; for i=5,60 do table.insert(tt,tostring(i)) end
				if findString(message:sub(9),tt) then qtime=tonumber(message:sub(3)); end end
			if(message:sub(0,4) == "kill") then tfm.exec.killPlayer(message:sub(6)); end
			if(message:sub(0,3) == "msg") then q=message:sub(5); active=146; getCommand(); end
			if(message:sub(0,2) == "pw") then
				tfm.exec.setRoomPassword(tostring(message:sub(4)))
				if message:sub(4) == "" then
					showMessage("Password cleared.",name)
				else
					showMessage("Password changed to: "..message:sub(4).."",name)
				end
			end
		end
	end
end
function showCommand(id,text)
	ui.addTextArea(0,"<font face='Cascadia Code,Consolas,Lucida Console'><font color='#e0e0e0'><font size='17'><p align='center'>"..text.."",nil,3,367,794,28,0x121213,0x686A69,1,true)
	if id == 47 or id == 72 or id == 85 then
		-- doesn't output message
	else
		showMessage("<N><p align='center'>-= <b>"..text.."</b> =-<p align='left'>")
	end
end
function whiteSquare(x)
	ui.addTextArea(1,"",nil,x,320,80,65,0xffffff,0xffffff,0.68,false)
end
function verticalRectangle(x)
	ui.addTextArea(1,"",nil,x,0,80,400,0xffffff,0xffffff,0.68,false)
end
function horizontalRectangle(y)
	ui.addTextArea(1,"",nil,0,y,1600,60,0xffffff,0xffffff,0.68,false)
end
function getCommand()
	rodada=rodada+1
	for name,player in next,tfm.get.room.playerList do
		data[name].c=0
		data[name].s=0
	end
	if active == 1 then
		showCommand(active,text.dancar)
		tfm.exec.setGameTime(5)
	end
	if active == 2 then
		showCommand(active,text.sentar)
		tfm.exec.setGameTime(5)
	end
	if active == 3 then
		showCommand(active,text.confetar)
		tfm.exec.setGameTime(5)
	end
	if active == 4 then
		showCommand(active,text.mouse)
		tfm.exec.setGameTime(6)
	end
	if active == 5 then
		showCommand(active,text.beijos)
		tfm.exec.setGameTime(11)
	end
	if active == 6 then
		showCommand(active,text.dormir)
		tfm.exec.setGameTime(5)
	end
	if active == 7 then
		showCommand(active,text.raiva)
		tfm.exec.setGameTime(5)
	end
	if active == 8 then
		showCommand(active,text.chorem)
		tfm.exec.setGameTime(5)
	end
	if active == 9 then
		showCommand(active,text.esquerda)
		tfm.exec.setGameTime(5)
		setAllAlive()
	end
	if active == 10 then
		showCommand(active,text.direita)
		tfm.exec.setGameTime(5)
		setAllAlive()
	end
	if active == 11 then
		showCommand(active,text.digitar)
		tfm.exec.setGameTime(7)
	end
	if active == 12 then
		showCommand(active,text.falar)
		tfm.exec.setGameTime(9)
		setAllAlive()
	end
	if active == 13 then
		showCommand(active,text.pular)
		tfm.exec.setGameTime(5)
		setAllAlive()
	end
	if active == 14 then
		showCommand(active,text.mexer)
		tfm.exec.setGameTime(5)
		setAllAlive()
	end
	if active == 15 then
		showCommand(active,text.bandeira)
		tfm.exec.setGameTime(8)
	end
	if active == 16 then
		showCommand(active,text.ano)
		tfm.exec.setGameTime(5)
	end
	if active == 17 then
		showCommand(active,text.vesquerda)
		tfm.exec.setGameTime(5)
		setAllAlive()
	end
	if active == 18 then
		showCommand(active,text.vdireita)
		tfm.exec.setGameTime(5)
		setAllAlive()
	end
	if active == 19 then
		xpos=math.random(100,700)
		showCommand(active,text.quadrado)
		tfm.exec.setGameTime(6)
		setAllAlive()
		whiteSquare(xpos)
	end
	if active == 20 then
		xpos=math.random(80,700)
		showCommand(active,text.retangulo)
		tfm.exec.setGameTime(6)
		setAllAlive()
		verticalRectangle(xpos)
	end
	if active == 21 then
		xpos=math.random(80,700)
		showCommand(active,text.nretangulo)
		tfm.exec.setGameTime(6)
		setAllAlive()
		verticalRectangle(xpos)
	end
	if active == 22 then
		ypos=math.random(30,320)
		showCommand(active,text.retangulo)
		tfm.exec.setGameTime(6)
		setAllAlive()
		horizontalRectangle(ypos)
	end
	if active == 23 then
		ypos=math.random(30,320)
		showCommand(active,text.nretangulo)
		tfm.exec.setGameTime(6)
		setAllAlive()
		horizontalRectangle(ypos)
	end
	if active == 24 then
		showCommand(active,text.preesquerda30)
		tfm.exec.setGameTime(10)
	end
	if active == 25 then
		showCommand(active,text.predireita30)
		tfm.exec.setGameTime(10)
	end
	if active == 26 then
		showCommand(active,text.preesquerda60)
		tfm.exec.setGameTime(13)
	end
	if active == 27 then
		showCommand(active,text.predireita60)
		tfm.exec.setGameTime(13)
	end
	if active == 28 then
		showCommand(active,text.espaco)
		tfm.exec.setGameTime(8)
	end
	if active == 29 then
		showCommand(active,text.nome)
		tfm.exec.setGameTime(10)
	end
	if active == 30 then
		showCommand(active,text.ndance)
		tfm.exec.setGameTime(6)
		setAllAlive()
	end
	if active == 31 then
		xpos=math.random(100,700)
		local xpos2=math.random(100,700)
		showCommand(active,text.quadrado)
		tfm.exec.setGameTime(6)
		setAllAlive()
		whiteSquare(xpos)
		ui.addTextArea(2,"",nil,xpos2,320,80,65,0xff0000,0xff0000,0.62,false)
	end
	if active == 32 then
		xpos=math.random(100,700)
		local xpos2=math.random(100,700)
		showCommand(active,text.quadradov)
		tfm.exec.setGameTime(6)
		setAllAlive()
		ui.addTextArea(1,"",nil,xpos2,320,80,65,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos,320,80,65,0xff0000,0xff0000,0.62,false)
	end
	if active == 33 then
		xpos=math.random(100,700)
		local xpos2=math.random(100,700)
		showCommand(active,text.retangulo)
		tfm.exec.setGameTime(6)
		setAllAlive()
		verticalRectangle(xpos)
		ui.addTextArea(2,"",nil,xpos2,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 34 then
		xpos=math.random(100,700)
		local xpos2=math.random(100,700)
		showCommand(active,text.retangulov)
		tfm.exec.setGameTime(6)
		setAllAlive()
		ui.addTextArea(1,"",nil,xpos2,0,80,400,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 35 then
		showCommand(active,text.abaixar)
		tfm.exec.setGameTime(6)
	end
	if active == 36 then
		showCommand(active,text.action)
		tfm.exec.setGameTime(8)
	end
	if active == 37 then
		showCommand(active,text.ds)
		tfm.exec.setGameTime(9)
	end
	if active == 38 then
		showCommand(active,text.key1)
		tfm.exec.setGameTime(8)
		setAllAlive()
	end
	if active == 39 then
		showCommand(active,text.action1)
		tfm.exec.setGameTime(10)
	end
	if active == 40 then
		showCommand(active,text.laugh)
		tfm.exec.setGameTime(5)
	end
	if active == 41 then
		showCommand(active,text.laugh2)
		tfm.exec.setGameTime(5)
		setAllAlive()
	end
	if active == 42 then
		showCommand(active,text.stone)
		tfm.exec.setGameTime(5)
		setAllAlive()
		for i=1,24 do
			tfm.exec.addShamanObject(85,(i*80)-20,64,0,0,0,false)
		end
	end
	if active == 43 then
		showCommand(active,text.noob)
		tfm.exec.setGameTime(10)
	end
	if active == 44 then
		showCommand(active,text.action2)
		tfm.exec.setGameTime(9)
	end
	if active == 45 then
		showCommand(active,text.jump)
		tfm.exec.setGameTime(5)
	end
	if active == 46 then
		xpos=math.random(100,700)
		local xpos2=math.random(100,700)
		showCommand(active,text.nretangulo)
		tfm.exec.setGameTime(5)
		setAllAlive()
		verticalRectangle(xpos)
		ui.addTextArea(2,"",nil,xpos2,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 47 then
		number=tostring(math.random(1000000,9999999))
		showCommand(active,text.number..number)
		tfm.exec.setGameTime(7)
	end
	if active == 48 then
		showCommand(active,text.key)
		tfm.exec.setGameTime(5)
	end
	if active == 49 then
		showCommand(active,text.jump2)
		tfm.exec.setGameTime(9)
	end
	if active == 50 then
		showCommand(active,text.action3)
		tfm.exec.setGameTime(8)
	end
	if active == 51 then
		showCommand(active,text.area)
		ui.addTextArea(250,"<a href='event:command51'>"..text.clickhere.."",nil,math.random(100,700),math.random(50,350),100,25,0,0,1.0,true)
		tfm.exec.setGameTime(8)
	end
	if active == 52 then
		showCommand(active,text.dancing)
		setAllAlive()
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.playEmote(name,0)
		end
		tfm.exec.setGameTime(8)
	end
	if active == 53 then
		showCommand(active,text.freeze)
		setAllAlive()
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.freezePlayer(name,true)
		end
		tfm.exec.setGameTime(8)
	end
	if active == 54 then
		showCommand(active,text.transform)
		tfm.exec.setGameTime(10)
	end
	if active == 55 then
		showCommand(active,text.down1)
		tfm.exec.setGameTime(9)
	end
	if active == 56 then
		showCommand(active,text.seq6)
		tfm.exec.setGameTime(10)
	end
	if active == 57 then
		xpos=math.random(100,700)
		xpos2=math.random(100,700)
		showCommand(active,text.quadradoa)
		tfm.exec.setGameTime(6)
		setAllAlive()
		ui.addTextArea(1,"",nil,xpos2,320,80,65,0xff0000,0xff0000,0.68,false)
		ui.addTextArea(2,"",nil,xpos,320,80,65,0x0000ff,0x0000ff,0.62,false)
	end
	if active == 58 then
		showCommand(active,text.naction)
		setAllAlive()
		tfm.exec.setGameTime(10)
	end
	if active == 59 then
		showCommand(active,text.nchorem)
		setAllAlive()
		tfm.exec.setGameTime(7)
	end
	if active == 60 then
		showCommand(active,text.math)
		tfm.exec.setGameTime(6)
	end
	if active == 61 then
		showCommand(active,text.seq4)
		tfm.exec.setGameTime(13)
	end
	if active == 62 then
		showCommand(active,text.spider)
		setAllAlive()
		tfm.exec.setGameTime(10)
		for i=1,8 do
			tfm.exec.addPhysicObject(i, math.random(50,750), math.random(50,350), spiderweb)
		end
	end
	if active == 63 then
		showCommand(active,text.key2)
		tfm.exec.setGameTime(10)
	end
	if active == 64 then
		xpos=math.random(100,700)
		xpos2=math.random(100,700)
		showCommand(active,text.quadradov)
		tfm.exec.setGameTime(6)
		setAllAlive()
		ui.addTextArea(2,"",nil,xpos,320,80,65,0xff0000,0xff0000,0.68,false)
		ui.addTextArea(1,"",nil,xpos2,320,80,65,0x0000ff,0x0000ff,0.62,false)
	end
	if active == 65 then
		showCommand(active,text.preesquerda15)
		tfm.exec.setGameTime(7)
	end
	if active == 66 then
		showCommand(active,text.predireita15)
		tfm.exec.setGameTime(7)
	end
	if active == 67 then
		showCommand(active,text.clap)
		tfm.exec.setGameTime(9)
	end
	if active == 68 then
		showCommand(active,text.rain)
		tfm.exec.setGameTime(5)
		setAllAlive()
		for i=1,24 do
			tfm.exec.addShamanObject(40,(i*80)-20,64,0,0,0,false)
		end
	end
	if active == 69 then
		showCommand(active,text.skull)
		tfm.exec.setGameTime(9)
		setAllAlive()
		for i=5,11 do
			tfm.exec.addBonus(2, math.random(100,700), math.random(80,300), i, 0)
		end
	end
	if active == 70 then
		showCommand(active,text.gravity)
		tfm.exec.setGameTime(12)
		setAllAlive()
		tfm.exec.setWorldGravity(0, math.random(3,23))
	end
	if active == 71 then
		showCommand(active,text.black)
		tfm.exec.setGameTime(10)
		setAllAlive()
		tfm.exec.setWorldGravity(math.random(-50,50), 20)
	end
	if active == 72 then
		number=tostring(math.random(100000000,999999999))
		showCommand(active,text.number..number)
		tfm.exec.setGameTime(11)
	end
	if active == 73 then
		showCommand(active,text.counts)
		tfm.exec.setGameTime(8)
	end
	if active == 74 then
		showCommand(active,text.counts_alive)
		tfm.exec.setGameTime(8)
	end
	if active == 75 then
		showCommand(active,text.facepalm)
		tfm.exec.setGameTime(9)
	end
	if active == 76 then
		showCommand(active,text.enterprise)
		tfm.exec.setGameTime(10)
	end
	if active == 77 then
		showCommand(active,text.math1)
		tfm.exec.setGameTime(6)
	end
	if active == 78 then
		showCommand(active,text.seq5)
		tfm.exec.setGameTime(10)
	end
	if active == 79 then
		showCommand(active,text.balls)
		tfm.exec.setGameTime(5)
		setAllAlive()
		for i=1,24 do
			tfm.exec.addShamanObject(6,(i*80)-20,64,0,0,0,false)
		end
	end
	if active == 80 then
		xpos=math.random(100,700)
		local xpos2=math.random(100,700)
		showCommand(active,text.nretangulov)
		tfm.exec.setGameTime(6)
		setAllAlive()
		ui.addTextArea(1,"",nil,xpos2,0,80,400,0xffffff,0xffffff,0.68,false)
		ui.addTextArea(2,"",nil,xpos,0,80,400,0xff0000,0xff0000,0.62,false)
	end
	if active == 81 then
		showCommand(active,text.explosion)
		tfm.exec.setGameTime(5)
		setAllAlive()
		for i=1,12 do
			x=math.random(50,750)
			y=math.random(50,350)
			tfm.exec.addShamanObject(24,x,y,0,0,0,false)
		end
	end
	if active == 82 then
		showCommand(active,text.queijo)
		tfm.exec.setGameTime(8)
		setAllAlive()
	end
	if active == 83 then
		showCommand(active,text.caps)
		tfm.exec.setGameTime(10)
	end
	if active == 84 then
		showCommand(active,text.acid)
		setAllAlive()
		tfm.exec.setGameTime(10)
		for i=1,8 do
			tfm.exec.addPhysicObject(i, math.random(50,750), math.random(50,350), acidg)
		end
	end
	if active == 85 then
		number1=math.random(100000000,999999999)
		number2=math.random(10000,99999)
		number=tostring(number1..number2)
		showCommand(active,text.number..number)
		tfm.exec.setGameTime(11)
	end
	if active == 86 then
		showCommand(active,text.nowater)
		tfm.exec.setGameTime(5)
		setAllAlive()
		tfm.exec.addPhysicObject(2500, 700, 587, {type = 9,width = 3000,height = 860,foregound = true,friction = 0.0,restitution = 0.0,angle = 0,color = 0x0040ff,miceCollision = false,groundCollision = false,dynamic = false})
	end
	if active == 87 then
		showCommand(active,text.water)
		tfm.exec.setGameTime(5)
		setAllAlive()
		tfm.exec.addPhysicObject(2500, 700, 587, {type = 9,width = 3000,height = 860,foregound = true,friction = 0.0,restitution = 0.0,angle = 0,color = 0x0040ff,miceCollision = false,groundCollision = false,dynamic = false})
	end
	if active == 88 then
		showCommand(active,text.seq7)
		tfm.exec.setGameTime(10)
	end
	if active == 89 then
		xpos=math.random(100,700)
		showCommand(active,text.nquadrado)
		tfm.exec.setGameTime(6)
		setAllAlive()
		whiteSquare(xpos)
	end
	if active == 90 then
		showCommand(active,text.balloon)
		tfm.exec.setGameTime(12)
		setAllAlive()
		balloonParty()
	end
	if active == 91 then
		showCommand(active,text.light)
		tfm.exec.setGameTime(10)
		setAllAlive()
		setAllNightMode()
	end
	if active == 92 then
		showCommand(active,text.preesquerda100)
		tfm.exec.setGameTime(18)
	end
	if active == 93 then
		showCommand(active,text.predireita100)
		tfm.exec.setGameTime(18)
	end
	if active == 94 then
		showCommand(active,text.collect)
		tfm.exec.setGameTime(7)
		setAllAlive()
		for i=1,4 do
			tfm.exec.addPhysicObject(i, math.random(50,750), 50, acidb)
		end
	end
	if active == 95 then
		showCommand(active,text.collect)
		tfm.exec.setGameTime(9)
		setAllAlive()
		for i=1,8 do
			tfm.exec.addPhysicObject(i, math.random(50,750), 50, acidb)
		end
	end
	if active == 96 then
		showCommand(active,text.lava1)
		tfm.exec.setGameTime(11)
		setAllAlive()
	end
	if active == 97 then
		showCommand(active,text.collect)
		tfm.exec.setGameTime(7)
		setAllAlive()
		setAllNightMode()
		for i=1,8 do
			tfm.exec.addPhysicObject(i, math.random(50,750), 50, acidb)
		end
	end
	if active == 98 then
		showCommand(active,text.creator)
		tfm.exec.setGameTime(5)
	end
	if active == 99 then
		showCommand(active,text.seq8)
		tfm.exec.setGameTime(10)
	end
	if active == 100 then
		showCommand(active,text.apple)
		tfm.exec.setGameTime(5)
		setAllAlive()
		for i=1,15 do
			tfm.exec.addShamanObject(39,i*50,64,0,0,0,false)
		end
	end
	if active == 101 then
		showCommand(active,text.ndurma)
		tfm.exec.setGameTime(8)
		setAllAlive()
	end
	if active == 102 then
		showCommand(active,text.move)
		tfm.exec.setGameTime(5)
	end
	if active == 103 then
		showCommand(active,text.people)
		tfm.exec.setGameTime(7)
	end
	if active == 104 then
		showCommand(active,text.down2)
		tfm.exec.setGameTime(8)
	end
	if active == 105 then
		xpos=math.random(100,700)
		showCommand(active,text.quadrado)
		tfm.exec.setGameTime(7)
		setAllAlive()
		setAllNightMode()
		whiteSquare(xpos)
	end
	if active == 106 then
		showCommand(active,text.cn)
		tfm.exec.setGameTime(5)
		setAllAlive()
		for i=1,15 do
			tfm.exec.addShamanObject(17,i*50,64,0,0,0,false)
		end
	end
	if active == 107 then
		showCommand(active,text.lava)
		tfm.exec.setGameTime(7)
		setAllAlive()
		tfm.exec.addPhysicObject(2500, 700, 587, {type = 3,width = 3000,height = 860,foregound = true,friction = 0.0,restitution = 0.0,angle = 0,color = 0x0040ff,miceCollision = false,groundCollision = false,dynamic = false})
	end
	if active == 108 then
		showCommand(active,text.collect)
		tfm.exec.setGameTime(8)
		setAllAlive()
		for i=1,12 do
			tfm.exec.addPhysicObject(i, math.random(50,750), 50, acidb)
		end
	end
	if active == 109 then
		showCommand(active,text.seq9)
		tfm.exec.setGameTime(10)
	end
	if active == 110 then
		showCommand(active,text.fall)
		tfm.exec.setAieMode(true, 1)
		tfm.exec.setGameTime(10)
		setAllAlive()
	end
	if active == 111 then
		showCommand(active,text.collide)
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.setPlayerCollision(name, 2)
		end
		tfm.exec.setGameTime(12)
		setAllAlive()
	end
	if active == 112 then
		showCommand(active,text.emoji)
		tfm.exec.setGameTime(6)
	end
	if active == 113 then
		showCommand(active,text.seq10)
		tfm.exec.setGameTime(10)
	end
	if active == 114 then
		showCommand(active,text.vampires)
		tfm.exec.setGameTime(15)
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.setVampirePlayer(name, true)
		end
		setAllAlive()
	end
	if active == 115 then
		showCommand(active,text.meep)
		tfm.exec.setGameTime(18)
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.giveMeep(name, true)
		end
		setAllAlive()
	end
	if active == 116 then
		showCommand(active,text.lava3)
		tfm.exec.setGameTime(15)
		count=0
		setAllAlive()
	end
	if active == 117 then
		showCommand(active,text.seq11)
		tfm.exec.setGameTime(14)
	end
	if active == 118 then
		showCommand(active,text.seq12)
		tfm.exec.setGameTime(14)
	end
	if active == 119 then
		showCommand(active,text.ufo)
		tfm.exec.setGameTime(12)
		setAllAlive()
		tfm.exec.setWorldGravity(0, math.random(-12,-6))
	end
	if active == 120 then
		showCommand(active,text.portal)
		tfm.exec.setGameTime(24)
		setAllAlive()
		table.insert(grounds,tfm.exec.addShamanObject(2700, 400, 4054))
	end
	if active == 121 then
		showCommand(active,text.catch)
		tfm.exec.setGameTime(11)
		id=0
		x=math.random(150,650)
		y=math.random(120,320)
		for name,player in next,tfm.get.room.playerList do
			id=id+1
			tfm.exec.addBonus(0, x, y, id, 0, true, name)
		end
	end
	if active == 122 then
		showCommand(active,text.seq13)
		tfm.exec.setGameTime(16)
	end
	if active == 123 then
		showCommand(active,text.math2)
		tfm.exec.setGameTime(6)
	end
	if active == 124 then
		showCommand(active,text.emoji1)
		tfm.exec.setGameTime(9)
	end
	if active == 125 then
		showCommand(active,text.kills)
		tfm.exec.setGameTime(10)
	end
	if active == 126 then
		showCommand(active,text.raster)
		tfm.exec.setGameTime(13)
		setAllAlive()
		for i=1,4 do
			tfm.exec.addPhysicObject(i, 1200, -10+(92*i), laser)
		end
	end
	if active == 127 then
		showCommand(active,text.raster)
		tfm.exec.setGameTime(13)
		setAllAlive()
		for i=1,8 do
			tfm.exec.addPhysicObject(i, -100+(200*i), 400, laserv)
		end
	end
	if active == 128 then
		showCommand(active,text.raster)
		tfm.exec.setGameTime(14)
		setAllAlive()
		for i=1,4 do
			tfm.exec.addPhysicObject(i, 1200, -10+(92*i), laser)
		end
		for i=5,12 do
			tfm.exec.addPhysicObject(i, -100+(200*(i-4)), 400, laserv)
		end
	end
	if active == 129 then
		showCommand(active,text.space)
		tfm.exec.setGameTime(20)
		setAllAlive()
		ui.setBackgroundColor("#000000")
		tfm.exec.setWorldGravity(0,0)
	end
	if active == 130 then
		showCommand(active,text.jump3)
		tfm.exec.setGameTime(13)
	end
	if active == 131 then
		showCommand(active,text.spider1)
		tfm.exec.setGameTime(12)
		setAllAlive()
		tfm.exec.addPhysicObject(1, 1200, 600, cobweb)
	end
	if active == 132 then
		showCommand(active,text.emoji2)
		tfm.exec.setGameTime(9)
	end
	if active == 133 then
		showCommand(active,text.chicken)
		tfm.exec.setGameTime(5)
		setAllAlive()
		for i=1,48 do
			tfm.exec.addShamanObject(33,(i*40)-20,64,0,0,0,false)
		end
	end
	if active == 134 then
		showCommand(active,text.seq14)
		tfm.exec.setGameTime(13)
	end
	if active == 135 then
		showCommand(active,text.emoji3)
		tfm.exec.setGameTime(6)
	end
	if active == 136 then
		showCommand(active,text.ccr)
		tfm.exec.setGameTime(8)
		setAllAlive()
		for i=0,1 do
			table.insert(fire_id,tfm.exec.addImage("18756e3dce6.png","!1",800*i,206,name))
		end
	end
	if active == 137 then
		showCommand(active,text.seq15)
		tfm.exec.setGameTime(11)
	end
	if active == 138 then
		showCommand(active,text.lava4)
		tfm.exec.setGameTime(11)
		setAllAlive()
	end
	if active == 139 then
		showCommand(active,text.collect)
		tfm.exec.setGameTime(9)
		setAllAlive()
		for i=1,7 do
			tfm.exec.addPhysicObject(i, math.random(60,740), 50, acid2)
		end
	end
	if active == 140 then
		showCommand(active,text.nocheese)
		tfm.exec.setGameTime(10)
		setAllAlive()
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.playEmote(name, 2)
		end
	end
	if active == 141 then
		showCommand(active,text.portal)
		tfm.exec.setGameTime(24)
		setAllAlive()
		for name,player in next,tfm.get.room.playerList do
			tfm.exec.freezePlayer(name,true)
		end
		table.insert(grounds,tfm.exec.addShamanObject(2700, 400, 4054))
	end
	if active == 142 then
		showCommand(active,text.seq16)
		tfm.exec.setGameTime(11)
	end
	if active == 143 then
		showCommand(active,text.submitter)
		tfm.exec.setGameTime(11)
	end
	if active == 144 then
		showCommand(active,q)
		tfm.exec.setGameTime(qtime)
		setAllAlive()
	end
	if active == 145 then
		showCommand(active,q)
		tfm.exec.setGameTime(qtime)
	end
	if active == 146 then
		showCommand(active,q)
		tfm.exec.setGameTime(36000)
	end
end
function eventTextAreaCallback(id,name,callback)
	if callback == "show_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:hide_menu'><font size='18'>Menu",name,725,22,70,24,0x000001,0x000001,0.75,true)
		if verifyNinjas(name) == true or verifyAdmin(name) == true then
			ui.addTextArea(298,"<p align='center'><a href='event:help'>Help</a>\n<a href='event:credits'>Credits</a>\n<a href='event:skins'>Commands</a>",name,705,56,90,46,0x000001,0x000001,0.80,true)
		else
			ui.addTextArea(298,"<p align='center'><a href='event:help'>Help</a>\n<a href='event:credits'>Credits</a>\n",name,705,56,90,35,0x000001,0x000001,0.80,true)
		end
	end
	if callback == "hide_menu" then
		ui.addTextArea(299,"<p align='center'><a href='event:show_menu'><font size='18'>Menu",name,725,22,70,24,0x000001,0x000001,0.75,true)
		ui.removeTextArea(298,name)
	end
	if callback == "help" then
		eventChatCommand(name,"help")
	end
	if callback == "skins" then
		eventChatCommand(name,"cmd")
	end
	if callback == "credits" then
		eventChatCommand(name,"credits")
	end
	if callback == "close" then
		for _,i in next,{1000,1001,1002,1003,1004} do
			ui.removeTextArea(i,name)
		end
		data[name].opened=false
	end
	if callback == "command51" and active == 51 then
		completeCommand(name)
		ui.removeTextArea(250,name)
	end
	if callback == "pt" then
		for _,i in next,{2000,2001,2002,2003,2004} do
			ui.removeTextArea(i,nil)
		end
		ui.addPopup(0,0,"",nil,-2048,-2048,10,false)
		text = lang.br
		unlocked=true;
		tfm.exec.newGame(lobby_map)
		for name,player in next,tfm.get.room.playerList do
			eventNewPlayer(name)
		end
	end
	if callback == "en" then
		for _,i in next,{2000,2001,2002,2003,2004} do
			ui.removeTextArea(i,nil)
		end
		ui.addPopup(0,0,"",nil,-2048,-2048,10,false)
		text = lang.en
		unlocked=true;
		tfm.exec.newGame(lobby_map)
		for name,player in next,tfm.get.room.playerList do
			eventNewPlayer(name)
		end
	end
	if callback == "es" then
		for _,i in next,{2000,2001,2002,2003,2004} do
			ui.removeTextArea(i,nil)
		end
		ui.addPopup(0,0,"",nil,-2048,-2048,10,false)
		text = lang.es
		unlocked=true;
		tfm.exec.newGame(lobby_map)
		for name,player in next,tfm.get.room.playerList do
			eventNewPlayer(name)
		end
	end
	if callback == "pl" then
		for _,i in next,{2000,2001,2002,2003,2004} do
			ui.removeTextArea(i,nil)
		end
		ui.addPopup(0,0,"",nil,-2048,-2048,10,false)
		text = lang.pl
		unlocked=true;
		tfm.exec.newGame(lobby_map)
		for name,player in next,tfm.get.room.playerList do
			eventNewPlayer(name)
		end
	end
end
function eventChatMessage(name,message)
	if active == 11 then
		if string.len(message) >= 2 then
			completeCommand(name)
		end
	end
	if active == 12 then
		tfm.exec.killPlayer(name)
	end
	if active == 16 then
		if message == "2026" then
			completeCommand(name)
		elseif message == "2025" then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 29 then
		if string.upper(message) == string.upper(name) then
			completeCommand(name)
		end
	end
	if active == 41 then
		if string.find(string.upper(message),"K") or string.find(string.upper(message),"HA") or string.find(string.upper(message),"LMAO") or string.find(string.upper(message),"HI") or string.find(string.upper(message),"HE") or string.find(string.upper(message),"JA")  then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 43 then
		if string.upper(message) == "EU SOU NOOB" or string.upper(message) == "I AM A NOOB" or string.upper(message) == "YO SOY NOOB" then
			completeCommand(name)
		end
		if string.find(string.upper(message),string.upper("PRO")) then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 47 or active == 72 or active == 85 then
		if message == number then
			completeCommand(name)
		end
	end
	if active == 59 then
		if string.find(string.upper(message),"BUA") or string.find(string.upper(message),"BUÁ") or string.find(message,":(") then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 60 then
		if message == "2" then
			completeCommand(name)
		elseif message == "3" then
			tfm.exec.killPlayer(name)
		elseif message == "11" then
			tfm.exec.killPlayer(name)
		elseif message == "22" then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 73 then
		if tostring(message) == tostring(rato) then
			completeCommand(name)
		end
	end
	if active == 74 then
		if tostring(message) == tostring(vivo) then
			completeCommand(name)
		end
	end
	if active == 76 then
		if string.upper(message) == "ATELIER801" or string.upper(message) == "ATELIER 801" then
			completeCommand(name)
		end
	end
	if active == 77 then
		if message == "4" then
			completeCommand(name)
		elseif message == "22" then
			tfm.exec.killPlayer(name)
		elseif message == "3" then
			tfm.exec.killPlayer(name)
		elseif message == "5" then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 101 then
		if string.find(string.upper(message),"ZZ") then
			tfm.exec.killPlayer(name)
		end
		if string.upper(message) == "Z" then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 103 then
		if message == "0" then
			completeCommand(name)
		end
	end
	if active == 123 then
		if message == "-1" then
			completeCommand(name)
		elseif message == "7" then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 143 then
		if string.upper(message) == string.upper(maker) then
			completeCommand(name)
		end
	end
	if active == 145 then
		if string.upper(message) == string.upper(a) then
			completeCommand(name)
		end
	end
end
function eventEmotePlayed(name,id)
	if active == 1 then
		if id == 0 or id == 10 then
			completeCommand(name)
		end
	end
	if active == 2 then
		if id == 8 then
			completeCommand(name)
		end
	end
	if active == 3 then
		if id == 9 then
			addCommandCount(name)
			if data[name].s >= 5 then
				completeCommand(name)
			end
		end
	end
	if active == 5 then
		if id == 3 then
			addCommandCount(name)
			if data[name].s >= 10 then
				completeCommand(name)
			end
		end
	end
	if active == 6 then
		if id == 6 then
			completeCommand(name)
		end
	end
	if active == 7 then
		if id == 4 then
			completeCommand(name)
		end
	end
	if active == 8 then
		if id == 2 then
			completeCommand(name)
		end
	end
	if active == 14 or active == 53 or active == 58 then
		tfm.exec.killPlayer(name)
	end
	if active == 15 then
		if id == 10 then
			completeCommand(name)
		end
	end
	if active == 30 then
		if id == 0 or id == 10 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 36 then
		completeCommand(name)
	end
	if active == 37 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 8 and data[name].s == 1 then
			completeCommand(name)
		end
	end
	if active == 39 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 8 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 6 and data[name].s == 2 then
			completeCommand(name)
		end
	end
	if active == 40 then
		if id == 1 then
			completeCommand(name)
		end
	end
	if active == 41 then
		if id == 1 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 44 then
		if id == 2 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 1 and data[name].s == 1 then
			completeCommand(name)
		end
	end
	if active == 50 then
		if id == 3 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 2 and data[name].s == 1 then
			completeCommand(name)
		end
	end
	if active == 54 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 6 and data[name].s == 1 then
			completeCommand(name)
		end
	end
	if active == 56 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 2 and data[name].s == 1 then
			completeCommand(name)
		end
	end
	if active == 59 then
		if id == 2 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 61 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 8 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 6 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 5 and data[name].s == 3 then
			completeCommand(name)
		end
	end
	if active == 67 then
		if id == 5 then
			addCommandCount(name)
			if data[name].s >= 5 then
				completeCommand(name)
			end
		end
	end
	if active == 75 then
		if id == 7 then
			addCommandCount(name)
			if data[name].s >= 5 then
				completeCommand(name)
			end
		end
	end
	if active == 78 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 5 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 1 and data[name].s == 2 then
			completeCommand(name)
		end
	end
	if active == 88 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 3 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 4 and data[name].s == 2 then
			completeCommand(name)
		end
	end
	if active == 99 then
		if id == 3 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 6 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 2 and data[name].s == 2 then
			completeCommand(name)
		end
	end
	if active == 101 then
		if id == 6 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 109 then
		if id == 6 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 9 and data[name].s == 2 then
			completeCommand(name)
		end			
	end
	if active == 113 then
		if id == 3 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 9 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 0 and data[name].s == 2 then
			completeCommand(name)
		end
	end
	if active == 117 then
		if id == 1 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 0 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 6 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 2 and data[name].s == 3 then
			data[name].s=4
		end
		if id == 7 and data[name].s == 4 then
			completeCommand(name)
		end
	end
	if active == 118 then
		if id == 4 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 8 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 9 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 0 and data[name].s == 3 then
			data[name].s=4
		end
		if id == 8 and data[name].s == 4 then
			completeCommand(name)
		end
	end
	if active == 122 then
		if id == 0 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 8 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 6 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 1 and data[name].s == 3 then
			data[name].s=4
		end
		if id == 2 and data[name].s == 4 then
			data[name].s=5
		end
		if id == 3 and data[name].s == 5 then
			data[name].s=6
		end
	end
	if active == 134 then
		if id == 8 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 2 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 3 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 0 and data[name].s == 3 then
			data[name].s=4
		end
	end
	if active == 137 then
		if id == 5 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 4 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 0 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 6 and data[name].s == 3 then
			data[name].s=4
		end
	end
	if active == 142 then
		if id == 2 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 9 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 6 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 2 and data[name].s == 3 then
			data[name].s=4
		end
		if id == 0 and data[name].s == 4 then
			data[name].s=5
		end
		if id == 9 and data[name].s == 5 then
			completeCommand(name)
		end
	end
end
function eventPlayerWon(name)
	if vivo >= 2 then
		vivo=vivo-1
	end
end
function eventMouse(name,x,y)
	if active == 4 then
		data[name].count=data[name].count+1
		addCommandCount(name)
		if data[name].s >= 10 then
			completeCommand(name)
		end
	end
end
function eventKeyboard(name,id,down,x,y)
	if active >= 1 and data[name] then
		if id == 0 or id == 1 or id == 2 or id == 3 then
			data[name].count=data[name].count+1
		end
	end
	if active == 9 then
		if id == 37 or id == 65 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 10 then
		if id == 39 or id == 68 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 13 then
		if id == 38 or id == 87 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 14 then
		tfm.exec.killPlayer(name)
	end
	if active == 24 then
		if id == 37 or id == 65 then
			checkKeys(name,id)
			addCommandCount(name)
			if data[name].s >= 30 then
				completeCommand(name)
			end
		end
	end
	if active == 25 then
		if id == 39 or id == 68 then
			checkKeys(name,id)
			addCommandCount(name)
			if data[name].s >= 30 then
				completeCommand(name)
			end
		end
	end
	if active == 26 then
		if id == 37 or id == 65 then
			checkKeys(name,id)
			addCommandCount(name)
			if data[name].s >= 60 then
				completeCommand(name)
			end
		end
	end
	if active == 27 then
		if id == 2 then
			checkKeys(name,id)
			addCommandCount(name)
			if data[name].s >= 60 then
				completeCommand(name)
			end
		end
	end
	if active == 28 then
		if id == 39 or id == 68 then
			addCommandCount(name)
			if data[name].s >= 20 then
				completeCommand(name)
			end
		end
	end
	if active == 35 then
		if id == 40 or id == 83 then
			completeCommand(name)
		end
	end
	if active == 38 then
		if id == 40 or id == 83 then
			tfm.exec.killPlayer(name)
		end
	end
	if active == 45 then
		if id == 38 or id == 87 then
			completeCommand(name)
		end
	end
	if active == 48 then
		completeCommand(name)
	end
	if active == 49 then
		if id == 38 or id == 87 then
			addCommandCount(name)
			if data[name].s >= 5 then
				completeCommand(name)
			end
		end
	end
	if active == 55 then
		if id == 40 or id == 83 then
			addCommandCount(name)
			if data[name].s >= 3 then
				completeCommand(name)
			end
		end
	end
	if active == 63 then
		if id == 115 then
			completeCommand(name)
		end
	end
	if active == 65 then
		if id == 0 then
			addCommandCount(name)
			if data[name].s >= 15 then
				completeCommand(name)
			end
		end
	end
	if active == 66 then
		if id == 2 then
			addCommandCount(name)
			if data[name].s >= 15 then
				completeCommand(name)
			end
		end
	end
	if active == 83 then
		if id == 20 then
			addCommandCount(name)
			if data[name].s >= 10 then
				completeCommand(name)
			end
		end
	end
	if active == 92 then
		if id == 37 or id == 65 then
			checkKeys(name,id)
			addCommandCount(name)
			if data[name].s >= 100 then
				completeCommand(name)
			end
		end
	end
	if active == 93 then
		if id == 39 or id == 68 then
			checkKeys(name,id)
			addCommandCount(name)
			if data[name].s >= 100 then
				completeCommand(name)
			end
		end
	end
	if active == 98 then
		if id == 121 then
			completeCommand(name)
		end
	end
	if active == 102 then
		if id >= 0 and id <= 3 then
			completeCommand(name)
		end
	end
	if active == 104 then
		if id == 40 or id == 83 then
			addCommandCount(name)
			if data[name].s >= 10 then
				completeCommand(name)
			end
		end
	end
	if active == 109 then
		if id == 38 or id == 87 then
			if data[name].s == 1 then
				data[name].s=2
			end
		end
	end
	if active == 112 then
		if id >= 48 and id <= 57 then
			completeCommand(name)
		end
	end
	if active == 114 then
		if id == 32 then
			if tfm.get.room.playerList[name].isVampire == true then
				tfm.exec.movePlayer(name,0,0,true,0,-48,false)
			end
		end
	end
	if active == 122 then
		if id == 38 or id == 87 then
			if data[name].s == 6 then
				completeCommand(name)
			end
		end
	end
	if active == 124 then
		if id == 49 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 52 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 55 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 53 and data[name].s == 3 then
			data[name].s=4
		end
		if id == 57 and data[name].s == 4 then
			data[name].s=5
		end
		if id == 50 and data[name].s == 5 then
			data[name].s=6
		end
		if id == 56 and data[name].s == 6 then
			data[name].s=7
		end
		if id == 54 and data[name].s == 7 then
			completeCommand(name)
		end
	end
	if active == 130 then
		if id == 38 or id == 87 then
			addCommandCount(name)
			if data[name].s >= 15 then
				completeCommand(name)
			end
		end
	end
	if active == 132 then
		if id == 53 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 57 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 54 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 49 and data[name].s == 3 then
			data[name].s=4
		end
		if id == 55 and data[name].s == 4 then
			data[name].s=5
		end
		if id == 51 and data[name].s == 5 then
			data[name].s=6
		end
		if id == 52 and data[name].s == 6 then
			data[name].s=7
		end
		if id == 56 and data[name].s == 7 then
			completeCommand(name)
		end
	end
	if active == 134 or active == 137 then
		if id == 40 or id == 83 then
			if data[name].s == 4 then
				completeCommand(name)
			end
		end
	end
	if active == 135 then
		if id == 55 and data[name].s == 0 then
			data[name].s=1
		end
		if id == 50 and data[name].s == 1 then
			data[name].s=2
		end
		if id == 56 and data[name].s == 2 then
			data[name].s=3
		end
		if id == 51 and data[name].s == 3 then
			data[name].s=4
		end
		if id == 54 and data[name].s == 4 then
			completeCommand(name)
		end
	end
	if active == 141 then
		if id >= 48 and id <= 57 then
			tfm.exec.killPlayer(name)
		end
	end
end
function eventLoop(passado,faltando)
	if unlocked == true then
		local tempo=math.floor(faltando/1000)
		if active == -2 and testmode == false then
			ui.setMapName("<N>"..text.mices.."   <G>|   <J><b>"..text.version.." 7.31 Final-hotfix</b><")
		elseif active == -2 and testmode == true then
			ui.setMapName("<N>"..text.mices2.."   <G>|   <J><b>"..text.version.." 7.31 Final-hotfix</b><")
		elseif active == -1 and vivo >= 1 then
			ui.setMapName("<VP>"..text.fim.."<b>"..tempo.."</b> "..text.segundos.."   <G>|   <J><b>"..text.version.." 7.31 Final-hotfix</b><")
		elseif active == -1 and vivo <= 0 then
			ui.setMapName("<N>"..text.dofim.."<b>"..tempo.."</b> "..text.segundos.."   <G>|   <J><b>"..text.version.." 7.31 Final-hotfix</b><")
		elseif active >= 0 then
			ui.setMapName(""..text.mestre.."   <G>|   <N>"..text.map.." : <V>"..tfm.get.room.currentMap.."   <G>|   <N>"..text.mice.." : <V>"..vivo.." / "..rato.."   <G>|   <N>"..text.round.." : <V>"..rodada.."   <G>|   <J><b>"..text.version.." 7.31 Final-hotfix</b><")
		end
		if testmode == true then
			if rato < 2 then
				if tfm.get.room.currentMap == lobby_map then
					active=-2
					tfm.exec.setGameTime(8000)
				else
					if passado > 5000 then
						tfm.exec.newGame(lobby_map)
						tfm.exec.setGameTime(8000)
						showMessage("<R>"..text.mices.."",nil)
					end
				end
			end
			if rato >= 2 and passado >= 15000 then
				if tfm.get.room.currentMap == lobby_map then
					tfm.exec.newGame(mapas[math.random(#mapas)],nil)
				end
			end
		else
			if rato < 4 then
				if tfm.get.room.currentMap == lobby_map then
					active=-2
					tfm.exec.setGameTime(8000)
				else
					if passado > 5000 then
						tfm.exec.newGame(lobby_map)
						tfm.exec.setGameTime(8000)
						showMessage("<R>"..text.mices.."",nil)
					end
				end
			end
			if rato >= 4 and passado >= 15000 then
				if tfm.get.room.currentMap == lobby_map then
					tfm.exec.newGame(mapas[math.random(#mapas)],nil)
				end
			end
		end
		if active < 0 and faltando <= 1000 and faltando >= 400 then
			tfm.exec.newGame(mapas[math.random(#mapas)])
		end
		if active == 96 and tempo == 6 then
			active=666
			showCommand(active,text.lava2)
			tfm.exec.setGameTime(8)
			tfm.exec.addPhysicObject(667, 1200, 360, acids)
			tfm.exec.addPhysicObject(666, 1200, 350, lava)
		end
		if active == 116 and tempo <= 15 and tempo >= 9 then
			count=count+1
			table.insert(grounds,tfm.exec.addPhysicObject(count, 800, 405-count*10, upacid))
		end
		if active == 120 or active == 141 then
			if tempo % 2 == 0 and tempo >= 2 then
				tfm.exec.removeObject(pid)
				pid=tfm.exec.addShamanObject(2600,math.random(40,760),math.random(50,350))
			end
		end
		if active == 126 and tempo == 9 then
			for i=1,4 do
				tfm.exec.removePhysicObject(i)
			end
			for i=1,4 do
				tfm.exec.addPhysicObject(i, 1200, -10+(92*i), acids2)
			end
		end
		if active == 127 and tempo == 9 then
			for i=1,8 do
				tfm.exec.removePhysicObject(i)
			end
			for i=1,8 do
				tfm.exec.addPhysicObject(i, -100+(200*i), 400, acids3)
			end
		end
		if active == 128 and tempo == 9 then
			for i=1,12 do
				tfm.exec.removePhysicObject(i)
			end
			for i=1,4 do
				tfm.exec.addPhysicObject(i, 1200, -10+(92*i), acids2)
			end
			for i=5,12 do
				tfm.exec.addPhysicObject(i, -100+(200*(i-4)), 400, acids3)
			end
		end
		if active == 138 and tempo == 6 then
			active=666
			showCommand(active,text.lava4)
			tfm.exec.setGameTime(8)
			tfm.exec.addPhysicObject(666, 1200, 330, gelo)
		end
		if active == 0 and faltando < 4000 then
			if rodada < rodadas then
				sortearComandos()
			else
				active=-1
				tfm.exec.setGameTime(10)
			end
		end
		if active > 0 and faltando < 1 and rato >= 2 then
			if active == 17 then
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].isFacingRight == true then
						tfm.exec.killPlayer(name)
					end
				end
			end
			if active == 18 then
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].isFacingRight == false then
						tfm.exec.killPlayer(name)
					end
				end
			end
			if active == 19 or active == 31 or active == 32 or active == 57 or active == 64 or active == 105 then
				for name,player in next,tfm.get.room.playerList do
					if player.y < 300 then
						tfm.exec.killPlayer(name)
					else
						if player.x < xpos-10 or player.x > xpos+90 then
							tfm.exec.killPlayer(name)
						end
					end
				end
			end
			if active == 32 then
				for name,player in next,tfm.get.room.playerList do
					if player.y < 300 then
						tfm.exec.killPlayer(name)
					else
						if player.x < xpos-10 or player.x > xpos+90 then
							tfm.exec.killPlayer(name)
						end
					end
				end
			end
			if active == 20 or active == 33 or active == 34 then
				for name,player in next,tfm.get.room.playerList do
					if player.x < xpos or player.x > xpos+80 then
						tfm.exec.killPlayer(name)
					end
				end
			end
			if active == 21 or active == 46 or active == 80 then
				for name,player in next,tfm.get.room.playerList do
					if player.x > xpos and player.x < xpos+80 then
						tfm.exec.killPlayer(name)
					end
				end
			end
			if active == 22 then
				for name,player in next,tfm.get.room.playerList do
					if player.y < ypos-10 or player.y > ypos+70 then
						tfm.exec.killPlayer(name)
					end
				end
			end
			if active == 23 then
				for name,player in next,tfm.get.room.playerList do
					if player.y > ypos-10 and player.y < ypos+70 then
						tfm.exec.killPlayer(name)
					end
				end
			end
			if active == 53 or active == 141 then
				for name,player in next,tfm.get.room.playerList do
					tfm.exec.freezePlayer(name,false)
				end
			end
			if active == 82 then
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].cheeses == 1 then
						tfm.exec.killPlayer(name)
					end
				end
			end
			if active == 86 then
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].y <= 147 then
						tfm.exec.killPlayer(name)
					end
				end
			end
			if active == 87 or active == 107 then
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].y >= 158 then
						tfm.exec.killPlayer(name)
					end
				end
			end
			if active == 89 then
				for name,player in next,tfm.get.room.playerList do
					if player.y > 285 then
						if player.x > xpos-10 and player.x < xpos+90 then
							tfm.exec.killPlayer(name)
						end
					end
				end
			end
			if active == 90 then
				for name,player in next,tfm.get.room.playerList do
					if tfm.get.room.playerList[name].isDead == false then
						tfm.exec.attachBalloon(name, false)
					end
				end
			end
			if active == 110 then
				tfm.exec.setAieMode(false)
			end
			if active == 111 then
				for name,player in next,tfm.get.room.playerList do
					tfm.exec.setPlayerCollision(name, 1)
				end
			end
			if active == 114 then
				for name,player in next,tfm.get.room.playerList do
					tfm.exec.setVampirePlayer(name, false)
				end
			end
			if active == 115 then
				for name,player in next,tfm.get.room.playerList do
					tfm.exec.giveMeep(name, false)
				end
			end
			if active == 116 then
				for _,i in next,grounds do
					tfm.exec.removePhysicObject(i)
				end
				grounds={}
			end
			if active == 120 or active == 141 then
				tfm.exec.removeObject(pid)
				pid=tfm.exec.addShamanObject(2600,400,-4054)
			end
			if active == 121 then
				for i=0,100 do
					tfm.exec.removeBonus(id)
				end
			end
			if active == 129 then
				ui.setBackgroundColor("#6a7495")
				tfm.exec.setWorldGravity(0,10)
			end
			if active == 136 then
				for name,player in next,tfm.get.room.playerList do
					if player.y > 285 then
						if player.x > 0 and player.x < 1600 then
							tfm.exec.killPlayer(name)
						end
					end
				end
			end
			for i=0,2 do
				ui.removeTextArea(i,nil)
			end
			ui.removeTextArea(250,nil)
			tfm.exec.removeObject(pid)
			tfm.exec.setWorldGravity(0, 10)
			tfm.exec.removePhysicObject(666)
			tfm.exec.removePhysicObject(667)
			tfm.exec.removePhysicObject(2500)
			for i=1,12 do
				tfm.exec.removePhysicObject(i)
			end
			for i=1,15 do
				tfm.exec.removeBonus(i)
			end
			if rawlen(fire_id) >= 1 then
				for i=1,2 do
					tfm.exec.removeImage(fire_id[i])
				end
			end
			fire_id={}
			active=0
			if rodada == 3 or rodada == 6 or rodada == 9 or rodada == 12 or rodada == 15 or rodada == 18 then
				dificuldade=dificuldade+1
			end
			for name,player in next,tfm.get.room.playerList do
				ui.removeTextArea(24,nil)
				if data[name] and data[name].c == 0 then
					tfm.exec.killPlayer(name)
				end
				if data[name] then
					data[name].k=0
				end
				tfm.exec.setNameColor(name,0xc2c2da)
				tfm.exec.setPlayerNightMode(false, name)
			end
			if vivo > 5 then
				tfm.exec.setGameTime(14-dificuldade)
			else
				tfm.exec.setGameTime(12-dificuldade)
			end
			getAlives()
		end
	end
end
if tfm.get.room.isTribeHouse == false then
	if tfm.get.room.community == "br" or tfm.get.room.community == "pt" then
		text = lang.br
	elseif tfm.get.room.community == "es" then
		text = lang.es
	elseif tfm.get.room.community == "pl" then
		text = lang.pl
	else
		text = lang.en
	end
	unlocked=true;
	tfm.exec.newGame(lobby_map)
	for name,player in next,tfm.get.room.playerList do
		eventNewPlayer(name)
	end
else
	selectLanguage()
end
generateCmdsList();
