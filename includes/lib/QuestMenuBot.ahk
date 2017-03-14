class QuestMenuBot {

  __new(theGeneralConfiguration, theQuestConfiguration, theDeploymentConfiguration, theDetector, theController, theBestQuestBattlePoints) {
    ; Episode 1 Quests
    ; ----------------
    this.QUEST_1_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_1_1.png"
    this.QUEST_1_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_1_2.png"
    this.QUEST_1_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_1_3.png"
    this.QUEST_1_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_1_4.png"
    this.QUEST_1_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_1_5.png"

    ; Episode 2 Quests
    ; ----------------
    this.QUEST_2_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_1.png"
    this.QUEST_2_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_2.png"
    this.QUEST_2_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_3.png"
    this.QUEST_2_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_4.png"
    this.QUEST_2_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_5.png"
    this.QUEST_2_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_6.png"
    this.QUEST_2_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_7.png"
    this.QUEST_2_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_8.png"
    this.QUEST_2_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_9.png"
    this.QUEST_2_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_2_10.png"

    ; Episode 3 Quests
    ; ----------------
    this.QUEST_3_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_1.png"
    this.QUEST_3_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_2.png"
    this.QUEST_3_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_3.png"
    this.QUEST_3_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_4.png"
    this.QUEST_3_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_5.png"
    this.QUEST_3_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_6.png"
    this.QUEST_3_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_7.png"
    this.QUEST_3_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_8.png"
    this.QUEST_3_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_9.png"
    this.QUEST_3_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_3_10.png"

    ; Episode 4 Quests
    ; ----------------
    this.QUEST_4_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_1.png"
    this.QUEST_4_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_2.png"
    this.QUEST_4_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_3.png"
    this.QUEST_4_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_4.png"
    this.QUEST_4_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_5.png"
    this.QUEST_4_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_6.png"
    this.QUEST_4_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_7.png"
    this.QUEST_4_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_8.png"
    this.QUEST_4_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_9.png"
    this.QUEST_4_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_4_10.png"

    ; Episode 5 Quests
    ; ----------------
    this.QUEST_5_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_1.png"
    this.QUEST_5_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_2.png"
    this.QUEST_5_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_3.png"
    this.QUEST_5_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_4.png"
    this.QUEST_5_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_5.png"
    this.QUEST_5_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_6.png"
    this.QUEST_5_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_7.png"
    this.QUEST_5_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_8.png"
    this.QUEST_5_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_9.png"
    this.QUEST_5_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_5_10.png"

    ; Episode 6 Quests
    ; ----------------
    this.QUEST_6_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_1.png"
    this.QUEST_6_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_2.png"
    this.QUEST_6_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_3.png"
    this.QUEST_6_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_4.png"
    this.QUEST_6_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_5.png"
    this.QUEST_6_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_6.png"
    this.QUEST_6_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_7.png"
    this.QUEST_6_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_8.png"
    this.QUEST_6_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_9.png"
    this.QUEST_6_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_6_10.png"

    ; Episode 7 Quests
    ; ----------------
    this.QUEST_7_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_1.png"
    this.QUEST_7_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_2.png"
    this.QUEST_7_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_3.png"
    this.QUEST_7_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_4.png"
    this.QUEST_7_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_5.png"
    this.QUEST_7_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_6.png"
    this.QUEST_7_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_7.png"
    this.QUEST_7_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_8.png"
    this.QUEST_7_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_9.png"
    this.QUEST_7_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_7_10.png"

    ; Episode 8 Quests
    ; ----------------
    this.QUEST_8_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_1.png"
    this.QUEST_8_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_2.png"
    this.QUEST_8_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_3.png"
    this.QUEST_8_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_4.png"
    this.QUEST_8_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_5.png"
    this.QUEST_8_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_6.png"
    this.QUEST_8_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_7.png"
    this.QUEST_8_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_8.png"
    this.QUEST_8_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_9.png"
    this.QUEST_8_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_8_10.png"

    ; Episode 9 Quests
    ; ----------------
    this.QUEST_9_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_1.png"
    this.QUEST_9_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_2.png"
    this.QUEST_9_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_3.png"
    this.QUEST_9_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_4.png"
    this.QUEST_9_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_5.png"
    this.QUEST_9_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_6.png"
    this.QUEST_9_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_7.png"
    this.QUEST_9_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_8.png"
    this.QUEST_9_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_9.png"
    this.QUEST_9_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_9_10.png"

    ; episode 10 quests
    ; ----------------
    this.QUEST_10_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_1.png"
    this.QUEST_10_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_2.png"
    this.QUEST_10_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_3.png"
    this.QUEST_10_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_4.png"
    this.QUEST_10_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_5.png"
    this.QUEST_10_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_6.png"
    this.QUEST_10_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_7.png"
    this.QUEST_10_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_8.png"
    this.QUEST_10_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_9.png"
    this.QUEST_10_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_10_10.png"

    ; episode 11 QUESTs
    ; ----------------
    this.QUEST_11_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_1.png"
    this.QUEST_11_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_2.png"
    this.QUEST_11_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_3.png"
    this.QUEST_11_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_4.png"
    this.QUEST_11_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_5.png"
    this.QUEST_11_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_6.png"
    this.QUEST_11_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_7.png"
    this.QUEST_11_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_8.png"
    this.QUEST_11_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_9.png"
    this.QUEST_11_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_11_10.png"

    ; episode 12 QUESTs
    ; ----------------
    this.QUEST_12_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_1.png"
    this.QUEST_12_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_2.png"
    this.QUEST_12_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_3.png"
    this.QUEST_12_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_4.png"
    this.QUEST_12_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_5.png"
    this.QUEST_12_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_6.png"
    this.QUEST_12_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_7.png"
    this.QUEST_12_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_8.png"
    this.QUEST_12_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_9.png"
    this.QUEST_12_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_12_10.png"

    ; episode 13 QUESTs
    ; ----------------
    this.QUEST_13_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_1.png"
    this.QUEST_13_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_2.png"
    this.QUEST_13_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_3.png"
    this.QUEST_13_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_4.png"
    this.QUEST_13_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_5.png"
    this.QUEST_13_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_6.png"
    this.QUEST_13_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_7.png"
    this.QUEST_13_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_8.png"
    this.QUEST_13_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_9.png"
    this.QUEST_13_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_13_10.png"

    ; episode 14 QUESTs
    ; ----------------
    this.QUEST_14_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_1.png"
    this.QUEST_14_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_2.png"
    this.QUEST_14_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_3.png"
    this.QUEST_14_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_4.png"
    this.QUEST_14_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_5.png"
    this.QUEST_14_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_6.png"
    this.QUEST_14_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_7.png"
    this.QUEST_14_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_8.png"
    this.QUEST_14_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_9.png"
    this.QUEST_14_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_14_10.png"

    ; episode 15 QUESTs
    ; ----------------
    this.QUEST_15_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_1.png"
    this.QUEST_15_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_2.png"
    this.QUEST_15_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_3.png"
    this.QUEST_15_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_4.png"
    this.QUEST_15_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_5.png"
    this.QUEST_15_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_6.png"
    this.QUEST_15_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_7.png"
    this.QUEST_15_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_8.png"
    this.QUEST_15_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_9.png"
    this.QUEST_15_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_15_10.png"

    ; episode 16 QUESTs
    ; ----------------
    this.QUEST_16_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_1.png"
    this.QUEST_16_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_2.png"
    this.QUEST_16_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_3.png"
    this.QUEST_16_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_4.png"
    this.QUEST_16_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_5.png"
    this.QUEST_16_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_6.png"
    this.QUEST_16_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_7.png"
    this.QUEST_16_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_8.png"
    this.QUEST_16_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_9.png"
    this.QUEST_16_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_16_10.png"

    ; episode 17 QUESTs
    ; ----------------
    this.QUEST_17_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_1.png"
    this.QUEST_17_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_2.png"
    this.QUEST_17_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_3.png"
    this.QUEST_17_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_4.png"
    this.QUEST_17_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_5.png"
    this.QUEST_17_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_6.png"
    this.QUEST_17_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_7.png"
    this.QUEST_17_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_8.png"
    this.QUEST_17_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_9.png"
    this.QUEST_17_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_17_10.png"

    ; Episode 18 Quests
    ; ----------------
    this.QUEST_18_1 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_18_1.png"
    this.QUEST_18_2 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_18_2.png"
    this.QUEST_18_3 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_18_3.png"
    this.QUEST_18_4 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_18_4.png"
    this.QUEST_18_5 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_18_5.png"
    this.QUEST_18_6 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_18_6.png"
    this.QUEST_18_7 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_18_7.png"
    this.QUEST_18_8 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_18_8.png"
    this.QUEST_18_9 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_18_9.png"
    this.QUEST_18_10 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_18_10.png"

    ; Episode 19 Quests
    ; ----------------
    this.QUEST_19_1 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_19_1.png"
    this.QUEST_19_2 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_19_2.png"
    this.QUEST_19_3 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_19_3.png"
    this.QUEST_19_4 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_19_4.png"
    this.QUEST_19_5 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_19_5.png"
    this.QUEST_19_6 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_19_6.png"
    this.QUEST_19_7 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_19_7.png"
    this.QUEST_19_8 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_19_8.png"
    this.QUEST_19_9 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_19_9.png"
    this.QUEST_19_10 := "FANTASICA IMAGES/Quest/QuestMenu/QUEST_19_10.png"

    ; episode 20 QUESTs
    ; ----------------
    this.QUEST_20_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_1.png"
    this.QUEST_20_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_2.png"
    this.QUEST_20_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_3.png"
    this.QUEST_20_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_4.png"
    this.QUEST_20_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_5.png"
    this.QUEST_20_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_6.png"
    this.QUEST_20_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_7.png"
    this.QUEST_20_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_8.png"
    this.QUEST_20_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_9.png"
    this.QUEST_20_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_20_10.png"

    ; episode 21 QUESTs
    ; ----------------
    this.QUEST_21_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_1.png"
    this.QUEST_21_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_2.png"
    this.QUEST_21_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_3.png"
    this.QUEST_21_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_4.png"
    this.QUEST_21_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_5.png"
    this.QUEST_21_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_6.png"
    this.QUEST_21_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_7.png"
    this.QUEST_21_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_8.png"
    this.QUEST_21_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_9.png"
    this.QUEST_21_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_21_10.png"

    ; episode 22 QUESTs
    ; ----------------
    this.QUEST_22_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_1.png"
    this.QUEST_22_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_2.png"
    this.QUEST_22_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_3.png"
    this.QUEST_22_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_4.png"
    this.QUEST_22_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_5.png"
    this.QUEST_22_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_6.png"
    this.QUEST_22_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_7.png"
    this.QUEST_22_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_8.png"
    this.QUEST_22_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_9.png"
    this.QUEST_22_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_22_10.png"

    ; episode 23 QUESTs
    ; ----------------
    this.QUEST_23_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_1.png"
    this.QUEST_23_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_2.png"
    this.QUEST_23_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_3.png"
    this.QUEST_23_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_4.png"
    this.QUEST_23_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_5.png"
    this.QUEST_23_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_6.png"
    this.QUEST_23_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_7.png"
    this.QUEST_23_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_8.png"
    this.QUEST_23_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_9.png"
    this.QUEST_23_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_23_10.png"

    ; episode 24 QUESTs
    ; ----------------
    this.QUEST_24_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_1.png"
    this.QUEST_24_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_2.png"
    this.QUEST_24_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_3.png"
    this.QUEST_24_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_4.png"
    this.QUEST_24_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_5.png"
    this.QUEST_24_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_6.png"
    this.QUEST_24_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_7.png"
    this.QUEST_24_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_8.png"
    this.QUEST_24_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_9.png"
    this.QUEST_24_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_24_10.png"

    ; episode 25 QUESTs
    ; ----------------
    this.QUEST_25_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_1.png"
    this.QUEST_25_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_2.png"
    this.QUEST_25_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_3.png"
    this.QUEST_25_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_4.png"
    this.QUEST_25_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_5.png"
    this.QUEST_25_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_6.png"
    this.QUEST_25_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_7.png"
    this.QUEST_25_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_8.png"
    this.QUEST_25_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_9.png"
    this.QUEST_25_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_25_10.png"

    ; episode 26 QUESTs
    ; ----------------
    this.QUEST_26_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_1.png"
    this.QUEST_26_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_2.png"
    this.QUEST_26_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_3.png"
    this.QUEST_26_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_4.png"
    this.QUEST_26_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_5.png"
    this.QUEST_26_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_6.png"
    this.QUEST_26_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_7.png"
    this.QUEST_26_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_8.png"
    this.QUEST_26_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_9.png"
    this.QUEST_26_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_26_10.png"

    ; episode 27 QUESTs
    ; ----------------
    this.QUEST_27_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_1.png"
    this.QUEST_27_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_2.png"
    this.QUEST_27_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_3.png"
    this.QUEST_27_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_4.png"
    this.QUEST_27_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_5.png"
    this.QUEST_27_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_6.png"
    this.QUEST_27_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_7.png"
    this.QUEST_27_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_8.png"
    this.QUEST_27_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_9.png"
    this.QUEST_27_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_27_10.png"

    ; episode 28 QUESTs
    ; ----------------
    this.QUEST_28_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_1.png"
    this.QUEST_28_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_2.png"
    this.QUEST_28_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_3.png"
    this.QUEST_28_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_4.png"
    this.QUEST_28_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_5.png"
    this.QUEST_28_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_6.png"
    this.QUEST_28_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_7.png"
    this.QUEST_28_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_8.png"
    this.QUEST_28_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_9.png"
    this.QUEST_28_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_28_10.png"

    ; episode 29 QUESTs
    ; ----------------
    this.QUEST_29_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_1.png"
    this.QUEST_29_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_2.png"
    this.QUEST_29_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_3.png"
    this.QUEST_29_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_4.png"
    this.QUEST_29_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_5.png"
    this.QUEST_29_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_6.png"
    this.QUEST_29_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_7.png"
    this.QUEST_29_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_8.png"
    this.QUEST_29_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_9.png"
    this.QUEST_29_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_29_10.png"

    ; episode 30 QUESTs
    ; ----------------
    this.QUEST_30_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_1.png"
    this.QUEST_30_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_2.png"
    this.QUEST_30_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_3.png"
    this.QUEST_30_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_4.png"
    this.QUEST_30_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_5.png"
    this.QUEST_30_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_6.png"
    this.QUEST_30_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_7.png"
    this.QUEST_30_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_8.png"
    this.QUEST_30_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_9.png"
    this.QUEST_30_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_30_10.png"

    ; episode 31 QUESTs
    ; ----------------
    this.QUEST_31_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_1.png"
    this.QUEST_31_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_2.png"
    this.QUEST_31_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_3.png"
    this.QUEST_31_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_4.png"
    this.QUEST_31_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_5.png"
    this.QUEST_31_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_6.png"
    this.QUEST_31_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_7.png"
    this.QUEST_31_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_8.png"
    this.QUEST_31_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_9.png"
    this.QUEST_31_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_31_10.png"

    ; episode 32 QUESTs
    ; ----------------
    this.QUEST_32_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_1.png"
    this.QUEST_32_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_2.png"
    this.QUEST_32_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_3.png"
    this.QUEST_32_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_4.png"
    this.QUEST_32_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_5.png"
    this.QUEST_32_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_6.png"
    this.QUEST_32_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_7.png"
    this.QUEST_32_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_8.png"
    this.QUEST_32_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_9.png"
    this.QUEST_32_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_32_10.png"

    ; episode 33 QUESTs
    ; ----------------
    this.QUEST_33_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_1.png"
    this.QUEST_33_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_2.png"
    this.QUEST_33_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_3.png"
    this.QUEST_33_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_4.png"
    this.QUEST_33_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_5.png"
    this.QUEST_33_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_6.png"
    this.QUEST_33_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_7.png"
    this.QUEST_33_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_8.png"
    this.QUEST_33_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_9.png"
    this.QUEST_33_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_33_10.png"

    ; episode 34 QUESTs
    ; ----------------
    this.QUEST_34_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_1.png"
    this.QUEST_34_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_2.png"
    this.QUEST_34_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_3.png"
    this.QUEST_34_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_4.png"
    this.QUEST_34_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_5.png"
    this.QUEST_34_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_6.png"
    this.QUEST_34_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_7.png"
    this.QUEST_34_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_8.png"
    this.QUEST_34_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_9.png"
    this.QUEST_34_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_34_10.png"

    ; episode 35 QUESTs
    ; ----------------
    this.QUEST_35_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_1.png"
    this.QUEST_35_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_2.png"
    this.QUEST_35_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_3.png"
    this.QUEST_35_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_4.png"
    this.QUEST_35_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_5.png"
    this.QUEST_35_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_6.png"
    this.QUEST_35_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_7.png"
    this.QUEST_35_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_8.png"
    this.QUEST_35_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_9.png"
    this.QUEST_35_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_35_10.png"

    ; episode 36 QUESTs
    ; ----------------
    this.QUEST_36_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_1.png"
    this.QUEST_36_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_2.png"
    this.QUEST_36_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_3.png"
    this.QUEST_36_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_4.png"
    this.QUEST_36_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_5.png"
    this.QUEST_36_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_6.png"
    this.QUEST_36_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_7.png"
    this.QUEST_36_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_8.png"
    this.QUEST_36_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_9.png"
    this.QUEST_36_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_36_10.png"

    ; episode 37 QUESTs
    ; ----------------
    this.QUEST_37_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_1.png"
    this.QUEST_37_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_2.png"
    this.QUEST_37_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_3.png"
    this.QUEST_37_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_4.png"
    this.QUEST_37_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_5.png"
    this.QUEST_37_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_6.png"
    this.QUEST_37_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_7.png"
    this.QUEST_37_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_8.png"
    this.QUEST_37_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_9.png"
    this.QUEST_37_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_37_10.png"

    ; episode 38 QUESTs
    ; ----------------
    this.QUEST_38_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_1.png"
    this.QUEST_38_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_2.png"
    this.QUEST_38_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_3.png"
    this.QUEST_38_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_4.png"
    this.QUEST_38_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_5.png"
    this.QUEST_38_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_6.png"
    this.QUEST_38_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_7.png"
    this.QUEST_38_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_8.png"
    this.QUEST_38_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_9.png"
    this.QUEST_38_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_38_10.png"

    ; episode 39 QUESTs
    ; ----------------
    this.QUEST_39_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_1.png"
    this.QUEST_39_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_2.png"
    this.QUEST_39_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_3.png"
    this.QUEST_39_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_4.png"
    this.QUEST_39_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_5.png"
    this.QUEST_39_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_6.png"
    this.QUEST_39_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_7.png"
    this.QUEST_39_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_8.png"
    this.QUEST_39_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_9.png"
    this.QUEST_39_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_39_10.png"

    ; episode 40 QUESTs
    ; ----------------
    this.QUEST_40_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_1.png"
    this.QUEST_40_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_2.png"
    this.QUEST_40_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_3.png"
    this.QUEST_40_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_4.png"
    this.QUEST_40_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_5.png"
    this.QUEST_40_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_6.png"
    this.QUEST_40_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_7.png"
    this.QUEST_40_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_8.png"
    this.QUEST_40_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_9.png"
    this.QUEST_40_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_40_10.png"

    ; episode 41 QUESTs
    ; ----------------
    this.QUEST_41_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_1.png"
    this.QUEST_41_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_2.png"
    this.QUEST_41_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_3.png"
    this.QUEST_41_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_4.png"
    this.QUEST_41_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_5.png"
    this.QUEST_41_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_6.png"
    this.QUEST_41_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_7.png"
    this.QUEST_41_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_8.png"
    this.QUEST_41_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_9.png"
    this.QUEST_41_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_41_10.png"

    ; episode 42 QUESTs
    ; ----------------
    this.QUEST_42_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_1.png"
    this.QUEST_42_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_2.png"
    this.QUEST_42_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_3.png"
    this.QUEST_42_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_4.png"
    this.QUEST_42_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_5.png"
    this.QUEST_42_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_6.png"
    this.QUEST_42_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_7.png"
    this.QUEST_42_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_8.png"
    this.QUEST_42_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_9.png"
    this.QUEST_42_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_42_10.png"

    ; episode 43 QUESTs
    ; ----------------
    this.QUEST_43_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_1.png"
    this.QUEST_43_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_2.png"
    this.QUEST_43_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_3.png"
    this.QUEST_43_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_4.png"
    this.QUEST_43_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_5.png"
    this.QUEST_43_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_6.png"
    this.QUEST_43_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_7.png"
    this.QUEST_43_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_8.png"
    this.QUEST_43_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_9.png"
    this.QUEST_43_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_43_10.png"

    ; episode 44 QUESTs
    ; ----------------
    this.QUEST_44_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_1.png"
    this.QUEST_44_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_2.png"
    this.QUEST_44_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_3.png"
    this.QUEST_44_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_4.png"
    this.QUEST_44_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_5.png"
    this.QUEST_44_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_6.png"
    this.QUEST_44_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_7.png"
    this.QUEST_44_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_8.png"
    this.QUEST_44_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_9.png"
    this.QUEST_44_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_44_10.png"

    ; episode 45 QUESTs
    ; ----------------
    this.QUEST_45_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_1.png"
    this.QUEST_45_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_2.png"
    this.QUEST_45_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_3.png"
    this.QUEST_45_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_4.png"
    this.QUEST_45_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_5.png"
    this.QUEST_45_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_6.png"
    this.QUEST_45_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_7.png"
    this.QUEST_45_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_8.png"
    this.QUEST_45_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_9.png"
    this.QUEST_45_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_45_10.png"

    ; episode 46 QUESTs
    ; ----------------
    this.QUEST_46_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_1.png"
    this.QUEST_46_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_2.png"
    this.QUEST_46_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_3.png"
    this.QUEST_46_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_4.png"
    this.QUEST_46_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_5.png"
    this.QUEST_46_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_6.png"
    this.QUEST_46_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_7.png"
    this.QUEST_46_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_8.png"
    this.QUEST_46_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_9.png"
    this.QUEST_46_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_46_10.png"

    ; episode 47 QUESTs
    ; ----------------
    this.QUEST_47_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_1.png"
    this.QUEST_47_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_2.png"
    this.QUEST_47_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_3.png"
    this.QUEST_47_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_4.png"
    this.QUEST_47_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_5.png"
    this.QUEST_47_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_6.png"
    this.QUEST_47_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_7.png"
    this.QUEST_47_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_8.png"
    this.QUEST_47_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_9.png"
    this.QUEST_47_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_47_10.png"

    ; episode 48 QUESTs
    ; ----------------
    this.QUEST_48_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_1.png"
    this.QUEST_48_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_2.png"
    this.QUEST_48_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_3.png"
    this.QUEST_48_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_4.png"
    this.QUEST_48_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_5.png"
    this.QUEST_48_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_6.png"
    this.QUEST_48_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_7.png"
    this.QUEST_48_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_8.png"
    this.QUEST_48_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_9.png"
    this.QUEST_48_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_48_10.png"

    ; episode 49 QUESTs
    ; ----------------
    this.QUEST_49_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_1.png"
    this.QUEST_49_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_2.png"
    this.QUEST_49_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_3.png"
    this.QUEST_49_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_4.png"
    this.QUEST_49_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_5.png"
    this.QUEST_49_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_6.png"
    this.QUEST_49_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_7.png"
    this.QUEST_49_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_8.png"
    this.QUEST_49_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_9.png"
    this.QUEST_49_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_49_10.png"

    ; episode 50 QUESTs
    ; ----------------
    this.QUEST_50_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_1.png"
    this.QUEST_50_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_2.png"
    this.QUEST_50_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_3.png"
    this.QUEST_50_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_4.png"
    this.QUEST_50_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_5.png"
    this.QUEST_50_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_6.png"
    this.QUEST_50_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_7.png"
    this.QUEST_50_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_8.png"
    this.QUEST_50_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_9.png"
    this.QUEST_50_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_50_10.png"

    ; episode 51 QUESTs
    ; ----------------
    this.QUEST_51_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_1.png"
    this.QUEST_51_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_2.png"
    this.QUEST_51_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_3.png"
    this.QUEST_51_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_4.png"
    this.QUEST_51_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_5.png"
    this.QUEST_51_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_6.png"
    this.QUEST_51_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_7.png"
    this.QUEST_51_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_8.png"
    this.QUEST_51_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_9.png"
    this.QUEST_51_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_51_10.png"

    ; episode 52 QUESTs
    ; ----------------
    this.QUEST_52_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_1.png"
    this.QUEST_52_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_2.png"
    this.QUEST_52_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_3.png"
    this.QUEST_52_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_4.png"
    this.QUEST_52_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_5.png"
    this.QUEST_52_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_6.png"
    this.QUEST_52_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_7.png"
    this.QUEST_52_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_8.png"
    this.QUEST_52_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_9.png"
    this.QUEST_52_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_52_10.png"

    ; episode 53 QUESTs
    ; ----------------
    this.QUEST_53_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_1.png"
    this.QUEST_53_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_2.png"
    this.QUEST_53_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_3.png"
    this.QUEST_53_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_4.png"
    this.QUEST_53_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_5.png"
    this.QUEST_53_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_6.png"
    this.QUEST_53_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_7.png"
    this.QUEST_53_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_8.png"
    this.QUEST_53_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_9.png"
    this.QUEST_53_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_53_10.png"

    ; episode 54 QUESTs
    ; ----------------
    this.QUEST_54_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_1.png"
    this.QUEST_54_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_2.png"
    this.QUEST_54_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_3.png"
    this.QUEST_54_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_4.png"
    this.QUEST_54_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_5.png"
    this.QUEST_54_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_6.png"
    this.QUEST_54_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_7.png"
    this.QUEST_54_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_8.png"
    this.QUEST_54_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_9.png"
    this.QUEST_54_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_54_10.png"

    ; episode 55 QUESTs
    ; ----------------
    this.QUEST_55_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_1.png"
    this.QUEST_55_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_2.png"
    this.QUEST_55_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_3.png"
    this.QUEST_55_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_4.png"
    this.QUEST_55_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_5.png"
    this.QUEST_55_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_6.png"
    this.QUEST_55_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_7.png"
    this.QUEST_55_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_8.png"
    this.QUEST_55_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_9.png"
    this.QUEST_55_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_55_10.png"

    ; episode 56 QUESTs
    ; ----------------
    this.QUEST_56_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_1.png"
    this.QUEST_56_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_2.png"
    this.QUEST_56_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_3.png"
    this.QUEST_56_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_4.png"
    this.QUEST_56_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_5.png"
    this.QUEST_56_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_6.png"
    this.QUEST_56_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_7.png"
    this.QUEST_56_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_8.png"
    this.QUEST_56_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_9.png"
    this.QUEST_56_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_56_10.png"

    ; episode 57 QUESTs
    ; ----------------
    this.QUEST_57_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_1.png"
    this.QUEST_57_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_2.png"
    this.QUEST_57_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_3.png"
    this.QUEST_57_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_4.png"
    this.QUEST_57_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_5.png"
    this.QUEST_57_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_6.png"
    this.QUEST_57_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_7.png"
    this.QUEST_57_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_8.png"
    this.QUEST_57_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_9.png"
    this.QUEST_57_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_10.png"
    this.QUEST_57_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_57_11.png"

    ; episode 58 QUESTs
    ; ----------------
    this.QUEST_58_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_1.png"
    this.QUEST_58_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_2.png"
    this.QUEST_58_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_3.png"
    this.QUEST_58_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_4.png"
    this.QUEST_58_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_5.png"
    this.QUEST_58_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_6.png"
    this.QUEST_58_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_7.png"
    this.QUEST_58_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_8.png"
    this.QUEST_58_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_9.png"
    this.QUEST_58_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_10.png"
    this.QUEST_58_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_58_11.png"

    ; episode 59 QUESTs
    ; ----------------
    this.QUEST_59_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_1.png"
    this.QUEST_59_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_2.png"
    this.QUEST_59_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_3.png"
    this.QUEST_59_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_4.png"
    this.QUEST_59_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_5.png"
    this.QUEST_59_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_6.png"
    this.QUEST_59_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_7.png"
    this.QUEST_59_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_8.png"
    this.QUEST_59_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_9.png"
    this.QUEST_59_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_10.png"
    this.QUEST_59_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_59_11.png"

    ; episode 60 QUESTs
    ; ----------------
    this.QUEST_60_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_1.png"
    this.QUEST_60_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_2.png"
    this.QUEST_60_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_3.png"
    this.QUEST_60_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_4.png"
    this.QUEST_60_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_5.png"
    this.QUEST_60_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_6.png"
    this.QUEST_60_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_7.png"
    this.QUEST_60_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_8.png"
    this.QUEST_60_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_9.png"
    this.QUEST_60_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_10.png"
    this.QUEST_60_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_60_11.png"

    ; episode 61 QUESTs
    ; ----------------
    this.QUEST_61_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_1.png"
    this.QUEST_61_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_2.png"
    this.QUEST_61_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_3.png"
    this.QUEST_61_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_4.png"
    this.QUEST_61_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_5.png"
    this.QUEST_61_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_6.png"
    this.QUEST_61_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_7.png"
    this.QUEST_61_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_8.png"
    this.QUEST_61_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_9.png"
    this.QUEST_61_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_10.png"
    this.QUEST_61_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_61_11.png"

    ; episode 62 QUESTs
    ; ----------------
    this.QUEST_62_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_1.png"
    this.QUEST_62_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_2.png"
    this.QUEST_62_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_3.png"
    this.QUEST_62_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_4.png"
    this.QUEST_62_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_5.png"
    this.QUEST_62_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_6.png"
    this.QUEST_62_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_7.png"
    this.QUEST_62_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_8.png"
    this.QUEST_62_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_9.png"
    this.QUEST_62_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_10.png"
    this.QUEST_62_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_62_11.png"

    ; episode 63 QUESTs
    ; ----------------
    this.QUEST_63_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_1.png"
    this.QUEST_63_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_2.png"
    this.QUEST_63_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_3.png"
    this.QUEST_63_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_4.png"
    this.QUEST_63_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_5.png"
    this.QUEST_63_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_6.png"
    this.QUEST_63_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_7.png"
    this.QUEST_63_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_8.png"
    this.QUEST_63_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_9.png"
    this.QUEST_63_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_10.png"
    this.QUEST_63_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_63_11.png"

    ; episode 64 QUESTs
    ; ----------------
    this.QUEST_64_1 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_1.png"
    this.QUEST_64_2 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_2.png"
    this.QUEST_64_3 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_3.png"
    this.QUEST_64_4 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_4.png"
    this.QUEST_64_5 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_5.png"
    this.QUEST_64_6 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_6.png"
    this.QUEST_64_7 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_7.png"
    this.QUEST_64_8 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_8.png"
    this.QUEST_64_9 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_9.png"
    this.QUEST_64_10 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_10.png"
    this.QUEST_64_11 := "FANTASICA IMAGES/Quest/QuestMenu/quest_64_11.png"

    this.EPISODE_1 := "FANTASICA IMAGES/Quest/QuestMenu/episode_1.png"
    this.EPISODE_2 := "FANTASICA IMAGES/Quest/QuestMenu/episode_2.png"
    this.EPISODE_3 := "FANTASICA IMAGES/Quest/QuestMenu/episode_3.png"
    this.EPISODE_4 := "FANTASICA IMAGES/Quest/QuestMenu/episode_4.png"
    this.EPISODE_5 := "FANTASICA IMAGES/Quest/QuestMenu/episode_5.png"
    this.EPISODE_6 := "FANTASICA IMAGES/Quest/QuestMenu/episode_6.png"
    this.EPISODE_7 := "FANTASICA IMAGES/Quest/QuestMenu/episode_7.png"
    this.EPISODE_8 := "FANTASICA IMAGES/Quest/QuestMenu/episode_8.png"
    this.EPISODE_9 := "FANTASICA IMAGES/Quest/QuestMenu/episode_9.png"
    this.EPISODE_10 := "FANTASICA IMAGES/Quest/QuestMenu/episode_10.png"
    this.EPISODE_11 := "FANTASICA IMAGES/Quest/QuestMenu/episode_11.png"
    this.EPISODE_12 := "FANTASICA IMAGES/Quest/QuestMenu/episode_12.png"
    this.EPISODE_13 := "FANTASICA IMAGES/Quest/QuestMenu/episode_13.png"
    this.EPISODE_14 := "FANTASICA IMAGES/Quest/QuestMenu/episode_14.png"
    this.EPISODE_15 := "FANTASICA IMAGES/Quest/QuestMenu/episode_15.png"
    this.EPISODE_16 := "FANTASICA IMAGES/Quest/QuestMenu/episode_16.png"
    this.EPISODE_17 := "FANTASICA IMAGES/Quest/QuestMenu/episode_17.png"
    this.EPISODE_18 := "FANTASICA IMAGES/Quest/QuestMenu/episode_18.png"
    this.EPISODE_19 := "FANTASICA IMAGES/Quest/QuestMenu/episode_19.png"
    this.EPISODE_20 := "FANTASICA IMAGES/Quest/QuestMenu/episode_20.png"
    this.EPISODE_21 := "FANTASICA IMAGES/Quest/QuestMenu/episode_21.png"
    this.EPISODE_22 := "FANTASICA IMAGES/Quest/QuestMenu/episode_22.png"
    this.EPISODE_23 := "FANTASICA IMAGES/Quest/QuestMenu/episode_23.png"
    this.EPISODE_24 := "FANTASICA IMAGES/Quest/QuestMenu/episode_24.png"
    this.EPISODE_25 := "FANTASICA IMAGES/Quest/QuestMenu/episode_25.png"
    this.EPISODE_26 := "FANTASICA IMAGES/Quest/QuestMenu/episode_26.png"
    this.EPISODE_27 := "FANTASICA IMAGES/Quest/QuestMenu/episode_27.png"
    this.EPISODE_28 := "FANTASICA IMAGES/Quest/QuestMenu/episode_28.png"
    this.EPISODE_29 := "FANTASICA IMAGES/Quest/QuestMenu/episode_29.png"
    this.EPISODE_30 := "FANTASICA IMAGES/Quest/QuestMenu/episode_30.png"
    this.EPISODE_31 := "FANTASICA IMAGES/Quest/QuestMenu/episode_31.png"
    this.EPISODE_32 := "FANTASICA IMAGES/Quest/QuestMenu/episode_32.png"
    this.EPISODE_33 := "FANTASICA IMAGES/Quest/QuestMenu/episode_33.png"
    this.EPISODE_34 := "FANTASICA IMAGES/Quest/QuestMenu/episode_34.png"
    this.EPISODE_35 := "FANTASICA IMAGES/Quest/QuestMenu/episode_35.png"
    this.EPISODE_36 := "FANTASICA IMAGES/Quest/QuestMenu/episode_36.png"
    this.EPISODE_37 := "FANTASICA IMAGES/Quest/QuestMenu/episode_37.png"
    this.EPISODE_38 := "FANTASICA IMAGES/Quest/QuestMenu/episode_38.png"
    this.EPISODE_39 := "FANTASICA IMAGES/Quest/QuestMenu/episode_39.png"
    this.EPISODE_40 := "FANTASICA IMAGES/Quest/QuestMenu/episode_40.png"
    this.EPISODE_41 := "FANTASICA IMAGES/Quest/QuestMenu/episode_41.png"
    this.EPISODE_42 := "FANTASICA IMAGES/Quest/QuestMenu/episode_42.png"
    this.EPISODE_43 := "FANTASICA IMAGES/Quest/QuestMenu/episode_43.png"
    this.EPISODE_44 := "FANTASICA IMAGES/Quest/QuestMenu/episode_44.png"
    this.EPISODE_45 := "FANTASICA IMAGES/Quest/QuestMenu/episode_45.png"
    this.EPISODE_46 := "FANTASICA IMAGES/Quest/QuestMenu/episode_46.png"
    this.EPISODE_47 := "FANTASICA IMAGES/Quest/QuestMenu/episode_47.png"
    this.EPISODE_48 := "FANTASICA IMAGES/Quest/QuestMenu/episode_48.png"
    this.EPISODE_49 := "FANTASICA IMAGES/Quest/QuestMenu/episode_49.png"
    this.EPISODE_50 := "FANTASICA IMAGES/Quest/QuestMenu/episode_50.png"
    this.EPISODE_51 := "FANTASICA IMAGES/Quest/QuestMenu/episode_51.png"
    this.EPISODE_52 := "FANTASICA IMAGES/Quest/QuestMenu/episode_52.png"
    this.EPISODE_53 := "FANTASICA IMAGES/Quest/QuestMenu/episode_53.png"
    this.EPISODE_54 := "FANTASICA IMAGES/Quest/QuestMenu/episode_54.png"
    this.EPISODE_55 := "FANTASICA IMAGES/Quest/QuestMenu/episode_55.png"
    this.EPISODE_56 := "FANTASICA IMAGES/Quest/QuestMenu/episode_56.png"
    this.EPISODE_57 := "FANTASICA IMAGES/Quest/QuestMenu/episode_57.png"
    this.EPISODE_58 := "FANTASICA IMAGES/Quest/QuestMenu/episode_58.png"
    this.EPISODE_59 := "FANTASICA IMAGES/Quest/QuestMenu/episode_59.png"
    this.EPISODE_60 := "FANTASICA IMAGES/Quest/QuestMenu/episode_60.png"
    this.EPISODE_61 := "FANTASICA IMAGES/Quest/QuestMenu/episode_61.png"
    this.EPISODE_62 := "FANTASICA IMAGES/Quest/QuestMenu/episode_62.png"
    this.EPISODE_63 := "FANTASICA IMAGES/Quest/QuestMenu/episode_63.png"
    this.EPISODE_64 := "FANTASICA IMAGES/Quest/QuestMenu/episode_64.png"

    this.TITLE := "FANTASICA IMAGES/Quest/QuestSelection/textquest.png"
    this._START := "FANTASICA IMAGES/Quest/QuestMenu/start_quest.png"
    this.START_USING_TIME_ELIXIR := "FANTASICA IMAGES/Quest/QuestMenu/start_quest_using_time_elixir.png"
    this.EPISODE_LIST := "FANTASICA IMAGES/Quest/QuestMenu/select_episode.png"
    this._EXIT := "FANTASICA IMAGES/Quest/QuestMenu/exit_quest_menu.png"
    this._SELECT := "FANTASICA IMAGES/Quest/QuestMenu/select.png"
    this.FIRST_PAGE := "FANTASICA IMAGES/Quest/QuestMenu/first_page.png"
    this.PREVIOUS_PAGE := "FANTASICA IMAGES/Quest/QuestMenu/previous_page.png"
    this.NEXT_PAGE := "FANTASICA IMAGES/Quest/QuestMenu/next_page.png"
    this.LAST_PAGE :=  "FANTASICA IMAGES/Quest/QuestMenu/last_page.png"
    this.EXIT_EPISODE_LIST := "FANTASICA IMAGES/Quest/QuestMenu/exit_episode_list.png"
    this.MORE_QUESTS := "FANTASICA IMAGES/Quest/QuestMenu/more_quests.png"
    this.MORE_EPISODES := "FANTASICA IMAGES/Quest/QuestMenu/more_episodes.png"
    ;this.CONFIRM_ALLIES := "FANTASICA IMAGES/Quest/QuestMenu/confirm_allies.png"
    ;this.EXIT_ALLY_LIST := "FANTASICA IMAGES/Quest/QuestMenu/exit_ally_list.png"
    this.detector := theDetector
    this.controller := theController
    this.generalConfiguration := theGeneralConfiguration
    this.questConfiguration := theQuestConfiguration
    this.deploymentConfiguration := theDeploymentConfiguration
    this.bestQuestBattlePoints := theBestQuestBattlePoints

    if (theGeneralConfiguration.getWidth() == 436 && theGeneralConfiguration.getHeight() == 718) {
      this.EPISODE_P1 := new Point(200, 415)
      this.EPISODE_P2 := new Point(200, 530)

      this.QUEST_P1 := new Point(200, 380)
      this.QUEST_P2 := new Point(200, 530)
    }
    else {
      this.EPISODE_P1 := new Point(200, 380)
      this.EPISODE_P2 := new Point(200, 530)

      this.QUEST_P1 := new Point(200, 340)
      this.QUEST_P2 := new Point(200, 530)
    }
  }

  isQuestMenu() {
    if (this.detector.detect(this.TITLE)) {
      return true
    } else {
      return false
    }
  }

  isEpisodeList() {
    if (this.detector.detect(this.EPISODE_LIST)) {
      return true
    }
    else {
      return false
    }
  }

  isExit() {
    if (this.detector.detect(this._EXIT)) {
      return true
    }
    else {
      return false
    }
  }

  isStart(thePoint) {
    if (this.detector.detect(this._START, thePoint.getX(), thePoint.getY(), 150)) {
      return true
    }
    else {
      return false
    }
  }

  isSelect(thePoint) {
    if (this.detector.detect(this._SELECT, thePoint.getX(), thePoint.getY(), 150)) {
      return true
    }
    else {
      return false
    }
  }

  isFirstPage() {
    if (this.detector.detect(this.FIRST_PAGE)) {
      return true
    }
    else {
      return false
    }
  }

  isPreviousPage() {
    if (this.detector.detect(this.PREVIOUS_PAGE)) {
      return true
    }
    else {
      return false
    }
  }

  isNextPage() {
    if (this.detector.detect(this.NEXT_PAGE)) {
      return true
    }
    else {
      return false
    }
  }

  isLastPage() {
    if (this.detector.detect(this.LAST_PAGE)) {
      return true
    }
    else {
      return false
    }
  }

  isExitEpisodeList() {
    if (this.detector.detect(this.EXIT_EPISODE_LIST)) {
      return true
    }
    else {
      return false
    }
  }

  isMoreEpisodes() {
    fromX := 0
    fromY := this.generalConfiguration.getHeight() // 2
    if (this.detector.detect(this.MORE_EPISODES, fromX, fromY)) {
      return true
    }
    else {
      return false
    }
  }

  isMoreQuests() {
    fromX := 0
    fromY := this.generalConfiguration.getHeight() // 2
    if (this.detector.detect(this.MORE_QUESTS, fromX, fromY)) {
      return true
    }
    else {
      return false
    }
  }

  episodeList() {
    if (this.isEpisodeList()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  exit() {
    if (this.isExit()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  start(theStartPoint) {
    if (this.isStart(theStartPoint)) {
      this.controller.click(this.detector.getPoint())
    }
  }

  select(thePoint) {
    if (this.isSelect(thePoint)) {
      this.controller.click(this.detector.getPoint())
    }
  }

  firstPage() {
    if (this.isPreviousPage()) { 
      loop, 10 {
        this.controller.click(this.detector.getPoint())
      }
    }
  }

  previousPage() {
    if (this.isPreviousPage()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  nextPage() {
    if (this.isNextPage()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  lastPage() {
    if (this.isNextPage()) {
      loop, 10 {
        this.controller.click(this.detector.getPoint())
      }
    }
  }

  exitEpisodeList() {
    if (this.isExitEpisodeList()) {
      this.controller.click(this.detector.getPoint())
    }
  }

  scrollBottomEpisodeList() {
    mouseSpeed := 2
    dragCount := 2
    this.controller.drag(this.EPISODE_P2, this.EPISODE_P1, mouseSpeed, dragCount)
  }

  scrollDownQuestList() {
    mouseSpeed := 30
    dragCount := 1
    this.controller.drag(this.QUEST_P2, this.QUEST_P1, mouseSpeed, dragCount)
  }

  selectEpisode() {
    episodePath := this.getEpisode()
    loop {
      if (this.detector.detect(episodePath, 0, 0, 175)) {
        fromPoint := new Point(this.detector.getPoint().getX(), this.detector.getPoint().getY())

        if (this.isSelect(fromPoint)) {
          this.select(fromPoint)
          sleep 1000
          return true
        }
      }
      else if (this.isMoreEpisodes()) {
        this.scrollBottomEpisodeList()
        sleep 500
      }
      else if (this.isNextPage()) {
        this.nextPage()
        sleep 500
      }
      else if (this.isLastPage()) {
        this.firstPage()
        sleep 500
      }
      else {
        return false
      }
    }
  }

  selectQuest() {
    questPath := this.getQuest()
    
    loop {
      if (this.detector.detect(questPath, 0, 0, 175)) {
        fromPoint := new Point(this.detector.getPoint().getX(), this.detector.getPoint().getY())

        if (this.isStart(fromPoint)) {
          this.start(fromPoint)
          this.bestQuestBattlePoints.clearBestPointIndices()
          this.bestQuestBattlePoints.clearCheck()
          sleep 500
          return true
        }
        else if (this.detector.detect(this.START_USING_TIME_ELIXIR, fromX, fromY, 150)) {
          if (this.isExit()) {
            this.exit()
            sleep 500
            return true
          }
        }
      }
      else if (this.isMoreQuests()) {
        this.scrollDownQuestList()
        sleep 500
      }
      else {
        return false
      }
    }
  }

  getEpisode() {
    episode := this.questConfiguration.getEpisode()
    if (episode == 1) {
      return this.EPISODE_1
    } 
    else if (episode == 2) {
      return this.EPISODE_2
    } 
    else if (episode == 3) {
      return this.EPISODE_3
    }
    else if (episode == 4) {
      return this.EPISODE_4
    }
    else if (episode == 5) {
      return this.EPISODE_5
    }
    else if (episode == 6) {
      return this.EPISODE_6
    }
    else if (episode == 7) {
      return this.EPISODE_7
    }
    else if (episode == 8) {
      return this.EPISODE_8
    }
    else if (episode == 9) {
      return this.EPISODE_9
    }
    else if (episode == 10) {
      return this.EPISODE_10
    }
    else if (episode == 11) {
      return this.EPISODE_11
    }
    else if (episode == 12) {
      return this.EPISODE_12
    }
    else if (episode == 13) {
      return this.EPISODE_13
    }
    else if (episode == 14) {
      return this.EPISODE_14
    }
    else if (episode == 15) {
      return this.EPISODE_15
    }
    else if (episode == 16) {
      return this.EPISODE_16
    }
    else if (episode == 17) {
      return this.EPISODE_17
    }
    else if (episode == 18) {
      return this.EPISODE_18
    }
    else if (episode == 19) {
      return this.EPISODE_19
    }
    else if (episode == 20) {
      return this.EPISODE_20
    }
    else if (episode == 21) {
      return this.EPISODE_21
    }
    else if (episode == 22) {
      return this.EPISODE_22
    }
    else if (episode == 23) {
      return this.EPISODE_23
    }
    else if (episode == 24) {
      return this.EPISODE_24
    }
    else if (episode == 25) {
      return this.EPISODE_25
    }
    else if (episode == 26) {
      return this.EPISODE_26
    }
    else if (episode == 27) {
      return this.EPISODE_27
    }
    else if (episode == 28) {
      return this.EPISODE_28
    }
    else if (episode == 29) {
      return this.EPISODE_29
    }
    else if (episode == 30) {
      return this.EPISODE_30
    }
    else if (episode == 31) {
      return this.EPISODE_31
    }
    else if (episode == 32) {
      return this.EPISODE_32
    }
    else if (episode == 33) {
      return this.EPISODE_33
    }
    else if (episode == 34) {
      return this.EPISODE_34
    }
    else if (episode == 35) {
      return this.EPISODE_35
    }
    else if (episode == 36) {
      return this.EPISODE_36
    }
    else if (episode == 37) {
      return this.EPISODE_37
    }
    else if (episode == 38) {
      return this.EPISODE_38
    }
    else if (episode == 39) {
      return this.EPISODE_39
    }
    else if (episode == 40) {
      return this.EPISODE_40
    }
    else if (episode == 41) {
      return this.EPISODE_41
    }
    else if (episode == 42) {
      return this.EPISODE_42
    }
    else if (episode == 43) {
      return this.EPISODE_43
    }
    else if (episode == 44) {
      return this.EPISODE_44
    }
    else if (episode == 45) {
      return this.EPISODE_45
    }
    else if (episode == 46) {
      return this.EPISODE_46
    }
    else if (episode == 47) {
      return this.EPISODE_47
    }
    else if (episode == 48) {
      return this.EPISODE_48
    }
    else if (episode == 49) {
      return this.EPISODE_49
    }
    else if (episode == 50) {
      return this.EPISODE_50
    }
    else if (episode == 51) {
      return this.EPISODE_51
    }
    else if (episode == 52) {
      return this.EPISODE_52
    }
    else if (episode == 53) {
      return this.EPISODE_53
    }
    else if (episode == 54) {
      return this.EPISODE_54
    }
    else if (episode == 55) {
      return this.EPISODE_55
    }
    else if (episode == 56) {
      return this.EPISODE_56
    }
    else if (episode == 57) {
      return this.EPISODE_57
    }
    else if (episode == 58) {
      return this.EPISODE_58
    }
    else if (episode == 59) {
      return this.EPISODE_59
    }
    else if (episode == 60) {
      return this.EPISODE_60
    }
    else if (episode == 61) {
      return this.EPISODE_61
    }
    else if (episode == 62) {
      return this.EPISODE_62
    }
    else if (episode == 63) {
      return this.EPISODE_63
    }
    else if (episode == 64) {
      return this.EPISODE_64
    }
  }

  getQuest() {
    episode := this.questConfiguration.getEpisode()
    quest := this.questConfiguration.getQuest()
    if (episode == 1) {
      if (quest == 1) {
        return this.QUEST_1_1
      }
      else if (quest == 2) {
        return this.QUEST_1_2
      }
      else if (quest == 3) {
        return this.QUEST_1_3
      }
      else if (quest == 4) {
        return this.QUEST_1_4
      }
      else if (quest == 5) {
        return this.QUEST_1_5
      }
    }  
    else if (episode == 2) {
      if (quest == 1) {
        return this.QUEST_2_1
      }
      else if (quest == 2) {
        return this.QUEST_2_2
      }
      else if (quest == 3) {
        return this.QUEST_2_3
      }
      else if (quest == 4) {
        return this.QUEST_2_4
      }
      else if (quest == 5) {
        return this.QUEST_2_5
      }
      else if (quest == 6) {
        return this.QUEST_2_6
      }
      else if (quest == 7) {
        return this.QUEST_2_7
      }
      else if (quest == 8) {
        return this.QUEST_2_8
      }
      else if (quest == 9) {
        return this.QUEST_2_9
      }
      else if (quest == 10) {
        return this.QUEST_2_10
      }
    }
    else if (episode == 3) {
      if (quest == 1) {
        return this.QUEST_3_1
      }
      else if (quest == 2) {
        return this.QUEST_3_2
      }
      else if (quest == 3) {
        return this.QUEST_3_3
      }
      else if (quest == 4) {
        return this.QUEST_3_4
      }
      else if (quest == 5) {
        return this.QUEST_3_5
      }
      else if (quest == 6) {
        return this.QUEST_3_6
      }
      else if (quest == 7) {
        return this.QUEST_3_7
      }
      else if (quest == 8) {
        return this.QUEST_3_8
      }
      else if (quest == 9) {
        return this.QUEST_3_9
      }
      else if (quest == 10) {
        return this.QUEST_3_10
      }
    }
    else if (episode == 4) {
      if (quest == 1) {
        return this.QUEST_4_1
      }
      else if (quest == 2) {
        return this.QUEST_4_2
      }
      else if (quest == 3) {
        return this.QUEST_4_3
      }
      else if (quest == 4) {
        return this.QUEST_4_4
      }
      else if (quest == 5) {
        return this.QUEST_4_5
      }
      else if (quest == 6) {
        return this.QUEST_4_6
      }
      else if (quest == 7) {
        return this.QUEST_4_7
      }
      else if (quest == 8) {
        return this.QUEST_4_8
      }
      else if (quest == 9) {
        return this.QUEST_4_9
      }
      else if (quest == 10) {
        return this.QUEST_4_10
      }
    }
    else if (episode == 5) {
      if (quest == 1) {
        return this.QUEST_5_1
      }
      else if (quest == 2) {
        return this.QUEST_5_2
      }
      else if (quest == 3) {
        return this.QUEST_5_3
      }
      else if (quest == 4) {
        return this.QUEST_5_4
      }
      else if (quest == 5) {
        return this.QUEST_5_5
      }
      else if (quest == 6) {
        return this.QUEST_5_6
      }
      else if (quest == 7) {
        return this.QUEST_5_7
      }
      else if (quest == 8) {
        return this.QUEST_5_8
      }
      else if (quest == 9) {
        return this.QUEST_5_9
      }
      else if (quest == 10) {
        return this.QUEST_5_10
      }
    }
    else if (episode == 6) {
      if (quest == 1) {
        return this.QUEST_6_1
      }
      else if (quest == 2) {
        return this.QUEST_6_2
      }
      else if (quest == 3) {
        return this.QUEST_6_3
      }
      else if (quest == 4) {
        return this.QUEST_6_4
      }
      else if (quest == 5) {
        return this.QUEST_6_5
      }
      else if (quest == 6) {
        return this.QUEST_6_6
      }
      else if (quest == 7) {
        return this.QUEST_6_7
      }
      else if (quest == 8) {
        return this.QUEST_6_8
      }
      else if (quest == 9) {
        return this.QUEST_6_9
      }
      else if (quest == 10) {
        return this.QUEST_6_10
      }
    }
    else if (episode == 7) {
      if (quest == 1) {
        return this.QUEST_7_1
      }
      else if (quest == 2) {
        return this.QUEST_7_2
      }
      else if (quest == 3) {
        return this.QUEST_7_3
      }
      else if (quest == 4) {
        return this.QUEST_7_4
      }
      else if (quest == 5) {
        return this.QUEST_7_5
      }
      else if (quest == 6) {
        return this.QUEST_7_6
      }
      else if (quest == 7) {
        return this.QUEST_7_7
      }
      else if (quest == 8) {
        return this.QUEST_7_8
      }
      else if (quest == 9) {
        return this.QUEST_7_9
      }
      else if (quest == 10) {
        return this.QUEST_7_10
      }
    }
    else if (episode == 8) {
      if (quest == 1) {
        return this.QUEST_8_1
      }
      else if (quest == 2) {
        return this.QUEST_8_2
      }
      else if (quest == 3) {
        return this.QUEST_8_3
      }
      else if (quest == 4) {
        return this.QUEST_8_4
      }
      else if (quest == 5) {
        return this.QUEST_8_5
      }
      else if (quest == 6) {
        return this.QUEST_8_6
      }
      else if (quest == 7) {
        return this.QUEST_8_7
      }
      else if (quest == 8) {
        return this.QUEST_8_8
      }
      else if (quest == 9) {
        return this.QUEST_8_9
      }
      else if (quest == 10) {
        return this.QUEST_8_10
      }
    }
    else if (episode == 9) {
      if (quest == 1) {
        return this.QUEST_9_1
      }
      else if (quest == 2) {
        return this.QUEST_9_2
      }
      else if (quest == 3) {
        return this.QUEST_9_3
      }
      else if (quest == 4) {
        return this.QUEST_9_4
      }
      else if (quest == 5) {
        return this.QUEST_9_5
      }
      else if (quest == 6) {
        return this.QUEST_9_6
      }
      else if (quest == 7) {
        return this.QUEST_9_7
      }
      else if (quest == 8) {
        return this.QUEST_9_8
      }
      else if (quest == 9) {
        return this.QUEST_9_9
      }
      else if (quest == 10) {
        return this.QUEST_9_10
      }
    }
    else if (episode == 10) {
      if (quest == 1) {
        return this.QUEST_10_1
      }
      else if (quest == 2) {
        return this.QUEST_10_2
      }
      else if (quest == 3) {
        return this.QUEST_10_3
      }
      else if (quest == 4) {
        return this.QUEST_10_4
      }
      else if (quest == 5) {
        return this.QUEST_10_5
      }
      else if (quest == 6) {
        return this.QUEST_10_6
      }
      else if (quest == 7) {
        return this.QUEST_10_7
      }
      else if (quest == 8) {
        return this.QUEST_10_8
      }
      else if (quest == 9) {
        return this.QUEST_10_9
      }
      else if (quest == 10) {
        return this.QUEST_10_10
      }
    }
    else if (episode == 11) {
      if (quest == 1) {
        return this.QUEST_11_1
      }
      else if (quest == 2) {
        return this.QUEST_11_2
      }
      else if (quest == 3) {
        return this.QUEST_11_3
      }
      else if (quest == 4) {
        return this.QUEST_11_4
      }
      else if (quest == 5) {
        return this.QUEST_11_5
      }
      else if (quest == 6) {
        return this.QUEST_11_6
      }
      else if (quest == 7) {
        return this.QUEST_11_7
      }
      else if (quest == 8) {
        return this.QUEST_11_8
      }
      else if (quest == 9) {
        return this.QUEST_11_9
      }
      else if (quest == 10) {
        return this.QUEST_11_10
      }
    }
    else if (episode == 12) {
      if (quest == 1) {
        return this.QUEST_12_1
      }
      else if (quest == 2) {
        return this.QUEST_12_2
      }
      else if (quest == 3) {
        return this.QUEST_12_3
      }
      else if (quest == 4) {
        return this.QUEST_12_4
      }
      else if (quest == 5) {
        return this.QUEST_12_5
      }
      else if (quest == 6) {
        return this.QUEST_12_6
      }
      else if (quest == 7) {
        return this.QUEST_12_7
      }
      else if (quest == 8) {
        return this.QUEST_12_8
      }
      else if (quest == 9) {
        return this.QUEST_12_9
      }
      else if (quest == 10) {
        return this.QUEST_12_10
      }
    }
    else if (episode == 13) {
      if (quest == 1) {
        return this.QUEST_13_1
      }
      else if (quest == 2) {
        return this.QUEST_13_2
      }
      else if (quest == 3) {
        return this.QUEST_13_3
      }
      else if (quest == 4) {
        return this.QUEST_13_4
      }
      else if (quest == 5) {
        return this.QUEST_13_5
      }
      else if (quest == 6) {
        return this.QUEST_13_6
      }
      else if (quest == 7) {
        return this.QUEST_13_7
      }
      else if (quest == 8) {
        return this.QUEST_13_8
      }
      else if (quest == 9) {
        return this.QUEST_13_9
      }
      else if (quest == 10) {
        return this.QUEST_13_10
      }
    }
    else if (episode == 14) {
      if (quest == 1) {
        return this.QUEST_14_1
      }
      else if (quest == 2) {
        return this.QUEST_14_2
      }
      else if (quest == 3) {
        return this.QUEST_14_3
      }
      else if (quest == 4) {
        return this.QUEST_14_4
      }
      else if (quest == 5) {
        return this.QUEST_14_5
      }
      else if (quest == 6) {
        return this.QUEST_14_6
      }
      else if (quest == 7) {
        return this.QUEST_14_7
      }
      else if (quest == 8) {
        return this.QUEST_14_8
      }
      else if (quest == 9) {
        return this.QUEST_14_9
      }
      else if (quest == 10) {
        return this.QUEST_14_10
      }
    }
    else if (episode == 15) {
      if (quest == 1) {
        return this.QUEST_15_1
      }
      else if (quest == 2) {
        return this.QUEST_15_2
      }
      else if (quest == 3) {
        return this.QUEST_15_3
      }
      else if (quest == 4) {
        return this.QUEST_15_4
      }
      else if (quest == 5) {
        return this.QUEST_15_5
      }
      else if (quest == 6) {
        return this.QUEST_15_6
      }
      else if (quest == 7) {
        return this.QUEST_15_7
      }
      else if (quest == 8) {
        return this.QUEST_15_8
      }
      else if (quest == 9) {
        return this.QUEST_15_9
      }
      else if (quest == 10) {
        return this.QUEST_15_10
      }
    }
    else if (episode == 16) {
      if (quest == 1) {
        return this.QUEST_16_1
      }
      else if (quest == 2) {
        return this.QUEST_16_2
      }
      else if (quest == 3) {
        return this.QUEST_16_3
      }
      else if (quest == 4) {
        return this.QUEST_16_4
      }
      else if (quest == 5) {
        return this.QUEST_16_5
      }
      else if (quest == 6) {
        return this.QUEST_16_6
      }
      else if (quest == 7) {
        return this.QUEST_16_7
      }
      else if (quest == 8) {
        return this.QUEST_16_8
      }
      else if (quest == 9) {
        return this.QUEST_16_9
      }
      else if (quest == 10) {
        return this.QUEST_16_10
      }
    }
    else if (episode == 17) {
      if (quest == 1) {
        return this.QUEST_17_1
      }
      else if (quest == 2) {
        return this.QUEST_17_2
      }
      else if (quest == 3) {
        return this.QUEST_17_3
      }
      else if (quest == 4) {
        return this.QUEST_17_4
      }
      else if (quest == 5) {
        return this.QUEST_17_5
      }
      else if (quest == 6) {
        return this.QUEST_17_6
      }
      else if (quest == 7) {
        return this.QUEST_17_7
      }
      else if (quest == 8) {
        return this.QUEST_17_8
      }
      else if (quest == 9) {
        return this.QUEST_17_9
      }
      else if (quest == 10) {
        return this.QUEST_17_10
      }
    }
    else if (episode == 18) {
      if (quest == 1) {
        return this.QUEST_18_1
      }
      else if (quest == 2) {
        return this.QUEST_18_2
      }
      else if (quest == 3) {
        return this.QUEST_18_3
      }
      else if (quest == 4) {
        return this.QUEST_18_4
      }
      else if (quest == 5) {
        return this.QUEST_18_5
      }
      else if (quest == 6) {
        return this.QUEST_18_6
      }
      else if (quest == 7) {
        return this.QUEST_18_7
      }
      else if (quest == 8) {
        return this.QUEST_18_8
      }
      else if (quest == 9) {
        return this.QUEST_18_9
      }
      else if (quest == 10) {
        return this.QUEST_18_10
      }
    }
    else if (episode == 19) {
      if (quest == 1) {
        return this.QUEST_19_1
      }
      else if (quest == 2) {
        return this.QUEST_19_2
      }
      else if (quest == 3) {
        return this.QUEST_19_3
      }
      else if (quest == 4) {
        return this.QUEST_19_4
      }
      else if (quest == 5) {
        return this.QUEST_19_5
      }
      else if (quest == 6) {
        return this.QUEST_19_6
      }
      else if (quest == 7) {
        return this.QUEST_19_7
      }
      else if (quest == 8) {
        return this.QUEST_19_8
      }
      else if (quest == 9) {
        return this.QUEST_19_9
      }
      else if (quest == 10) {
        return this.QUEST_19_10
      }
    }
    else if (episode == 20) {
      if (quest == 1) {
        return this.QUEST_20_1
      }
      else if (quest == 2) {
        return this.QUEST_20_2
      }
      else if (quest == 3) {
        return this.QUEST_20_3
      }
      else if (quest == 4) {
        return this.QUEST_20_4
      }
      else if (quest == 5) {
        return this.QUEST_20_5
      }
      else if (quest == 6) {
        return this.QUEST_20_6
      }
      else if (quest == 7) {
        return this.QUEST_20_7
      }
      else if (quest == 8) {
        return this.QUEST_20_8
      }
      else if (quest == 9) {
        return this.QUEST_20_9
      }
      else if (quest == 10) {
        return this.QUEST_20_10
      }
    }
    else if (episode == 21) {
      if (quest == 1) {
        return this.QUEST_21_1
      }
      else if (quest == 2) {
        return this.QUEST_21_2
      }
      else if (quest == 3) {
        return this.QUEST_21_3
      }
      else if (quest == 4) {
        return this.QUEST_21_4
      }
      else if (quest == 5) {
        return this.QUEST_21_5
      }
      else if (quest == 6) {
        return this.QUEST_21_6
      }
      else if (quest == 7) {
        return this.QUEST_21_7
      }
      else if (quest == 8) {
        return this.QUEST_21_8
      }
      else if (quest == 9) {
        return this.QUEST_21_9
      }
      else if (quest == 10) {
        return this.QUEST_21_10
      }
    }
    else if (episode == 22) {
      if (quest == 1) {
        return this.QUEST_22_1
      }
      else if (quest == 2) {
        return this.QUEST_22_2
      }
      else if (quest == 3) {
        return this.QUEST_22_3
      }
      else if (quest == 4) {
        return this.QUEST_22_4
      }
      else if (quest == 5) {
        return this.QUEST_22_5
      }
      else if (quest == 6) {
        return this.QUEST_22_6
      }
      else if (quest == 7) {
        return this.QUEST_22_7
      }
      else if (quest == 8) {
        return this.QUEST_22_8
      }
      else if (quest == 9) {
        return this.QUEST_22_9
      }
      else if (quest == 10) {
        return this.QUEST_22_10
      }
    }
    else if (episode == 23) {
      if (quest == 1) {
        return this.QUEST_23_1
      }
      else if (quest == 2) {
        return this.QUEST_23_2
      }
      else if (quest == 3) {
        return this.QUEST_23_3
      }
      else if (quest == 4) {
        return this.QUEST_23_4
      }
      else if (quest == 5) {
        return this.QUEST_23_5
      }
      else if (quest == 6) {
        return this.QUEST_23_6
      }
      else if (quest == 7) {
        return this.QUEST_23_7
      }
      else if (quest == 8) {
        return this.QUEST_23_8
      }
      else if (quest == 9) {
        return this.QUEST_23_9
      }
      else if (quest == 10) {
        return this.QUEST_23_10
      }
    }
    else if (episode == 24) {
      if (quest == 1) {
        return this.QUEST_24_1
      }
      else if (quest == 2) {
        return this.QUEST_24_2
      }
      else if (quest == 3) {
        return this.QUEST_24_3
      }
      else if (quest == 4) {
        return this.QUEST_24_4
      }
      else if (quest == 5) {
        return this.QUEST_24_5
      }
      else if (quest == 6) {
        return this.QUEST_24_6
      }
      else if (quest == 7) {
        return this.QUEST_24_7
      }
      else if (quest == 8) {
        return this.QUEST_24_8
      }
      else if (quest == 9) {
        return this.QUEST_24_9
      }
      else if (quest == 10) {
        return this.QUEST_24_10
      }
    }
    else if (episode == 25) {
      if (quest == 1) {
        return this.QUEST_25_1
      }
      else if (quest == 2) {
        return this.QUEST_25_2
      }
      else if (quest == 3) {
        return this.QUEST_25_3
      }
      else if (quest == 4) {
        return this.QUEST_25_4
      }
      else if (quest == 5) {
        return this.QUEST_25_5
      }
      else if (quest == 6) {
        return this.QUEST_25_6
      }
      else if (quest == 7) {
        return this.QUEST_25_7
      }
      else if (quest == 8) {
        return this.QUEST_25_8
      }
      else if (quest == 9) {
        return this.QUEST_25_9
      }
      else if (quest == 10) {
        return this.QUEST_25_10
      }
    }
    else if (episode == 26) {
      if (quest == 1) {
        return this.QUEST_26_1
      }
      else if (quest == 2) {
        return this.QUEST_26_2
      }
      else if (quest == 3) {
        return this.QUEST_26_3
      }
      else if (quest == 4) {
        return this.QUEST_26_4
      }
      else if (quest == 5) {
        return this.QUEST_26_5
      }
      else if (quest == 6) {
        return this.QUEST_26_6
      }
      else if (quest == 7) {
        return this.QUEST_26_7
      }
      else if (quest == 8) {
        return this.QUEST_26_8
      }
      else if (quest == 9) {
        return this.QUEST_26_9
      }
      else if (quest == 10) {
        return this.QUEST_26_10
      }
    }
    else if (episode == 27) {
      if (quest == 1) {
        return this.QUEST_27_1
      }
      else if (quest == 2) {
        return this.QUEST_27_2
      }
      else if (quest == 3) {
        return this.QUEST_27_3
      }
      else if (quest == 4) {
        return this.QUEST_27_4
      }
      else if (quest == 5) {
        return this.QUEST_27_5
      }
      else if (quest == 6) {
        return this.QUEST_27_6
      }
      else if (quest == 7) {
        return this.QUEST_27_7
      }
      else if (quest == 8) {
        return this.QUEST_27_8
      }
      else if (quest == 9) {
        return this.QUEST_27_9
      }
      else if (quest == 10) {
        return this.QUEST_27_10
      }
    }
    else if (episode == 28) {
      if (quest == 1) {
        return this.QUEST_28_1
      }
      else if (quest == 2) {
        return this.QUEST_28_2
      }
      else if (quest == 3) {
        return this.QUEST_28_3
      }
      else if (quest == 4) {
        return this.QUEST_28_4
      }
      else if (quest == 5) {
        return this.QUEST_28_5
      }
      else if (quest == 6) {
        return this.QUEST_28_6
      }
      else if (quest == 7) {
        return this.QUEST_28_7
      }
      else if (quest == 8) {
        return this.QUEST_28_8
      }
      else if (quest == 9) {
        return this.QUEST_28_9
      }
      else if (quest == 10) {
        return this.QUEST_28_10
      }
    }
    else if (episode == 29) {
      if (quest == 1) {
        return this.QUEST_29_1
      }
      else if (quest == 2) {
        return this.QUEST_29_2
      }
      else if (quest == 3) {
        return this.QUEST_29_3
      }
      else if (quest == 4) {
        return this.QUEST_29_4
      }
      else if (quest == 5) {
        return this.QUEST_29_5
      }
      else if (quest == 6) {
        return this.QUEST_29_6
      }
      else if (quest == 7) {
        return this.QUEST_29_7
      }
      else if (quest == 8) {
        return this.QUEST_29_8
      }
      else if (quest == 9) {
        return this.QUEST_29_9
      }
      else if (quest == 10) {
        return this.QUEST_29_10
      }
    }
    else if (episode == 30) {
      if (quest == 1) {
        return this.QUEST_30_1
      }
      else if (quest == 2) {
        return this.QUEST_30_2
      }
      else if (quest == 3) {
        return this.QUEST_30_3
      }
      else if (quest == 4) {
        return this.QUEST_30_4
      }
      else if (quest == 5) {
        return this.QUEST_30_5
      }
      else if (quest == 6) {
        return this.QUEST_30_6
      }
      else if (quest == 7) {
        return this.QUEST_30_7
      }
      else if (quest == 8) {
        return this.QUEST_30_8
      }
      else if (quest == 9) {
        return this.QUEST_30_9
      }
      else if (quest == 10) {
        return this.QUEST_30_10
      }
    }
    else if (episode == 31) {
      if (quest == 1) {
        return this.QUEST_31_1
      }
      else if (quest == 2) {
        return this.QUEST_31_2
      }
      else if (quest == 3) {
        return this.QUEST_31_3
      }
      else if (quest == 4) {
        return this.QUEST_31_4
      }
      else if (quest == 5) {
        return this.QUEST_31_5
      }
      else if (quest == 6) {
        return this.QUEST_31_6
      }
      else if (quest == 7) {
        return this.QUEST_31_7
      }
      else if (quest == 8) {
        return this.QUEST_31_8
      }
      else if (quest == 9) {
        return this.QUEST_31_9
      }
      else if (quest == 10) {
        return this.QUEST_31_10
      }
    }
    else if (episode == 32) {
      if (quest == 1) {
        return this.QUEST_32_1
      }
      else if (quest == 2) {
        return this.QUEST_32_2
      }
      else if (quest == 3) {
        return this.QUEST_32_3
      }
      else if (quest == 4) {
        return this.QUEST_32_4
      }
      else if (quest == 5) {
        return this.QUEST_32_5
      }
      else if (quest == 6) {
        return this.QUEST_32_6
      }
      else if (quest == 7) {
        return this.QUEST_32_7
      }
      else if (quest == 8) {
        return this.QUEST_32_8
      }
      else if (quest == 9) {
        return this.QUEST_32_9
      }
      else if (quest == 10) {
        return this.QUEST_32_10
      }
    }
    else if (episode == 33) {
      if (quest == 1) {
        return this.QUEST_33_1
      }
      else if (quest == 2) {
        return this.QUEST_33_2
      }
      else if (quest == 3) {
        return this.QUEST_33_3
      }
      else if (quest == 4) {
        return this.QUEST_33_4
      }
      else if (quest == 5) {
        return this.QUEST_33_5
      }
      else if (quest == 6) {
        return this.QUEST_33_6
      }
      else if (quest == 7) {
        return this.QUEST_33_7
      }
      else if (quest == 8) {
        return this.QUEST_33_8
      }
      else if (quest == 9) {
        return this.QUEST_33_9
      }
      else if (quest == 10) {
        return this.QUEST_33_10
      }
    }
    else if (episode == 34) {
      if (quest == 1) {
        return this.QUEST_34_1
      }
      else if (quest == 2) {
        return this.QUEST_34_2
      }
      else if (quest == 3) {
        return this.QUEST_34_3
      }
      else if (quest == 4) {
        return this.QUEST_34_4
      }
      else if (quest == 5) {
        return this.QUEST_34_5
      }
      else if (quest == 6) {
        return this.QUEST_34_6
      }
      else if (quest == 7) {
        return this.QUEST_34_7
      }
      else if (quest == 8) {
        return this.QUEST_34_8
      }
      else if (quest == 9) {
        return this.QUEST_34_9
      }
      else if (quest == 10) {
        return this.QUEST_34_10
      }
    }
    else if (episode == 35) {
      if (quest == 1) {
        return this.QUEST_35_1
      }
      else if (quest == 2) {
        return this.QUEST_35_2
      }
      else if (quest == 3) {
        return this.QUEST_35_3
      }
      else if (quest == 4) {
        return this.QUEST_35_4
      }
      else if (quest == 5) {
        return this.QUEST_35_5
      }
      else if (quest == 6) {
        return this.QUEST_35_6
      }
      else if (quest == 7) {
        return this.QUEST_35_7
      }
      else if (quest == 8) {
        return this.QUEST_35_8
      }
      else if (quest == 9) {
        return this.QUEST_35_9
      }
      else if (quest == 10) {
        return this.QUEST_35_10
      }
    }
    else if (episode == 36) {
      if (quest == 1) {
        return this.QUEST_36_1
      }
      else if (quest == 2) {
        return this.QUEST_36_2
      }
      else if (quest == 3) {
        return this.QUEST_36_3
      }
      else if (quest == 4) {
        return this.QUEST_36_4
      }
      else if (quest == 5) {
        return this.QUEST_36_5
      }
      else if (quest == 6) {
        return this.QUEST_36_6
      }
      else if (quest == 7) {
        return this.QUEST_36_7
      }
      else if (quest == 8) {
        return this.QUEST_36_8
      }
      else if (quest == 9) {
        return this.QUEST_36_9
      }
      else if (quest == 10) {
        return this.QUEST_36_10
      }
    }
    else if (episode == 37) {
      if (quest == 1) {
        return this.QUEST_37_1
      }
      else if (quest == 2) {
        return this.QUEST_37_2
      }
      else if (quest == 3) {
        return this.QUEST_37_3
      }
      else if (quest == 4) {
        return this.QUEST_37_4
      }
      else if (quest == 5) {
        return this.QUEST_37_5
      }
      else if (quest == 6) {
        return this.QUEST_37_6
      }
      else if (quest == 7) {
        return this.QUEST_37_7
      }
      else if (quest == 8) {
        return this.QUEST_37_8
      }
      else if (quest == 9) {
        return this.QUEST_37_9
      }
      else if (quest == 10) {
        return this.QUEST_37_10
      }
    }
    else if (episode == 38) {
      if (quest == 1) {
        return this.QUEST_38_1
      }
      else if (quest == 2) {
        return this.QUEST_38_2
      }
      else if (quest == 3) {
        return this.QUEST_38_3
      }
      else if (quest == 4) {
        return this.QUEST_38_4
      }
      else if (quest == 5) {
        return this.QUEST_38_5
      }
      else if (quest == 6) {
        return this.QUEST_38_6
      }
      else if (quest == 7) {
        return this.QUEST_38_7
      }
      else if (quest == 8) {
        return this.QUEST_38_8
      }
      else if (quest == 9) {
        return this.QUEST_38_9
      }
      else if (quest == 10) {
        return this.QUEST_38_10
      }
    }
    else if (episode == 39) {
      if (quest == 1) {
        return this.QUEST_39_1
      }
      else if (quest == 2) {
        return this.QUEST_39_2
      }
      else if (quest == 3) {
        return this.QUEST_39_3
      }
      else if (quest == 4) {
        return this.QUEST_39_4
      }
      else if (quest == 5) {
        return this.QUEST_39_5
      }
      else if (quest == 6) {
        return this.QUEST_39_6
      }
      else if (quest == 7) {
        return this.QUEST_39_7
      }
      else if (quest == 8) {
        return this.QUEST_39_8
      }
      else if (quest == 9) {
        return this.QUEST_39_9
      }
      else if (quest == 10) {
        return this.QUEST_39_10
      }
    }
    else if (episode == 40) {
      if (quest == 1) {
        return this.QUEST_40_1
      }
      else if (quest == 2) {
        return this.QUEST_40_2
      }
      else if (quest == 3) {
        return this.QUEST_40_3
      }
      else if (quest == 4) {
        return this.QUEST_40_4
      }
      else if (quest == 5) {
        return this.QUEST_40_5
      }
      else if (quest == 6) {
        return this.QUEST_40_6
      }
      else if (quest == 7) {
        return this.QUEST_40_7
      }
      else if (quest == 8) {
        return this.QUEST_40_8
      }
      else if (quest == 9) {
        return this.QUEST_40_9
      }
      else if (quest == 10) {
        return this.QUEST_40_10
      }
    }
    else if (episode == 41) {
      if (quest == 1) {
        return this.QUEST_41_1
      }
      else if (quest == 2) {
        return this.QUEST_41_2
      }
      else if (quest == 3) {
        return this.QUEST_41_3
      }
      else if (quest == 4) {
        return this.QUEST_41_4
      }
      else if (quest == 5) {
        return this.QUEST_41_5
      }
      else if (quest == 6) {
        return this.QUEST_41_6
      }
      else if (quest == 7) {
        return this.QUEST_41_7
      }
      else if (quest == 8) {
        return this.QUEST_41_8
      }
      else if (quest == 9) {
        return this.QUEST_41_9
      }
      else if (quest == 10) {
        return this.QUEST_41_10
      }
    }
    else if (episode == 42) {
      if (quest == 1) {
        return this.QUEST_42_1
      }
      else if (quest == 2) {
        return this.QUEST_42_2
      }
      else if (quest == 3) {
        return this.QUEST_42_3
      }
      else if (quest == 4) {
        return this.QUEST_42_4
      }
      else if (quest == 5) {
        return this.QUEST_42_5
      }
      else if (quest == 6) {
        return this.QUEST_42_6
      }
      else if (quest == 7) {
        return this.QUEST_42_7
      }
      else if (quest == 8) {
        return this.QUEST_42_8
      }
      else if (quest == 9) {
        return this.QUEST_42_9
      }
      else if (quest == 10) {
        return this.QUEST_42_10
      }
    }
    else if (episode == 43) {
      if (quest == 1) {
        return this.QUEST_43_1
      }
      else if (quest == 2) {
        return this.QUEST_43_2
      }
      else if (quest == 3) {
        return this.QUEST_43_3
      }
      else if (quest == 4) {
        return this.QUEST_43_4
      }
      else if (quest == 5) {
        return this.QUEST_43_5
      }
      else if (quest == 6) {
        return this.QUEST_43_6
      }
      else if (quest == 7) {
        return this.QUEST_43_7
      }
      else if (quest == 8) {
        return this.QUEST_43_8
      }
      else if (quest == 9) {
        return this.QUEST_43_9
      }
      else if (quest == 10) {
        return this.QUEST_43_10
      }
    }
    else if (episode == 44) {
      if (quest == 1) {
        return this.QUEST_44_1
      }
      else if (quest == 2) {
        return this.QUEST_44_2
      }
      else if (quest == 3) {
        return this.QUEST_44_3
      }
      else if (quest == 4) {
        return this.QUEST_44_4
      }
      else if (quest == 5) {
        return this.QUEST_44_5
      }
      else if (quest == 6) {
        return this.QUEST_44_6
      }
      else if (quest == 7) {
        return this.QUEST_44_7
      }
      else if (quest == 8) {
        return this.QUEST_44_8
      }
      else if (quest == 9) {
        return this.QUEST_44_9
      }
      else if (quest == 10) {
        return this.QUEST_44_10
      }
    }
    else if (episode == 45) {
      if (quest == 1) {
        return this.QUEST_45_1
      }
      else if (quest == 2) {
        return this.QUEST_45_2
      }
      else if (quest == 3) {
        return this.QUEST_45_3
      }
      else if (quest == 4) {
        return this.QUEST_45_4
      }
      else if (quest == 5) {
        return this.QUEST_45_5
      }
      else if (quest == 6) {
        return this.QUEST_45_6
      }
      else if (quest == 7) {
        return this.QUEST_45_7
      }
      else if (quest == 8) {
        return this.QUEST_45_8
      }
      else if (quest == 9) {
        return this.QUEST_45_9
      }
      else if (quest == 10) {
        return this.QUEST_45_10
      }
    }
    else if (episode == 46) {
      if (quest == 1) {
        return this.QUEST_46_1
      }
      else if (quest == 2) {
        return this.QUEST_46_2
      }
      else if (quest == 3) {
        return this.QUEST_46_3
      }
      else if (quest == 4) {
        return this.QUEST_46_4
      }
      else if (quest == 5) {
        return this.QUEST_46_5
      }
      else if (quest == 6) {
        return this.QUEST_46_6
      }
      else if (quest == 7) {
        return this.QUEST_46_7
      }
      else if (quest == 8) {
        return this.QUEST_46_8
      }
      else if (quest == 9) {
        return this.QUEST_46_9
      }
      else if (quest == 10) {
        return this.QUEST_46_10
      }
    }
    else if (episode == 47) {
      if (quest == 1) {
        return this.QUEST_47_1
      }
      else if (quest == 2) {
        return this.QUEST_47_2
      }
      else if (quest == 3) {
        return this.QUEST_47_3
      }
      else if (quest == 4) {
        return this.QUEST_47_4
      }
      else if (quest == 5) {
        return this.QUEST_47_5
      }
      else if (quest == 6) {
        return this.QUEST_47_6
      }
      else if (quest == 7) {
        return this.QUEST_47_7
      }
      else if (quest == 8) {
        return this.QUEST_47_8
      }
      else if (quest == 9) {
        return this.QUEST_47_9
      }
      else if (quest == 10) {
        return this.QUEST_47_10
      }
    }
    else if (episode == 48) {
      if (quest == 1) {
        return this.QUEST_48_1
      }
      else if (quest == 2) {
        return this.QUEST_48_2
      }
      else if (quest == 3) {
        return this.QUEST_48_3
      }
      else if (quest == 4) {
        return this.QUEST_48_4
      }
      else if (quest == 5) {
        return this.QUEST_48_5
      }
      else if (quest == 6) {
        return this.QUEST_48_6
      }
      else if (quest == 7) {
        return this.QUEST_48_7
      }
      else if (quest == 8) {
        return this.QUEST_48_8
      }
      else if (quest == 9) {
        return this.QUEST_48_9
      }
      else if (quest == 10) {
        return this.QUEST_48_10
      }
    }
    else if (episode == 49) {
      if (quest == 1) {
        return this.QUEST_49_1
      }
      else if (quest == 2) {
        return this.QUEST_49_2
      }
      else if (quest == 3) {
        return this.QUEST_49_3
      }
      else if (quest == 4) {
        return this.QUEST_49_4
      }
      else if (quest == 5) {
        return this.QUEST_49_5
      }
      else if (quest == 6) {
        return this.QUEST_49_6
      }
      else if (quest == 7) {
        return this.QUEST_49_7
      }
      else if (quest == 8) {
        return this.QUEST_49_8
      }
      else if (quest == 9) {
        return this.QUEST_49_9
      }
      else if (quest == 10) {
        return this.QUEST_49_10
      }
    }
    else if (episode == 50) {
      if (quest == 1) {
        return this.QUEST_50_1
      }
      else if (quest == 2) {
        return this.QUEST_50_2
      }
      else if (quest == 3) {
        return this.QUEST_50_3
      }
      else if (quest == 4) {
        return this.QUEST_50_4
      }
      else if (quest == 5) {
        return this.QUEST_50_5
      }
      else if (quest == 6) {
        return this.QUEST_50_6
      }
      else if (quest == 7) {
        return this.QUEST_50_7
      }
      else if (quest == 8) {
        return this.QUEST_50_8
      }
      else if (quest == 9) {
        return this.QUEST_50_9
      }
      else if (quest == 10) {
        return this.QUEST_50_10
      }
    }
    else if (episode == 51) {
      if (quest == 1) {
        return this.QUEST_51_1
      }
      else if (quest == 2) {
        return this.QUEST_51_2
      }
      else if (quest == 3) {
        return this.QUEST_51_3
      }
      else if (quest == 4) {
        return this.QUEST_51_4
      }
      else if (quest == 5) {
        return this.QUEST_51_5
      }
      else if (quest == 6) {
        return this.QUEST_51_6
      }
      else if (quest == 7) {
        return this.QUEST_51_7
      }
      else if (quest == 8) {
        return this.QUEST_51_8
      }
      else if (quest == 9) {
        return this.QUEST_51_9
      }
      else if (quest == 10) {
        return this.QUEST_51_10
      }
    }
    else if (episode == 52) {
      if (quest == 1) {
        return this.QUEST_52_1
      }
      else if (quest == 2) {
        return this.QUEST_52_2
      }
      else if (quest == 3) {
        return this.QUEST_52_3
      }
      else if (quest == 4) {
        return this.QUEST_52_4
      }
      else if (quest == 5) {
        return this.QUEST_52_5
      }
      else if (quest == 6) {
        return this.QUEST_52_6
      }
      else if (quest == 7) {
        return this.QUEST_52_7
      }
      else if (quest == 8) {
        return this.QUEST_52_8
      }
      else if (quest == 9) {
        return this.QUEST_52_9
      }
      else if (quest == 10) {
        return this.QUEST_52_10
      }
    }
    else if (episode == 53) {
      if (quest == 1) {
        return this.QUEST_53_1
      }
      else if (quest == 2) {
        return this.QUEST_53_2
      }
      else if (quest == 3) {
        return this.QUEST_53_3
      }
      else if (quest == 4) {
        return this.QUEST_53_4
      }
      else if (quest == 5) {
        return this.QUEST_53_5
      }
      else if (quest == 6) {
        return this.QUEST_53_6
      }
      else if (quest == 7) {
        return this.QUEST_53_7
      }
      else if (quest == 8) {
        return this.QUEST_53_8
      }
      else if (quest == 9) {
        return this.QUEST_53_9
      }
      else if (quest == 10) {
        return this.QUEST_53_10
      }
    }
    else if (episode == 54) {
      if (quest == 1) {
        return this.QUEST_54_1
      }
      else if (quest == 2) {
        return this.QUEST_54_2
      }
      else if (quest == 3) {
        return this.QUEST_54_3
      }
      else if (quest == 4) {
        return this.QUEST_54_4
      }
      else if (quest == 5) {
        return this.QUEST_54_5
      }
      else if (quest == 6) {
        return this.QUEST_54_6
      }
      else if (quest == 7) {
        return this.QUEST_54_7
      }
      else if (quest == 8) {
        return this.QUEST_54_8
      }
      else if (quest == 9) {
        return this.QUEST_54_9
      }
      else if (quest == 10) {
        return this.QUEST_54_10
      }
    }
    else if (episode == 55) {
      if (quest == 1) {
        return this.QUEST_55_1
      }
      else if (quest == 2) {
        return this.QUEST_55_2
      }
      else if (quest == 3) {
        return this.QUEST_55_3
      }
      else if (quest == 4) {
        return this.QUEST_55_4
      }
      else if (quest == 5) {
        return this.QUEST_55_5
      }
      else if (quest == 6) {
        return this.QUEST_55_6
      }
      else if (quest == 7) {
        return this.QUEST_55_7
      }
      else if (quest == 8) {
        return this.QUEST_55_8
      }
      else if (quest == 9) {
        return this.QUEST_55_9
      }
      else if (quest == 10) {
        return this.QUEST_55_10
      }
    }
    else if (episode == 56) {
      if (quest == 1) {
        return this.QUEST_56_1
      }
      else if (quest == 2) {
        return this.QUEST_56_2
      }
      else if (quest == 3) {
        return this.QUEST_56_3
      }
      else if (quest == 4) {
        return this.QUEST_56_4
      }
      else if (quest == 5) {
        return this.QUEST_56_5
      }
      else if (quest == 6) {
        return this.QUEST_56_6
      }
      else if (quest == 7) {
        return this.QUEST_56_7
      }
      else if (quest == 8) {
        return this.QUEST_56_8
      }
      else if (quest == 9) {
        return this.QUEST_56_9
      }
      else if (quest == 10) {
        return this.QUEST_56_10
      }
    }
    else if (episode == 57) {
      if (quest == 1) {
        return this.QUEST_57_1
      }
      else if (quest == 2) {
        return this.QUEST_57_2
      }
      else if (quest == 3) {
        return this.QUEST_57_3
      }
      else if (quest == 4) {
        return this.QUEST_57_4
      }
      else if (quest == 5) {
        return this.QUEST_57_5
      }
      else if (quest == 6) {
        return this.QUEST_57_6
      }
      else if (quest == 7) {
        return this.QUEST_57_7
      }
      else if (quest == 8) {
        return this.QUEST_57_8
      }
      else if (quest == 9) {
        return this.QUEST_57_9
      }
      else if (quest == 10) {
        return this.QUEST_57_10
      }
      else if (quest == 11) {
        return this.QUEST_57_11
      }
    }
    else if (episode == 58) {
      if (quest == 1) {
        return this.QUEST_58_1
      }
      else if (quest == 2) {
        return this.QUEST_58_2
      }
      else if (quest == 3) {
        return this.QUEST_58_3
      }
      else if (quest == 4) {
        return this.QUEST_58_4
      }
      else if (quest == 5) {
        return this.QUEST_58_5
      }
      else if (quest == 6) {
        return this.QUEST_58_6
      }
      else if (quest == 7) {
        return this.QUEST_58_7
      }
      else if (quest == 8) {
        return this.QUEST_58_8
      }
      else if (quest == 9) {
        return this.QUEST_58_9
      }
      else if (quest == 10) {
        return this.QUEST_58_10
      }
      else if (quest == 11) {
        return this.QUEST_58_11
      }
    }
    else if (episode == 59) {
      if (quest == 1) {
        return this.QUEST_59_1
      }
      else if (quest == 2) {
        return this.QUEST_59_2
      }
      else if (quest == 3) {
        return this.QUEST_59_3
      }
      else if (quest == 4) {
        return this.QUEST_59_4
      }
      else if (quest == 5) {
        return this.QUEST_59_5
      }
      else if (quest == 6) {
        return this.QUEST_59_6
      }
      else if (quest == 7) {
        return this.QUEST_59_7
      }
      else if (quest == 8) {
        return this.QUEST_59_8
      }
      else if (quest == 9) {
        return this.QUEST_59_9
      }
      else if (quest == 10) {
        return this.QUEST_59_10
      }
      else if (quest == 11) {
        return this.QUEST_59_11
      }
    }
    else if (episode == 60) {
      if (quest == 1) {
        return this.QUEST_60_1
      }
      else if (quest == 2) {
        return this.QUEST_60_2
      }
      else if (quest == 3) {
        return this.QUEST_60_3
      }
      else if (quest == 4) {
        return this.QUEST_60_4
      }
      else if (quest == 5) {
        return this.QUEST_60_5
      }
      else if (quest == 6) {
        return this.QUEST_60_6
      }
      else if (quest == 7) {
        return this.QUEST_60_7
      }
      else if (quest == 8) {
        return this.QUEST_60_8
      }
      else if (quest == 9) {
        return this.QUEST_60_9
      }
      else if (quest == 10) {
        return this.QUEST_60_10
      }
      else if (quest == 11) {
        return this.QUEST_60_11
      }
    }
    else if (episode == 61) {
      if (quest == 1) {
        return this.QUEST_61_1
      }
      else if (quest == 2) {
        return this.QUEST_61_2
      }
      else if (quest == 3) {
        return this.QUEST_61_3
      }
      else if (quest == 4) {
        return this.QUEST_61_4
      }
      else if (quest == 5) {
        return this.QUEST_61_5
      }
      else if (quest == 6) {
        return this.QUEST_61_6
      }
      else if (quest == 7) {
        return this.QUEST_61_7
      }
      else if (quest == 8) {
        return this.QUEST_61_8
      }
      else if (quest == 9) {
        return this.QUEST_61_9
      }
      else if (quest == 10) {
        return this.QUEST_61_10
      }
      else if (quest == 11) {
        return this.QUEST_61_11
      }
    }
    else if (episode == 62) {
      if (quest == 1) {
        return this.QUEST_62_1
      }
      else if (quest == 2) {
        return this.QUEST_62_2
      }
      else if (quest == 3) {
        return this.QUEST_62_3
      }
      else if (quest == 4) {
        return this.QUEST_62_4
      }
      else if (quest == 5) {
        return this.QUEST_62_5
      }
      else if (quest == 6) {
        return this.QUEST_62_6
      }
      else if (quest == 7) {
        return this.QUEST_62_7
      }
      else if (quest == 8) {
        return this.QUEST_62_8
      }
      else if (quest == 9) {
        return this.QUEST_62_9
      }
      else if (quest == 10) {
        return this.QUEST_62_10
      }
      else if (quest == 11) {
        return this.QUEST_62_11
      }
    }
    else if (episode == 63) {
      if (quest == 1) {
        return this.QUEST_63_1
      }
      else if (quest == 2) {
        return this.QUEST_63_2
      }
      else if (quest == 3) {
        return this.QUEST_63_3
      }
      else if (quest == 4) {
        return this.QUEST_63_4
      }
      else if (quest == 5) {
        return this.QUEST_63_5
      }
      else if (quest == 6) {
        return this.QUEST_63_6
      }
      else if (quest == 7) {
        return this.QUEST_63_7
      }
      else if (quest == 8) {
        return this.QUEST_63_8
      }
      else if (quest == 9) {
        return this.QUEST_63_9
      }
      else if (quest == 10) {
        return this.QUEST_63_10
      }
      else if (quest == 11) {
        return this.QUEST_63_11
      }
    }
    else if (episode == 64) {
      if (quest == 1) {
        return this.QUEST_64_1
      }
      else if (quest == 2) {
        return this.QUEST_64_2
      }
      else if (quest == 3) {
        return this.QUEST_64_3
      }
      else if (quest == 4) {
        return this.QUEST_64_4
      }
      else if (quest == 5) {
        return this.QUEST_64_5
      }
      else if (quest == 6) {
        return this.QUEST_64_6
      }
      else if (quest == 7) {
        return this.QUEST_64_7
      }
      else if (quest == 8) {
        return this.QUEST_64_8
      }
      else if (quest == 9) {
        return this.QUEST_64_9
      }
      else if (quest == 10) {
        return this.QUEST_64_10
      }
      else if (quest == 11) {
        return this.QUEST_64_11
      }
    }
  }
  
  updateDeploymentConfiguration() {
    updatedUnitNumber := 0
    updatedAllyNumber := 0
    this.deploymentConfiguration.setDeployNumber(updatedUnitNumber)
    this.deploymentConfiguration.setAllyNumber(updatedAllyNumber)
  }

  play() {
    if (this.isQuestMenu()) {
      if (this.isExitEpisodeList()) {
        this.selectEpisode()
      }
      else if (this.isExit()) {
        if (this.selectQuest() == false) {
          this.episodeList()
        }
        else {
          this.updateDeploymentConfiguration()
        }
      }
    }
  }
}
