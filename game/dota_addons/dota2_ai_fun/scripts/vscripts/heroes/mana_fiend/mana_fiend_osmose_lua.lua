function mana_fiend_osmose_lua( keys )
	local target = keys.target
	local caster = keys.caster
	local ability = keys.ability

	if(target:GetMaxMana() > 0) then
		local manaDrained = ability:GetSpecialValueFor("mana_drained")	
		if target:GetMana() < manaDrained then
			manaDrained = target:GetMana()
		end	
		caster:GiveMana(manaDrained)
		target:ReduceMana(manaDrained)
		target:EmitSound("Hero_Antimage.ManaBreak")
	end
end