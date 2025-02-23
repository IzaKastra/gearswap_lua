include('organizer-lib')

function get_sets()

    attack2 = 4000 -- This LUA will equip "high buff" WS sets if the attack value of your TP set (or idle set if WSing from idle) is higher than this value

    THFlag = 0
    TPFlag = 0
    HasteFlag = 3

    send_command('bind f9 gs c cycle TP mode')
    send_command('bind f10 gs c cycle Haste')
    send_command('bind f11 gs c Equip Movement')
    send_command('bind f12 gs c Equip DT')

    send_command('bind !f9 gs c Twashtar')
    send_command('bind !f10 gs c Aeneas')
    send_command('bind !f11 gs c Mandau')
    send_command('bind !f12 gs c TauretAE')



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
            send_command('@input /echo Treasure Hunter +5 Equipped')
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
            equip({feet="Jute Boots +1"})
            send_command('@input /echo Jute Boots +1 equipped.')
        end

        if command == 'Mandau' then
            equip({main="Mandau", sub="Crepuscular Knife"})
        end

        if command == 'Aeneas' then
            equip({main="Aeneas", sub="Crepuscular Knife"})
        end

        if command == 'Twashtar' then
            equip({main="Twashtar", sub="Centovente"})
        end

        if command == 'TauretAE' then
            equip({main="Tauret",sub="Malevolence"})
            send_command("@input /echo Tauret+Malevolence equipped.")
        end

    end


  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----------- AUGMENTED/SPECIAL GEAR ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    gear = {}

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

    gear.AmbuCape = {}
    gear.AmbuCape.STP    = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}
    gear.AmbuCape.WSDdex = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

    gear.Artifact = {}
    gear.Artifact.head  = { name="Pill. Bonnet +2",}
    gear.Artifact.body  = { name="Pillager's Vest +3",}
    gear.Artifact.hands = { name="Pill. Armlets +1",}
    gear.Artifact.legs  = { name="Pill. Culottes +2",}
    gear.Artifact.feet  = { name="Pillager's Poulaines",}

    gear.Relic = {}
    gear.Relic.head  = {}
    gear.Relic.body  = { name="Plunderer's Vest +1", augments={'Enhances "Ambush" effect',}}
    gear.Relic.hands = { name="Plun. Armlets +1", augments={'Enhances "Perfect Dodge" effect',}}
    gear.Relic.legs  = { name="Plun. Culottes +1", augments={'Enhances "Feint" effect',}}
    gear.Relic.feet  = { name="Plun. Poulaines +3", augments={'Enhances "Assassin\'s Charge" effect',}}


    gear.Empyrean = {}
    gear.Empyrean.head  = { name="Skulker's Bonnet +3"}
    gear.Empyrean.body  = { name="Skulker's Vest +3"}
    gear.Empyrean.hands = { name="Skulker's Armlets +1"}
    gear.Empyrean.legs  = { name="Skulk. Culottes +1"}
    gear.Empyrean.feet  = { name="Skulk. Poulaines +3" }


    gear.Herc = {}
    gear.Herc.head = {}
    gear.Herc.head.FC = { name="Herculean Helm", augments={'"Mag.Atk.Bns."+6','"Fast Cast"+4',}}
    gear.Herc.feet = {}
    gear.Herc.feet.QA = { name="Herculean Boots", augments={'Accuracy+17','Pet: STR+1','Quadruple Attack +3','Accuracy+18 Attack+18','Mag. Acc.+3 "Mag.Atk.Bns."+3',}}

  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- STATUS SETS --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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
        waist="Null Belt",
        left_ear="Etiolation Earring",
        right_ear="Sanare Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle",
      }
      sets.status.Idle.Eva = {
        ammo="Yamarang",
        head="Null Masque",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Bathy Choker +1",
        waist="Svelt. Gouriz +1",
        left_ear="Infused Earring",
        right_ear="Eabani Earring",
        left_ring="Defending Ring",
        right_ring="Vengeful Ring",
        back="Shadow Mantle",
      }
    
    sets.Melee = {}

    sets.Melee.HasteCap = {
        ammo="Coiste Bodhar",
        head = gear.Empyrean.head,  
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Gleti's Breeches",
        feet="Malignance Boots",
        neck="Asn. Gorget +1",
        waist="Reiki Yotai",
        ear1="Sherida Earring",
        ear2="Skulk. Earring +1",
        ring1="Gere Ring",
        ring2="Lehko's ring",
        back = gear.AmbuCape.STP
    }

    sets.Treasure = {
        -- hands = gear.Relic.hands,
        feet = gear.Empyrean.feet,
    }



    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    sets.FastCast = {
        -- 43% FC, 8% QC
        ammo="Impatiens", -- 0%
        head = gear.Herc.head.FC, -- 11%
        body="Dread Jupon", -- 7%
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8%
        neck="Orunmila's Torque", -- 5%
        left_ear="Etiolation Earring", -- 1%
        right_ear="Loquac. Earring", -- 3%
        left_ring="Weather. Ring +1", -- 6%
        right_ring="Lebeche Ring", -- 2%
    }

    sets.Enmity = {
        -- +66 Enmity
        ammo="Sapience Orb", -- +2
        head="Versa Celata", -- +5
        body="Emet Harness +1",  -- +10
        hands="Kurys Gloves",  -- +9
        legs="Zoar Subligar +1", -- +6
        neck="Unmoving Collar +1", -- +10
        ear1="Trux Earring",  -- +5
        ear2="Cryptic Earring",  -- +4
        ring1="Petrov Ring",  -- +4
        ring2="Eihwaz Ring",  -- +5
        back="Reiki Cloak", -- +6
    }

    sets.Steal = { -- Is a maximized Steal+ set really worth the inventory space?
        feet = gear.Artifact.feet,

        -- sub="Bartholomew's knife",
        -- ammo="Barathrum",
        -- head = gear.Artifact.head2, -- Lower level Artifact head has Steal+, but the reforged version does not
        -- hands = gear.Artifact.hands,
        -- hands="Thief's Kote",
        -- legs = gear.Relic.legs2, -- Lower level Relic legs have Steal+, but reforged version does not
        -- neck="Pentalagus Charm",
        -- waist="Key Ring Belt",
    }

    sets.Despoil = {
        feet = gear.Empyrean.feet,
        -- ammo="Barathrum",
        -- legs = gear.Empyrean.legs,
    }


    sets.RangedAccuracy = {
        -- Max Ranged Accuracy for Gashing/Sleep Bolts
        main="Twashtar",
        sub="Gleti's Knife",
        range="Exalted C.bow +1",
        ammo="Gashing Bolt",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Null Loop",
        waist="Null Belt",
        left_ear="Telos Earring",
        right_ear="Crep. Earring",
        left_ring="Dingir Ring",
        right_ring="Ilabrat Ring",
        back="Null Shawl",
    }


    sets.WeaponSkill = {}
    sets.WeaponSkill.MidAtk = {}
    sets.WeaponSkill.HighAtk = {}
    sets.WeaponSkill.MidAtk["Rudra's Storm"] = {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body = gear.Empyrean.body,
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Asn. Gorget +1",
        waist="Kentarch Belt +1",
        ear1="Moonshade Earring",
        ear2="Odr Earring",
        ring1="Regal Ring",
        ring2="Ilabrat Ring",
        back = gear.AmbuCape.WSDdex,
    }
    sets.WeaponSkill.HighAtk["Rudra's Storm"] = {
        ammo="Crepuscular Pebble",
        head = gear.Empyrean.head,
        body = gear.Empyrean.body,
        hands="Gleti's Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Asn. Gorget +1",
        waist="Kentarch Belt +1",
        ear1="Moonshade Earring",
        ear2="Odr Earring",
        ring1="Regal Ring",
        ring2="Ilabrat Ring",
        back = gear.AmbuCape.WSDdex,
    }


    sets.WeaponSkill.MidAtk["Aeolian Edge"] = {
        ammo="Ghastly Tathlum +1",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Sibyl Scarf",
        waist="Orpheus's Sash",
        left_ear="Moonshade Earring",
        right_ear="Friomisi Earring",
        left_ring="Dingir Ring",
        right_ring="Shiva Ring +1",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
    sets.WeaponSkill.HighAtk["Aeolian Edge"] = sets.WeaponSkill.MidAtk["Aeolian Edge"]




    sets.WeaponSkill.MidAtk["Shark Bite"] = {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Asn. Gorget +1",
        waist="Sailfi Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Sherida Earring",
        left_ring="Regal Ring",
        right_ring="Ilabrat Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
    sets.WeaponSkill.HighAtk["Shark Bite"] = {
        ammo="Crepuscular Pebble",
        head = gear.Artifact.head,
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Asn. Gorget +1",
        waist="Sailfi Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Sherida Earring",
        left_ring="Regal Ring",
        right_ring="Ilabrat Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }

    sets.WeaponSkill.MidAtk["Mandalic Stab"] = {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Asn. Gorget +1",
        waist="Kentarch Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Sherida Earring",
        left_ring="Gere Ring",
        right_ring="Regal Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
    sets.WeaponSkill.HighAtk["Mandalic Stab"] = {
        ammo="Crepuscular Pebble",
        head="Nyame Helm",
        body="Gleti's Cuirass",
        hands="Nyame Gauntlets",
        legs="Gleti's Breeches",
        feet="Nyame Sollerets",
        neck="Asn. Gorget +1",
        waist="Kentarch Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Sherida Earring",
        left_ring="Gere Ring",
        right_ring="Regal Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }

    sets.WeaponSkill.MidAtk["Shadowstitch"] = {
        ammo="Staunch Tathlum +1",
        head={ name="Taeon Chapeau", augments={'Evasion+25','Spell interruption rate down -10%','HP+49',}},
        body={ name="Taeon Tabard", augments={'Evasion+25','Spell interruption rate down -10%','HP+47',}},
        hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Taeon Boots", augments={'Evasion+24','Spell interruption rate down -10%','HP+45',}},
        neck="Null Loop",
        waist="Reiki Yotai",
        left_ear="Dedition Earring",
        right_ear="Telos Earring",
        left_ring="Defending Ring",
        right_ring="Lehko's Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},
    }
    sets.WeaponSkill.HighAtk["Shadowstitch"] = {
        ammo="Staunch Tathlum +1",
        head={ name="Taeon Chapeau", augments={'Evasion+25','Spell interruption rate down -10%','HP+49',}},
        body={ name="Taeon Tabard", augments={'Evasion+25','Spell interruption rate down -10%','HP+47',}},
        hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet={ name="Taeon Boots", augments={'Evasion+24','Spell interruption rate down -10%','HP+45',}},
        neck="Null Loop",
        waist="Reiki Yotai",
        left_ear="Dedition Earring",
        right_ear="Telos Earring",
        left_ring="Defending Ring",
        right_ring="Lehko's Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}},
    }
    
    sets.WeaponSkill.HighAtk["Evisceration"] = {
        ammo="Yetshila +1",
        head="Blistering Sallet +1",
        body="Gleti's Cuirass",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Gleti's Boots",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Moonshade Earring",
        right_ear="Odr Earring",
        left_ring="Gere Ring",
        right_ring="Regal Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
    }
    sets.WeaponSkill.MidAtk["Evisceration"] = {
        ammo="Yetshila +1",
        head="Blistering Sallet +1",
        body="Pillager's Vest +3",
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet="Gleti's Boots",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Moonshade Earring",
        right_ear="Odr Earring",
        left_ring="Begrudging Ring",
        right_ring="Regal Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
    }
    

    sets.WeaponSkill.MidAtk["Savage Blade"] = {
        ammo="Coiste Bodhar",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Asn. Gorget +1",
        waist="Sailfi Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Sherida Earring",
        left_ring="Gere Ring",
        right_ring="Regal Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
    sets.WeaponSkill.HighAtk["Savage Blade"] = {
        ammo="Crepuscular Pebble",
        head="Nyame Helm",
        body="Gleti's Cuirass",
        hands="Nyame Gauntlets",
        legs="Gleti's Breeches",
        feet="Nyame Sollerets",
        neck="Asn. Gorget +1",
        waist="Kentarch Belt +1",
        left_ear="Moonshade Earring",
        right_ear="Sherida Earring",
        left_ring="Regal Ring",
        right_ring="Ilabrat Ring",
        back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }


end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function precast(spell)

    use_TH_Aeolian = (world.zone:contains("Henge")) or (world.zone:contains("Abyssea")) -- See https://docs.windower.net/addons/gearswap/reference/

    attack = player.attack
    if attack > attack2 then
      active_ws = sets.WeaponSkill.HighAtk
    else
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
        
    elseif spell.type == "WeaponSkill" then
        equip(sets.WeaponSkill.MidAtk["Rudra's Storm"])

    elseif spell.name == "Ranged" then
        equip(sets.RangedAccuracy)

    elseif spell.name == "Provoke" then
        equip(sets.Enmity)

    elseif spell.name == "Flee" then
        equip({feet = gear.Artifact.feet})

    elseif spell.name == "Perfect Dodge" then
        equip({feet = gear.Relic.hands})

    elseif spell.name == "Steal" then
        equip(sets.Steal)

    elseif spell.name == "Despoil" then
        equip(sets.Despoil)

    elseif (spell.name == "Accomplice") or (spell.name == "Collaborator") then
        equip({head = gear.Empyrean.head,})

    else
        equip(sets.FastCast)
    end

    if (spell.name == "Aeolian Edge") and (use_TH_Aeolian) then
        equip({feet = gear.Empyrean.feet})
    end


end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function midcast(spell)

    if spell.name == "Ranged" then
        equip(set_combine(sets.RangedAccuracy, sets.Treasure))
    end

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- AFTERCAST FUNCTION -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function aftercast(spell)

    if player.status == 'Idle' then
        equip(sets.status.Idle.DT)
    elseif player.status == "Engaged" then
        print()
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
