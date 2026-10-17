--========================================================
-- BIGFROOT THAI - ZIGZAG V2.4 MERGED
-- Working V2 Engine + V2.3 + Enchanted Update
-- BF v1.7.9
--========================================================

local Players=game:GetService("Players")
local CoreGui=game:GetService("CoreGui")
local StarterGui=game:GetService("StarterGui")

local LP=Players.LocalPlayer
local PG=LP:WaitForChild("PlayerGui")

local BF_URL=
"https://raw.githubusercontent.com/hanniii1/Loader/refs/heads/main/BFLoader.lua"

local CREDIT_TEXT="✦ แปลไทยโดย ZIGZAG"
local CREDIT_COLOR=Color3.fromRGB(255,105,220)
local CREDIT_STROKE=Color3.fromRGB(255,220,248)


--========================================================
-- TRANSLATIONS
--========================================================

local T={

-- MAIN
["Main"]="หลัก",
["Home"]="หน้าหลัก",
["Eggs"]="ไข่",
["Progression"]="ความคืบหน้า",
["Pets"]="สัตว์เลี้ยง",
["Events"]="กิจกรรม",
["Contest"]="ต่อสู้แย่งชิง",
["Fuse"]="ผสม",
["Visual"]="การแสดงผล",
["Visuals"]="การแสดงผล",
["Dashboard"]="แดชบอร์ด",
["Webhook"]="เว็บฮุก",
["Settings"]="การตั้งค่า",
["Other"]="อื่นๆ",

["General"]="ทั่วไป",
["Farm"]="ฟาร์ม",
["Automation"]="ระบบอัตโนมัติ",
["Misc"]="อื่นๆ",
["Prediction"]="การคาดการณ์",
["Schedule"]="ตารางเวลา",
["Community"]="ชุมชน",
["Discord"]="ดิสคอร์ด",

["Config"]="คอนฟิก",
["Configs"]="คอนฟิก",
["Theming"]="ธีม",
["Theme"]="ธีม",

["Steal an Egg"]="ขโมยไข่",

["Refresh"]="รีเฟรช",
["Refresh Lists"]="รีเฟรชรายการ",
["Refresh list"]="รีเฟรชรายการ",

["Search"]="ค้นหา",
["Search..."]="ค้นหา...",

["None"]="ไม่มี",
["All"]="ทั้งหมด",
["Any"]="ทั้งหมด",

["Enabled"]="เปิดใช้งาน",
["Disabled"]="ปิดใช้งาน",

["On"]="เปิด",
["Off"]="ปิด",
["Off."]="ปิด",

["Save"]="บันทึก",
["Load"]="โหลด",
["Delete"]="ลบ",
["Create"]="สร้าง",
["Import"]="นำเข้า",
["Export"]="ส่งออก",
["Copy"]="คัดลอก",
["Reset"]="รีเซ็ต",
["Clear"]="ล้าง",


-- HOME
["Announcements"]="ประกาศ",
["Quick actions"]="คำสั่งด่วน",
["Quick Actions"]="คำสั่งด่วน",
["Copy Discord"]="คัดลอก Discord",
["Load last config"]="โหลดคอนฟิกล่าสุด",
["Rejoin"]="เข้าเซิร์ฟเวอร์ใหม่",
["Server hop"]="ย้ายเซิร์ฟเวอร์",
["Server Hop"]="ย้ายเซิร์ฟเวอร์",
["Toggle watermark"]="เปิด/ปิดลายน้ำ",

["Status"]="สถานะ",
["Stats"]="สถิติ",
["Account"]="บัญชี",

["Key status"]="สถานะคีย์",
["Free"]="ฟรี",
["Replace key"]="เปลี่ยนคีย์",

["session"]="เวลาใช้งาน",
["features on"]="ฟีเจอร์ที่เปิด",
["fps"]="FPS",
["ping"]="ปิง",
["players"]="ผู้เล่น",
["key time"]="เวลาคีย์",
["Expires"]="หมดอายุ",


-- AUTO STEAL
["Auto Steal"]="ออโต้ขโมย",
["Auto Steal Egg"]="ออโต้ขโมยไข่",
["Auto Steal Eggs"]="ออโต้ขโมยไข่",

["Auto Capture Egg"]="ออโต้จับไข่",
["Capture Egg"]="จับไข่",

["Contest Flee Range (studs)"]=
"ระยะหนีจากผู้เล่นที่แย่งไข่ (studs)",

["Avoid Traps"]="หลบกับดัก",

["Target Priority"]="ลำดับความสำคัญเป้าหมาย",
["Priority"]="ลำดับความสำคัญ",

["Rarity"]="ความหายาก",
["Value"]="มูลค่า",

["Size"]="ขนาด",
["Closest"]="ใกล้ที่สุด",
["Farthest"]="ไกลที่สุด",
["Random"]="สุ่ม",

["Return To Plot"]="กลับฐาน",
["Return to Plot"]="กลับฐาน",

["Return To"]="กลับไปยัง",
["Plot Spawn"]="จุดเกิดในฐาน",

["Return To Last Position"]="กลับตำแหน่งล่าสุด",
["Return to Last Position"]="กลับตำแหน่งล่าสุด",

["Anti AFK"]="กัน AFK",
["Anti-AFK"]="กัน AFK",

["Auto Execute"]="เปิดสคริปต์อัตโนมัติ",
["Auto Reconnect"]="เชื่อมต่อใหม่อัตโนมัติ",

["Safety"]="ความปลอดภัย",
["Nothing flagged."]="ไม่พบปัญหา",

["Session"]="เซสชัน",

["No egg matches the current filters."]=
"ไม่มีไข่ที่ตรงกับตัวกรองปัจจุบัน",

["Reset Session Counter"]="รีเซ็ตตัวนับเซสชัน",

["Drop Carried Egg"]="ปล่อยไข่ที่กำลังถือ",
["Drop Held Egg"]="ปล่อยไข่ที่กำลังถือ",


-- OP STUFF
["OP Stuffs"]="ฟังก์ชันพิเศษ",

["God Mode"]="โหมดป้องกัน",
["GodMode"]="โหมดป้องกัน",

["Instant Steal"]="ขโมยทันที",

["Glide"]="ร่อน",
["Glide Method"]="วิธีร่อน",
["Glide Speed"]="ความเร็วร่อน",

["Anti Treadmill"]="กันลู่วิ่ง",

["Anti Hit"]="กันโจมตี",
["Anti Guard"]="ป้องกันยาม",

["Anti Knockback"]="กันกระเด็น",
["Anti Knock Back"]="กันกระเด็น",

["Anti Ragdoll"]="กันล้ม",

["Walk Speed"]="ความเร็วเดิน",
["Fly Speed"]="ความเร็วบิน",
["Carry Speed"]="ความเร็วขณะถือไข่",


-- FILTERS
["Auto Steal Filter"]="ตัวกรองออโต้ขโมย",
["Filter"]="ตัวกรอง",
["Filters"]="ตัวกรอง",

["Egg Name"]="ชื่อไข่",
["Egg Names"]="ชื่อไข่",

["Filter By Egg Name"]="กรองตามชื่อไข่",
["Filter by Egg Name"]="กรองตามชื่อไข่",

["Area"]="พื้นที่",
["Areas"]="พื้นที่",
["Select Area"]="เลือกพื้นที่",

["Category"]="หมวดหมู่",
["Categories"]="หมวดหมู่",

["Rarity"]="ความหายาก",
["Rarities"]="ระดับความหายาก",

["Filter By Rarity"]="กรองตามความหายาก",
["Filter by Rarity"]="กรองตามความหายาก",

["Mutation"]="การกลายพันธุ์",
["Mutations"]="การกลายพันธุ์",

["Match ALL Selected Mutations"]=
"ต้องตรงกับการกลายพันธุ์ที่เลือกทั้งหมด",

["Match All Selected Mutations"]=
"ต้องตรงกับการกลายพันธุ์ที่เลือกทั้งหมด",

["Only Mutated Eggs"]="เฉพาะไข่ที่กลายพันธุ์",

["Min $/s (0 = any)"]=
"รายได้ขั้นต่ำ $/วิ (0 = ไม่จำกัด)",

["Min KG (0 = any)"]=
"น้ำหนักขั้นต่ำ KG (0 = ไม่จำกัด)",

["Big Egg KG (0 = off)"]=
"น้ำหนักไข่ใหญ่ KG (0 = ปิด)",

["Big Egg Filter"]="ตัวกรองไข่ใหญ่",

["Always Steal Dragon Eggs"]=
"ขโมยไข่มังกรเสมอ",

["Skip Contested Eggs"]=
"ข้ามไข่ที่มีผู้เล่นอื่นกำลังแย่ง",

["Matches"]="รายการที่ตรงเงื่อนไข",
["Best Matches"]="เป้าหมายที่ตรงที่สุด",

["No egg on the map matches the current filters."]=
"ไม่มีไข่บนแผนที่ที่ตรงกับตัวกรองปัจจุบัน",


-- AREA
["Abyss Ocean"]="มหาสมุทรอเวจี",
["Cherry Blossom"]="ซากุระ",
["Cosmic"]="คอสมิก",
["Desert"]="ทะเลทราย",
["Forest"]="ป่า",
["Jungle"]="ป่าดิบ",
["Lake"]="ทะเลสาบ",
["Light Dark"]="ไลท์ดาร์ก",
["LIGHT DARK"]="ไลท์ดาร์ก",
["Prehistoric"]="ยุคดึกดำบรรพ์",
["Snow"]="หิมะ",
["Titan Temple"]="วิหารไททัน",
["Volcano"]="ภูเขาไฟ",


-- EGGS
["Egg Automation"]="ระบบอัตโนมัติสำหรับไข่",

["Auto Place"]="ออโต้วาง",
["Auto Place Egg"]="ออโต้วางไข่",
["Auto Place Eggs"]="ออโต้วางไข่",

["Auto Place Selected"]="ออโต้วางไข่ที่เลือก",
["Auto Place All"]="ออโต้วางไข่ทั้งหมด",

["Auto Hatch"]="ออโต้ฟักไข่",
["Auto Hatch Egg"]="ออโต้ฟักไข่",
["Auto Hatch Eggs"]="ออโต้ฟักไข่",
["Auto Hatch Ready"]="ออโต้ฟักไข่ที่พร้อม",

["Use Filter for Auto Hatch Ready"]=
"ใช้ตัวกรองกับออโต้ฟักไข่ที่พร้อม",

["Hatch"]="ฟักไข่",

["Place Only Above KG"]=
"วางเฉพาะไข่ที่หนักกว่า KG ที่กำหนด",

["Place Only Above $/s"]=
"วางเฉพาะไข่ที่รายได้สูงกว่า $/วิ",

["Place Only Below KG"]=
"วางเฉพาะไข่ที่เบากว่า KG ที่กำหนด",

["Place Only Below $/s"]=
"วางเฉพาะไข่ที่รายได้ต่ำกว่า $/วิ",

["Place Thresholds"]="เงื่อนไขการวางไข่",

["Auto Rift eggs ignore these."]=
"ไข่ Rift อัตโนมัติจะไม่ใช้เงื่อนไขเหล่านี้",

["Auto Place Status"]="สถานะออโต้วางไข่",

["Auto Sell Egg"]="ออโต้ขายไข่",
["Auto Sell Eggs"]="ออโต้ขายไข่",

["Sell Eggs Below KG (put so it will work)"]=
"ขายไข่ที่ต่ำกว่า KG ที่กำหนด (ใส่ค่าเพื่อให้ทำงาน)",

["Sell Eggs Below $/s (0 = off)"]=
"ขายไข่ที่รายได้ต่ำกว่า $/วิ (0 = ปิด)",

["Egg Sell Status"]="สถานะการขายไข่",
["Turn Auto Sell Eggs on."]="เปิดออโต้ขายไข่เพื่อเริ่มทำงาน",


-- PROGRESSION
["Upgrades"]="อัปเกรด",

["Pen"]="คอก",
["Auto Upgrade Pen"]="ออโต้อัปเกรดคอก",

["Treadmill"]="ลู่วิ่ง",
["Auto Treadmill"]="ออโต้ลู่วิ่ง",

["Auto Treadmill Training"]="ออโต้ฝึกลู่วิ่ง",
["Auto Treadmill Upgrade"]="ออโต้อัปเกรดลู่วิ่ง",

["Trails"]="Trail",
["Trails To Buy"]="Trail ที่ต้องการซื้อ",

["Auto Buy Selected Trails"]="ออโต้ซื้อ Trail ที่เลือก",

["Auto Buy All Cash Trails"]=
"ออโต้ซื้อ Trail ที่ใช้เงินสดทั้งหมด",

["Auto Equip Best Trail"]="ออโต้ใส่ Trail ที่ดีที่สุด",

["Gear & Rewards"]="อุปกรณ์และรางวัล",

["Auto Equip Best Gear"]="ออโต้ใส่อุปกรณ์ที่ดีที่สุด",

["Auto Claim Index Rewards"]="ออโต้รับรางวัล Index",

["Auto Claim Group Reward"]="ออโต้รับรางวัลกลุ่ม",


-- VISUAL
["Performance"]="ประสิทธิภาพ",

["Ultra FPS Boost"]="เพิ่ม FPS สูงสุด",
["FPS Boost"]="เพิ่ม FPS",

["Delete Pets (FPS BOOST)"]="ซ่อนสัตว์เลี้ยง (เพิ่ม FPS)",

["Inventory Value"]="มูลค่าของในกระเป๋า",

["Inventory Value ESP"]="ESP มูลค่าของในกระเป๋า",

["Egg ESP"]="ESP ไข่",

["Max Distance (studs)"]="ระยะสูงสุด (studs)",

["Show Everyone (wild + all plots)"]=
"แสดงทั้งหมด (ไข่ป่า + ทุกฐาน)",

["Egg ESP Filter"]="ตัวกรอง ESP ไข่",

["Only Mutated"]="เฉพาะที่กลายพันธุ์",
["Min KG"]="KG ขั้นต่ำ",


-- FUSE
["Auto Fuse Selected"]="ออโต้ผสมตัวที่เลือก",

["Auto Fuse All Eligible"]=
"ออโต้ผสมทุกตัวที่เข้าเงื่อนไข",

["Only Fuse Pets Below $/s (0 = no limit)"]=
"ผสมเฉพาะสัตว์ที่รายได้ต่ำกว่า $/วิ (0 = ไม่จำกัด)",

["Fuse Predictor"]="คาดการณ์ผลการผสม",

["Odds"]="โอกาส",
["Nothing in the machine."]="ไม่มีอะไรอยู่ในเครื่อง",

["Shrine Fusion"]="การผสมที่แท่น Shrine",

["Two players, one per pad"]="ใช้ผู้เล่น 2 คน คนละแท่น",

["My Pad"]="แท่นของฉัน",

["Pet To Hold"]="สัตว์เลี้ยงที่ต้องถือ",

["Auto Shrine Fusion"]="ออโต้ผสม Shrine",

["Shrine"]="Shrine",

["Divine: ArchAngel + World Burner = Aetheron. Eternal: Pegasus + Skeleton Horse = Equinox. Both players get the egg. Once per account per tier."]=
"Divine: ArchAngel + World Burner = Aetheron | Eternal: Pegasus + Skeleton Horse = Equinox | ผู้เล่นทั้งสองคนจะได้รับไข่ ทำได้ 1 ครั้งต่อบัญชีในแต่ละระดับ",

["Light pad: ArchAngel or Pegasus. Dark pad: World Burner or Skeleton Horse."]=
"แท่น Light: ArchAngel หรือ Pegasus | แท่น Dark: World Burner หรือ Skeleton Horse",

["ArchAngel"]="อาร์คแองเจิล (ArchAngel)",
["Pegasus"]="เพกาซัส (Pegasus)",
["Skeleton Horse"]="ม้าโครงกระดูก (Skeleton Horse)",
["World Burner"]="เวิลด์เบิร์นเนอร์ (World Burner)",


-- CONTEST
["Contest Players"]="แย่งไข่จากผู้เล่น",

["Contest Players (BETA)"]="แย่งไข่จากผู้เล่น (BETA)",

["Bat Aura"]="ออร่าตีด้วยไม้",

["Auto Equip Best Bat"]="ออโต้ใส่ไม้ตีที่ดีที่สุด",

["Forward Offset (studs)"]="ระยะด้านหน้า (studs)",

["Give Up After (seconds)"]="ยกเลิกหลังจาก (วินาที)",


-- DR SCRAMBLE
["Dr. Scramble"]="Dr. Scramble",
["Dr Scramble"]="Dr. Scramble",

["Auto Collect"]="ออโต้เก็บ",

["Rarest Drones First"]="เก็บโดรนที่หายากที่สุดก่อน",

["Auto Quest"]="ออโต้ทำเควสต์",

["Scramble: waiting for the outbreak."]=
"Scramble: กำลังรอ Outbreak",

["Dr. Scramble Boss"]="บอส Dr. Scramble",

["Auto Fight Boss"]="ออโต้ตีบอส",

["Auto Claim Mastery"]="ออโต้รับ Mastery",

["Scramble Shop"]="ร้าน Scramble",

["Auto Buy"]="ออโต้ซื้อ",
["Buy"]="ซื้อ",

["Scrambled Mutation"]="การกลายพันธุ์ Scrambled",

["2x Cash Booster"]="บูสต์เงิน 2x",
["1.25x Speed"]="ความเร็ว 1.25x",
["2x Treadmill Booster"]="บูสต์ลู่วิ่ง 2x",

["Dr. Scramble Lab"]="แล็บ Dr. Scramble",

["Auto Trade-In"]="ออโต้แลก",
["Auto Trade In"]="ออโต้แลก",

["Banners (empty = any)"]="Banner (ว่าง = ทั้งหมด)",
["Banner (empty = any)"]="Banner (ว่าง = ทั้งหมด)",

["Biohazard Pets"]="สัตว์เลี้ยง Biohazard",

["Experimental Pets"]="สัตว์เลี้ยงทดลอง",

["Unstable DNA"]="DNA ไม่เสถียร (Unstable DNA)",

["Auto Steal Recipe Eggs"]="ออโต้ขโมยไข่สำหรับสูตร",

["Stock Up Spares"]="เก็บสำรองไว้",

["Mutation Shards"]="ชาร์ดกลายพันธุ์",

["Auto Mutation Shards"]="ออโต้ชาร์ดกลายพันธุ์",

["Shard Type"]="ประเภทชาร์ด",

["Fractured (Boss)"]="Fractured (บอส)",

["Scrambled"]="สแครมเบิล",

["Shard Eggs"]="ไข่สำหรับชาร์ด",

["Shard Min $/s (0 = any)"]=
"รายได้ขั้นต่ำของชาร์ด $/วิ (0 = ไม่จำกัด)",

["Shards"]="ชาร์ด",


--========================================================
-- BF V1.7.9 - ENCHANTED UPDATE
--========================================================

["Enchanted"]="มนตรา",

["Wisp"]="วิสป์",

["Auto Wisp Quests"]=
"ออโต้ทำเควสต์ Wisp",

["Steal Wisp Quest Eggs"]=
"ขโมยไข่เควสต์ Wisp",

["Butterflies"]="ผีเสื้อ",

["Auto Claim Net"]=
"ออโต้รับตาข่าย",

["Auto Catch Butterflies"]=
"ออโต้จับผีเสื้อ",

["Bloom"]="ดอกไม้บาน",

["Essence"]="เอสเซนส์",

["Auto Essence"]=
"ออโต้เอสเซนส์",

["Auto Trade Up"]=
"ออโต้แลกอัปเกรด",

["Trades"]="รายการแลก",

["Trade Up"]="แลกอัปเกรด",

["Green"]="เขียว",
["Blue"]="น้ำเงิน",
["Purple"]="ม่วง",
["Gold"]="ทอง",
["Golden"]="ทอง",

["Green -> Blue"]=
"เขียว → น้ำเงิน",

["Blue -> Purple"]=
"น้ำเงิน → ม่วง",

["Purple -> Golden"]=
"ม่วง → ทอง",

["Purple -> Gold"]=
"ม่วง → ทอง",

["Green -> Blue, Blue -> Purple, Purple -> Golden"]=
"เขียว → น้ำเงิน, น้ำเงิน → ม่วง, ม่วง → ทอง",

["Green -> Blue, Blue -> Purple, Purple -> Gold"]=
"เขียว → น้ำเงิน, น้ำเงิน → ม่วง, ม่วง → ทอง",

["Banjo Cricket"]=
"จิ้งหรีดแบนโจ",

["Auto Banjo Cricket"]=
"ออโต้จิ้งหรีดแบนโจ",


-- PETS
["Income"]="รายได้",

["Auto Equip Pets"]="ออโต้ใส่สัตว์เลี้ยง",

["Auto Equip Pets Interval"]="ช่วงเวลาออโต้ใส่สัตว์เลี้ยง",

["Claim Offline Earnings"]="รับรายได้ตอนออฟไลน์",

["Top 10 Eggs"]="ไข่ 10 อันดับแรก",

["Sell"]="ขาย",

["Sell Categories"]="หมวดที่จะขาย",

["Sell Rarities"]="ระดับความหายากที่จะขาย",

["Sell Mutations"]="การกลายพันธุ์ที่จะขาย",

["Auto Sell Selected"]="ออโต้ขายตัวที่เลือก",

["Auto Sell All Eligible"]="ออโต้ขายทุกตัวที่เข้าเงื่อนไข",

["Auto Unequip for Selling"]=
"ถอดสัตว์เลี้ยงอัตโนมัติก่อนขาย",

["Sell Pets Below $/s (put so it will work)"]=
"ขายสัตว์เลี้ยงที่รายได้ต่ำกว่า $/วิ (ใส่ค่าเพื่อให้ทำงาน)",

["Sell Pets Below /s (put so it will work)"]=
"ขายสัตว์เลี้ยงที่รายได้ต่ำกว่าค่าที่กำหนด (ใส่ค่าเพื่อให้ทำงาน)",

["Keep Best (never sell)"]="เก็บตัวที่ดีที่สุดไว้ (ไม่ขาย)",

["Sell Delay (per sale, pets + eggs)"]=
"เวลาหน่วงการขาย (ต่อครั้ง สัตว์เลี้ยง + ไข่)",


-- SETTINGS MENU
["Menu"]="เมนู",

["Toggle menu"]="ปุ่มเปิด/ปิดเมนู",

["Auto hide UI after execute"]=
"ซ่อน UI อัตโนมัติหลังรัน",

["Watermark"]="ลายน้ำ",

["Mobile toggle button"]=
"ปุ่มเปิด/ปิดเมนูบนมือถือ",

["Dim background"]="ทำพื้นหลังให้มืด",

["Weather area"]="พื้นที่เอฟเฟกต์สภาพอากาศ",

["Inside UI"]="ภายใน UI",
["Whole screen"]="ทั้งหน้าจอ",

["Weather amount"]="ปริมาณเอฟเฟกต์สภาพอากาศ",

["Weather size"]="ขนาดเอฟเฟกต์สภาพอากาศ",

["Draggable cards"]="ลากการ์ดได้",

["Collapse sidebar"]="ย่อแถบด้านข้าง",

["Reset card layout"]="รีเซ็ตตำแหน่งการ์ด",

["Auto scale to screen"]="ปรับขนาดตามหน้าจออัตโนมัติ",

["UI scale"]="ขนาด UI",

["Font"]="ฟอนต์",

["Unload"]="ปิดสคริปต์",

["Rain"]="ฝน",
["Petals"]="กลีบดอกไม้",
["Hearts"]="หัวใจ",
["Stars"]="ดาว",
["Leaves"]="ใบไม้",


-- WALLPAPER / ICON / PATTERN
["Risky"]="อันตราย",

["wallpaper"]="วอลเปเปอร์",
["Wallpaper"]="วอลเปเปอร์",

["Wallpaper dim"]="ความมืดวอลเปเปอร์",

["Apply wallpaper"]="ใช้วอลเปเปอร์",

["icon"]="ไอคอน",
["Icon"]="ไอคอน",

["Apply icon"]="ใช้ไอคอน",

["pattern"]="ลวดลาย",
["Pattern"]="ลวดลาย",

["Pattern strength"]="ความเข้มลวดลาย",

["Dots"]="ลายจุด",
["Grid"]="ลายตาราง",
["Diagonal"]="ลายทแยง",
["Noise"]="ลายสุ่ม",

["your themes"]="ธีมของคุณ",

["theme name"]="ชื่อธีม",

["Create saves the colours on screen under the name; pick it in Preset to use it."]=
"สร้างจะบันทึกสีบนหน้าจอด้วยชื่อนี้ แล้วเลือกใช้ได้จาก Preset",

["Copy code"]="คัดลอกโค้ด",

["paste a theme code..."]="วางโค้ดธีม...",

["Save theme"]="บันทึกธีม",


-- CONFIG
["config name"]="ชื่อคอนฟิก",

["Set autoload"]="ตั้งให้โหลดอัตโนมัติ",

["Clear autoload"]="ล้างการโหลดอัตโนมัติ",

["Autoload mode"]="โหมดโหลดอัตโนมัติ",

["Autosave loaded config"]=
"บันทึกคอนฟิกที่โหลดอยู่แบบอัตโนมัติ",

["All accounts"]="ทุกบัญชี",

["Per account"]="แยกตามบัญชี",

["share"]="แชร์",

["paste a config code..."]="วางโค้ดคอนฟิก...",


-- THEME
["Preset"]="พรีเซ็ต",

["Window glow"]="แสงเรืองหน้าต่าง",

["Element glow"]="แสงเรืององค์ประกอบ",

["Card opacity"]="ความทึบของการ์ด",

["Window opacity"]="ความทึบของหน้าต่าง",

["gradient"]="ไล่สี",

["Accent gradient"]="ไล่สี Accent",

["Gradient angle"]="มุมไล่สี",

["Shimmer"]="ประกาย",

["Window gradient"]="ไล่สีหน้าต่าง",

["Background"]="พื้นหลัง",

["Panel"]="พาเนล",

["Hover"]="สีเมื่อชี้",

["Outline"]="เส้นขอบ",

["Accent"]="สีเด่น",

["Accent 2"]="สีเด่น 2",

["Text"]="ตัวหนังสือ",

["DimText"]="ตัวหนังสือรอง",

["Hovered Element"]="องค์ประกอบตอนชี้",

["Element"]="องค์ประกอบ",

["Section"]="หมวด",

["Tab"]="แท็บ",

["Inactive Text"]="ข้อความที่ไม่ได้เลือก",


-- WEBHOOK
["Enable Webhook"]="เปิดใช้งาน Webhook",

["Webhook URL"]="URL Webhook",

["Discord User ID"]="Discord User ID",

["Discord User ID (ping)"]=
"Discord User ID (สำหรับแท็ก)",

["Mention @everyone"]="แท็ก @everyone",

["Ping @everyone"]="แท็ก @everyone",

["Trade-In Webhook"]="Webhook การแลก",

["Send Test Post"]="ส่งข้อความทดสอบ",

["Send Test"]="ส่งทดสอบ",

["Notify Filter"]="ตัวกรองแจ้งเตือน",

["Min Fuse Result $/s"]=
"ผลผสมขั้นต่ำ $/วิ",

["Min Fuse Result $/s (0 = every fuse)"]=
"ผลผสมขั้นต่ำ $/วิ (0 = ทุกการผสม)",


-- MUTATION OPTIONS
["Boss"]="บอส",
["Golden"]="ทอง",
["GreatBloom"]="Great Bloom",
["Sakura"]="ซากุระ",
["Scrambled"]="สแครมเบิล",
["Silver"]="เงิน",


-- DASHBOARD
["Report To Dashboard"]="รายงานไปยังแดชบอร์ด",

["Dashboard Key"]="คีย์แดชบอร์ด",

["Send Report Now"]="ส่งรายงานตอนนี้",

["Setup"]="ตั้งค่าการเชื่อมต่อ",

["How To Connect"]="วิธีเชื่อมต่อ",

["Needs Premium to Use!"]="ต้องใช้ Premium!",

["1. Open bigfroot.dev and sign in with Discord."]=
"1. เปิด bigfroot.dev และเข้าสู่ระบบด้วย Discord",

["2. Copy the key it shows you."]=
"2. คัดลอกคีย์ที่เว็บแสดงให้",

["3. Paste it above, then turn on Report To Dashboard."]=
"3. วางคีย์ด้านบน แล้วเปิด รายงานไปยังแดชบอร์ด",


-- OLD BF / GREAT BLOOM
["Great Bloom"]="Great Bloom",

["Auto Great Bloom"]="ออโต้ Great Bloom",

["Auto Insert Egg"]="ออโต้ใส่ไข่",

["Auto Deposit"]="ออโต้ฝาก",

["Auto Mutate"]="ออโต้กลายพันธุ์",

["Mutate At %"]="กลายพันธุ์เมื่อถึง %",

["Remove After Mutating"]="นำออกหลังกลายพันธุ์",

["Incubator"]="เครื่องฟัก",
["Incubators"]="เครื่องฟัก",

["Weather"]="สภาพอากาศ",

["Event"]="กิจกรรม",

["Frost"]="น้ำแข็ง",

["Magma"]="แมกมา",

["Blood Night"]="คืนสีเลือด",

["Hourly Event"]="กิจกรรมรายชั่วโมง",

["Egg Spawns"]="การเกิดไข่",

["Prediction is patched"]="ระบบคาดการณ์ถูกแก้แล้ว",


-- CONFIG OLD
["Create Config"]="สร้างคอนฟิก",
["Delete Config"]="ลบคอนฟิก",
["Load Config"]="โหลดคอนฟิก",
["Save Config"]="บันทึกคอนฟิก",

["Auto Load Selected"]="โหลดคอนฟิกที่เลือกอัตโนมัติ",

["Auto Load Mode"]="โหมดโหลดคอนฟิกอัตโนมัติ",

["UI Bind"]="ปุ่มเปิด/ปิด UI",

["Animation Style"]="รูปแบบแอนิเมชัน",

["Animation Direction"]="ทิศทางแอนิเมชัน",

["Animation Time"]="เวลาแอนิเมชัน",

["Share Configs"]="แชร์คอนฟิก",

["Copy Selected Config"]="คัดลอกคอนฟิกที่เลือก",

["Import Code"]="นำเข้าโค้ด",

["Import Config"]="นำเข้าคอนฟิก",


-- RARITIES
["Common"]="ธรรมดา",
["Uncommon"]="ไม่ธรรมดา",
["Rare"]="แรร์",
["Epic"]="อีพิก",
["Legendary"]="เลเจนดารี",
["Mythic"]="มิธิค",
["Mythical"]="มิธิค",
["Cosmic"]="คอสมิก",
["Celestial"]="เซเลสเชียล",
["Divine"]="ดีไวน์",
["Superior"]="ซูพีเรียร์",
["Eternal"]="อีเทอร์นัล",
["Secret"]="ซีเคร็ต",
["Limited"]="ลิมิเต็ด",
["Exclusive"]="เอ็กซ์คลูซีฟ",
["Exotic"]="เอ็กโซติก",
["Titan"]="ไททัน",
["Rainbow"]="เรนโบว์",

}


--========================================================
-- LOOKUP
--========================================================

local LOWER={}

for en,th in pairs(T) do
    LOWER[string.lower(en)]=th
end


--========================================================
-- HELPERS
--========================================================

local function IsText(o)
    return
        o:IsA("TextLabel")
        or o:IsA("TextButton")
        or o:IsA("TextBox")
end


local function GetRawText(o)

    if not IsText(o) then
        return ""
    end

    local ok,t=pcall(function()
        return o.Text
    end)

    if ok and type(t)=="string" then
        return t
    end

    return ""
end


local function Clean(text)

    if type(text)~="string" then
        return ""
    end

    return
        text
        :gsub("<[^>]+>","")
        :match("^%s*(.-)%s*$")
        or text
end


local function EscapePattern(s)

    return tostring(s)
        :gsub("([^%w])","%%%1")
end


--========================================================
-- TRANSLATE ONE LINE
--========================================================

local function TranslateLine(line)

    if type(line)~="string" or line=="" then
        return line
    end


    local lead=line:match("^(%s*)") or ""
    local tail=line:match("(%s*)$") or ""
    local c=line:match("^%s*(.-)%s*$") or line

    if c=="" then
        return line
    end


    -- EXACT
    local exact=LOWER[string.lower(c)]

    if exact then
        return lead..exact..tail
    end


    -- RICHTEXT
    local plain=
        c:gsub("<[^>]+>","")

    local exactPlain=
        LOWER[string.lower(plain)]

    if exactPlain then

        if plain~=c then

            local replaced=
                c:gsub(
                    EscapePattern(plain),
                    exactPlain,
                    1
                )

            return lead..replaced..tail
        end

        return lead..exactPlain..tail
    end


    --====================================================
    -- DYNAMIC
    --====================================================

    local n=
        plain:match("^(%d+)%s+selected$")

    if n then
        return lead.."เลือกแล้ว "..n.." รายการ"..tail
    end


    local a,b=
        plain:match("^Players%s+(%d+)%/(%d+)$")

    if a then
        return lead.."ผู้เล่น "..a.."/"..b..tail
    end


    a,b=
        plain:match("^(%d+)%s*/%s*(%d+)%s+players$")

    if a then
        return lead..a.."/"..b.." ผู้เล่น"..tail
    end


    local quick=
        plain:match("^Quick Bar%s*(%d+)$")

    if quick then
        return lead.."แถบด่วน "..quick..tail
    end


    local value=
        plain:match("^Last Steal:%s*(.+)$")

    if value then
        return lead.."ขโมยล่าสุด: "..value..tail
    end


    value=
        plain:match("^Last Issue:%s*(.+)$")

    if value then
        return lead.."ปัญหาล่าสุด: "..value..tail
    end


    value=
        plain:match("^Last Sell:%s*(.+)$")

    if value then
        return lead.."ขายล่าสุด: "..value..tail
    end


    value=
        plain:match("^Last Fuse:%s*(.+)$")

    if value then
        return lead.."ผสมล่าสุด: "..value..tail
    end


    value=
        plain:match("^Last claim:%s*(.+)$")

    if value then
        return lead.."รับล่าสุด: "..value..tail
    end


    local matches=
        plain:match("^Matches:%s*(%d+)$")

    if matches then
        return lead.."ตรงเงื่อนไข: "..matches..tail
    end


    value=
        plain:match("^Carrying:%s*(.+)$")

    if value then

        if value:lower()=="yes" then
            value="ใช่"

        elseif value:lower()=="no" then
            value="ไม่"
        end

        return lead.."กำลังถือ: "..value..tail
    end


    value=
        plain:match("^Stolen this session:%s*(.+)$")

    if value then
        return lead.."ขโมยได้ในเซสชันนี้: "..value..tail
    end


    value=
        plain:match("^([%d%.]+)%s+studs/s$")

    if value then
        return lead..value.." studs/วินาที"..tail
    end


    local expires=
        plain:match("^Expires:%s*(.+)$")

    if expires then
        return lead.."หมดอายุ: "..expires..tail
    end


    local features=
        plain:match("^(%d+)%s+features on$")

    if features then
        return lead..features.." ฟีเจอร์ที่เปิด"..tail
    end


    local fps=
        plain:match("^(%d+)%s+fps$")

    if fps then
        return lead..fps.." FPS"..tail
    end


    local ping=
        plain:match("^([%d%.]+)%s+ms%s+ping$")

    if ping then
        return lead..ping.." ms ปิง"..tail
    end


    local keytime=
        plain:match("^(.+)%s+key time$")

    if keytime then
        return lead..keytime.." เวลาคีย์"..tail
    end


    local sessiontime=
        plain:match("^(.+)%s+session$")

    if sessiontime then
        return lead..sessiontime.." เวลาใช้งาน"..tail
    end


    local eggcount,where=
        plain:match(
            "^Showing%s+(%d+)%s+egg%(s%):%s*(.+)$"
        )

    if eggcount then

        where=
            where:gsub(
                "your plot",
                "ฐานของคุณ"
            )

        return
            lead
            .."กำลังแสดงไข่ "
            ..eggcount
            .." ฟอง: "
            ..where
            ..tail
    end


    local trios=
        plain:match(
            "^Ready to fuse:%s*(%d+)%s+trios$"
        )

    if trios then

        return
            lead
            .."พร้อมผสม: "
            ..trios
            .." ชุด"
            ..tail
    end


    local scrambleTime=
        plain:match(
            "^Next Dr%. Scramble fight in%s+(.+)%s+%(estimated%)%.$"
        )

    if scrambleTime then

        return
            lead
            .."Dr. Scramble ครั้งถัดไปใน "
            ..scrambleTime
            .." (โดยประมาณ)"
            ..tail
    end


    local income,count=
        plain:match(
            "^Equipped:%s*(.-)%s*%(%s*(%d+)%s+pets%s*%)$"
        )

    if income then

        return
            lead
            .."ที่สวมใส่: "
            ..income
            .." ("
            ..count
            .." ตัว)"
            ..tail
    end


    income,count=
        plain:match(
            "^Inventory total:%s*(.-)%s*%(%s*(%d+)%s+pets%s*%)$"
        )

    if income then

        return
            lead
            .."รวมในกระเป๋า: "
            ..income
            .." ("
            ..count
            .." ตัว)"
            ..tail
    end


    value=
        plain:match("^Pets:%s*(.+)$")

    if value then
        return lead.."สัตว์เลี้ยง: "..value..tail
    end


    value=
        plain:match("^Eggs:%s*(.+)$")

    if value then
        return lead.."ไข่: "..value..tail
    end


    value=
        plain:match("^All:%s*(.+)$")

    if value then
        return lead.."รวมทั้งหมด: "..value..tail
    end


    -- CONFIG STATUS
    local loaded,autoload=
        plain:match(
            "^loaded:%s*(.-)%s*|%s*autoload:%s*(.+)$"
        )

    if loaded then

        if loaded=="none" then
            loaded="ไม่มี"
        end

        return
            lead
            .."โหลดแล้ว: "
            ..loaded
            .." | โหลดอัตโนมัติ: "
            ..autoload
            ..tail
    end


    --====================================================
    -- PARTIAL
    --====================================================

    local r=c

    local P={

        {"Capture Egg","จับไข่"},
        {"Safety","ความปลอดภัย"},
        {"Status","สถานะ"},
        {"Session","เซสชัน"},

        {"Auto Steal Eggs","ออโต้ขโมยไข่"},
        {"Auto Capture Egg","ออโต้จับไข่"},

        {"Auto Place Selected","ออโต้วางไข่ที่เลือก"},
        {"Auto Place All","ออโต้วางไข่ทั้งหมด"},
        {"Auto Hatch Ready","ออโต้ฟักไข่ที่พร้อม"},
        {"Auto Sell Eggs","ออโต้ขายไข่"},

        {"Auto Upgrade Pen","ออโต้อัปเกรดคอก"},
        {"Auto Treadmill Training","ออโต้ฝึกลู่วิ่ง"},
        {"Auto Treadmill Upgrade","ออโต้อัปเกรดลู่วิ่ง"},

        {"Auto Buy Selected Trails","ออโต้ซื้อ Trail ที่เลือก"},
        {"Auto Buy All Cash Trails","ออโต้ซื้อ Trail ที่ใช้เงินสดทั้งหมด"},
        {"Auto Equip Best Trail","ออโต้ใส่ Trail ที่ดีที่สุด"},
        {"Auto Equip Best Gear","ออโต้ใส่อุปกรณ์ที่ดีที่สุด"},
        {"Auto Claim Index Rewards","ออโต้รับรางวัล Index"},
        {"Auto Claim Group Reward","ออโต้รับรางวัลกลุ่ม"},

        {"Inventory Value ESP","ESP มูลค่าของในกระเป๋า"},
        {"Delete Pets %(FPS BOOST%)","ซ่อนสัตว์เลี้ยง (เพิ่ม FPS)"},

        {"Auto Fuse Selected","ออโต้ผสมตัวที่เลือก"},
        {"Auto Fuse All Eligible","ออโต้ผสมทุกตัวที่เข้าเงื่อนไข"},

        {"Auto Equip Best Bat","ออโต้ใส่ไม้ตีที่ดีที่สุด"},

        {"Rarest Drones First","เก็บโดรนที่หายากที่สุดก่อน"},
        {"Auto Fight Boss","ออโต้ตีบอส"},
        {"Auto Claim Mastery","ออโต้รับ Mastery"},

        {"Scrambled Mutation","การกลายพันธุ์ Scrambled"},

        {"Biohazard Pets","สัตว์เลี้ยง Biohazard"},
        {"Experimental Pets","สัตว์เลี้ยงทดลอง"},

        {"Auto Steal Recipe Eggs","ออโต้ขโมยไข่สำหรับสูตร"},
        {"Auto Mutation Shards","ออโต้ชาร์ดกลายพันธุ์"},
        {"Shards","ชาร์ด"},

        {"Auto Equip Pets","ออโต้ใส่สัตว์เลี้ยง"},
        {"Claim Offline Earnings","รับรายได้ตอนออฟไลน์"},

        {"Auto Sell Selected","ออโต้ขายตัวที่เลือก"},
        {"Auto Sell All Eligible","ออโต้ขายทุกตัวที่เข้าเงื่อนไข"},
        {"Auto Unequip for Selling","ถอดสัตว์เลี้ยงอัตโนมัติก่อนขาย"},

        {"Only Mutated Eggs","เฉพาะไข่ที่กลายพันธุ์"},
        {"Skip Contested Eggs","ข้ามไข่ที่มีผู้เล่นอื่นกำลังแย่ง"},
        {"Always Steal Dragon Eggs","ขโมยไข่มังกรเสมอ"},

        {"Auto Execute","เปิดสคริปต์อัตโนมัติ"},
        {"Auto Reconnect","เชื่อมต่อใหม่อัตโนมัติ"},

        {"Auto Great Bloom","ออโต้ Great Bloom"},
        {"Auto Insert Egg","ออโต้ใส่ไข่"},
        {"Auto Deposit","ออโต้ฝาก"},
        {"Auto Mutate","ออโต้กลายพันธุ์"},
        {"Remove After Mutating","นำออกหลังกลายพันธุ์"},

        {"Anti Treadmill","กันลู่วิ่ง"},
        {"Anti Guard","ป้องกันยาม"},
        {"Anti Knockback","กันกระเด็น"},
        {"Anti Knock Back","กันกระเด็น"},
        {"Anti Ragdoll","กันล้ม"},

        {"God Mode","โหมดป้องกัน"},

        {"Return To Last Position","กลับตำแหน่งล่าสุด"},
        {"Return to Last Position","กลับตำแหน่งล่าสุด"},
        {"Return To Plot","กลับฐาน"},
        {"Return to Plot","กลับฐาน"},

        {"Notify Filter","ตัวกรองแจ้งเตือน"},

        {"Report To Dashboard","รายงานไปยังแดชบอร์ด"},
        {"Dashboard Key","คีย์แดชบอร์ด"},
        {"Send Report Now","ส่งรายงานตอนนี้"},
        {"How To Connect","วิธีเชื่อมต่อ"},
        {"Needs Premium to Use!","ต้องใช้ Premium!"},

        {"Autosave loaded config","บันทึกคอนฟิกที่โหลดอยู่แบบอัตโนมัติ"},
        {"Refresh list","รีเฟรชรายการ"},

        {"Whole screen","ทั้งหน้าจอ"},

        {"Rain","ฝน"},
        {"Petals","กลีบดอกไม้"},
        {"Hearts","หัวใจ"},
        {"Stars","ดาว"},
        {"Leaves","ใบไม้"},

        {"Dots","ลายจุด"},
        {"Grid","ลายตาราง"},
        {"Diagonal","ลายทแยง"},
        {"Noise","ลายสุ่ม"},

        {"GreatBloom","Great Bloom"},
        {"Golden","ทอง"},
        {"Silver","เงิน"},

        -- BF V1.7.9 ENCHANTED
        {"Auto Wisp Quests","ออโต้ทำเควสต์ Wisp"},
        {"Steal Wisp Quest Eggs","ขโมยไข่เควสต์ Wisp"},
        {"Auto Claim Net","ออโต้รับตาข่าย"},
        {"Auto Catch Butterflies","ออโต้จับผีเสื้อ"},
        {"Auto Essence","ออโต้เอสเซนส์"},
        {"Auto Trade Up","ออโต้แลกอัปเกรด"},
        {"Auto Banjo Cricket","ออโต้จิ้งหรีดแบนโจ"},

        {"Green %-%> Blue","เขียว → น้ำเงิน"},
        {"Blue %-%> Purple","น้ำเงิน → ม่วง"},
        {"Purple %-%> Golden","ม่วง → ทอง"},
        {"Purple %-%> Gold","ม่วง → ทอง"},

        {"Prediction is patched","ระบบคาดการณ์ถูกแก้แล้ว"},

        {"Legendary","เลเจนดารี"},
        {"Mythical","มิธิค"},
        {"Mythic","มิธิค"},
        {"Divine","ดีไวน์"},
        {"Eternal","อีเทอร์นัล"},
        {"Secret","ซีเคร็ต"},

        {"Abyss Ocean","มหาสมุทรอเวจี"},
        {"Cherry Blossom","ซากุระ"},
        {"Light Dark","ไลท์ดาร์ก"},
        {"Prehistoric","ยุคดึกดำบรรพ์"},
        {"Titan Temple","วิหารไททัน"},
        {"Volcano","ภูเขาไฟ"},
        {"Desert","ทะเลทราย"},
        {"Forest","ป่า"},
        {"Jungle","ป่าดิบ"},
        {"Lake","ทะเลสาบ"},
        {"Snow","หิมะ"},
    }


    for _,pair in ipairs(P) do
        r=r:gsub(pair[1],pair[2])
    end


    if r~=c then
        return lead..r..tail
    end


    return line
end


--========================================================
-- MULTI LINE
--========================================================

local function Translate(text)

    if type(text)~="string" or text=="" then
        return text
    end


    if not text:find("\n",1,true) then
        return TranslateLine(text)
    end


    local output={}


    for line in (text.."\n"):gmatch("(.-)\n") do

        table.insert(
            output,
            TranslateLine(line)
        )
    end


    return table.concat(output,"\n")
end


--========================================================
-- BF SIGNATURES
--========================================================

local SIGNATURES={

"auto steal eggs",
"auto capture egg",
"contest flee range",
"auto place selected",
"auto hatch ready",
"auto fuse selected",
"auto equip pets",
"auto great bloom",
"remove after mutating",
"auto insert egg",
"auto mutate",
"prediction is patched",
"copy selected config",
"auto load selected",
"dr. scramble",
"big egg filter",

}


local function IsBFSignature(text)

    if type(text)~="string" then
        return false
    end


    local lower=
        string.lower(
            Clean(text)
        )


    for _,signature in ipairs(SIGNATURES) do

        if lower:find(
            signature,
            1,
            true
        ) then

            return true
        end
    end


    return false
end


--========================================================
-- ROOTS
--========================================================

local ROOTS={}


local function AddRoot(root)

    if not root then
        return false
    end


    for _,r in ipairs(ROOTS) do

        if r==root then
            return false
        end
    end


    table.insert(ROOTS,root)

    return true
end


AddRoot(PG)
AddRoot(CoreGui)


if type(gethui)=="function" then

    local ok,hui=pcall(gethui)

    if ok and hui then
        AddRoot(hui)
    end
end


--========================================================
-- FIND TOP UI ROOT
--========================================================

local function FindTopUIRoot(object)

    if not object then
        return nil
    end


    local current=object
    local last=object


    while current.Parent do

        local parent=current.Parent


        for _,root in ipairs(ROOTS) do

            if parent==root then
                return current
            end
        end


        if current:IsA("ScreenGui") then
            return current
        end


        last=current
        current=parent
    end


    return last
end


--========================================================
-- STATE
--========================================================

local ClaimedRoots=
    setmetatable(
        {},
        {__mode="k"}
    )


local WatchedTexts=
    setmetatable(
        {},
        {__mode="k"}
    )


local Busy=
    setmetatable(
        {},
        {__mode="k"}
    )


local RootConnections=
    setmetatable(
        {},
        {__mode="k"}
    )


--========================================================
-- CREDIT
--========================================================

local function AddCredit(root)

    if not root or not root.Parent then
        return
    end


    local parent=root


    if not parent:IsA("GuiObject")
        and not parent:IsA("LayerCollector")
    then
        return
    end


    if parent:FindFirstChild(
        "ZIGZAG_BF_TRANSLATION_CREDIT"
    ) then
        return
    end


    local label=
        Instance.new("TextLabel")


    label.Name=
        "ZIGZAG_BF_TRANSLATION_CREDIT"

    label.BackgroundTransparency=1
    label.AnchorPoint=Vector2.new(1,0)

    label.Position=
        UDim2.new(1,-18,0,10)

    label.Size=
        UDim2.fromOffset(220,28)

    label.Text=CREDIT_TEXT

    label.TextColor3=
        CREDIT_COLOR

    label.TextStrokeColor3=
        Color3.fromRGB(80,0,55)

    label.TextStrokeTransparency=0.05
    label.TextSize=16

    label.Font=
        Enum.Font.GothamBold

    label.TextXAlignment=
        Enum.TextXAlignment.Right

    label.ZIndex=999999
    label.Active=false


    local stroke=
        Instance.new("UIStroke")

    stroke.Name=
        "ZIGZAG_CREDIT_STROKE"

    stroke.Color=
        CREDIT_STROKE

    stroke.Thickness=1.15
    stroke.Transparency=0.12
    stroke.Parent=label


    local gradient=
        Instance.new("UIGradient")

    gradient.Name=
        "ZIGZAG_CREDIT_GRADIENT"

    gradient.Color=
        ColorSequence.new({

            ColorSequenceKeypoint.new(
                0,
                Color3.fromRGB(255,235,250)
            ),

            ColorSequenceKeypoint.new(
                0.5,
                Color3.fromRGB(255,90,210)
            ),

            ColorSequenceKeypoint.new(
                1,
                Color3.fromRGB(255,220,248)
            )

        })

    gradient.Parent=label
    label.Parent=parent
end


--========================================================
-- APPLY TEXT
--========================================================

local function ApplyText(object)

    if not IsText(object)
        or Busy[object]
    then
        return false
    end


    Busy[object]=true

    local changed=false


    pcall(function()

        local old=object.Text
        local new=Translate(old)

        if old~=new then

            object.Text=new
            changed=true
        end
    end)


    if object:IsA("TextBox") then

        pcall(function()

            local old=
                object.PlaceholderText

            local new=
                Translate(old)

            if old~=new then

                object.PlaceholderText=new
                changed=true
            end
        end)
    end


    Busy[object]=nil

    return changed
end


--========================================================
-- WATCH DYNAMIC TEXT
--========================================================

local function WatchText(object)

    if not IsText(object)
        or WatchedTexts[object]
    then
        return
    end


    WatchedTexts[object]=true


    object:GetPropertyChangedSignal(
        "Text"
    ):Connect(function()

        if Busy[object] then
            return
        end


        task.defer(function()

            if object
                and object.Parent
            then
                ApplyText(object)
            end
        end)
    end)


    if object:IsA("TextBox") then

        object:GetPropertyChangedSignal(
            "PlaceholderText"
        ):Connect(function()

            if Busy[object] then
                return
            end


            task.defer(function()

                if object
                    and object.Parent
                then
                    ApplyText(object)
                end
            end)
        end)
    end
end


--========================================================
-- APPLY BF ROOT
--========================================================

local function ApplyBFRoot(root)

    if not root
        or not root.Parent
    then
        return
    end


    if ClaimedRoots[root] then
        return
    end


    ClaimedRoots[root]=true


    if IsText(root) then

        ApplyText(root)
        WatchText(root)
    end


    for _,object in ipairs(
        root:GetDescendants()
    ) do

        if IsText(object) then

            ApplyText(object)
            WatchText(object)
        end
    end


    AddCredit(root)


    local descendantConnection=
        root.DescendantAdded
        :Connect(function(object)

            if not IsText(object) then
                return
            end


            task.defer(function()

                if object
                    and object.Parent
                then

                    ApplyText(object)
                    WatchText(object)
                end
            end)
        end)


    local ancestryConnection


    ancestryConnection=
        root.AncestryChanged
        :Connect(function()

            if not root.Parent then

                pcall(function()
                    descendantConnection:Disconnect()
                end)


                pcall(function()
                    ancestryConnection:Disconnect()
                end)


                ClaimedRoots[root]=nil
                RootConnections[root]=nil
            end
        end)


    RootConnections[root]={
        descendantConnection,
        ancestryConnection
    }


    print(
        "✅ BF UI detected | Thai translation active"
    )
end


--========================================================
-- SCORE ROOT
--========================================================

local function ScoreRoot(root)

    if not root
        or not root.Parent
    then
        return 0
    end


    local score=0
    local checked=0


    local function CheckObject(o)

        if checked>=150 then
            return
        end


        if not IsText(o) then
            return
        end


        checked+=1


        local text=
            Clean(
                GetRawText(o)
            )


        if text=="" then
            return
        end


        if IsBFSignature(text) then

            score+=5
            return
        end


        if LOWER[
            string.lower(text)
        ] then

            score+=1
        end
    end


    CheckObject(root)


    for _,o in ipairs(
        root:GetDescendants()
    ) do

        CheckObject(o)


        if checked>=150
            or score>=5
        then
            break
        end
    end


    return score
end


--========================================================
-- NEW OBJECT HANDLER
--========================================================

local function CheckNewText(object)

    if not IsText(object) then
        return
    end


    local text=
        GetRawText(object)


    if IsBFSignature(text) then

        local root=
            FindTopUIRoot(object)


        if root then
            ApplyBFRoot(root)
        end


        return
    end


    for root,_ in pairs(
        ClaimedRoots
    ) do

        if object==root
            or object:IsDescendantOf(root)
        then

            ApplyText(object)
            WatchText(object)

            return
        end
    end
end


--========================================================
-- WATCH ROOTS
--========================================================

local WatchedRoots=
    setmetatable(
        {},
        {__mode="k"}
    )


local NewCandidates=
    setmetatable(
        {},
        {__mode="k"}
    )


local function WatchRoot(root)

    if not root
        or WatchedRoots[root]
    then
        return
    end


    WatchedRoots[root]=true


    root.ChildAdded
    :Connect(function(child)

        NewCandidates[child]=true
    end)


    root.DescendantAdded
    :Connect(function(object)

        if IsText(object) then

            task.defer(function()

                if object
                    and object.Parent
                then

                    CheckNewText(object)
                end
            end)
        end
    end)
end


for _,root in ipairs(ROOTS) do
    WatchRoot(root)
end


--========================================================
-- FALLBACK
--========================================================

local function CheckCandidates()

    for root,_ in pairs(
        NewCandidates
    ) do

        if root
            and root.Parent
            and not ClaimedRoots[root]
        then

            local score=
                ScoreRoot(root)


            if score>=3 then
                ApplyBFRoot(root)
            end
        end
    end
end


--========================================================
-- REFRESH GETHUI
--========================================================

local function RefreshHUI()

    if type(gethui)~="function" then
        return
    end


    local ok,hui=
        pcall(gethui)


    if ok and hui then

        if AddRoot(hui) then
            WatchRoot(hui)
        end
    end
end


--========================================================
-- TRANSLATOR STARTS FIRST
--========================================================

print(
    "✅ ZIGZAG BF Translator V2.4 armed"
)


--========================================================
-- LOAD BF
--========================================================

task.spawn(function()

    local ok,source=
        pcall(function()

            return game:HttpGet(
                BF_URL
            )
        end)


    if not ok then

        warn(
            "[BF ZIGZAG] โหลด BFLoader ไม่สำเร็จ:",
            source
        )

        return
    end


    local func,err=
        loadstring(source)


    if not func then

        warn(
            "[BF ZIGZAG] Load Error:",
            err
        )

        return
    end


    local success,runError=
        pcall(func)


    if not success then

        warn(
            "[BF ZIGZAG] Runtime Error:",
            runError
        )
    end
end)


--========================================================
-- STARTUP FALLBACK
--========================================================

task.spawn(function()

    task.wait(0.5)
    RefreshHUI()
    CheckCandidates()

    task.wait(1)
    RefreshHUI()
    CheckCandidates()

    task.wait(2)
    RefreshHUI()
    CheckCandidates()

    task.wait(3)
    RefreshHUI()
    CheckCandidates()

    task.wait(4)
    CheckCandidates()

end)


--========================================================
-- NOTIFICATION
--========================================================

task.delay(
    2,
    function()

        pcall(function()

            StarterGui:SetCore(
                "SendNotification",
                {
                    Title="🥭 BigFroot ภาษาไทย",
                    Text="แปลไทยโดย ZIGZAG | V2.4",
                    Duration=5
                }
            )
        end)
    end
)


print("========================================")
print("✅ BIGFROOT THAI - ZIGZAG V2.4 MERGED")
print("✅ WORKING V2 ENGINE")
print("✅ BFLoader INCLUDED")
print("✅ V2.3 BASE PRESERVED")
print("✅ BF V1.7.9 ENCHANTED UPDATE")
print("✅ WISP / BUTTERFLIES / ESSENCE")
print("✅ TRADE UP / BANJO CRICKET")
print("✅ AREA / DROPDOWN")
print("✅ SETTINGS / CONFIG / THEME")
print("✅ WEATHER / PATTERN")
print("✅ WEBHOOK / DASHBOARD")
print("✅ FUSE / SHRINE")
print("✅ DR SCRAMBLE")
print("✅ MULTI-LINE + RICHTEXT")
print("✅ DYNAMIC TEXT")
print("✅ ZIGZAG CREDIT")
print("========================================")
