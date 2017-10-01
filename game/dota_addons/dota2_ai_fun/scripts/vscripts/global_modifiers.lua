modifier_global_hero_respawn_time = class({})

function modifier_global_hero_respawn_time:IsPurgable() return false end
function modifier_global_hero_respawn_time:IsHidden() return true end
function modifier_global_hero_respawn_time:RemoveOnDeath() return false end

function modifier_global_hero_respawn_time:DeclareFunctions()
	return {MODIFIER_EVENT_ON_TAKEDAMAGE}
end

function modifier_global_hero_respawn_time:OnTakeDamage(keys)
	if keys.unit:GetHealth() == 0 and keys.unit == self:GetParent() then
		local hScytheModifier = keys.unit:FindModifierByName('modifier_necrolyte_reapers_scythe')
		if hScytheModifier then
			keys.unit.fScytheTime = hScytheModifier:GetAbility():GetLevel()*GameMode.iRespawnTimePercentage/10
		end
		for i = 0, 5 do
			local hItem = keys.unit:GetItemInSlot(i)
			if hItem and hItem:GetAbilityName() == "item_bloodstone" then
				keys.unit.fBloodstoneRespawnTimeReduce = hItem:GetCurrentCharges()*3
				break
			end
		end
		if keys.unit:HasAbility('skeleton_king_reincarnation') and keys.unit:FindAbilityByName('skeleton_king_reincarnation'):IsFullyCastable() then
			keys.unit.fReincarnateTime = 3
			Timers:CreateTimer(3, function () keys.unit.fReincarnateTime = nil end)
		elseif keys.unit:HasItemInInventory('item_aegis') then
			keys.unit.fReincarnateTime = 5
			Timers:CreateTimer(5, function () keys.unit.fReincarnateTime = nil end)
		end
	end
end

modifier_imbalanced_economizer = class({})
function modifier_imbalanced_economizer:IsPurgable() return false end
function modifier_imbalanced_economizer:IsHidden() return true end
function modifier_imbalanced_economizer:RemoveOnDeath() return false end

modifier_bot_attack_tower_pick_rune = class({})
function modifier_bot_attack_tower_pick_rune:IsPurgable() return false end
function modifier_bot_attack_tower_pick_rune:IsHidden() return true end
function modifier_bot_attack_tower_pick_rune:RemoveOnDeath() return false end

function modifier_bot_attack_tower_pick_rune:OnCreated()
	if IsClient() then return end
	self:StartIntervalThink(0.04)
end

function modifier_bot_attack_tower_pick_rune:OnIntervalThink()
	if IsClient() then return end
	local hParent = self:GetParent()
	local tTowers = FindUnitsInRadius(hParent:GetTeam(), hParent:GetAbsOrigin(), nil, 800, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_BUILDING, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, FIND_CLOSEST, false)
	
	if hParent:GetHealth()/hParent:GetMaxHealth() > 0.2 and tTowers[1] and FindUnitsInRadius(tTowers[1]:GetTeam(), tTowers[1]:GetAbsOrigin(), nil, 750, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_CREEP, DOTA_UNIT_TARGET_FLAG_NOT_SUMMONED, FIND_CLOSEST, false)[1] and not FindUnitsInRadius(tTowers[1]:GetTeam(), tTowers[1]:GetAbsOrigin(), nil, 500, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO+DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_CLOSEST, false)[1] and not FindUnitsInRadius(hParent:GetTeam(), hParent:GetAbsOrigin(), nil, 800, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO+DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE, FIND_CLOSEST, false)[1] then
		if self.hTarget == tTowers[1] then return end
		self.bSentCommand = true
		self.hTarget = tTowers[1]
		local tOrder = 
			{
				UnitIndex = hParent:entindex(),
				OrderType = DOTA_UNIT_ORDER_ATTACK_TARGET,
				TargetIndex = self.hTarget:entindex()
			}
		hParent:SetForceAttackTarget(nil)
		ExecuteOrderFromTable(tOrder)
		hParent:SetForceAttackTarget(self.hTarget)
	elseif Entities:FindAllByClassnameWithin("dota_item_rune", hParent:GetOrigin(), 800)[1] then
		if self.bSentCommand then return end	
		local hRune = Entities:FindAllByClassnameWithin("dota_item_rune", hParent:GetOrigin(), 800)[1]
		self.bSentCommand = true
		local tOrder = 
		{
			UnitIndex = hParent:entindex(),
			OrderType = DOTA_UNIT_ORDER_PICKUP_RUNE,
			TargetIndex = hRune:entindex()
		}
		ExecuteOrderFromTable(tOrder)		
	elseif self.bSentCommand then
		hParent:SetForceAttackTarget(nil)
		self.bSentCommand = false
		self.hTarget = nil
	end
end


modifier_tower_power = class({})


function modifier_tower_power:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
		MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT
		
	}
end

function modifier_tower_power:IsPurgable() return false end
function modifier_tower_power:IsDebuff() return false end
function modifier_tower_power:GetTexture() return "tower_power" end

function modifier_tower_power:GetModifierAttackSpeedBonus_Constant() return 500/9*(self:GetStackCount()-1) end

function modifier_tower_power:GetModifierPhysicalArmorBonus()	
	local sName = self:GetParent():GetName()
	if string.match(sName, "1") then 
		return 14*(self:GetStackCount()-1)
	elseif string.match(sName, "[2-3]") then		
		return 16*(self:GetStackCount()-1)
	elseif string.match(sName, "4") then		
		return 24*(self:GetStackCount()-1)
	elseif string.match(sName, "healer") then		
		return 20*(self:GetStackCount()-1)
	elseif string.match(sName, "fort") then		
		return 15*(self:GetStackCount()-1)
	elseif string.match(sName, "range") then		
		return 10*(self:GetStackCount()-1)
	elseif string.match(sName, "melee") then		
		return 15*(self:GetStackCount()-1)
	end
end

function modifier_tower_power:GetModifierBaseDamageOutgoing_Percentage()
	return 100*(self:GetStackCount()-1)
end

function modifier_tower_power:GetModifierHealthRegenPercentage()
	return 1*(self:GetStackCount()-1)
end