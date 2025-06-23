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
    send_command('bind ^f9 gs c equip automaton magic')

    function file_unload()
        send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind f11')
        send_command('unbind f12')
        
        send_command('unbind !f9')
        send_command('unbind !f10')

        send_command('unbind ^c')
        send_command('unbind ^cf9')
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
            print('-------------------------')
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

        if command == 'equip automaton magic' then
            equip(sets.Automaton.Magic)
            send_command('@input /echo Automaton Magic Attack equipped.')
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
            equip({ring2="Shneddick Ring +1"})
            send_command('@input /echo Shneddick Ring +1 equipped.')
        end

    end


  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  ----------- AUGMENTED/SPECIAL GEAR ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    gear = {}

    gear.Artifact = {}
    gear.Artifact.head  = {}
    gear.Artifact.body  = { name="Foire Tobe"}
    gear.Artifact.hands = { name="Pup. Dastanas"}
    gear.Artifact.legs  = {}
    gear.Artifact.feet  = { name="Pup. Babouches"}

    gear.Relic = {}
    gear.Relic.head  = {}
    gear.Relic.body  = { name="Pitre Tobe +3"}
    gear.Relic.hands = { name="Pitre Dastanas +3"}
    gear.Relic.legs  = { name="Pitre Churidars +3"}
    gear.Relic.feet  = { name="Pitre Babouches +3"}

    gear.Empyrean = {}
    gear.Empyrean.head   = { name="Kara. Cappello +3"}
    gear.Empyrean.body   = {}
    gear.Empyrean.hands  = { name="Karagoz Guanti +1"}
    gear.Empyrean.legs   = {}
    gear.Empyrean.feet   = { name="Karagoz Scarpe +3"}

    gear.AmbuCape = {}
    gear.AmbuCape.TP = {}

    gear.Herculean = {}
    gear.Herculean.head = {}
    gear.Herculean.head.FC = { name="Herculean Helm", augments={'"Mag.Atk.Bns."+6','"Fast Cast"+4',}}

    gear.Herculean.feet = {}
    gear.Herculean.feet.QA = { name="Herculean Boots", augments={'Accuracy+17','Pet: STR+1','Quadruple Attack +3','Accuracy+18 Attack+18','Mag. Acc.+3 "Mag.Atk.Bns."+3',}}


    gear.Taeon = {}
    gear.Taeon.head = {}
    gear.Taeon.body = {}
    gear.Taeon.hands = {}
    gear.Taeon.legs = {}
    gear.Taeon.feet = {}

    gear.Taeon.head.sird = { name="Taeon Chapeau", augments={'Evasion+25','Spell interruption rate down -10%','HP+49',}}
    gear.Taeon.body.sird = { name="Taeon Tabard", augments={'Evasion+25','Spell interruption rate down -10%','HP+47',}}
    gear.Taeon.legs.sird = { name="Taeon Tights", augments={'Evasion+25','Spell interruption rate down -10%','HP+50',}}
    gear.Taeon.feet.sird = { name="Taeon Boots", augments={'Evasion+24','Spell interruption rate down -10%','HP+45',}}


  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    sets.status = {}
    sets.status.Idle = {}
    sets.status.Idle.DT = {
        head="Null Masque",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Warder's Charm +1",
        waist="Null Belt",
        ear1="Enmerkar Earring",
        ear2="Karagoz Earring +2",
        ring1="Defending Ring",
        ring2="Shneddick Ring +1",
        back="Visucius's Mantle", -- Pet DT
    }

    sets.Melee = {}
    sets.Melee.Hybrid = {
        head="Ryuo Somen +1",
        head="Malignance Chapeau",
        body="Mpaca's Doublet",
        hands="Malignance Gloves",
        legs="Samnuha Tights",
        feet="Malignance Boots",
        neck="Shulmanu Collar",
        waist="Moonbow Belt +1",
        ear1="Schere Earring",
        ear2="Kara. Earring +2",
        ring1="Lehko's ring",
        ring2="Gere Ring",
        back="Visucius's Mantle", -- DEX STP
    }

    sets.Treasure = {
        head="Volte Beret",
        hands="Volte Bracers",
        feet="Volte Boots",
        waist="Chaac Belt",
    }

    sets["Holy Water"] = {
        neck="Nicander's Necklace",
        ring2="Purity Ring",
    }

    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    sets.WeaponSkill = {}
    sets.WeaponSkill["Stringing Pummel"] = {
        head="Mpaca's Cap",
        body="Mpaca's Doublet",
        hands="Ryuo Tekko +1",
        legs="Mpaca's Hose",
        feet = gear.Empyrean.feet,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Schere Earring",
        ear2="Kara. Earring +2",
        ring1="Lehko's ring",
        ring2="Gere Ring",
        back="Visucius's Mantle", -- STR Crit
    }

    sets.WeaponSkill["Howling Fist"] = {
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Mpaca's Hose",
        feet = gear.Empyrean.feet,
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        ear1="Moonshade Earring",
        ear2="Schere Earring",
        ring1="Niqmaddu Ring",
        ring2="Gere Ring",
        back="Visucius's Mantle", -- VIT WSD
    }

    sets.WeaponSkill["Shijin Spiral"] = {
        head = gear.Empyrean.head,
        body="Mpaca's Doublet",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        ear1="Schere Earring",
        ear2="Kara. Earring +2",
        ring1="Niqmaddu Ring",
        ring2="Gere Ring",
        back="Visucius's Mantle", -- DEX WSD
    }


    sets.WeaponSkill["Victory Smite"] = {
        head="Mpaca's Cap",
        body="Mpaca's Doublet",
        hands="Ryuo Tekko +1",
        legs="Mpaca's Hose",
        feet = gear.Empyrean.feet,
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        ear1="Schere Earring",
        ear2="Kara. Earring +2",
        ring1="Lehko's ring",
        ring2="Gere Ring",
        back="Visucius's Mantle", -- STR Crit
    }

    sets.WeaponSkill["Raging Fists"] = {
        head="Mpaca's Cap",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Fotia Gorget",
        waist="Moonbow Belt +1",
        ear1="Moonshade Earring",
        ear2="Kara. Earring +2",
        ring1="Niqmaddu Ring",
        ring2="Gere Ring",
        back="Visucius's Mantle", -- STR DA
    }

    sets.WeaponSkill["Combo"] = sets.WeaponSkill["Raging Fists"]
    sets.WeaponSkill["Tornado Kick"] = sets.WeaponSkill["Raging Fists"]

    sets.WeaponSkill["Asuran Fists"] = {
        head = gear.Empyrean.head,
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet = gear.Empyrean.feet,
        neck="Fotia Gorget",
        waist="Fotia Belt",
        ear1="Schere Earring",
        ear2="Kara. Earring +2",
        ring1="Niqmaddu Ring",
        ring2="Gere Ring",
        back="Visucius's Mantle", -- STR WSD
    }


    sets.Automaton = {}
    sets.Automaton.Magic = {
        head = gear.Empyrean.head,
        body="Udug Jacket",
        hands = gear.Empyrean.hands,
        legs = gear.Relic.legs,
        feet = gear.Relic.feet,
        neck="Adad Amulet",
        waist="Incarnation Sash",
        ear1="Burana Earring",
        ear2="Kara. Earring +2",
        ring1="C. Palug Ring",
        back="Visucius's Mantle",
    }

    sets.FastCast = {
        head = gear.Herculean.head.FC,
        body={ name="Taeon Tabard", augments={'Evasion+25','Spell interruption rate down -10%','HP+47',}},
        legs="Gyve Trousers",
        neck="Orunmila's Torque",
        ear1="Loquac. Earring",
        ear2="Etiolation Earring",
        ring1="Weather. Ring",
        ring2="Lebeche Ring",
    }

    sets.Enmity = {
        hands="Kurys Gloves",
        neck="Unmoving Collar +1",
        ear1="Cryptic Earring",
        ear2="Trux Earring",
        ring1="Petrov Ring",
        ring2="Eihwaz Ring",
    }

    sets.Maneuvers = {
        hands = gear.Artifact.hands,
        ear1="Burana Earring",
    }

    sets["Repair"] = {
        feet = gear.Artifact.feet,
        ear1="Pratik Earring",
        ear2="Guignol earring",
    }
    sets["Tactical Switch"] = {feet = gear.Empyrean.feet}
    sets["Overdrive"] = {body = gear.Relic.body}
    sets["Ventriloquy"] = {legs = gear.Relic.legs}
    sets["Role Reversal"] = {feet = gear.Relic.feet}

    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    sets.midcast = {}

    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
end


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

    elseif spell.name:contains("Maneuver") then
        equip(sets.Maneuvers)

    elseif fastcast:contains(spell.skill) then
        equip(sets.FastCast)
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

        equip(sets.Melee.Hybrid)
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

        equip(sets.Melee.Hybrid)
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
