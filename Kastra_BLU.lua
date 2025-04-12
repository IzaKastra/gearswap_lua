include('organizer-lib')

function get_sets()

	maps()

	MagicBurstFlag     = 0
	MagicAccuracyFlag  = 0
	TreasureHunterFlag = 0
	MeleeFlag          = 1

	send_command('bind f11 gs c equip Crimson')
	send_command('bind f12 gs c Equip DT')
	send_command('bind ^f12 gs c Equip Refresh')
	send_command('bind ^f10 gs c toggle Treasure Hunter')
	function file_unload()
		send_command('unbind ^f10')
		send_command('unbind f11')
		send_command('unbind f12')
		send_command('unbind ^f12')
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
		equip(gear.CrimsonToggle)
		send_command('@input /echo Carmine Cuisses +1 Equipped.')
	end

end



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- OSEEM-AUGMENTED/SPECIAL GEAR ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	gear = {}

	gear.AF = {}
	gear.AF.head                       = {}
	gear.AF.body                       = {}
	gear.AF.hands                      = {}
	gear.AF.legs                       = {}
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
	gear.AmbuCape.Nuke                 = { name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}

	gear.Crimson                       = { name="Carmine Cuisses +1"}
	gear.CrimsonToggle                 = { legs="Carmine Cuisses +1"}

	gear.Empy = {}
	gear.Empy.head                     = {}
	gear.Empy.body                     = {}
	gear.Empy.hands                    = {}
	gear.Empy.legs                     = {}
	gear.Empy.feet                     = {}

	gear.Moonshade                     = { name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}}

	gear.Relic = {}
	gear.Relic.head                    = {}
	gear.Relic.body                    = {}
	gear.Relic.hands                   = {}
	gear.Relic.legs                    = {}
	gear.Relic.feet                    = {}

	gear.Obi                           = {waist="Hachirin-no-Obi"}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- STATUS SETS --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	sets.status = {}
	sets.status.Idle = {}
	sets.status.Idle.Refresh = {
		head="Rawhide Mask",
		head="Malignance Chapeau",
		body=gear.Amalric.body.Nuke,
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
        back="Shadow Mantle",
	}
	sets.status.Idle.DT = {
        ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
        hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
        back="Shadow Mantle",
	}
	sets.status.Melee = {
        ammo="Aurgelmir Orb",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
        hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet="Malignance Boots",
        neck="Combatant's Torque",
        waist="Reiki Yotai",
        left_ear="Telos Earring",
        right_ear="Suppanomimi",
        left_ring="Epona's Ring",
        right_ring="Ilabrat Ring",
        back="Shadow Mantle",
	}


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- PRECAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	sets.precast = {}
	sets.precast.FastCast = {
	-- 54% Fast Cast, 8% Quick Cast
		ammo="Impatiens",
		head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+6','"Fast Cast"+4',}},
		body={ name="Samnuha Coat", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+5','"Dual Wield"+5',}},
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		neck="Orunmila's Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Weather. Ring",
		right_ring="Kishar Ring",
	}
	sets.precast["Azure Lore"] = {	body = gear.Relic.body,}
	sets.precast["Chant du Cygne"] = {
		ammo="Yetshila",
        head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body="Abnoba Kaftan",
        hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
        feet="Thereoid Greaves",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Mache Earring +1",
        right_ear="Mache Earring +1",
        left_ring="Epona's Ring",
        right_ring="Begrudging Ring",
        back="Shadow Mantle",
	}
	sets.precast.Requiescat = {
		ammo="Ginsen",
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
        ammo="Aurgelmir Orb",
        head={ name="Nyame Helm", augments={'Path: B',}},
        body={ name="Nyame Mail", augments={'Path: B',}},
        hands={ name="Nyame Gauntlets", augments={'Path: B',}},
        legs={ name="Nyame Flanchard", augments={'Path: B',}},
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck="Rep. Plat. Medal",
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear="Regal Earring",
        right_ear={ name="Hashi. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Dbl.Atk."+3',}},
        left_ring="Sroda Ring",
        right_ring="Ilabrat Ring",
        back="Shadow Mantle",
    }
	sets.precast["Sanguine Blade"] = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		body = gear.Amalric.body.Nuke,
		hands = gear.Amalric.hands.Nuke,
		legs = gear.Amalric.legs.Nuke,
		feet = gear.Amalric.feet.Nuke,
		neck="Baetyl Pendant",
		waist="Sacro Cord",
		left_ear="Regal Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring +1",
		right_ring="Archon Ring",
		back = gear.AmbuCape.Nuke,
	}


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----- MIDCAST SETS -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	sets.midcast = {}
	sets.midcast.AoE = {
		ammo="Pemphredo Tathlum",
		head="Nyame Helm",
		body = gear.Amalric.body.Nuke,
		hands = gear.Amalric.hands.Nuke,
		legs = gear.Amalric.legs.Nuke,
		feet = gear.Amalric.feet.Nuke,
		neck="Baetyl Pendant",
		waist="Orpheus's Sash",
		left_ear="Regal Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back = gear.AmbuCape.Nuke,
	}
	sets.midcast.DarkAffinity = {
		left_ring="Archon Ring",
		head="Pixie Hairpin +1",
	}
	sets.midcast.LightAffinity = {
		left_ring="Weatherspoon Ring",
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


	if spell.skill == "Blue Magic" or spell.skill=="Elemental Magic" then
		equip(sets.midcast.AoE)
		if world.weather_element == spell.element or world.day_element == spell.element then
			equip(gear.Obi)
		end
		if spell.name == "Tenebral Crush" then
			equip(sets.midcast.DarkAffinity)
		end
		if spell.name == "Blinding Fulgor" then
			equip(sets.midcast.LightAffinity)
		end
	end
end

function aftercast(spell)
--	print("Aftercast:",player.status)
	if player.status == 'Idle' then
        equip(sets.status.Idle.DT)
        if player.mpp < 70 then
           equip(sets.status.Idle.Refresh)
        end
    elseif player.status == "Engaged" then
        equip(sets.status.Melee)
	end
end

function status_change(new,old)
--	print("Status Change:",player.status)
	if new == "Idle" then
        equip(sets.status.Idle.DT)
	elseif new == "Engaged" then
        equip(sets.status.Melee)
	end
end
