include('organizer-lib')

function get_sets()
    maps()

	SIRDFlag = true
	TreasureHunterFlag = 0

	send_command('bind f9 gs c toggle SIRD')
	send_command('bind f11 gs c equip Crimson')
	send_command('bind f12 gs c Equip DT')
	send_command('bind ^f12 gs c Equip Refresh')
	send_command('bind ^f10 gs c toggle Treasure Hunter')
    send_command('bind !^f9 gs c Equip Aegis')
    send_command('bind !^f10 gs c Equip Duban')
    send_command('bind !^f11 gs c Equip Srivatsa')
    send_command('bind ^c gs c chocobo')

    function file_unload()
		send_command('unbind ^f10')
		send_command('unbind f9')
		send_command('unbind f11')
		send_command('unbind f12')
		send_command('unbind ^f12')
        send_command('unbind !^f9')
        send_command('unbind !^f10')
        send_command('unbind !^f11')
		send_command('unbind ^c')

	end


	function self_command(command)
	if command == 'Equip DT' then
		equip(sets.status.Idle.DT)
		send_command('@input /echo Damage Taken set equipped.')
	end
	if command == 'Equip Refresh' then
		equip(sets.status.Idle.Refresh)
		send_command('@input /echo Idle Refresh set equipped.')
	end
	if command == 'equip Crimson' then
		equip(sets.Crimson)
		send_command('@input /echo Carmine Cuisses +1 Equipped.')
	end

    if command == 'toggle SIRD' then
        if SIRDFlag == false then
            SIRDFlag = true
            send_command('@input /echo Spell Interruption: ON')
        elseif SIRDFlag == true then
            SIRDFlag = false
            send_command('@input /echo Spell Interruption: OFF')
        end
    end

    if command == 'Equip Aegis' then
        equip({sub="Aegis",})
        send_command('@input /echo Aegis equipped.')
    end
    if command == 'Equip Duban' then
        equip({sub="Duban",})
        send_command('@input /echo Duban equipped.')
    end
    if command == 'Equip Srivatsa' then
        equip({sub="Srivatsa",})
        send_command('@input /echo Srivatsa equipped.')
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



end



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- OSEEM-AUGMENTED/SPECIAL GEAR ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	gear = {}

	gear.AF = {}
	gear.AF.head                       = {}
	gear.AF.body                       = {name="Rev. Surcoat +3",}
	gear.AF.hands                      = {}
	gear.AF.legs                       = {}
	gear.AF.feet                       = {name="Rev. Leggings +1",}

	gear.AmbuCape = {}
	gear.AmbuCape.Idle                 = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','Chance of successful block +5',}}
	gear.AmbuCape.FastCast             = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','VIT+10','"Fast Cast"+10','Spell interruption rate down-10%',}}

	gear.Empy = {}
	gear.Empy.head                     = {name="Chev. Armet +3",}
	gear.Empy.body                     = {name="Chev. Cuirass +3",}
	gear.Empy.hands                    = {name="Chev. Gauntlets +3",}
	gear.Empy.legs                     = {name="Chev. Cuisses +3",}
	gear.Empy.feet                     = {name="Chev. Sabatons +3",}

	gear.Moonshade                     = {name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}}

	gear.Relic = {}
	gear.Relic.head                    = {name="Cab. Coronet +2", augments={'Enhances "Iron Will" effect',}}
	gear.Relic.body                    = {}
	gear.Relic.hands                   = {name="Cab. Gauntlets +2", augments={'Enhances "Chivalry" effect',}}
	gear.Relic.legs                    = {}
	gear.Relic.feet                    = {name="Cab. Leggings +3", augments={'Enhances "Guardian" effect',}}


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- STATUS SETS --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	sets.status = {}
	sets.status.Idle = {}
	sets.status.Idle.DT = {
        main="Burtgang",
        ammo="Staunch Tathlum +1",
        head = gear.Empy.head,
        head="Null Masque",
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands = gear.Empy.hands,
        legs = gear.Empy.legs,
        feet = gear.Empy.feet,
        neck={ name="Warder's Charm +1", augments={'Path: A',}},
        neck="Rep. Plat. Medal",
        waist="Plat. Mog. Belt",
        left_ear="Sanare Earring",
        right_ear="Tuisto Earring",
        left_ring={name="Moonlight Ring",bag="wardrobe",priority=1},
        right_ring="Warden's Ring",
        back = gear.AmbuCape.Idle,
    }
	sets.status.Melee = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Sakpata's Helm", augments={'Path: A',}},
        body={ name="Sakpata's Plate", augments={'Path: A',}},
        hands={ name="Sakpata's Gauntlets", augments={'Path: A',}},
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
        feet={ name="Sakpata's Leggings", augments={'Path: A',}},
        neck="Combatant's Torque",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Telos Earring",
        right_ear="Dedition Earring",
        left_ring="Lehko's Ring",
        right_ring={name="Moonlight Ring",bag="wardrobe2",priority=1},
        back="Reiki Cloak",
    }

    sets.Crimson = {
        legs={name="Carmine Cuisses +1", priority=1},
        right_ring={name="Moonlight Ring",bag="wardrobe2",priority=1},
    }

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- UTILITY SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    -- Basic sets used for PLD:
    -- Fast Cast
    -- Enmity
    -- Curing
    -- Idle DT
    -- TP
    -- WS
    -- Phalanx
    -- Divine Magic (Enlight)
    -- Cursna

    sets.SIRD = { -- 101% SIRD. Need 102%
        --merits: 10%
        ammo="Staunch Tathlum +1", -- 11%
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, -- 20%
        -- body="Chev. Cuirass +3", -- 20%
        hands="Chev. Gauntlets +3",
        legs={ name="Founder's Hose", augments={'MND+8','Mag. Acc.+14','Attack+13','Breath dmg. taken -3%',}}, -- 30%
        -- feet="Chev. Sabatons +3",
        neck="Moonbeam Necklace", -- 10%
        waist="Audumbla Sash", -- 10%
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear="Tuisto Earring",
        left_ring={name="Moonlight Ring",bag="wardrobe",priority=1},
        right_ring={name="Moonlight Ring",bag="wardrobe2",priority=2},
        back = gear.AmbuCape.FastCast, -- 10%
        }

    sets.Enmity = {
        -- +121 Enmity.
        -- +151 with Crusade
        -- caps at +200
        -- Can add +30 with upgrades, but lose HP
        main="Burtgang", -- +18
        ammo="Sapience Orb", -- +2
        head={ name="Loess Barbuta +1", augments={'Path: A',}}, -- + ~22
        body = gear.Empy.body, -- +16, +4 more from escha body
        hands = gear.Relic.hands, -- +8, +6 more from Yorium
        legs="Zoar Subligar +1", -- +6. Odyssean legs can be 4+8 if augmented
        feet="Chev. Sabatons +3", -- +15
        neck={ name="Unmoving Collar +1", augments={'Path: A',}}, -- +10
        waist="Plat. Mog. Belt", -- +5 more with Abyssea belt 
        left_ear="Cryptic Earring", -- +4
        right_ear="Trux Earring", -- +5
        left_ring="Eihwaz Ring", -- +5
        right_ring={name="Moonlight Ring",bag="wardrobe2",priority=1},
        back = gear.AmbuCape.Idle, -- +10
    }

    sets.Healing = {
        -- +48% Cure potency (50% cap)
        -- +40% Cure Received (30% cap)
        main="Sanus Ensis", -- 13%, +10%
        ammo="Staunch Tathlum +1",
        head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, -- +0%, +15%
        body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, -- +11%, +15%
        hands="Chev. Gauntlets +3",
        legs="Chev. Cuisses +3",
        feet={ name="Odyssean Greaves", augments={'"Fast Cast"+4','MND+8','"Mag.Atk.Bns."+6',}}, -- +7%, +0%
        neck={ name="Unmoving Collar +1", augments={'Path: A',}},
        waist="Plat. Mog. Belt",
        left_ear="Nourish. Earring +1", -- +7%, +0%
        right_ear={ name="Chev. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}}, -- +10%, +0%
        left_ring="Defending Ring",
        right_ring="Lebeche Ring",
        back = gear.AmbuCape.FastCast,
    }

    sets.Sentinel = {feet = gear.Relic.feet,}
    sets.Invincible = {legs = gear.Relic.legs,}
    sets["Holy Circle"] = {feet = gear.AF.feet,}

    sets.HolyWater = {
        neck="Nicander's Necklace",
        ring2="Purity Ring",
    }

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	sets.precast = {}

	sets.precast.FastCast = { -- 6% QC, 79% FC
        ammo="Impatiens", -- 2% QC
        head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}}, -- 12% FC
        body = gear.AF.body, -- 10% FC
        hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}}, -- 8% FC
        legs="Enif Cosciales", -- 8% FC
        feet = gear.Empy.feet, -- 13% FC
        neck="Orunmila's Torque", -- 5% FC
        waist={name="Plat. Mog. Belt", priority=1},
        left_ear="Etiolation Earring", -- 1% FC (+50 HP in exchange for 1% FC less than Loquacious)
        right_ring="Weather. Ring +1", -- 6% FC, 4% QC
        back = gear.AmbuCape.FastCast, -- 10% FC
    }
    sets.precast.WS = {
        ammo={ name="Coiste Bodhar", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet = gear.Empy.feet,
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Sherida Earring",
        left_ring="Sroda Ring",
        right_ring="Shukuyu Ring",
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','VIT+10','Weapon skill damage +10%','Damage taken-5%',}},
    }


    sets.precast.Aeolian = {
        ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Sibyl Scarf",
        waist={ name="Kentarch Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="Friomisi Earring",
        left_ring="Shiva Ring +1",
        right_ring="Shadow Ring",
        back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','VIT+10','Weapon skill damage +10%','Damage taken-5%',}},
    }

    sets.precast["Knights of Round"] = {
        ammo="Crepuscular Pebble",
        head="Nyame Helm",
        body="Nyame Mail",
        hands="Nyame Gauntlets",
        legs="Nyame Flanchard",
        feet="Nyame Sollerets",
        neck="Rep. Plat. Medal",
        waist="Sailfi Belt +1",
        ear1="Lugra Earring +1",
        ear2="Thrud Earring",
        ring1="Sroda Ring",
        ring2="Regal Ring",
        back="Null Shawl",
    }


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	sets.midcast = {}
    sets.midcast.Phalanx = {
        -- Phalanx +26
        main="Sakpata's Sword", -- +5
        head={ name="Odyssean Helm", augments={'"Snapshot"+3','Weapon Skill Acc.+12','Phalanx +3','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}, -- +3
        hands={ name="Souv. Handschuhs", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}}, -- +4
        legs={ name="Sakpata's Cuisses", augments={'Path: A',}}, -- +5
        feet={ name="Souveran Schuhs", augments={'HP+80','Enmity+7','Potency of "Cure" effect received +10%',}}, -- +4
        back={ name="Weard Mantle", augments={'VIT+5','Phalanx +5',}}, -- +5
    }
    

end

function maps()
    Enmity_Spells = S {"Banish", "Banish II", "Banishga", "Flash", "Geist Wall", "Bomb Toss", "Blank Gaze", "Sheep Song", "Jettatura"}
    Healing_Spells = S {"Cure", "Cure II", "Cure III", "Cure IV", "Pollen", "Magic Fruit", "Healing Breeze"}
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function precast(spell)

	if sets.precast[spell.name] then
        equip(sets.precast[spell.name])
    elseif sets[spell.name] then
        equip(sets[spell.name])
    elseif spell.skill == "Healing Magic" then
		equip(set_combine(sets.precast.FastCast, sets.precast.Healing))
	elseif spell.skill == "Enfeebling Magic" then
		equip(set_combine(sets.precast.FastCast, sets.precast.Enfeeble))
	elseif spell.name == "Stoneskin" then
		equip(set_combine(sets.precast.FastCast, sets.precast.SS))
	elseif spell.skill == "Enhancing Magic" then
		equip(set_combine(sets.precast.FastCast, sets.precast.Enhancing))
    elseif spell.name == "Aeolian Edge" then
        equip(sets.precast.Aeolian) 
    elseif spell.type == "WeaponSkill" then
        if spell.name == "Atonement" then
            equip(sets.Enmity)
        end
        equip(sets.precast.FastCast)
    
    elseif spell.name == "Holy Water" then
        equip(set_combine(sets.status.Idle.DT, sets.HolyWater))

    else
		equip(sets.precast.FastCast)
	end

end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST FUNCTION ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function midcast(spell)
    if Enmity_Spells:contains(spell.name) then
        equip(sets.Enmity)
    elseif Healing_Spells:contains(spell.name) then
        equip(sets.Healing)
    elseif spell.name == "Phalanx" then
        equip(sets.midcast.Phalanx)
    end

        

    if SIRDFlag and spell.type ~= "WeaponSkill" then -- Prioritize Spell Interruption Rate over everything else if the flag is set to True.
        if Healing_Spells:contains(spell.name) then
            equip(set_combine(sets.Healing, sets.SIRD))
        else
            equip(sets.SIRD)
        end
    end

end

function aftercast(spell)
--	print("Aftercast:",player.status)
	if player.status == 'Idle' then
        equip(sets.status.Idle.DT)
	elseif player.status == "Engaged" then
        equip(sets.status.Melee)
	end
end

function status_change(new,old)
	-- print("Status Change:",player.status)
	if new == "Idle" then
        equip(sets.status.Idle.DT)
	elseif new == "Engaged" then
        equip(sets.status.Melee)
	elseif new == "Resting" then
        equip(sets.midcast.Phalanx)
	end
end
