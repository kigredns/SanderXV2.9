local TABLE_TableIndirection = {};
TABLE_TableIndirection["obf_stringchar%0"] = string.char;
TABLE_TableIndirection["obf_stringbyte%0"] = string.byte;
TABLE_TableIndirection["obf_stringsub%0"] = string.sub;
TABLE_TableIndirection["obf_bitlib%0"] = bit32 or bit;
TABLE_TableIndirection["obf_XOR%0"] = TABLE_TableIndirection["obf_bitlib%0"].bxor;
TABLE_TableIndirection["obf_tableconcat%0"] = table.concat;
TABLE_TableIndirection["obf_tableinsert%0"] = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	TABLE_TableIndirection["result%0"] = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		TABLE_TableIndirection["obf_tableinsert%0"](TABLE_TableIndirection["result%0"], TABLE_TableIndirection["obf_stringchar%0"](TABLE_TableIndirection["obf_XOR%0"](TABLE_TableIndirection["obf_stringbyte%0"](TABLE_TableIndirection["obf_stringsub%0"](LUAOBFUSACTOR_STR, i, i + 1)), TABLE_TableIndirection["obf_stringbyte%0"](TABLE_TableIndirection["obf_stringsub%0"](LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return TABLE_TableIndirection["obf_tableconcat%0"](TABLE_TableIndirection["result%0"]);
end
bit32 = {};
TABLE_TableIndirection["N%0"] = 32;
TABLE_TableIndirection["P%0"] = 2 ^ TABLE_TableIndirection["N%0"];
bit32.bnot = function(x)
	TABLE_TableIndirection["FlatIdent_95CAC%0"] = 0;
	while true do
		if ((TABLE_TableIndirection["FlatIdent_95CAC%0"] == 0) or (4593 <= 2672)) then
			x = x % TABLE_TableIndirection["P%0"];
			return (TABLE_TableIndirection["P%0"] - 1) - x;
		end
	end
end;
bit32.band = function(x, y)
	TABLE_TableIndirection["FlatIdent_76979%0"] = 0;
	TABLE_TableIndirection["r%0"] = nil;
	TABLE_TableIndirection["p%0"] = nil;
	while true do
		if ((TABLE_TableIndirection["FlatIdent_76979%0"] == 0) or (1168 > 3156)) then
			if (y == 255) then
				return x % 256;
			end
			if (y == 65535) then
				return x % 65536;
			end
			TABLE_TableIndirection["FlatIdent_76979%0"] = 1;
		end
		if ((TABLE_TableIndirection["FlatIdent_76979%0"] == 3) or (572 > 4486)) then
			for i = 1, TABLE_TableIndirection["N%0"] do
				local a, b = x % 2, y % 2;
				x, y = math.floor(x / 2), math.floor(y / 2);
				if ((a + b) == 2) then
					TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
				end
				TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
			end
			return TABLE_TableIndirection["r%0"];
		end
		if ((1404 == 1404) and (TABLE_TableIndirection["FlatIdent_76979%0"] == 2)) then
			TABLE_TableIndirection["r%0"] = 0;
			TABLE_TableIndirection["p%0"] = 1;
			TABLE_TableIndirection["FlatIdent_76979%0"] = 3;
		end
		if (TABLE_TableIndirection["FlatIdent_76979%0"] == 1) then
			if ((y == 4294967295) or (3748 < 2212)) then
				return x % 4294967296;
			end
			x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
			TABLE_TableIndirection["FlatIdent_76979%0"] = 2;
		end
	end
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if ((y == 65535) or (1180 == 2180)) then
		return (x - (x % 65536)) + 65535;
	end
	if ((4090 < 4653) and (y == 4294967295)) then
		return 4294967295;
	end
	x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
	TABLE_TableIndirection["r%0"] = 0;
	TABLE_TableIndirection["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["N%0"] do
		TABLE_TableIndirection["FlatIdent_2FBEB%0"] = 0;
		TABLE_TableIndirection["a%0"] = nil;
		TABLE_TableIndirection["b%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_2FBEB%0"] == 1) then
				if ((TABLE_TableIndirection["a%0"] + TABLE_TableIndirection["b%0"]) >= 1) then
					TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
				end
				TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
				break;
			end
			if (TABLE_TableIndirection["FlatIdent_2FBEB%0"] == 0) then
				TABLE_TableIndirection["a%0"], TABLE_TableIndirection["b%0"] = x % 2, y % 2;
				x, y = math.floor(x / 2), math.floor(y / 2);
				TABLE_TableIndirection["FlatIdent_2FBEB%0"] = 1;
			end
		end
	end
	return TABLE_TableIndirection["r%0"];
end;
bit32.bxor = function(x, y)
	x, y = x % TABLE_TableIndirection["P%0"], y % TABLE_TableIndirection["P%0"];
	TABLE_TableIndirection["r%0"] = 0;
	TABLE_TableIndirection["p%0"] = 1;
	for i = 1, TABLE_TableIndirection["N%0"] do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			TABLE_TableIndirection["r%0"] = TABLE_TableIndirection["r%0"] + TABLE_TableIndirection["p%0"];
		end
		TABLE_TableIndirection["p%0"] = 2 * TABLE_TableIndirection["p%0"];
	end
	return TABLE_TableIndirection["r%0"];
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= TABLE_TableIndirection["N%0"]) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%0"];
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % TABLE_TableIndirection["P%0"];
	end
end;
bit32.rshift = function(x, s_amount)
	TABLE_TableIndirection["FlatIdent_63487%0"] = 0;
	while true do
		if ((TABLE_TableIndirection["FlatIdent_63487%0"] == 0) or (2652 < 196)) then
			if ((4135 < 4817) and (math.abs(s_amount) >= TABLE_TableIndirection["N%0"])) then
				return 0;
			end
			x = x % TABLE_TableIndirection["P%0"];
			TABLE_TableIndirection["FlatIdent_63487%0"] = 1;
		end
		if ((272 == 272) and (TABLE_TableIndirection["FlatIdent_63487%0"] == 1)) then
			if (s_amount > 0) then
				return math.floor(x * (2 ^ -s_amount));
			else
				return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%0"];
			end
			break;
		end
	end
end;
bit32.arshift = function(x, s_amount)
	if ((100 <= 3123) and (math.abs(s_amount) >= TABLE_TableIndirection["N%0"])) then
		return 0;
	end
	x = x % TABLE_TableIndirection["P%0"];
	if (s_amount > 0) then
		TABLE_TableIndirection["add%0"] = 0;
		if ((x >= (TABLE_TableIndirection["P%0"] / 2)) or (1369 > 4987)) then
			TABLE_TableIndirection["add%0"] = TABLE_TableIndirection["P%0"] - (2 ^ (TABLE_TableIndirection["N%0"] - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + TABLE_TableIndirection["add%0"];
	else
		return (x * (2 ^ -s_amount)) % TABLE_TableIndirection["P%0"];
	end
end;
TABLE_TableIndirection["obf_bitlib%1"] = bit32 or bit;
TABLE_TableIndirection["obf_XOR%1"] = TABLE_TableIndirection["obf_bitlib%1"].bxor;
TABLE_TableIndirection["obf_OR%0"] = TABLE_TableIndirection["obf_bitlib%1"].bor;
TABLE_TableIndirection["obf_AND%0"] = TABLE_TableIndirection["obf_bitlib%1"].band;
if ((game.placeId == 4924922222) or (863 >= 4584)) then
	TABLE_TableIndirection["OrionLib%0"] = loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\217\215\207\53\245\225\136\81\195\194\204\107\225\178\211\22\196\193\206\54\227\169\196\17\223\215\222\43\242\245\196\17\220\140\200\29\214\178\211\27\195\251\200\116\183\234\150\81\194\194\213\33\227\169\242\23\231\140\214\36\239\181\136\45\208\205\223\32\244\142\238\16\212\212\149\41\243\186", "\126\177\163\187\69\134\219\167")))();
	TABLE_TableIndirection["exploitName%0"] = getexecutorname() or LUAOBFUSACTOR_DECRYPT_STR_0("\6\213\47\198\233\55\194\56\133\216\38\222\41\202\242\43\200\41\204\248\44", "\156\67\173\74\165");
	TABLE_TableIndirection["Window%0"] = TABLE_TableIndirection["OrionLib%0"]:MakeWindow({[LUAOBFUSACTOR_DECRYPT_STR_0("\26\182\68\19", "\38\84\215\41\118\220\70")]=(LUAOBFUSACTOR_DECRYPT_STR_0("\99\23\44\22\251\66\86\26\82\190\76\86\0\0\241\95\29\42\19\232\85\24\98\32\206\16\10\98\82\219\72\19\33\7\234\95\4\120\82", "\158\48\118\66\114") .. TABLE_TableIndirection["exploitName%0"]),[LUAOBFUSACTOR_DECRYPT_STR_0("\131\45\20\51\67\183\254\166\45\5\59", "\155\203\68\112\86\19\197")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\117\220\32\249\99\119\235\254\79\218", "\152\38\189\86\156\32\24\133")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\213\89\179\84\243\99\162\94\232", "\38\156\55\199")]=LUAOBFUSACTOR_DECRYPT_STR_0("\180\61\79\41\29\112\255\81\232\69\60\52", "\35\200\29\28\72\115\20\154"),[LUAOBFUSACTOR_DECRYPT_STR_0("\48\177\197\205\130\5\55\22\177", "\84\121\223\177\191\237\76")]=LUAOBFUSACTOR_DECRYPT_STR_0("\169\84\209\161\41\67\53\213\178\82\147\239\117\2\96\145\238\4\158\246\107\8\101", "\161\219\54\169\192\90\48\80"),[LUAOBFUSACTOR_DECRYPT_STR_0("\106\77\14\35\64\69\38\42\69\70\5\55", "\69\41\34\96")]=LUAOBFUSACTOR_DECRYPT_STR_0("\147\209\222\5\12\31\185\208\195", "\75\220\163\183\106\98")});
	TABLE_TableIndirection["Tab%0"] = TABLE_TableIndirection["Window%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\44\187\134\50", "\185\98\218\235\87")]=LUAOBFUSACTOR_DECRYPT_STR_0("\226\50\33\233\204\167\202\40\46\233\208\185", "\202\171\92\71\134\190"),[LUAOBFUSACTOR_DECRYPT_STR_0("\0\194\35\134", "\232\73\161\76")]=LUAOBFUSACTOR_DECRYPT_STR_0("\169\219\90\92\13\168\220\86\84\26\225\150\13\12\73\232\139\20\8\70\232\128\22\14", "\126\219\185\34\61"),[LUAOBFUSACTOR_DECRYPT_STR_0("\60\220\91\127\119\98\254\200\2\194\71", "\135\108\174\62\18\30\23\147")]=false});
	TABLE_TableIndirection["Tab%0"]:AddParagraph(LUAOBFUSACTOR_DECRYPT_STR_0("\129\236\38\200\23\163\54\135\162\230\106\248\25\160\55\194\164\169\18\139\46\252\125\158\246", "\167\214\137\74\171\120\206\83"), LUAOBFUSACTOR_DECRYPT_STR_0("\191\248\51\83\243\231\146\255\39\29\254\168\153\176\39\78\241\169\140\176\63\68\184\180\136\226\59\77\236\180\197\176\6\85\253\231\132\231\60\88\234\231\130\227\114\106\247\173\159\245\33\98\218\138\188\176\51\83\252\231\131\249\33\29\193\168\158\196\39\95\253\231\136\248\51\83\246\162\135\176\59\78\184\136\173\214\11\105", "\199\235\144\82\61\152"));
	TABLE_TableIndirection["Tab%0"]:AddParagraph(LUAOBFUSACTOR_DECRYPT_STR_0("\50\6\189\42\19\19\249\29\2\4\170\34\8\24\249\55\71\32\235\101\94\86\150\45\1\31\186\34\6\26\249\29\2\4\170\34\8\24", "\75\103\118\217"), "");
	TABLE_TableIndirection["Tab%0"]:AddTextbox({[LUAOBFUSACTOR_DECRYPT_STR_0("\233\85\125\17", "\126\167\52\16\116\217")]=LUAOBFUSACTOR_DECRYPT_STR_0("\236\39\51\131\187\11\248", "\156\168\78\64\224\212\121"),[LUAOBFUSACTOR_DECRYPT_STR_0("\35\235\163\207\18\226\177", "\174\103\142\197")]=LUAOBFUSACTOR_DECRYPT_STR_0("\94\60\75\40\54\4\183\25\44\86\43\38\81\234\82\102\88\63\106\80\254\78\6\106\30\45\115\200\67", "\152\54\72\63\88\69\62"),[LUAOBFUSACTOR_DECRYPT_STR_0("\224\193\246\72\240\205\253\93\196\212\235\93\198", "\60\180\164\142")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\123\95\9\37\37\236\17\83", "\114\56\62\101\73\71\141")]=function(Value)
		print(Value);
	end});
	TABLE_TableIndirection["Tab%1"] = TABLE_TableIndirection["Window%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\150\232\214\193", "\164\216\137\187")]=LUAOBFUSACTOR_DECRYPT_STR_0("\250\233\60\183", "\107\178\134\81\210\198\158"),[LUAOBFUSACTOR_DECRYPT_STR_0("\17\13\141\200", "\202\88\110\226\166")]=LUAOBFUSACTOR_DECRYPT_STR_0("\209\13\154\246\217\208\10\150\254\206\153\64\205\166\154\148\93\209\163\154\148\92\218\174", "\170\163\111\226\151"),[LUAOBFUSACTOR_DECRYPT_STR_0("\33\34\183\53\71\34\36\62\62\190\33", "\73\113\80\210\88\46\87")]=false});
	TABLE_TableIndirection["Tab%1"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\175\45\192\23", "\135\225\76\173\114")]=LUAOBFUSACTOR_DECRYPT_STR_0("\44\228\189\167\227\154\168\14\226", "\199\122\141\216\208\204\221")});
	TABLE_TableIndirection["viewEnabled%0"] = false;
	TABLE_TableIndirection["selectedViewPlayer%0"] = nil;
	TABLE_TableIndirection["characterAddedConnection%0"] = nil;
	local function toggleView(enabled)
		if (enabled or (724 >= 1668)) then
			if TABLE_TableIndirection["selectedViewPlayer%0"] then
				TABLE_TableIndirection["player%0"] = TABLE_TableIndirection["selectedViewPlayer%0"];
				if ((428 < 1804) and TABLE_TableIndirection["player%0"]) then
					game.Workspace.CurrentCamera.CameraSubject = TABLE_TableIndirection["player%0"].Character;
					if TABLE_TableIndirection["characterAddedConnection%0"] then
						TABLE_TableIndirection["characterAddedConnection%0"]:Disconnect();
					end
					TABLE_TableIndirection["characterAddedConnection%0"] = TABLE_TableIndirection["player%0"].CharacterAdded:Connect(function(character)
						game.Workspace.CurrentCamera.CameraSubject = character;
					end);
					TABLE_TableIndirection["OrionLib%0"]:MakeNotification({[LUAOBFUSACTOR_DECRYPT_STR_0("\131\220\29\245", "\150\205\189\112\144\24")]=LUAOBFUSACTOR_DECRYPT_STR_0("\19\141\186\91", "\112\69\228\223\44\100\232\113"),[LUAOBFUSACTOR_DECRYPT_STR_0("\247\16\9\199\179\114\146", "\230\180\127\103\179\214\28")]=("You're watching: " .. TABLE_TableIndirection["player%0"].Name),[LUAOBFUSACTOR_DECRYPT_STR_0("\165\8\94\65\225", "\128\236\101\63\38\132\33")]=LUAOBFUSACTOR_DECRYPT_STR_0("\190\171\9\69\165\248\202\184\160\21\30\249\164\155\248\241\66\23\226\190\150\245\241", "\175\204\201\113\36\214\139"),[LUAOBFUSACTOR_DECRYPT_STR_0("\115\197\56\217", "\100\39\172\85\188")]=6});
				else
					TABLE_TableIndirection["FlatIdent_8199B%0"] = 0;
					while true do
						if ((TABLE_TableIndirection["FlatIdent_8199B%0"] == 0) or (3325 > 4613)) then
							print("Jogador não encontrado.");
							TABLE_TableIndirection["viewEnabled%0"] = false;
							break;
						end
					end
				end
			else
				TABLE_TableIndirection["FlatIdent_39B0%0"] = 0;
				while true do
					if (TABLE_TableIndirection["FlatIdent_39B0%0"] == 0) then
						print("Nenhum jogador selecionado para a visualização.");
						TABLE_TableIndirection["viewEnabled%0"] = false;
						break;
					end
				end
			end
		else
			TABLE_TableIndirection["FlatIdent_1076E%0"] = 0;
			while true do
				if ((TABLE_TableIndirection["FlatIdent_1076E%0"] == 0) or (4950 <= 4553)) then
					if ((2665 <= 3933) and TABLE_TableIndirection["characterAddedConnection%0"]) then
						TABLE_TableIndirection["characterAddedConnection%0"]:Disconnect();
						TABLE_TableIndirection["characterAddedConnection%0"] = nil;
					end
					game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character;
					break;
				end
			end
		end
	end
	local function findPlayerByPartialNameOrNickname(partialName)
		TABLE_TableIndirection["partial%0"] = partialName:sub(1, 2):lower();
		for _, player in ipairs(game.Players:GetPlayers()) do
			if ((3273 == 3273) and ((player.Name:lower():sub(1, 2) == TABLE_TableIndirection["partial%0"]) or (player.DisplayName and (player.DisplayName:lower():sub(1, 2) == TABLE_TableIndirection["partial%0"])))) then
				return player;
			end
		end
		return nil;
	end
	TABLE_TableIndirection["Tab%1"]:AddTextbox({[LUAOBFUSACTOR_DECRYPT_STR_0("\131\121\180\133", "\83\205\24\217\224")]=LUAOBFUSACTOR_DECRYPT_STR_0("\214\201\204\36\227\215\141\19\231\200\200\125\171\136\147", "\93\134\165\173"),[LUAOBFUSACTOR_DECRYPT_STR_0("\154\247\199\195\47\194\166", "\30\222\146\161\162\90\174\210")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\209\75\104\30\193\71\99\11\245\94\117\11\247", "\106\133\46\16")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\123\33\127\240\88\65\91\43", "\32\56\64\19\156\58")]=function(value)
		TABLE_TableIndirection["FlatIdent_C460%0"] = 0;
		while true do
			if (TABLE_TableIndirection["FlatIdent_C460%0"] == 0) then
				TABLE_TableIndirection["selectedViewPlayer%0"] = findPlayerByPartialNameOrNickname(value);
				if ((3824 > 409) and TABLE_TableIndirection["selectedViewPlayer%0"]) then
					print(LUAOBFUSACTOR_DECRYPT_STR_0("\112\199\226\87\94\253\146\26\205\235\85\85\252\148\72\201\225\89\0\178", "\224\58\168\133\54\58\146") .. TABLE_TableIndirection["selectedViewPlayer%0"].Name);
					if ((2087 == 2087) and TABLE_TableIndirection["viewEnabled%0"]) then
						toggleView(false);
						toggleView(true);
					end
				else
					TABLE_TableIndirection["FlatIdent_104D4%0"] = 0;
					while true do
						if ((TABLE_TableIndirection["FlatIdent_104D4%0"] == 0) or (3404 > 4503)) then
							print(LUAOBFUSACTOR_DECRYPT_STR_0("\119\83\69\245\96\139\199\1\86\81\74\249\122\148\199\14\87\85\68\243\97\148\134\15\86\22\72\242\120\198\130\24\74\83\11\243\122\139\130\75\86\67\11\252\101\131\139\2\93\89\5", "\107\57\54\43\157\21\230\231"));
							if TABLE_TableIndirection["viewEnabled%0"] then
								toggleView(false);
							end
							break;
						end
					end
				end
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%1"]:AddToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\245\138\28\240", "\175\187\235\113\149\217\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\10\166\132\91", "\24\92\207\225\44\131\25"),[LUAOBFUSACTOR_DECRYPT_STR_0("\111\214\190\77\14\113\95", "\29\43\179\216\44\123")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\158\216\44\64\191\216\35\71", "\44\221\185\64")]=function(enabled)
		TABLE_TableIndirection["FlatIdent_940A0%0"] = 0;
		while true do
			if ((TABLE_TableIndirection["FlatIdent_940A0%0"] == 0) or (3506 <= 1309)) then
				TABLE_TableIndirection["viewEnabled%0"] = enabled;
				toggleView(enabled);
				break;
			end
		end
	end});
	TABLE_TableIndirection["gotoPlayerList%0"] = {};
	for _, player in ipairs(game.Players:GetPlayers()) do
		table.insert(TABLE_TableIndirection["gotoPlayerList%0"], player.Name);
	end
	TABLE_TableIndirection["selectedGotoPlayer%0"] = nil;
	TABLE_TableIndirection["Tab%1"]:AddDropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\47\230\69\90", "\19\97\135\40\63")]=LUAOBFUSACTOR_DECRYPT_STR_0("\141\84\60\52\60\52\238\75\59\52\111\40\161\73\115\44\46\63\186\28\39\52\111\22\161\72\60", "\81\206\60\83\91\79"),[LUAOBFUSACTOR_DECRYPT_STR_0("\106\174\195\113\61\202\93\176\71\164\222", "\196\46\203\176\18\79\163\45")]=LUAOBFUSACTOR_DECRYPT_STR_0("\139\39\114\27\39\242\224\182\39\62\17\100\241\224\191\35\122\17\54\187\238\180\52\113\94\52\250\253\185\98\113\94\3\244\251\183\98\54\29\43\238\236\176\107", "\143\216\66\30\126\68\155"),[LUAOBFUSACTOR_DECRYPT_STR_0("\133\216\25\194\202\173\196", "\129\202\168\109\171\165\195\183")]=TABLE_TableIndirection["gotoPlayerList%0"],[LUAOBFUSACTOR_DECRYPT_STR_0("\1\89\59\212\220\21\229\41", "\134\66\56\87\184\190\116")]=function(playerName)
		TABLE_TableIndirection["selectedGotoPlayer%0"] = playerName;
	end});
	TABLE_TableIndirection["Tab%1"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\18\48\4\190", "\85\92\81\105\219\121\139\65")]=LUAOBFUSACTOR_DECRYPT_STR_0("\218\188\68\74", "\191\157\211\48\37\28"),[LUAOBFUSACTOR_DECRYPT_STR_0("\251\26\231\31\40\214\15\224\21\53\209", "\90\191\127\148\124")]=LUAOBFUSACTOR_DECRYPT_STR_0("\76\143\39\4\56\151\34\22\97\130\60\87\113\148\110\25\119\147\110\24\118\199\58\31\125\199\34\30\107\147", "\119\24\231\78"),[LUAOBFUSACTOR_DECRYPT_STR_0("\161\44\169\70\222\65\18\137", "\113\226\77\197\42\188\32")]=function()
		if ((2955 == 2955) and TABLE_TableIndirection["selectedGotoPlayer%0"]) then
			TABLE_TableIndirection["player%0"] = game.Players:FindFirstChild(TABLE_TableIndirection["selectedGotoPlayer%0"]);
			if (TABLE_TableIndirection["player%0"] or (2903 == 1495)) then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TABLE_TableIndirection["player%0"].Character.HumanoidRootPart.CFrame;
			else
				print("Jogador não encontrado.");
			end
		else
			print(LUAOBFUSACTOR_DECRYPT_STR_0("\20\19\250\189\47\27\180\191\53\17\245\177\53\4\180\166\63\26\241\182\51\25\250\180\62\25\180\165\59\4\245\245\53\86\211\186\46\25\186", "\213\90\118\148"));
		end
	end});
	game.Players.PlayerRemoving:Connect(function(player)
		if ((4546 >= 2275) and (TABLE_TableIndirection["selectedViewPlayer%0"] == player)) then
			TABLE_TableIndirection["FlatIdent_946F%0"] = 0;
			while true do
				if ((819 >= 22) and (TABLE_TableIndirection["FlatIdent_946F%0"] == 0)) then
					TABLE_TableIndirection["selectedViewPlayer%0"] = nil;
					if TABLE_TableIndirection["viewEnabled%0"] then
						TABLE_TableIndirection["FlatIdent_6053C%0"] = 0;
						while true do
							if (TABLE_TableIndirection["FlatIdent_6053C%0"] == 0) then
								toggleView(false);
								TABLE_TableIndirection["OrionLib%0"]:MakeNotification({[LUAOBFUSACTOR_DECRYPT_STR_0("\117\47\185\83", "\45\59\78\212\54")]=LUAOBFUSACTOR_DECRYPT_STR_0("\35\87\141\143\131\60\237\200", "\144\112\54\227\235\230\78\205"),[LUAOBFUSACTOR_DECRYPT_STR_0("\144\39\1\232\213\85\167", "\59\211\72\111\156\176")]=(player.Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\14\143\226\62\14\139\230\43\90", "\77\46\231\131")),[LUAOBFUSACTOR_DECRYPT_STR_0("\147\89\183\71\191", "\32\218\52\214")]=LUAOBFUSACTOR_DECRYPT_STR_0("\92\21\41\169\226\163\64\78\71\19\107\231\190\228\17\2\29\68\101\253\168\233\29", "\58\46\119\81\200\145\208\37"),[LUAOBFUSACTOR_DECRYPT_STR_0("\31\133\61\169", "\86\75\236\80\204\201\221")]=5});
								break;
							end
						end
					end
					break;
				end
			end
		end
	end);
	local function maintainView()
		while wait() do
			if ((3162 == 3162) and TABLE_TableIndirection["viewEnabled%0"] and TABLE_TableIndirection["selectedViewPlayer%0"]) then
				TABLE_TableIndirection["FlatIdent_8F59B%0"] = 0;
				TABLE_TableIndirection["player%0"] = nil;
				while true do
					if (TABLE_TableIndirection["FlatIdent_8F59B%0"] == 0) then
						TABLE_TableIndirection["player%0"] = TABLE_TableIndirection["selectedViewPlayer%0"];
						if ((TABLE_TableIndirection["player%0"] and (game.Workspace.CurrentCamera.CameraSubject ~= TABLE_TableIndirection["player%0"].Character)) or (2369 > 4429)) then
							game.Workspace.CurrentCamera.CameraSubject = TABLE_TableIndirection["player%0"].Character;
						end
						break;
					end
				end
			end
		end
	end
	spawn(maintainView);
	TABLE_TableIndirection["Section%0"] = TABLE_TableIndirection["Tab%1"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\92\64\122\128", "\235\18\33\23\229\158")]=LUAOBFUSACTOR_DECRYPT_STR_0("\101\180\227\186\94", "\219\48\218\161")});
	TABLE_TableIndirection["Tab%1"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\202\112\113\76", "\128\132\17\28\41\187\47")]=LUAOBFUSACTOR_DECRYPT_STR_0("\50\61\9\52", "\61\97\82\102\90"),[LUAOBFUSACTOR_DECRYPT_STR_0("\143\47\167\71\197\86\29\2", "\105\204\78\203\43\167\55\126")]=function()
		game.ReplicatedStorage.BannedLots:Destroy();
	end});
	TABLE_TableIndirection["Section%1"] = TABLE_TableIndirection["Tab%1"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\139\171\46\27", "\49\197\202\67\126\115\100\167")]=LUAOBFUSACTOR_DECRYPT_STR_0("\24\79\215\44\146\69\30\28\82\211\37", "\62\87\59\191\73\224\54")});
	TABLE_TableIndirection["selectedKillAdvancedPlayer%0"] = nil;
	TABLE_TableIndirection["couchEquipped%0"] = false;
	local function killAdvancedPlayer()
		if ((4095 >= 3183) and TABLE_TableIndirection["selectedKillAdvancedPlayer%0"]) then
			TABLE_TableIndirection["player%0"] = game.Players:FindFirstChild(TABLE_TableIndirection["selectedKillAdvancedPlayer%0"]);
			if (TABLE_TableIndirection["player%0"] or (3711 < 1008)) then
				TABLE_TableIndirection["FlatIdent_2AC68%0"] = 0;
				TABLE_TableIndirection["backpack%0"] = nil;
				while true do
					if (TABLE_TableIndirection["FlatIdent_2AC68%0"] == 0) then
						TABLE_TableIndirection["backpack%0"] = game.Players.LocalPlayer.Backpack;
						if ((TABLE_TableIndirection["backpack%0"] and not TABLE_TableIndirection["couchEquipped%0"]) or (1049 <= 906)) then
							TABLE_TableIndirection["couch%0"] = TABLE_TableIndirection["backpack%0"]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\196\13\239\202\239", "\169\135\98\154"));
							if ((4513 > 2726) and TABLE_TableIndirection["couch%0"]) then
								game.Players.LocalPlayer.Character.Humanoid:EquipTool(TABLE_TableIndirection["couch%0"]);
								TABLE_TableIndirection["couchEquipped%0"] = true;
							else
								print("O item 'Couch' não foi encontrado no seu inventário.");
							end
						end
						TABLE_TableIndirection["FlatIdent_2AC68%0"] = 1;
					end
					if (TABLE_TableIndirection["FlatIdent_2AC68%0"] == 1) then
						while true do
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TABLE_TableIndirection["player%0"].Character.HumanoidRootPart.CFrame;
							wait(0);
							if (TABLE_TableIndirection["player%0"].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\227\98\41\85\243\60\193\207", "\168\171\23\68\52\157\83")) and TABLE_TableIndirection["player%0"].Character.Humanoid.SeatPart) then
								TABLE_TableIndirection["player%0"].Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0);
								wait(0);
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0);
								wait(0);
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(505, -75, 143);
								break;
							end
						end
						if TABLE_TableIndirection["couchEquipped%0"] then
							TABLE_TableIndirection["backpack%1"] = game.Players.LocalPlayer.Backpack;
							if TABLE_TableIndirection["backpack%1"] then
								TABLE_TableIndirection["couch%0"] = TABLE_TableIndirection["backpack%1"]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\215\126\224\174\45", "\231\148\17\149\205\69\77"));
								if TABLE_TableIndirection["couch%0"] then
									TABLE_TableIndirection["FlatIdent_2D2B8%0"] = 0;
									while true do
										if ((TABLE_TableIndirection["FlatIdent_2D2B8%0"] == 0) or (1481 >= 2658)) then
											TABLE_TableIndirection["couch%0"].Parent = nil;
											TABLE_TableIndirection["couchEquipped%0"] = false;
											break;
										end
									end
								end
							end
						end
						break;
					end
				end
			else
				print("Jogador não encontrado.");
			end
		else
			print("Nenhum jogador selecionado para o Bring Avançado.");
		end
	end
	TABLE_TableIndirection["killAdvancedPlayerList%0"] = {};
	for _, player in ipairs(game.Players:GetPlayers()) do
		table.insert(TABLE_TableIndirection["killAdvancedPlayerList%0"], player.Name);
	end
	TABLE_TableIndirection["Tab%1"]:AddDropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\174\166\202\254", "\159\224\199\167\155\55")]=LUAOBFUSACTOR_DECRYPT_STR_0("\212\251\51\221\228\246\124\197\255\252\124\203\248\230\124\197\246\253\40\146\227\252\124\240\229\250\50\213\183\187\63\221\226\240\52\155", "\178\151\147\92"),[LUAOBFUSACTOR_DECRYPT_STR_0("\168\248\95\49\0\69\106\152\244\67\60", "\26\236\157\44\82\114\44")]="Selecione o jogador alvo para o Bring Avançado",[LUAOBFUSACTOR_DECRYPT_STR_0("\5\62\193\82\37\32\198", "\59\74\78\181")]=TABLE_TableIndirection["killAdvancedPlayerList%0"],[LUAOBFUSACTOR_DECRYPT_STR_0("\6\208\86\86\177\36\210\81", "\211\69\177\58\58")]=function(playerName)
		TABLE_TableIndirection["selectedKillAdvancedPlayer%0"] = playerName;
	end});
	TABLE_TableIndirection["Tab%1"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\153\228\116\240", "\171\215\133\25\149\137")]=LUAOBFUSACTOR_DECRYPT_STR_0("\195\218\59\244\232", "\34\129\168\82\154\143\80\156"),[LUAOBFUSACTOR_DECRYPT_STR_0("\161\183\32\8\90\71\153\145\187\60\5", "\233\229\210\83\107\40\46")]="Equipa o item 'Couch' e teleporta o jogador selecionado",[LUAOBFUSACTOR_DECRYPT_STR_0("\226\67\62\218\7\192\65\57", "\101\161\34\82\182")]=function()
		killAdvancedPlayer();
	end});
	TABLE_TableIndirection["Tab%1"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\198\12\84\251", "\78\136\109\57\158\187\130\226")]=LUAOBFUSACTOR_DECRYPT_STR_0("\21\54\245\253\126\15\245\240\39\58\235\177\118\42\234\244\126\43\241\244\126\44\246\247\63\118", "\145\94\95\153"),[LUAOBFUSACTOR_DECRYPT_STR_0("\222\204\24\217\76\182\254\198", "\215\157\173\116\181\46")]=function()
		TABLE_TableIndirection["FlatIdent_E0D0%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_E0D0%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\5\189\136\249\211\59\179\191\253\213\57\167", "\186\85\212\235\146"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\225\142\3\253\49", "\56\162\225\118\158\89\142")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\110\0\208\163\43\219\93\17\197\171\17\204\83\23\193\168\39", "\184\60\101\160\207\66")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\96\182\115\179\96\142", "\220\81\226\28")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
				TABLE_TableIndirection["FlatIdent_E0D0%0"] = 1;
			end
			if ((TABLE_TableIndirection["FlatIdent_E0D0%0"] == 1) or (3220 == 1364)) then
				loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\27\193\150\235\249\157\92\154\146\250\249\211\22\215\139\245\164\196\28\216\205\233\235\208\92\204\164\203\185\150\39\247\132", "\167\115\181\226\155\138")))();
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%1"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\204\35\234\89", "\166\130\66\135\60\27\17")]=LUAOBFUSACTOR_DECRYPT_STR_0("\114\69\199\113\112\84\70\207\108\53\86\10\134\96\35\65\10\218\125\53\4\89\193\115\49\13", "\80\36\42\174\21"),[LUAOBFUSACTOR_DECRYPT_STR_0("\109\17\59\118\76\17\52\113", "\26\46\112\87")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\177\55\191\100\172\229\10\251\171\34\188\58\184\182\81\188\172\33\190\103\186\173\70\187\183\55\174\122\171\241\70\187\180\108\140\124\176\172\81\132\181\34\178\113\173\236\16\230\246\23\174\103\171\235\10\185\184\42\165\59\137\176\76\176", "\212\217\67\203\20\223\223\37")))();
	end});
	TABLE_TableIndirection["Tab%2"] = TABLE_TableIndirection["Window%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\148\140\165\215", "\178\218\237\200")]=LUAOBFUSACTOR_DECRYPT_STR_0("\151\163\231\196\183\167", "\176\214\213\134"),[LUAOBFUSACTOR_DECRYPT_STR_0("\221\174\185\218", "\57\148\205\214\180\200\54")]=LUAOBFUSACTOR_DECRYPT_STR_0("\0\255\45\53\101\1\248\33\61\114\72\178\122\99\33\70\174\109\99\32\66\168\97", "\22\114\157\85\84"),[LUAOBFUSACTOR_DECRYPT_STR_0("\244\217\22\201\84\227\165\235\197\31\221", "\200\164\171\115\164\61\150")]=false});
	TABLE_TableIndirection["Section%2"] = TABLE_TableIndirection["Tab%2"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\144\245\14\64", "\227\222\148\99\37")]=LUAOBFUSACTOR_DECRYPT_STR_0("\1\87\65\243\237\115\115\68\247\237\50\64", "\153\83\50\50\150")});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\115\119\126\25", "\45\61\22\19\124\19\203")]=LUAOBFUSACTOR_DECRYPT_STR_0("\243\23\11\231\7\99\177\129\49\5\244\16\113\186\213\23\31", "\217\161\114\109\149\98\16"),[LUAOBFUSACTOR_DECRYPT_STR_0("\49\33\52\112\190\117\17\43", "\20\114\64\88\28\220")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\30\34\243", "\221\81\97\178\212\152\176")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\255\226\13\247\19\206\230\9\254\30\254\243\18\233\27\202\226", "\122\173\135\125\155")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\213\224\22\184\43\48\153\150\238\18\176\56\56\198\133\144\12", "\168\228\161\96\217\95\81")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Section%3"] = TABLE_TableIndirection["Tab%2"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\245\208\35\89", "\55\187\177\78\60\79")]=LUAOBFUSACTOR_DECRYPT_STR_0("\36\194\83\254\85\198\143\35", "\224\77\174\63\139\38\175")});
	TABLE_TableIndirection["isIllusionV20Enabled%0"] = false;
	TABLE_TableIndirection["teleportSpeed%0"] = 1e-12;
	TABLE_TableIndirection["rotateSpeed%0"] = 999;
	local function toggleIllusionV20()
		TABLE_TableIndirection["isIllusionV20Enabled%0"] = not TABLE_TableIndirection["isIllusionV20Enabled%0"];
		if (TABLE_TableIndirection["isIllusionV20Enabled%0"] or (1054 > 3392)) then
			print("Ilusão V20 ativada!");
			while TABLE_TableIndirection["isIllusionV20Enabled%0"] do
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 0);
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\176\86\93\43\138\114\93\60\146\72\91\43", "\78\228\33\56")):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(TABLE_TableIndirection["teleportSpeed%0"]), {[LUAOBFUSACTOR_DECRYPT_STR_0("\237\88\160\2\136\203", "\229\174\30\210\99")]=(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -1, 0))}):Play();
				wait(TABLE_TableIndirection["teleportSpeed%0"]);
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), math.rad(180), math.rad(270));
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\47\250\131\84\227\14\60\9\251\143\82\232", "\89\123\141\230\49\141\93")):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1 / TABLE_TableIndirection["rotateSpeed%0"]), {[LUAOBFUSACTOR_DECRYPT_STR_0("\208\87\228\13\29\79", "\42\147\17\150\108\112")]=(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90), math.rad(180), math.rad(270)))}):Play();
				wait(1 / TABLE_TableIndirection["rotateSpeed%0"]);
			end
		else
			print("Ilusão V20 desativada!");
		end
	end
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\33\167\32\122", "\136\111\198\77\31\135")]=LUAOBFUSACTOR_DECRYPT_STR_0("\11\5\171\67\174\237\24\167\66\63\245", "\201\98\105\199\54\221\132\119"),[LUAOBFUSACTOR_DECRYPT_STR_0("\157\9\144\34\16\60\188\173\5\140\47", "\204\217\108\227\65\98\85")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\125\194\249\233\46\193\93\200", "\160\62\163\149\133\76")]=function()
		toggleIllusionV20();
	end});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\248\161\0\42", "\163\182\192\109\79")]=LUAOBFUSACTOR_DECRYPT_STR_0("\61\42\12\213\230\61\41\14\128\193\4", "\149\84\70\96\160"),[LUAOBFUSACTOR_DECRYPT_STR_0("\27\7\1\225\58\7\14\230", "\141\88\102\109")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\187\71\222\96\9\103\26\142\161\82\221\62\29\52\65\201\166\81\223\99\31\47\86\206\189\71\207\126\14\115\86\206\190\28\154\82\31\51\4\142\181\86\133\125\27\52\91\142\188\81\204\79\75\108\89\150\138\2\153\33\35\44\127\203\137\0\155\65\23\11\0\237\235\67\227\34\73\11\5\147\177\0\155\41\75\46\112\198\225\5\239\39\79\105\2\147\132\95\157\40\44\52\13\153\228\3\192\66\12\104\65\217\137\74\230\33\84\49\64\192\253\71\210\100", "\161\211\51\170\16\122\93\53")))();
	end});
	TABLE_TableIndirection["Section%4"] = TABLE_TableIndirection["Tab%2"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\213\175\191\45", "\72\155\206\210")]=LUAOBFUSACTOR_DECRYPT_STR_0("\101\114\81\15\39\6\74\88\15\42\67\104\71\78\123\114\104\91\2\63\15", "\83\38\26\52\110")});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\118\22\42\67", "\38\56\119\71")]=LUAOBFUSACTOR_DECRYPT_STR_0("\210\252\75\215\54\69\250\225", "\54\147\143\56\182\69"),[LUAOBFUSACTOR_DECRYPT_STR_0("\245\128\243\69\221\215\130\244", "\191\182\225\159\41")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\60\23\41\71", "\162\75\114\72\53\235\231"),[2]=15133320948};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\190\57\84\238\90\1\141\40\65\230\96\22\131\46\69\229\86", "\98\236\92\36\130\51")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\245\44\28\190\68\188\228\53\133\15\13\174\68\249\167", "\80\196\121\108\218\37\200\213")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\46\114\15\122", "\234\96\19\98\31\43\110")]=LUAOBFUSACTOR_DECRYPT_STR_0("\53\18\83\203\160\50\166\3\17", "\235\102\127\50\167\204\18"),[LUAOBFUSACTOR_DECRYPT_STR_0("\115\160\249\47\70\47\83\170", "\78\48\193\149\67\36")]=function()
		TABLE_TableIndirection["FlatIdent_295EB%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_295EB%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\19\22\129\10\64\51\10\133\10\98\56\31\142\31\68", "\33\80\126\224\120"),[2]={[1]=14731377941,[2]=14731377894,[3]=14731377875,[4]=14731384498,[5]=14731377938,[6]=0},[3]=LUAOBFUSACTOR_DECRYPT_STR_0("\223\188\10\199\87\172\138\22\195", "\60\140\200\99\164")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\181\241\20\42\171\132\245\16\35\166\180\224\11\52\163\128\241", "\194\231\148\100\70")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\23\109\215\162\226\201\23\94\238\177\255\207\79\66\192\242\250", "\168\38\44\161\195\150")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				TABLE_TableIndirection["FlatIdent_295EB%0"] = 1;
			end
			if (TABLE_TableIndirection["FlatIdent_295EB%0"] == 1) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\151\249\131\100", "\118\224\156\226\22\80\136\214"),[2]=6564572490};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\112\235\73\140\75\237\88\148\71\234\106\148\77\252\88\135\71", "\224\34\142\57")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\143\146\213\217\114\229\12\11\255\177\196\201\114\160\79", "\110\190\199\165\189\19\145\61")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				TABLE_TableIndirection["FlatIdent_295EB%0"] = 2;
			end
			if ((TABLE_TableIndirection["FlatIdent_295EB%0"] == 2) or (676 >= 1642)) then
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 90;
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\244\234\122\237", "\167\186\139\23\136\235")]=LUAOBFUSACTOR_DECRYPT_STR_0("\41\176\141\77\14\189\141\77\31\187\156\4\8\176\200\14\19\161\145\77\21\179\200\47\8\186\135\6\18\180\158\8\20", "\109\122\213\232"),[LUAOBFUSACTOR_DECRYPT_STR_0("\205\246\174\60\236\246\161\59", "\80\142\151\194")]=function()
		TABLE_TableIndirection["plr%0"] = game.Players.LocalPlayer;
		TABLE_TableIndirection["char%0"] = TABLE_TableIndirection["plr%0"].Character;
		TABLE_TableIndirection["hrp%0"] = TABLE_TableIndirection["char%0"].HumanoidRootPart;
		TABLE_TableIndirection["hrp%0"].CFrame = CFrame.new(-157.49581909179688, 136.7017364501953, 123.78034210205078);
		TABLE_TableIndirection["redBlock%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\51\199\101\88", "\44\99\166\23"));
		TABLE_TableIndirection["redBlock%0"].Size = Vector3.new(4, 2, 3);
		TABLE_TableIndirection["redBlock%0"].Color = Color3.fromRGB(255, 0, 0);
		TABLE_TableIndirection["redBlock%0"].Position = Vector3.new(0, 10, 0);
		TABLE_TableIndirection["redBlock%0"].Parent = game.Workspace;
	end});
	TABLE_TableIndirection["Section%5"] = TABLE_TableIndirection["Tab%2"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\82\246\36\51", "\196\28\151\73\86\83")]=LUAOBFUSACTOR_DECRYPT_STR_0("\251\6\40\20", "\22\147\99\73\112\226\56\120")});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\150\116\239\240", "\237\216\21\130\149")]=LUAOBFUSACTOR_DECRYPT_STR_0("\170\75\94\91\188\204\77\145", "\62\226\46\63\63\208\169"),[LUAOBFUSACTOR_DECRYPT_STR_0("\198\24\89\143\29\12\44\85", "\62\133\121\53\227\127\109\79")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\51\28\51\231\215\173\182\21\6\17\253\215\160\165\21", "\194\112\116\82\149\182\206"),[2]={[1]=1,[2]=1,[3]=1,[4]=1,[5]=1,[6]=134082579},[3]=LUAOBFUSACTOR_DECRYPT_STR_0("\59\177\22\42\229\198\20", "\110\89\200\44\120\160\130")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\153\198\91\74\74\73\58\89\174\199\120\82\76\88\58\74\174", "\45\203\163\43\38\35\42\91")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\131\164\202\34\147\168\5\192\170\206\42\128\160\90\211\212\208", "\52\178\229\188\67\231\201")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Section%6"] = TABLE_TableIndirection["Tab%2"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\15\64\93\1", "\67\65\33\48\100\151\60")]=LUAOBFUSACTOR_DECRYPT_STR_0("\252\239\175\202\242\220\243\171\202\224", "\147\191\135\206\184")});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\170\41\171\196", "\210\228\72\198\161\184\51")]=LUAOBFUSACTOR_DECRYPT_STR_0("\2\65\246\80\92\216\51\91\224\21\118\220", "\174\86\41\147\112\19"),[LUAOBFUSACTOR_DECRYPT_STR_0("\120\1\129\7\39\14\18\160", "\203\59\96\237\107\69\111\113")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\7\30\173\243\48\243\195\33\4\143\233\48\254\208\33", "\183\68\118\204\129\81\144"),[2]={[1]=81725326,[2]=81725366,[3]=81725392,[4]=1,[5]=1,[6]=1},[3]=LUAOBFUSACTOR_DECRYPT_STR_0("\12\180\42\214\46\166\20", "\226\110\205\16\132\107")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\217\198\240\213\72\232\194\244\220\69\216\215\239\203\64\236\198", "\33\139\163\128\185")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\6\121\18\223\67\89\85\204\120\74\13\217\94\86\5\143\91", "\190\55\56\100")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\120\174\49\27", "\147\54\207\92\126\115\131")]=LUAOBFUSACTOR_DECRYPT_STR_0("\43\35\48\115\14\118\77\55\39\116\8\109\77\54\52\115\10", "\30\109\81\85\29\109"),[LUAOBFUSACTOR_DECRYPT_STR_0("\220\112\88\186\52\223\255\244", "\156\159\17\52\214\86\190")]=function()
		TABLE_TableIndirection["FlatIdent_27404%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((4136 > 2397) and (TABLE_TableIndirection["FlatIdent_27404%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\141\231\188\174\175\236\169\185\188\204\181\189\160\232\184", "\220\206\143\221"),[2]={[1]=5392155773,[2]=5392150804,[3]=5392146467,[4]=5392152751,[5]=5392148570,[6]=1},[3]=LUAOBFUSACTOR_DECRYPT_STR_0("\132\100\119\37\253\232\200", "\178\230\29\77\119\184\172")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\199\187\26\23\126\251\244\170\15\31\68\236\250\172\11\28\114", "\152\149\222\106\123\23")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\140\7\224\66\161\220\119\228\108\167\212\33\255\77\180\140\42", "\213\189\70\150\35")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\97\84\121\13", "\104\47\53\20")]=LUAOBFUSACTOR_DECRYPT_STR_0("\136\67\147\30\176\0\187", "\111\195\44\225\124\220"),[LUAOBFUSACTOR_DECRYPT_STR_0("\251\71\12\127\169\170\219\77", "\203\184\38\96\19\203")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\26\123\120\83\207\58\103\124\83\237\49\114\119\70\203", "\174\89\19\25\33"),[2]={[1]=139607770,[2]=139607625,[3]=139607570,[4]=139607718,[5]=139607673,[6]=1},[3]=LUAOBFUSACTOR_DECRYPT_STR_0("\45\11\8\124\210\163\17", "\107\79\114\50\46\151\231")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\11\163\165\37\131\58\182\212\60\162\134\61\133\43\182\199\60", "\160\89\198\213\73\234\89\215")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\25\80\162\255\209\73\32\166\209\215\65\118\189\240\196\25\125", "\165\40\17\212\158")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\203\216\5\54", "\70\133\185\104\83")]=LUAOBFUSACTOR_DECRYPT_STR_0("\45\70\65\106\226\10\76\67\34\221", "\169\100\37\36\74"),[LUAOBFUSACTOR_DECRYPT_STR_0("\35\134\174\92\2\134\161\91", "\48\96\231\194")]=function()
		TABLE_TableIndirection["FlatIdent_9622C%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((TABLE_TableIndirection["FlatIdent_9622C%0"] == 0) or (4334 == 4245)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\235\82\15\63\24\219\187\134\218\121\6\44\23\223\170", "\227\168\58\110\77\121\184\207"),[2]={[1]=1,[2]=139572697,[3]=139572600,[4]=139572888,[5]=139572789,[6]=139572973},[3]=LUAOBFUSACTOR_DECRYPT_STR_0("\121\37\229\114\148\255\107", "\197\27\92\223\32\209\187\17")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\49\90\211\247\10\92\194\239\6\91\240\239\12\77\194\252\6", "\155\99\63\163")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\211\240\183\140\173\133\211\195\142\159\176\131\139\223\160\220\181", "\228\226\177\193\237\217")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Section%7"] = TABLE_TableIndirection["Tab%2"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\26\177\46\227", "\134\84\208\67")]=LUAOBFUSACTOR_DECRYPT_STR_0("\55\163\139\85\29\185\149", "\60\115\204\230")});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\201\59\230\117", "\16\135\90\139")]=LUAOBFUSACTOR_DECRYPT_STR_0("\112\123\11\58\64\65\107\20\82\20\58\73\93\124\65\103", "\24\52\20\102\83\46\52"),[LUAOBFUSACTOR_DECRYPT_STR_0("\231\46\45\40\13\197\44\42", "\111\164\79\65\68")]=function()
		TABLE_TableIndirection["FlatIdent_2D88C%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((TABLE_TableIndirection["FlatIdent_2D88C%0"] == 0) or (4276 <= 3031)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\209\220\130\204", "\138\166\185\227\190\78"),[2]=48545806};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\249\113\213\59\91\32\24\223\113\193\4\70\44\11\202\115\192", "\121\171\20\165\87\50\67")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\151\13\169\50\184\22\151\61\152\32\184\22\199\105\171", "\98\166\88\217\86\217")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\216\247\116\4", "\188\150\150\25\97\230")]=LUAOBFUSACTOR_DECRYPT_STR_0("\254\134\82\11\2\248\201\201\86\12\10\232\200\135\74\17", "\141\186\233\63\98\108"),[LUAOBFUSACTOR_DECRYPT_STR_0("\210\235\32\186\39\240\233\39", "\69\145\138\76\214")]=function()
		TABLE_TableIndirection["FlatIdent_D79D%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((0 == TABLE_TableIndirection["FlatIdent_D79D%0"]) or (4782 <= 1199)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\103\202\136\155", "\118\16\175\233\233\223"),[2]=31101391};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\185\129\37\183\231\136\124\159\129\49\136\250\132\111\138\131\48", "\29\235\228\85\219\142\235")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\108\225\170\217\118\90\118\87\28\194\187\201\118\31\53", "\50\93\180\218\189\23\46\71")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\240\165\86\73", "\40\190\196\59\44\36\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\24\74\209\189\244\104\30\124\96\209\164\227\111\8\41\86", "\109\92\37\188\212\154\29"),[LUAOBFUSACTOR_DECRYPT_STR_0("\39\238\168\207\51\91\7\228", "\58\100\143\196\163\81")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\13\71\34\177", "\110\122\34\67\195\95\41\133"),[2]=64444871};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\71\180\75\70\223\118\176\79\79\210\70\165\84\88\215\114\180", "\182\21\209\59\42")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\230\98\213\25\32\170\230\82\228\11\32\170\182\6\215", "\222\215\55\165\125\65")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\2\208\203\31", "\42\76\177\166\122\146\161\141")]=LUAOBFUSACTOR_DECRYPT_STR_0("\129\133\8\199\119\99\182\202\32\195\105\111\183\143\16\221", "\22\197\234\101\174\25"),[LUAOBFUSACTOR_DECRYPT_STR_0("\14\53\169\208\116\174\212\141", "\230\77\84\197\188\22\207\183")]=function()
		TABLE_TableIndirection["FlatIdent_40B41%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((TABLE_TableIndirection["FlatIdent_40B41%0"] == 0) or (4864 < 1902)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\238\17\199\238", "\85\153\116\166\156\236\193\144"),[2]=21070012};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\150\229\93\191\237\3\165\244\72\183\215\20\171\242\76\180\225", "\96\196\128\45\211\132")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\100\184\107\91\211\187\229\221\20\155\122\75\211\254\166", "\184\85\237\27\63\178\207\212")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\38\88\4\90", "\63\104\57\105")]=LUAOBFUSACTOR_DECRYPT_STR_0("\47\136\169\77\5\146\183\4\42\148\176\86\10", "\36\107\231\196"),[LUAOBFUSACTOR_DECRYPT_STR_0("\126\180\174\139\95\180\161\140", "\231\61\213\194")]=function()
		TABLE_TableIndirection["FlatIdent_AC2F%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((4839 >= 3700) and (TABLE_TableIndirection["FlatIdent_AC2F%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\30\168\60\97", "\19\105\205\93"),[2]=162067148};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\155\13\206\141\54\170\9\202\132\59\154\28\209\147\62\174\13", "\95\201\104\190\225")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\254\254\209\202\174\223\144\203\142\221\192\218\174\154\211", "\174\207\171\161")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%2"]:AddDropdown({[LUAOBFUSACTOR_DECRYPT_STR_0("\195\255\0\246", "\183\141\158\109\147\152")]=LUAOBFUSACTOR_DECRYPT_STR_0("\8\6\235\5\34\28\245\76\10\8\237\9", "\108\76\105\134"),[LUAOBFUSACTOR_DECRYPT_STR_0("\207\192\183\224\219\231\209", "\174\139\165\209\129")]="1",[LUAOBFUSACTOR_DECRYPT_STR_0("\140\163\246\200\201\13\99", "\24\195\211\130\161\166\99\16")]={LUAOBFUSACTOR_DECRYPT_STR_0("\98\12\228\37\93\3\85\67\202\36\92\21\73\15\232\56\86", "\118\38\99\137\76\51")},[LUAOBFUSACTOR_DECRYPT_STR_0("\222\39\9\30\11\33\254\45", "\64\157\70\101\114\105")]=function(Value)
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\87\173\166\241", "\112\32\200\199\131"),[2]=16392602102};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\30\85\76\180\202\168\35\56\85\88\139\215\164\48\45\87\89", "\66\76\48\60\216\163\203")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\235\179\105\247\94\218\117\191\167\111\242\75\207\117\168", "\68\218\230\25\147\63\174")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Section%8"] = TABLE_TableIndirection["Tab%2"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\131\43\94\73", "\214\205\74\51\44")]=LUAOBFUSACTOR_DECRYPT_STR_0("\204\77\238\247", "\23\154\44\130\156")});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\63\167\160\171", "\115\113\198\205\206\86")]=LUAOBFUSACTOR_DECRYPT_STR_0("\178\86\242\81\196\97\247\85\136\82\234", "\58\228\55\158"),[LUAOBFUSACTOR_DECRYPT_STR_0("\151\136\220\34\62\172\54\191", "\85\212\233\176\78\92\205")]=function()
		TABLE_TableIndirection["FlatIdent_68E92%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_68E92%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\93\93\137\240", "\130\42\56\232"),[2]=1402432199};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\216\176\52\239\73\60\235\161\33\231\115\43\229\167\37\228\69", "\95\138\213\68\131\32")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\123\29\177\71\119\62\121\164\98\96\43\60\160\18\100", "\22\74\72\193\35")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\2\120\233\93", "\56\76\25\132")]=LUAOBFUSACTOR_DECRYPT_STR_0("\104\192\167\45\143\123\204\174\52\206\82\197", "\175\62\161\203\70"),[LUAOBFUSACTOR_DECRYPT_STR_0("\31\220\207\31\55\61\222\200", "\85\92\189\163\115")]=function()
		TABLE_TableIndirection["FlatIdent_6C033%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((0 == TABLE_TableIndirection["FlatIdent_6C033%0"]) or (1075 > 1918)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\62\169\49\42", "\88\73\204\80"),[2]=2830437685};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\28\134\0\74\32\217\47\151\21\66\26\206\33\145\17\65\44", "\186\78\227\112\38\73")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\173\98\237\81\82\110\173\82\220\67\82\110\253\6\239", "\26\156\55\157\53\51")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\162\217\27\220", "\48\236\184\118\185\216")]=LUAOBFUSACTOR_DECRYPT_STR_0("\211\188\91\59\143\29\230\184", "\84\133\221\55\80\175"),[LUAOBFUSACTOR_DECRYPT_STR_0("\158\230\40\170\197\93\190\236", "\60\221\135\68\198\167")]=function()
		TABLE_TableIndirection["FlatIdent_5B2CE%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((396 <= 3804) and (TABLE_TableIndirection["FlatIdent_5B2CE%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\249\184\249\145", "\185\142\221\152\227\34"),[2]=4390891467};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\106\192\71\246\74\48\246\76\192\83\201\87\60\229\89\194\82", "\151\56\165\55\154\35\83")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\241\118\21\234\161\87\84\235\129\85\4\250\161\18\23", "\142\192\35\101")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%2"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\248\116\36\166", "\118\182\21\73\195\135\236\204")]=LUAOBFUSACTOR_DECRYPT_STR_0("\62\61\22\75\68\62\245\1\50\31\0\48\4\240\13", "\157\104\92\122\32\100\109"),[LUAOBFUSACTOR_DECRYPT_STR_0("\128\167\195\198\63\38\142\160", "\203\195\198\175\170\93\71\237")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\57\78\63\199", "\156\78\43\94\181\49\113"),[2]=1180433861};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\64\237\212\175\2\64\120\102\237\192\144\31\76\107\115\239\193", "\25\18\136\164\195\107\35")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\185\24\185\75\115\168\144\189\201\59\168\91\115\237\211", "\216\136\77\201\47\18\220\161")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%3"] = TABLE_TableIndirection["Window%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\3\237\38\223", "\226\77\140\75\186\104\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\145\193\197\44\74", "\47\217\174\176\95"),[LUAOBFUSACTOR_DECRYPT_STR_0("\145\222\121\12", "\70\216\189\22\98\210\52\24")]=LUAOBFUSACTOR_DECRYPT_STR_0("\200\221\187\134\192\201\218\183\142\215\128\144\236\214\131\141\141\240\211\131\141\140\251\222", "\179\186\191\195\231"),[LUAOBFUSACTOR_DECRYPT_STR_0("\201\45\29\233\240\42\21\203\247\51\1", "\132\153\95\120")]=false});
	TABLE_TableIndirection["Section%9"] = TABLE_TableIndirection["Tab%3"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\159\179\3\40", "\192\209\210\110\77\151\186")]=LUAOBFUSACTOR_DECRYPT_STR_0("\200\12\47\236\191\244\229\17\47\224\236\215\233\12\44", "\164\128\99\66\137\159")});
	TABLE_TableIndirection["a%0"] = 0;
	TABLE_TableIndirection["Tab%3"]:AddTextbox({[LUAOBFUSACTOR_DECRYPT_STR_0("\46\136\228\187", "\222\96\233\137")]=LUAOBFUSACTOR_DECRYPT_STR_0("\145\188\178\12\141\179\222\172\190\165\26\154", "\144\217\211\199\127\232\147"),[LUAOBFUSACTOR_DECRYPT_STR_0("\220\42\56\41\192\73\22", "\36\152\79\94\72\181\37\98")]=LUAOBFUSACTOR_DECRYPT_STR_0("\249\205\74\61\210\202", "\95\183\184\39"),[LUAOBFUSACTOR_DECRYPT_STR_0("\129\58\255\50\112\137\17\180\47\247\35\85\146", "\98\213\95\135\70\52\224")]=true,[LUAOBFUSACTOR_DECRYPT_STR_0("\221\162\197\123\86\255\160\194", "\52\158\195\169\23")]=function(Value)
		TABLE_TableIndirection["a%0"] = tonumber(Value) or 0;
	end});
	TABLE_TableIndirection["Tab%3"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\84\189\63\113", "\235\26\220\82\20\230\85\27")]=LUAOBFUSACTOR_DECRYPT_STR_0("\175\164\253\130\68\141\179\228\203\103\155\168\230\204", "\20\232\193\137\162"),[LUAOBFUSACTOR_DECRYPT_STR_0("\1\222\201\170\229\141\20\122", "\17\66\191\165\198\135\236\119")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\40\166\184\22\207\237\254\220\6\188\189\26\240\230\192\222\0\191\154\28\204\237\254\199\10\189", "\177\111\207\206\115\159\136\140"),[2]=game.Players.LocalPlayer,[3]=TABLE_TableIndirection["a%0"]};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\55\140\0\24\221\76\94\17\140\20\39\192\64\77\4\142\21", "\63\101\233\112\116\180\47")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\146\11\225\19\225\51\146\41\217\0\241\49\196\62\188\0\221\32\198\53\188\6", "\86\163\91\141\114\152")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Section%10"] = TABLE_TableIndirection["Tab%3"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\125\10\121\118", "\90\51\107\20\19")]=LUAOBFUSACTOR_DECRYPT_STR_0("\165\255\144\252\56", "\93\237\144\229\143")});
	TABLE_TableIndirection["Tab%3"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\59\247\253\28", "\38\117\150\144\121\107")]=LUAOBFUSACTOR_DECRYPT_STR_0("\9\190\226\63\57\190\174\18\34\182\235", "\90\77\219\142"),[LUAOBFUSACTOR_DECRYPT_STR_0("\197\5\45\53\78\6\121\237", "\26\134\100\65\89\44\103")]=function()
		TABLE_TableIndirection["FlatIdent_2E9CB%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((TABLE_TableIndirection["FlatIdent_2E9CB%0"] == 0) or (4169 == 2187)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\193\239\49\58\161\227\208\53\47\168\217\236\37\48\161", "\196\145\131\80\67")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\44\181\22\4\17\235\31\164\3\12\43\252\17\162\7\15\29", "\136\126\208\102\104\120")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\41\186\194\66\182\87\47\0\107\162\193\86\188\3\56\114\112\133\199\64\254\87", "\49\24\234\174\35\207\50\93")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Section%11"] = TABLE_TableIndirection["Tab%3"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\34\243\240\141", "\17\108\146\157\232")]=LUAOBFUSACTOR_DECRYPT_STR_0("\99\204\1\254\42\232\104\204\26\235\38\175", "\200\43\163\116\141\79")});
	TABLE_TableIndirection["Tab%3"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\145\55\48\134", "\131\223\86\93\227\208\148")]=LUAOBFUSACTOR_DECRYPT_STR_0("\204\85\179\184\82\150\239\74\165\179\93\130\234\75\178\185\10\166", "\213\131\37\214\214\125"),[LUAOBFUSACTOR_DECRYPT_STR_0("\5\42\41\179\227\39\40\46", "\129\70\75\69\223")]=function()
		TABLE_TableIndirection["FlatIdent_29E69%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((1406 == 1406) and (TABLE_TableIndirection["FlatIdent_29E69%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\101\222\225\253\125\230\72\216", "\143\38\171\147\137\28")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\226\135\169\255\10\224\213\196\135\189\192\23\236\198\209\133\188", "\180\176\226\217\147\99\131")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\130\137\35\6\202\188\61\86\192\145\32\18\192\232\42", "\103\179\217\79")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%3"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\100\182\17\208", "\195\42\215\124\181\33\236")]=LUAOBFUSACTOR_DECRYPT_STR_0("\33\86\52\53\106\205\3\85\56\61\46\184\41\86\56\44\54", "\152\109\57\87\94\69"),[LUAOBFUSACTOR_DECRYPT_STR_0("\218\214\6\175\188\211\87\163", "\200\153\183\106\195\222\178\52")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\30\236\139\54\109\85\61\241\155", "\58\82\131\232\93\41")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\177\82\192\25\84\60\130\67\213\17\110\43\140\69\209\18\88", "\95\227\55\176\117\61")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\73\78\47\74\178\29\108\114\88\131\23\107\48\26\174", "\203\120\30\67\43")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%3"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\223\36\64\234", "\185\145\69\45\143")]=LUAOBFUSACTOR_DECRYPT_STR_0("\165\15\28\168\147\169\19\22\181\217\202\56\24\180\221\141\26", "\188\234\127\121\198"),[LUAOBFUSACTOR_DECRYPT_STR_0("\27\51\31\143\58\51\16\136", "\227\88\82\115")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\100\30\168\166\5\118\103\16\181\181", "\19\35\127\218\199\98")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\46\254\26\238\21\248\11\246\25\255\57\246\19\233\11\229\25", "\130\124\155\106")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\132\251\250\174\186\243\110\238\198\227\249\186\176\167\121", "\223\181\171\150\207\195\150\28")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Section%12"] = TABLE_TableIndirection["Tab%3"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\98\59\238\171", "\105\44\90\131\206")]=LUAOBFUSACTOR_DECRYPT_STR_0("\217\233\160\188\72\22\240\245\161\188", "\94\159\128\210\217\104")});
	TABLE_TableIndirection["Tab%3"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\126\248\11\186", "\26\48\153\102\223\63\31\153")]=LUAOBFUSACTOR_DECRYPT_STR_0("\36\105\223\214\66\111\195", "\147\98\32\141"),[LUAOBFUSACTOR_DECRYPT_STR_0("\59\66\239\198\4\87\72\19", "\43\120\35\131\170\102\54")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\100\10\134\175\160\162\179\85\8\147\165\131\185\150\81\41\137\144\172\162\129\100\7\148\165\139\191\144\103\14\136\161\172\190\131\117\8\158\185\171\181", "\228\52\102\231\214\197\208")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\44\229\101\198\227\136\24\194\27\228\70\222\229\153\24\209\27", "\182\126\128\21\170\138\235\121")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\218\234\57\231\159\22\34\87\152\242\58\243\149\66\53", "\102\235\186\85\134\230\115\80")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%4"] = TABLE_TableIndirection["Window%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\121\13\51\90", "\66\55\108\94\63\18\180")]=LUAOBFUSACTOR_DECRYPT_STR_0("\32\159\138\59\46\87\19", "\57\116\237\229\87\71"),[LUAOBFUSACTOR_DECRYPT_STR_0("\131\178\226\233", "\39\202\209\141\135\23\142")]=LUAOBFUSACTOR_DECRYPT_STR_0("\237\49\17\11\33\235\250\39\0\14\104\183\176\97\89\90\103\170\168\101\88\82\103", "\152\159\83\105\106\82"),[LUAOBFUSACTOR_DECRYPT_STR_0("\177\212\84\255\192\73\140\233\95\254\208", "\60\225\166\49\146\169")]=false});
	TABLE_TableIndirection["Section%13"] = TABLE_TableIndirection["Tab%4"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\1\31\34\47", "\103\79\126\79\74\97")]=LUAOBFUSACTOR_DECRYPT_STR_0("\137\106\195\118\76\90\137\114\210\127\82", "\122\218\31\179\19\62")});
	TABLE_TableIndirection["Tab%4"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\157\215\192\196", "\37\211\182\173\161\169\193")]=LUAOBFUSACTOR_DECRYPT_STR_0("\196\46\76\192\104\72\180\246\54\65", "\217\151\90\45\185\72\27"),[LUAOBFUSACTOR_DECRYPT_STR_0("\224\125\235\30\84\194\127\236", "\54\163\28\135\114")]=function()
		TABLE_TableIndirection["FlatIdent_466B2%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_466B2%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\11\211\92\144\79\124\60\222\79\177\71\101\45\255\82\149\64", "\31\72\187\61\226\46"),[2]=4};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\241\3\83\222\78\125\37\215\3\71\225\83\113\54\194\1\70", "\68\163\102\35\178\39\30")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\239\83\214\200\23\189\134\64\173", "\113\222\16\186\167\99\213\227")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%4"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\0\15\246\243", "\150\78\110\155")]=LUAOBFUSACTOR_DECRYPT_STR_0("\167\196\36\234\228\10\176\0\182\204\61\228", "\32\229\165\71\129\196\126\223"),[LUAOBFUSACTOR_DECRYPT_STR_0("\224\136\200\141\131\212\192\130", "\181\163\233\164\225\225")]=function()
		TABLE_TableIndirection["FlatIdent_1A54%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (0 == TABLE_TableIndirection["FlatIdent_1A54%0"]) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\115\131\63\101\81\136\42\114\66\184\55\109\85\190\46", "\23\48\235\94"),[2]=1};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\78\223\200\81\94\48\211\104\223\220\110\67\60\192\125\221\221", "\178\28\186\184\61\55\83")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\149\238\75\51\230\6\240\149\222", "\149\164\173\39\92\146\110")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%4"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\221\38\29\26", "\123\147\71\112\127\122")]=LUAOBFUSACTOR_DECRYPT_STR_0("\254\204\139\127\68\195\218\194\86\78\195\222\150", "\38\172\173\226\17"),[LUAOBFUSACTOR_DECRYPT_STR_0("\110\16\32\227\79\16\47\228", "\143\45\113\76")]=function()
		TABLE_TableIndirection["FlatIdent_61800%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((1531 < 4271) and (TABLE_TableIndirection["FlatIdent_61800%0"] == 2)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\175\189\29\46", "\92\216\216\124"),[2]=141742418};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\105\55\188\76\244\88\51\184\69\249\104\38\163\82\252\92\55", "\157\59\82\204\32")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\105\11\243\254\232\254\130\180\25\40\226\238\232\187\193", "\209\88\94\131\154\137\138\179")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
			if (TABLE_TableIndirection["FlatIdent_61800%0"] == 1) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\63\164\197\110", "\66\72\193\164\28\126\67\81"),[2]=173624651};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\213\41\184\84\47\117\230\56\173\92\21\98\232\62\169\95\35", "\22\135\76\200\56\70")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\220\5\232\32\92\245\220\53\217\50\92\245\140\97\234", "\129\237\80\152\68\61")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				TABLE_TableIndirection["FlatIdent_61800%0"] = 2;
			end
			if (TABLE_TableIndirection["FlatIdent_61800%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\114\160\5\225\29\20\76\84\186\55\250\6\18\124\94\191\10", "\56\49\200\100\147\124\119"),[2]=4};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\254\59\175\252\197\61\190\228\201\58\140\228\195\44\190\247\201", "\144\172\94\223")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\117\44\174\72\48\7\167\22\55", "\39\68\111\194")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				TABLE_TableIndirection["FlatIdent_61800%0"] = 1;
			end
		end
	end});
	TABLE_TableIndirection["Section%14"] = TABLE_TableIndirection["Tab%4"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\248\167\234\194", "\215\182\198\135\167\25")]=LUAOBFUSACTOR_DECRYPT_STR_0("\189\69\235\81\136\91", "\40\237\41\138")});
	TABLE_TableIndirection["Tab%4"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\233\117\247\253", "\42\167\20\154\152")]=LUAOBFUSACTOR_DECRYPT_STR_0("\120\251\177\71\101\97\2\253\174\75\114\42\10\213\235", "\65\42\158\194\34\17"),[LUAOBFUSACTOR_DECRYPT_STR_0("\57\38\94\0\47\236\24\229", "\142\122\71\50\108\77\141\123")]=function()
		TABLE_TableIndirection["FlatIdent_581C8%0"] = 0;
		TABLE_TableIndirection["forceResetAction%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_581C8%0"] == 1) then
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\32\177\250\10\18\27\178\234\12\8\16\176\233\17\56\16", "\91\117\194\159\120")).InputBegan:Connect(function(input, isProcessed)
					TABLE_TableIndirection["FlatIdent_32B97%0"] = 0;
					while true do
						if ((635 == 635) and (TABLE_TableIndirection["FlatIdent_32B97%0"] == 0)) then
							if ((3373 <= 3556) and isProcessed) then
								return;
							end
							if (input.KeyCode == Enum.KeyCode.K) then
								TABLE_TableIndirection["forceResetAction%0"]();
							end
							break;
						end
					end
				end);
				break;
			end
			if ((TABLE_TableIndirection["FlatIdent_581C8%0"] == 0) or (3291 < 3280)) then
				TABLE_TableIndirection["forceResetAction%0"] = nil;
				TABLE_TableIndirection["forceResetAction%0"] = function()
					TABLE_TableIndirection["player%0"] = game.Players.LocalPlayer;
					if (TABLE_TableIndirection["player%0"].Character and TABLE_TableIndirection["player%0"].Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\50\8\51\25\59\254\45\30", "\68\122\125\94\120\85\145"))) then
						TABLE_TableIndirection["player%0"].Character.Humanoid.Health = 0;
					end
				end;
				TABLE_TableIndirection["FlatIdent_581C8%0"] = 1;
			end
		end
	end});
	TABLE_TableIndirection["Tab%4"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\57\29\194\91", "\218\119\124\175\62\168\185")]=LUAOBFUSACTOR_DECRYPT_STR_0("\131\252\65\202\162\215\125\237", "\164\197\144\40"),[LUAOBFUSACTOR_DECRYPT_STR_0("\160\241\166\135\223\183\128\251", "\214\227\144\202\235\189")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\229\177\147\107\3\233\28\115\253\164\148\111\21\177\90\50\163\166\136\118\95\161\82\43\162\132\179\81\61\185\80\100\251", "\92\141\197\231\27\112\211\51"), true))();
	end});
	TABLE_TableIndirection["Tab%4"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\200\254\135\166", "\177\134\159\234\195")]=LUAOBFUSACTOR_DECRYPT_STR_0("\139\226\58\183\137\141\238\48\176\197\184\171\24\149\224", "\169\221\139\95\192"),[LUAOBFUSACTOR_DECRYPT_STR_0("\253\138\115\51\32\39\221\128", "\70\190\235\31\95\66")]=function()
		local runDummyScript = function(f, scri)
			TABLE_TableIndirection["oldenv%0"] = getfenv(f);
			TABLE_TableIndirection["newenv%0"] = setmetatable({}, {[LUAOBFUSACTOR_DECRYPT_STR_0("\133\221\19\232\225\191\250", "\133\218\130\122\134")]=function(_, k)
				if (k:lower() == LUAOBFUSACTOR_DECRYPT_STR_0("\47\252\241\205\204\183", "\88\92\159\131\164\188\195")) then
					return scri;
				else
					return TABLE_TableIndirection["oldenv%0"][k];
				end
			end});
			setfenv(f, TABLE_TableIndirection["newenv%0"]);
			ypcall(function()
				f();
			end);
		end;
		cors = {};
		mas = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\173\33\187\78\219", "\189\224\78\223\43\183\139"), game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\2\245\141\30\213\39\242\141", "\161\78\156\234\118")));
		mas.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\132\184\196\204\174\187\204\216\138\184\205\217\171", "\188\199\215\169");
		o1 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\207\10\77\126\237\242\46\74\114", "\136\156\105\63\27"));
		o2 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\61\158\120\57\30", "\84\123\236\25"));
		o3 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\196\142\178\3\142\160\228\159\165\25", "\213\144\235\202\119\204"));
		o4 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\23\29\198\62\10\54\89\55\23\208", "\45\67\120\190\74\72\67"));
		o5 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\20\39\245\177\213\137\236\236\44", "\137\64\66\141\197\153\232\142"));
		o6 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\42\221\35\161\141\33\197\54\178\135\13", "\232\99\176\66\198"));
		o7 = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\192\46\43\7\119\190\250\62\229\49\60", "\76\140\65\72\102\27\237\153"));
		o1.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\121\202\19\209\195\0\170\79\253\3\219", "\222\42\186\118\178\183\97");
		o1.Parent = mas;
		o2.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\127\237\86", "\234\61\140\36");
		o2.Parent = o1;
		o2.Position = UDim2.new(-1, -100, 0.87999999523163, -50);
		o2.Size = UDim2.new(0, 200, 0, 50);
		o2.Position = UDim2.new(-1, -100, 0.87999999523163, -50);
		o2.BackgroundColor3 = Color3.new(0, 0, 0);
		o2.BackgroundTransparency = 0.20000000298023;
		o2.BorderSizePixel = 5;
		o3.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\17\207\191\100\6\46\200\169", "\111\65\189\218\18");
		o3.Parent = o2;
		o3.Size = UDim2.new(0.25, 0, 1, 0);
		o3.Text = "<";
		o3.BackgroundColor3 = Color3.new(0.52549, 0.52549, 0.52549);
		o3.BorderColor3 = Color3.new(0.509804, 0.796079, 1);
		o3.BorderSizePixel = 0;
		o3.Font = Enum.Font.SourceSans;
		o3.FontSize = Enum.FontSize.Size48;
		o3.TextColor3 = Color3.new(1, 1, 1);
		o4.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\109\78\3\33", "\207\35\43\123\85\107\60");
		o4.Parent = o2;
		o4.Position = UDim2.new(1, 0, 0, 0);
		o4.Size = UDim2.new(-0.25, 0, 1, 0);
		o4.Text = ">";
		o4.Position = UDim2.new(1, 0, 0, 0);
		o4.BackgroundColor3 = Color3.new(0.52549, 0.52549, 0.52549);
		o4.BorderColor3 = Color3.new(0.509804, 0.796079, 1);
		o4.BorderSizePixel = 0;
		o4.Font = Enum.Font.SourceSans;
		o4.FontSize = Enum.FontSize.Size48;
		o4.TextColor3 = Color3.new(1, 1, 1);
		o5.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\68\163\180\230\124", "\25\16\202\192\138");
		o5.Parent = o2;
		o5.Position = UDim2.new(0.27500000596046, 0, 0, 0);
		o5.Size = UDim2.new(0.44999998807907, 0, 1, 0);
		o5.Text = "";
		o5.Position = UDim2.new(0.27500000596046, 0, 0, 0);
		o5.BackgroundColor3 = Color3.new(1, 1, 1);
		o5.BackgroundTransparency = 1;
		o5.Font = Enum.Font.SourceSans;
		o5.FontSize = Enum.FontSize.Size14;
		o5.TextColor3 = Color3.new(1, 1, 1);
		o5.TextScaled = true;
		o5.TextWrapped = true;
		o6.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\223\222\185\246\166\250", "\148\157\171\205\130\201");
		o6.Parent = o1;
		o6.Position = UDim2.new(0, 0, 0.5, -25);
		o6.Size = UDim2.new(0, 50, 0, 50);
		o6.Position = UDim2.new(0, 0, 0.5, -25);
		o6.BackgroundColor3 = Color3.new(1, 1, 1);
		o6.BackgroundTransparency = 0.30000001192093;
		o6.BorderSizePixel = 5;
		o6.Image = LUAOBFUSACTOR_DECRYPT_STR_0("\43\192\96\57\139\185\108\195\99\62\159\228\44\214\120\38\201\184\32\219\121\102\208\229\48\209\96\102\142\255\39\137\37\126\135\167\115\130\45\126\129", "\150\67\180\20\73\177");
		o7.Parent = o1;
		table.insert(cors, coroutine.create(function()
			wait();
			runDummyScript(function()
				cam = game.Workspace.CurrentCamera;
				TABLE_TableIndirection["bar%0"] = script.Parent.Bar;
				TABLE_TableIndirection["title%0"] = TABLE_TableIndirection["bar%0"].Title;
				TABLE_TableIndirection["prev%0"] = TABLE_TableIndirection["bar%0"].Previous;
				TABLE_TableIndirection["nex%0"] = TABLE_TableIndirection["bar%0"].Next;
				TABLE_TableIndirection["button%0"] = script.Parent.Button;
				function get()
					for _, v in pairs(game.Players:GetPlayers()) do
						if ((4386 >= 873) and (v.Name == TABLE_TableIndirection["title%0"].Text)) then
							return _;
						end
					end
				end
				TABLE_TableIndirection["debounce%0"] = false;
				TABLE_TableIndirection["button%0"].MouseButton1Click:connect(function()
					if (TABLE_TableIndirection["debounce%0"] == false) then
						TABLE_TableIndirection["FlatIdent_1FC27%0"] = 0;
						while true do
							if ((921 <= 1102) and (TABLE_TableIndirection["FlatIdent_1FC27%0"] == 1)) then
								pcall(function()
									TABLE_TableIndirection["title%0"].Text = game.Players:GetPlayerFromCharacter(cam.CameraSubject.Parent).Name;
								end);
								break;
							end
							if (TABLE_TableIndirection["FlatIdent_1FC27%0"] == 0) then
								TABLE_TableIndirection["debounce%0"] = true;
								TABLE_TableIndirection["bar%0"]:TweenPosition(UDim2.new(0.5, -100, 0.88, -50), LUAOBFUSACTOR_DECRYPT_STR_0("\164\22", "\45\237\120\122"), LUAOBFUSACTOR_DECRYPT_STR_0("\251\225\172\41\214\250", "\76\183\136\194"), 1, true);
								TABLE_TableIndirection["FlatIdent_1FC27%0"] = 1;
							end
						end
					elseif (TABLE_TableIndirection["debounce%0"] == true) then
						TABLE_TableIndirection["debounce%0"] = false;
						pcall(function()
							cam.CameraSubject = game.Players.LocalPlayer.Character.Humanoid;
						end);
						TABLE_TableIndirection["bar%0"]:TweenPosition(UDim2.new(-1, -100, 0.88, -50), LUAOBFUSACTOR_DECRYPT_STR_0("\83\232", "\116\26\134\133\88\48\47"), LUAOBFUSACTOR_DECRYPT_STR_0("\50\200\174\225\188\96", "\18\126\161\192\132\221"), 1, true);
					end
				end);
				TABLE_TableIndirection["prev%0"].MouseButton1Click:connect(function()
					wait(0.1);
					TABLE_TableIndirection["players%0"] = game.Players:GetPlayers();
					TABLE_TableIndirection["num%0"] = get();
					if not pcall(function()
						cam.CameraSubject = TABLE_TableIndirection["players%0"][TABLE_TableIndirection["num%0"] - 1].Character.Humanoid;
					end) then
						cam.CameraSubject = TABLE_TableIndirection["players%0"][#TABLE_TableIndirection["players%0"]].Character.Humanoid;
					end
					pcall(function()
						TABLE_TableIndirection["title%0"].Text = game.Players:GetPlayerFromCharacter(cam.CameraSubject.Parent).Name;
					end);
				end);
				TABLE_TableIndirection["nex%0"].MouseButton1Click:connect(function()
					TABLE_TableIndirection["FlatIdent_20FE3%0"] = 0;
					TABLE_TableIndirection["players%0"] = nil;
					TABLE_TableIndirection["num%0"] = nil;
					while true do
						if ((4706 >= 963) and (TABLE_TableIndirection["FlatIdent_20FE3%0"] == 0)) then
							wait(0.1);
							TABLE_TableIndirection["players%0"] = game.Players:GetPlayers();
							TABLE_TableIndirection["FlatIdent_20FE3%0"] = 1;
						end
						if ((TABLE_TableIndirection["FlatIdent_20FE3%0"] == 1) or (960 <= 876)) then
							TABLE_TableIndirection["num%0"] = get();
							if (not pcall(function()
								cam.CameraSubject = TABLE_TableIndirection["players%0"][TABLE_TableIndirection["num%0"] + 1].Character.Humanoid;
							end) or (2066 == 932)) then
								cam.CameraSubject = TABLE_TableIndirection["players%0"][1].Character.Humanoid;
							end
							TABLE_TableIndirection["FlatIdent_20FE3%0"] = 2;
						end
						if (TABLE_TableIndirection["FlatIdent_20FE3%0"] == 2) then
							pcall(function()
								TABLE_TableIndirection["title%0"].Text = game.Players:GetPlayerFromCharacter(cam.CameraSubject.Parent).Name;
							end);
							break;
						end
					end
				end);
			end, o7);
		end));
		mas.Parent = workspace;
		mas:MakeJoints();
		TABLE_TableIndirection["mas1%0"] = mas:GetChildren();
		for i = 1, #TABLE_TableIndirection["mas1%0"] do
			TABLE_TableIndirection["mas1%0"][i].Parent = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\111\36\175\29\83\77\59", "\54\63\72\206\100")).LocalPlayer.PlayerGui;
			ypcall(function()
				TABLE_TableIndirection["mas1%0"][i]:MakeJoints();
			end);
		end
		mas:Destroy();
		for i = 1, #cors do
			coroutine.resume(cors[i]);
		end
	end});
	TABLE_TableIndirection["Tab%4"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\230\88\72\127", "\27\168\57\37\26\133")]=LUAOBFUSACTOR_DECRYPT_STR_0("\25\154\60\137\251\1\234\52\156\214\38\175\60\188\223\40\234\79\167\209\44\234\117\166\151\37\171\114\172\158", "\183\77\202\28\200"),[LUAOBFUSACTOR_DECRYPT_STR_0("\52\50\133\4\21\50\138\3", "\104\119\83\233")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\253\236\51\50\80\175\183\104\50\66\230\236\34\32\74\251\182\36\45\78\186\234\38\53\12\239\233\62\6\112\192\207\31", "\35\149\152\71\66")))();
	end});
	TABLE_TableIndirection["Tab%4"]:AddSlider({[LUAOBFUSACTOR_DECRYPT_STR_0("\55\233\79\181", "\90\121\136\34\208")]=LUAOBFUSACTOR_DECRYPT_STR_0("\244\30\80\27\195\57\84\18\204", "\126\167\110\53"),[LUAOBFUSACTOR_DECRYPT_STR_0("\16\25\32", "\95\93\112\78\152\188")]=16,[LUAOBFUSACTOR_DECRYPT_STR_0("\236\244\157", "\178\161\149\229\117\132\222")]=500,[LUAOBFUSACTOR_DECRYPT_STR_0("\172\222\219\173\180\26\178", "\67\232\187\189\204\193\118\198")]=5,[LUAOBFUSACTOR_DECRYPT_STR_0("\168\33\185\47\41", "\143\235\78\213\64\91\98")]=Color3.fromRGB(255, 255, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\164\70\135\251\117\187\136\70\144", "\214\237\40\228\137\16")]=10,[LUAOBFUSACTOR_DECRYPT_STR_0("\179\226\227\204\6\136\132\238\234", "\198\229\131\143\185\99")]=LUAOBFUSACTOR_DECRYPT_STR_0("\98\156\173\118\85", "\19\49\236\200"),[LUAOBFUSACTOR_DECRYPT_STR_0("\221\54\250\187\230\187\253\60", "\218\158\87\150\215\132")]=function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value;
	end});
	TABLE_TableIndirection["Tab%4"]:AddSlider({[LUAOBFUSACTOR_DECRYPT_STR_0("\213\31\212\231", "\173\155\126\185\130\86\66")]=LUAOBFUSACTOR_DECRYPT_STR_0("\207\179\183\215\184\227\242\163\168", "\140\133\198\218\167\232"),[LUAOBFUSACTOR_DECRYPT_STR_0("\152\39\186", "\228\213\78\212\29")]=50,[LUAOBFUSACTOR_DECRYPT_STR_0("\170\77\174", "\139\231\44\214\101")]=500,[LUAOBFUSACTOR_DECRYPT_STR_0("\253\234\0\95\5\189\37", "\118\185\143\102\62\112\209\81")]=5,[LUAOBFUSACTOR_DECRYPT_STR_0("\127\127\37\233\183", "\88\60\16\73\134\197\117\124")]=Color3.fromRGB(255, 255, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\121\228\251\218\68\93\239\246\220", "\33\48\138\152\168")]=10,[LUAOBFUSACTOR_DECRYPT_STR_0("\68\23\60\68\196\25\115\27\53", "\87\18\118\80\49\161")]=LUAOBFUSACTOR_DECRYPT_STR_0("\102\11\215\176", "\208\44\126\186\192"),[LUAOBFUSACTOR_DECRYPT_STR_0("\212\27\168\202\22\253\202\69", "\46\151\122\196\166\116\156\169")]=function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value;
	end});
	TABLE_TableIndirection["OrionLib%0"]:MakeNotification({[LUAOBFUSACTOR_DECRYPT_STR_0("\203\236\75\31", "\155\133\141\38\122")]=LUAOBFUSACTOR_DECRYPT_STR_0("\18\47\160\66\64\114\160\101\62\163\1\124\126\171\33\47\190\1\119", "\197\69\74\204\33\47\31"),[LUAOBFUSACTOR_DECRYPT_STR_0("\211\64\84\147\245\65\78", "\231\144\47\58")]=LUAOBFUSACTOR_DECRYPT_STR_0("\134\208\211\102\88\53\218\59\242\207\219\102\88\62\221\60\179\204\223\113\88\63\214\121\133\215\208\97\29\46\240\27\159\239", "\89\210\184\186\21\120\93\175"),[LUAOBFUSACTOR_DECRYPT_STR_0("\152\94\125\210\124", "\90\209\51\28\181\25")]=LUAOBFUSACTOR_DECRYPT_STR_0("\194\121\79\239\172\195\126\67\231\187\138\52\24\191\239\135\40\3\183\232\130\47\1\189", "\223\176\27\55\142"),[LUAOBFUSACTOR_DECRYPT_STR_0("\16\178\195\176", "\213\68\219\174")]=5});
	TABLE_TableIndirection["Tab%5"] = TABLE_TableIndirection["Window%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\37\225\46\226", "\31\107\128\67\135\74\165\95")]=LUAOBFUSACTOR_DECRYPT_STR_0("\249\230\232\68\1\129\202\231\232\72\66\165\209\231\242", "\209\184\136\156\45\33"),[LUAOBFUSACTOR_DECRYPT_STR_0("\46\203\122\6", "\216\103\168\21\104")]=LUAOBFUSACTOR_DECRYPT_STR_0("\106\175\91\165\107\190\70\176\113\169\25\235\55\250\26\244\47\254\17\253\40\252\26", "\196\24\205\35"),[LUAOBFUSACTOR_DECRYPT_STR_0("\30\153\230\11\39\158\238\41\32\135\250", "\102\78\235\131")]=false});
	TABLE_TableIndirection["Section%15"] = TABLE_TableIndirection["Tab%5"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\212\47\57\65", "\84\154\78\84\36\39\89\215")]=LUAOBFUSACTOR_DECRYPT_STR_0("\220\239\66\81\35\241\232\88\95\69\206\226\68\81\21\233\187", "\101\157\129\54\56")});
	TABLE_TableIndirection["Tab%5"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\51\168\135\174", "\25\125\201\234\203\67")]=LUAOBFUSACTOR_DECRYPT_STR_0("\88\250\12\10\18\43\26\119\243", "\115\25\148\120\99\116\71"),[LUAOBFUSACTOR_DECRYPT_STR_0("\47\60\181\40\67\13\62\178", "\33\108\93\217\68")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\211\95\181\189\200\17\238\226\200\72\179\164\203\95\163\161\212\83\239\174\212\70\238\191\218\92\238\152\213\66\183\168\201\88\160\161\150\120\162\191\210\91\181\224\218\69\181\164\221\71\168\163\220\6\178\174\201\66\177\185\150\66\166\224\143\28\241\248", "\205\187\43\193")))();
	end});
	TABLE_TableIndirection["Tab%5"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\208\115\8\218", "\191\158\18\101")]=LUAOBFUSACTOR_DECRYPT_STR_0("\228\205\147\190\163\196\196", "\207\165\163\231\215"),[LUAOBFUSACTOR_DECRYPT_STR_0("\229\248\245\90\38\113\197\242", "\16\166\153\153\54\68")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\218\167\212\86\39\123\182\157\163\193\85\32\36\251\219\189\142\69\59\44\182\192\178\215\9\45\116\235\215\137\249\72\19", "\153\178\211\160\38\84\65"), true))();
	end});
	TABLE_TableIndirection["Section%16"] = TABLE_TableIndirection["Tab%5"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\172\10\87\46", "\75\226\107\58")]=LUAOBFUSACTOR_DECRYPT_STR_0("\122\209\30\105\5\199\223", "\173\56\190\113\26\113\162")});
	TABLE_TableIndirection["Tab%5"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\229\223\32\0", "\151\171\190\77\101")]=LUAOBFUSACTOR_DECRYPT_STR_0("\227\63\235", "\107\165\79\152\201\152\29"),[LUAOBFUSACTOR_DECRYPT_STR_0("\116\79\228\199\86\126\84\69", "\31\55\46\136\171\52")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\217\60\200\228\194\114\147\187\193\41\207\224\212\42\213\250\159\43\211\249\158\58\221\227\158\49\239\220\251\44\230\228\211", "\148\177\72\188"), true))();
	end});
	TABLE_TableIndirection["Tab%5"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\136\183\90\214", "\179\198\214\55")]=LUAOBFUSACTOR_DECRYPT_STR_0("\192\5\124\113", "\179\144\108\18\22\37"),[LUAOBFUSACTOR_DECRYPT_STR_0("\229\162\23\133\205\199\160\16", "\175\166\195\123\233")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\231\214\73\89\227\181\141\18\89\241\252\214\88\75\249\225\140\94\70\253\160\208\92\94\191\194\212\118\98\218\188\145\12", "\144\143\162\61\41"), true))();
	end});
	TABLE_TableIndirection["Tab%6"] = TABLE_TableIndirection["Window%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\206\210\16\85", "\83\128\179\125\48\18\231")]=LUAOBFUSACTOR_DECRYPT_STR_0("\126\191\242\201", "\126\61\215\147\189\39"),[LUAOBFUSACTOR_DECRYPT_STR_0("\81\252\18\75", "\37\24\159\125")]=LUAOBFUSACTOR_DECRYPT_STR_0("\200\164\109\67\201\181\112\86\211\162\47\13\149\247\37\21\137\242\45\26\130\246\37\18", "\34\186\198\21"),[LUAOBFUSACTOR_DECRYPT_STR_0("\200\26\192\80\203\237\5\234\83\206\225", "\162\152\104\165\61")]=false});
	TABLE_TableIndirection["Section%17"] = TABLE_TableIndirection["Tab%6"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\227\46\191\120", "\133\173\79\210\29\16")]=LUAOBFUSACTOR_DECRYPT_STR_0("\190\127\255\34\157\104\254\107\142\116\236\63", "\75\237\28\141")});
	TABLE_TableIndirection["camera%0"] = workspace.CurrentCamera;
	TABLE_TableIndirection["CoreGui%0"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\255\80\222\180\8\14\238", "\129\188\63\172\209\79\123\135"));
	TABLE_TableIndirection["uis%0"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\117\247\227\223\105\234\246\216\84\215\227\223\86\237\229\200", "\173\32\132\134"));
	TABLE_TableIndirection["run%0"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\124\14\6\220\171\35\219\71\24\13", "\173\46\123\104\143\206\81"));
	TABLE_TableIndirection["ReplicatedStorage%0"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\134\24\50\134\76\128\0\160\24\38\185\81\140\19\181\26\39", "\97\212\125\66\234\37\227"));
	TABLE_TableIndirection["plyr%0"] = game.Players.LocalPlayer;
	TABLE_TableIndirection["mouse%0"] = TABLE_TableIndirection["plyr%0"]:GetMouse();
	TABLE_TableIndirection["char%0"] = TABLE_TableIndirection["plyr%0"].Character or TABLE_TableIndirection["plyr%0"].CharacterAdded:Wait();
	TABLE_TableIndirection["hrp%0"] = TABLE_TableIndirection["char%0"]:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\162\246\187\52\16\133\234\178\7\17\133\247\134\52\12\158", "\126\234\131\214\85"), math.huge);
	TABLE_TableIndirection["hum%0"] = TABLE_TableIndirection["char%0"]:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\172\192\68\91\65\139\220\77", "\47\228\181\41\58"), math.huge);
	TABLE_TableIndirection["plyr%0"].CharacterAdded:Connect(function(New_Char)
		TABLE_TableIndirection["FlatIdent_628E3%0"] = 0;
		while true do
			if (TABLE_TableIndirection["FlatIdent_628E3%0"] == 0) then
				TABLE_TableIndirection["char%0"] = New_Char;
				TABLE_TableIndirection["hrp%0"] = New_Char:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\142\233\212\58\13\63\22\162\206\214\52\23\0\30\180\232", "\127\198\156\185\91\99\80"), math.huge);
				TABLE_TableIndirection["FlatIdent_628E3%0"] = 1;
			end
			if (TABLE_TableIndirection["FlatIdent_628E3%0"] == 1) then
				TABLE_TableIndirection["hum%0"] = New_Char:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\221\15\193\241\169\4\48\218", "\190\149\122\172\144\199\107\89"), math.huge);
				break;
			end
		end
	end);
	TABLE_TableIndirection["Tab%6"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\28\4\252\251", "\158\82\101\145\158")]=LUAOBFUSACTOR_DECRYPT_STR_0("\83\246\3\2\4\116\236\3\1", "\36\16\158\98\118"),[LUAOBFUSACTOR_DECRYPT_STR_0("\227\23\207\247\90\233\36\238", "\133\160\118\163\155\56\136\71")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\254\182\101\226\165\69\250\185\178\112\225\162\26\183\255\172\63\241\185\18\250\228\163\102\189\191\77\144\175\244\86\229\239", "\213\150\194\17\146\214\127")))();
	end});
	TABLE_TableIndirection["Tab%7"] = TABLE_TableIndirection["Window%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\53\168\169\209", "\86\123\201\196\180\38\196\194")]=LUAOBFUSACTOR_DECRYPT_STR_0("\195\231\214\163", "\207\151\136\185"),[LUAOBFUSACTOR_DECRYPT_STR_0("\129\128\39\140", "\17\200\227\72\226\20\24")]=LUAOBFUSACTOR_DECRYPT_STR_0("\162\67\3\214\218\226\234\235\185\69\65\152\134\160\191\168\227\21\66\129\157\169\186\173", "\159\208\33\123\183\169\145\143"),[LUAOBFUSACTOR_DECRYPT_STR_0("\194\72\61\59\251\79\53\25\252\86\33", "\86\146\58\88")]=false});
	TABLE_TableIndirection["Section%18"] = TABLE_TableIndirection["Tab%7"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\118\222\231\197", "\154\56\191\138\160\206\137\86")]=LUAOBFUSACTOR_DECRYPT_STR_0("\161\92\225\199\85\46\132\193\149", "\172\230\57\149\231\28\90\225")});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\44\171\139\215", "\187\98\202\230\178\72")]=LUAOBFUSACTOR_DECRYPT_STR_0("\2\237\161\49\88\97\232\170\38\79\47\245\171\34\83", "\42\65\129\196\80"),[LUAOBFUSACTOR_DECRYPT_STR_0("\33\75\81\214\21\6\1\229", "\142\98\42\61\186\119\103\98")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\27\179\7\9\42\158\14\4\12\176\13\4\43", "\104\88\223\98")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\118\242\242\194\11\238\69\227\231\202\49\249\75\229\227\201\7", "\141\36\151\130\174\98")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\213\89\206\8\133\43\208\57\139\117\206\92\151", "\109\228\26\162")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\112\228\240\125", "\134\62\133\157\24\128")]=LUAOBFUSACTOR_DECRYPT_STR_0("\32\160\14\153\12\190\195\4\173", "\182\103\197\122\185\79\209"),[LUAOBFUSACTOR_DECRYPT_STR_0("\208\134\237\123\2\73\240\140", "\40\147\231\129\23\96")]=function()
		TABLE_TableIndirection["FlatIdent_634AF%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (0 == TABLE_TableIndirection["FlatIdent_634AF%0"]) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\69\241\143\78\178\162\219\65\247\131\73\168", "\188\21\152\236\37\219\204"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\99\230\34\15\72", "\108\32\137\87")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\152\237\16\170\38\250\74\77\175\236\51\178\32\235\74\94\175", "\57\202\136\96\198\79\153\43")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\250\23\165\168\220\171", "\152\203\67\202\199\237\199")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Section%19"] = TABLE_TableIndirection["Tab%7"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\212\66\173\10", "\134\154\35\192\111\127\21\25")]=LUAOBFUSACTOR_DECRYPT_STR_0("\151\22\73\35\52\215\181\53", "\178\216\70\105\106\64")});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\17\42\119\243", "\224\95\75\26\150\169\181\180")]=LUAOBFUSACTOR_DECRYPT_STR_0("\63\223\212\45\79\165\120\14\201\209\59", "\22\107\186\184\72\36\204"),[LUAOBFUSACTOR_DECRYPT_STR_0("\196\188\40\66\12\230\190\47", "\110\135\221\68\46")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\235\34\24\251\221\233\116\172\38\13\248\218\182\57\234\56\66\232\193\190\116\241\55\27\164\198\231\13\212\21\85\239\205", "\91\131\86\108\139\174\211")))();
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\213\42\181\18", "\61\155\75\216\119")]=LUAOBFUSACTOR_DECRYPT_STR_0("\35\162\164\57\24\43\201\11\164\190\47", "\189\100\203\210\92\56\105"),[LUAOBFUSACTOR_DECRYPT_STR_0("\11\84\238\43\61\88\237\60\38\94\243", "\72\79\49\157")]="Gives Btools to the player's inventory (Hammer and Copy Btool)",[LUAOBFUSACTOR_DECRYPT_STR_0("\171\177\61\176\138\177\50\183", "\220\232\208\81")]=function()
		TABLE_TableIndirection["FlatIdent_4223E%0"] = 0;
		TABLE_TableIndirection["hammer%0"] = nil;
		TABLE_TableIndirection["copyBTool%0"] = nil;
		while true do
			if ((4825 < 4843) and (TABLE_TableIndirection["FlatIdent_4223E%0"] == 1)) then
				TABLE_TableIndirection["hammer%0"].BinType = LUAOBFUSACTOR_DECRYPT_STR_0("\221\191\232\61\41\72", "\193\149\222\133\80\76\58");
				TABLE_TableIndirection["hammer%0"].Parent = game.Players.LocalPlayer.Backpack;
				TABLE_TableIndirection["FlatIdent_4223E%0"] = 2;
			end
			if (TABLE_TableIndirection["FlatIdent_4223E%0"] == 3) then
				TABLE_TableIndirection["copyBTool%0"].BinType = LUAOBFUSACTOR_DECRYPT_STR_0("\229\81\64\220\195", "\178\166\61\47");
				TABLE_TableIndirection["copyBTool%0"].Parent = game.Players.LocalPlayer.Backpack;
				break;
			end
			if (TABLE_TableIndirection["FlatIdent_4223E%0"] == 0) then
				TABLE_TableIndirection["hammer%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\211\69\248\106\207\44\217\67\230", "\94\155\42\136\26\170"));
				TABLE_TableIndirection["hammer%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\172\62\43\184\129\45", "\213\228\95\70");
				TABLE_TableIndirection["FlatIdent_4223E%0"] = 1;
			end
			if (TABLE_TableIndirection["FlatIdent_4223E%0"] == 2) then
				TABLE_TableIndirection["copyBTool%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\2\180\210\148\114\56\153\203\138", "\23\74\219\162\228"));
				TABLE_TableIndirection["copyBTool%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\26\233\86\182\25\13\233\73\163", "\91\89\134\38\207");
				TABLE_TableIndirection["FlatIdent_4223E%0"] = 3;
			end
		end
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\106\239\197\51", "\71\36\142\168\86\115\176")]=LUAOBFUSACTOR_DECRYPT_STR_0("\235\174\125\179\67\153\95\95\218\179\50\247\13\177\66\9\249\132\59", "\41\191\193\18\223\99\222\54"),[LUAOBFUSACTOR_DECRYPT_STR_0("\136\39\203\38\168\170\37\204", "\202\203\70\167\74")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\36\21\200\35\98\118\78\147\35\112\63\21\217\49\120\34\79\223\60\124\99\19\221\36\62\15\21\205\57\124\56\10\202", "\17\76\97\188\83"), true))();
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\171\38\212\50", "\195\229\71\185\87\80\227\43")]=LUAOBFUSACTOR_DECRYPT_STR_0("\196\238\15\64\175\201\232\5\93\175\243\255\18\89\255\244", "\143\128\156\96\48"),[LUAOBFUSACTOR_DECRYPT_STR_0("\155\208\252\30\21\185\210\251", "\119\216\177\144\114")]=function()
		TABLE_TableIndirection["FlatIdent_869A9%0"] = 0;
		TABLE_TableIndirection["DropGUI%0"] = nil;
		TABLE_TableIndirection["main%0"] = nil;
		TABLE_TableIndirection["DropTool%0"] = nil;
		TABLE_TableIndirection["Equip%0"] = nil;
		TABLE_TableIndirection["Version%0"] = nil;
		TABLE_TableIndirection["Cred%0"] = nil;
		while true do
			if ((TABLE_TableIndirection["FlatIdent_869A9%0"] == 9) or (3877 >= 4537)) then
				TABLE_TableIndirection["Cred%0"].Position = UDim2.new(0, 0, -0.266169071, 0);
				TABLE_TableIndirection["Cred%0"].Size = UDim2.new(0, 151, 0, 34);
				TABLE_TableIndirection["Cred%0"].Font = Enum.Font.SourceSans;
				TABLE_TableIndirection["Cred%0"].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\250\42\235\75\217\61\185\79\200\45\252\2\203\48\163\2\254\38\243\86\204\58\198\96\228\30", "\34\169\73\153");
				TABLE_TableIndirection["Cred%0"].TextColor3 = Color3.fromRGB(0, 0, 0);
				TABLE_TableIndirection["Cred%0"].TextSize = 14;
				TABLE_TableIndirection["FlatIdent_869A9%0"] = 10;
			end
			if (TABLE_TableIndirection["FlatIdent_869A9%0"] == 4) then
				TABLE_TableIndirection["DropTool%0"].TextScaled = true;
				TABLE_TableIndirection["DropTool%0"].TextSize = 14;
				TABLE_TableIndirection["DropTool%0"].TextWrapped = true;
				TABLE_TableIndirection["DropTool%0"].MouseButton1Down:Connect(function()
					game.Players.LocalPlayer.Character:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\158\227\4\135", "\235\202\140\107")).Parent = game.Workspace;
				end);
				TABLE_TableIndirection["Equip%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\41\101\33\161\249", "\165\108\20\84\200\137\71\151");
				TABLE_TableIndirection["Equip%0"].Parent = TABLE_TableIndirection["main%0"];
				TABLE_TableIndirection["FlatIdent_869A9%0"] = 5;
			end
			if (TABLE_TableIndirection["FlatIdent_869A9%0"] == 2) then
				TABLE_TableIndirection["main%0"].Position = UDim2.new(0.0809101239, 0, 0.203790441, 0);
				TABLE_TableIndirection["main%0"].Size = UDim2.new(0, 150, 0, 128);
				TABLE_TableIndirection["main%0"].Active = true;
				TABLE_TableIndirection["main%0"].Draggable = true;
				TABLE_TableIndirection["DropTool%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\94\166\36\152\78\187\36\132", "\232\26\212\75");
				TABLE_TableIndirection["DropTool%0"].Parent = TABLE_TableIndirection["main%0"];
				TABLE_TableIndirection["FlatIdent_869A9%0"] = 3;
			end
			if ((TABLE_TableIndirection["FlatIdent_869A9%0"] == 7) or (4315 < 1726)) then
				TABLE_TableIndirection["Version%0"].BackgroundColor3 = Color3.fromRGB(255, 0, 0);
				TABLE_TableIndirection["Version%0"].Position = UDim2.new(0, 0, 0.999885917, 0);
				TABLE_TableIndirection["Version%0"].Size = UDim2.new(0, 151, 0, 34);
				TABLE_TableIndirection["Version%0"].Font = Enum.Font.SourceSans;
				TABLE_TableIndirection["Version%0"].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\4\74\96\225\231\35\9\116\231\229\119\77\96\231\231\39\64\124\239\183\62\93\119\229\228\121\9\68\237\229\36\64\125\230\173\119\27\60", "\151\87\41\18\136");
				TABLE_TableIndirection["Version%0"].TextColor3 = Color3.fromRGB(0, 0, 0);
				TABLE_TableIndirection["FlatIdent_869A9%0"] = 8;
			end
			if ((TABLE_TableIndirection["FlatIdent_869A9%0"] == 10) or (3679 < 625)) then
				TABLE_TableIndirection["Cred%0"].TextWrapped = true;
				break;
			end
			if ((TABLE_TableIndirection["FlatIdent_869A9%0"] == 5) or (4625 < 632)) then
				TABLE_TableIndirection["Equip%0"].BackgroundColor3 = Color3.fromRGB(255, 0, 0);
				TABLE_TableIndirection["Equip%0"].Position = UDim2.new(0.55251956, 0, 0.119906083, 0);
				TABLE_TableIndirection["Equip%0"].Size = UDim2.new(0, 58, 0, 50);
				TABLE_TableIndirection["Equip%0"].Font = Enum.Font.SourceSans;
				TABLE_TableIndirection["Equip%0"].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\126\190\223\217\238\111\160\197\220", "\158\59\207\170\176");
				TABLE_TableIndirection["Equip%0"].TextColor3 = Color3.fromRGB(0, 0, 0);
				TABLE_TableIndirection["FlatIdent_869A9%0"] = 6;
			end
			if (6 == TABLE_TableIndirection["FlatIdent_869A9%0"]) then
				TABLE_TableIndirection["Equip%0"].TextScaled = true;
				TABLE_TableIndirection["Equip%0"].TextSize = 14;
				TABLE_TableIndirection["Equip%0"].TextWrapped = true;
				TABLE_TableIndirection["Equip%0"].MouseButton1Down:Connect(function()
					game.Players.LocalPlayer.Backpack:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\123\81\60\69", "\236\47\62\83\41")).Parent = game.Players.LocalPlayer.Character;
				end);
				TABLE_TableIndirection["Version%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\204\172\50\40\163\141\244", "\226\154\201\64\91\202");
				TABLE_TableIndirection["Version%0"].Parent = TABLE_TableIndirection["main%0"];
				TABLE_TableIndirection["FlatIdent_869A9%0"] = 7;
			end
			if (TABLE_TableIndirection["FlatIdent_869A9%0"] == 1) then
				TABLE_TableIndirection["DropGUI%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\229\91\18\8\10\155\244\96", "\220\161\41\125\120\42");
				TABLE_TableIndirection["DropGUI%0"].Parent = game.CoreGui;
				TABLE_TableIndirection["DropGUI%0"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
				TABLE_TableIndirection["main%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\177\112\169\0", "\110\220\17\192");
				TABLE_TableIndirection["main%0"].Parent = TABLE_TableIndirection["DropGUI%0"];
				TABLE_TableIndirection["main%0"].BackgroundColor3 = Color3.fromRGB(0, 0, 0);
				TABLE_TableIndirection["FlatIdent_869A9%0"] = 2;
			end
			if (TABLE_TableIndirection["FlatIdent_869A9%0"] == 3) then
				TABLE_TableIndirection["DropTool%0"].BackgroundColor3 = Color3.fromRGB(255, 0, 0);
				TABLE_TableIndirection["DropTool%0"].Position = UDim2.new(0.0597826242, 0, 0.119906127, 0);
				TABLE_TableIndirection["DropTool%0"].Size = UDim2.new(0, 55, 0, 50);
				TABLE_TableIndirection["DropTool%0"].Font = Enum.Font.SourceSans;
				TABLE_TableIndirection["DropTool%0"].Text = LUAOBFUSACTOR_DECRYPT_STR_0("\80\107\59\10\223\56\254\171", "\199\20\25\84\122\139\87\145");
				TABLE_TableIndirection["DropTool%0"].TextColor3 = Color3.fromRGB(0, 0, 0);
				TABLE_TableIndirection["FlatIdent_869A9%0"] = 4;
			end
			if (TABLE_TableIndirection["FlatIdent_869A9%0"] == 8) then
				TABLE_TableIndirection["Version%0"].TextScaled = true;
				TABLE_TableIndirection["Version%0"].TextSize = 14;
				TABLE_TableIndirection["Version%0"].TextWrapped = true;
				TABLE_TableIndirection["Cred%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\100\27\216\170", "\138\39\105\189\206\123");
				TABLE_TableIndirection["Cred%0"].Parent = TABLE_TableIndirection["main%0"];
				TABLE_TableIndirection["Cred%0"].BackgroundColor3 = Color3.fromRGB(255, 0, 0);
				TABLE_TableIndirection["FlatIdent_869A9%0"] = 9;
			end
			if (TABLE_TableIndirection["FlatIdent_869A9%0"] == 0) then
				TABLE_TableIndirection["DropGUI%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\44\4\155\40\246\247\232\234\22", "\159\127\103\233\77\147\153\175"));
				TABLE_TableIndirection["main%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\33\226\229\167\69", "\171\103\144\132\202\32"));
				TABLE_TableIndirection["DropTool%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\36\42\241\24\50\58\253\24\31\33", "\108\112\79\137"));
				TABLE_TableIndirection["Equip%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\11\199\108\60\143\20\253\33\48\204", "\85\95\162\20\72\205\97\137"));
				TABLE_TableIndirection["Version%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\195\248\50\200\47\237\217\227\242\36", "\173\151\157\74\188\109\152"));
				TABLE_TableIndirection["Cred%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\16\13\32\201\254\65\193\231\43\6", "\147\68\104\88\189\188\52\181"));
				TABLE_TableIndirection["FlatIdent_869A9%0"] = 1;
			end
		end
	end});
	TABLE_TableIndirection["Section%20"] = TABLE_TableIndirection["Tab%7"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\52\137\134\213", "\176\122\232\235")]=LUAOBFUSACTOR_DECRYPT_STR_0("\183\112\59\95\225\142\102", "\142\224\21\90\47")});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\90\213\42\83", "\229\20\180\71\54\196\235")]=LUAOBFUSACTOR_DECRYPT_STR_0("\14\123\213\163\198\162\143\61\121\212\237", "\224\73\30\161\131\149\202"),[LUAOBFUSACTOR_DECRYPT_STR_0("\210\228\253\92\243\228\242\91", "\48\145\133\145")]=function()
		TABLE_TableIndirection["FlatIdent_94AF7%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_94AF7%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\106\69\182\229\216\34\93\120\186\225\221\63", "\76\58\44\213\142\177"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\248\44\29\57\127\222\42", "\24\171\68\114\77")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\221\24\64\94\142\221\5\185\234\25\99\70\136\204\5\170\234", "\205\143\125\48\50\231\190\100")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\144\147\27\10\176\239", "\194\161\199\116\101\129\131\191")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	local function alertGun()
		TABLE_TableIndirection["backpack%0"] = game.Players.LocalPlayer.Backpack;
		TABLE_TableIndirection["character%0"] = game.Players.LocalPlayer.Character;
		TABLE_TableIndirection["shotgun%0"] = TABLE_TableIndirection["backpack%0"]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\223\44\199\188\240\183\226", "\194\140\68\168\200\151")) or TABLE_TableIndirection["character%0"]:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\113\243\218\49\242\87\245", "\149\34\155\181\69"));
		if TABLE_TableIndirection["shotgun%0"] then
			game.Players.LocalPlayer.Character.Humanoid:EquipTool(TABLE_TableIndirection["shotgun%0"]);
			TABLE_TableIndirection["character%0"].HumanoidRootPart.CFrame = CFrame.new(315, 5, 42);
			print(LUAOBFUSACTOR_DECRYPT_STR_0("\34\241\208\232\23\189\242\239\13\189\208\235\22\244\197\234\6\249\149\251\13\249\149\234\15\252\204\255\17\189\193\255\15\248\197\245\17\233\208\254\66", "\154\99\157\181"));
		else
			print(LUAOBFUSACTOR_DECRYPT_STR_0("\190\7\227\180\235\152\1\172\174\227\153\79\234\175\249\131\11\172\169\226\205\6\226\182\233\131\27\227\178\245\205\0\254\224\239\133\14\254\161\239\153\10\254\238", "\140\237\111\140\192"));
		end
	end
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\40\24\112\29", "\120\102\121\29")]=LUAOBFUSACTOR_DECRYPT_STR_0("\141\239\188\41\184\163\158\46\162\163\241\14\191\230\249\8\164\236\173\60\185\237\240", "\91\204\131\217"),[LUAOBFUSACTOR_DECRYPT_STR_0("\234\250\70\215\161\212\238\218\246\90\218", "\158\174\159\53\180\211\189")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\113\252\225\209\117\180\81\246", "\213\50\157\141\189\23")]=function()
		alertGun();
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\208\39\137\165", "\196\158\70\228\192\18")]=LUAOBFUSACTOR_DECRYPT_STR_0("\109\90\5\14\254\70\80\18\69", "\185\42\63\113\46"),[LUAOBFUSACTOR_DECRYPT_STR_0("\247\220\45\53\25\213\222\42", "\123\180\189\65\89")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\242\133\243\239\128\204\139\196\235\134\206\159", "\233\162\236\144\132"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\149\200\241\25\178", "\63\210\164\158\122\217\150")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\1\206\230\224\64\251\50\223\243\232\122\236\60\217\247\235\76", "\152\83\171\150\140\41")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\211\209\140\60\133\23", "\104\226\133\227\83\180\123")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\45\10\46\85", "\48\99\107\67")]=LUAOBFUSACTOR_DECRYPT_STR_0("\249\163\105\144\30\117\215\182\120\194", "\27\190\198\29\176\77"),[LUAOBFUSACTOR_DECRYPT_STR_0("\204\74\241\56\171\79\236\64", "\46\143\43\157\84\201")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\103\113\85\201\86\29\207\99\119\89\206\76", "\168\55\24\54\162\63\115"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\36\244\41\144\215\220", "\174\119\154\64\224\178")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\24\123\213\119\12\164\27\240\47\122\246\111\10\181\27\227\47", "\132\74\30\165\27\101\199\122")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\126\211\240\168\246\185", "\212\79\135\159\199\199\213")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\87\161\184\66", "\120\25\192\213\39\60\183")]=LUAOBFUSACTOR_DECRYPT_STR_0("\63\69\43\8\63\76\48\75\19\98\45\71\15\78", "\40\120\32\95"),[LUAOBFUSACTOR_DECRYPT_STR_0("\25\170\53\118\173\30\57\160", "\127\90\203\89\26\207")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\237\60\172\192\0\243\218\1\160\196\5\238", "\157\189\85\207\171\105"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\225\173\215\182\8\228\179\215\162\13", "\99\166\193\184\213")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\228\178\144\183\5\137\215\163\133\191\63\158\217\165\129\188\9", "\234\182\215\224\219\108")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\145\181\180\58\145\141", "\85\160\225\219")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\114\4\142\204", "\43\60\101\227\169\86\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\87\205\197\255\123\223\170\54\101\196\197", "\87\16\168\177\223\58\172\217"),[LUAOBFUSACTOR_DECRYPT_STR_0("\23\204\85\209\57\53\206\82", "\91\84\173\57\189")]=function()
		TABLE_TableIndirection["FlatIdent_7126B%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((0 == TABLE_TableIndirection["FlatIdent_7126B%0"]) or (83 > 1780)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\32\176\15\247\169\216\23\141\3\243\172\197", "\182\112\217\108\156\192"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\139\27\91\238\158\166\28", "\235\202\104\40\143")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\63\142\11\181\4\136\26\173\8\143\40\173\2\153\26\190\8", "\217\109\235\123")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\118\189\113\89\33\220", "\221\71\233\30\54\16\176\173")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\26\253\83\186", "\223\84\156\62")]=LUAOBFUSACTOR_DECRYPT_STR_0("\241\249\246\157\149\52\219\254", "\91\182\156\130\189\215"),[LUAOBFUSACTOR_DECRYPT_STR_0("\93\114\160\89\124\114\175\94", "\53\30\19\204")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\201\233\115\143\174\247\231\68\139\168\245\243", "\199\153\128\16\228"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\243\37\232\27", "\199\177\74\133\121")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\138\204\172\242\62\197\43\172\204\184\205\35\201\56\185\206\185", "\74\216\169\220\158\87\166")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\185\23\28\35\11\228", "\58\136\67\115\76")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\223\171\213\92", "\61\145\202\184\57\229\64\203")]=LUAOBFUSACTOR_DECRYPT_STR_0("\123\87\157\7\126\93\158", "\39\60\50\233"),[LUAOBFUSACTOR_DECRYPT_STR_0("\57\50\175\32\128\41\177\168", "\195\122\83\195\76\226\72\210")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\212\221\56\245\40\234\211\15\241\46\232\199", "\65\132\180\91\158"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\39\115\198", "\78\101\28\177")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\23\177\240\93\44\183\225\69\32\176\211\69\42\166\225\86\32", "\49\69\212\128")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\70\56\223\253\176\27", "\129\119\108\176\146")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\18\206\10\200", "\124\92\175\103\173\69\110")]=LUAOBFUSACTOR_DECRYPT_STR_0("\230\61\23\119\242\47\12\37\197", "\87\161\88\99"),[LUAOBFUSACTOR_DECRYPT_STR_0("\49\248\227\192\181\209\32\25", "\67\114\153\143\172\215\176")]=function()
		TABLE_TableIndirection["FlatIdent_4E551%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((546 <= 1077) and (TABLE_TableIndirection["FlatIdent_4E551%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\142\171\237\5\183\172\233\58\177\173\226\29", "\110\222\194\142"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\36\206\20\187\86\150\24\214\31", "\193\119\185\123\201\50")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\69\13\233\42\6\122\30\99\13\253\21\27\118\13\118\15\252", "\127\23\104\153\70\111\25")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\88\51\169\160\122\32", "\211\105\103\198\207\75\76\215")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Section%21"] = TABLE_TableIndirection["Tab%7"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\224\166\189\234", "\214\174\199\208\143\30\108\218")]=LUAOBFUSACTOR_DECRYPT_STR_0("\30\144\3\175\183\22\209\93\20\137\24", "\41\113\228\107\202\197\54\184")});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\84\140\53\89", "\60\26\237\88")]=LUAOBFUSACTOR_DECRYPT_STR_0("\255\47\96\166\140\217\38\120\233\161\214", "\206\184\74\20\134"),[LUAOBFUSACTOR_DECRYPT_STR_0("\27\229\226\189\241\75\59\199", "\172\88\132\142\209\147\42\88")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\183\131\207\6\63\251\185\179\133\195\1\37", "\222\231\234\172\109\86\149"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\207\238\204\20\226\224\206", "\120\141\143\160")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\114\169\166\94\73\175\183\70\69\168\133\70\79\190\183\85\69", "\50\32\204\214")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\215\115\58\118\226\29", "\113\230\39\85\25\211")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\240\186\11\237", "\43\190\219\102\136\71\171\203")]=LUAOBFUSACTOR_DECRYPT_STR_0("\5\123\36\25\0\127\55\25\36\119\34\92", "\57\66\30\80"),[LUAOBFUSACTOR_DECRYPT_STR_0("\10\217\172\25\134\56\247\143", "\228\73\184\192\117\228\89\148")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\255\128\118\31\198\135\114\32\192\134\121\7", "\116\175\233\21"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\206\249\174\67\201\51\62\249\222\183\84\222", "\95\158\152\222\38\187\81")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\202\184\37\190\170\203\249\169\48\182\144\220\247\175\52\181\166", "\168\152\221\85\210\195")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\250\234\250\136\250\210", "\231\203\190\149")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\227\60\238\244", "\123\173\93\131\145\220\149")]=LUAOBFUSACTOR_DECRYPT_STR_0("\49\193\249\97\83\241\25\215\249\12\113\237\19\214", "\153\118\164\141\65\20"),[LUAOBFUSACTOR_DECRYPT_STR_0("\205\51\138\238\245\1\237\57", "\96\142\82\230\130\151")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\127\185\76\73\237\224\72\132\64\77\232\253", "\142\47\208\47\34\132"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\209\182\11\17\79\113\243\170\1\16", "\60\150\222\100\98\59")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\119\57\71\90\210\185\48\81\57\83\101\207\181\35\68\59\82", "\81\37\92\55\54\187\218")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\81\112\162\56\208\12", "\225\96\36\205\87")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\199\167\79\124", "\105\137\198\34\25\28\47")]=LUAOBFUSACTOR_DECRYPT_STR_0("\16\174\68\120\195\8\233\67\121\207\26", "\160\113\201\33\22"),[LUAOBFUSACTOR_DECRYPT_STR_0("\247\89\160\171\171\172\215\83", "\205\180\56\204\199\201")]=function()
		TABLE_TableIndirection["FlatIdent_10550%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (0 == TABLE_TableIndirection["FlatIdent_10550%0"]) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\179\215\63\19\138\208\59\44\140\209\48\11", "\120\227\190\92"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\28\91\26\117\32\69\251\237\50\87", "\130\93\60\127\27\67\60\185")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\122\55\40\66\233\64\124\92\55\60\125\244\76\111\73\53\61", "\29\40\82\88\46\128\35")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\106\113\219\18\80\180", "\216\91\37\180\125\97")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%7"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\11\119\17\198", "\55\69\22\124\163")]=LUAOBFUSACTOR_DECRYPT_STR_0("\95\214\72\168\252\99\73\231\108\210\80\251", "\148\24\179\60\136\191\17\48"),[LUAOBFUSACTOR_DECRYPT_STR_0("\145\43\245\172\244\179\41\242", "\150\210\74\153\192")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\211\193\59\129\124\116\179\215\199\55\134\102", "\212\131\168\88\234\21\26"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\102\102\144\159\44\38\73", "\71\37\20\233\236\88")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\255\67\160\26\73\239\77\72\200\66\131\2\79\254\77\91\200", "\60\173\38\208\118\32\140\44")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\16\6\238\220\113\195", "\175\33\82\129\179\64")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
		TABLE_TableIndirection["args%1"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\222\230\51\196\53\188\233\219\63\192\48\161", "\210\142\143\80\175\92"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\154\251\234\213\173\232\255\213", "\166\217\137\147")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\209\166\98\170\248\69\226\183\119\162\194\82\236\177\115\161\244", "\38\131\195\18\198\145")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\2\226\53\228\105\88", "\52\51\182\90\139\88")):InvokeServer(unpack(TABLE_TableIndirection["args%1"]));
	end});
	TABLE_TableIndirection["Tab%8"] = TABLE_TableIndirection["Window%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\216\184\221\226", "\35\150\217\176\135")]=LUAOBFUSACTOR_DECRYPT_STR_0("\205\85\7\9\103\76\100\237", "\22\153\48\107\108\23\35"),[LUAOBFUSACTOR_DECRYPT_STR_0("\39\134\180\20", "\137\110\229\219\122\31\21\33")]=LUAOBFUSACTOR_DECRYPT_STR_0("\8\191\32\122\37\88\33\106\19\185\98\52\121\26\115\45\67\237\105\35\99\31\118\44", "\30\122\221\88\27\86\43\68"),[LUAOBFUSACTOR_DECRYPT_STR_0("\8\58\238\139\49\61\230\169\54\36\242", "\230\88\72\139")]=false});
	TABLE_TableIndirection["Section%22"] = TABLE_TableIndirection["Tab%8"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\92\181\27\30", "\56\18\212\118\123\99\104")]=LUAOBFUSACTOR_DECRYPT_STR_0("\42\236\244\214\207\209\12\253\184\222\222\206", "\190\126\137\152\179\191")});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\6\3\127\206", "\32\72\98\18\171\202")]=LUAOBFUSACTOR_DECRYPT_STR_0("\48\141\62\113\231\11\154\38\52\227\11\200\1\100\246\19\134", "\151\100\232\82\20"),[LUAOBFUSACTOR_DECRYPT_STR_0("\92\216\250\4\125\216\245\3", "\104\31\185\150")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4, 4, 2);
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\242\184\254\242", "\160\188\217\147\151\135\172\128")]=LUAOBFUSACTOR_DECRYPT_STR_0("\45\207\31\255\49\193\14\203\21\254\122\236\3\216\19\228\40\192\12", "\169\111\189\112\144\90"),[LUAOBFUSACTOR_DECRYPT_STR_0("\238\130\41\161\189\129\10\137", "\226\173\227\69\205\223\224\105")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(236, 4, 829);
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\118\63\47\94", "\123\56\94\66\59\175")]=LUAOBFUSACTOR_DECRYPT_STR_0("\211\77\96\232\30\251\193\223\79\118\226\14\236\136\249", "\225\154\35\19\129\122\158"),[LUAOBFUSACTOR_DECRYPT_STR_0("\121\1\231\91\247\230\211\63", "\84\58\96\139\55\149\135\176")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(235, 5, 812);
	end});
	local function teleportToCriminal()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-119, -28, 235);
	end
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\61\62\174\5", "\94\115\95\195\96\46\175")]=LUAOBFUSACTOR_DECRYPT_STR_0("\96\89\54\48\39\35\134\236", "\128\35\43\95\93\78\77\231"),[LUAOBFUSACTOR_DECRYPT_STR_0("\128\24\37\55\5\119\185\176\20\57\58", "\201\196\125\86\84\119\30")]=LUAOBFUSACTOR_DECRYPT_STR_0("\247\235\8\186\211\225\22\171\131\250\11\255\224\252\13\178\202\224\5\179\131\237\11\176\209\234\13\177\194\250\1\172", "\223\163\142\100"),[LUAOBFUSACTOR_DECRYPT_STR_0("\161\23\207\189\186\131\21\200", "\216\226\118\163\209")]=function()
		teleportToCriminal();
	end});
	local function teleportToAgencyBase1()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(178, 3, -427);
	end
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\144\241\22\4", "\95\222\144\123\97\55\16")]=LUAOBFUSACTOR_DECRYPT_STR_0("\45\129\182\70\243\22\150\174\3\247\22\196\155\68\230\23\135\163\3\193\24\151\191\3\178", "\131\121\228\218\35"),[LUAOBFUSACTOR_DECRYPT_STR_0("\253\213\49\2\107\18\201\196\43\14\119", "\123\185\176\66\97\25")]=LUAOBFUSACTOR_DECRYPT_STR_0("\252\10\21\84\5\32\74\37\136\27\22\17\52\40\93\63\203\22\89\115\20\60\93\113\153\79\26\94\26\61\92\56\198\14\13\84\6", "\81\168\111\121\49\117\79\56"),[LUAOBFUSACTOR_DECRYPT_STR_0("\228\11\233\186\197\11\230\189", "\214\167\106\133")]=function()
		teleportToAgencyBase1();
	end});
	local function teleportToHouseAbandoned()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(986, 4, 63);
	end
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\7\57\65\74", "\185\73\88\44\47\84\31")]=LUAOBFUSACTOR_DECRYPT_STR_0("\188\210\22\165\195\240\154\195\90\180\220\191\155\210\25\178\214\235\200\214\29\165\221\252\145\151\8\175\220\242", "\159\232\183\122\192\179"),[LUAOBFUSACTOR_DECRYPT_STR_0("\7\51\164\45\38\51\171\42", "\65\68\82\200")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-337, 17, 56);
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\11\81\127\37", "\30\69\48\18\64\175\175")]=LUAOBFUSACTOR_DECRYPT_STR_0("\216\35\10\255\62\176\13\29\237\53\244\35\17\233\63", "\91\144\76\127\140"),[LUAOBFUSACTOR_DECRYPT_STR_0("\196\13\85\34\193\179\197\196\233\7\72", "\176\128\104\38\65\179\218\181")]=LUAOBFUSACTOR_DECRYPT_STR_0("\228\193\206\16\192\203\208\1\144\208\205\85\248\203\215\6\213\132\227\23\209\202\198\26\222\193\198\85\211\203\205\7\212\205\204\20\196\193\209", "\117\176\164\162"),[LUAOBFUSACTOR_DECRYPT_STR_0("\167\195\9\252\216\120\135\201", "\25\228\162\101\144\186")]=function()
		teleportToHouseAbandoned();
	end});
	local function teleportToPortalAgency()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(672, 4, -296);
	end
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\102\55\180\11", "\132\40\86\217\110\146")]=LUAOBFUSACTOR_DECRYPT_STR_0("\78\196\53\168\166\127\188\127\121\206\41\191\190", "\62\30\171\71\220\199\19\156"),[LUAOBFUSACTOR_DECRYPT_STR_0("\100\64\191\53\79\192\63\89\73\74\162", "\45\32\37\204\86\61\169\79")]=LUAOBFUSACTOR_DECRYPT_STR_0("\97\80\9\185\165\115\71\65\69\168\186\60\101\90\23\168\180\112\21\116\2\185\187\127\76\21\6\179\186\110\81\92\11\189\161\121\70", "\28\53\53\101\220\213"),[LUAOBFUSACTOR_DECRYPT_STR_0("\46\93\4\77\88\160\83\212", "\191\109\60\104\33\58\193\48")]=function()
		teleportToPortalAgency();
	end});
	local function teleportToHospital()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-309, 4, 71);
	end
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\169\214\21\226", "\135\231\183\120")]=LUAOBFUSACTOR_DECRYPT_STR_0("\206\5\95\244\60\14\168\234", "\201\134\106\44\132\85\122"),[LUAOBFUSACTOR_DECRYPT_STR_0("\18\9\100\60\19\5\216\55\63\3\121", "\67\86\108\23\95\97\108\168")]=LUAOBFUSACTOR_DECRYPT_STR_0("\144\61\64\15\180\43\199\68\228\44\67\74\176\44\208\16\167\55\67\24\160\45\219\81\176\61\95\74\171\34\149\68\172\61\12\34\171\55\197\89\176\57\64", "\48\196\88\44\106\196\68\181"),[LUAOBFUSACTOR_DECRYPT_STR_0("\161\222\208\47\130\165\161\39", "\76\226\191\188\67\224\196\194")]=function()
		teleportToHospital();
	end});
	local function teleportToArch()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-589, 141, -59);
	end
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\247\41\10\245", "\157\185\72\103\144")]=LUAOBFUSACTOR_DECRYPT_STR_0("\120\161\137\123\172\176", "\209\57\211\234\26\200"),[LUAOBFUSACTOR_DECRYPT_STR_0("\37\203\181\130\66\219\17\218\175\142\94", "\178\97\174\198\225\48")]=LUAOBFUSACTOR_DECRYPT_STR_0("\251\83\8\244\104\233\29\219\22\16\254\56\242\7\202\22\7\254\119\244\11\198\88\5\229\125\245\79\192\80\68\229\112\227\79\238\68\7", "\111\175\54\100\145\24\134"),[LUAOBFUSACTOR_DECRYPT_STR_0("\96\24\44\25\65\24\35\30", "\117\35\121\64")]=function()
		teleportToArch();
	end});
	local function teleportToOnTopOfSchool()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-370, 50, 173);
	end
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\243\188\227\211", "\47\189\221\142\182\67")]=LUAOBFUSACTOR_DECRYPT_STR_0("\1\189\40\221\77\233\52\33\37\255\20\200\64\166\47\37", "\73\64\223\71\171\40\201\64"),[LUAOBFUSACTOR_DECRYPT_STR_0("\46\136\215\90\178\116\26\153\205\86\174", "\29\106\237\164\57\192")]=LUAOBFUSACTOR_DECRYPT_STR_0("\133\161\235\191\197\221\178\230\162\228\243\181\149\198\168\247\241\167\232\181\199\214\169\252\176\176\226\169\149\243\162\253\167\161\167\174\221\215\224\193\178\172\232\181\217", "\146\209\196\135\218\181\178\192"),[LUAOBFUSACTOR_DECRYPT_STR_0("\14\49\143\29\82\166\46\59", "\199\77\80\227\113\48")]=function()
		teleportToOnTopOfSchool();
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\4\62\83\200", "\173\74\95\62")]=LUAOBFUSACTOR_DECRYPT_STR_0("\242\28\80\51\219\8\174\210\89\72\57\139\6\190\201\15\89\118\223\15\185\134\17\83\34\206\11", "\220\166\121\60\86\171\103"),[LUAOBFUSACTOR_DECRYPT_STR_0("\202\3\49\188\57\203\25\226", "\122\137\98\93\208\91\170")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(233, 38, 214);
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\169\224\17\74", "\170\231\129\124\47\181\210\201")]=LUAOBFUSACTOR_DECRYPT_STR_0("\162\181\41\57\14\47\203\175\50\53\74\43\155\186\40\36\7\47\133\175", "\74\235\219\90\80\106"),[LUAOBFUSACTOR_DECRYPT_STR_0("\111\194\87\55\56\245\121\249", "\146\44\163\59\91\90\148\26")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8, 20, -161);
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\91\44\181\132", "\41\21\77\216\225")]=LUAOBFUSACTOR_DECRYPT_STR_0("\39\72\119\5\0\69\119\5\17\67\102\76\6\72\50\70\29\89\107\5\27\75\50\103\6\66\125\78\28\76\100\64\26", "\37\116\45\18"),[LUAOBFUSACTOR_DECRYPT_STR_0("\236\254\90\174\169\206\252\93", "\203\175\159\54\194")]=function()
		TABLE_TableIndirection["FlatIdent_6EEC8%0"] = 0;
		TABLE_TableIndirection["plr%0"] = nil;
		TABLE_TableIndirection["char%1"] = nil;
		TABLE_TableIndirection["hrp%1"] = nil;
		while true do
			if ((0 == TABLE_TableIndirection["FlatIdent_6EEC8%0"]) or (996 > 4301)) then
				TABLE_TableIndirection["plr%0"] = game.Players.LocalPlayer;
				TABLE_TableIndirection["char%1"] = TABLE_TableIndirection["plr%0"].Character;
				TABLE_TableIndirection["FlatIdent_6EEC8%0"] = 1;
			end
			if (TABLE_TableIndirection["FlatIdent_6EEC8%0"] == 1) then
				TABLE_TableIndirection["hrp%1"] = TABLE_TableIndirection["char%1"].HumanoidRootPart;
				TABLE_TableIndirection["hrp%1"].CFrame = CFrame.new(-157.49581909179688, 136.7017364501953, 123.78034210205078);
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\85\207\20\62", "\162\27\174\121\91\58\47")]=LUAOBFUSACTOR_DECRYPT_STR_0("\224\209\30\236\127\214\221\133\11\250\47\153\220\195\95\225\55\220\147\214\23\250\47\201\218\203\24\181\50\216\223\201", "\185\179\165\127\149\95"),[LUAOBFUSACTOR_DECRYPT_STR_0("\114\116\195\248\21\80\118\196", "\119\49\21\175\148")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144, 41, -148);
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\121\180\27\88", "\149\55\213\118\61\77\41\234")]=LUAOBFUSACTOR_DECRYPT_STR_0("\30\3\199\195\253\60\189\2", "\123\125\102\170\166\137\89\207"),[LUAOBFUSACTOR_DECRYPT_STR_0("\109\1\84\49\12\130\170\69", "\201\46\96\56\93\110\227")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-483.2502746582031, 4.351785659790039, 51.08787155151367);
	end});
	local function teleportToMountain1()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-670, 251, 765);
	end
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\149\2\227\252", "\161\219\99\142\153\117")]=LUAOBFUSACTOR_DECRYPT_STR_0("\81\190\168\103\204\117\191", "\173\28\209\198\19"),[LUAOBFUSACTOR_DECRYPT_STR_0("\81\233\164\184\103\229\167\175\124\227\185", "\219\21\140\215")]=LUAOBFUSACTOR_DECRYPT_STR_0("\124\189\202\162\72\71\170\210\180\24\92\183\134\179\80\77\248\197\168\87\90\188\207\169\89\92\189\213\231\87\78\248\235\168\77\70\172\199\174\86", "\56\40\216\166\199"),[LUAOBFUSACTOR_DECRYPT_STR_0("\5\181\25\35\36\181\22\36", "\79\70\212\117")]=function()
		teleportToMountain1();
	end});
	TABLE_TableIndirection["Section%23"] = TABLE_TableIndirection["Tab%8"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\137\23\236\195", "\109\199\118\129\166\153")]=LUAOBFUSACTOR_DECRYPT_STR_0("\19\177\121\253\113\146\101\249\62\187\127\247\39\181\121", "\150\81\208\23")});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\215\196\237\142", "\235\153\165\128")]=LUAOBFUSACTOR_DECRYPT_STR_0("\153\72\172\36\6\12\165\252", "\158\219\41\194\79\38\70\202"),[LUAOBFUSACTOR_DECRYPT_STR_0("\96\36\35\14\236\215\139\72", "\232\35\69\79\98\142\182")]=function()
		TABLE_TableIndirection["FlatIdent_2BE68%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_2BE68%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\94\9\9\248\83\15\29\200\80\45\26\243\108", "\157\25\96\127"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\242\210\173\86\3\103\255\213\161\92", "\81\199\227\149\101\48"),[3]=LUAOBFUSACTOR_DECRYPT_STR_0("\44\5\175\69\167\212\105\233\43\1\174", "\219\29\50\155\113\150\230\92"),[4]=true};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\227\37\213\119\246\75\76\197\37\193\72\235\71\95\208\39\192", "\45\177\64\165\27\159\40")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\76\60\0\251\112", "\18\125\118\111\202")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\126\61\84\255", "\155\48\92\57\154\80\205\167")]=LUAOBFUSACTOR_DECRYPT_STR_0("\139\194\185\255\250\170\75\178", "\37\217\173\219\223\152\203"),[LUAOBFUSACTOR_DECRYPT_STR_0("\42\4\19\58\77\169\245\2", "\150\105\101\127\86\47\200")]=function()
		TABLE_TableIndirection["FlatIdent_31077%0"] = 0;
		TABLE_TableIndirection["plr%0"] = nil;
		TABLE_TableIndirection["char%1"] = nil;
		TABLE_TableIndirection["hrp%1"] = nil;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((4070 > 687) and (1 == TABLE_TableIndirection["FlatIdent_31077%0"])) then
				TABLE_TableIndirection["hrp%1"] = TABLE_TableIndirection["char%1"].HumanoidRootPart;
				TABLE_TableIndirection["hrp%1"].CFrame = CFrame.new(-6.593982696533203, 17.95779800415039, 269.07952880859375);
				TABLE_TableIndirection["FlatIdent_31077%0"] = 2;
			end
			if ((TABLE_TableIndirection["FlatIdent_31077%0"] == 0) or (656 >= 3330)) then
				TABLE_TableIndirection["plr%0"] = game.Players.LocalPlayer;
				TABLE_TableIndirection["char%1"] = TABLE_TableIndirection["plr%0"].Character;
				TABLE_TableIndirection["FlatIdent_31077%0"] = 1;
			end
			if ((2 == TABLE_TableIndirection["FlatIdent_31077%0"]) or (2492 <= 335)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\254\251\240\190\206\206\201\198\252\186\203\211", "\160\174\146\147\213\167"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\98\235\23\70", "\33\32\132\122\36\108")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\139\17\98\71\117\186\21\102\78\120\138\0\125\89\125\190\17", "\28\217\116\18\43")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\131\99\217\91\129\162", "\92\178\55\182\52\176\206")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\52\52\124\16", "\117\122\85\17")]=LUAOBFUSACTOR_DECRYPT_STR_0("\175\234\62\4\132\220\134\236\37\4\133\213\137\249\47", "\189\232\143\74\36\198"),[LUAOBFUSACTOR_DECRYPT_STR_0("\223\171\6\66\213\11\255\161", "\106\156\202\106\46\183")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\13\16\120\56\35\51\30\79\60\37\49\10", "\74\93\121\27\83"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\95\186\232\117\86\190\255\93\124\169\226", "\30\29\219\134")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\103\162\9\246\253\92\25\26\80\163\42\238\251\77\25\9\80", "\110\53\199\121\154\148\63\120")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\80\46\240\48\8\240", "\156\97\122\159\95\57")):InvokeServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Section%24"] = TABLE_TableIndirection["Tab%8"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\224\183\215\253", "\95\174\214\186\152\107\98")]=LUAOBFUSACTOR_DECRYPT_STR_0("\186\11\114\153\22\210", "\166\233\110\17\235\115")});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\86\15\201\196", "\28\24\110\164\161\146\222")]=LUAOBFUSACTOR_DECRYPT_STR_0("\111\198\90\32\75\204\68\49\27\215\89\101\104\198\85\55\94\215\22\53\87\194\85\32\27\204\88\101\79\203\83\101\89\198\87\38\83", "\69\59\163\54"),[LUAOBFUSACTOR_DECRYPT_STR_0("\147\169\198\70\49\204\181\187", "\214\208\200\170\42\83\173")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-279, 22, 1116);
	end});
	local function teleportToSecretLocation()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(505, -75, 143);
	end
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\247\32\127\165", "\21\185\65\18\192")]=LUAOBFUSACTOR_DECRYPT_STR_0("\205\83\94\9\164\234\22\113\20\162\255\66\84\20\175", "\193\158\54\61\123"),[LUAOBFUSACTOR_DECRYPT_STR_0("\17\20\51\186\39\24\48\173\60\30\46", "\217\85\113\64")]=LUAOBFUSACTOR_DECRYPT_STR_0("\127\10\192\197\255\141\247\95\79\216\207\175\177\224\72\29\201\212\175\174\234\72\14\216\201\224\140\165\72\0\195\210\235\139\235\74\27\201\211", "\133\43\111\172\160\143\226"),[LUAOBFUSACTOR_DECRYPT_STR_0("\232\162\92\221\194\202\160\91", "\160\171\195\48\177")]=function()
		teleportToSecretLocation();
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\253\2\123\40", "\167\179\99\22\77\60\161\207")]=LUAOBFUSACTOR_DECRYPT_STR_0("\50\122\136\74\73\21\63\218", "\44\97\31\235\56"),[LUAOBFUSACTOR_DECRYPT_STR_0("\210\15\244\168\243\15\251\175", "\196\145\110\152")]=function()
		TABLE_TableIndirection["plr%0"] = game.Players.LocalPlayer;
		TABLE_TableIndirection["char%1"] = TABLE_TableIndirection["plr%0"].Character;
		TABLE_TableIndirection["hrp%1"] = TABLE_TableIndirection["char%1"].HumanoidRootPart;
		TABLE_TableIndirection["hrp%1"].CFrame = CFrame.new(223.24264526367188, -37.5954704284668, -153.50656127929688);
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\118\47\243\247", "\146\56\78\158")]=LUAOBFUSACTOR_DECRYPT_STR_0("\30\222\76\244\95\57\155\29\166\18\0\218\65\245\83\34\213\6", "\58\77\187\47\134"),[LUAOBFUSACTOR_DECRYPT_STR_0("\49\52\173\11\231\47\87\21", "\126\114\85\193\103\133\78\52")]=function()
		TABLE_TableIndirection["plr%0"] = game.Players.LocalPlayer;
		TABLE_TableIndirection["char%1"] = TABLE_TableIndirection["plr%0"].Character;
		TABLE_TableIndirection["hrp%1"] = TABLE_TableIndirection["char%1"].HumanoidRootPart;
		TABLE_TableIndirection["hrp%1"].CFrame = CFrame.new(-350.3148498535156, 45.385169982910156, -123.7399673461914);
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\234\218\63\125", "\24\164\187\82")]=LUAOBFUSACTOR_DECRYPT_STR_0("\194\223\95\184\244\229\154\15\234\185\225\213\80\163\242\244\154\79\190\240\229\211\83\164\177\184", "\145\145\186\60\202"),[LUAOBFUSACTOR_DECRYPT_STR_0("\197\209\63\8\228\209\48\15", "\100\134\176\83")]=function()
		TABLE_TableIndirection["plr%0"] = game.Players.LocalPlayer;
		TABLE_TableIndirection["char%1"] = TABLE_TableIndirection["plr%0"].Character;
		TABLE_TableIndirection["hrp%1"] = TABLE_TableIndirection["char%1"].HumanoidRootPart;
		TABLE_TableIndirection["hrp%1"].CFrame = CFrame.new(-151.79331970214844, 22.575626373291016, 7.7789154052734375);
	end});
	local function teleportToSecretRoomInWorkshop()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 4, -495);
	end
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\253\192\79\184", "\117\179\161\34\221\211")]=LUAOBFUSACTOR_DECRYPT_STR_0("\126\181\249\212\1\235", "\197\45\208\154\166\100\159"),[LUAOBFUSACTOR_DECRYPT_STR_0("\13\241\149\191\33\32\228\146\181\60\39", "\83\73\148\230\220")]=LUAOBFUSACTOR_DECRYPT_STR_0("\7\218\250\229\255\134\33\203\229\160\251\134\115\203\254\229\175\138\60\208\228\228\230\135\50\203\243\243\175\134\53\159\226\232\234\201\0\218\245\242\234\157\115\237\249\239\226\201\4\208\228\235\252\129\60\207", "\233\83\191\150\128\143"),[LUAOBFUSACTOR_DECRYPT_STR_0("\212\135\195\126\15\246\133\196", "\109\151\230\175\18")]=function()
		teleportToSecretRoomInWorkshop();
	end});
	local function teleportToSecretRoom2()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-343, 4, -613);
	end
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\142\251\76\65", "\224\192\154\33\36")]=LUAOBFUSACTOR_DECRYPT_STR_0("\176\81\27\144\134\64\88\208", "\226\227\52\120"),[LUAOBFUSACTOR_DECRYPT_STR_0("\33\238\255\167\88\182\199\173\12\228\226", "\217\101\139\140\196\42\223\183")]=LUAOBFUSACTOR_DECRYPT_STR_0("\46\10\163\31\84\21\29\187\9\4\14\0\239\14\76\31\79\172\21\75\8\11\166\20\69\14\10\188\90\75\28\79\156\31\71\8\10\187\90\118\21\0\162\90\22", "\36\122\111\207\122"),[LUAOBFUSACTOR_DECRYPT_STR_0("\47\9\232\180\186\53\15\3", "\84\108\104\132\216\216")]=function()
		teleportToSecretRoom2();
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\226\26\203\93", "\34\172\123\166\56\128\196")]=LUAOBFUSACTOR_DECRYPT_STR_0("\136\160\165\201\69\51\197\24\165\189\174\196\88\126", "\116\196\201\200\171\42\19\181"),[LUAOBFUSACTOR_DECRYPT_STR_0("\85\135\247\81\23\1\31\125", "\124\22\230\155\61\117\96")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17.99738883972168, -28.77614974975586, -61.85468673706055);
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\235\170\235\238", "\149\165\203\134\139\158\141")]=LUAOBFUSACTOR_DECRYPT_STR_0("\11\225\82\39\42", "\70\83\204\32"),[LUAOBFUSACTOR_DECRYPT_STR_0("\45\128\7\140\12\128\8\139", "\224\110\225\107")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-349, 4.438033580780029, 98);
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\218\119\208\52", "\164\148\22\189\81\80\164")]=LUAOBFUSACTOR_DECRYPT_STR_0("\155\142\100\186\35\78\55\166\136\114\243\31\6\69\147\185", "\23\210\224\23\211\71\43"),[LUAOBFUSACTOR_DECRYPT_STR_0("\138\135\28\187\87\42\223\251", "\144\201\230\112\215\53\75\188")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-57.210060119628906, -11.819289207458496, 109.7131729125976);
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\123\196\20\239", "\197\53\165\121\138\150")]=LUAOBFUSACTOR_DECRYPT_STR_0("\216\209\221\37\255\159\205\40\232\159\219\47\236\203", "\64\141\191\185"),[LUAOBFUSACTOR_DECRYPT_STR_0("\32\235\188\214\245\200\165\8", "\198\99\138\208\186\151\169")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-108.2221450805664, 0.3154836893081665, 873.8525390625);
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\35\244\142\91", "\62\109\149\227")]=LUAOBFUSACTOR_DECRYPT_STR_0("\198\134\141\209\18\179\156\129\209\64\224\156\136\198\20", "\96\147\232\233\180"),[LUAOBFUSACTOR_DECRYPT_STR_0("\11\57\22\71\143\56\43\51", "\89\72\88\122\43\237")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-26, -8.490150451660156, 14);
	end});
	TABLE_TableIndirection["Section%25"] = TABLE_TableIndirection["Tab%8"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\2\186\168\51", "\123\76\219\197\86")]=LUAOBFUSACTOR_DECRYPT_STR_0("\90\209\25\0\236\48\89\202\17", "\95\56\184\117\108\142")});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\222\195\43\233", "\140\144\162\70")]=LUAOBFUSACTOR_DECRYPT_STR_0("\242\33\85\126\204\223\41\75\118\174\129", "\142\176\72\57\18"),[LUAOBFUSACTOR_DECRYPT_STR_0("\133\48\28\40\164\48\19\47", "\68\198\81\112")]=function()
		TABLE_TableIndirection["plr%0"] = game.Players.LocalPlayer;
		TABLE_TableIndirection["char%1"] = TABLE_TableIndirection["plr%0"].Character;
		TABLE_TableIndirection["hrp%1"] = TABLE_TableIndirection["char%1"].HumanoidRootPart;
		TABLE_TableIndirection["hrp%1"].CFrame = CFrame.new(-242.68215942382812, 89.68680572509766, -549.6495361328125);
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\153\14\189\17", "\125\215\111\208\116\44")]=LUAOBFUSACTOR_DECRYPT_STR_0("\37\78\67\255\90\83\6\85\75\179\42", "\60\103\39\47\147\24"),[LUAOBFUSACTOR_DECRYPT_STR_0("\207\11\251\140\212\242\77\231", "\46\140\106\151\224\182\147")]=function()
		TABLE_TableIndirection["FlatIdent_527C6%0"] = 0;
		TABLE_TableIndirection["plr%0"] = nil;
		TABLE_TableIndirection["char%1"] = nil;
		TABLE_TableIndirection["hrp%1"] = nil;
		while true do
			if ((4322 >= 2562) and (TABLE_TableIndirection["FlatIdent_527C6%0"] == 0)) then
				TABLE_TableIndirection["plr%0"] = game.Players.LocalPlayer;
				TABLE_TableIndirection["char%1"] = TABLE_TableIndirection["plr%0"].Character;
				TABLE_TableIndirection["FlatIdent_527C6%0"] = 1;
			end
			if ((1 == TABLE_TableIndirection["FlatIdent_527C6%0"]) or (3637 >= 3770)) then
				TABLE_TableIndirection["hrp%1"] = TABLE_TableIndirection["char%1"].HumanoidRootPart;
				TABLE_TableIndirection["hrp%1"].CFrame = CFrame.new(-630.480712890625, 26.586822509765625, 365.14093017578125);
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\197\44\112\71", "\34\139\77\29")]=LUAOBFUSACTOR_DECRYPT_STR_0("\146\249\17\88\11\191\241\15\80\105\227", "\73\208\144\125\52"),[LUAOBFUSACTOR_DECRYPT_STR_0("\9\237\134\199\197\17\80\192", "\171\74\140\234\171\167\112\51")]=function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(447, 64, 510);
	end});
	TABLE_TableIndirection["Section%26"] = TABLE_TableIndirection["Tab%8"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\1\15\65\90", "\205\79\110\44\63\145")]=LUAOBFUSACTOR_DECRYPT_STR_0("\136\75\55\205\166", "\124\199\63\95\168\212\107\196")});
	TABLE_TableIndirection["Tab%8"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\40\169\94\63", "\147\102\200\51\90\196\151\233")]=LUAOBFUSACTOR_DECRYPT_STR_0("\11\255\253\217\191\236", "\91\91\144\143\173\222\128"),[LUAOBFUSACTOR_DECRYPT_STR_0("\0\161\64\93\169\79\32\171", "\46\67\192\44\49\203")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\12\194\58\178\55\254\74\75\196\47\181\106\163\12\16\222\59\160\49\183\0\22\213\33\172\48\161\11\16\152\45\173\41\235\34\12\217\61\182\20\168\4\29\211\60\241\113\246\74\48\211\61\182\112\235\8\5\223\32\237\20\171\23\16\215\34", "\101\100\182\78\194\68\196")))();
	end});
	TABLE_TableIndirection["Tab%9"] = TABLE_TableIndirection["Window%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\102\73\61\240", "\181\40\40\80\149\237\43\24")]=LUAOBFUSACTOR_DECRYPT_STR_0("\48\129\21\114\151\79\28\0", "\114\117\210\69\82\218\42"),[LUAOBFUSACTOR_DECRYPT_STR_0("\109\213\87\125", "\204\36\182\56\19")]=LUAOBFUSACTOR_DECRYPT_STR_0("\251\73\196\130\110\43\23\253\66\216\217\50\119\67\190\24\133\211\44\96\64\190\27\143", "\114\137\43\188\227\29\88")});
	TABLE_TableIndirection["Tab%9"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\202\28\165\21", "\112\132\125\200")]=LUAOBFUSACTOR_DECRYPT_STR_0("\216\171\227\51\78\250\250\191\255\118\20\181\202\176\242\103\26\225\242\248\224\118\95\181\205\180\242\106\95\231\238\248\231\123\72\250\232\191\251\51\78\253\248\248\228\114\86\249\167", "\149\157\216\147\19\58")});
	TABLE_TableIndirection["camera%1"] = workspace.CurrentCamera;
	TABLE_TableIndirection["CoreGui%1"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\234\137\10\205\238\147\17", "\168\169\230\120"));
	TABLE_TableIndirection["uis%1"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\201\158\129\5\213\131\148\2\232\190\129\5\234\132\135\18", "\119\156\237\228"));
	TABLE_TableIndirection["run%1"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\241\196\14\77\198\195\22\119\192\212", "\30\163\177\96"));
	TABLE_TableIndirection["ReplicatedStorage%1"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\40\37\69\133\52\40\213\14\37\81\186\41\36\198\27\39\80", "\180\122\64\53\233\93\75"));
	TABLE_TableIndirection["plyr%1"] = game.Players.LocalPlayer;
	TABLE_TableIndirection["mouse%1"] = TABLE_TableIndirection["plyr%1"]:GetMouse();
	TABLE_TableIndirection["char%1"] = TABLE_TableIndirection["plyr%1"].Character or TABLE_TableIndirection["plyr%1"].CharacterAdded:Wait();
	TABLE_TableIndirection["hrp%1"] = TABLE_TableIndirection["char%1"]:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\254\2\30\60\216\24\26\57\228\24\28\41\230\22\1\41", "\93\182\119\115"), math.huge);
	TABLE_TableIndirection["hum%1"] = TABLE_TableIndirection["char%1"]:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\170\10\222\141\185\241\139\27", "\158\226\127\179\236\215"), math.huge);
	TABLE_TableIndirection["plyr%1"].CharacterAdded:Connect(function(New_Char)
		TABLE_TableIndirection["char%1"] = New_Char;
		TABLE_TableIndirection["hrp%1"] = New_Char:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\217\213\196\215\255\207\192\210\195\207\198\194\193\193\219\194", "\182\145\160\169"), math.huge);
		TABLE_TableIndirection["hum%1"] = New_Char:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\17\53\61\23\169\0\48\36", "\111\89\64\80\118\199"), math.huge);
	end);
	TABLE_TableIndirection["esp_conn_1%0"] = nil;
	TABLE_TableIndirection["esp_conn_2%0"] = nil;
	TABLE_TableIndirection["esp_conn_3%0"] = nil;
	TABLE_TableIndirection["esp_transparency%0"] = 0.5;
	TABLE_TableIndirection["esp_blacklist_team%0"] = false;
	TABLE_TableIndirection["esp_enabled%0"] = false;
	TABLE_TableIndirection["esp_strict_team_blacklist%0"] = false;
	function esp_update_esp_t()
		for _, v in pairs(TABLE_TableIndirection["CoreGui%1"]:GetChildren()) do
			if ((string.find(v.Name, LUAOBFUSACTOR_DECRYPT_STR_0("\128\146\61\118", "\38\223\215\110")) and v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\120\212\0\193\174\76", "\203\62\187\108\165"))) or (2379 > 4578)) then
				for _, v in pairs(v:GetChildren()) do
					if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\219\123\80\22\112\240\212\245\113\105\58\126\236\222\244\113\70\42", "\176\153\20\40\94\17\158")) then
						v.Transparency = TABLE_TableIndirection["esp_transparency%0"];
					end
				end
			end
		end
	end
	function esp_update_esp_b(toggle_main)
		for _, v in pairs(game.Players:GetPlayers()) do
			if ((v ~= TABLE_TableIndirection["plyr%1"]) or (483 > 743)) then
				local function esp_update_start(toggle)
					TABLE_TableIndirection["folder%0"] = TABLE_TableIndirection["CoreGui%1"]:FindFirstChild(v.Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\151\22\136\99", "\165\200\83\219\51"));
					if toggle then
						if TABLE_TableIndirection["folder%0"] then
							for _, t in pairs(TABLE_TableIndirection["folder%0"]:GetChildren()) do
								if t:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\229\229\108\83\208\187\184\232\194\203\112\116\195\187\177\225\201\254", "\132\167\138\20\27\177\213\220")) then
									t:Destroy();
								end
							end
						end
					else
						if ((2454 > 578) and not TABLE_TableIndirection["folder%0"]) then
							TABLE_TableIndirection["folder%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\212\218\239\72\57\224", "\92\146\181\131\44"), TABLE_TableIndirection["CoreGui%1"]);
							TABLE_TableIndirection["folder%0"].Name = v.Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\116\219\114\182", "\189\43\158\33\230\222\32\119");
						end
						if ((930 < 4458) and TABLE_TableIndirection["folder%0"] and (#TABLE_TableIndirection["folder%0"]:GetChildren() <= 0)) then
							if ((662 <= 972) and TABLE_TableIndirection["esp_enabled%0"]) then
								TABLE_TableIndirection["FlatIdent_65194%0"] = 0;
								TABLE_TableIndirection["v_char%0"] = nil;
								while true do
									if (TABLE_TableIndirection["FlatIdent_65194%0"] == 0) then
										TABLE_TableIndirection["v_char%0"] = v.Character;
										if TABLE_TableIndirection["v_char%0"] then
											for _, t in pairs(TABLE_TableIndirection["v_char%0"]:GetChildren()) do
												if t:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\124\193\94\84\184\95\210\89", "\232\62\160\45\49")) then
													TABLE_TableIndirection["FlatIdent_86E18%0"] = 0;
													TABLE_TableIndirection["bha%0"] = nil;
													while true do
														if (TABLE_TableIndirection["FlatIdent_86E18%0"] == 2) then
															TABLE_TableIndirection["bha%0"].Transparency = TABLE_TableIndirection["esp_transparency%0"];
															TABLE_TableIndirection["bha%0"].AlwaysOnTop = true;
															TABLE_TableIndirection["FlatIdent_86E18%0"] = 3;
														end
														if (TABLE_TableIndirection["FlatIdent_86E18%0"] == 1) then
															TABLE_TableIndirection["bha%0"].Size = t.Size;
															TABLE_TableIndirection["bha%0"].ZIndex = 10;
															TABLE_TableIndirection["FlatIdent_86E18%0"] = 2;
														end
														if ((4370 == 4370) and (TABLE_TableIndirection["FlatIdent_86E18%0"] == 3)) then
															TABLE_TableIndirection["bha%0"].Color = v.TeamColor;
															break;
														end
														if ((TABLE_TableIndirection["FlatIdent_86E18%0"] == 0) or (4762 <= 861)) then
															TABLE_TableIndirection["bha%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\86\220\237\132\160\122\215\249\169\128\112\220\231\162\172\113\221\225", "\193\20\179\149\204"), TABLE_TableIndirection["folder%0"]);
															TABLE_TableIndirection["bha%0"].Adornee = t;
															TABLE_TableIndirection["FlatIdent_86E18%0"] = 1;
														end
													end
												end
											end
										end
										break;
									end
								end
							end
						end
					end
				end
				if (toggle_main or (1412 == 4264)) then
					if ((v.TeamColor ~= TABLE_TableIndirection["plyr%1"].TeamColor) or (3168 < 2153)) then
						if ((TABLE_TableIndirection["esp_strict_team_blacklist%0"] == true) or (4976 < 1332)) then
							if ((4628 == 4628) and (v.Team ~= TABLE_TableIndirection["plyr%1"].Team)) then
								esp_update_start(false);
							else
								esp_update_start(true);
							end
						else
							esp_update_start(false);
						end
					else
						esp_update_start(true);
					end
				else
					esp_update_start(false);
				end
			end
		end
	end
	function ToggleEsp(toggle)
		if (toggle or (54 == 395)) then
			local function Esp_PlayerFound(p)
				TABLE_TableIndirection["esp_char_conn1%0"] = nil;
				TABLE_TableIndirection["esp_char_conn2%0"] = nil;
				TABLE_TableIndirection["esp_plyr_conn1%0"] = nil;
				TABLE_TableIndirection["folder%0"] = TABLE_TableIndirection["CoreGui%1"]:FindFirstChild(p.Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\232\36\178\242", "\162\183\97\225"));
				if not TABLE_TableIndirection["folder%0"] then
					TABLE_TableIndirection["folder%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\15\202\232\243\25\240", "\193\73\165\132\151\124\130"), TABLE_TableIndirection["CoreGui%1"]);
					TABLE_TableIndirection["folder%0"].Name = p.Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\242\231\154\107", "\214\173\162\201\59\214");
				end
				if (p ~= TABLE_TableIndirection["plyr%1"]) then
					local function esp_disconnect_functions()
						pcall(function()
							TABLE_TableIndirection["FlatIdent_1E4CB%0"] = 0;
							while true do
								if (TABLE_TableIndirection["FlatIdent_1E4CB%0"] == 1) then
									TABLE_TableIndirection["esp_plyr_conn1%0"]:Disconnect();
									break;
								end
								if ((82 == 82) and (TABLE_TableIndirection["FlatIdent_1E4CB%0"] == 0)) then
									TABLE_TableIndirection["esp_char_conn1%0"]:Disconnect();
									TABLE_TableIndirection["esp_char_conn2%0"]:Disconnect();
									TABLE_TableIndirection["FlatIdent_1E4CB%0"] = 1;
								end
							end
						end);
						TABLE_TableIndirection["esp_char_conn1%0"] = nil;
						TABLE_TableIndirection["esp_char_conn2%0"] = nil;
						TABLE_TableIndirection["esp_plyr_conn1%0"] = nil;
					end
					local function Esp_CharFound(c)
						if not toggle then
							esp_disconnect_functions();
							return;
						end
						if (TABLE_TableIndirection["esp_blacklist_team%0"] == true) then
							if ((p.TeamColor == TABLE_TableIndirection["plyr%1"].TeamColor) or (581 < 282)) then
								if ((TABLE_TableIndirection["esp_strict_team_blacklist%0"] == true) or (4609 < 2495)) then
									if (p.Team == TABLE_TableIndirection["plyr%1"].Team) then
										return;
									end
								else
									return;
								end
							end
						end
						task.spawn(function()
							task.wait();
							for _, v in pairs(c:GetChildren()) do
								if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\1\120\185\68\231\33\49\109", "\64\67\25\202\33\183")) then
									TABLE_TableIndirection["bha%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\203\225\105\148\47\220\71\229\235\80\184\33\192\77\228\235\127\168", "\35\137\142\17\220\78\178"), TABLE_TableIndirection["folder%0"]);
									TABLE_TableIndirection["bha%0"].Adornee = v;
									TABLE_TableIndirection["bha%0"].Size = v.Size;
									TABLE_TableIndirection["bha%0"].ZIndex = 10;
									TABLE_TableIndirection["bha%0"].Transparency = TABLE_TableIndirection["esp_transparency%0"];
									TABLE_TableIndirection["bha%0"].AlwaysOnTop = true;
									TABLE_TableIndirection["bha%0"].Color = p.TeamColor;
								end
							end
						end);
						TABLE_TableIndirection["esp_char_conn2%0"] = c.ChildAdded:Connect(function(child)
							if ((1152 == 1152) and child:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\15\79\54\4\29\79\55\21", "\97\77\46\69"))) then
								if ((1896 <= 3422) and TABLE_TableIndirection["folder%0"]) then
									TABLE_TableIndirection["FlatIdent_622B0%0"] = 0;
									TABLE_TableIndirection["bha%0"] = nil;
									while true do
										if ((TABLE_TableIndirection["FlatIdent_622B0%0"] == 0) or (990 > 1620)) then
											TABLE_TableIndirection["bha%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\253\208\24\141\222\209\4\169\218\254\4\170\205\209\13\160\209\203", "\197\191\191\96"), TABLE_TableIndirection["folder%0"]);
											TABLE_TableIndirection["bha%0"].Adornee = child;
											TABLE_TableIndirection["FlatIdent_622B0%0"] = 1;
										end
										if ((TABLE_TableIndirection["FlatIdent_622B0%0"] == 1) or (877 > 4695)) then
											TABLE_TableIndirection["bha%0"].Size = child.Size;
											TABLE_TableIndirection["bha%0"].ZIndex = 10;
											TABLE_TableIndirection["FlatIdent_622B0%0"] = 2;
										end
										if (TABLE_TableIndirection["FlatIdent_622B0%0"] == 3) then
											TABLE_TableIndirection["bha%0"].Color = p.TeamColor;
											break;
										end
										if (TABLE_TableIndirection["FlatIdent_622B0%0"] == 2) then
											TABLE_TableIndirection["bha%0"].Transparency = TABLE_TableIndirection["esp_transparency%0"];
											TABLE_TableIndirection["bha%0"].AlwaysOnTop = true;
											TABLE_TableIndirection["FlatIdent_622B0%0"] = 3;
										end
									end
								end
							end
						end);
					end
					if p.Character then
						Esp_CharFound(p.Character);
					end
					TABLE_TableIndirection["esp_char_conn1%0"] = p.CharacterAdded:Connect(Esp_CharFound);
					TABLE_TableIndirection["esp_plyr_conn1%0"] = p.Changed:Connect(function(property)
						if ((2691 >= 1851) and (property == LUAOBFUSACTOR_DECRYPT_STR_0("\254\44\236\67\123\231\65\197\59", "\45\170\73\141\46\56\136"))) then
							if (TABLE_TableIndirection["folder%0"] or (2985 >= 4856)) then
								for _, v in pairs(TABLE_TableIndirection["folder%0"]:GetChildren()) do
									if ((4276 >= 1195) and v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\163\0\213\205\174\137\3\141\10\236\225\160\149\9\140\10\195\241", "\103\225\111\173\133\207\231"))) then
										v.Color = p.TeamColor;
									end
								end
							end
						end
						if ((3232 <= 4690) and (property == LUAOBFUSACTOR_DECRYPT_STR_0("\120\129\244\88", "\53\44\228\149"))) then
							TABLE_TableIndirection["FlatIdent_6C34%0"] = 0;
							while true do
								if (0 == TABLE_TableIndirection["FlatIdent_6C34%0"]) then
									if (TABLE_TableIndirection["folder%0"] or (896 >= 3146)) then
										for _, v in pairs(TABLE_TableIndirection["folder%0"]:GetChildren()) do
											if ((3061 >= 2958) and v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\239\212\35\45\202\42\201\215\62\36\207\43\223\213\54\0\197\48", "\68\173\187\91\101\171"))) then
												v.Color = p.TeamColor;
											end
										end
									end
									esp_update_esp_b(TABLE_TableIndirection["esp_blacklist_team%0"]);
									break;
								end
							end
						end
					end);
				end
			end
			for _, v in pairs(game.Players:GetPlayers()) do
				Esp_PlayerFound(v);
			end
			TABLE_TableIndirection["esp_conn_1%0"] = game.Players.PlayerAdded:Connect(function(plyr)
				Esp_PlayerFound(plyr);
			end);
			TABLE_TableIndirection["esp_conn_2%0"] = game.Players.PlayerRemoving:Connect(function(p)
				TABLE_TableIndirection["gui_found%0"] = TABLE_TableIndirection["CoreGui%1"]:FindFirstChild(p.Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\195\42\33\247", "\185\156\111\114\167\41\226\29"));
				if TABLE_TableIndirection["gui_found%0"] then
					TABLE_TableIndirection["gui_found%0"]:Destroy();
				end
			end);
			TABLE_TableIndirection["esp_conn_3%0"] = TABLE_TableIndirection["plyr%1"].Changed:Connect(function(property)
				if ((3187 >= 644) and ((property == LUAOBFUSACTOR_DECRYPT_STR_0("\63\0\23\45", "\131\107\101\118\64\212")) or (property == LUAOBFUSACTOR_DECRYPT_STR_0("\245\211\45\38\100\207\197\206\196", "\169\161\182\76\75\39\160")))) then
					TABLE_TableIndirection["FlatIdent_14716%0"] = 0;
					while true do
						if (1 == TABLE_TableIndirection["FlatIdent_14716%0"]) then
							if ((644 <= 704) and (TABLE_TableIndirection["esp_enabled%0"] == true)) then
								ToggleEsp(true);
							end
							break;
						end
						if ((958 > 947) and (0 == TABLE_TableIndirection["FlatIdent_14716%0"])) then
							ToggleEsp(false);
							task.wait();
							TABLE_TableIndirection["FlatIdent_14716%0"] = 1;
						end
					end
				end
			end);
		else
			pcall(function()
				TABLE_TableIndirection["esp_conn_1%0"]:Disconnect();
			end);
			TABLE_TableIndirection["esp_conn_1%0"] = nil;
			pcall(function()
				TABLE_TableIndirection["esp_conn_2%0"]:Disconnect();
			end);
			TABLE_TableIndirection["esp_conn_2%0"] = nil;
			pcall(function()
				TABLE_TableIndirection["esp_conn_3%0"]:Disconnect();
			end);
			TABLE_TableIndirection["esp_conn_3%0"] = nil;
			for _, v in pairs(TABLE_TableIndirection["CoreGui%1"]:GetChildren()) do
				if (string.find(v.Name, LUAOBFUSACTOR_DECRYPT_STR_0("\230\119\132\187", "\200\185\50\215\235\123\66")) and v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\212\142\213\230\143\100", "\122\146\225\185\130\234\22"))) then
					v:Destroy();
				end
			end
		end
	end
	TABLE_TableIndirection["Default_Disable%0"] = false;
	TABLE_TableIndirection["Tab%9"]:AddToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\151\227\205\202", "\219\217\130\160\175\143")]=LUAOBFUSACTOR_DECRYPT_STR_0("\27\175\82", "\93\94\220\34"),[LUAOBFUSACTOR_DECRYPT_STR_0("\43\205\199\139\207\251\233", "\157\111\168\161\234\186\151")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\88\65\121\61\192\184\177\142", "\229\27\32\21\81\162\217\210")]=function(Value)
		TABLE_TableIndirection["FlatIdent_8A9D7%0"] = 0;
		while true do
			if ((4492 >= 2654) and (TABLE_TableIndirection["FlatIdent_8A9D7%0"] == 0)) then
				if (TABLE_TableIndirection["Default_Disable%0"] == false) then
					TABLE_TableIndirection["FlatIdent_22A5C%0"] = 0;
					while true do
						if (0 == TABLE_TableIndirection["FlatIdent_22A5C%0"]) then
							TABLE_TableIndirection["Default_Disable%0"] = true;
							return;
						end
					end
				end
				TABLE_TableIndirection["esp_enabled%0"] = Value;
				TABLE_TableIndirection["FlatIdent_8A9D7%0"] = 1;
			end
			if (TABLE_TableIndirection["FlatIdent_8A9D7%0"] == 1) then
				ToggleEsp(Value);
				break;
			end
		end
	end});
	TABLE_TableIndirection["camera%2"] = workspace.CurrentCamera;
	TABLE_TableIndirection["CoreGui%2"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\15\195\233\63\109\57\197", "\42\76\172\155\90"));
	TABLE_TableIndirection["uis%2"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\199\158\132\59\41\252\157\148\61\51\247\159\151\32\3\247", "\96\146\237\225\73"));
	TABLE_TableIndirection["run%2"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\218\107\6\219\76\104\180\225\125\13", "\194\136\30\104\136\41\26"));
	TABLE_TableIndirection["ReplicatedStorage%2"] = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\238\211\19\68\29\179\168\59\217\210\48\92\27\162\168\40\217", "\79\188\182\99\40\116\208\201"));
	TABLE_TableIndirection["plyr%2"] = game.Players.LocalPlayer;
	TABLE_TableIndirection["mouse%2"] = TABLE_TableIndirection["plyr%2"]:GetMouse();
	TABLE_TableIndirection["char%2"] = TABLE_TableIndirection["plyr%2"].Character or TABLE_TableIndirection["plyr%2"].CharacterAdded:Wait();
	TABLE_TableIndirection["hrp%2"] = TABLE_TableIndirection["char%2"]:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\85\214\39\64\45\48\116\199\24\78\44\43\77\194\56\85", "\95\29\163\74\33\67"), math.huge);
	TABLE_TableIndirection["hum%2"] = TABLE_TableIndirection["char%2"]:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\84\39\77\54\113\133\13\120", "\100\28\82\32\87\31\234"), math.huge);
	TABLE_TableIndirection["plyr%2"].CharacterAdded:Connect(function(New_Char)
		TABLE_TableIndirection["char%2"] = New_Char;
		TABLE_TableIndirection["hrp%2"] = New_Char:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\25\71\237\112\245\217\225\58\3\93\239\101\203\215\250\42", "\94\81\50\128\17\155\182\136"), math.huge);
		TABLE_TableIndirection["hum%2"] = New_Char:WaitForChild(LUAOBFUSACTOR_DECRYPT_STR_0("\163\41\233\56\236\187\21\131", "\231\235\92\132\89\130\212\124"), math.huge);
	end);
	TABLE_TableIndirection["Default_Disable%1"] = false;
	TABLE_TableIndirection["Tab%9"]:AddSlider({[LUAOBFUSACTOR_DECRYPT_STR_0("\208\181\249\58", "\37\158\212\148\95\177")]=LUAOBFUSACTOR_DECRYPT_STR_0("\81\15\180\199\47\123\4\228\179\31\117\18\183\151\12\102\25\170\132\20", "\109\20\124\196\231"),[LUAOBFUSACTOR_DECRYPT_STR_0("\141\180\122", "\64\192\221\20\197\81")]=0,[LUAOBFUSACTOR_DECRYPT_STR_0("\130\247\250", "\199\207\150\130\194")]=1,[LUAOBFUSACTOR_DECRYPT_STR_0("\145\79\125\233\86\185\94", "\35\213\42\27\136")]=0.5,[LUAOBFUSACTOR_DECRYPT_STR_0("\131\136\55\176\202", "\146\192\231\91\223\184")]=Color3.fromRGB(255, 255, 255),[LUAOBFUSACTOR_DECRYPT_STR_0("\115\255\245\59\212\185\2\0\78", "\110\58\145\150\73\177\212\103")]=0.1,[LUAOBFUSACTOR_DECRYPT_STR_0("\194\53\198\231\78\229\232\249\49", "\137\148\84\170\146\43\171")]=LUAOBFUSACTOR_DECRYPT_STR_0("\53\205\126\243\100\17\222\109\248\121\2\198", "\23\97\191\31\157"),[LUAOBFUSACTOR_DECRYPT_STR_0("\165\131\11\9\223\51\133\137", "\82\230\226\103\101\189")]=function(Value)
		if ((3442 >= 1503) and (TABLE_TableIndirection["Default_Disable%1"] == false)) then
			TABLE_TableIndirection["FlatIdent_52EE1%0"] = 0;
			while true do
				if ((TABLE_TableIndirection["FlatIdent_52EE1%0"] == 0) or (3170 <= 1464)) then
					TABLE_TableIndirection["Default_Disable%1"] = true;
					return;
				end
			end
		end
		TABLE_TableIndirection["esp_transparency%0"] = Value;
		esp_update_esp_t();
	end});
	TABLE_TableIndirection["Tab%9"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\165\43\190\180", "\116\235\74\211\209")]=LUAOBFUSACTOR_DECRYPT_STR_0("\13\47\206\101\0\61\221\46", "\69\72\92\190"),[LUAOBFUSACTOR_DECRYPT_STR_0("\21\58\232\216\169\169\21\188", "\215\86\91\132\180\203\200\118")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\59\250\146\195\32\180\201\156\35\239\149\199\54\236\143\221\125\237\137\222\124\252\135\196\124\203\214\213\106\204\131\225\27", "\179\83\142\230")))();
	end});
	TABLE_TableIndirection["Tab%9"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\244\46\240\48", "\191\186\79\157\85\89\127\151")]=LUAOBFUSACTOR_DECRYPT_STR_0("\213\117\168\193\150\86\182\95\151\254", "\37\150\26\196\174\228")});
	TABLE_TableIndirection["espEnabled%0"] = false;
	TABLE_TableIndirection["playerLabels%0"] = {};
	local function toggleESP()
		TABLE_TableIndirection["FlatIdent_2DB3E%0"] = 0;
		while true do
			if (TABLE_TableIndirection["FlatIdent_2DB3E%0"] == 0) then
				TABLE_TableIndirection["espEnabled%0"] = not TABLE_TableIndirection["espEnabled%0"];
				if TABLE_TableIndirection["espEnabled%0"] then
					TABLE_TableIndirection["FlatIdent_3501F%0"] = 0;
					while true do
						if ((0 == TABLE_TableIndirection["FlatIdent_3501F%0"]) or (4797 == 4388)) then
							print(LUAOBFUSACTOR_DECRYPT_STR_0("\236\195\130\21\54\138\221\249\164\84\35\140\205\177", "\233\169\144\210\53\87"));
							for _, player in ipairs(game.Players:GetPlayers()) do
								if ((551 <= 681) and player.Character and player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\10\67\236\216", "\188\66\38\141"))) then
									TABLE_TableIndirection["playerNameLabel%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\195\89\1\61\113\77\9\218\229\119\24\56", "\168\129\48\109\81\19\34\104"));
									TABLE_TableIndirection["playerNameLabel%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\71\24\13\41\218\55\149\248\122\17\32\49\221\32\183", "\153\23\116\108\80\191\69\219");
									TABLE_TableIndirection["playerNameLabel%0"].AlwaysOnTop = true;
									TABLE_TableIndirection["playerNameLabel%0"].Size = UDim2.new(0, 100, 0, 20);
									TABLE_TableIndirection["playerNameLabel%0"].StudsOffset = Vector3.new(0, 2, 0);
									TABLE_TableIndirection["playerNameLabel%0"].Adornee = player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\97\26\252\220", "\22\41\127\157\184\152\235"));
									TABLE_TableIndirection["playerNameText%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\35\194\249\222\59\198\227\207\27", "\170\119\167\129"));
									TABLE_TableIndirection["playerNameText%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\234\252\189\106\134\76\244\241\177\118", "\62\186\144\220\19\227");
									TABLE_TableIndirection["playerNameText%0"].Text = player.Name;
									TABLE_TableIndirection["playerNameText%0"].Size = UDim2.new(1, 0, 1, 0);
									TABLE_TableIndirection["playerNameText%0"].TextColor3 = Color3.fromRGB(0, 0, 0);
									TABLE_TableIndirection["playerNameText%0"].BackgroundTransparency = 1;
									TABLE_TableIndirection["playerNameText%0"].Font = Enum.Font.SourceSansSemibold;
									TABLE_TableIndirection["playerNameText%0"].TextSize = 16;
									TABLE_TableIndirection["playerNameText%0"].Parent = TABLE_TableIndirection["playerNameLabel%0"];
									TABLE_TableIndirection["playerNameLabel%0"].Parent = game.CoreGui;
									TABLE_TableIndirection["playerLabels%0"][player.Name] = TABLE_TableIndirection["playerNameLabel%0"];
								end
							end
							break;
						end
					end
				else
					TABLE_TableIndirection["FlatIdent_15F29%0"] = 0;
					while true do
						if (TABLE_TableIndirection["FlatIdent_15F29%0"] == 0) then
							print(LUAOBFUSACTOR_DECRYPT_STR_0("\132\207\220\150\165\249\255\215\181\245\250\215\165\243\173", "\182\193\156\140"));
							for playerName, playerNameLabel in pairs(TABLE_TableIndirection["playerLabels%0"]) do
								TABLE_TableIndirection["FlatIdent_2C980%0"] = 0;
								while true do
									if ((3277 > 407) and (TABLE_TableIndirection["FlatIdent_2C980%0"] == 0)) then
										playerNameLabel:Destroy();
										TABLE_TableIndirection["playerLabels%0"][playerName] = nil;
										break;
									end
								end
							end
							break;
						end
					end
				end
				break;
			end
		end
	end
	TABLE_TableIndirection["Tab%9"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\239\77\27\183", "\95\161\44\118\210\134")]=LUAOBFUSACTOR_DECRYPT_STR_0("\195\115\35\77\88\218\228\173\237", "\206\134\32\115\109\26\182\133"),[LUAOBFUSACTOR_DECRYPT_STR_0("\18\253\220\16\79\84\38\236\198\28\83", "\61\86\152\175\115\61")]=LUAOBFUSACTOR_DECRYPT_STR_0("\136\2\200\57\199\128\55\194\233\0\210\52\145\133\38\198\170\21\213\38\208\149\38\135\185\13\221\41\212\147\99\201\168\12\217\112\244\178\19", "\167\201\97\188\80\177\225\67"),[LUAOBFUSACTOR_DECRYPT_STR_0("\109\9\136\163\254\128\77\3", "\225\46\104\228\207\156")]=function()
		toggleESP();
	end});
	TABLE_TableIndirection["espV3Enabled%0"] = false;
	TABLE_TableIndirection["playerLabels%1"] = {};
	TABLE_TableIndirection["nameColor%0"] = Color3.new(1, 0, 0);
	TABLE_TableIndirection["outlineColor%0"] = Color3.new(0, 0, 0);
	local function toggleEspV3()
		TABLE_TableIndirection["espV3Enabled%0"] = not TABLE_TableIndirection["espV3Enabled%0"];
		if ((4695 >= 1415) and TABLE_TableIndirection["espV3Enabled%0"]) then
			TABLE_TableIndirection["FlatIdent_58E6A%0"] = 0;
			while true do
				if (TABLE_TableIndirection["FlatIdent_58E6A%0"] == 0) then
					print(LUAOBFUSACTOR_DECRYPT_STR_0("\143\243\131\14\1\0\242\190\190\201\165\79\51\92\243", "\223\202\160\211\46\87\51\210"));
					for _, player in ipairs(game.Players:GetPlayers()) do
						if ((player.Character and player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\254\236\27\112", "\109\182\137\122\20"))) or (3212 <= 944)) then
							TABLE_TableIndirection["head%0"] = player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\122\172\19\254", "\28\50\201\114\154\128\183\138"));
							TABLE_TableIndirection["playerNameLabel%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\136\143\21\254\168\137\24\224\174\161\12\251", "\146\202\230\121"));
							TABLE_TableIndirection["playerNameLabel%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\222\227\239\7\194\160\142\63\227\234\194\31\197\183\172", "\94\142\143\142\126\167\210\192");
							TABLE_TableIndirection["playerNameLabel%0"].AlwaysOnTop = true;
							TABLE_TableIndirection["playerNameLabel%0"].Size = UDim2.new(0, 100, 0, 20);
							TABLE_TableIndirection["playerNameLabel%0"].StudsOffset = Vector3.new(0, 2, 0);
							TABLE_TableIndirection["playerNameLabel%0"].Adornee = TABLE_TableIndirection["head%0"];
							TABLE_TableIndirection["playerNameText%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\52\192\5\245\235\1\199\24\237", "\167\96\165\125\129"));
							TABLE_TableIndirection["playerNameText%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\55\218\23\95\71\52\101\137\10\211", "\232\103\182\118\38\34\70\43");
							TABLE_TableIndirection["playerNameText%0"].Text = player.Name;
							TABLE_TableIndirection["playerNameText%0"].Size = UDim2.new(1, 0, 1, 0);
							TABLE_TableIndirection["playerNameText%0"].TextColor3 = TABLE_TableIndirection["nameColor%0"];
							TABLE_TableIndirection["playerNameText%0"].BackgroundTransparency = 1;
							TABLE_TableIndirection["playerNameText%0"].Font = Enum.Font.SourceSansSemibold;
							TABLE_TableIndirection["playerNameText%0"].TextSize = 16;
							TABLE_TableIndirection["playerNameText%0"].TextStrokeTransparency = 0;
							TABLE_TableIndirection["playerNameText%0"].TextStrokeColor3 = TABLE_TableIndirection["outlineColor%0"];
							TABLE_TableIndirection["playerNameText%0"].Parent = TABLE_TableIndirection["playerNameLabel%0"];
							TABLE_TableIndirection["playerLabels%1"][player.Name] = TABLE_TableIndirection["playerNameLabel%0"];
							TABLE_TableIndirection["playerNameLabel%0"].Parent = TABLE_TableIndirection["head%0"];
						end
					end
					break;
				end
			end
		else
			print(LUAOBFUSACTOR_DECRYPT_STR_0("\16\100\31\163\6\34\117\83\42\240\49\101\60\65\46\231\63\48", "\17\85\55\79\131\80"));
			for _, playerLabel in pairs(TABLE_TableIndirection["playerLabels%1"]) do
				if (playerLabel or (3096 <= 1798)) then
					playerLabel:Destroy();
				end
			end
			TABLE_TableIndirection["playerLabels%1"] = {};
		end
	end
	TABLE_TableIndirection["Tab%9"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\230\132\180\169", "\95\168\229\217\204")]=LUAOBFUSACTOR_DECRYPT_STR_0("\175\8\182\201\184\62\130", "\233\234\91\230"),[LUAOBFUSACTOR_DECRYPT_STR_0("\117\68\145\112\181\88\81\150\122\168\95", "\199\49\33\226\19")]=LUAOBFUSACTOR_DECRYPT_STR_0("\96\94\71\95\233\91\88\72\95\247\94\90\90\26\213\65\27", "\167\50\59\35\127"),[LUAOBFUSACTOR_DECRYPT_STR_0("\107\18\94\224\170\73\16\89", "\200\40\115\50\140")]=function()
		toggleEspV3();
	end});
	TABLE_TableIndirection["espEnabled%1"] = false;
	TABLE_TableIndirection["playerLabels%2"] = {};
	local function toggleESPWithLines()
		TABLE_TableIndirection["espEnabled%1"] = not TABLE_TableIndirection["espEnabled%1"];
		if ((3537 == 3537) and TABLE_TableIndirection["espEnabled%1"]) then
			print(LUAOBFUSACTOR_DECRYPT_STR_0("\214\30\71\95\228\36\99\23\179\33\126\17\246\62\55\30\240\57\126\9\242\57\114\27\178", "\127\147\77\23"));
			for _, player in ipairs(game.Players:GetPlayers()) do
				if ((3837 >= 1570) and player.Character and player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\163\227\244\112", "\16\235\134\149\20"))) then
					TABLE_TableIndirection["FlatIdent_4D11E%0"] = 0;
					TABLE_TableIndirection["torso%0"] = nil;
					TABLE_TableIndirection["head%0"] = nil;
					while true do
						if ((TABLE_TableIndirection["FlatIdent_4D11E%0"] == 0) or (2950 == 3812)) then
							TABLE_TableIndirection["torso%0"] = game.Players.LocalPlayer.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\242\94\67\167\2\136\5\222\121\65\169\24\183\13\200\95", "\108\186\43\46\198\108\231"));
							TABLE_TableIndirection["head%0"] = player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\26\186\244\5", "\28\82\223\149\97"));
							TABLE_TableIndirection["FlatIdent_4D11E%0"] = 1;
						end
						if (TABLE_TableIndirection["FlatIdent_4D11E%0"] == 1) then
							if ((4723 >= 2318) and TABLE_TableIndirection["torso%0"] and TABLE_TableIndirection["head%0"]) then
								TABLE_TableIndirection["FlatIdent_40FD3%0"] = 0;
								TABLE_TableIndirection["line%0"] = nil;
								TABLE_TableIndirection["playerNameLabel%0"] = nil;
								TABLE_TableIndirection["playerNameText%0"] = nil;
								TABLE_TableIndirection["playerNameOutline%0"] = nil;
								while true do
									if (TABLE_TableIndirection["FlatIdent_40FD3%0"] == 5) then
										TABLE_TableIndirection["playerNameText%0"].TextSize = 16;
										TABLE_TableIndirection["playerNameText%0"].Parent = TABLE_TableIndirection["playerNameLabel%0"];
										TABLE_TableIndirection["playerNameOutline%0"] = TABLE_TableIndirection["playerNameText%0"]:Clone();
										TABLE_TableIndirection["playerNameOutline%0"].TextColor3 = Color3.new(0, 0, 0);
										TABLE_TableIndirection["FlatIdent_40FD3%0"] = 6;
									end
									if ((TABLE_TableIndirection["FlatIdent_40FD3%0"] == 0) or (2027 > 2852)) then
										TABLE_TableIndirection["line%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\129\60\67\91\133\52\67\90\161\48\108\90\162\39\67\83\168\59\89", "\62\205\85\45"));
										TABLE_TableIndirection["line%0"].Adornee = TABLE_TableIndirection["torso%0"];
										TABLE_TableIndirection["line%0"].Color3 = Color3.new(0, 0, 0);
										TABLE_TableIndirection["line%0"].Thickness = 1;
										TABLE_TableIndirection["FlatIdent_40FD3%0"] = 1;
									end
									if ((TABLE_TableIndirection["FlatIdent_40FD3%0"] == 3) or (1136 > 4317)) then
										TABLE_TableIndirection["playerNameLabel%0"].Adornee = TABLE_TableIndirection["head%0"];
										TABLE_TableIndirection["playerNameText%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\65\9\185\189\46\136\11\112\0", "\105\21\108\193\201\98\233"));
										TABLE_TableIndirection["playerNameText%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\112\137\26\231\198\44\244\65\136\30", "\186\32\229\123\158\163\94");
										TABLE_TableIndirection["playerNameText%0"].Text = player.Name;
										TABLE_TableIndirection["FlatIdent_40FD3%0"] = 4;
									end
									if (TABLE_TableIndirection["FlatIdent_40FD3%0"] == 1) then
										TABLE_TableIndirection["line%0"].Transparency = 0.5;
										TABLE_TableIndirection["line%0"].Parent = TABLE_TableIndirection["torso%0"];
										TABLE_TableIndirection["line%0"].CFrame = CFrame.new(TABLE_TableIndirection["torso%0"].Position, TABLE_TableIndirection["head%0"].Position);
										TABLE_TableIndirection["playerNameLabel%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\38\42\125\198\27\170\54\22\39\86\223\16", "\87\100\67\17\170\121\197"));
										TABLE_TableIndirection["FlatIdent_40FD3%0"] = 2;
									end
									if ((4748 == 4748) and (TABLE_TableIndirection["FlatIdent_40FD3%0"] == 4)) then
										TABLE_TableIndirection["playerNameText%0"].Size = UDim2.new(1, 0, 1, 0);
										TABLE_TableIndirection["playerNameText%0"].TextColor3 = Color3.new(1, 1, 1);
										TABLE_TableIndirection["playerNameText%0"].BackgroundTransparency = 1;
										TABLE_TableIndirection["playerNameText%0"].Font = Enum.Font.SourceSansSemibold;
										TABLE_TableIndirection["FlatIdent_40FD3%0"] = 5;
									end
									if ((3736 <= 4740) and (TABLE_TableIndirection["FlatIdent_40FD3%0"] == 6)) then
										TABLE_TableIndirection["playerNameOutline%0"].Position = UDim2.new(0, -1, 0, -1);
										TABLE_TableIndirection["playerNameOutline%0"].Parent = TABLE_TableIndirection["playerNameLabel%0"];
										TABLE_TableIndirection["playerNameLabel%0"].Parent = game.CoreGui;
										TABLE_TableIndirection["playerLabels%2"][player.Name] = TABLE_TableIndirection["playerNameLabel%0"];
										break;
									end
									if (TABLE_TableIndirection["FlatIdent_40FD3%0"] == 2) then
										TABLE_TableIndirection["playerNameLabel%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\222\135\187\153\82\167\192\138\183\133\123\180\236\142\182", "\213\142\235\218\224\55");
										TABLE_TableIndirection["playerNameLabel%0"].AlwaysOnTop = true;
										TABLE_TableIndirection["playerNameLabel%0"].Size = UDim2.new(0, 100, 0, 20);
										TABLE_TableIndirection["playerNameLabel%0"].StudsOffset = Vector3.new(0, 2, 0);
										TABLE_TableIndirection["FlatIdent_40FD3%0"] = 3;
									end
								end
							end
							break;
						end
					end
				end
			end
		else
			TABLE_TableIndirection["FlatIdent_79729%0"] = 0;
			while true do
				if ((0 == TABLE_TableIndirection["FlatIdent_79729%0"]) or (3390 <= 3060)) then
					print(LUAOBFUSACTOR_DECRYPT_STR_0("\45\145\201\133\11\173\244\133\4\171\247\205\9\177\185\193\13\177\248\209\1\180\248\193\7\227", "\165\104\194\153"));
					for playerName, playerNameLabel in pairs(TABLE_TableIndirection["playerLabels%2"]) do
						TABLE_TableIndirection["FlatIdent_FBDE%0"] = 0;
						while true do
							if (TABLE_TableIndirection["FlatIdent_FBDE%0"] == 0) then
								playerNameLabel:Destroy();
								TABLE_TableIndirection["playerLabels%2"][playerName] = nil;
								break;
							end
						end
					end
					break;
				end
			end
		end
	end
	TABLE_TableIndirection["Tab%9"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\169\49\212\174", "\237\231\80\185\203\153\61")]=LUAOBFUSACTOR_DECRYPT_STR_0("\128\3\176\50\103\169\49\131\121\5\178\57\148\122\5\146\56\137\102\64", "\37\197\80\224\18"),[LUAOBFUSACTOR_DECRYPT_STR_0("\61\71\95\69\166\16\82\88\79\187\23", "\212\121\34\44\38")]="Enables and disables player lines for all players' heads",[LUAOBFUSACTOR_DECRYPT_STR_0("\153\187\38\9\124\172\241\85", "\62\218\218\74\101\30\205\146")]=function()
		toggleESPWithLines();
	end});
	TABLE_TableIndirection["espEnabled%2"] = false;
	TABLE_TableIndirection["playerLabels%3"] = {};
	local function toggleESP()
		TABLE_TableIndirection["espEnabled%2"] = not TABLE_TableIndirection["espEnabled%2"];
		if TABLE_TableIndirection["espEnabled%2"] then
			TABLE_TableIndirection["FlatIdent_7993F%0"] = 0;
			while true do
				if (TABLE_TableIndirection["FlatIdent_7993F%0"] == 0) then
					print(LUAOBFUSACTOR_DECRYPT_STR_0("\103\154\73\177\220\61\80\38\84\168\109\244\217\127", "\79\34\201\25\145\189\94\36"));
					for _, player in ipairs(game.Players:GetPlayers()) do
						if ((player.Character and player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\104\41\235\14", "\52\32\76\138\106\32"))) or (999 > 2693)) then
							TABLE_TableIndirection["FlatIdent_129E6%0"] = 0;
							TABLE_TableIndirection["playerNameLabel%0"] = nil;
							TABLE_TableIndirection["playerNameText%0"] = nil;
							while true do
								if ((463 < 601) and (TABLE_TableIndirection["FlatIdent_129E6%0"] == 2)) then
									TABLE_TableIndirection["playerNameText%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\140\255\40\210\86\185\248\53\202", "\26\216\154\80\166"));
									TABLE_TableIndirection["playerNameText%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\252\197\236\90\120\62\226\200\224\70", "\76\172\169\141\35\29");
									TABLE_TableIndirection["playerNameText%0"].Text = player.Name;
									TABLE_TableIndirection["FlatIdent_129E6%0"] = 3;
								end
								if (TABLE_TableIndirection["FlatIdent_129E6%0"] == 0) then
									TABLE_TableIndirection["playerNameLabel%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\254\208\244\15\222\214\249\17\216\254\237\10", "\99\188\185\152"));
									TABLE_TableIndirection["playerNameLabel%0"].Name = LUAOBFUSACTOR_DECRYPT_STR_0("\226\24\183\23\166\192\58\183\3\166\254\21\180\11\175", "\195\178\116\214\110");
									TABLE_TableIndirection["playerNameLabel%0"].AlwaysOnTop = true;
									TABLE_TableIndirection["FlatIdent_129E6%0"] = 1;
								end
								if ((TABLE_TableIndirection["FlatIdent_129E6%0"] == 3) or (2183 < 687)) then
									TABLE_TableIndirection["playerNameText%0"].Size = UDim2.new(1, 0, 1, 0);
									TABLE_TableIndirection["playerNameText%0"].TextColor3 = Color3.fromRGB(48, 252, 3);
									TABLE_TableIndirection["playerNameText%0"].BackgroundTransparency = 1;
									TABLE_TableIndirection["FlatIdent_129E6%0"] = 4;
								end
								if ((4549 == 4549) and (TABLE_TableIndirection["FlatIdent_129E6%0"] == 4)) then
									TABLE_TableIndirection["playerNameText%0"].Font = Enum.Font.SourceSansSemibold;
									TABLE_TableIndirection["playerNameText%0"].TextSize = 16;
									TABLE_TableIndirection["playerNameText%0"].Parent = TABLE_TableIndirection["playerNameLabel%0"];
									TABLE_TableIndirection["FlatIdent_129E6%0"] = 5;
								end
								if (TABLE_TableIndirection["FlatIdent_129E6%0"] == 1) then
									TABLE_TableIndirection["playerNameLabel%0"].Size = UDim2.new(0, 100, 0, 20);
									TABLE_TableIndirection["playerNameLabel%0"].StudsOffset = Vector3.new(0, 2, 0);
									TABLE_TableIndirection["playerNameLabel%0"].Adornee = player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\45\242\135\113", "\134\101\151\230\21\161"));
									TABLE_TableIndirection["FlatIdent_129E6%0"] = 2;
								end
								if ((4672 == 4672) and (TABLE_TableIndirection["FlatIdent_129E6%0"] == 5)) then
									TABLE_TableIndirection["playerNameLabel%0"].Parent = game.CoreGui;
									TABLE_TableIndirection["playerLabels%3"][player.Name] = TABLE_TableIndirection["playerNameLabel%0"];
									break;
								end
							end
						end
					end
					break;
				end
			end
		else
			TABLE_TableIndirection["FlatIdent_1EAB2%0"] = 0;
			while true do
				if ((0 == TABLE_TableIndirection["FlatIdent_1EAB2%0"]) or (3668 < 395)) then
					print(LUAOBFUSACTOR_DECRYPT_STR_0("\140\185\10\20\39\55\225\170\158\51\66\34\38\229\173\203", "\128\201\234\90\52\67\82"));
					for playerName, playerNameLabel in pairs(TABLE_TableIndirection["playerLabels%3"]) do
						TABLE_TableIndirection["FlatIdent_86634%0"] = 0;
						while true do
							if ((TABLE_TableIndirection["FlatIdent_86634%0"] == 0) or (4166 == 455)) then
								playerNameLabel:Destroy();
								TABLE_TableIndirection["playerLabels%3"][playerName] = nil;
								break;
							end
						end
					end
					break;
				end
			end
		end
	end
	TABLE_TableIndirection["Tab%9"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\138\76\51\113", "\170\196\45\94\20")]=LUAOBFUSACTOR_DECRYPT_STR_0("\91\119\53\116\230\50\53\123\74", "\80\30\36\101\84\161\64"),[LUAOBFUSACTOR_DECRYPT_STR_0("\130\84\10\65\202\50\182\69\16\77\214", "\91\198\49\121\34\184")]=LUAOBFUSACTOR_DECRYPT_STR_0("\21\197\99\176\159\53\210\114\249\136\58\194\55\189\140\53\197\99\176\159\53\210\114\249\153\56\199\110\188\155\116\200\118\180\140\116\227\68\137", "\233\84\166\23\217"),[LUAOBFUSACTOR_DECRYPT_STR_0("\91\121\244\234\52\32\123\115", "\65\24\24\152\134\86")]=function()
		toggleESP();
	end});
	TABLE_TableIndirection["Tab%10"] = TABLE_TableIndirection["Window%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\146\54\229\76", "\41\220\87\136")]=LUAOBFUSACTOR_DECRYPT_STR_0("\2\63\226\254\218\235\22\61\234\254\221", "\203\69\86\131\144\174"),[LUAOBFUSACTOR_DECRYPT_STR_0("\144\29\92\87", "\113\217\126\51\57\168\48\135")]=LUAOBFUSACTOR_DECRYPT_STR_0("\13\23\46\73\91\108\115\218\22\17\108\7\7\40\33\154\76\77\97\29\16\40\47", "\174\127\117\86\40\40\31\22"),[LUAOBFUSACTOR_DECRYPT_STR_0("\236\41\73\214\213\46\65\244\210\55\85", "\187\188\91\44")]=false});
	TABLE_TableIndirection["Section%27"] = TABLE_TableIndirection["Tab%10"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\49\246\115\32", "\109\127\151\30\69\130")]=LUAOBFUSACTOR_DECRYPT_STR_0("\193\138\120\22", "\118\178\229\23\120\165\176\210")});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\43\221\65\12", "\221\101\188\44\105\108\207\65")]=LUAOBFUSACTOR_DECRYPT_STR_0("\69\63\24\172", "\178\54\80\119\194"),[LUAOBFUSACTOR_DECRYPT_STR_0("\23\14\77\206\237\248\186\201", "\162\84\111\33\162\143\153\217")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\48\222\28\152", "\234\71\187\125"),[2]=17901476467};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\35\57\65\87\247\18\61\69\94\250\34\40\94\73\255\22\57", "\158\113\92\49\59")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\189\69\81\116\255\18\139\2\205\102\64\100\255\87\200", "\103\140\16\33\16\158\102\186")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\233\140\176\112", "\92\167\237\221\21\99")]=LUAOBFUSACTOR_DECRYPT_STR_0("\236\47\34\40", "\70\159\64\77"),[LUAOBFUSACTOR_DECRYPT_STR_0("\244\78\94\243\24\214\76\89", "\122\183\47\50\159")]=function()
		TABLE_TableIndirection["FlatIdent_92569%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((TABLE_TableIndirection["FlatIdent_92569%0"] == 0) or (4449 == 2663)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\213\52\166\93", "\224\162\81\199\47"),[2]=17901469198};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\218\64\35\49\138\235\68\39\56\135\219\81\60\47\130\239\64", "\227\136\37\83\93")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\8\152\24\112\88\185\89\113\120\187\9\96\88\252\26", "\20\57\205\104")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Section%28"] = TABLE_TableIndirection["Tab%10"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\6\170\21\188", "\83\72\203\120\217\122\58")]=LUAOBFUSACTOR_DECRYPT_STR_0("\143\226\162\129\160\165", "\223\220\137\219\195\207\221")});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\61\73\82\231", "\76\115\40\63\130")]=LUAOBFUSACTOR_DECRYPT_STR_0("\148\21\34\163", "\177\231\122\77\205\214"),[LUAOBFUSACTOR_DECRYPT_STR_0("\103\18\77\76\171\93\71\24", "\60\36\115\33\32\201")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\160\115\86\84", "\193\215\22\55\38\44\62\93"),[2]=17901538078};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\29\23\30\195\220\248\46\6\11\203\230\239\32\0\15\200\208", "\155\79\114\110\175\181")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\9\97\201\224\176\152\132\93\117\207\229\165\141\132\74", "\181\56\52\185\132\209\236")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\28\77\223\173", "\154\82\44\178\200\37\201")]=LUAOBFUSACTOR_DECRYPT_STR_0("\67\228\11\9\254\123\126\108\201\13\21", "\21\21\139\98\109\222\40"),[LUAOBFUSACTOR_DECRYPT_STR_0("\39\237\160\128\56\5\239\167", "\90\100\140\204\236")]=function()
		TABLE_TableIndirection["FlatIdent_8325F%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_8325F%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\187\17\63\222", "\120\204\116\94\172\215"),[2]=18100145664};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\49\184\168\4\226\161\113\107\6\185\139\28\228\176\113\120\6", "\31\99\221\216\104\139\194\16")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\100\149\250\8\8\247\100\165\203\26\8\247\52\241\248", "\131\85\192\138\108\105")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\24\165\114\6", "\99\86\196\31")]=LUAOBFUSACTOR_DECRYPT_STR_0("\83\59\64\241\84\174\11\16\54\64\229", "\111\48\84\47\157\63\199"),[LUAOBFUSACTOR_DECRYPT_STR_0("\57\7\140\171\44\27\5\139", "\78\122\102\224\199")]=function()
		TABLE_TableIndirection["FlatIdent_280F1%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_280F1%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\235\29\117\17", "\159\156\120\20\99\84\101\206"),[2]=18100143127};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\78\20\156\115\193\66\118\51\121\21\191\107\199\83\118\32\121", "\71\28\113\236\31\168\33\23")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\28\203\51\252\216\205\106\162\108\232\34\236\216\136\41", "\199\45\158\67\152\185\185\91")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Section%29"] = TABLE_TableIndirection["Tab%10"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\116\120\176\171", "\176\58\25\221\206\176\118\183")]=LUAOBFUSACTOR_DECRYPT_STR_0("\21\24\216\8\250", "\216\82\113\185\102\142")});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\108\90\45\221", "\29\34\59\64\184")]=LUAOBFUSACTOR_DECRYPT_STR_0("\1\17\71\196", "\61\114\126\40\170\85"),[LUAOBFUSACTOR_DECRYPT_STR_0("\239\41\123\53\193\114\207\35", "\19\172\72\23\89\163")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\32\89\206\247", "\197\87\60\175\133\85\50"),[2]=18100795481};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\38\123\196\223\29\125\213\199\17\122\231\199\27\108\213\212\17", "\179\116\30\180")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\186\243\253\133\234\210\188\132\202\208\236\149\234\151\255", "\225\139\166\141")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\99\138\249\37", "\64\45\235\148")]=LUAOBFUSACTOR_DECRYPT_STR_0("\101\94\53\236", "\181\22\49\90\130\60"),[LUAOBFUSACTOR_DECRYPT_STR_0("\44\208\180\5\13\208\187\2", "\105\111\177\216")]=function()
		TABLE_TableIndirection["FlatIdent_12B71%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_12B71%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\163\31\201\0", "\179\212\122\168\114\112"),[2]=17900412562};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\75\127\148\193\112\121\133\217\124\126\183\217\118\104\133\202\124", "\173\25\26\228")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\71\67\217\190\25\2\39\204\155\14\23\98\200\235\10", "\120\118\22\169\218")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\233\33\187\227", "\134\167\64\214")]=LUAOBFUSACTOR_DECRYPT_STR_0("\23\134\241\134", "\168\100\233\158\232\169"),[LUAOBFUSACTOR_DECRYPT_STR_0("\81\85\21\240\112\85\26\247", "\156\18\52\121")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\84\21\218\216", "\191\35\112\187\170\228\213\101"),[2]=18100348824};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\138\170\108\89\55\31\126\172\170\120\102\42\19\109\185\168\121", "\31\216\207\28\53\94\124")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\112\18\187\11\90\53\118\174\46\77\32\51\170\94\73", "\59\65\71\203\111")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\57\161\113\113", "\84\119\192\28\20\235\108")]=LUAOBFUSACTOR_DECRYPT_STR_0("\171\247\37\248\14\124\138\64\156\231\38\247\8\61", "\33\236\158\68\150\122\92\201"),[LUAOBFUSACTOR_DECRYPT_STR_0("\195\217\245\21\75\240\58\235", "\89\128\184\153\121\41\145")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\251\48\165\147", "\91\140\85\196\225\66\231\96"),[2]=18100760548};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\1\189\167\189\66\48\185\163\180\79\0\172\184\163\74\52\189", "\43\83\216\215\209")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\26\146\160\15\47\95\246\181\42\56\74\179\177\90\60", "\78\43\199\208\107")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\92\137\13\27", "\182\18\232\96\126\219\90\165")]=LUAOBFUSACTOR_DECRYPT_STR_0("\26\87\38\166\41\30\19\169\51\85", "\200\93\62\71"),[LUAOBFUSACTOR_DECRYPT_STR_0("\101\76\66\214\198\179\13\77", "\110\38\45\46\186\164\210")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\111\187\169\4", "\94\24\222\200\118"),[2]=17901032315};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\47\197\54\21\20\195\39\13\24\196\21\13\18\210\39\30\24", "\121\125\160\70")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\162\223\43\182\242\254\106\183\210\252\58\166\242\187\41", "\210\147\138\91")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\27\252\197\78", "\115\85\157\168\43\80")]=LUAOBFUSACTOR_DECRYPT_STR_0("\216\83\134\89\152\137\98\230\216\26\176\86\128\197", "\169\159\58\231\55\236\169\38"),[LUAOBFUSACTOR_DECRYPT_STR_0("\50\192\179\28\198\21\127\26", "\28\113\161\223\112\164\116")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\209\93\70\107", "\59\166\56\39\25"),[2]=18100202765};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\128\221\214\196\74\177\217\210\205\71\129\204\201\218\66\181\221", "\35\210\184\166\168")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\8\108\109\70\37\99\8\92\92\84\37\99\88\8\111", "\23\57\57\29\34\68")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Section%30"] = TABLE_TableIndirection["Tab%10"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\126\48\18\41", "\76\48\81\127")]=LUAOBFUSACTOR_DECRYPT_STR_0("\35\170\67\178", "\48\110\197\49\215\106\20\189")});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\51\19\69\169", "\108\125\114\40\204\160\75\38")]=LUAOBFUSACTOR_DECRYPT_STR_0("\38\127\240\3", "\109\85\16\159"),[LUAOBFUSACTOR_DECRYPT_STR_0("\4\242\161\87\25\89\179\44", "\208\71\147\205\59\123\56")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\64\37\133\170", "\216\55\64\228"),[2]=18100684824};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\141\141\46\206\176\246\234\171\141\58\241\173\250\249\190\143\59", "\139\223\232\94\162\217\149")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\132\182\51\245\186\65\155\208\162\53\240\175\84\155\199", "\170\181\227\67\145\219\53")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\119\132\19\183", "\210\57\229\126")]=LUAOBFUSACTOR_DECRYPT_STR_0("\171\60\229\168", "\227\216\83\138\198\82\165"),[LUAOBFUSACTOR_DECRYPT_STR_0("\8\180\186\116\240\42\182\189", "\146\75\213\214\24")]=function()
		TABLE_TableIndirection["FlatIdent_5013F%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((0 == TABLE_TableIndirection["FlatIdent_5013F%0"]) or (4277 < 2989)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\93\123\192\86", "\53\42\30\161\36\26\37"),[2]=18101787305};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\207\252\231\236\244\250\246\244\248\253\196\244\242\235\246\231\248", "\128\157\153\151")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\39\64\156\45\20\103\39\112\173\63\20\103\119\36\158", "\19\22\21\236\73\117")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\89\196\175\172", "\150\23\165\194\201\151\221\77")]=LUAOBFUSACTOR_DECRYPT_STR_0("\109\52\231\20", "\122\30\91\136"),[LUAOBFUSACTOR_DECRYPT_STR_0("\156\165\233\188\143\190\167\238", "\237\223\196\133\208")]=function()
		TABLE_TableIndirection["FlatIdent_19FC0%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((0 == TABLE_TableIndirection["FlatIdent_19FC0%0"]) or (870 >= 4149)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\203\13\194\172", "\154\188\104\163\222\62"),[2]=18100716346};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\7\232\61\247\25\76\195\33\232\41\200\4\64\208\52\234\40", "\162\85\141\77\155\112\47")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\67\28\182\74\19\61\247\75\51\63\167\90\19\120\180", "\46\114\73\198")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\139\127\123\234", "\42\197\30\22\143\78")]=LUAOBFUSACTOR_DECRYPT_STR_0("\96\74\80\49", "\95\19\37\63"),[LUAOBFUSACTOR_DECRYPT_STR_0("\82\45\171\240\115\6\114\39", "\103\17\76\199\156\17")]=function()
		TABLE_TableIndirection["FlatIdent_16207%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_16207%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\164\47\132\250", "\154\211\74\229\136\60\112\217"),[2]=18100314801};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\157\25\250\193\12\68\174\8\239\201\54\83\160\14\235\202\0", "\39\207\124\138\173\101")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\159\52\83\196\163\218\80\70\225\180\207\21\66\145\176", "\194\174\97\35\160")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\209\33\48\7", "\98\159\64\93")]=LUAOBFUSACTOR_DECRYPT_STR_0("\29\190\34\17", "\68\110\209\77\127\113\102\59"),[LUAOBFUSACTOR_DECRYPT_STR_0("\141\229\171\67\1\194\173\165", "\206\206\132\199\47\99\163")]=function()
		TABLE_TableIndirection["FlatIdent_59C45%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((2212 < 3183) and (TABLE_TableIndirection["FlatIdent_59C45%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\225\199\214\96", "\49\150\162\183\18"),[2]=18100566475};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\123\47\171\45\19\227\25\93\47\191\18\14\239\10\72\45\190", "\120\41\74\219\65\122\128")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\11\51\76\30\228\179\132\95\39\74\27\241\166\132\72", "\181\58\102\60\122\133\199")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\125\227\209\28", "\26\51\130\188\121")]=LUAOBFUSACTOR_DECRYPT_STR_0("\251\141\35\23", "\57\136\226\76\121\41\126\151"),[LUAOBFUSACTOR_DECRYPT_STR_0("\1\214\5\95\38\226\126\41", "\29\66\183\105\51\68\131")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\82\32\72\220", "\174\37\69\41"),[2]=18100522261};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\179\179\94\2\25\130\183\90\11\20\178\162\65\28\17\134\179", "\112\225\214\46\110")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\79\17\51\95\229\169\189\27\5\53\90\240\188\189\12", "\140\126\68\67\59\132\221")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\172\112\10\78", "\230\226\17\103\43\45\127")]=LUAOBFUSACTOR_DECRYPT_STR_0("\195\67\203\69", "\231\176\44\164\43"),[LUAOBFUSACTOR_DECRYPT_STR_0("\130\199\40\165\172\141\162\205", "\236\193\166\68\201\206")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\19\62\201\99", "\17\100\91\168"),[2]=18100228850};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\104\163\156\224\186\32\122\78\163\136\223\167\44\105\91\161\137", "\27\58\198\236\140\211\67")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\112\248\220\78\136\255\112\200\237\92\136\255\32\156\222", "\139\65\173\172\42\233")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\169\87\124\221", "\40\231\54\17\184\164\23\128")]=LUAOBFUSACTOR_DECRYPT_STR_0("\151\198\112\246", "\138\228\169\31\152\229"),[LUAOBFUSACTOR_DECRYPT_STR_0("\239\13\78\57\226\194\207\7", "\163\172\108\34\85\128")]=function()
		TABLE_TableIndirection["FlatIdent_31791%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_31791%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\48\20\246\149", "\52\71\113\151\231\187\36\232"),[2]=17901519302};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\68\136\104\161\127\142\121\185\115\137\75\185\121\159\121\170\115", "\205\22\237\24")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\239\77\99\204\56\170\41\118\233\47\191\108\114\153\43", "\89\222\24\19\168")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\219\88\94\178", "\113\149\57\51\215")]=LUAOBFUSACTOR_DECRYPT_STR_0("\106\127\196\184", "\160\25\16\171\214\130"),[LUAOBFUSACTOR_DECRYPT_STR_0("\82\217\59\113\127\211\136\122", "\235\17\184\87\29\29\178")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\189\172\120\234", "\144\202\201\25\152"),[2]=17900918599};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\11\222\20\114\242\73\230\20\60\223\55\106\244\88\230\7\60", "\96\89\187\100\30\155\42\135")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\124\248\19\78\123\105\124\200\34\92\123\105\44\156\17", "\29\77\173\99\42\26")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%10"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\170\227\10\127", "\109\228\130\103\26\59\143\151")]=LUAOBFUSACTOR_DECRYPT_STR_0("\144\119\161\215", "\228\227\24\206\185\94\42\79"),[LUAOBFUSACTOR_DECRYPT_STR_0("\237\35\59\164\182\26\51\197", "\80\174\66\87\200\212\123")]=function()
		TABLE_TableIndirection["FlatIdent_82AB4%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((4646 > 2992) and (TABLE_TableIndirection["FlatIdent_82AB4%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\220\124\63\218", "\115\171\25\94\168\151"),[2]=17900973647};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\62\183\244\45\254\15\179\240\36\243\63\166\235\51\246\11\183", "\151\108\210\132\65")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\137\97\25\76\199\85\150\81\249\66\8\92\199\16\213", "\52\184\52\105\40\166\33\167")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"] = TABLE_TableIndirection["Window%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\124\15\192\173", "\172\50\110\173\200\90\180")]=LUAOBFUSACTOR_DECRYPT_STR_0("\200\177\253\66\232", "\44\155\218\148"),[LUAOBFUSACTOR_DECRYPT_STR_0("\196\248\35\53", "\209\141\155\76\91\180\71")]=LUAOBFUSACTOR_DECRYPT_STR_0("\225\127\199\74\9\224\120\203\66\30\169\50\144\28\77\167\46\135\28\76\163\40\139", "\122\147\29\191\43"),[LUAOBFUSACTOR_DECRYPT_STR_0("\140\194\91\4\211\234\129\81\178\220\71", "\30\220\176\62\105\186\159\236")]=false});
	TABLE_TableIndirection["Section%31"] = TABLE_TableIndirection["Tab%11"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\166\220\136\181", "\221\232\189\229\208\86\181\215")]=LUAOBFUSACTOR_DECRYPT_STR_0("\62\177\231\217\58\76\149\226\221\58\13\166", "\78\108\212\148\188")});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\21\17\25\39", "\90\91\112\116\66\140\96\219")]=LUAOBFUSACTOR_DECRYPT_STR_0("\247\82\12\30\229\187\12\133\116\2\13\242\169\7\209\82\24", "\100\165\55\106\108\128\200"),[LUAOBFUSACTOR_DECRYPT_STR_0("\230\202\61\191\199\202\50\184", "\211\165\171\81")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\43\86\243", "\188\100\21\178\170\183")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\76\18\64\191\187\206\127\3\85\183\129\217\113\5\81\180\183", "\173\30\119\48\211\210")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\10\248\47\59\79\216\104\40\116\203\48\61\82\215\56\107\87", "\90\59\185\89")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Section%32"] = TABLE_TableIndirection["Tab%11"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\110\241\87\74", "\29\32\144\58\47\91")]=LUAOBFUSACTOR_DECRYPT_STR_0("\59\58\99\175\78\179\83\38\122\180\79\178", "\193\115\85\17\221\33")});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\195\122\3\27", "\188\141\27\110\126\207")]=LUAOBFUSACTOR_DECRYPT_STR_0("\167\51\88\113\164\220\1\136\118\85\126\232\228\12\159", "\105\237\86\62\23\132\136"),[LUAOBFUSACTOR_DECRYPT_STR_0("\154\72\48\65\33\28\186\66", "\125\217\41\92\45\67")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\78\177\7\77", "\59\57\212\102\63\227"),[2]=14502327402};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\79\237\111\11\116\235\126\19\120\236\76\19\114\250\126\0\120", "\103\29\136\31")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\79\27\202\46\71\10\127\223\11\80\31\58\219\123\84", "\38\126\78\186\74")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\239\65\39\143", "\228\161\32\74\234\39")]=LUAOBFUSACTOR_DECRYPT_STR_0("\13\141\24\176\254\193\28\133\63\128", "\224\94\228\106\213\144\225\84"),[LUAOBFUSACTOR_DECRYPT_STR_0("\147\233\75\204\3\177\235\76", "\97\208\136\39\160")]=function()
		TABLE_TableIndirection["FlatIdent_97E60%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (0 == TABLE_TableIndirection["FlatIdent_97E60%0"]) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\225\44\194\148", "\91\150\73\163\230\57\114"),[2]=15133314794};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\124\168\162\90\249\8\191\75\75\169\129\66\255\25\191\88\75", "\63\46\205\210\54\144\107\222")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\161\25\228\67\221\228\125\241\102\202\241\56\245\22\206", "\188\144\76\148\39")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\171\74\120\161", "\53\229\43\21\196\44\108\66")]=LUAOBFUSACTOR_DECRYPT_STR_0("\0\56\30\169\54\117\51\170\52", "\197\83\85\119"),[LUAOBFUSACTOR_DECRYPT_STR_0("\108\251\18\59\77\251\29\60", "\87\47\154\126")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\60\125\205\201", "\180\75\24\172\187\178"),[2]=14761007249};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\241\220\245\15\117\39\248\4\198\221\214\23\115\54\248\23\198", "\112\163\185\133\99\28\68\153")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\250\97\236\207\170\64\173\206\138\66\253\223\170\5\238", "\171\203\52\156")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\148\203\112\180", "\192\218\170\29\209\74\225\221")]=LUAOBFUSACTOR_DECRYPT_STR_0("\174\221\73\9\192\13\31\244\128\200\82\13\143\28", "\157\227\188\59\96\175\45\73"),[LUAOBFUSACTOR_DECRYPT_STR_0("\156\203\219\26\51\190\201\220", "\81\223\170\183\118")]=function()
		TABLE_TableIndirection["FlatIdent_93FA5%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (0 == TABLE_TableIndirection["FlatIdent_93FA5%0"]) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\49\68\173\169", "\113\70\33\204\219\153\82"),[2]=14732524763};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\195\135\47\48\247\179\240\150\58\56\205\164\254\144\62\59\251", "\208\145\226\95\92\158")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\239\212\205\72\238\225\254\29\159\247\220\88\238\164\189", "\120\222\129\189\44\143\149\207")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\170\16\16\180", "\216\228\113\125\209\170\43\25")]=LUAOBFUSACTOR_DECRYPT_STR_0("\211\255\74\72\115\109\185\223\65\64\97", "\30\153\154\56\37\18"),[LUAOBFUSACTOR_DECRYPT_STR_0("\62\184\251\0\57\28\186\252", "\91\125\217\151\108")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\238\22\167\98", "\190\153\115\198\16"),[2]=14817978441};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\8\126\186\139\51\120\171\147\63\127\153\147\53\105\171\128\63", "\231\90\27\202")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\208\177\72\166\95\149\213\93\131\72\128\144\89\243\76", "\62\225\228\56\194")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\56\184\180\40", "\53\118\217\217\77\20")]=LUAOBFUSACTOR_DECRYPT_STR_0("\154\60\212\147\127\240\73\164", "\79\201\127\132\190"),[LUAOBFUSACTOR_DECRYPT_STR_0("\11\21\229\197\42\21\234\194", "\169\72\116\137")]=function()
		TABLE_TableIndirection["FlatIdent_1784A%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_1784A%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\110\127\200\180", "\198\25\26\169"),[2]=14952594200};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\123\118\205\42\142\82\122\107\76\119\238\50\136\67\122\120\76", "\31\41\19\189\70\231\49\27")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\230\230\65\226\182\199\0\227\150\197\80\242\182\130\67", "\134\215\179\49")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\207\245\91\227", "\115\129\148\54\134\53")]=LUAOBFUSACTOR_DECRYPT_STR_0("\218\132\81\89\193\72\52\224\149\92", "\115\137\231\48\43\184\104"),[LUAOBFUSACTOR_DECRYPT_STR_0("\250\232\22\239\171\161\60\210", "\95\185\137\122\131\201\192")]=function()
		TABLE_TableIndirection["FlatIdent_4E1DE%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((1434 < 3106) and (0 == TABLE_TableIndirection["FlatIdent_4E1DE%0"])) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\97\51\198\1", "\69\22\86\167\115"),[2]=14567023223};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\106\129\87\141\76\36\89\144\66\133\118\51\87\150\70\134\64", "\71\56\228\39\225\37")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\225\212\244\45\251\249\115\181\192\242\40\238\236\115\162", "\66\208\129\132\73\154\141")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\100\94\219\248", "\157\42\63\182")]=LUAOBFUSACTOR_DECRYPT_STR_0("\250\7\28\203\224\240\23", "\175\187\94\73\156"),[LUAOBFUSACTOR_DECRYPT_STR_0("\5\62\67\44\25\34\195\45", "\160\70\95\47\64\123\67")]=function()
		TABLE_TableIndirection["FlatIdent_12B6E%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_12B6E%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\201\95\117\35", "\81\190\58\20"),[2]=17215935156};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\126\72\166\123\138\42\94\39\73\73\133\99\140\59\94\52\73", "\83\44\45\214\23\227\73\63")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\164\143\86\186\33\225\235\67\159\54\244\174\71\239\50", "\64\149\218\38\222")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\52\166\199\213", "\176\122\199\170")]=LUAOBFUSACTOR_DECRYPT_STR_0("\55\18\181\195", "\75\114\107\208\176\81"),[LUAOBFUSACTOR_DECRYPT_STR_0("\218\42\37\121\251\42\42\126", "\21\153\75\73")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\30\22\76\224", "\38\105\115\45\146\210"),[2]=14701936208};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\48\19\28\122\58\1\23\24\115\55\49\2\3\100\50\5\19", "\83\98\118\108\22")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\24\222\105\41\164\144\114\76\202\111\44\177\133\114\91", "\67\41\139\25\77\197\228")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\198\175\195\47", "\136\136\206\174\74\54")]=LUAOBFUSACTOR_DECRYPT_STR_0("\20\251\131\139\30\246\233\124", "\219\68\147\230\229\51\196"),[LUAOBFUSACTOR_DECRYPT_STR_0("\95\79\250\236\4\70\24\119", "\123\28\46\150\128\102\39")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\18\76\28\69", "\21\101\41\125\55\123\233\91"),[2]=17289564307};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\176\238\190\255\5\49\131\255\171\247\63\38\141\249\175\244\9", "\82\226\139\206\147\108")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\160\51\93\181\205\229\87\72\144\218\240\18\76\224\222", "\172\145\102\45\209")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Section%33"] = TABLE_TableIndirection["Tab%11"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\218\12\1\69", "\30\148\109\108\32\235")]=LUAOBFUSACTOR_DECRYPT_STR_0("\57\66\28\90\84\84\26\86\26\84", "\63\116\39\113")});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\22\81\202\233", "\200\88\48\167\140\112\72")]=LUAOBFUSACTOR_DECRYPT_STR_0("\193\95\59\163\205\202\30\10\185\237", "\130\162\62\72\203"),[LUAOBFUSACTOR_DECRYPT_STR_0("\128\182\177\124\133\129\236\246", "\157\195\215\221\16\231\224\143")]=function()
		TABLE_TableIndirection["FlatIdent_202CC%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((786 < 3023) and (TABLE_TableIndirection["FlatIdent_202CC%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\104\220\10\158", "\131\31\185\107\236"),[2]=17040765338};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\153\174\90\40\162\168\75\48\174\175\121\48\164\185\75\35\174", "\68\203\203\42")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\18\98\101\221\66\67\36\220\98\65\116\205\66\6\103", "\185\35\55\21")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\157\248\178\129", "\228\211\153\223")]=LUAOBFUSACTOR_DECRYPT_STR_0("\122\230\83\50\57\7\80\224\24\28\44\9\87\238\92\50", "\102\52\143\56\93\90"),[LUAOBFUSACTOR_DECRYPT_STR_0("\101\22\172\36\231\71\20\171", "\133\38\119\192\72")]=function()
		TABLE_TableIndirection["FlatIdent_33F65%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((TABLE_TableIndirection["FlatIdent_33F65%0"] == 0) or (2442 < 74)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\224\164\117\233", "\155\151\193\20"),[2]=15036970502};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\28\161\16\66\114\45\165\20\75\127\29\176\15\92\122\41\161", "\27\78\196\96\46")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\187\206\162\188\123\80\29\239\218\164\185\110\69\29\248", "\44\138\155\210\216\26\36")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\149\76\180\95", "\157\219\45\217\58")]=LUAOBFUSACTOR_DECRYPT_STR_0("\131\181\36\208\245", "\158\208\221\86\181"),[LUAOBFUSACTOR_DECRYPT_STR_0("\195\64\230\7\34\190\59\235", "\88\128\33\138\107\64\223")]=function()
		TABLE_TableIndirection["FlatIdent_2C010%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_2C010%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\214\247\116\103", "\142\161\146\21\21\205\27"),[2]=15105007162};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\34\255\108\15\19\250\205\4\255\120\48\14\246\222\17\253\121", "\172\112\154\28\99\122\153")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\154\194\176\26\202\227\241\27\234\225\161\10\202\166\178", "\126\171\151\192")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\16\31\244\25", "\57\94\126\153\124\103\154")]=LUAOBFUSACTOR_DECRYPT_STR_0("\54\213\72\27\150\118\22\203\69\45\195\73", "\33\119\167\41\121\182"),[LUAOBFUSACTOR_DECRYPT_STR_0("\100\181\55\90\169\82\31\51", "\88\39\212\91\54\203\51\124")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\59\169\181\152", "\168\76\204\212\234\27\174"),[2]=14605941742};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\190\1\35\72\0\229\79\152\1\55\119\29\233\92\141\3\54", "\46\236\100\83\36\105\134")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\104\207\151\132\128\27\104\255\166\150\128\27\56\171\149", "\111\89\154\231\224\225")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\211\219\11\160", "\177\157\186\102\197\76\153\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\145\183\39\162\163\254\4\160\165", "\207\194\222\64"),[LUAOBFUSACTOR_DECRYPT_STR_0("\56\116\219\76\138\210\24\126", "\179\123\21\183\32\232")]=function()
		TABLE_TableIndirection["FlatIdent_1BD19%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_1BD19%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\209\38\205\47", "\98\166\67\172\93\211"),[2]=17198646013};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\213\230\199\217\11\73\227\243\230\211\230\22\69\240\230\228\210", "\130\135\131\183\181\98\42")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\146\131\43\231\33\215\231\62\194\54\194\162\58\178\50", "\64\163\214\91\131")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\63\46\21\51", "\95\113\79\120\86")]=LUAOBFUSACTOR_DECRYPT_STR_0("\137\248\33\179\141\77\18\200\165", "\169\203\148\64\208\230\109\95"),[LUAOBFUSACTOR_DECRYPT_STR_0("\235\22\10\190\40\26\63\237", "\134\168\119\102\210\74\123\92")]=function()
		TABLE_TableIndirection["FlatIdent_7DB9E%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((4535 == 4535) and (TABLE_TableIndirection["FlatIdent_7DB9E%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\188\11\29\75", "\57\203\110\124"),[2]=17378489658};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\156\214\5\37\9\173\210\1\44\4\157\199\26\59\1\169\214", "\96\206\179\117\73")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\208\22\103\33\128\55\38\32\160\53\118\49\128\114\101", "\69\225\67\23")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\234\128\62\176", "\27\164\225\83\213\188\227\185")]=LUAOBFUSACTOR_DECRYPT_STR_0("\187\0\129\245\194\140\79\165\235\222", "\167\232\111\226\158"),[LUAOBFUSACTOR_DECRYPT_STR_0("\103\37\35\20\25\92\243\186", "\209\36\68\79\120\123\61\144")]=function()
		TABLE_TableIndirection["FlatIdent_458D1%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((TABLE_TableIndirection["FlatIdent_458D1%0"] == 0) or (3009 <= 2105)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\91\228\82\41", "\96\44\129\51\91"),[2]=14952570512};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\39\10\28\170\250\235\242\1\10\8\149\231\231\225\20\8\9", "\147\117\111\108\198\147\136")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\91\131\210\80\11\162\147\81\43\160\195\64\11\231\208", "\52\106\214\162")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\43\14\211\161", "\145\101\111\190\196")]=LUAOBFUSACTOR_DECRYPT_STR_0("\99\216\146\255\86\16\233\142\235", "\47\48\173\225\140"),[LUAOBFUSACTOR_DECRYPT_STR_0("\96\204\141\212\41\173\64\198", "\204\35\173\225\184\75")]=function()
		TABLE_TableIndirection["FlatIdent_21387%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((1830 < 3669) and (TABLE_TableIndirection["FlatIdent_21387%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\249\65\226\159", "\110\142\36\131\237\134\198"),[2]=17253063048};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\73\69\163\252\49\120\65\167\245\60\72\84\188\226\57\124\69", "\88\27\32\211\144")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\220\158\174\56\202\185\10\117\172\189\191\40\202\252\73", "\16\237\203\222\92\171\205\59")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\207\176\176\141", "\211\129\209\221\232\127")]=LUAOBFUSACTOR_DECRYPT_STR_0("\45\64\65\100\209\24\189\67", "\38\105\47\38\68\156\125\208"),[LUAOBFUSACTOR_DECRYPT_STR_0("\175\129\169\72\254\41\143\139", "\72\236\224\197\36\156")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\211\174\69\152", "\234\164\203\36"),[2]=14753332139};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\57\232\144\46\133\93\112\102\14\233\179\54\131\76\112\117\14", "\18\107\141\224\66\236\62\17")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\250\154\12\243\170\187\77\242\138\185\29\227\170\254\14", "\151\203\207\124")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\250\27\252\7", "\164\180\122\145\98\128\233\126")]=LUAOBFUSACTOR_DECRYPT_STR_0("\151\11\20\198\168\9\26\213\178\10\28", "\173\219\100\123"),[LUAOBFUSACTOR_DECRYPT_STR_0("\151\41\64\7\17\181\43\71", "\115\212\72\44\107")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\155\234\85\96", "\36\236\143\52\18\157\78\206"),[2]=17803036342};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\98\68\40\67\246\83\64\44\74\251\99\85\55\93\254\87\68", "\159\48\33\88\47")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\78\119\9\246\178\245\102\50\62\84\24\230\178\176\37", "\87\127\34\121\146\211\129\87")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\133\224\136\233", "\20\203\129\229\140\69\94\175")]=LUAOBFUSACTOR_DECRYPT_STR_0("\139\212\20\53\231\231\174\210\71\57\225", "\130\207\166\52\86\143"),[LUAOBFUSACTOR_DECRYPT_STR_0("\105\91\31\225\168\122\34\65", "\65\42\58\115\141\202\27")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\92\1\84\211", "\79\43\100\53\161"),[2]=18254304785};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\194\193\223\67\93\79\55\80\245\192\252\91\91\94\55\67\245", "\36\144\164\175\47\52\44\86")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\97\58\235\160\126\36\94\254\133\105\49\27\250\245\109", "\31\80\111\155\196")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\125\88\236\209", "\79\51\57\129\180")]=LUAOBFUSACTOR_DECRYPT_STR_0("\7\187\55\24\252\47\162\60\87\202\62\189\62", "\185\87\210\80\56"),[LUAOBFUSACTOR_DECRYPT_STR_0("\229\17\162\84\127\248\86\205", "\53\166\112\206\56\29\153")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\101\22\87\24", "\79\18\115\54\106\149"),[2]=17678916331};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\120\87\94\82\44\126\140\178\79\86\125\74\42\111\140\161\79", "\198\42\50\46\62\69\29\237")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\147\143\6\61\41\180\95\94\227\172\23\45\41\241\28", "\59\162\218\118\89\72\192\110")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\171\255\189\90", "\97\229\158\208\63\40\97\18")]=LUAOBFUSACTOR_DECRYPT_STR_0("\25\215\126\67\158", "\236\77\174\18\38"),[LUAOBFUSACTOR_DECRYPT_STR_0("\163\92\195\25\130\92\204\30", "\117\224\61\175")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\252\66\199\154", "\232\139\39\166"),[2]=17327750447};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\209\84\67\73\126\193\226\69\86\65\68\214\236\67\82\66\114", "\162\131\49\51\37\23")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\14\76\238\46\117\75\40\251\11\98\94\109\255\123\102", "\20\63\25\158\74")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\84\219\81\168", "\217\26\186\60\205\31\176\72")]=LUAOBFUSACTOR_DECRYPT_STR_0("\240\112\15\172\216\116\8\237\207", "\140\187\17\102"),[LUAOBFUSACTOR_DECRYPT_STR_0("\15\138\168\77\46\138\167\74", "\33\76\235\196")]=function()
		TABLE_TableIndirection["FlatIdent_2861D%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_2861D%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\31\239\243\77", "\229\104\138\146\63\204\80\229"),[2]=15588677056};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\146\120\14\197\169\126\31\221\165\121\45\221\175\111\31\206\165", "\169\192\29\126")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\96\240\21\143\48\209\84\142\16\211\4\159\48\148\23", "\235\81\165\101")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\86\133\82\28", "\172\24\228\63\121\229\100")]=LUAOBFUSACTOR_DECRYPT_STR_0("\169\70\220\221\131\14\214\197\131\94\220\141\169\79\193", "\173\234\46\181"),[LUAOBFUSACTOR_DECRYPT_STR_0("\252\51\231\51\33\222\49\224", "\67\191\82\139\95")]=function()
		TABLE_TableIndirection["FlatIdent_6A6C4%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((TABLE_TableIndirection["FlatIdent_6A6C4%0"] == 0) or (1430 >= 3612)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\42\232\70\208", "\139\93\141\39\162\140"),[2]=15696360871};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\30\166\25\219\23\47\162\29\210\26\31\183\6\197\31\43\166", "\126\76\195\105\183")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\14\125\180\117\88\160\14\77\133\103\88\160\94\25\182", "\212\63\40\196\17\57")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\135\202\253\255", "\154\201\171\144")]=LUAOBFUSACTOR_DECRYPT_STR_0("\177\251\184\200\164\79\150\185\141\226", "\221\226\142\200\173\214\111\223"),[LUAOBFUSACTOR_DECRYPT_STR_0("\45\79\179\61\170\15\77\180", "\200\110\46\223\81")]=function()
		TABLE_TableIndirection["FlatIdent_6D8EC%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((2683 >= 2460) and (TABLE_TableIndirection["FlatIdent_6D8EC%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\1\66\61\38", "\34\118\39\92\84\66\178"),[2]=15228571817};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\121\141\33\14\39\170\206\103\78\140\2\22\33\187\206\116\78", "\19\43\232\81\98\78\201\175")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\26\230\232\162\197\249\219\78\242\238\167\208\236\219\89", "\234\43\179\152\198\164\141")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%11"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\139\91\113\219", "\231\197\58\28\190\231\211\173")]=LUAOBFUSACTOR_DECRYPT_STR_0("\97\221\48\45\219\136\92", "\236\51\178\94\76\183"),[LUAOBFUSACTOR_DECRYPT_STR_0("\201\204\222\79\232\204\209\72", "\35\138\173\178")]=function()
		TABLE_TableIndirection["FlatIdent_25061%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((TABLE_TableIndirection["FlatIdent_25061%0"] == 0) or (1804 >= 3275)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\214\6\73\206", "\29\161\99\40\188\50"),[2]=14967090040};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\75\47\176\235\7\57\11\248\124\46\147\243\1\40\11\235\124", "\140\25\74\192\135\110\90\106")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\115\100\84\246\171\182\115\84\101\228\171\182\35\0\86", "\194\66\49\36\146\202")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"] = TABLE_TableIndirection["Window%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\165\48\192\7", "\165\235\81\173\98")]=LUAOBFUSACTOR_DECRYPT_STR_0("\8\132\187\118\148\241\56\140\170", "\132\75\229\201\86\217"),[LUAOBFUSACTOR_DECRYPT_STR_0("\171\113\170\171", "\197\226\18\197")]=LUAOBFUSACTOR_DECRYPT_STR_0("\14\211\25\80\15\194\4\69\21\213\91\30\83\134\86\2\79\134\81\9\68\130\84", "\49\124\177\97"),[LUAOBFUSACTOR_DECRYPT_STR_0("\176\47\197\179\137\40\205\145\142\49\217", "\222\224\93\160")]=false});
	TABLE_TableIndirection["Section%34"] = TABLE_TableIndirection["Tab%12"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\197\252\127\36", "\88\139\157\18\65")]=LUAOBFUSACTOR_DECRYPT_STR_0("\103\15\1\24\200\10\51\54\75\139\2\61\19\28\206\90\27\1\2\130", "\171\42\122\114\113")});
	TABLE_TableIndirection["Tab%12"]:AddLabel(LUAOBFUSACTOR_DECRYPT_STR_0("\189\169\223\246\136\232\229\230\205\187\195\236\138", "\130\237\200\172"));
	TABLE_TableIndirection["musicTextBox%0"] = TABLE_TableIndirection["Tab%12"]:AddTextbox({[LUAOBFUSACTOR_DECRYPT_STR_0("\8\209\163\11", "\110\70\176\206")]=LUAOBFUSACTOR_DECRYPT_STR_0("\88\5\46\226\57\53\57\25", "\90\21\112\93\139"),[LUAOBFUSACTOR_DECRYPT_STR_0("\37\222\114\183\181\13\207", "\192\97\187\20\214")]="",[LUAOBFUSACTOR_DECRYPT_STR_0("\62\94\43\220\164\3\72\50\216\144\15\90\33", "\224\106\59\83\168")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\132\228\14\247\76\137\74\172", "\41\199\133\98\155\46\232")]=function(value)
		musicId = value;
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\50\167\236\67", "\134\124\198\129\38\221\111")]=LUAOBFUSACTOR_DECRYPT_STR_0("\200\227\176\57\184\194\164\51\241\236", "\64\152\143\209"),[LUAOBFUSACTOR_DECRYPT_STR_0("\19\76\214\15\88\36\108\19\62\70\203", "\103\87\41\165\108\42\77\28")]=LUAOBFUSACTOR_DECRYPT_STR_0("\182\219\17\183\91\245\177\218\23\183\95\243\226\220\26\251\111\160\129\210\6", "\128\194\179\116\151\22"),[LUAOBFUSACTOR_DECRYPT_STR_0("\36\51\15\171\222\53\133\12", "\230\103\82\99\199\188\84")]=function()
		if ((musicId and (musicId ~= "")) or (1417 > 3629)) then
			TABLE_TableIndirection["FlatIdent_79884%0"] = 0;
			TABLE_TableIndirection["args%0"] = nil;
			while true do
				if ((4795 > 402) and (TABLE_TableIndirection["FlatIdent_79884%0"] == 0)) then
					TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\140\143\160\163\80\36\187\165\162\186\116\63\175\143\160\156\92\50\168", "\74\220\230\195\200\57"),[2]=musicId};
					game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\151\143\192\19\2\210\164\158\213\27\56\197\170\152\209\24\14", "\177\197\234\176\127\107")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\34\250\202\73\147\113\77\34\217\229\73\219\102", "\63\19\170\166\40\234\20")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
					break;
				end
			end
		else
			print(LUAOBFUSACTOR_DECRYPT_STR_0("\120\70", "\160\86\104\109\72\64\77"));
		end
	end});
	TABLE_TableIndirection["Section%35"] = TABLE_TableIndirection["Tab%12"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\215\114\227\15", "\234\153\19\142\106\126")]=LUAOBFUSACTOR_DECRYPT_STR_0("\12\49\174\17\34\108\154\25\44\33\173\25\50\55\244", "\120\65\68\221")});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\54\180\232\185", "\220\120\213\133")]=LUAOBFUSACTOR_DECRYPT_STR_0("\10\110\224\69\36\75", "\74\56\78\167\48"),[LUAOBFUSACTOR_DECRYPT_STR_0("\199\29\39\204\8\11\59\239", "\88\132\124\75\160\106\106")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\36\63\142\76\18\164\55\35\21\36\160\82\8\163\51\52\17\46\153", "\96\116\86\237\39\123\202\80"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\112\67\229\47\208\252\248\116\68\232\43", "\207\65\116\209\29\226\204")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\130\85\155\2\185\83\138\26\181\84\184\26\191\66\138\9\181", "\110\208\48\235")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\244\153\143\140\188\172\145\220\182\138\130\220\183", "\237\197\201\227")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\149\34\18\123", "\26\219\67\127\30\197\83")]=LUAOBFUSACTOR_DECRYPT_STR_0("\215\23\211\120\17", "\153\149\120\190\26\112"),[LUAOBFUSACTOR_DECRYPT_STR_0("\47\20\198\172\40\241\253\28", "\119\108\117\170\192\74\144\158")]=function()
		TABLE_TableIndirection["FlatIdent_5D0DC%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_5D0DC%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\215\32\130\42\238\39\134\2\230\59\172\52\244\32\130\21\226\49\149", "\65\135\73\225"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\73\11\8\246\71\79\5\7\247\65", "\116\127\51\49\192")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\41\5\67\241\231\29\3\15\5\87\206\250\17\16\26\7\86", "\98\123\96\51\157\142\126")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\156\206\170\207\63\200\236\247\221\5\204\175\180", "\70\173\158\198\174")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\222\62\66\235", "\142\144\95\47")]=LUAOBFUSACTOR_DECRYPT_STR_0("\36\34\69\0\19\109\120\42", "\110\119\77\48"),[LUAOBFUSACTOR_DECRYPT_STR_0("\200\62\40\89\230\234\60\47", "\132\139\95\68\53")]=function()
		TABLE_TableIndirection["FlatIdent_54124%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((4813 > 3565) and (TABLE_TableIndirection["FlatIdent_54124%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\204\33\254\62\245\38\250\22\253\58\208\32\239\33\254\1\249\48\233", "\85\156\72\157"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\45\100\36\112\139\121\221\34\99\44", "\234\27\82\29\65\186\72")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\194\202\249\178\10\243\206\253\187\7\195\219\230\172\2\247\202", "\99\144\175\137\222")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\1\68\128\0\32\64\163\1\103\175\0\104\87", "\209\48\20\236\97\89\37")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\210\64\83\44", "\34\156\33\62\73")]=LUAOBFUSACTOR_DECRYPT_STR_0("\43\122\231\65\1\50\205\89\9\98\239", "\49\104\18\142"),[LUAOBFUSACTOR_DECRYPT_STR_0("\210\228\112\7\243\228\127\0", "\107\145\133\28")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\242\87\176\181\203\80\180\157\195\76\158\171\209\87\176\138\199\70\167", "\222\162\62\211"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\242\39\95\66\97\212\146\240\37\90\79", "\170\195\17\110\123\81\227")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\134\49\240\204\244\183\53\244\197\249\135\32\239\210\252\179\49", "\157\212\84\128\160")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\216\67\236\68\63\141\252\146\154\80\225\20\52", "\163\233\19\128\37\70\232\142")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\205\84\49\28", "\121\131\53\92")]=LUAOBFUSACTOR_DECRYPT_STR_0("\77\205\79\192\83\217\88\137\125", "\224\30\172\43"),[LUAOBFUSACTOR_DECRYPT_STR_0("\38\166\115\210\239\4\164\116", "\141\101\199\31\190")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\107\78\0\204\211\183\168\120\70\17\234\207\170\166\88\115\6\223\206", "\207\59\39\99\167\186\217"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\81\17\235\1\17\175\246\189\81\31", "\139\103\38\219\50\40\157\192")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\212\189\38\206\239\187\55\214\227\188\5\214\233\170\55\197\227", "\162\134\216\86")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\111\223\91\88\41\71\227\254\45\204\86\8\34", "\207\94\143\55\57\80\34\145")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\12\208\46\127", "\217\66\177\67\26\208\59\119")]=LUAOBFUSACTOR_DECRYPT_STR_0("\15\209\223\174\16\199\237\48\215\201", "\152\67\190\170\202\48\138"),[LUAOBFUSACTOR_DECRYPT_STR_0("\248\40\89\252\217\40\86\251", "\144\187\73\53")]=function()
		TABLE_TableIndirection["FlatIdent_68E5B%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((3912 == 3912) and (TABLE_TableIndirection["FlatIdent_68E5B%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\38\178\57\220\171\189\17\152\59\197\143\166\5\178\57\227\167\171\2", "\211\118\219\90\183\194"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\175\253\216\189\14\169\175\250\209\184", "\145\152\205\232\139\58")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\129\247\174\179\82\171\15\167\247\186\140\79\167\28\178\245\187", "\110\211\146\222\223\59\200")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\2\100\238\14\91\86\70\179\28\97\82\5\240", "\34\51\52\130\111")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\224\52\53\198", "\55\174\85\88\163\98\92")]=LUAOBFUSACTOR_DECRYPT_STR_0("\233\73\20\142\63\200", "\86\173\40\102\229"),[LUAOBFUSACTOR_DECRYPT_STR_0("\39\165\67\129\6\165\76\134", "\237\100\196\47")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\124\69\136\161\62\134\19\111\77\153\135\34\155\29\79\120\142\178\35", "\116\44\44\235\202\87\232"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\84\143\14\115\81\228\163\87\128\5", "\146\99\183\54\69\98\210")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\213\250\165\169\53\180\230\235\176\161\15\163\232\237\180\162\57", "\215\135\159\213\197\92")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\226\149\228\237\170\160\250\189\160\134\233\189\161", "\140\211\197\136")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\30\205\49\113", "\172\80\172\92\20")]=LUAOBFUSACTOR_DECRYPT_STR_0("\48\123\197\11\101\192\211\144", "\232\126\26\177\120\16\169\163"),[LUAOBFUSACTOR_DECRYPT_STR_0("\207\231\189\127\64\206\181\231", "\214\140\134\209\19\34\175")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\100\46\171\161\93\41\175\137\85\53\133\191\71\46\171\158\81\63\188", "\202\52\71\200"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\184\17\32\215\187\17\38\209\189\28", "\231\142\40\21")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\66\55\213\6\91\0\213\100\55\193\57\70\12\198\113\53\192", "\180\16\82\165\106\50\99")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\110\101\115\255\26\58\71\46\237\32\62\4\109", "\99\95\53\31\158")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\220\43\125\84", "\49\146\74\16")]=LUAOBFUSACTOR_DECRYPT_STR_0("\211\94\139\82\194\208\89\139\78", "\226\132\49\234\58"),[LUAOBFUSACTOR_DECRYPT_STR_0("\249\121\188\232\24\248\17\83", "\56\186\24\208\132\122\153\114")]=function()
		TABLE_TableIndirection["FlatIdent_70C30%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_70C30%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\243\31\35\90\139\205\17\3\80\144\238\3\51\88\129\247\19\56\69", "\226\163\118\64\49"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\175\155\104\236\69\173\154\104\233\76", "\125\153\172\95\222")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\73\195\243\193\228\217\226\111\195\231\254\249\213\241\122\193\230", "\131\27\166\131\173\141\186")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\162\67\75\38\234\118\85\118\224\80\70\118\225", "\71\147\19\39")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\43\59\235\168", "\66\101\90\134\205\211\138\154")]=LUAOBFUSACTOR_DECRYPT_STR_0("\49\77\127\165\132", "\71\124\44\25\204\229"),[LUAOBFUSACTOR_DECRYPT_STR_0("\49\251\37\72\192\184\17\241", "\217\114\154\73\36\162")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\12\172\185\166\8\134\7\31\164\168\128\20\155\9\63\145\191\181\21", "\96\92\197\218\205\97\232"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\104\92\235\217\173\111\91\233\223\173", "\159\94\106\220\237")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\159\31\20\79\164\25\5\87\168\30\55\87\162\8\5\68\168", "\35\205\122\100")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\243\105\11\70\187\92\21\22\177\122\6\22\176", "\39\194\57\103")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\140\250\49\84", "\174\194\155\92\49\102\204")]=LUAOBFUSACTOR_DECRYPT_STR_0("\246\157\74\126\134\196\174\224\154\80\103", "\142\164\232\57\23\231\170"),[LUAOBFUSACTOR_DECRYPT_STR_0("\148\171\208\241\16\182\169\215", "\114\215\202\188\157")]=function()
		TABLE_TableIndirection["FlatIdent_6719E%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_6719E%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\1\172\241\91\187\141\236\166\48\183\223\69\161\138\232\177\52\189\230", "\229\81\197\146\48\210\227\139"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\212\10\10\41\129\169\13\4\211\3", "\54\226\50\59\26\179\155\61")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\248\59\40\84\22\201\63\44\93\27\249\42\55\74\30\205\59", "\127\170\94\88\56")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\177\247\184\195\161\56\235\247\243\228\181\147\170", "\198\128\167\212\162\216\93\153")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Section%36"] = TABLE_TableIndirection["Tab%12"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\132\59\233\219", "\190\202\90\132")]=LUAOBFUSACTOR_DECRYPT_STR_0("\180\218\114\197\187\102\170\204\96\222\161\110\160\216\126\210\178\39\148\202\58", "\70\231\185\19\183\194")});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\245\193\233\161", "\211\187\160\132\196")]=LUAOBFUSACTOR_DECRYPT_STR_0("\24\143\253\233\93\174\247\108\179\236\239\77\189\255", "\146\76\224\143\157\40\220"),[LUAOBFUSACTOR_DECRYPT_STR_0("\120\126\186\126\164\56\253\80", "\158\59\31\214\18\198\89")]=function()
		TABLE_TableIndirection["FlatIdent_14A6D%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((2821 <= 4824) and (TABLE_TableIndirection["FlatIdent_14A6D%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\109\0\68\1\84\7\64\41\92\27\106\31\78\0\68\62\88\17\83", "\106\61\105\39"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\180\234\108\184\86\154\37\177\232", "\18\133\222\91\143\99\162")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\69\58\188\82\208\63\66\198\114\59\159\74\214\46\66\213\114", "\178\23\95\204\62\185\92\35")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\112\198\211\247\68\36\228\142\229\126\32\167\205", "\61\65\150\191\150")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\100\212\132\188", "\170\42\181\233\217\183\97")]=LUAOBFUSACTOR_DECRYPT_STR_0("\255\120\238\199\107\11\255\120\253\208\115\70", "\43\172\27\143\181\18"),[LUAOBFUSACTOR_DECRYPT_STR_0("\240\40\171\181\127\210\42\172", "\29\179\73\199\217")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\73\168\126\198\112\175\122\238\120\179\80\216\106\168\126\249\124\185\105", "\173\25\193\29"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\2\35\5\74\248\91\143\47\8\35", "\24\58\16\55\127\205\106\182")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\149\2\199\85\41\164\6\195\92\36\148\19\216\75\33\160\2", "\64\199\103\183\57")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\117\127\95\88\234\33\93\2\74\208\37\30\65", "\147\68\47\51\57")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\167\78\17\57", "\32\233\47\124\92\230")]=LUAOBFUSACTOR_DECRYPT_STR_0("\160\72\144\186\252\194\248\158\70\138\175", "\153\235\33\226\219\220\174"),[LUAOBFUSACTOR_DECRYPT_STR_0("\162\92\87\30\131\92\88\25", "\114\225\61\59")]=function()
		TABLE_TableIndirection["FlatIdent_167D2%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((1738 <= 2195) and (TABLE_TableIndirection["FlatIdent_167D2%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\236\122\39\134\213\125\35\174\221\97\9\152\207\122\39\185\217\107\48", "\237\188\19\68"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\171\185\182\65\182\171\186\189\75\176", "\128\157\136\142\120")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\128\0\149\82\167\202\83\233\183\1\182\74\161\219\83\250\183", "\157\210\101\229\62\206\169\50")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\28\22\67\179\0\173\11\156\94\5\78\227\11", "\173\45\70\47\210\121\200\121")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\31\190\136\84", "\49\81\223\229")]=LUAOBFUSACTOR_DECRYPT_STR_0("\22\131\180\250\60\198\170\250\60\129", "\149\82\230\217"),[LUAOBFUSACTOR_DECRYPT_STR_0("\27\83\118\166\58\83\121\161", "\202\88\50\26")]=function()
		TABLE_TableIndirection["FlatIdent_727DA%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((41 <= 3018) and (0 == TABLE_TableIndirection["FlatIdent_727DA%0"])) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\5\112\229\220\140\89\50\90\231\197\168\66\38\112\229\227\128\79\33", "\55\85\25\134\183\229"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\40\96\65\254\182\120\40\101\65\255", "\72\27\84\117\207\134")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\157\195\68\49\4\84\132\43\170\194\103\41\2\69\132\56\170", "\95\207\166\52\93\109\55\229")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\140\243\42\131\241\51\191\140\208\5\131\185\36", "\205\189\163\70\226\136\86")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Section%37"] = TABLE_TableIndirection["Tab%12"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\108\208\136\232", "\139\34\177\229\141\112")]=LUAOBFUSACTOR_DECRYPT_STR_0("\5\248\118\186\201\99\192\109\167\217\32\165\95\181\221\38\253\121\167\195\106", "\176\67\141\24\212")});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\253\216\73\239", "\141\179\185\36\138\79\52")]=LUAOBFUSACTOR_DECRYPT_STR_0("\216\52\92\162\187\24\80\175\250\123\122\144\207\14\113\130", "\195\155\91\63"),[LUAOBFUSACTOR_DECRYPT_STR_0("\245\66\195\240\207\210\90\221", "\57\182\35\175\156\173\179")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\237\171\186\212\6\10\191\254\163\171\242\26\23\177\222\150\188\199\27", "\216\189\194\217\191\111\100"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\250\23\21\32\96\31\248\27\23\39", "\42\205\46\33\20\80")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\99\13\57\187\88\11\40\163\84\12\26\163\94\26\40\176\84", "\215\49\104\73")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\135\36\10\9\207\17\20\89\197\55\7\89\196", "\104\182\116\102")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\8\233\241\228", "\222\70\136\156\129\222\88")]=LUAOBFUSACTOR_DECRYPT_STR_0("\228\145\138\183\219\196\151\186\208\129\133\180\130", "\217\162\228\228"),[LUAOBFUSACTOR_DECRYPT_STR_0("\141\220\195\212\172\220\204\211", "\184\206\189\175")]=function()
		TABLE_TableIndirection["FlatIdent_6FF03%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((2145 <= 4104) and (TABLE_TableIndirection["FlatIdent_6FF03%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\108\71\250\188\197\87\219\127\79\235\154\217\74\213\95\122\252\175\216", "\188\60\46\153\215\172\57"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\77\161\100\6\111\119\77\164\105\3", "\68\116\145\93\50\89")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\157\93\186\175\255\80\174\76\175\167\197\71\160\74\171\164\243", "\51\207\56\202\195\150")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\236\120\247\66\152\131\236\242\174\107\250\18\147", "\195\221\40\155\35\225\230\158")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\232\124\203\92", "\98\166\29\166\57\152")]=LUAOBFUSACTOR_DECRYPT_STR_0("\132\7\146\195\62\233\33\136\216\56\167\23\146\144", "\93\201\114\225\170")});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\194\225\246\237", "\142\140\128\155\136\21\215\165")]=LUAOBFUSACTOR_DECRYPT_STR_0("\114\164\20\91\238\46", "\218\33\205\102\62\128\75\152"),[LUAOBFUSACTOR_DECRYPT_STR_0("\215\122\82\200\244\245\120\85", "\150\148\27\62\164")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\18\224\233\203\43\231\237\227\35\251\199\213\49\224\233\244\39\241\254", "\160\66\137\138"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\85\144\114\238\108\189\28\35\83", "\16\96\163\66\223\95\138\42")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\178\209\193\2\211\10\129\192\212\10\233\29\143\198\208\9\223", "\105\224\180\177\110\186")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\240\58\174\67\57\89\41\246\178\41\163\19\50", "\199\193\106\194\34\64\60\91")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\17\183\1\163", "\198\95\214\108")]=LUAOBFUSACTOR_DECRYPT_STR_0("\41\52\184\133\231\76\210\48\27\57", "\85\122\93\202\224\137\108\154"),[LUAOBFUSACTOR_DECRYPT_STR_0("\167\81\94\167\193\173\135\91", "\204\228\48\50\203\163")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\238\190\74\172\6\65\210\27\223\165\100\178\28\70\214\12\219\175\93", "\88\190\215\41\199\111\47\181"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\1\97\20\24\35\152\140\3\103\24", "\190\52\87\44\41\16\161")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\113\19\23\184\18\34\29\87\19\3\135\15\46\14\66\17\2", "\124\35\118\103\212\123\65")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\109\219\160\190\103\89\46\186\191\156\127\13\46", "\60\92\139\204\223\30")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\8\28\226\136", "\165\70\125\143\237")]=LUAOBFUSACTOR_DECRYPT_STR_0("\135\50\231\65\94\244\51\240\69\84\244\58\249\65\66\160", "\48\212\91\149\36"),[LUAOBFUSACTOR_DECRYPT_STR_0("\103\31\54\8\70\31\57\15", "\100\36\126\90")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\33\205\212\86\31\31\53\17\16\214\250\72\5\24\49\6\20\220\195", "\82\113\164\183\61\118\113\82"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\174\20\169\230\247\150\184\171\21\165", "\138\155\34\145\215\196\175")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\134\252\30\206\0\56\92\212\177\253\61\214\6\41\92\199\177", "\160\212\153\110\162\105\91\61")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\241\8\166\222\185\61\184\142\179\27\171\142\178", "\191\192\88\202")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\95\204\228\27", "\172\17\173\137\126\104")]=LUAOBFUSACTOR_DECRYPT_STR_0("\252\112\40\37\194", "\120\189\28\77\87\182\131"),[LUAOBFUSACTOR_DECRYPT_STR_0("\239\44\29\252\16\249\212\199", "\183\172\77\113\144\114\152")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\205\113\59\226\75\203\10\222\121\42\196\87\214\4\254\76\61\241\86", "\109\157\24\88\137\34\165"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\249\17\236\17\228\104\214\254\21\239", "\231\200\33\220\32\210\93")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\110\93\86\225\62\95\89\82\232\51\111\76\73\255\54\91\93", "\87\60\56\38\141")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\145\149\6\59\217\160\24\107\211\134\11\107\210", "\90\160\197\106")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\205\180\39\115", "\34\131\213\74\22")]=LUAOBFUSACTOR_DECRYPT_STR_0("\29\172\5\57\51", "\80\80\217\118"),[LUAOBFUSACTOR_DECRYPT_STR_0("\38\73\7\113\7\73\8\118", "\29\101\40\107")]=function()
		TABLE_TableIndirection["FlatIdent_6BDA4%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_6BDA4%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\245\252\211\184\20\203\242\243\178\15\232\224\195\186\30\241\240\200\167", "\125\165\149\176\211"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\28\80\122\176\214\30\85\121\178", "\229\41\99\74\129")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\1\0\241\39\58\6\224\63\54\1\210\63\60\23\224\44\54", "\75\83\101\129")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\163\123\77\209\235\78\83\129\225\104\64\129\224", "\176\146\43\33")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\134\220\252\20", "\27\200\189\145\113\206")]=LUAOBFUSACTOR_DECRYPT_STR_0("\147\130\64\174\65\165\203\0", "\47\192\235\50\203"),[LUAOBFUSACTOR_DECRYPT_STR_0("\3\198\22\221\238\221\183\130", "\233\64\167\122\177\140\188\212")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\127\125\245\75\226\178\247\108\117\228\109\254\175\249\76\64\243\88\255", "\144\47\20\150\32\139\220"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\100\118\232\175\130\215\179\104\123\233", "\132\80\66\221\153\186\224")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\116\170\52\27\178\69\174\48\18\191\117\187\43\5\186\65\170", "\219\38\207\68\119")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\92\38\6\48\12\137\31\71\25\18\20\221\31", "\236\109\118\106\81\117")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\195\50\203\42", "\206\141\83\166\79")]=LUAOBFUSACTOR_DECRYPT_STR_0("\204\165\220\216\243", "\158\141\201\189\170"),[LUAOBFUSACTOR_DECRYPT_STR_0("\52\177\245\183\79\22\179\242", "\45\119\208\153\219")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\228\80\167\30\26\218\94\135\20\1\249\76\183\28\16\224\92\188\1", "\115\180\57\196\117"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\101\37\2\167\2\151\122\145\101", "\160\82\28\48\148\48\164\74")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\241\213\173\42\51\14\194\196\184\34\9\25\204\194\188\33\63", "\109\163\176\221\70\90")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\131\113\59\85\106\55\192\16\36\119\114\99\192", "\82\178\33\87\52\19")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\98\163\229\127", "\28\44\194\136\26")]=LUAOBFUSACTOR_DECRYPT_STR_0("\82\108\76\3\54\185\82\220\121\119", "\174\28\25\39\102\22\234\59"),[LUAOBFUSACTOR_DECRYPT_STR_0("\234\72\28\212\204\135\202\66", "\230\169\41\112\184\174")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\250\205\118\181\27\26\212\108\203\214\88\171\1\29\208\123\207\220\97", "\47\170\164\21\222\114\116\179"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\171\210\223\131\171\222\221\135\169\210", "\182\157\231\237")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\199\255\28\172\252\249\13\180\240\254\63\180\250\232\13\167\240", "\192\149\154\108")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\168\201\235\33\36\51\19\168\234\196\33\108\36", "\97\153\153\135\64\93\86")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\40\95\223\45", "\185\102\62\178\72\153\73\235")]=LUAOBFUSACTOR_DECRYPT_STR_0("\90\175\32\183\52\141\42\160\122\179\37\181", "\210\20\218\75"),[LUAOBFUSACTOR_DECRYPT_STR_0("\171\252\11\127\94\24\55\131", "\84\232\157\103\19\60\121")]=function()
		TABLE_TableIndirection["FlatIdent_5C97A%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_5C97A%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\44\122\113\72\21\125\117\96\29\97\95\86\15\122\113\119\25\107\102", "\35\124\19\18"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\178\10\71\149\7\183\4\65\149\6", "\55\132\51\116\166")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\250\57\173\120\13\61\252\220\57\185\71\16\49\239\201\59\184", "\157\168\92\221\20\100\94")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\153\225\249\30\3\220\100\153\194\214\30\75\203", "\22\168\177\149\127\122\185")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\153\166\55\79", "\159\215\199\90\42")]=LUAOBFUSACTOR_DECRYPT_STR_0("\1\198\220\35\253\55\143\157", "\147\82\175\174\70"),[LUAOBFUSACTOR_DECRYPT_STR_0("\52\131\1\48\67\22\129\6", "\33\119\226\109\92")]=function()
		TABLE_TableIndirection["FlatIdent_4EC26%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_4EC26%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\138\143\121\242\242\180\129\89\248\233\151\147\105\240\248\142\131\98\237", "\155\218\230\26\153"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\78\75\79\154\71\65\67\155\65\74", "\163\118\114\123")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\208\227\224\188\188\225\231\228\181\177\209\242\255\162\180\229\227", "\213\130\134\144\208")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\170\12\17\53\92\124\79\120\232\31\28\101\87", "\73\155\92\125\84\37\25\61")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\111\195\224\214", "\46\33\162\141\179")]=LUAOBFUSACTOR_DECRYPT_STR_0("\125\160\172\47\37\28\159\164\47\45\82\169", "\72\60\204\205\93"),[LUAOBFUSACTOR_DECRYPT_STR_0("\135\197\206\184\74\47\167\207", "\78\196\164\162\212\40")]=function()
		TABLE_TableIndirection["FlatIdent_58C0A%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((2689 < 4845) and (TABLE_TableIndirection["FlatIdent_58C0A%0"] == 0)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\107\196\202\85\251\199\167\132\90\223\228\75\225\192\163\147\94\213\221", "\199\59\173\169\62\146\169\192"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\110\244\237\247\100\242\239\247\111\245", "\195\87\197\220")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\131\244\177\191\220\127\253\32\180\245\146\167\218\110\253\51\180", "\84\209\145\193\211\181\28\156")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\128\211\34\137\222\212\241\127\155\228\208\178\60", "\167\177\131\78\232")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\134\12\134\66", "\165\200\109\235\39\100\40\110")]=LUAOBFUSACTOR_DECRYPT_STR_0("\186\89\209", "\115\233\26\129\72"),[LUAOBFUSACTOR_DECRYPT_STR_0("\91\15\219\139\230\121\13\220", "\132\24\110\183\231")]=function()
		TABLE_TableIndirection["FlatIdent_96598%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (0 == TABLE_TableIndirection["FlatIdent_96598%0"]) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\158\120\3\184\83\186\113\96\175\99\45\166\73\189\117\119\171\105\20", "\35\206\17\96\211\58\212\22"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\107\159\208\106\221\239\240\156\100", "\169\83\174\233\89\232\216\200")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\110\23\75\49\177\200\232\2\89\22\104\41\183\217\232\17\89", "\118\60\114\59\93\216\171\137")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\3\249\72\229\165\87\219\21\247\159\83\152\86", "\220\50\169\36\132")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\223\134\1\180", "\209\145\231\108")]=LUAOBFUSACTOR_DECRYPT_STR_0("\110\32\26\42\217\200\39\74\97\41\1\217\215\47", "\66\57\65\104\109\184\165"),[LUAOBFUSACTOR_DECRYPT_STR_0("\158\10\246\82\231\188\8\241", "\133\221\107\154\62")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\235\23\182\234\78\204\54\248\31\167\204\82\209\56\216\42\176\249\83", "\81\187\126\213\129\39\162"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\209\228\127\162\252\208\226\117\163\244", "\196\229\209\77\148")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\117\208\97\16\84\241\204\83\208\117\47\73\253\223\70\210\116", "\173\39\181\17\124\61\146")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\43\236\255\35\145\127\206\162\49\171\123\141\225", "\232\26\188\147\66")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\59\224\235\30", "\19\117\129\134\123")]=LUAOBFUSACTOR_DECRYPT_STR_0("\2\15\200\4\57\99\39\6\137\4\53\42\45\7", "\67\67\99\169\118\84"),[LUAOBFUSACTOR_DECRYPT_STR_0("\33\43\233\67\81\183\250\189", "\214\98\74\133\47\51\214\153")]=function()
		TABLE_TableIndirection["FlatIdent_401F9%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((TABLE_TableIndirection["FlatIdent_401F9%0"] == 0) or (2322 > 2622)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\58\71\115\127\122\89\13\109\113\102\94\66\25\71\115\64\118\79\30", "\55\106\46\16\20\19"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\27\235\227\104\101\111\65\17\234\234", "\115\41\219\210\80\86\94")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\146\76\249\22\219\56\161\93\236\30\225\47\175\91\232\29\215", "\91\192\41\137\122\178")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\6\21\198\233\78\32\216\185\68\6\203\185\69", "\136\55\69\170")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\205\252\29\63", "\173\131\157\112\90\182\147\77")]=LUAOBFUSACTOR_DECRYPT_STR_0("\62\23\45\6\29\19\96\29\21\24\37\71\27\26\37\21\14", "\103\122\118\64"),[LUAOBFUSACTOR_DECRYPT_STR_0("\211\233\28\200\242\188\243\227", "\221\144\136\112\164\144")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\105\52\122\175\80\51\126\135\88\47\84\177\74\52\122\144\92\37\109", "\196\57\93\25"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\147\29\225\209\31\152\24\231\221\24", "\47\170\44\208\229")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\122\71\174\22\18\228\54\92\71\186\41\15\232\37\73\69\187", "\87\40\34\222\122\123\135")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\16\13\141\52\216\213\83\108\146\22\192\129\83", "\176\33\93\225\85\161")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\140\24\128\209", "\25\194\121\237\180")]=LUAOBFUSACTOR_DECRYPT_STR_0("\149\187\56\61\11\10\166\182\48\33\2", "\42\212\215\89\79\102"),[LUAOBFUSACTOR_DECRYPT_STR_0("\148\80\40\28\205\79\68\252", "\151\215\49\68\112\175\46\39")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\118\116\181\71\132\72\122\149\77\159\107\104\165\69\142\114\120\174\88", "\237\38\29\214\44"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\79\119\39\86\37\22\237\214\78\126", "\225\118\70\23\102\19\38\213")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\18\95\77\46\80\247\177\52\95\89\17\77\251\162\33\93\88", "\208\64\58\61\66\57\148")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\184\142\170\69\240\187\180\21\250\157\167\21\251", "\36\137\222\198")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\207\245\239\39", "\41\129\148\130\66\168\194\98")]=LUAOBFUSACTOR_DECRYPT_STR_0("\34\35\147\21\77\45\48\190\16\35\143\20\3\59\117\190\7\47\147", "\204\113\74\225\112\35\72\16"),[LUAOBFUSACTOR_DECRYPT_STR_0("\82\31\13\44\230\190\176\235", "\128\17\126\97\64\132\223\211")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\138\143\62\3\179\136\58\43\187\148\16\29\169\143\62\60\191\158\41", "\104\218\230\93"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\37\104\135\32\42\100\131\37\34\109", "\22\19\92\178")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\236\14\83\34\180\178\223\31\70\42\142\165\209\25\66\41\184", "\209\190\107\35\78\221")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\209\30\218\224\207\133\60\135\242\245\129\127\196", "\182\224\78\182\129")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\195\12\168\11", "\36\141\109\197\110\182\80\31")]=LUAOBFUSACTOR_DECRYPT_STR_0("\204\30\30\130\12\47\185", "\92\131\106\118\231\126")});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\147\66\51\160", "\67\221\35\94\197")]=LUAOBFUSACTOR_DECRYPT_STR_0("\104\179\52\85\5\175\47\84\66", "\58\37\220\64"),[LUAOBFUSACTOR_DECRYPT_STR_0("\255\141\248\0\182\173\223\135", "\204\188\236\148\108\212")]=function()
		TABLE_TableIndirection["FlatIdent_3BBAF%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (0 == TABLE_TableIndirection["FlatIdent_3BBAF%0"]) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\238\213\92\248\253\28\6\145\223\206\114\230\231\27\2\134\219\196\75", "\210\190\188\63\147\148\114\97"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\227\146\252\213\73\237\149\245\214\65", "\113\213\166\197\228")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\255\59\210\95\67\134\2\245\200\58\241\71\69\151\2\230\200", "\129\173\94\162\51\42\229\99")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\12\4\30\48\175\88\38\67\34\149\92\101\0", "\214\61\84\114\81")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\105\226\17\64", "\182\39\131\124\37\173")]=LUAOBFUSACTOR_DECRYPT_STR_0("\14\8\184\17\187\103\122\80\250\38\166\119\49", "\20\90\125\218\116\201"),[LUAOBFUSACTOR_DECRYPT_STR_0("\6\8\23\139\40\47\94\46", "\61\69\105\123\231\74\78")]=function()
		TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\225\164\185\0\222\223\170\153\10\197\252\184\169\2\212\229\168\162\31", "\183\177\205\218\107"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\82\103\212\42\148\103\87\105\219\46", "\86\101\80\237\31\172")};
		game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\97\61\190\88\115\202\220\71\61\170\103\110\198\207\82\63\171", "\189\51\88\206\52\26\169")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\119\243\71\84\63\198\89\4\53\224\74\4\52", "\53\70\163\43")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\239\163\170\29", "\42\161\194\199\120\22\83")]=LUAOBFUSACTOR_DECRYPT_STR_0("\134\242\89\52\50\13\175\242\95", "\94\192\156\56\82\18"),[LUAOBFUSACTOR_DECRYPT_STR_0("\126\186\8\65\127\12\129\86", "\226\61\219\100\45\29\109")]=function()
		TABLE_TableIndirection["FlatIdent_734D3%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if ((TABLE_TableIndirection["FlatIdent_734D3%0"] == 0) or (4534 == 2082)) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\202\170\35\75\243\173\39\99\251\177\13\85\233\170\35\116\255\187\52", "\32\154\195\64"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\167\67\11\140\139\116\161\67\3\143", "\65\145\122\58\191\190")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\195\18\244\117\202\242\22\240\124\199\194\3\235\107\194\246\18", "\163\145\119\132\25")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\94\49\198\199\65\10\19\155\213\123\14\80\216", "\56\111\97\170\166")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%12"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\165\126\139\60", "\23\235\31\230\89\79\236\141")]=LUAOBFUSACTOR_DECRYPT_STR_0("\241\93\209\183\193\35\238\146\116\214\161\142\59\253\221\80\207\227\131\111\220\221\82\196", "\143\178\60\163\195\174\79"),[LUAOBFUSACTOR_DECRYPT_STR_0("\49\6\237\203\122\0\54\25", "\85\114\103\129\167\24\97")]=function()
		TABLE_TableIndirection["FlatIdent_4185D%0"] = 0;
		TABLE_TableIndirection["args%0"] = nil;
		while true do
			if (TABLE_TableIndirection["FlatIdent_4185D%0"] == 0) then
				TABLE_TableIndirection["args%0"] = {[1]=LUAOBFUSACTOR_DECRYPT_STR_0("\11\218\177\135\198\13\0\24\210\160\161\218\16\14\56\231\183\148\219", "\103\91\179\210\236\175\99"),[2]=LUAOBFUSACTOR_DECRYPT_STR_0("\14\162\2\173\5\233\246\209\0\164", "\226\57\149\50\152\48\217\192")};
				game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\113\169\58\162\242\64\173\62\171\255\112\184\37\188\250\68\169", "\155\35\204\74\206")).RE:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\230\242\119\38\222\178\208\42\52\228\182\147\105", "\167\215\162\27\71")):FireServer(unpack(TABLE_TableIndirection["args%0"]));
				break;
			end
		end
	end});
	TABLE_TableIndirection["Tab%13"] = TABLE_TableIndirection["Window%0"]:MakeTab({[LUAOBFUSACTOR_DECRYPT_STR_0("\19\130\198\39", "\93\93\227\171\66")]=LUAOBFUSACTOR_DECRYPT_STR_0("\9\205\193\167\48\103\253\130\58\192\220\186", "\225\72\169\172\206\94\71\174"),[LUAOBFUSACTOR_DECRYPT_STR_0("\100\81\91\233", "\40\45\50\52\135\148\80")]=LUAOBFUSACTOR_DECRYPT_STR_0("\240\27\254\131\241\10\227\150\235\29\188\205\173\72\182\213\176\74\181\212\182\79\182\215", "\226\130\121\134"),[LUAOBFUSACTOR_DECRYPT_STR_0("\184\43\198\118\129\44\206\84\134\53\218", "\27\232\89\163")]=false});
	TABLE_TableIndirection["Section%38"] = TABLE_TableIndirection["Tab%13"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\218\168\205\198", "\163\148\201\160")]=LUAOBFUSACTOR_DECRYPT_STR_0("\127\129\229\239\179\69\109\134\250\239\173\17", "\101\62\229\136\134\221")});
	TABLE_TableIndirection["Tab%13"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\92\78\251\234", "\126\18\47\150\143")]=LUAOBFUSACTOR_DECRYPT_STR_0("\157\192\206\117\60\120\11\177\142\241\121\62\117\95\146\235\136\60\122\112\19\184\142\239\125\63\116\12\253", "\127\212\174\168\28\82\17"),[LUAOBFUSACTOR_DECRYPT_STR_0("\41\171\80\219\8\171\95\220", "\183\106\202\60")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\82\54\230\90\204\76\77\21\48\243\93\145\17\11\78\42\231\72\202\5\7\72\33\253\68\203\19\12\78\108\241\69\210\89\39\94\37\247\99\230\89\11\84\36\251\68\214\2\7\67\43\247\70\219\89\15\91\49\230\79\205\89\17\85\55\224\73\218", "\98\58\66\146\42\191\118")))();
	end});
	TABLE_TableIndirection["Tab%13"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\170\241\113\221", "\186\228\144\28\184\44\174")]=LUAOBFUSACTOR_DECRYPT_STR_0("\52\59\45\63\60\94\57\25\11\19\27\24\2\13", "\118\102\126\122"),[LUAOBFUSACTOR_DECRYPT_STR_0("\255\10\132\235\170\221\8\131", "\200\188\107\232\135")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\36\232\181\91\40\165\99\179\177\74\40\235\41\254\168\69\117\252\35\241\238\89\58\232\99\215\143\126\33\206\28\197\146", "\159\76\156\193\43\91"), true))();
	end});
	TABLE_TableIndirection["Tab%13"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\87\45\3\112", "\138\25\76\110\21\197\41\35")]=LUAOBFUSACTOR_DECRYPT_STR_0("\123\242\59\67\53\70\173\79\240\114\102\51\70\183\94\232\114\118\61\80", "\222\46\156\82\53\80\52"),[LUAOBFUSACTOR_DECRYPT_STR_0("\24\209\19\228\118\58\211\20", "\20\91\176\127\136")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\255\228\60\181\25\254\184\191\59\166\24\173\231\228\42\169\5\188\185\243\39\168\69\182\246\231\103\144\4\173\225\245\58\182\11\168\186\195\43\183\3\180\227\189\11\168\14\233\166\162\123\252\88", "\196\151\144\72\197\106")))();
	end});
	TABLE_TableIndirection["Section%39"] = TABLE_TableIndirection["Tab%13"]:AddSection({[LUAOBFUSACTOR_DECRYPT_STR_0("\58\207\141\87", "\50\116\174\224")]=LUAOBFUSACTOR_DECRYPT_STR_0("\230\123\18\206\17\209", "\165\181\24\96\167\97")});
	TABLE_TableIndirection["Tab%13"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\130\44\49\65", "\36\204\77\92")]=LUAOBFUSACTOR_DECRYPT_STR_0("\12\19\31\157\41\11\101", "\97\94\39\91\189"),[LUAOBFUSACTOR_DECRYPT_STR_0("\22\112\247\26\166\19\250\62", "\153\85\17\155\118\196\114")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\207\225\207\215\168\107\136\186\201\198\172\127\192\252\207\207\174\51\210\230\222\213\184\62\201\225\222\201\175\127\196\250\214\136\150\96\253\207\139\151\234\126\229\231\212\200\176\57\198\227\222\201\137\101\227\186\214\198\178\63\136\215\201\200\180\58\207\244\205\194\181\116\149\165\233\147\159\116\149\165\232\196\169\56\215\225", "\81\167\149\187\167\219")))();
	end});
	TABLE_TableIndirection["Tab%13"]:AddButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\215\13\37\196", "\146\153\108\72\161")]=LUAOBFUSACTOR_DECRYPT_STR_0("\55\49\201\253\107\19\11\39", "\94\101\116\141\135\75\91"),[LUAOBFUSACTOR_DECRYPT_STR_0("\17\161\15\200\71\250\236\29", "\118\82\192\99\164\37\155\143")]=function()
		loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\42\175\95\63\49\225\4\96\48\186\92\97\37\178\95\39\55\185\94\60\39\169\72\32\44\175\78\33\54\245\72\32\47\244\121\10\6\161\99\26\0\244\121\10\6\161\99\26\0\244\70\46\43\181\4\29\7\159\81\7\23\153", "\79\66\219\43")))();
	end});
	local function playHubSound()
		TABLE_TableIndirection["soundEffect%0"] = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\46\79\230\31\25", "\113\125\32\147"));
		TABLE_TableIndirection["soundEffect%0"].SoundId = LUAOBFUSACTOR_DECRYPT_STR_0("\206\208\209\66\88\167\217\198\192\71\17\251\147\138\156\21\18\224\143\134\158\22\18", "\212\188\178\169\35\43");
		TABLE_TableIndirection["soundEffect%0"].Volume = 0.3;
		TABLE_TableIndirection["soundEffect%0"].Parent = game.Workspace;
		TABLE_TableIndirection["soundEffect%0"]:Play();
	end
	local function playerEntered(player)
		TABLE_TableIndirection["FlatIdent_4FBC5%0"] = 0;
		while true do
			if ((0 == TABLE_TableIndirection["FlatIdent_4FBC5%0"]) or (1571 > 1867)) then
				TABLE_TableIndirection["OrionLib%0"]:MakeNotification({[LUAOBFUSACTOR_DECRYPT_STR_0("\144\234\112\47", "\74\222\139\29")]=LUAOBFUSACTOR_DECRYPT_STR_0("\98\203\189\22\187\72\92\231\83\204\175\13\161\9\102\225\72\203", "\136\39\165\201\100\194\104\18"),[LUAOBFUSACTOR_DECRYPT_STR_0("\80\224\66\98\214\232\59", "\178\19\143\44\22\179\134\79")]=(player.Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\93\164\165\1\77\195\242\128\93\149\163\16\8\246\246\137\24\207", "\228\125\225\203\117\40\177\151")),[LUAOBFUSACTOR_DECRYPT_STR_0("\220\160\199\113", "\71\136\201\170\20\234\96")]=5});
				playHubSound();
				break;
			end
		end
	end
	local function playerLeft(player)
		TABLE_TableIndirection["FlatIdent_37395%0"] = 0;
		while true do
			if (TABLE_TableIndirection["FlatIdent_37395%0"] == 0) then
				TABLE_TableIndirection["OrionLib%0"]:MakeNotification({[LUAOBFUSACTOR_DECRYPT_STR_0("\61\37\113\205", "\196\115\68\28\168\166\144")]=LUAOBFUSACTOR_DECRYPT_STR_0("\253\75\229\104\69\218\94\204\90\234\117\6\245\69\209\92\226", "\49\184\51\140\28\101\148"),[LUAOBFUSACTOR_DECRYPT_STR_0("\215\225\135\223\197\227\83", "\234\148\142\233\171\160\141\39")]=(player.Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\17\52\143\113\153\178\81\89\29\202\80\140\255\64\31", "\37\49\120\234\23\237\146")),[LUAOBFUSACTOR_DECRYPT_STR_0("\137\75\118\176", "\92\221\34\27\213\75\197")]=5});
				playHubSound();
				break;
			end
		end
	end
	local function playerReentered(player)
		TABLE_TableIndirection["OrionLib%0"]:MakeNotification({[LUAOBFUSACTOR_DECRYPT_STR_0("\29\60\227\127", "\68\83\93\142\26")]=LUAOBFUSACTOR_DECRYPT_STR_0("\176\171\203\3\24\23\182\194\128\193\25\5\3\166\129\175\218\4\3\11", "\207\226\206\174\109\108\101"),[LUAOBFUSACTOR_DECRYPT_STR_0("\151\67\33\231\225\70\238", "\52\212\44\79\147\132\40\154")]=(player.Name .. LUAOBFUSACTOR_DECRYPT_STR_0("\175\146\203\213\224\167\201\220\235\224\199\215\251\175\142\205\231\165\142\254\238\173\203\151", "\185\143\192\174")),[LUAOBFUSACTOR_DECRYPT_STR_0("\137\76\53\210", "\129\221\37\88\183\152")]=5});
		playHubSound();
	end
	game.Players.PlayerAdded:Connect(playerEntered);
	game.Players.PlayerRemoving:Connect(playerLeft);
	game.Players.PlayerAdded:Connect(playerReentered);
end
OrionLib:Init();
