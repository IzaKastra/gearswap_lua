include('organizer-lib')

function get_sets()

    maps()

    MagicBurstFlag     = 0
    MagicAccuracyFlag  = 0
    TreasureHunterFlag = 0
    MeleeFlag          = 1

    send_command('bind f9 gs c check status')
    send_command('bind f11 gs c equip Crimson')
    send_command('bind f12 gs c Equip DT')

    send_command('bind ^f9 gs c toggle Melee')
    send_command('bind ^f10 gs c toggle Treasure Hunter')
    send_command('bind ^f11 gs c toggle MagicBurst')
    send_command('bind ^f12 gs c Equip Refresh')
    function file_unload()
        send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind ^f10')
        send_command('unbind f11')
        send_command('unbind ^f11')
        send_command('unbind f12')
        send_command('unbind ^f12')
    end



function check_param()
        print('-------------------------')
        if MagicBurstFlag == 0 then
            print('Magic Burst:.........OFF')
        elseif MagicBurstFlag == 1 then
            print('Magic Burst:.........ON')
        end
        if MeleeFlag == 1 then
            print('Melee Style:......ON')
        end
        if TreasureHunterFlag == 0 then
            print('Treasure Hunter:.....OFF')
        elseif TreasureHunterFlag == 1 then
            print('Treasure Hunter:.....ON')
        end
        print('-------------------------')
end

    function self_command(command)
        if command == 'check status' then
            print('-------------------------')
            if MagicBurstFlag == 0 then
                print('Magic Burst:..........OFF')
            elseif MagicBurstFlag == 1 then
                print('Magic Burst:..........ON')
            end
            if MeleeFlag == 1 then
                print('Melee Mode............ON')
            elseif MeleeFlag == 2 then
                print('Melee Style:.........OFF')
            end
            if TreasureHunterFlag == 0 then
                print('Treasure Hunter:.....OFF')
            elseif TreasureHunterFlag == 1 then
                print('Treasure Hunter:.....ON')
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
    if command == 'toggle Melee' then
        if MeleeFlag == 1 then
            MeleeFlag = 2
            send_command('@input /echo Melee Mode: ON.')
        elseif MeleeFlag == 2 then
            MeleeFlag = 1
            send_command('@input /echo Melee Mode: OFF.')
        end
        check_param()
    end
    if command == 'Equip DT' then
        equip(sets.status.Idle.DT)
        send_command('@input /echo Damage Taken set equipped.')
    end
    if command == 'Equip Refresh' then
        equip(sets.status.Idle.Refresh)
        send_command('@input /echo Idle Refresh set equipped.')
    end
    if command == 'equip Crimson' then
        equip(gear.CrimsonToggle)
        send_command('@input /echo Carmine Cuisses +1 Equipped.')
    end
    if command == 'toggle Treasure Hunter' then
        if TreasureHunterFlag == 0 then
            TreasureHunterFlag = 1
            send_command('@input /echo Treasure Hunter: ON')
        elseif TreasureHunterFlag == 1 then
            TreasureHunterFlag = 0
            send_command('@input /echo Treasure Hunter: OFF')
        end
        check_param()
    end

end



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- OSEEM-AUGMENTED/SPECIAL GEAR ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    gear = {}

    gear.AF = {}
    gear.AF.head                       = { name="Atro. Chapeau +2"}
    gear.AF.body                       = { name="Atrophy Tabard +2"}
    gear.AF.hands                      = { name="Atrophy Gloves +2"}
    gear.AF.legs                       = { name="Atrophy Tights +1"}
    gear.AF.feet                       = {}

    gear.Amalric = {}
    gear.Amalric.body = {}
    gear.Amalric.body.Nuke             = { name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}

    gear.Amalric.hands = {}
    gear.Amalric.hands.Nuke            = { name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}

    gear.Amalric.legs = {}
    gear.Amalric.legs.Nuke             = { name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}

    gear.Amalric.feet ={}
    gear.Amalric.feet.Nuke             = { name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}

    gear.AmbuCape = {}
    gear.AmbuCape.MND                  = { name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20',}}
    gear.AmbuCape.INT                  = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
    gear.AmbuCape.MeleeTP              = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
    gear.AmbuCape.WSD                  = {}

    gear.Chironic = {}

    gear.Chironic.head = {}
    gear.Chironic.head.blank           = { name="Chironic hat"}

    gear.Chironic.body = {}
    gear.Chironic.body.blank           = { name="Chironic Doublet"}

    gear.Chironic.hands = {}
    gear.Chironic.hands.Idle           = { name="Chironic Gloves", augments={'"Mag.Atk.Bns."+2','"Resist Silence"+10','INT+6',}}

    gear.Chironic.legs = {}
    gear.Chironic.legs.MNDfeeble       = { name="Chironic Hose", augments={'Mag. Acc.+26','MND+10',}}
  gear.Chironic.legs.INTfeeble       = { name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Fast Cast"+3','INT+8','Mag. Acc.+4',}}

    gear.Chironic.feet = {}
    gear.Chironic.feet.blank           = { name="Chironic Slippers"}

    gear.Colada = {}
    gear.Colada.WSD                    = { name="Colada", augments={'Crit.hit rate+2','DEX+5','Accuracy+24','Attack+25','DMG:+13',}}

    gear.Crimson                       = { name="Carmine Cuisses +1"}
    gear.CrimsonToggle                 = { legs="Carmine Cuisses +1"}

    gear.Empy = {}
    gear.Empy.head                     = { name="Lethary Chappel +1"}
    gear.Empy.body                     = { name="Lethargy Sayon +1"}
    gear.Empy.hands                    = { name="Leth. Gantherots +1"}
    gear.Empy.legs                     = { name="Leth. Fuseau +1"}
    gear.Empy.feet                     = { name="Leth. Houseaux +1"}

    gear.Grio = {}
    gear.Grio.Enfeeble                 = { name="Grioavolr", augments={'Enfb.mag. skill +8','MP+96','Mag. Acc.+29','"Mag.Atk.Bns."+25',}}
    gear.Grio.MB                       = {}

    gear.Merlinic = {}
    gear.Merlinic.head = {}
    gear.Merlinic.head.NukeAccuracy    = { name="Merlinic Hood", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Mag. crit. hit dmg. +2%','MND+6','Mag. Acc.+9','"Mag.Atk.Bns."+13',}}
    gear.Merlinic.head.FC              = { name="Merlinic Hood", augments={'Mag. Acc.+9','"Fast Cast"+6',}}
    gear.Merlinic.head.IdleRefresh     = { name="Merlinic Hood", augments={'DEX+2','Crit.hit rate+3','"Refresh"+1','Accuracy+20 Attack+20','Mag. Acc.+18 "Mag.Atk.Bns."+18',}}

    gear.Merlinic.body                 = {}

    gear.Merlinic.hands = {}
    gear.Merlinic.hands.TH             = { name="Merlinic Dastanas", augments={'MND+9','"Fast Cast"+4','"Treasure Hunter"+1',}}
    gear.Merlinic.hands.FC             = { name="Merlinic Dastanas", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','"Fast Cast"+5','DEX+3','Mag. Acc.+4','"Mag.Atk.Bns."+9',}}
  gear.Merlinic.hands.DrainAspir     = { name="Merlinic Dastanas", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','"Drain" and "Aspir" potency +4','MND+2','Mag. Acc.+6','"Mag.Atk.Bns."+5',}}

    gear.Merlinic.legs                 = {}
    gear.Merlinic.legs.MagicBurst      = { name="Merlinic Shalwar", augments={'Mag. Acc.+24','Magic burst dmg.+9%','INT+10','"Mag.Atk.Bns."+15',}}
    gear.Merlinic.legs.MagicAccuracy   = { name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','CHR+2','Mag. Acc.+12','"Mag.Atk.Bns."+5',}}

    gear.Merlinic.feet = {}
    gear.Merlinic.feet.DrainAspir      = { name="Merlinic Crackows", augments={'Mag. Acc.+27','"Drain" and "Aspir" potency +10',}}
    gear.Merlinic.feet.FC              = { name="Merlinic Crackows", augments={'"Fast Cast"+6','"Mag.Atk.Bns."+1',}}
    gear.Merlinic.feet.MagicBurst      = { name="Merlinic Crackows", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+9%','MND+5',}}

    gear.Moonshade                     = { name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}}

    gear.Relic = {}
    gear.Relic.head                    = { name="Viti. Chapeau +3", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}}
    gear.Relic.body                    = { name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}}
    gear.Relic.hands                   = { name="Viti. Gloves +1", augments={'Enhances "Phalanx II" effect',}}
    gear.Relic.legs                    = {}
    gear.Relic.feet                    = { name="Vitiation Boots +3", augments={'Enhances "Paralyze II" effect',}}

    gear.Obi                           = {waist="Hachirin-no-Obi"}

    gear.ranged = {}
    gear.ranged.Ullr                   = { ranged="Ullr"}

    gear.Telchine = {}
    gear.Telchine.head                 = { name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}}
    gear.Telchine.body                 = { name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}}
    gear.Telchine.hands                = { name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +6',}}
    gear.Telchine.legs                 = { name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +8',}}
    gear.Telchine.feet                 = { name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}}


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- STATUS SETS --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    sets.status = {}
    sets.status.Idle = {}
    sets.status.Idle.DT = {
        main="Daybreak",
        sub='Sacro Bulwark',
        ammo="Homiliary",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Loricate Torque +1",
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear="Sanare Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle",
    }
    sets.status.Idle.Refresh = {
        main="Daybreak",
        sub='Sacro Bulwark',
        ammo="Homiliary",
        head = gear.Relic.head,
        body = gear.Empy.body,
        hands="Volte Gloves",
        legs="Volte Brais",
        feet="Volte Gaiters",
        neck={ name="Loricate Torque +1", augments={'Path: A',}},
        waist="Carrier's Sash",
        left_ear="Etiolation Earring",
        right_ear="Loquac. Earring",
        left_ring="Defending Ring",
        right_ring="Shadow Ring",
        back="Shadow Mantle",
    }
    sets.status.Melee = {
        ammo="Yetshila +1",
        head="Malignance Chapeau",
        body="Malignance Tabard",
        hands="Malignance Gloves",
        legs="Malignance Tights",
        feet="Malignance Boots",
        neck="Anu Torque",
        waist="Windbuffet Belt +1",
        left_ear="Telos Earring",
        right_ear="Sherida Earring",
        left_ring="Ilabrat Ring",
        right_ring="Chirich Ring +1",
        back = gear.AmbuCape.MeleeTP,
    }


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    sets.precast = {}
    sets.precast.FastCast = {
    -- 71% Fast Cast, 7% Quick Cast
        ammo="Impatiens",
        head = gear.AF.head,
        body = gear.Relic.body,
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet = gear.Merlinic.feet.FC,
        neck="Orunmila's Torque",
        waist="Embla Sash",
        left_ear="Etiolation Earring",
        right_ear="Loquac. Earring",
        left_ring="Weather. Ring +1",
        right_ring="Lebeche Ring",
    }
    sets.precast.Impact = {
    -- 71% Fast Cast, 7% Quick Cast
        ammo="Impatiens",
        body="Twilight Cloak",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet = gear.Merlinic.feet.FC,
        neck="Orunmila's Torque",
        waist="Embla Sash",
        left_ear="Etiolation Earring",
        right_ear="Loquac. Earring",
        left_ring="Weather. Ring +1",
        right_ring="Lebeche Ring",
    }
    sets.precast.SS = {
    -- -33% Stoneskin Casting Time
        head="Umuthi Hat",
        legs="Doyen Pants",
        waist="Siegel Sash",
    }
    sets.precast.Enhancing = {waist="Siegel Sash",}
    sets.precast.Chainspell = {    body = gear.Relic.body,}
    sets.precast.Enfeeble = {head = gear.Empy.head,}
    sets.precast.Healing = {legs="Doyen Pants",}
    sets.precast["Chant du Cygne"] = {
        ammo="Yetshila",
        head="Aya. Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands="Aya. Manopolas +2",
        legs="Aya. Cosciales +2",
        feet="Thereoid Greaves",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear = gear.Moonshade,
        right_ear="Sherida Earring",
        left_ring="Ilabrat Ring",
        right_ring="Begrudging Ring",
        back = gear.AmbuCape.MeleeTP,
    }
    sets.precast.Requiescat = {
        ammo="Regal Gem",
        head="Jhakri Coronal +2",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +1",
        legs="Jhakri Slops +1",
        feet="Jhakri Pigaches +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear = gear.Moonshade,
        right_ear="Regal Earring",
        left_ring="Ilabrat Ring",
        right_ring="Rajas Ring",
        back = gear.AmbuCape.MeleeTP,
    }
    sets.precast["Savage Blade"] = {
        ammo="Regal Gem",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Republican Platinum Medal",
        waist="Sailfi Belt +1",
        left_ear = gear.Moonshade,
        right_ear="Regal Earring",
        left_ring="Ilabrat Ring",
        right_ring="Shukuyu Ring",
        back = gear.AmbuCape.MeleeTP,
    }
    sets.precast["Death Blossom"] = { -- Needs redone
        ammo="Regal Gem",
        head="Jhakri Coronal +2",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +1",
        legs="Jhakri Slops +1",
        feet="Jhakri Pigaches +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear = gear.Moonshade,
        right_ear="Regal Earring",
        left_ring="Ilabrat Ring",
        right_ring="Rajas Ring",
        back = gear.AmbuCape.MeleeTP,
    }
    sets.precast["Sanguine Blade"] = {
        ammo="Pemphredo Tathlum",
        head="Jhakri Coronal +2",
        body="Jhakri Robe +2",
        hands="Jhakri Cuffs +1",
        legs="Jhakri Slops +1",
        feet="Jhakri Pigaches +2",
        neck="Baetyl Pendant",
        waist="Sacro Cord",
        left_ear = gear.Moonshade,
        right_ear="Regal Earring",
        left_ring="Shiva Ring +1",
        right_ring="Shiva Ring +1",
        back = gear.AmbuCape.INT,
    }
    sets.precast["Aeolian Edge"] = {
        ammo="Oshasha's Treatise",
        head={ name="Bunzi's Hat", augments={'Path: A',}},
        body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        neck="Fotia Gorget",
        waist="Orpheus's Sash",
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Malignance Earring",
        left_ring="Freke Ring",
        right_ring="Shiva Ring +1",
        back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
        }


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    sets.midcast = {}

    sets.midcast.INTfeeble = {
        main = gear.Grio.Enfeeble,
        sub="Enki Strap",
        ammo="Regal Gem",
        head = gear.Relic.head,
        body = gear.Empy.body,
        body = gear.AF.body,
        hands = gear.Empy.hands,
        legs = gear.Chironic.legs.INTfeeble,
        feet = gear.Relic.feet,
        neck="Duelist's Torque +1",
        waist="Sacro Cord",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Metamorph Ring +1",
        right_ring="Kishar Ring",
        back = gear.AmbuCape.INT,
    }
    sets.midcast.MNDfeeble = {
        main = gear.Grio.Enfeeble,
        sub="Enki Strap",
        ammo="Regal Gem",
        head = gear.Relic.head,
        body = gear.Empy.body,
        body = gear.AF.body,
        hands = gear.Empy.hands,
        legs = gear.Chironic.legs.MNDfeeble,
        feet = gear.Relic.feet,
        neck="Duelist's Torque +1",
        waist="Sacro Cord",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Metamorph Ring +1",
        right_ring="Kishar Ring",
        back = gear.AmbuCape.MND,
    }
    sets.midcast.Impact = {
        main = gear.Grio.Enfeeble,
        sub="Enki Strap",
        ammo="Regal Gem",
        body="Twilight Cloak",
        hands = gear.Empy.hands,
        legs = gear.Chironic.legs.INTfeeble,
        feet = gear.Relic.feet,
        feet="Malignance Boots",
        neck="Duelist's Torque +1",
        waist="Sacro Cord",
        left_ear="Regal Earring",
        right_ear="Malignance Earring",
        left_ring="Weather. Ring +1",
        right_ring="Kishar Ring",
        back = gear.AmbuCape.INT,
    }
    sets.midcast.Cures = {
    -- +58% Cure Potency, -25 Enmity
        main="Daybreak",
        sub="Sacro Bulwark",
        ammo="Regal Gem",
        head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
        body={ name="Vanya Robe", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
        hands = gear.Chironic.hands.Idle,
        legs = gear.Chironic.legs.MNDfeeble,
        feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
        neck="Incanter's Torque",
        waist="Cascade Belt",
        left_ear="Mendi. Earring",
        right_ear="Halasz Earring",
        left_ring="Sirona's Ring",
        right_ring="Ephedra Ring",
        back = "Solemnity Cape",
    }
    sets.midcast.EnhancingOthers = {
        sub="Ammurapi Shield",
        head = gear.Empy.head,
        body = gear.Relic.body,
        hands = gear.AF.hands,
        legs = gear.Empy.legs,
        feet = gear.Empy.feet,
        neck="Duelist's Torque +1",
        waist="Embla Sash",
        left_ear="Andoaa Earring",
        right_ear="Lethargy Earring +1",
        back = gear.AmbuCape.MND,
    }
    sets.midcast.EnhancingSelf = {
        sub="Ammurapi Shield",
        head="Befouled Crown",
         body = gear.Relic.body,
         hands = gear.AF.hands,
         legs = gear.Crimson,
         feet = gear.Empy.feet,
        neck="Duelist's Torque +1",
        waist="Embla Sash",
        left_ear="Andoaa Earring",
        right_ear="Lethargy Earring +1",
        back = gear.AmbuCape.MND,
    }
    sets.midcast.EnhancingDuration = {
        main="Arendsi Fleuret",
        sub="Ammurapi Shield",
        head = gear.Telchine.head,
        body = gear.Relic.body,
        hands = gear.AF.hands,
        legs = gear.Telchine.legs,
        feet = gear.Empy.feet,
        neck="Duelist's Torque +1",
        waist="Embla Sash",
        left_ear="Andoaa Earring",
        right_ear="Lethargy Earring +1",
        back = gear.AmbuCape.MND,

    }
    sets.midcast.EnhancingSkill = {
        sub="Ammurapi Shield",
        head="Befouled Crown",
        body = gear.Relic.body,
        hands = gear.AF.hands,
        legs = gear.Crimson,
        feet = gear.Empy.feet,
        neck="Incanter's Torque",
        waist="Cascade Belt",
        left_ear="Andoaa Earring",
        right_ear="Lethargy Earring +1",
        back = gear.AmbuCape.MND,
    }
    sets.midcast.Nuke = {
        main={ name="Bunzi's Rod", augments={'Path: A',}},
        sub="Ammurapi Shield",
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Ea Hat +1",
        body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        neck="Sibyl Scarf",
        waist="Sacro Cord",
        left_ear="Malignance Earring",
        right_ear="Regal Earring",
        left_ring="Freke Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
        }
    sets.midcast.MagicBurst = {
        main={ name="Bunzi's Rod", augments={'Path: A',}},
        sub="Ammurapi Shield",
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head="Ea Hat +1",
        body="Ea Houppe. +1",
        hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        legs="Ea Slops +1",
        feet={ name="Amalric Nails +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
        neck="Sibyl Scarf",
        waist="Sacro Cord",
        left_ear="Malignance Earring",
        right_ear="Regal Earring",
        left_ring="Freke Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
        }
    sets.midcast.DrainAspir = {
        head="Pixie Hairpin +1",
        body="Shango Robe",
        legs = gear.Merlinic.legs.MagicAccuracy,
        feet = gear.Merlinic.feet.DrainAspir,
        neck="Erra Pendant",
        waist="Fucho-no-Obi",
        left_ring="Evanescence Ring",
        right_ring="Archon Ring"
    }
    sets.midcast.Stoneskinn = {
        neck="Noden's Gorget",
        waist="Siegel Sash",
    }
    sets.midcast.Aquaveill = {head = gear.Chironic.head.blank,}
    sets.midcast.Regenn = {main="Bolelabunga",}
    sets.midcast.Refreshh = {
        body = gear.AF.body,
        legs = gear.Empy.legs,
    }
    sets.midcast.Cursna = {
    -- +88 Healing Magic Skill, +35 Cursna
        body = gear.Relic.head,
        legs = gear.AF.legs,
        feet={ name="Vanya Clogs", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
        neck="Incanter's Torque",
        left_ring="Haoma's Ring",
        right_ring="Haoma's Ring",
    }
    sets.midcast.ConserveMP = {
    -- +34 Conserve MP
        head={ name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}},
        body="Vedic Robe",
        legs="Vanya Slops",
        feet={ name="Medium's Sabots", augments={'MP+45','MND+9','"Conserve MP"+5','"Cure" potency +4%',}},
        neck="Incanter's Torque",
        left_ear="Mendi. Earring",
        back="Solemnity Cape",
    }
    sets.midcast.Treasure = {
    -- +3 Treasure Hunter
        head="Wh. Rarab Cap +1",
                hands = gear.Merlinic.hands.TH,
        waist="Chaac Belt",
                feet="Volte Boots",
    }
    sets.midcast.Recast = {
    -- +29% Haste
        head="Aya. Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="Aya. Cosciales +2",
        feet = gear.Merlinic.feet.FC,
    }
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- SPELL/ABILITY LISTS ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function maps() -- For some reason this is required if you want to use List:contains(spell.english). You have to have this "function maps()" and "end" lines surrounding your lists.
-- You also need the maps() line in your get_sets() function if you want these to work.
-- Otherwise you will get an error for all lines that use the "contains(spell.english)" function that says something along the lines of "attempt to index global 'TreasureHunter' (a Nil value)"
-- In addition to the above 3 lines, you'll also need to have the random S infront of your lists

    Cures          = S {"Cure", "Cure II", "Cure III", "Cure IV"}
    EraseNas       = S {"Paralyna", "Stona", "Poisona", "Blindna", "Viruna", "Silena", "Cursna", "Erase"}
    HighCost       = S {"Raise", "Raise II", "Reraise", "Protect V", "Shell V"}
    BarSpells      = S {"Barfire", "Barwater", "Barthunder", "Barstone", "Baraero", "Barblizzard", "Barparalyze", "Barpetrify", "Barpoison", "Barblind", "Barvirus", "Barsilence", "Barsleep", "Baramnesia"}
    DrainSpells    = S {"Drain", "Aspir"}
    Gains          = S {"Gain-STR", "Gain-DEX", "Gain-VIT", "Gain-AGI", "Gain-INT", "Gain-MND", "Gain_CHR"}
    Enspells       = S {"Enstone", "Enstone II", "Enwater", "Enwater II", "Enaero", "Enaero II", "Enfire", "Enfire II", "Enblizzard", "Enblizzard II", "Enthunder", "Enthunder II"}
    MNDfeeble      = S {"Addle", "Addle II", "Inundation", "Paralyze", "Paralyze II", "Silence", "Slow", "Slow II"}
    INTfeeble      = S {"Bind", "Blind", "Blind II", "Distract", "Distract II", "Distract III", "Frazzle", "Frazzle II", "Frazzle III", "Gravity", "Gravity II", "Sleep", "Sleep II", "Poison", "Poison II", "Break", "Dispel"}
    DoTs           = S {"Dia", "Dia II", "Dia III", "Bio", "Bio II", "Bio III"}
    EnhSkill       = S {"Blink", "Ice Spikes", "Shock Spikes", "Blaze Spikes", "Temper", "Temper II",
                                            "Gain-STR", "Gain-DEX", "Gain-VIT", "Gain-AGI", "Gain-INT", "Gain-MND", "Gain_CHR",
                                            "Enstone", "Enstone II", "Enwater", "Enwater II", "Enaero"}
    EnhDuration    = S {"Haste", "Haste II", "Flurry", "Flurry II", "Refresh", "Refresh II", "Refresh III", "Regen", "Regen II", "Klimaform"}
    Storms         = S {"Sandstorm", "Windstorm", "Hailstorm", "Firestorm", "Rainstorm", "Thunderstorm", "Aurorastorm", "Voidstorm"}
    Ninjutsu       = S {"Utsusemi: Ichi", "Utsusemi: Ni"}
    Treasure       = S {"Dia", "Dia II", "Dia III", "Diaga", "Bio", "Bio II", "Bio III"}

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function precast(spell)

    if sets.precast[spell.name] then
        equip(sets.precast[spell.name])
    elseif spell.skill == "Healing Magic" then
        equip(set_combine(sets.precast.FastCast, sets.precast.Healing))
    elseif spell.skill == "Enfeebling Magic" then
        equip(set_combine(sets.precast.FastCast, sets.precast.Enfeeble))
    elseif spell.name == "Stoneskin" then
        equip(set_combine(sets.precast.FastCast, sets.precast.SS))
    elseif spell.skill == "Enhancing Magic" then
        equip(set_combine(sets.precast.FastCast, sets.precast.Enhancing))
    else
        equip(sets.precast.FastCast)
    end

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function midcast(spell)


    if spell.skill == "Healing Magic" or spell.name == "Erase" then
        if Cures:contains(spell.english) then
            equip(sets.midcast.Cures)
            if world.weather_element == spell.element or world.day_element == spell.element then
                equip(gear.Obi)
            end
        elseif spell.name == "Cursna" then
            equip(set_combine(sets.midcast.MNDfeeble, sets.midcast.Cursna))
        elseif EraseNas:contains(spell.english) then
            equip(set_combine(sets.midcast.ConserveMP, sets.midcast.Recast))
        elseif HighCost:contains(spell.english) then
            equip(set_combine(sets.midcast.Recast, sets.midcast.ConserveMP))
        end



    elseif spell.skill == "Enfeebling Magic" then
        if MNDfeeble:contains(spell.english) then
            equip(sets.midcast.MNDfeeble)
        elseif INTfeeble:contains(spell.english) then
            equip(sets.midcast.INTfeeble)
            if spell.name == "Frazzle II" then
                equip(gear.ranged.Ullr)
            end
        end

    elseif spell.skill == "Enhancing Magic" then
        if spell.target.type ~= 'SELF' then
            equip(sets.midcast.EnhancingOthers)
        else
            equip(sets.midcast.EnhancingSelf)
            if EnhDuration:contains(spell.name) or Storms:contains(spell.name) then
                equip(sets.midcast.EnhancingDuration)
            end
            if spell.name == "Stoneskin" then
                equip(sets.midcast.Stoneskinn)
            elseif spell.name == "Aquaveil" then
                equip(sets.midcast.Aquaveill)
            end
        end
        if BarSpells:contains(spell.english) or Enspells:contains(spell.english) or Gains:contains(spell.english) or EnhSkill:contains(spell.english) then
            equip(sets.midcast.EnhancingSkill)
        end

    elseif spell.skill == "Elemental Magic" then
        equip(sets.midcast.Nuke)
        if MagicBurstFlag == 1 then
            equip(sets.midcast.MagicBurst)
        end
        if world.weather_element == spell.element or world.day_element == spell.element then
            equip(gear.Obi)
        end
        if spell.name == "Impact" then
            equip(sets.midcast.Impact)
        end

    elseif spell.skill == "Dark Magic" then
        if spell.name == "Bio III" then
            equip(set_combine(sets.midcast.Nuke,sets.midcast.DrainAspir))
        elseif DrainSpells:contains(spell.name) then
            equip(set_combine(sets.midcast.Nuke,sets.midcast.DrainAspir))
        end
        if world.weather_element == spell.element or world.day_element == spell.element then
            equip(sets.Obi)
        end


    elseif HighCost:contains(spell.english) then
        equip(set_combine(sets.midcast.Recast, sets.midcast.ConserveMP))


    end

    if Treasure:contains(spell.name) then
        if TreasureHunterFlag == 1 then
            print("Applying Treasure Hunter 3.")
            equip(sets.midcast.Treasure)
        end
    end

end




function aftercast(spell)
--    print("Aftercast:",player.status)
    if player.status == 'Idle' then
        if player.mpp < 80 then
            equip(sets.status.Idle.Refresh)
        else
            equip(sets.status.Idle.DT)
        end
    elseif player.status == "Engaged" then
        if MeleeFlag == 1 then
            equip(sets.status.Melee)
        elseif player.mpp < 100 then
            equip(sets.status.Idle.Refresh)
        else
            equip(sets.status.Idle.DT)
        end
    end
end

function status_change(new,old)
--    print("Status Change:",player.status)
    if new == "Idle" then
        if player.mpp < 80  then
            equip(sets.status.Idle.Refresh)
        else
            equip(sets.status.Idle.DT)
        end
    elseif new == "Engaged" then
        if MeleeFlag == 1 then
            equip(sets.status.Melee)
        end
    elseif sets.status[new] then
        equip(sets.status[new])
    end
end
