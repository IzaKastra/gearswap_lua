include('organizer-lib')

function get_sets()

    maps()

    TPFlag = 0

    -- ! == alt
    -- ^ == ctrl

    send_command('bind f9 gs c cycle TP mode')
    send_command('bind f10 gs c cycle Haste')
    send_command('bind f11 gs c Equip Movement')
    send_command('bind f12 gs c Equip DT')

    send_command('bind !f9 gs c Godhands')
    send_command('bind !f10 gs c Verethragna')

    send_command('bind ^c gs c chocobo')
    function file_unload()
        send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind f11')
        send_command('unbind f12')
        
        send_command('unbind !f9')
        send_command('unbind !f10')

        send_command('unbind ^c')
    end
    function self_command(command)
        function check_param()
            print('-------------------------')
                if TPFlag == 0 then
              print('TP Mode:............Default')
                elseif TPFlag == 1 then
                   print('TP Mode:............Accuracy')
                elseif TPFlag == 2 then
              print('TP Mode:............Evasion')
                elseif TPFlag == 3 then
              print('TP Mode:............Hybrid')
            end
            if HasteFlag == 0 then
              print('Haste Level:........0%')
            elseif HasteFlag == 1 then
              print('Haste Level:........15%')
            elseif HasteFlag == 2 then
              print('Haste Level:........30%')
            end
                if MagicBurstFlag == 0 then
                    print('Magic Burst:........OFF')
                elseif MagicBurstFlag == 1 then
                    print('Magic Burst:........ON')
                end
            print('-------------------------')
        end

        if command == 'toggle MagicBurst' then
          if MagicBurstFlag == 0 then
            MagicBurstFlag = 1
            send_command('@input /echo Magic Burst: ON')
          elseif MagicBurstFlag == 1 then
            MagicBurstFlag = 0
            send_command('@input /echo Magic Burst: OFF')
          end
          check_param()
        end
        if command == 'cycle TP mode' then
          if TPFlag == 0 then
            TPFlag = 1
            send_command('@input /echo TP mode: Accuracy')
            elseif TPFlag == 1 then
            TPFlag = 2
            send_command('@input /echo TP mode: Evasion')
            elseif TPFlag == 2 then
            TPFlag = 3
            send_command('@input /echo TP mode: Hybrid DT')
            elseif TPFlag == 3 then
                TPFlag = 0
                send_command('@input /echo TP mode: Default')
          end
          check_param()
        end
        if command == 'Equip Treasure Hunter' then
      equip(sets.Treasure)
            send_command('@input /echo Treasure Hunter +4 Equipped')
        end

        if command == 'cycle Haste' then
          if HasteFlag == 0 then
            HasteFlag = 1
            send_command('@input /echo Haste Level: 15%')
          elseif HasteFlag == 1 then
            HasteFlag = 2
            send_command('@input /echo Haste Level: 30%')
          elseif HasteFlag == 2 then
            HasteFlag = 0
            send_command('@input /echo Haste Level: 0%')
          end
          check_param()
        end
        if command == 'Equip DT' then
          equip(sets.status.Idle.DT)
          send_command('@input /echo Damage Taken set equipped.')
        end


        if command == 'chocobo' then
            mounts = {"Chocobo", "Chocobo", "Chocobo", "'Noble Chocobo'", "Phuabo", "Phuabo", "Xzomit", "Warmachine", "'Spectral Chair'", "Fenrir"}
            if windower.ffxi.get_mob_by_target('me').status == 5 or windower.ffxi.get_mob_by_target('me').status == 85 then
                send_command('@input /echo Dismount')
                send_command('@input /dismount')
            elseif windower.ffxi.get_mob_by_target('me').status == 0 then
                mount = mounts[math.random(#mounts)]
                send_command('@input /echo ' .. mount)
                send_command('@input /mount '.. mount)
            end
        end

        if command == 'Equip Movement' then
            equip(gear.Criers)
            send_command('@input /echo Crier\'s Gaiters equipped.')
        end

    end


  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----------- AUGMENTED/SPECIAL GEAR ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

      gear = {}
        gear.Moonshade                     = { name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}}
      gear.Obi                           = { waist="Hachirin-no-Obi"}
        gear.Criers                         = { feet="Crier's Gaiters"}
        gear.Lugra1                        = { name="Lugra Earring +1", augments={'Path: A',}}
        gear.Lugra2                        = { right_ear="Lugra Earring"}
        gear.Donar                         = { range="Donar Gun",}

        gear.Empy = {}
        gear.Empy.head                     = {}
        gear.Empy.body                     = { name="Bhikku Cyclas +1"}
        gear.Empy.hands                    = { name="Hattori Tekko +1"}
        gear.Empy.legs                     = {}
        gear.Empy.feet                     = { name="Hattori Kyahan +1"}

        gear.H2H = {}

        gear.RyuoSomen = {}
        gear.RyuoSomen.Accuracy            = { name="Ryuo Somen +1", augments={'STR+12','DEX+12','Accuracy+20',}}
        gear.RyuoSomen.STP                 = { name="Ryuo Somen", augments={'HP+50','"Store TP"+4','"Subtle Blow"+7',}}

        gear.Adhemar = {}
        gear.Adhemar.head = {}
        gear.Adhemar.head.Accuracy         = { name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}}

        gear.Adhemar.body = {}
        gear.Adhemar.body.Attack           = { name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}}

        gear.Adhemar.hands = {}
        gear.Adhemar.hands.Accuracy        = { name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}}
        gear.Adhemar.hands.Attack          = { name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}}

    gear.AmbuCape = {}
    gear.AmbuCape.Nuke                 = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
    gear.AmbuCape.TP                   = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Damage taken-5%',}}
    gear.AmbuCape.WSDdex               = { name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
    gear.AmbuCape.MEva                 = { name="Andartia's Mantle", augments={'Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Occ. inc. resist. to stat. ailments+10',}}
        gear.AmbuCape.WSDstr               = { name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
        gear.AmbuCape.Crit                 = { name="Andartia's Mantle", augments={'AGI+20','Accuracy+20 Attack+20','AGI+10','Crit.hit rate+10',}}
        gear.AmbuCape.SIRD                 = { name="Andartia's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Spell interruption rate down-10%',}}

        gear.AF = {}
        gear.AF.head                       = {}
        gear.AF.body                       = {}
        gear.AF.hands                      = {}
        gear.AF.legs                       = {}
        gear.AF.feet                       = { name="Anch. Gaiters +3"}

      gear.Herc = {}
    gear.Herc.head = {}
    gear.Herc.head.FC                  = { name="Herculean Helm", augments={'"Mag.Atk.Bns."+6','"Fast Cast"+4',}}

      gear.Herc.hands = {}
    gear.Herc.hands.WSD                = { name="Herculean Gloves", augments={'Accuracy+24','Weapon skill damage +2%','DEX+15','Attack+14',}}
        gear.Herc.hands.Waltz              = { name="Herculean Gloves", augments={'"Waltz" potency +9%','DEX+1','Accuracy+1',}}

    gear.Herc.body = {}
        gear.Herc.body.WSDdex              = { name="Herculean Vest", augments={'Weapon skill damage +3%','DEX+10','Accuracy+10',}}
        gear.Herc.body.WSDstr              = { name="Herculean Vest", augments={'Accuracy+20 Attack+20','Weapon skill damage +2%','STR+10','Accuracy+8',}}

    gear.Herc.legs = {}
    gear.Herc.legs.Nuke                = { name="Herculean Trousers", augments={'Mag. Acc.+17 "Mag.Atk.Bns."+17','"Store TP"+3','INT+10','Mag. Acc.+9','"Mag.Atk.Bns."+11',}}
    gear.Herc.legs.MagicBurst          = { name="Herculean Trousers", augments={'"Mag.Atk.Bns."+20','Magic burst dmg.+7%','Mag. Acc.+10',}}
    gear.Herc.legs.Waltz               = { name="Herculean Trousers", augments={'Attack+21','"Waltz" potency +10%','AGI+2','Accuracy+10',}}

    gear.Herc.feet = {}
    gear.Herc.feet.QA                  = { name="Herculean Boots", augments={'Accuracy+17','Pet: STR+1','Quadruple Attack +3','Accuracy+18 Attack+18','Mag. Acc.+3 "Mag.Atk.Bns."+3',}}
        gear.Herc.feet.Waltz               = { name="Herculean Boots", augments={'Accuracy+26','"Waltz" potency +9%','DEX+10',}}
        gear.Herc.feet.WSD                 = { name="Herculean Boots", augments={'Attack+17','Weapon skill damage +4%','DEX+14','Accuracy+3',}}
        gear.Herc.feet.Hybrid              = { name="Herculean Boots", augments={'"Mag.Atk.Bns."+17','Weapon skill damage +2%','STR+10','Mag. Acc.+7',}}

        gear.Relic = {}
        gear.Relic.head                    = {}
        gear.Relic.body                    = {}
        gear.Relic.hands                   = {}
        gear.Relic.legs                    = { name="Hes. Hose +3", augments={'Enhances "Hundred Fists" effect',}}
    gear.Relic.feet                    = {}

        gear.Taeon = {}
        gear.Taeon.head = {}
        gear.Taeon.head.sird               = { name="Taeon Chapeau", augments={'Evasion+25','Spell interruption rate down -10%','HP+49',}}

        gear.Taeon.body = {}
        gear.Taeon.body.sird               = { name="Taeon Tabard", augments={'Evasion+25','Spell interruption rate down -10%','HP+47',}}

        gear.Taeon.hands = {}

        gear.Taeon.legs = {}
        gear.Taeon.legs.sird               = { name="Taeon Tights", augments={'Evasion+25','Spell interruption rate down -10%','HP+50',}}

        gear.Taeon.feet = {}
        gear.Taeon.feet.sird               = { name="Taeon Boots", augments={'Evasion+24','Spell interruption rate down -10%','HP+45',}}


  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----- STATUS SETS --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    sets.items = {}
    sets.items.HolyWater = {
        neck="Nicander's Necklace",
        right_ring="Purity Ring",
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
        waist="Null Belt",
        left_ear="Etiolation Earring",
        right_ear="Sanare Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle",
    }

    sets.status.Hybrid = {
        ammo="Coiste Bodhar",
        head="Malignance Chapeau",
        body="Mpaca's Doublet",
        hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs="Bhikku Hose +3",
        feet="Tatena. Sune. +1",
        neck="Mnk. Nodowa +1",
        waist="Moonbow Belt +1",
        left_ear="Sherida Earring",
        right_ear="Schere Earring",
        left_ring="Niqmaddu Ring",
        right_ring="Lehko's Ring",
        back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.status.Footwork = {
        legs = gear.Relic.legs,
        feet = gear.AF.feet,
    }

  sets.Treasure = {
        head="Wh. Rarab Cap +1",
        feet="Volte Boots",
        waist="Chaac Belt",
    }

    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ----- PRECAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    sets.precast = {}
    sets.precast.FastCast = {
    -- +56% Fast Cast, +7% Quick Magic
        ammo="Impatiens",
    head = gear.Herc.head.FC,
    -- body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
    body="Dread Jupon",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Gyve Trousers",
    feet = gear.Relic.feet,
    neck="Orunmila's Torque",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Weather. Ring",
    right_ring="Lebeche Ring",
    back = gear.AmbuCape.MEva,
    }

    sets.precast.Provoke = {
    -- +78 Enmity
        ammo="Sapience Orb", -- +2
        head="Versa Celata", -- +5
        body="Emet Harness +1",  -- +10
        hands="Kurys Gloves",  -- +9
        legs="Zoar Subligar +1", -- +6
        feet = gear.Relic.feet, -- +8
        neck="Unmoving Collar +1", -- +10
        left_ear="Trux Earring",  -- +5
        right_ear="Cryptic Earring",  -- +4
        left_ring="Petrov Ring",  -- +4
        right_ring="Eihwaz Ring",  -- +5
        back = gear.AmbuCape.SIRD, -- +10
    }

    sets.Footwork = {
        feet = "Shukuyu Sune-Ate",
    }

    sets.WeaponSkill = {}
    sets.WeaponSkill["Raging Fists"] = {
    ammo="Coiste Bodhar",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Bhikku Cyclas +3",
    hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Moonbow Belt +1",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Schere Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Gere Ring",
    back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
    }


    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    sets.midcast = {}

end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- SPELL/ABILITY LISTS ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function maps()

    fastcast  = S {"Ninjutsu", "Enhancing Magic", "Elemental Magic", "Divine Magic", "Dark Magic", "(N/A)"}

end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function precast(spell)

    if sets.WeaponSkill[spell.name] then
        equip(sets.WeaponSkill[spell.name])

    elseif sets[spell.name] then
        equip(sets[spell.name])

    elseif spell.type=="WeaponSkill" then
        equip(sets.WeaponSkill["Raging Fists"])

    elseif spell.name == "Provoke" or spell.name == "Animated Flourish" then
        equip(set_combine(sets.Enmity))

    elseif spell.name=="Jump" or spell.name=="High Jump" then
        equip(sets.Jump)

    elseif spell.name == "Hundred Fists" then
        equip({legs = gear.Relic.legs})

    -- elseif spell.name == "Chakra" then -- AF body, relic hands
    -- elseif spell.name == "Chi Blast" then -- AF hands
    -- elseif spell.name == "Boost" then -- AF hands, Ask Sash
    -- elseif spell.name == "Counterstance" then -- Relic feet
    -- elseif spell.name == "Mantra" then -- Relic feet
    -- elseif spell.name == "Formless Strikes" then -- Relic body
    -- elseif spell.name == "Footwork" then
    -- elseif spell.name == "Focus" then -- AF head
    -- elseif spell.name == "Dodge" then -- AF feet


    elseif spell.name == "Holy Water" then
        equip(set_combine(sets.status.Idle.DT, sets.items.HolyWater))

    elseif fastcast:contains(spell.skill) then
        equip(sets.precast.FastCast)
    end

end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function midcast(spell)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function aftercast(spell)

    if player.status == 'Idle' then
        equip(sets.status.Idle.DT)

    elseif player.status == "Engaged" then

        equip(sets.status.Hybrid)
        if buffactive['Impetus'] then
            equip({body = gear.Empy.body})
        end
        if buffactive['Footwork'] then
            equip(sets.status.Footwork)
        end

        if spell.name == "Impetus" then
            equip({body = gear.Empy.body})
        elseif spell.name == 'Footwork' then
            equip(sets.status.Footwork)
        end

    end

end


function status_change(new,old)

    if new == "Idle" then
        equip(sets.status.Idle.DT)

    elseif player.status == "Engaged" then

        equip(sets.status.Hybrid)
        if buffactive['Impetus'] then
            equip({body = gear.Empy.body})
        end
        if buffactive['Footwork'] then
            equip(sets.status.Footwork)
        end


    elseif sets.status[new] then
        equip(sets.status[new])
    end

end
