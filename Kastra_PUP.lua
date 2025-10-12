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
    send_command('bind ^f9 gs c equip automaton enmity')
    send_command('bind ^f10 gs c equip automaton magic')
    send_command('bind ^f12 gs c equip TP')

    function file_unload()
        send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind f11')
        send_command('unbind f12')
        
        send_command('unbind !f9')
        send_command('unbind !f10')
        send_command('unbind !f11')
        send_command('unbind !f12')

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
          if command == 'equip automaton enmity' then
            equip(sets.Automaton.Enmity)
            send_command('@input /echo Automaton enmity equipped.')
          end
          if command == 'equip TP' then
            equip(sets.Melee.Hybrid)
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
    gear.Artifact.hands = { name="Foire Dastanas +3"}
    gear.Artifact.legs  = {}
    gear.Artifact.feet  = { name="Foire Babouches +2"}

    gear.Relic = {}
    gear.Relic.head  = {}
    gear.Relic.body  = { name="Pitre Tobe +3"}
    gear.Relic.hands = { name="Pitre Dastanas +3"}
    gear.Relic.legs  = { name="Pitre Churidars +3"}
    gear.Relic.feet  = { name="Pitre Babouches +3"}

    gear.Empyrean = {}
    gear.Empyrean.head   = { name="Kara. Cappello +3"}
    gear.Empyrean.body   = {}
    gear.Empyrean.hands  = { name="Karagoz Guanti +3"}
    gear.Empyrean.legs   = {}
    gear.Empyrean.feet   = { name="Karagoz Scarpe +3"}

    gear.AmbuCape = {}
    gear.AmbuCape.TP = { name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','"Store TP"+10','Pet: Damage taken -5%',}}
    gear.AmbuCape.PetNuke = { name="Visucius's Mantle", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Accuracy+20 Attack+20','Pet: Magic Damage+10','"Fast Cast"+10',}}
    gear.AmbuCape.CritSTR = { name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}}
    
    gear.ReiveCape = { name="Dispersal Mantle", augments={'STR+3','DEX+1','Pet: TP Bonus+500',}}


    gear.Herculean = {}
    gear.Herculean.head = {}
    gear.Herculean.head.FC = { name="Herculean Helm", augments={'"Mag.Atk.Bns."+6','"Fast Cast"+4',}}

    gear.Herculean.feet = {}
    gear.Herculean.feet.QA = { name="Herculean Boots", augments={'Accuracy+17','Pet: STR+1','Quadruple Attack +3','Accuracy+18 Attack+18','Mag. Acc.+3 "Mag.Atk.Bns."+3',}}


    gear.Taeon = {}
    gear.Taeon.head = { name="Taeon Chapeau", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}}
    gear.Taeon.body = { name="Taeon Tabard", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}}
    gear.Taeon.hands = { name="Taeon Gloves", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}}
    gear.Taeon.legs = { name="Taeon Tights", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}}
    gear.Taeon.feet = { name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}}


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
        ring1="Murky Ring",
        ring2="Shadow Ring",
        back = gear.AmbuCape.TP
    }

    sets.Melee = {}
    sets.Melee.Hybrid = {
        head="Malignance Chapeau",
        body="Mpaca's Doublet",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Shulmanu Collar",
        waist="Moonbow Belt +1",
        ear1="Schere Earring",
        ear2="Kara. Earring +2",
        ring1="Lehko's ring",
        ring2="Gere Ring",
        back = gear.AmbuCape.TP
    }

    sets.Melee.Glass = {
        head="Ryuo Somen +1",
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
        back = gear.AmbuCape.TP
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
        back = gear.AmbuCape.CritSTR
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
        back = gear.AmbuCape.CritSTR
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
        back = gear.AmbuCape.CritSTR
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
        back = gear.AmbuCape.CritSTR
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
        back = gear.AmbuCape.CritSTR
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
        back = gear.AmbuCape.CritSTR
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
        back = gear.AmbuCape.PetNuke
    }

    sets.Automaton.Enmity = {
        head="Heyoka Cap",
        body="Heyoka Harness",
        hands="Heyoka Mittens",
        legs="Heyoka Subligar",
        feet="Heyoka Leggings",
        left_ear="Rimeice Earring",
        right_ear="Domes. Earring",
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
        back = gear.AmbuCape.PetNuke,
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

    sets.PetTP={
        main={ name="Ohtas", augments={'Accuracy+70','Pet: Accuracy+70','Pet: Haste+10%',}},
        range="Animator P +1",
        ammo="Automat. Oil +3",
        head = gear.Taeon.head,
        body = gear.Taeon.body,
        hands = gear.Taeon.hands,
        legs = gear.Taeon.legs,
        feet = gear.Taeon.feet,
        neck="Shulmanu Collar",
        waist="Incarnation Sash",
        left_ear="Enmerkar Earring",
        right_ear={ name="Kara. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+20','Mag. Acc.+20','"Store TP"+8','STR+15 DEX+15',}},
        left_ring="Murky Ring",
        right_ring="C. Palug Ring",
        back = gear.AmbuCape.TP
    }

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
    elseif fastcast:contains(spell.skill) then -- Default to FastCast set only if casting a spell (don't equip FastCast for JA or items)
        equip(sets.FastCast)
    else
        equip(sets.status.Idle.DT)
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
