include('organizer-lib')

function get_sets()

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----------- TOGGLES ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    TPFlag = 0
    HasteFlag = 3

    send_command('bind f9 gs c cycle TP mode')
    send_command('bind f10 gs c cycle Haste')
    send_command('bind f11 gs c Equip Movement')
    send_command('bind f12 gs c Equip DT')

    send_command('bind !f9 gs c Naegling')
    send_command('bind !f10 gs c Ternion')
    send_command('bind !f11 gs c Gleti')
    send_command('bind !f12 gs c Malevolence')



    send_command('bind ^f9 gs c Equip Treasure Hunter')
    send_command('bind ^f12 gs c Equip Evasion')
    function file_unload()
        send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind f11')
        send_command('unbind f12')
        send_command('unbind !f9')
        send_command('unbind !f10')
        send_command('unbind !f11')
        send_command('unbind !f12')
        send_command('unbind ^f9')
        send_command('unbind ^f12')
    end
    function self_command(command)
        function check_param()
            print('-------------------------')
            if TPFlag == 0 then
                print('TP Set:........Default')
            elseif TPFlag == 1 then
                print('TP Set:..............DT')
            elseif TPFlag == 2 then
                print('TP Set:....Subtle Blow')
            elseif TPFlag == 3 then
                print('TP Set:.......Accuracy')
            end
            if HasteFlag == 0 then
                print('Haste Level:........0%')
            elseif HasteFlag == 1 then
                print('Haste Level:........15%')
            elseif HasteFlag == 2 then
                print('Haste Level:........30%')
            elseif HasteFlag == 3 then
                print('Haste Level:........Cap')
            end
            print('-------------------------')
        end

        if command == 'Equip Treasure Hunter' then
            equip(sets.Treasure)
            send_command('@input /echo Treasure Hunter +8 Equipped')
        end


        if command == 'cycle Haste' then
            if HasteFlag == 0 then
                HasteFlag = 1
                send_command('@input /echo Haste Level: 15%')
            elseif HasteFlag == 1 then
                HasteFlag = 2
                send_command('@input /echo Haste Level: 30%')
            elseif HasteFlag == 2 then
                HasteFlag = 3
                send_command('@input /echo Haste Level: Cap')
            elseif HasteFlag == 3 then
                HasteFlag = 0
                send_command('@input /echo Haste Level: 0%')
            end
           check_param()
        end

        if command == 'cycle TP mode' then
            if TPFlag == 0 then
                TPFlag = 1
                send_command('@input /echo TP Set: DT')
            elseif TPFlag == 1 then
                TPFlag = 2
                send_command('@input /echo TP Set: Subtle Blow')
            elseif TPFlag == 2 then
                TPFlag = 3
                send_command('@input /echo TP Set: Accuracy')
            elseif TPFlag == 3 then
                TPFlag = 0
                send_command('@input /echo TP Set: Default')
            end
            check_param()
          end
  

        if command == 'Equip DT' then
          equip(sets.status.Idle.DT)
          send_command('@input /echo Damage Taken set equipped.')
        end
        if command == 'Equip Evasion' then
            equip(sets.status.Idle.Eva)
            send_command('@input /echo Evasion set equipped.')
        end


        if command == 'Equip Movement' then
            equip({feet = gear.Jute})
            send_command('@input /echo Jute Boots +1 equipped.')
        end

        if command == 'Naegling' then
            equip({main="Naegling",sub="Ternion Dagger +1"})
            send_command('@input /echo Naegling + Ternion equipped.')
            -- send_command('@input /lockstyleset 15')
        end

        if command == 'Gleti' then
            equip({main="Aeneas",sub="Gleti's Knife"})
            send_command("@input /echo Gleti's Knife equipped.")
            -- send_command('@input /lockstyleset 15')
        end

        if command == 'Ternion' then
            equip({main="Aeneas",sub="Ternion Dagger +1"})
            send_command("@input /echo Ternion Dagger +1 equipped.")
            -- send_command('@input /lockstyleset 15')
        end

        if command == 'Malevolence' then
            equip({main="Aeneas",sub="Malevolence"})
            send_command("@input /echo Malevolence equipped.")
            -- send_command('@input /lockstyleset 15')
        end




    end


  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----------- AUGMENTED/SPECIAL GEAR ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    gear = {}
    gear.Moonshade                     = { name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}}
    gear.Jute                          = { name="Jute Boots +1"}

    gear.Adhemar = {}
    gear.Adhemar.head = {}
    gear.Adhemar.head.Accuracy         = { name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}}

    gear.Adhemar.body = {}
    gear.Adhemar.body.Attack           = { name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}

    gear.Adhemar.hands = {}
    gear.Adhemar.hands.Accuracy        = { name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
    gear.Adhemar.hands.Attack          = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}}

    gear.AmbuCape = {}
    gear.AmbuCape.TP                   = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Damage taken-5%',}}
    gear.AmbuCape.WSD                  = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}

    gear.AF = {}
    gear.AF.head                       = { name="Pill. Bonnet +2",}
    gear.AF.body                       = { name="Pillager's Vest +3",}
    gear.AF.hands                      = { name="Pill. Armlets +1",}
    gear.AF.legs                       = { name="Pill. Culottes +2",}
    gear.AF.feet                       = { name="Pillager's Poulaines",}

    gear.Empy = {}
    gear.Empy.head                     = { name="Skulker's Bonnet +1"}
    gear.Empy.body                     = { name="Skulker's Vest +1"}
    gear.Empy.hands                    = { name="Skulker's Armlets +1"}
    gear.Empy.legs                     = { name="Skulk. Culottes +1"}
    gear.Empy.feet                     = { name="Skulk. Poulaines +1" }

    gear.Herc = {}
    gear.Herc.head = {}
    gear.Herc.head.FC                  = { name="Herculean Helm", augments={'"Mag.Atk.Bns."+6','"Fast Cast"+4',}}

    gear.Herc.feet = {}
    gear.Herc.feet.QA                  = { name="Herculean Boots", augments={'Accuracy+17','Pet: STR+1','Quadruple Attack +3','Accuracy+18 Attack+18','Mag. Acc.+3 "Mag.Atk.Bns."+3',}}

    gear.Relic = {}
    gear.Relic.head                    = {}
    gear.Relic.body                    = { name="Plunderer's Vest +1", augments={'Enhances "Ambush" effect',}}
    gear.Relic.hands                   = { name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}}
    gear.Relic.legs                    = { name="Plun. Culottes +1", augments={'Enhances "Feint" effect',}}
    gear.Relic.feet                    = { name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}}

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- STATUS SETS --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


      sets.status = {}
      sets.status.Idle = {}
      sets.status.Idle.DT = {
        ammo="Staunch Tathlum +1",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        waist="Engraved Belt",
        left_ear="Etiolation Earring",
        right_ear="Sanare Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle",
      }
      sets.status.Idle.Eva = {
        main={ name="Acrontica", augments={'Path: A',}},
        sub="Ternion Dagger +1",
        ammo="Yamarang",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Bathy Choker +1",
        waist="Svelt. Gouriz +1",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring="Defending Ring",
        right_ring="Vengeful Ring",
        back = gear.AmbuCape.Evasion,
      }
    
    -- sets.Melee = {}
    -- sets.Melee.Haste0 = {
    --     sub="Gleti's Knife",
    --     ammo="Coiste Bodhar",
    --     head = gear.Empy.head,
    --     body = gear.Adhemar.body.Attack,
    --     hands="Floral Gauntlets",
    --     legs="Malignance Tights",
    --     feet="Malignance Boots",
    --     neck={ name="Asn. Gorget +1", augments={'Path: A',}},
    --     waist="Reiki Yotai",
    --     left_ear="Suppanomimi",
    --     right_ear="Eabani Earring",
    --     left_ring="Chirich Ring +1",
    --     right_ring="Chirich Ring +1",
    --     back = gear.AmbuCape.DW,
    -- }
    -- sets.Melee.Haste15 = { -- Same as Haste0 set. Need more dual wield
    --     sub="Gleti's Knife",
    --     ammo="Coiste Bodhar",
    --     head = gear.Empy.head,
    --     body = gear.Adhemar.body.Attack,
    --     hands="Floral Gauntlets",
    --     legs="Malignance Tights",
    --     feet="Malignance Boots",
    --     neck={ name="Asn. Gorget +1", augments={'Path: A',}},
    --     waist="Reiki Yotai",
    --     left_ear="Suppanomimi",
    --     right_ear="Eabani Earring",
    --     left_ring="Chirich Ring +1",
    --     right_ring="Chirich Ring +1",
    --     back = gear.AmbuCape.DW,
    -- }
    -- sets.Melee.Haste30 = {
    --     sub="Ternion Dagger +1",
    --     ammo="Coiste Bodhar",
    --     head = gear.Empy.head,
    --     body = gear.Adhemar.body.Attack,
    --     hands = gear.Adhemar.hands.Attack,
    --     legs="Malignance Tights",
    --     feet="Malignance Boots",
    --     neck={ name="Asn. Gorget +1", augments={'Path: A',}},
    --     waist="Reiki Yotai",
    --     left_ear="Dedition Earring",
    --     right_ear="Telos Earring",
    --     left_ring="Gere Ring",
    --     right_ring="Chirich Ring +1",
    --     back = gear.AmbuCape.DW,
    -- }
    -- sets.Melee.HasteCap = {
    --     ammo="Coiste Bodhar",
    --     head = gear.Empy.head,
    --     body = gear.AF.body,
    --     hands = gear.Adhemar.hands.Attack,
    --     legs="Malignance Tights",
    --     feet="Malignance Boots",
    --     neck={ name="Asn. Gorget +1", augments={'Path: A',}},
    --     waist="Reiki Yotai",
    --     left_ear="Dedition Earring",
    --     right_ear="Sherida Earring",
    --     left_ring="Gere Ring",
    --     right_ring="Epona's Ring",
    --     back = gear.AmbuCape.STP,
    -- }


    sets.Melee = {}
    sets.Melee.Haste0 = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body = gear.Adhemar.body.Attack,
        hands="Floral Gauntlets",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck={ name="Asn. Gorget +1", augments={'Path: A',}},
        waist="Reiki Yotai",
        left_ear="Suppanomimi",
        right_ear="Eabani Earring",
        left_ring="Gere Ring",
        right_ring="Epona's Ring",
        back = gear.AmbuCape.DW,
    }
    sets.Melee.Haste15 = { -- Same as Haste0 set. Need more dual wield
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body = gear.Adhemar.body.Attack,
        hands="Floral Gauntlets",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck={ name="Asn. Gorget +1", augments={'Path: A',}},
        waist="Reiki Yotai",
        left_ear="Suppanomimi",
        right_ear="Eabani Earring",
        left_ring="Gere Ring",
        right_ring="Epona's Ring",
        back = gear.AmbuCape.DW,
    }
    sets.Melee.Haste30 = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body = gear.Adhemar.body.Attack,
        hands = gear.Adhemar.hands.Attack,
        legs="Malignance Tights",
        feet = gear.Relic.feet,
        neck={ name="Asn. Gorget +1", augments={'Path: A',}},
        waist="Reiki Yotai",
        left_ear="Dedition Earring",
        right_ear="Sherida Earring",
        left_ring="Gere Ring",
        right_ring="Epona's Ring",
        back = gear.AmbuCape.DW,
    }
    sets.Melee.HasteCap = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck={ name="Asn. Gorget +1", augments={'Path: A',}},
        waist="Reiki Yotai",
        left_ear="Dedition Earring",
        right_ear="Sanare Earring",
        left_ring="Defending Ring",
        right_ring="Gere Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},    
    }
    -- sets.Melee.HasteCap = {
    --     ammo="Coiste Bodhar",
    --     head = gear.Adhemar.head.Accuracy,
    --     body = gear.AF.body,
    --     hands = gear.Adhemar.hands.Attack,
    --     legs="Malignance Tights",
    --     feet = gear.Relic.feet,
    --     neck={ name="Asn. Gorget +1", augments={'Path: A',}},
    --     waist="Reiki Yotai",
    --     left_ear="Dedition Earring",
    --     right_ear="Sherida Earring",
    --     left_ring="Gere Ring",
    --     right_ring="Epona's Ring",
    --     back = gear.AmbuCape.STP,
    -- }

    sets.status.Accuracy = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body = gear.AF.body,
        hands = gear.Adhemar.hands.Attack,
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck={ name="Asn. Gorget +1", augments={'Path: A',}},
        waist="Reiki Yotai",
        left_ear="Dedition Earring",
        right_ear="Sherida Earring",
        left_ring="Gere Ring",
        right_ring="Epona's Ring",
        back = gear.AmbuCape.STP,
    }

    sets.Treasure = {
        hands = gear.Relic.hands,
        feet = gear.Empy.feet,
    }
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ----- PRECAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    sets.precast = {}
    sets.precast.FastCast = {
        ammo="Impatiens",
        head = gear.Herc.head.FC,
        body="Dread Jupon",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        neck="Orunmila's Torque",
        left_ear="Etiolation Earring",
        right_ear="Loquac. Earring",
        left_ring="Weather. Ring",
        right_ring="Lebeche Ring",
    }

    sets.precast.Provoke = {
        body="Emet Harness +1",
        hands="Kurys Gloves",
        neck="Unmoving Collar +1",
        left_ear="Trux Earring",
        right_ear="Cryptic Earring",
        left_ring="Petrov Ring",
        right_ring="Begrudging Ring",
        back="Reiki Cloak",
    }

    sets.precast.Steal = {
        -- +31 steal if all bis?
        -- sub="Bartholomew's knife",
        ammo="Barathrum",
        head = gear.AF.hands2, -- Lower level AF head has steal+, but reforged versions do not
        hands = gear.AF.hands,
        -- hands="Thief's Kote",
        -- legs = gear.Relic.legs2, -- Lower level relic legs has steal+, but reforged versions do not
        feet = gear.AF.feet,
        neck="Pentalagus Charm",
        -- waist="Key Ring Belt",
    }
    sets.precast.Despoil = {
        ammo="Barathrum",
        legs = gear.Empy.legs,
        feet = gear.Empy.feet,
    }

    sets.WeaponSkill = {}
    sets.WeaponSkill.MidAtk = {}
    sets.WeaponSkill.HighAtk = {}
    sets.WeaponSkill.MidAtk["Rudra's Storm"] = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Asn. Gorget +1", augments={'Path: A',}},
        waist={ name="Kentarch Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Odr Earring",
        left_ring="Gere Ring",
        right_ring="Regal Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
    sets.WeaponSkill.HighAtk["Rudra's Storm"] = {
        ammo="Crepuscular Pebble",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Gleti's Cuirass",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Asn. Gorget +1", augments={'Path: A',}},
        waist={ name="Kentarch Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Odr Earring",
        left_ring="Regal Ring",
        right_ring="Ilabrat Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }

    sets.WeaponSkill.MidAtk["Aeolian Edge"] = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Friomisi Earring",
        left_ring="Dingir Ring",
        right_ring="Shiva Ring +1",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
    sets.WeaponSkill.HighAtk["Aeolian Edge"] = sets.WeaponSkill.MidAtk["Aeolian Edge"]

    sets.WeaponSkill.MidAtk["Shark Bite"] = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Asn. Gorget +1", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Sherida Earring",
        left_ring="Regal Ring",
        right_ring="Ilabrat Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
    sets.WeaponSkill.HighAtk["Shark Bite"] = {
        ammo="Crepuscular Pebble",
        head = gear.AF.head,
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Asn. Gorget +1", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Sherida Earring",
        left_ring="Regal Ring",
        right_ring="Ilabrat Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }

    sets.WeaponSkill.MidAtk["Mandalic Stab"] = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Asn. Gorget +1", augments={'Path: A',}},
        waist={ name="Kentarch Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Sherida Earring",
        left_ring="Gere Ring",
        right_ring="Regal Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
    sets.WeaponSkill.HighAtk["Mandalic Stab"] = {
        ammo="Crepuscular Pebble",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Gleti's Cuirass",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Asn. Gorget +1", augments={'Path: A',}},
        waist={ name="Kentarch Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Sherida Earring",
        left_ring="Gere Ring",
        right_ring="Regal Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }

    sets.WeaponSkill.MidAtk["Exenterator"] = {
        ammo="C. Palug Stone",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Brutal Earring",
        right_ear="Sherida Earring",
        left_ring="Gere Ring",
        right_ring="Regal Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
        }
    sets.WeaponSkill.HighAtk["Exenterator"] = {
        ammo="C. Palug Stone",
        head="Gleti's Mask",
        body="Gleti's Cuirass",
        hands="Malignance Gloves",
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Brutal Earring",
        right_ear="Sherida Earring",
        left_ring="Gere Ring",
        right_ring="Regal Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
    
    sets.WeaponSkill.HighAtk["Evisceration"] = {
        ammo="Yetshila +1",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet="Gleti's Boots",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Odr Earring",
        left_ring="Gere Ring",
        right_ring="Regal Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
    }
    sets.WeaponSkill.MidAtk["Evisceration"] = {
        ammo="Yetshila +1",
        head={ name="Blistering Sallet +1", augments={'Path: A',}},
        body="Pillager's Vest +3",
        hands="Gleti's Gauntlets",
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet="Gleti's Boots",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Odr Earring",
        left_ring="Begrudging Ring",
        right_ring="Regal Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
    }


    sets.WeaponSkill.MidAtk["Savage Blade"] = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Asn. Gorget +1", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Sherida Earring",
        left_ring="Gere Ring",
        right_ring="Regal Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
    sets.WeaponSkill.HighAtk["Savage Blade"] = {
        ammo="Crepuscular Pebble",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body="Gleti's Cuirass",
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Gleti's Breeches", augments={'Path: A',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Asn. Gorget +1", augments={'Path: A',}},
        waist={ name="Kentarch Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Sherida Earring",
        left_ring="Regal Ring",
        right_ring="Ilabrat Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }

    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ----- MIDCAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    sets.midcast = {}
    sets.MidShot = {}

end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function precast(spell)

    attack2 = 9999
    attack = player.attack
    if attack > attack2 then
      AtkFlag = 2 -- Attack capped (>6000 Attack in TP set)
      active_ws = sets.WeaponSkill.HighAtk
    else
      AtkFlag = 0 -- Not Attack Capped
      active_ws = sets.WeaponSkill.MidAtk
    end
    
    self = windower.ffxi.get_mob_by_target('me')
    target = windower.ffxi.get_mob_by_target('t') or windower.ffxi.get_mob_by_target('st') or self
    distance = math.sqrt((self.x - target.x)^2 + (self.y - target.y)^2)
    weather_intensity = gearswap.res.weather[world.weather_id].intensity
  
    if active_ws[spell.name] then
        if distance > 7 then
          send_command('@input /echo Target too far away.')
          cancel_spell()
        end
        equip(active_ws[spell.name])
    elseif spell.name == "Provoke" then
        equip(sets.precast.Provoke)
    elseif spell.type=="WeaponSkill" then
        equip(sets.WeaponSkill["Rudra's Storm"])
    elseif spell.name == "Ranged" then
        equip(sets.status.PreShot)
    elseif spell.type=="WeaponSkill" then
        equip(sets.WeaponSkill.MidAtk["Rudra's Storm"]) -- Default to the Cross Reaper set.
    elseif spell.name == "Flee" then
        equip({feet=gear.AF.feet})
    elseif spell.name == "Perfect Dodge" then
        equip({feet=gear.Relic.hands})
    elseif spell.name == "Steal" then
        equip(sets.precast.Steal)
    elseif spell.name == "Despoil" then
        equip(sets.precast.Despoil)
    elseif spell.name=="Accomplice" or spell.name=="Collaborator" then
        equip({head=gear.Empy.head,})
    else
        equip(sets.precast.FastCast)
    end

end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function midcast(spell)

    if spell.name == "Ranged" then
        equip(sets.MidShot)
    end

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- AFTERCAST FUNCTION -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function aftercast(spell)

    if player.status == 'Idle' then
        equip(sets.status.Idle.DT)
    elseif player.status == "Engaged" then
        if HasteFlag == 0 then
            equip(sets.Melee.Haste0)
        elseif HasteFlag == 1 then
            equip(sets.Melee.Haste15)
        elseif HasteFlag == 2 then
            equip(sets.Melee.Haste30)
        elseif HasteFlag == 3 then
            equip(sets.Melee.HasteCap)
        end
    end
    if buffactive["Feint"] then
        equip({legs = gear.Relic.legs})
    end

end


function status_change(new,old)

    if new == "Idle" then
        equip(sets.status.Idle.DT)
    elseif new == "Engaged" then
        if HasteFlag == 0 then
            equip(sets.Melee.Haste0)
        elseif HasteFlag == 1 then
            equip(sets.Melee.Haste15)
        elseif HasteFlag == 2 then
            equip(sets.Melee.Haste30)
        elseif HasteFlag == 3 then
            equip(sets.Melee.HasteCap)
        end
    elseif sets.status[new] then
        equip(sets.status[new])
    end

end
