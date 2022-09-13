INSERT INTO mapa (nome) VALUES ('Mapa');

INSERT INTO regiao (idmapa, nome, vip_check) VALUES 
(1, 'Venore', DEFAULT), 
(1, 'Jakundaf Desert', DEFAULT), 
(1, 'Outlaw Camp', DEFAULT),
(1, 'Plains of Havoc', DEFAULT),
(1, 'Feyrist Mountains', true);

INSERT INTO localizacao (posicao_x, posicao_y, posicao_z, id_regiao) VALUES 
(8, 10, 0, 1), 
(8, 11, 0, 1), 
(8, 12, 0, 1), 
(8, 8, 0, 1), 
(8, 9, 0, 1), 
(9, 10, 0, 1), 
(9, 11, 0, 1), 
(9, 12, 0, 1), 
(9, 8, 0, 1), 
(9, 9, 0, 1), 
(10, 10, 0, 1), 
(10, 11, 0, 1), 
(10, 12, 0, 1), 
(10, 9, 0, 1), 
(10, 8, 0, 1), 
(11, 10, 0, 1), 
(11, 11, 0, 1), 
(11, 12, 0, 1), 
(11, 9, 0, 1), 
(11, 8, 0, 1),
(12, 10, 0, 1), 
(12, 11, 0, 1), 
(12, 12, 0, 1), 
(12, 9, 0, 1), 
(12, 8, 0, 1),

(8, 10, 0, 2), 
(8, 11, 0, 2), 
(8, 12, 0, 2), 
(8, 8, 0, 2), 
(8, 9, 0, 2), 
(9, 10, 0, 2), 
(9, 11, 0, 2), 
(9, 12, 0, 2), 
(9, 8, 0, 2), 
(9, 9, 0, 2), 
(10, 10, 0, 2), 
(10, 11, 0, 2), 
(10, 12, 0, 2), 
(10, 9, 0, 2), 
(10, 8, 0, 2), 
(11, 10, 0, 2), 
(11, 11, 0, 2), 
(11, 12, 0, 2), 
(11, 9, 0, 2), 
(11, 8, 0, 2),
(12, 10, 0, 2), 
(12, 11, 0, 2), 
(12, 12, 0, 2), 
(12, 9, 0, 2), 
(12, 8, 0, 2),

(8, 10, 0, 3), 
(8, 11, 0, 3), 
(8, 12, 0, 3), 
(8, 8, 0, 3), 
(8, 9, 0, 3), 
(9, 10, 0, 3), 
(9, 11, 0, 3), 
(9, 12, 0, 3), 
(9, 8, 0, 3), 
(9, 9, 0, 3), 
(10, 10, 0, 3), 
(10, 11, 0, 3), 
(10, 12, 0, 3), 
(10, 9, 0, 3), 
(10, 8, 0, 3), 
(11, 10, 0, 3), 
(11, 11, 0, 3), 
(11, 12, 0, 3), 
(11, 9, 0, 3), 
(11, 8, 0, 3),
(12, 10, 0, 3), 
(12, 11, 0, 3), 
(12, 12, 0, 3), 
(12, 9, 0, 3), 
(12, 8, 0, 3),

(8, 10, 0, 4), 
(8, 11, 0, 4), 
(8, 12, 0, 4), 
(8, 8, 0, 4), 
(8, 9, 0, 4), 
(9, 10, 0, 4), 
(9, 11, 0, 4), 
(9, 12, 0, 4), 
(9, 8, 0, 4), 
(9, 9, 0, 4), 
(10, 10, 0, 4), 
(10, 11, 0, 4), 
(10, 12, 0, 4), 
(10, 9, 0, 4), 
(10, 8, 0, 4), 
(11, 10, 0, 4), 
(11, 11, 0, 4), 
(11, 12, 0, 4), 
(11, 9, 0, 4), 
(11, 8, 0, 4),
(12, 10, 0, 4), 
(12, 11, 0, 4), 
(12, 12, 0, 4), 
(12, 9, 0, 4), 
(12, 8, 0, 4),

(8, 10, 0, 5), 
(8, 11, 0, 5), 
(8, 12, 0, 5), 
(8, 8, 0, 5), 
(8, 9, 0, 5), 
(9, 10, 0, 5), 
(9, 11, 0, 5), 
(9, 12, 0, 5), 
(9, 8, 0, 5), 
(9, 9, 0, 5), 
(10, 10, 0, 5), 
(10, 11, 0, 5), 
(10, 12, 0, 5), 
(10, 9, 0, 5), 
(10, 8, 0, 5), 
(11, 10, 0, 5), 
(11, 11, 0, 5), 
(11, 12, 0, 5), 
(11, 9, 0, 5), 
(11, 8, 0, 5),
(12, 10, 0, 5), 
(12, 11, 0, 5), 
(12, 12, 0, 5), 
(12, 9, 0, 5), 
(12, 8, 0, 5);


INSERT INTO conta (senha, vip_dias, email, nome, localidade, banimento, data_de_criacao, data_de_aniversario, genero) VALUES
('12345678' , 0, 'lucas.araujo@email.com', 'Lucas Araujo', 'Brasil', DEFAULT, '26/07/2022', '18/02/1990' , 'Masculino'), 
('87654321' , 0, 'felipe.souza@email.com', 'Felipe Souza', 'Brasil', DEFAULT, '26/07/2022', '21/05/1991' , 'Masculino'), 
('741852' , 30, 'jose.pedro@email.com', 'José Pedro', 'Brasil', DEFAULT, '27/07/2022', '11/03/1991' , 'Masculino'), 
('369258' , 0, 'fernanda.oliveira@email.com', 'Fernanda Oliveira', 'Brasil', DEFAULT, '27/07/2022', '22/11/1992' , 'Feminino'), 
('1592648' , 0, 'mariana.silva@email.com', 'Mariana Silva', 'Brasil', DEFAULT, '28/07/2022', '26/01/1992' , 'Feminino'), 
('951847623' , 30, 'larrisa.cristina@email.com', 'Larrisa Cristina', 'Brasil', DEFAULT, '28/07/2022', '01/02/1991' , 'Feminino');

INSERT INTO personagem (tipo, idlocalizacao) VALUES
('criatura', '11'), 
('criatura', '16'), 
('criatura', '21'), 
('criatura', '26'), 
('criatura', '31'), 
('criatura', '36'), 
('criatura', '41'), 
('criatura', '46'), 
('criatura', '51'), 
('criatura', '56'), 
('criatura', '61'), 
('criatura', '66'), 
('criatura', '71'),
('criatura', '76'),
('criatura', '81'),
('npc', '25'), 
('npc', '50'), 
('npc', '75'), 
('npc', '100'), 
('npc', '125'),
('player', '1'),
('player', '2'),
('player', '2'),
('player', '3'),
('player', '4'),
('player', '5');

INSERT INTO player (nome, vocacao, vida_maxima, vida_atual, mana_maxima, mana_atual, genero, experiencia, idpersonagem, data_de_criacao, id_conta) VALUES
('Druid Lcs', 'druida', 100, 100, 200, 200, 'masculino', 0, 21, '25/07/2022', 1),
('Fer Cavaleiro', 'cavaleiro', 150, 150, 100, 100, 'masculino', 0, 22, '25/07/2022', 2),
('Paladino Jose', 'paladino', 130, 130, 130, 130, 'masculino', 0, 23, '25/07/2022', 3),
('Feiticeira Fer', 'feiticeiro', 100, 100, 200, 200, 'feminino', 0, 24, '25/07/2022', 4),
('Mariana Cavaleira', 'cavaleiro', 150, 150, 100, 100, 'feminino', 0, 25, '25/07/2022', 5),
('Larrissa Druida', 'druida', 100, 100, 200, 200, 'feminino', 0, 26, '25/07/2022', 6);


INSERT INTO npc (nome, tipo, idpersonagem) VALUES
('Rashid', 'comerciante', 16),	
('Vega', 'comerciante', 17),	
('Travora', 'comerciante', 18),	
('Yasir', 'guia', 19),	
('Ashtamor', 'guia', 20);

INSERT INTO criatura (nome, ataque, vida, experiencia, defesa, tipo, idpersonagem) VALUES
('Badger', 2, 23, 5, 5, 'mamiferos', 1),
('Bat', 5, 30, 10, 8, 'mamiferos', 2),
('Bear', 12, 80, 23, 10, 'mamiferos', 3),
('Deer', 3, 24, 1, 6, 'mamiferos', 4),
('Elephant', 16, 320, 160, 15, 'mamiferos', 5),
('Gloom Wolf', 10, 200, 70, 9, 'mamiferos', 6),
('Lion', 13, 80, 30, 9, 'mamiferos', 7),
('Mammoth', 20, 320, 160, 17, 'mamiferos', 8),
('Polar Bear', 13, 85, 28, 11, 'mamiferos', 9),
('Tiger', 10, 75, 40, 10, 'mamiferos', 10),
('White Lion', 140, 2700, 2300, 120, 'mamiferos', 11),
('Winter Wolf', 12, 30, 20, 10, 'mamiferos', 12),
('Yeti', 100, 950, 460, 95, 'mamiferos', 13),
('Parder', 200, 950, 2900, 180, 'mamiferos', 14),
('Water Buffalo', 15, 390, 20, 15, 'mamiferos', 15);

INSERT INTO item (tipo) VALUES
('armas'),
('equipamento'),
('mochila'),
('riqueza');

INSERT INTO item (tipo) VALUES
('armas'),
('armas'),
('armas'),
('armas'),
('armas'),
('armas'),
('armas'),
('armas'),
('armas'),
('armas'),
('armas'),
('armas'),
('armas');

INSERT INTO item (tipo) VALUES
('mochila'),
('mochila'),
('mochila'),
('mochila');

INSERT INTO item (tipo) VALUES
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento'),
('equipamento');

INSERT INTO item (tipo) VALUES
('riqueza');

SELECT  armas.id, tipo, nome, ataque, defesa, vocacao, min_level, bonus, descricao, peso FROM item INNER JOIN armas ON item.id = armas.id;

INSERT INTO armas (id, nome, ataque, defesa, vocacao, min_level, bonus, descricao , peso) VALUES
(1, 'Axe', 12, 6, 'none', 0, 0,'Vocês está vendo Axe. Peso 40.', 40),
(5, 'Battle Axe', 25, 10, 'none', 0, 0,'Vocês está vendo Battle Axe. Peso 50.', 50),
(6, 'Daramian Axe', 17, 8, 'none', 0, 0,'Vocês está vendo Daramian Axe. Peso 41.', 41),
(7, 'Golden Axe', 10, 5, 'none', 0, 0,'Vocês está vendo Golden Axe. Peso 20.', 20),
(8, 'Hand Axe', 10, 5, 'none', 0, 0,'Vocês está vendo Hand Axe. Peso 18.', 18),

(9, 'Bone Sword', 13, 10, 'none', 0, 0,'Vocês está vendo Bone Sword. Peso 19.', 19),
(10, 'Carlin Sword', 15, 13, 'none', 0, 0,'Vocês está vendo Carlin Sword. Peso 40.', 40),
(11, 'Combat Knife', 8, 6, 'none', 0, 0,'Vocês está vendo Combat Knife. Peso 9.', 9),
(12, 'Broadsword', 26, 23, 'none', 0, 0,'Vocês está vendo Broadsword. Peso 52.', 52),
(13, 'Dagger', 8, 6, 'none', 0, 0,'Vocês está vendo Dagger. Peso 9.', 9),

(14, 'Assassin Star', 65, 0, 'none', 0, 0,'Vocês está vendo Assassin Star. Peso 2.', 2),
(15, 'Enchanted Spear', 38, 0, 'none', 0, 0,'Vocês está vendo Enchanted Spear. Peso 20.', 20),
(16, 'Glooth Spear', 55, 0, 'none', 0, 0,'Vocês está vendo Glooth Spear. Peso 26.', 26),
(17, 'Hunting Spear', 32, 0, 'none', 0, 0,'Vocês está vendo Hunting Spear. Peso 22.', 22),
(18, 'Small Stone', 5, 0, 'none', 0, 0,'Vocês está vendo Small Stone. Peso 9.', 9);

SELECT  mochila.id, tipo, nome, capacidade, min_level, descricao, peso FROM item INNER JOIN mochila ON item.id = mochila.id;


INSERT INTO mochila (id, nome, capacidade, min_level, bonus, descricao, peso) VALUES
(3, 'Bag', 8, 0, 'Vocês está vendo Bag. Peso 8.', 8),
(19, 'Beach Bag', 8, 0, 'Vocês está vendo Beach Bag. Peso 8.', 8),
(20, 'Golden Bag', 8, 0, 'Vocês está vendo Golden Bag. Peso 8.', 8),
(21, 'Backpack', 20, 0, 'Vocês está vendo Backpack. Peso 18.', 18),
(22, 'Beach Backpack', 20, 0, 'Vocês está vendo Beach Backpack. Peso 18.', 18);


SELECT  riqueza.id, tipo, nome, quantidade, min_level, bonus, descricao, peso FROM item INNER JOIN riqueza ON item.id = riqueza.id;

INSERT INTO riqueza (id, nome, quantidade, min_level, bonus, descricao, peso) VALUES
(4, 'Gold Coin', 1, 0, 0, 'Vocês está vendo Gold Coin. Peso 1.', 1),
(43, 'Bar of Gold', 1, 0, 0, 'Vocês está vendo Bar of Gold. Peso 1.', 1);


SELECT equipamento.id, tipo, nome, vocacao, min_level, bonus, descricao , peso, defesa, pch FROM item INNER JOIN equipamento ON item.id = equipamento.id;


INSERT INTO equipamento (id, nome, vocacao, min_level, bonus, descricao , peso, defesa, pch) VALUES
(2, 'Amazon Helmet', 'none', 0, 0, 'Você está vendo Amazon Helmet. Peso  29.', 29, 7, 'cabeca'),
(23, 'Ancient Tiara', 'none', 0, 0, 'Você está vendo Ancient Tiara. Peso  8.', 8, 0, 'cabeca'),
(24, 'Bandana', 'none', 0, 0, 'Você está vendo Bandana. Peso  8.', 8, 1, 'cabeca'),
(25, 'Blue Spectacles', 'none', 0, 0, 'Você está vendo Blue Spectacles. Peso  2.', 2, 0, 'cabeca'),
(26, 'Bonelord Helmet', 'none', 0, 0, 'Você está vendo Bonelord Helmet. Peso  46.', 46, 2, 'cabeca'),
(27, 'Brass Helmet', 'none', 0, 0, 'Você está vendo Brass Helmet. Peso  27.', 27, 3, 'cabeca'),

(28, 'Albino Plate', 'none', 0, 0, 'Você está vendo Albino Plate. Peso  84.', 84, 11, 'corpo'),
(29, 'Ball Gown', 'none', 0, 0, 'Você está vendo Ball Gown. Peso  25.', 25, 0, 'corpo'),
(30, 'Belted Cape', 'none', 0, 0, 'Você está vendo Belted Cape. Peso  35.', 35, 10, 'corpo'),
(31, 'Blue Robe', 'none', 0, 0, 'Você está vendo Blue Robe. Peso  22.', 22, 11, 'corpo'),
(32, 'Brass Armor', 'none', 0, 0, 'Você está vendo Brass Armor. Peso  80.', 80, 8, 'corpo'),

(33, 'Bast Skirt', 'none', 0, 0, 'Você está vendo Bast Skirt. Peso  0.', 0, 3, 'pernas'),
(34, 'Blue Legs', 'none', 0, 0, 'Você está vendo Blue Legs. Peso  18.', 18, 8, 'pernas'),
(35, 'Brass Legs', 'none', 0, 0, 'Você está vendo Brass Legs. Peso  38.', 38, 5, 'pernas'),
(36, 'Chain Legs', 'none', 0, 0, 'Você está vendo Blue Spectacles. Peso  35.', 35, 3, 'pernas'),
(37, 'Chocolatey Dragon Scale Legs', 'none', 0, 0, 'Você está vendo Chocolatey Dragon Scale Legs. Peso  18.', 18, 2, 'pernas'),

(38, 'Crocodile Boots', 'none', 0, 0, 'Você está vendo Crocodile Boots. Peso  9.', 9, 1, 'pes'),
(39, 'Leather Boots', 'none', 0, 0, 'Você está vendo Ball Gown. Peso  9.', 9, 1, 'pes'),
(40, 'Metal Spats', 'none', 0, 0, 'Você está vendo Belted Cape. Peso  18.', 18, 1, 'pes'),
(41, 'Zaoan Shoes', 'none', 0, 0, 'Você está vendo Blue Robe. Peso  7.', 7, 1, 'pes'),
(42, 'Badger Boots', 'none', 0, 0, 'Você está vendo Brass Armor. Peso  12.', 12, 1, 'pes');


INSERT INTO instancia_item (id_item) VALUES
(1), 
(1), 
(1), 
(1), 
(1), 
(1), 
(21), 
(21), 
(21), 
(21), 
(21), 
(21),
(2);


INSERT INTO inventario (look_corpo, look_cabeca, look_pernas, look_pes, look_costas, mao_dir, mao_esq, fonte_de_luz, capacidade, id_player) VALUES
(null, null, null, null, 7, 1, null, null, 410, 1),
(null, null, null, null, 8, 2, null, null, 410, 2),
(null, null, null, null, 9, 3, null, null, 410, 3),
(null, null, null, null, 10, 4, null, null, 410, 4),
(null, null, null, null, 11, 5, null, null, 410, 5),
(null, null, null, null, 12, 6, null, null, 410, 6);



INSERT INTO habilidades (player, velocidade, dano_a_distancia, dano_de_combate, capacidade, defesa_total, nivel_magia, nivel_espada, nivel_machado, nivel_defesa, nivel_punhos, nivel_porrete, nivel_armas_de_dist) VALUES
('Druid Lcs', 110, 5, 5, 10, 10, 1, 10, 10, 10, 10, 10, 10),
('Fer Cavaleiro', 110, 5, 5, 10, 10, 1, 10, 10, 10, 10, 10, 10),
('Paladino Jose', 110, 5, 5, 10, 10, 1, 10, 10, 10, 10, 10, 10),
('Feiticeira Fer', 110, 5, 5, 10, 10, 1, 10, 10, 10, 10, 10, 10),
('Mariana Cavaleira', 110, 5, 5, 10, 10, 1, 10, 10, 10, 10, 10, 10),
('Larrissa Druida', 110, 5, 5, 10, 10, 1, 10, 10, 10, 10, 10, 10);


INSERT INTO guilda (nome, descricao, capacidade, data_de_criacao, id_dono) VALUES
('Brs', 'Guilda montada para jogadores brasileiros', '20', '30/06/2022', 1);