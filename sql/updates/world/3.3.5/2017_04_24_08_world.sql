-- 
DELETE FROM `gossip_menu` WHERE `entry`=7192 AND `text_id`=8473;
DELETE FROM `gossip_menu` WHERE `entry`=7194 AND `text_id`=8475;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `VerifiedBuild`) VALUES
(7192, 8473, 0),
(7194, 8475, 0);

DELETE FROM `npc_text` WHERE `ID`=8473;
INSERT INTO `npc_text` (`ID`, `text0_1`, `BroadcastTextID0`) VALUES
(8473, "Thanks for getting that ore and taking it to Magister Quallestis, $c. I suppose that I should head back, but I'm afraid of the punishment I'm going to receive because I couldn't get the ore myself.$B$BDon't tell the magister, ok?", 12182);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup` IN (7192, 7194);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `comment`) VALUES
(14, 7192, 8472, 0, 0, 8, 0, 9207, 0, 0, 1, 0, 0, "", "Gossip text requires quest Underlight Ore Samples NOT rewarded"),
(14, 7192, 8473, 0, 0, 8, 0, 9207, 0, 0, 0, 0, 0, "", "Gossip text requires quest Underlight Ore Samples rewarded"),
(14, 7194, 8474, 0, 0, 8, 0, 9207, 0, 0, 1, 0, 0, "", "Gossip text requires quest Underlight Ore Samples NOT rewarded"),
(14, 7194, 8475, 0, 0, 8, 0, 9207, 0, 0, 0, 0, 0, "", "Gossip text requires quest Underlight Ore Samples rewarded");

UPDATE `quest_offer_reward` SET `RewardText`="My apprentice was unable to take care of this herself?  I shall have a word with her when she returns then, gnolls or not.  Speaking of which, why didn't she return with you?$B$B<The magister sighs.>$B$BThat one is a handful, and is going to be quite a challenge to properly train.  Thank you, for bringing these samples to me.  We are hoping that we can uncover some special property from them that will help in the fight against the Scourge.$B$BPlease take this coin as a token of my appreciation." WHERE `ID`=9207;
