function get_sets()

    maps()

    attack2 = 4000 -- This LUA will equip "high buff" WS sets if the attack value of your TP set (or idle set if WSing from idle) is higher than this value
    
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    AccFlag            = 1 -- Cycle between various accuracy levels
    HasteFlag          = 0 -- Cycle between various haste levels
    HybridTPFlag       = false -- Force TP set to use 50% DT
    MagicBurstFlag     = false -- Use Magic Burst set when casting nukes.
    UtsuEnmityFlag     = false -- Use Enmity+ set when casting Utsusemi with Yonin up

    -- F# commands
    -- ! == alt
    -- ^ == ctrl

    send_command("bind f9 gs c cycle TP mode")
    send_command("bind f10 gs c cycle Haste")
    send_command("bind f11 gs c Equip Movement")
    send_command("bind f12 gs c Equip DT")

    -- Ctrl+F# commands
    send_command("bind ^f9 gs c Equip Treasure Hunter")
    send_command("bind ^f10 gs c Nagi")
    send_command("bind ^f11 gs c Free Slot")
    send_command("bind ^f12 gs c toggle MagicBurst")
  
    -- Alt+F# commands
    send_command("bind !f9 gs c Heishi")
    send_command("bind !f10 gs c Kikoku")
    send_command("bind !f11 gs c Kannagi")
    send_command("bind !f12 gs c Naegling")

    -- Ctrl+Alt+F# commands
    send_command("bind ^!f9 gs c Hachimonji")
    send_command("bind ^!f10 gs c Free spot")
    send_command("bind ^!f11 gs c Toggle UtsuEnmity")
    send_command("bind ^!f12 gs c toggle toggle HybridTP")



    function file_unload()
        send_command("unbind f9")
        send_command("unbind f10")
        send_command("unbind f11")
        send_command("unbind f12")
        send_command("unbind ^f9")
        send_command("unbind ^f10")
        send_command("unbind ^f11")
        send_command("unbind ^f12")
        send_command("unbind !f9")
        send_command("unbind !f10")
        send_command("unbind !f11")
        send_command("unbind !f12")
        send_command("unbind ^!f9")
        send_command("unbind ^!f10")
        send_command("unbind ^!f11")
        send_command("unbind ^!f12")
    end

    function check_param()
        print("-------------------------")
        if AccFlag == 1 then
            print("Accuracy Mode:...1250 Eva")
        elseif AccFlag == 2 then
            print("Accuracy Mode:...1350 Eva")
        elseif AccFlag == 3 then
            print("Accuracy Mode:...1500 Eva")
        end

        if HasteFlag == 0 then
            print("Haste Level:...........0%")
        elseif HasteFlag == 1 then
            print("Haste Level:..........15%")
        elseif HasteFlag == 2 then
            print("Haste Level:..........30%")
        elseif HasteFlag == 3 then
            print("Haste Level:..........Cap")
        end

        if HybridTPFlag == false then
            print("Hybrid TP:............OFF")
        elseif HybridTPFlag == true then
            print("Hybrid TP:.............ON")
        end

        if MagicBurstFlag == false then
            print("Magic Burst:..........OFF")
        elseif MagicBurstFlag == true then
            print("Magic Burst:...........ON")
        end

        if UtsuEnmityFlag == false then
            print("Utsu: Enmity:.........OFF")
        elseif UtsuEnmityFlag == true then
            print("Utsu: Enmity:..........ON")
        end
        print("-------------------------")
    end

    function self_command(command)

        if command == "toggle MagicBurst" then
            if MagicBurstFlag == false then
                MagicBurstFlag = true
                send_command("@input /echo Magic Burst: ON")
            elseif MagicBurstFlag == true then
                MagicBurstFlag = false
                send_command("@input /echo Magic Burst: OFF")
            end
            check_param()
        end

        if command == "toggle UtsuEnmity" then
            if UtsuEnmityFlag == false then
                UtsuEnmityFlag = true
                send_command("@input /echo Utsu Enmity: ON")
            elseif UtsuEnmityFlag == true then
                UtsuEnmityFlag = false
                send_command("@input /echo Utsu Enmity: OFF")
            end
            check_param()
        end

        if command == "Equip Treasure Hunter" then
            equip(sets.Treasure)
            send_command("@input /echo Treasure Hunter +4 equipped")
        end

        if command == "cycle Haste" then
            if HasteFlag == 0 then
                HasteFlag = 1
                send_command("@input /echo Haste Level: 15%")
            elseif HasteFlag == 1 then
                HasteFlag = 2
                send_command("@input /echo Haste Level: 30%")
            elseif HasteFlag == 2 then
                HasteFlag = 3
                send_command("@input /echo Haste Level: Capped")
            elseif HasteFlag == 3 then
                HasteFlag = 0
                send_command("@input /echo Haste Level: 0%")
            end
        check_param()
        end

        if command == "cycle TP mode" then
            if AccFlag == 1 then
                AccFlag = 2
                send_command("@input /echo Accuracy mode: 1350 Eva")
            elseif AccFlag == 2 then
                AccFlag = 3
                send_command("@input /echo Accuracy mode: 1500 Eva")
            elseif AccFlag == 3 then
                AccFlag = 1
                send_command("@input /echo Accuracy mode: 1250 Eva")
            end
            check_param()
        end

        if command == "toggle HybridTP" then
            if HybridTPFlag == true then
                HybridTPFlag = false
                send_command("@input /echo Hybrid DT + Melee toggled OFF")
            elseif HybridTPFlag == false then
                HybridTPFlag = true
                send_command("@input /echo Hybrid DT + Melee toggled ON")
            end
        check_param()
        end

        if command == "Equip DT" then
            equip(sets.status.Idle.DT)
            send_command("@input /echo Damage Taken set equipped.")
        end

        if command == "Equip MEva" then
            equip(sets.status.Idle.Eva)
            send_command("@input /echo Idle Evasion set equipped.")
        end




        if command == "Heishi" then
            equip({main="Heishi Shorinken", sub="Kunimitsu"})
            send_command("@input /echo Heishi & Kunimitsu equipped.")
        end

        if command == "Kikoku" then
            equip({main="Kikoku", sub="Kunimitsu"})
            send_command("@input /echo Kikoku & Kunimitsu equipped.")
        end

        if command == "Kannagi" then
            equip({main="Kannagi", sub="Gleti's Knife"})
            send_command("@input /echo Kannagi & Gleti's Knife equipped.")
        end

        if command == "Naegling" then
            equip({main="Naegling", sub="Hitaki"})
            send_command("@input /echo Naegling & Hitaki equipped.")
        end

        
        if command == "Nagi" then
            equip({main="Nagi", sub="Tsuru"})
            send_command("@input /echo Nagi & Tsuru equipped.")
        end

        if command == "Hachimonji" then
            equip({main="Hachimonji"})
            send_command("@input /echo Hachimonji equipped.")
        end


        if command == "Equip Movement" then
            if world.time/60. > 17 or world.time/60. < 7 then
                equip({feet = gear.Artifact.feet})
                send_command("@input /echo Hachiya Kyahan +3 equipped.")
            else
                equip({feet="Danzo Sune-Ate"})
                send_command("@input /echo Danzo Sune-Ate equipped.")
            end
        end

    end


    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    gear = {}


    gear.Artifact = {}
    gear.Artifact.head  = { name="Hachiya Hatsu. +3" }
    gear.Artifact.body  = { name="Hachiya Chainmail +3"}
    gear.Artifact.hands = {}
    gear.Artifact.legs  = {}
    gear.Artifact.feet  = { name="Hachiya Kyahan +3" }

    gear.Relic = {}
    gear.Relic.head  = { name="Mochi. Hatsuburi +3"}
    gear.Relic.body  = { name="Mochi. Chainmail +3"}
    gear.Relic.hands = { name="Mochizuki Tekko +3"}
    gear.Relic.legs  = { name="Mochi. Hakama +3"}
    gear.Relic.feet  = { name="Mochi. Kyahan +3"}

    gear.Empyrean = {}
    gear.Empyrean.head  = { name="Hattori Zukin +2"}
    gear.Empyrean.body  = { name="Hattori Ningi +2"}
    gear.Empyrean.hands = { name="Hattori Tekko +3"}
    gear.Empyrean.legs  = { name="Hattori Hakama +3"}
    gear.Empyrean.feet  = { name="Hattori Kyahan +3"}


    gear.AmbuCape = {}
    gear.AmbuCape.DAdex   = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
    gear.AmbuCape.DW      = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}}
    gear.AmbuCape.Crit    = { name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Crit.hit rate+10',}}
    gear.AmbuCape.Evasion = { name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
    gear.AmbuCape.Nuke    = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
    gear.AmbuCape.SIRD    = { name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Spell interruption rate down-10%',}}
    gear.AmbuCape.STP     = { name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}}
    gear.AmbuCape.WSDdex  = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
    gear.AmbuCape.WSDstr  = { name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}


    -- gear.Kanaria = {}
    -- gear.Kanaria.TH = { name="Kanaria", augments={'Mag. Acc.+25','Pet: DEX+9','"Treasure Hunter"+2','DMG:+13',}}
    -- gear.Kanaria.TA = { name="Kanaria", augments={'"Triple Atk."+3','DEX+14','Accuracy+16','Attack+20',}}
    -- gear.Kanaria.QA = { name="Kanaria", augments={'Attack+24','Pet: Mag. Acc.+24','Quadruple Attack +3','DMG:+15',}}


    gear.Ryuo = {}
    gear.Ryuo.head = {}
    gear.Ryuo.head.STP = { name="Ryuo Somen +1", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}}


    gear.Adhemar = {}
    gear.Adhemar.head = {}
    gear.Adhemar.head.Accuracy = { name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
    gear.Adhemar.head.Attack   = { name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}}
    gear.Adhemar.body = {}
    gear.Adhemar.body.Accuracy = { name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
    gear.Adhemar.body.Attack   = { name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}
    gear.Adhemar.hands = {}
    gear.Adhemar.hands.Accuracy = { name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
    gear.Adhemar.hands.Attack   = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}}



    gear.Herc = {}
    gear.Herc.head = {}
    gear.Herc.head.FC = { name="Herculean Helm", augments={'"Mag.Atk.Bns."+6','"Fast Cast"+4',}}
    gear.Herc.feet = {}
    gear.Herc.feet.QA = { name="Herculean Boots", augments={'Accuracy+17','Pet: STR+1','Quadruple Attack +3','Accuracy+18 Attack+18','Mag. Acc.+3 "Mag.Atk.Bns."+3',}}


    gear.Taeon = {}
    gear.Taeon.head = {}
    gear.Taeon.body = {}
    gear.Taeon.legs = {}
    gear.Taeon.feet = {}
    gear.Taeon.head.SIRD = { name="Taeon Chapeau", augments={'Evasion+25','Spell interruption rate down -10%','HP+49',}}
    gear.Taeon.body.SIRD = { name="Taeon Tabard", augments={'Evasion+25','Spell interruption rate down -10%','HP+47',}}
    gear.Taeon.legs.SIRD = { name="Taeon Tights", augments={'Evasion+25','Spell interruption rate down -10%','HP+50',}}
    gear.Taeon.feet.SIRD = { name="Taeon Boots", augments={'Evasion+24','Spell interruption rate down -10%','HP+45',}}


    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 

    sets.Treasure = {
        -- +4 Treasure Hunter cap.
        ammo="Perfect Lucky Egg",
        head="Volte Cap",
        -- feet="Volte Boots",
        hands="Volte Bracers",
        waist="Chaac Belt",
    }

    sets.HolyWater = {
        neck="Nicander's Necklace",
        ring2="Purity Ring",
    }

    sets.status = {}
    sets.status.Idle = {}
    sets.status.Idle.DT = {
        ammo="Staunch Tathlum +1",
        head="Null Masque",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        -- waist="Engraved Belt", -- Uncomment when Light/Dark resist is needed
        waist="Null Belt",
        ear1="Etiolation Earring",
        ear2="Sanare Earring",
        ring1="Defending Ring",
        ring2="Shadow Ring",
        back="Shadow Mantle",
    }

    sets.AbysseaTP = {
        ammo="Per. Lucky Egg",
        head="Volte Cap",
        body="Malignance Tabard",
        hands="Volte Bracers",
        legs="Samnuha Tights",
        feet="Tatena. Sune. +1",
        neck="Ninja Nodowa +2",
        waist="Chaac Belt",
        ear1="Brutal Earring",
        ear2="Dedition Earring",
        ring1="Gere Ring",
        ring2="Lehko's Ring",
        back="Null Shawl",
    }

    sets.Regain = {
        ammo="Staunch Tathlum +1",
        head = gear.Ryuo.head.STP,
        body = gear.Relic.body,
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        waist="Reiki Yotai",
        ear1="Eabani Earring",
        ear2="Suppanomimi",
        ring1="Defending Ring",
        ring2="Shadow Ring",
        back = gear.AmbuCape.DW,
    }

    sets.Melee = {}
    sets.Melee.LowAccuracy = {}
    sets.Melee.LowAccuracy.Haste0 = {
        -- Low accuracy vs 1250 evasion without any Haste
        -- -35% DT requirement
        -- Assumes Grape Daifuku food
        ammo="Seki Shuriken",
        head = gear.Ryuo.head.STP,
        body = gear.Relic.body,
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Ninja Nodowa +2",
        waist="Reiki Yotai",
        ear1="Suppanomimi",
        ear2="Dedition Earring",
        ring1="Defending Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.DW,
    }
    sets.Melee.LowAccuracy.Haste15 = {
        -- Low accuracy vs 1250 evasion with Haste
        -- -35% DT requirement
        -- Assumes Grape Daifuku food
        ammo="Seki Shuriken",
        head = gear.Ryuo.head.STP,
        body="Mpaca's Doublet",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Ninja Nodowa +2",
        waist="Reiki Yotai",
        ear1="Suppanomimi",
        ear2="Dedition Earring",
        ring1="Gere Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.DW,
    }
    sets.Melee.LowAccuracy.Haste30 = {
        -- Low accuracy vs 1250 evasion with Haste II
        -- -35% DT requirement
        -- Assumes Grape Daifuku food
        ammo="Seki Shuriken",
        head = gear.Ryuo.head.STP,
        body="Mpaca's Doublet",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Ninja Nodowa +2",
        waist="Reiki Yotai",
        ear1="Suppanomimi",
        ear2="Dedition Earring",
        ring1="Gere Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.STP
    }
    sets.Melee.LowAccuracy.HasteCap = {
        -- Low accuracy vs 1250 evasion with Haste capped
        -- -35% DT requirement
        -- Assumes Grape Daifuku food
        ammo="Seki Shuriken",
        head="Malignance Chapeau",
        body="Mpaca's Doublet",
        hands="Malignance Gloves",
        legs="Samnuha Tights",
        feet="Malignance Boots",
        neck="Ninja Nodowa +2",
        waist="Windbuffet Belt +1",
        ear1="Cessance Earring",
        ear2="Dedition Earring",
        ring1="Gere Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.STP
    }

    sets.Melee.MidAccuracy = {}
    sets.Melee.MidAccuracy.Haste0 = {
        -- Mid accuracy vs 1350 evasion with Haste capped
        -- -35% DT requirement
        -- Assumes Grape Daifuku food
        ammo="Seki Shuriken",
        head = gear.Ryuo.head.STP,
        body = gear.Relic.body,
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Ninja Nodowa +2",
        waist="Reiki Yotai",
        ear1="Telos Earring",
        ear2="Eabani Earring",
        ring1="Defending Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.DW,
    }
    sets.Melee.MidAccuracy.Haste15 = {
        -- Mid accuracy vs 1350 evasion with Haste
        -- -35% DT requirement
        -- Assumes Grape Daifuku food
        ammo="Seki Shuriken",
        head = gear.Ryuo.head.STP,
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Ninja Nodowa +2",
        waist="Reiki Yotai",
        ear1="Telos Earring",
        ear2="Suppanomimi",
        ring1="Gere Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.DW,
    }
    sets.Melee.MidAccuracy.Haste30 = {
        -- Mid accuracy vs 1350 evasion with Haste II
        -- -35% DT requirement
        -- Assumes Grape Daifuku food
        ammo="Seki Shuriken",
        head = gear.Ryuo.head.STP,
        body = gear.Adhemar.body.Accuracy,
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Ninja Nodowa +2",
        waist="Reiki Yotai",
        ear1="Cessance Earring",
        ear2="Telos Earring",
        ring2="Defending Ring",
        ring1="Epona's Ring",
        back = gear.AmbuCape.DW,
    }
    sets.Melee.MidAccuracy.HasteCap = {
        -- Mid accuracy vs 1350 evasion with Haste capped
        -- -35% DT requirement
        -- Assumes Grape Daifuku food
        ammo="Seki Shuriken",
        head="Malignance Chapeau",
        body="Mpaca's Doublet",
        hands="Malignance Gloves",
        legs="Samnuha Tights",
        feet="Malignance Boots",
        neck="Ninja Nodowa +2",
        waist="Windbuffet Belt +1",
        ear1="Brutal Earring",
        ear2="Dedition Earring",
        ring1="Gere Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.STP,
    }

    sets.Melee.HighAccuracy = {
        -- High accuracy vs 1450 evasion with Haste capped
        -- -35% DT requirement
        -- Assumes Sublime Sushi food
        -- Assuming you have a BRD using HM+VM+Madrigal+Minuet5+Minuet4
        sub="Kunimitsu", -- This High Accuracy set requires the use of Kunimitsu for the Acc+ and RAcc+
        ammo="Seki Shuriken",
        head="Malignance Chapeau",
        body="Mpaca's Doublet",
        hands="Malignance Gloves",
        legs="Samnuha Tights",
        feet="Malignance Boots",
        neck="Ninja Nodowa +2",
        waist="Windbuffet Belt +1",
        ear1="Telos Earring",
        ear2="Dedition Earring",
        ring1="Gere Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.STP,
    }

    sets.Melee.Hybrid = {
        -- Hybrid Melee set for 1300 Evasion and 50% DT
        ammo="Seki Shuriken",
        head="Mpaca's Cap",
        body="Mpaca's Doublet",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Ninja Nodowa +2",
        waist="Windbuffet Belt +1",
        ear1="Cessance Earring",
        ear2="Dedition Earring",
        ring2="Defending Ring",
        ring1="Epona's Ring",
        back = gear.AmbuCape.STP,
    }

    sets.Melee.KannagiAM3 = {
        -- Kannagi AM3 set optimized for DPS against 1300 Evasion and 1450 Defense at Haste cap
        -- Assumes Grape Daifuku
        -- Ignoring Mpaca boots and Adhemar Path B.
        main="Kannagi",
        sub="Gleti's Knife",
        ranged=Empty,
        ammo="Date Shuriken",
        head="Blistering Sallet +1",
        body = gear.Empyrean.body,
        hands="Ryuo Tekko +1",
        legs="Mpaca's Hose",
        feet="Mpaca's Boots",
        neck="Ninja Nodowa +2",
        waist="Sailfi Belt +1",
        ear1="Odr Earring",
        ear2="Lugra Earring +1",
        ring1="Gere Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.Crit,
    }


    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    sets.precast = {}
    sets.precast.FastCast = {
        -- +56% Fast Cast, +7% Quick Magic
        ammo="Impatiens",
        head = gear.Herc.head.FC,
        body="Dread Jupon",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Gyve Trousers",
        feet = gear.Relic.feet,
        neck="Orunmila's Torque",
        ear1="Etiolation Earring",
        ear2="Loquac. Earring",
        ring1="Weather. Ring +1",
        ring2="Lebeche Ring",
        back = gear.AmbuCape.Evasion,
    }

    sets.precast.Utsusemi = {
        body = gear.Relic.body,
        neck="Magoraga bead necklace",
    }

    sets.Enmity = {
        -- +78 Enmity
        -- Yonin +30 to +10 (+18 for a simple number)
        -- Gekka +30
        -- Nagi +40
        -- Tsuru +15
        -- Total: +193 (cap of +200)
        ammo="Sapience Orb", -- +2
        head="Versa Celata", -- +5
        body="Emet Harness +1",  -- +10
        hands="Kurys Gloves",  -- +9
        legs="Zoar Subligar +1", -- +6
        feet = gear.Relic.feet, -- +8
        neck="Unmoving Collar +1", -- +10
        ear1="Trux Earring",  -- +5
        ear2="Cryptic Earring",  -- +4
        ring1="Petrov Ring",  -- +4
        ring2="Eihwaz Ring",  -- +5
        back = gear.AmbuCape.SIRD, -- +10
    }

    sets.WeaponSkill = {}
    sets.WeaponSkill.MidAtk = {}
    sets.WeaponSkill.HighAtk = {}


    sets.WeaponSkill.MidAtk["Blade: Ten"] = {
        -- 30% STR, 30% DEX
        -- FTP = [4.5, 11.5, 15.5]
        ammo="Seeth. Bomblet +1",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        ear1="Moonshade Earring",
        ear2="Lugra Earring +1",
        ring1="Gere Ring",
        ring2="Regal Ring",
        back = gear.AmbuCape.WSDstr,
    }
    sets.WeaponSkill.HighAtk["Blade: Ten"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Ninja Nodowa +2",
        waist="Sailfi Belt +1",
        ear1="Moonshade Earring",
        ear2="Lugra Earring +1",
        ring1="Regal Ring",
        ring2="Sroda Ring",
        back = gear.AmbuCape.WSDstr,
    }

    sets.WeaponSkill.MidAtk["Blade: Shun"] = {
        -- 73%/76%/79%/82%/85% DEX
        -- Attack *= [1.0, 2.0, 3.0]
        -- FTP = 1.0 Replicating
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Mpaca's Hose",
        feet = gear.Empyrean.feet,
        neck="Ninja Nodowa +2",
        waist="Fotia Belt",
        ear1="Odr Earring",
        ear2="Lugra Earring +1",
        ring1="Gere Ring",
        ring2="Regal Ring",
        back = gear.AmbuCape.DAdex,
    }
    sets.WeaponSkill.HighAtk["Blade: Shun"] = sets.WeaponSkill.MidAtk["Blade: Shun"]
  
    sets.WeaponSkill.MidAtk["Blade: Metsu"] = {
        -- 80% DEX
        -- FTP = 5.0
        ammo="Seeth. Bomblet +1",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Ninja Nodowa +2",
        waist="Sailfi Belt +1",
        ear1="Odr Earring",
        ear2="Lugra Earring +1",
        ring1="Gere Ring",
        ring2="Regal Ring",
        back = gear.AmbuCape.WSDdex,
    }
    sets.WeaponSkill.HighAtk["Blade: Metsu"] = {
        ammo="Crepuscular Pebble",
        head = gear.Artifact.head,
        body="Malignance Tabard",
        hands="Nyame Gauntlets",
        legs="Mpaca's Hose",
        feet = gear.Empyrean.feet,
        neck="Ninja Nodowa +2",
        waist="Kentarch Belt +1",
        ear1="Mache Earring +1",
        ear2="Lugra Earring +1",
        ring1="Gere Ring",
        ring2="Regal Ring",
        back = gear.AmbuCape.WSDdex,
    }

    sets.WeaponSkill.MidAtk["Blade: Hi"] = {
        -- 80% AGI
        -- CritRate += [0.15, 0.20, 0.25]
        ammo="Yetshila +1",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Ninja Nodowa +2",
        waist="Sailfi Belt +1",
        ear1="Odr Earring",
        ear2="Lugra Earring +1",
        ring1="Regal Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.Crit,
    }
    sets.WeaponSkill.HighAtk["Blade: Hi"] = {
        ammo="Yetshila +1",
        head = gear.Artifact.head,
        body="Nyame Mail",
        hands="Malignance Gloves",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Ninja Nodowa +2",
        waist="Kentarch Belt +1",
        ear1="Odr Earring",
        ear2="Lugra Earring +1",
        ring1="Regal Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.Crit,
    }

    sets.WeaponSkill.MidAtk["Blade: Jin"] = {
        ammo="Yetshila +1",
        head="Blistering Sallet +1",
        body="Mpaca's Doublet",
        hands="Nyame Gauntlets",
        legs="Mpaca's Hose",
        feet = gear.Empyrean.feet,
        neck="Ninja Nodowa +2",
        waist="Fotia Belt",
        ear1="Odr Earring",
        ear2="Lugra Earring +1",
        ring1="Gere Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.Crit,
    }
    sets.WeaponSkill.HighAtk["Blade: Jin"] = set_combine(sets.WeaponSkill.MidAtk["Blade: Jin"], {body="Tatena. Harama. +1", hands="Malignance Gloves",})

    sets.WeaponSkill.MidAtk["Blade: Retsu"] = {
        -- Potent Paralyze. Duration varies with TP, so stack TP Bonus and Magic Accuracy.
        ammo="Pemphredo Tathlum",
        head="Mpaca's Cap",
        body="Malignance Tabard",
        hands = gear.Empyrean.hands,
        legs="Malignance Tights",
        feet="Hattori Kyahan +3",
        neck="Null Loop",
        waist="Null Belt",
        ear1="Moonshade Earring",
        ear2="Crep. Earring",
        ring1="Weather. Ring +1",
        ring2="Metamor. Ring +1",
        back="Null Shawl",
    }
    sets.WeaponSkill.HighAtk["Blade: Retsu"] = sets.WeaponSkill.MidAtk["Blade: Retsu"]

    sets.WeaponSkill.MidAtk["Blade: Kamu"] = {
        -- 60% STR, 60% INT
        -- FTP = 1.0
        -- Attack *= 2.25, EnemyDef *= 0.75
        ammo="Crepuscular Pebble",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Mpaca's Hose",
        feet="Nyame Sollerets",
        neck="Ninja Nodowa +2",
        waist="Sailfi Belt +1",
        ear1="Brutal Earring",
        ear2="Lugra Earring +1",
        ring1="Sroda Ring",
        ring2="Gere Ring",
        back = gear.AmbuCape.WSDstr
    }
    sets.WeaponSkill.HighAtk["Blade: Kamu"] = sets.WeaponSkill.MidAtk["Blade: Kamu"]

    sets.WeaponSkill.MidAtk["Blade: Ku"] = {
        -- 30% STR, 30% DEX
        -- FTP = 1.25 replicating
        ammo="Coiste Bodhar",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands = gear.Relic.hands,
        legs="Mpaca's Hose",
        feet = gear.Empyrean.feet,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Mache Earring +1",
        ear2="Lugra Earring +1",
        ring1="Gere Ring",
        ring2="Regal Ring",
        back = gear.AmbuCape.DAdex,
    }
    sets.WeaponSkill.HighAtk["Blade: Ku"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Mpaca's Hose",
        feet = gear.Empyrean.feet,
        neck="Ninja Nodowa +2",
        waist="Fotia Belt",
        ear1="Mache Earring +1",
        ear2="Lugra Earring +1",
        ring1="Gere Ring",
        ring2="Sroda Ring",
        back = gear.AmbuCape.DAdex,
    }

    sets.WeaponSkill.MidAtk["Blade: Chi"] = {
    -- 30% STR, 30% INT
    -- FTP = [0.5, 1.375, 2.25]
    -- Earth-based Hybrid
        ammo="Seeth. Bomblet +1",
        head = gear.Relic.head,
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Fotia Gorget",
        waist="Orpheus's Sash",
        ear1="Moonshade Earring",
        ear2="Lugra Earring +1",
        ring1="Gere Ring",
        ring2="Epona's Ring",
        back = gear.AmbuCape.WSDstr,
    }
    sets.WeaponSkill.HighAtk["Blade: Chi"] = set_combine(sets.WeaponSkill.MidAtk["Blade: Chi"], {neck="Ninja Nodowa +2",})

    sets.WeaponSkill.MidAtk["Blade: To"] = sets.WeaponSkill.MidAtk["Blade: Chi"]
    sets.WeaponSkill.HighAtk["Blade: To"] = sets.WeaponSkill.HighAtk["Blade: Chi"]

    sets.WeaponSkill.MidAtk["Blade: Teki"] = sets.WeaponSkill.MidAtk["Blade: Chi"]
    sets.WeaponSkill.HighAtk["Blade: Teki"] = sets.WeaponSkill.HighAtk["Blade: Chi"]

    sets.WeaponSkill.MidAtk["Blade: Ei"] = {
        ammo="Seeth. Bomblet +1",
        head="Pixie Hairpin +1",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Baetyl Pendant",
        waist="Orpheus's Sash",
        ear1="Moonshade Earring",
        ear2="Friomisi Earring",
        ring1="Dingir",
        ring2="Archon Ring",
        back = gear.AmbuCape.Nuke,
    }
    sets.WeaponSkill.HighAtk["Blade: Ei"] = sets.WeaponSkill.MidAtk["Blade: Ei"]

    sets.WeaponSkill.MidAtk["Blade: Yu"] = {
        ammo="Ghastly Tathlum +1",
        head = gear.Relic.head,
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Baetyl Pendant",
        waist="Orpheus's Sash",
        ear1="Crematio Earring",
        ear2="Friomisi Earring",
        ring1="Dingir Ring",
        ring2="Shiva Ring +1",
        back = gear.AmbuCape.Nuke,
    }
    sets.WeaponSkill.HighAtk["Blade: Yu"] = sets.WeaponSkill.MidAtk["Blade: Yu"]

    sets.WeaponSkill.MidAtk["Aeolian Edge"] = {
        ammo="Pemphredo Tathlum",
        head = gear.Relic.head,
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Baetyl Pendant",
        waist="Orpheus's Sash",
        ear1="Moonshade Earring",
        ear2="Friomisi Earring",
        ring1="Dingir Ring",
        ring2="Shiva Ring +1",
        back = gear.AmbuCape.Nuke,
    }
    sets.WeaponSkill.HighAtk["Aeolian Edge"] = sets.WeaponSkill.MidAtk["Aeolian Edge"]

    sets.WeaponSkill.MidAtk["Evisceration"] = {
        -- 50% DEX
        -- CritRate += [0.1, 0.25, 0.50]
        -- FTP = 1.25 replicating
        ammo="Yetshila +1",
        head="Blistering Sallet +1",
        body="Mpaca's Doublet",
        hands="Malignance Gloves",
        legs="Mpaca's Hose",
        feet = gear.Empyrean.feet,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Odr Earring",
        ear2="Lugra Earring +1",
        ring1="Gere Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.WSDdex,
    }
    sets.WeaponSkill.HighAtk["Evisceration"] = set_combine(sets.WeaponSkill.MidAtk["Evisceration"], {neck="Ninja Nodowa +2",})

    sets.WeaponSkill.MidAtk["Savage Blade"] = {
        -- 50% STR, 50% MND
        -- FTP = [4.0, 10.25, 13.75]
        ammo="Seeth. Bomblet +1",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        ear1="Moonshade Earring",
        ear2="Lugra Earring +1",
        ring1="Gere Ring",
        ring2="Regal Ring",
        back = gear.AmbuCape.WSDstr,
    }
    sets.WeaponSkill.HighAtk["Savage Blade"] = {
        ammo="Crepuscular Pebble",
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Ninja Nodowa +2",
        waist="Sailfi Belt +1",
        ear1="Moonshade Earring",
        ear2="Lugra Earring +1",
        ring1="Gere Ring",
        ring2="Sroda Ring",
        back = gear.AmbuCape.WSDstr,
    }
  
    sets.WeaponSkill.MidAtk["Tachi: Ageha"] = sets.WeaponSkill.MidAtk["Blade: Retsu"]
    sets.WeaponSkill.HighAtk["Tachi: Ageha"] = sets.WeaponSkill.HighAtk["Blade: Retsu"]

    sets.WeaponSkill.MidAtk["Tachi: Kagero"] = set_combine(sets.WeaponSkill.MidAtk["Blade: Chi"], {waist="Fotia Belt",})
    sets.WeaponSkill.HighAtk["Tachi: Kagero"] = sets.WeaponSkill.MidAtk["Tachi: Kagero"]

    sets.WeaponSkill.MidAtk["Tachi: Goten"] = sets.WeaponSkill.MidAtk["Tachi: Kagero"]
    sets.WeaponSkill.HighAtk["Tachi: Goten"] = sets.WeaponSkill.HighAtk["Tachi: Kagero"]

    sets.WeaponSkill.MidAtk["Tachi: Koki"] = set_combine(sets.WeaponSkill.MidAtk["Tachi: Kagero"],{ring2="Weather. Ring +1",})
    sets.WeaponSkill.HighAtk["Tachi: Koki"] = set_combine(sets.WeaponSkill.HighAtk["Tachi: Kagero"],{ring2="Weather. Ring +1",})

    sets.WeaponSkill.MidAtk["Tachi: Jinpu"] = sets.WeaponSkill.MidAtk["Blade: Chi"]
    sets.WeaponSkill.HighAtk["Tachi: Jinpu"] = sets.WeaponSkill.HighAtk["Blade: Chi"]


    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    sets.midcast = {}

    sets.midcast.Nuke = {
        ammo="Ghastly Tathlum +1",
        head = gear.Relic.head,
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Relic.feet,
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        ear1="Crematio Earring",
        ear2="Friomisi Earring",
        ring1="Shiva Ring +1",
        ring2="Metamorph Ring +1",
        back = gear.AmbuCape.Nuke,
    }

    sets.midcast.MagicBurst = {
        main="Gokotai",
        sub="Kunimitsu",
        ammo="Ghastly Tathlum +1",
        head = gear.Relic.head,
        body="Nyame Mail",
        hands = gear.Empyrean.hands,
        legs="Nyame Flanchard",
        feet = gear.Relic.feet,
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        ear1="Crematio Earring",
        ear2="Friomisi Earring",
        ring1="Mujin Band",
        ring2="Metamorph Ring +1",
        back = gear.AmbuCape.Nuke,
    }
  
    sets.midcast.MagicAccuracy = {
        -- ranged="Ullr",
        head = gear.Artifact.head,
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet = gear.Empyrean.feet,
        neck="Null Loop",
        waist="Null Belt",
        ear1="Crepuscular Earring",
        ear2="Digni. Earring",
        ring1="Weather. Ring +1",
        ring2="Metamorph Ring +1",
        back="Null Shawl",
    }

    sets.midcast.Utsusemi = {
        feet = gear.Empyrean.feet,
        back = gear.AmbuCape.SIRD,
    }

    sets.midcast.SpellInterruption = {
        -- -95% Spell Interruption from gear (950/1024) for Utsusemi
        -- -105% for non-Utsusemi
        -- -10% more from merits for capped 1030/1024
        ammo="Impatiens",             -- -10%
        head = gear.Taeon.head.SIRD,  -- -10%
        body = gear.Taeon.body.SIRD,  -- -10%
        hands={ name="Rawhide Gloves", augments={'HP+50','Accuracy+15','Evasion+20',}}, -- -15%
        legs = gear.Taeon.legs.SIRD,  -- -10%
        feet = gear.Taeon.feet.SIRD,  -- -10% NOT EQUIPPED DURING UTSU; Empyrean Feet +3 are used for Shadows+
        neck="Moonbeam Necklace",     -- -10%
        waist="Audumbla Sash",        -- -10%
        ear1="Halasz Earring",        -- -5%
        ring1="Defending Ring",
        ring2="Evanescence Ring",     -- -5%
        back = gear.AmbuCape.SIRD     -- -10%
    }

end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function maps()

    Utsu    = S {"Utsusemi: Ichi", "Utsusemi: Ni", "Utsusemi: San"}
    Nukes   = S {"Katon: Ichi", "Katon: Ni", "Katon: San",
                "Suiton: Ichi", "Suiton: Ni", "Suiton: San",
                "Raiton: Ichi", "Raiton: Ni", "Raiton: San",
                "Doton: Ichi", "Doton: Ni", "Doton: San",
                "Huton: Ichi", "Huton: Ni", "Huton: San",
                "Hyoton: Ichi", "Hyoton: Ni", "Hyoton: San"}
    Enfeebles = S {"Hojo: Ichi", "Hojo: Ni", "Kurayami: Ichi", "Kurayami: Ni", "Jubaku: Ichi", "Dokumori: Ichi", "Aisha: Ichi", "Yurin: Ichi"}
    Enhancing = S {"Tonko: Ichi", "Tonki: Ni", "Monomi: Ichi", "Myoshu: Ichi", "Kakka: Ichi", "Migawari: Ichi", "Gekka: Ichi", "Yain: Ichi"}
    proc_ws   = S {"Shadow of Death", "Raiden Thrust", "Freezebite", "Tachi: Jinpu", "Tachi: Koki", "Earth Crusher", "Sunburst", "Red Lotus Blade", "Seraph Blade", "Cyclone", "Energy Drain", "Seraph Strike"}

end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function precast(spell)
    
    -- Changes to code logic for efficient Empyrean farming in Abyssea. Set to "false" to disable.
    in_abyssea = world.zone:contains("Abyssea") -- See https://docs.windower.net/addons/gearswap/reference/
    -- in_abyssea = false


    -- Determine which WS sets to use based on your attack in your TP set (or idle set if WSing unengaged).
    attack = player.attack
    if attack > attack2 then
        active_ws = sets.WeaponSkill.HighAtk
    else
        active_ws = sets.WeaponSkill.MidAtk
    end

    self = windower.ffxi.get_mob_by_target("me")

    target = windower.ffxi.get_mob_by_target("t") or windower.ffxi.get_mob_by_target("st") or self
    distance = math.sqrt((self.x - target.x)^2 + (self.y - target.y)^2)
    weather_intensity = gearswap.res.weather[world.weather_id].intensity

    -- Cancel weapon skill if enemy is further than 7 yalms away to prevent losing TP. This value should be larger for "large" model enemies such as Fafnir.
    if active_ws[spell.name] then
        if distance > 7 then
            send_command("@input /echo Target too far away.")
            cancel_spell()
        end
    equip(active_ws[spell.name])

    elseif Utsu:contains(spell.name) then
        equip(set_combine(sets.precast.FastCast, sets.precast.Utsusemi))

    elseif spell.name == "Provoke" or spell.name == "Animated Flourish" or spell.name == "Flash" then
        equip(set_combine(sets.Enmity))

    elseif spell.type=="WeaponSkill" then
        if distance > 7 then
            send_command("@input /echo Target too far away.")
            cancel_spell()
        end
        equip(active_ws["Blade: Ten"]) -- Default to Blade: Ten weapon skill sets if no set is defined for selected WS.

    elseif spell.name == "Mijin Gakure" then
        equip({main="Nagi"})

    elseif spell.name:contains("Step") or spell.name:contains("step") or spell.name:contains("Jump") then
        equip(sets.Melee.HighAccuracy)
        
    elseif spell.name == "Violent Flourish" then
        equip(sets.midcast.MagicAccuracy)

    elseif spell.name == "Spectral Jig" and buffactive["Sneak"] then
        -- If using Spectral Jig, automatically remove Sneak so the spell does not fail.
        windower.ffxi.cancel_buff(71)

    elseif spell.name == "Holy Water" then
        equip(set_combine(sets.status.Idle.DT, sets.HolyWater))

    else
        equip(sets.precast.FastCast)

    end

    if proc_ws:contains(spell.name) and in_abyssea then
        equip(sets.midcast.MagicAccuracy)
    end

    if in_abyssea then
        equip(sets.Treasure)
    end

    if UtsuEnmityFlag==true and spell.name == "Aeolian Edge" then
        equip(sets.Treasure)
    end
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function midcast(spell)

    if spell.name == "Sange" then
        equip({ammo="Happo Shuriken",}) -- Equip Shuriken as Sange is being used to prevent wasting a Seki

    elseif spell.skill == "Ninjutsu" then

        if spell.name == "Migawari: Ichi" then
            equip(set_combine(sets.status.Idle.DT, sets.precast.FastCast))

        elseif Utsu:contains(spell.name) then
            if buffactive["Yonin"] and UtsuEnmityFlag==true then
                equip(set_combine(sets.status.Idle.DT, sets.Enmity, sets.midcast.Utsusemi))
            else
                equip(set_combine(sets.status.Idle.DT, sets.midcast.SpellInterruption, sets.midcast.Utsusemi))
            end
            -- Cancel high tiers of Utsusemi when casting lower tiers:
            if not buffactive["Copy Image (4+)"] and not buffactive["Copy Image (3)"] and not buffactive["Copy Image (2)"] and not buffactive["Copy Image"] or current_utsusemi == nil then
                -- If there is no Copy Image buff up, then set current Utsusemi priority = 0
                -- Cancel any pre-existing Utsusemi during this mid-cast.
                --   This is for the edge-case that occurs when you load this gearswap with shadows already up.
                --   It prevents it from throwing an error for the first cast before a priority is set.
                windower.ffxi.cancel_buff(446)  -- Copy Image (4+)
                windower.ffxi.cancel_buff(445)  -- Copy Image (3)
                windower.ffxi.cancel_buff(444)  -- Copy Image (2)
                windower.ffxi.cancel_buff(66)   -- Copy Image
                current_utsusemi = 0
            else
                -- If Utsusemi is already up, determine the priority of the Utsusemi being casted.
                if spell.name == "Utsusemi: Ichi" then
                    try_utsusemi = 1
                elseif spell.name == "Utsusemi: Ni" then
                    try_utsusemi = 2
                elseif spell.name == "Utsusemi: San" then
                    try_utsusemi = 3
                end
                if try_utsusemi < current_utsusemi then
                    -- This will still remove the existing Copy Image if you get interrupted.
                    -- using 'if not spell.interrupted' does not work for midcast
                    -- cancelling Copy Image and getting interrupted isn't optimal, but it's better than casting Utsusemi and not getting any shadows.
                    -- plus, if you got interrupted, then you probably don't have shadows anyway. So this is fine as is.
                    windower.ffxi.cancel_buff(446)  -- Copy Image (4+)
                    windower.ffxi.cancel_buff(445)  -- Copy Image (3)
                    windower.ffxi.cancel_buff(444)  -- Copy Image (2)
                    windower.ffxi.cancel_buff(66)   -- Copy Image
                end
            end

        elseif Nukes:contains(spell.name) then

            if MagicBurstFlag == true then
                equip(sets.midcast.MagicBurst)
                if spell.element == "Lightning" then -- Only swap to Donar Gun if magic bursting, since the magic burst set already swaps weapons and loses TP
                    equip({ranged="Donar Gun", ammo=empty})
                end
            else
                equip(sets.midcast.Nuke)
            end

            if buffactive["Futae"] then
                equip({hands = gear.Empyrean.hands})
            end

            if (world.weather_element == spell.element and world.day_element == spell.element) or (world.weather_element == spell.element and weather_intensity == 2) then
                equip({waist="Hachirin-no-Obi"})
            elseif distance < 7 then
                equip({waist="Orpheus's Sash"})
            elseif world.weather_element == spell.element or world.day_element == spell.element then
                equip({waist="Hachirin-no-Obi"})
            end

            if in_abyssea then
                equip(sets.Treasure)
            end

        elseif Enfeebles:contains(spell.name) then
            equip(sets.midcast.MagicAccuracy)

        elseif Enhancing:contains(spell.name) then
            equip(sets.midcast.SpellInterruption)
        end

    elseif spell.name=="Provoke" or spell.name=="Animated Flourish" or spell.name=="Flash" then
        equip(sets.Enmity)
    end

    if spell.name == "Dokumori: Ichi" then
        equip(sets.Treasure)
    end

end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function aftercast(spell)

    if player.status == "Idle" then
         
        equip(sets.status.Idle.DT)

        if in_abyssea then
            equip(set_combine(sets.status.Idle.DT, sets.Regain))
            if world.time/60. > 17 or world.time/60. < 7 then
                equip({feet = gear.Artifact.feet})
            else
                equip({feet="Danzo Sune-Ate"})
            end
        end


    elseif player.status == "Engaged" then

        if HybridTPFlag then
            equip(sets.Melee.Hybrid)

        elseif (buffactive["Aftermath: Lv.3"] or buffactive["Aftermath: Lv.2"] or buffactive["Aftermath: Lv.1"]) and player.equipment.main=="Kannagi" and HasteFlag == 3 then
            equip(sets.Melee.KannagiAM3)

        elseif AccFlag == 1 then
            if HasteFlag == 0 then
                equip(sets.Melee.LowAccuracy.Haste0)
            elseif HasteFlag == 1 then
                equip(sets.Melee.LowAccuracy.Haste15)
            elseif HasteFlag == 2 then
                equip(sets.Melee.LowAccuracy.Haste30)
            elseif HasteFlag == 3 then
                equip(sets.Melee.LowAccuracy.HasteCap)
            end

        elseif AccFlag == 2 then
            if HasteFlag == 0 then
                equip(sets.Melee.MidAccuracy.Haste0)
            elseif HasteFlag == 1 then
                equip(sets.Melee.MidAccuracy.Haste15)
            elseif HasteFlag == 2 then
                equip(sets.Melee.MidAccuracy.Haste30)
            elseif HasteFlag == 3 then
                equip(sets.Melee.MidAccuracy.HasteCap)
            end

        elseif AccFlag == 3 then
            equip(sets.Melee.HighAccuracy)
        end
        if in_abyssea then
            equip(sets.AbysseaTP) -- uncomment when in abyssea farming lights
        end
    end

    if Utsu:contains(spell.name) then
        if not spell.interrupted then
            -- If the spell is not interrupted, then set the current Utsusemi spell's priority.
            -- In other words: don't set a priority if the spell got interrupted for some reason.
            -- This current priority is compared to any future Utsusemi being casted.
            -- The higher priority loses and is removed to allow lower priority to take effect.
            -- This way you avoid "Utsusemi: Ichi fails to take effect." when casting Ichi with Ni/San shadows up still.
            if spell.name == "Utsusemi: Ichi" then
                current_utsusemi = 1
            elseif spell.name == "Utsusemi: Ni" then
                current_utsusemi = 2
            elseif spell.name == "Utsusemi: San" then
                current_utsusemi = 3
            end
        end
    end

    if buffactive["Sange"] or spell.name=="Sange" then
        equip({ammo="Happo Shuriken",})
    end


end


function status_change(new,old)

    if new == "Idle" then
        equip(sets.status.Idle.DT)

        if in_abyssea then
            equip(set_combine(sets.status.Idle.DT, sets.Regain))
            if world.time/60. > 17 or world.time/60. < 7 then
                equip({feet = gear.Artifact.feet})
            else
                equip({feet="Danzo Sune-Ate"})
            end
        end

    elseif new == "Engaged" then

        if HybridTPFlag then
            equip(sets.Melee.Hybrid)

        elseif (buffactive["Aftermath: Lv.3"] or buffactive["Aftermath: Lv.2"] or buffactive["Aftermath: Lv.1"]) and player.equipment.main=="Kannagi" and HasteFlag == 3 then
            equip(sets.Melee.KannagiAM3)

        elseif AccFlag == 1 then
            if HasteFlag == 0 then
                equip(sets.Melee.LowAccuracy.Haste0)
            elseif HasteFlag == 1 then
                equip(sets.Melee.LowAccuracy.Haste15)
            elseif HasteFlag == 2 then
                equip(sets.Melee.LowAccuracy.Haste30)
            elseif HasteFlag == 3 then
                equip(sets.Melee.LowAccuracy.HasteCap)
            end

        elseif AccFlag == 2 then
            if HasteFlag == 0 then
                equip(sets.Melee.MidAccuracy.Haste0)
            elseif HasteFlag == 1 then
                equip(sets.Melee.MidAccuracy.Haste15)
            elseif HasteFlag == 2 then
                equip(sets.Melee.MidAccuracy.Haste30)
            elseif HasteFlag == 3 then
                equip(sets.Melee.MidAccuracy.HasteCap)
            end

        elseif AccFlag == 3 then
            equip(sets.Melee.HighAccuracy)
        end

        if in_abyssea then
            equip(sets.AbysseaTP) -- uncomment when in abyssea farming lights
        end
    
    elseif sets.status[new] then
        equip(sets.status[new])
    end

    if buffactive["Sange"] then
        equip({ammo="Happo Shuriken",})
    end
end
