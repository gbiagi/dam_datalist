-- Create the table
CREATE TABLE Items (
  id INTEGER PRIMARY KEY,
  Category TEXT,
  Name TEXT,
  Min_Agility INTEGER,
  Min_Strength INTEGER,
  Stab_Damage INTEGER NULL,
  Slash_Damage INTEGER NULL,
  Blunt_Damage INTEGER NULL,
  Defense INTEGER NULL,
  Charisma INTEGER NULL,
  Durability INTEGER NULL,
  Weight REAL,
  Price INTEGER,
  Imgpath TEXT,
  Description TEXT,
  Power INTEGER NULL
);

-- Insert data
INSERT INTO Items (id, Category, Name, Min_Agility, Min_Strength, Stab_Damage, Slash_Damage, Blunt_Damage, Defense, Charisma, Durability, Weight, Price, Imgpath, Description, Power)
VALUES
(1,'Axe','Bardiche',0,7,2,30,28,27,6,32,6,82,'./public/images/axe/Bardiche.png','A traditional tool that can also be used for combat. Compared to a sword, the axe has greater impact and is thus suited to the dealing with heavily armoured opponents. But it''s heavier and therefore slower and, above all, doesn''t give much cover, especially if the axe was originally intended for work and doesn''t have a metal-plated handle.',NULL),
(2,'Axe','Heavy battle axe',0,12,24,38,36,40,13,55,8,685,'./public/images/axe/Heavy_battle_axe.png','A proper axe for a proper fight! The weight of this axe guarantees that every blow will strike hard and even armoured knights will cower in fear from it; its massive size and metal-plated haft help block a foe''s attacks.',NULL),
(3,'Axe','Metal-plated battle axe',0,14,3,40,45,43,17,65,7,1540,'./public/images/Metal-plated_battle_axe.png','A battleaxe of the highest quality. The blade will endure many blows and cut through even strong plate armour, and the handle will take even the most powerful blows of enraged foes. Demands respect in all circumstances.',NULL),
(4,'Bow','Ash hunting bow',6,8,NULL,NULL,NULL,NULL,NULL,NULL,3,237,'./public/images/bow/AshHuntingBow.png','A bow with enough power to comfortably take down any game animal. And if it will fell a 200pound stag, a lightly armoured enemy doesn''t stand much chance against it.',57),
(5,'Bow','Cuman bow',6,13,NULL,NULL,NULL,NULL,NULL,NULL,3,400,'./public/images/CumanBow.png','The Cuman bow is quite short in length, making it more suitable for use on horseback. The recurve shape - double curve - compensates for the power loss of the shorter length',74),
(6,'Bow','Capon''s hunting bow',5,5,NULL,NULL,NULL,NULL,NULL,NULL,3,327,'./public/images/CaponsHuntingBow.png','A fine hunting bow you won in a wager against Lord Capon.',54),
(7,'Dagger','Dagger',0,1,0,0,0,0,5,1,1,15,'./public/images/dagger/Dagger.png','The dagger is the knife''s more dangerous cousin. Most of the time it''s used for slicing cheese or apples, because in combat it''s not much use against longer weapons. However, it comes in very handy if you need to creep up on someone and dispose of them without attracting attention.',NULL),
(8,'Longsword','Tusk',0,1,58,58,3,104,20,100,3.5,2664,'./public/images/longsword/Tusk.png','A bastard sword forged to be light and yet endure many blows without getting hurt.',NULL),
(9,'Longsword','Saving Grace',0,4,52,52,2,89,5,23,4.5,192,'./public/images/longsword/SavingGrace.png','Not every knight is born valiant and not every noble is born rich. But both must flaunt their social standing and sometimes their fighting skills too. This is the best longsword a nobleman who''s fallen on hard times can afford. A master swordsman can do great things with it, but in inexperienced hands it will quickly become dull, because the material of the blade is not the best.',NULL),
(10,'Longsword','Herod''s sword',0,10,45,75,3,108,15,72,3.5,1310,'./public/images/longsword/HerodsSword.png','An exclusive piece - a longsword with such a high-quality blade that is was named after the Biblical King Herod, who won infamy by beheading John the Baptist.',NULL),
(11,'Mace','Bailiff''s mace',0,10,2,2,61,30,14,55,4.5,1420,'./public/images/mace/Bailiffs_mace.png','A bailiff''s mace, an instrument of justice, capable of meting it out. Its heavy ornamented head demands respect, both on the battlefield and off of it.',NULL),
(12,'Mace','Heavy warhammer',0,10,25,2,54,38,11,50,6,2450,'./public/images/mace/Heavy_warhammer.png','A fully metal-plated war hammer that no armour can stop and which, in the hands of a strong warrior, demands respect on the battlefield and in times of peace.',NULL),
(13,'Mace','Spiked club',0,3,2,3,34,23,6,27,3,30,'./public/images/mace/Spiked_club.png','The spiked club is the poor man''s substitute for a mace. It''s lighter and can''t withstand much abuse, but unlike the mace it has spikes that can do damage the mace can''t. Like other types of bludgeon weapons, it''s not much use for defence and is therefore primarily used in combination with a one-handed shield.',NULL);
