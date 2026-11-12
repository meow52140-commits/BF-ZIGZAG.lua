--========================================================
-- BIGFROOT THAI - ZIGZAG V2.6.5 TWO MAP + DROPDOWN THAI FULL MERGED
-- BASE: USER-PROVIDED WORKING V2.5.2 FIXED (V2.5.1)
-- BF v1.8.2 RACE + BF v1.8.6 HALLOWEEN + BF v1.8.7 TASK PRIORITY + BF v2.0.1 UFO/BAT + Break and Steal an Egg
-- Translator engine, source URL, theme and old mappings preserved
-- No RenderStepped / no permanent full-scan loop
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
-- ZIGZAG THEME
--========================================================

local ZIGZAG_THEME_ASSET=
    "104570286698558"

local ZIGZAG_THEME_JSON=[=[
{
  "Theme": {
    "Glow": false,
    "Colors": {
      "Panel": "0f0818",
      "Text": "f2eaff",
      "Element": "241331",
      "Risky": "e65757",
      "Outline": "7a39e6",
      "Hover": "341252",
      "Background": "12091d",
      "DimText": "b89ce0",
      "Accent": "9a4dff"
    },
    "Icon": "rbxassetid://104570286698558",
    "Wallpaper": {
      "Transparency": 0.14,
      "Image": "rbxassetid://104570286698558"
    },
    "ElementGlow": true,
    "CardOpacity": 0.9
  },
  "blush": 1,
  "Name": "ZIGZAG",
  "Kind": "theme"
}
]=]

local ZIGZAG_THEME_APPLIED=false
local ZIGZAG_THEME_RUNNING=false
local ZIGZAG_THEME_IMPORT_ATTEMPTED=false

--========================================================
-- TRANSLATIONS: ALL V2.5.2 MAPPINGS RETAINED
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

-- V2.5.2 FIXED - EXACT DROPDOWN MAPPINGS
["Plot Center"]="กลางฐาน",
["Pen Area"]="พื้นที่คอก",
["Start Area"]="พื้นที่เริ่มต้น",
["1st Area (no claim)"]="พื้นที่แรก (ไม่ต้องเคลม)",

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

["Auto Admin Treadmill"]="ออโต้ลู่วิ่งแอดมิน",

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
["Banners (empty = any)"]="Banner (ว่าง = ทั้งหมด)",

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

--========================================================
-- BF V1.8.2 - RACE / SHOOTING STARS UPDATE (ADDED ONLY)
--========================================================
["Race"]="การแข่งขัน",
["Race Rally"]="การแข่งขันแรลลี่",
["Auto Join Race Rally"]="เข้าร่วมการแข่งขันแรลลี่อัตโนมัติ",
["Prioritize Race Over Eggs"]="ให้การแข่งขันสำคัญกว่าการเก็บไข่",
["Auto Race"]="แข่งขันอัตโนมัติ",
["Race Autopilot"]="ระบบขับแข่งขันอัตโนมัติ",
["Race Speed"]="ความเร็วในการแข่งขัน",
["No race open -- waiting."]="ยังไม่มีการแข่งขัน — กำลังรอ",
["No race open — waiting."]="ยังไม่มีการแข่งขัน — กำลังรอ",
["No race open – waiting."]="ยังไม่มีการแข่งขัน — กำลังรอ",
["No race open - waiting."]="ยังไม่มีการแข่งขัน — กำลังรอ",
["Race Rewards"]="รางวัลการแข่งขัน",
["Auto Claim Race Milestones"]="รับรางวัลการแข่งขันอัตโนมัติ",
["Auto Buy From Race Shop"]="ซื้อของจากร้านแข่งขันอัตโนมัติ",
["Nitro Mutation"]="การกลายพันธุ์ไนโตร",
["Cash Booster"]="ตัวเพิ่มรายได้",
["Speed Boost"]="เพิ่มความเร็ว",
["Treadmill Boost"]="เพิ่มประสิทธิภาพลู่วิ่ง",
["Racing Bat"]="ไม้ตีแข่งขัน",
["Shooting Stars"]="ดาวตก",
["Auto Catch Shooting Stars"]="เก็บดาวตกอัตโนมัติ",
["Shooting ดาว"]="ดาวตก",
["Auto Catch Shooting ดาว"]="เก็บดาวตกอัตโนมัติ",
["+ Auto Race"]="+ แข่งขันอัตโนมัติ",
["+ Race Autopilot"]="+ ระบบขับแข่งขันอัตโนมัติ",
["+ Auto Join Race Rally"]="+ เข้าร่วมการแข่งขันแรลลี่อัตโนมัติ",
["+ Prioritize Race Over Eggs"]="+ ให้การแข่งขันสำคัญกว่าการเก็บไข่",
["+ Auto Claim Race Milestones"]="+ รับรางวัลการแข่งขันอัตโนมัติ",
["+ Auto Buy From Race Shop"]="+ ซื้อของจากร้านแข่งขันอัตโนมัติ",
["+ Auto Catch Shooting Stars"]="+ เก็บดาวตกอัตโนมัติ",
["+ Auto Catch Shooting ดาว"]="+ เก็บดาวตกอัตโนมัติ",
["+ Fixed Enchanted eggs going back to their nest"]="+ แก้ไขไข่มนตรากลับรัง",
["+ Fixed Ultra FPS Boost deleting the race"]="+ แก้ไขโหมดเพิ่ม FPS สูงสุดที่ทำให้การแข่งขันหายไป",
["+ Fixed black screen after races"]="+ แก้ไขหน้าจอดำหลังการแข่งขัน",

--========================================================
-- BF V1.8.6 - HALLOWEEN UPDATE (ADDED ONLY)
-- Exact names as shown on Halloween screen; no changes to BF logic.
--========================================================
["Halloween"]="ฮาโลวีน",
["Halloween Dimension"]="มิติฮาโลวีน",
["Open Now"]="เปิดอยู่ตอนนี้",
["Dimension"]="มิติ",
["Train"]="รถไฟ",
["Candy Corn"]="ข้าวโพดลูกกวาด",
["Souls"]="วิญญาณ",
["Tickets"]="ตั๋ว",
["Auto Halloween Eggs"]="ออโต้เก็บไข่ฮาโลวีน",
["Steal Rarities"]="ระดับความหายากของไข่ที่จะขโมย",
["Auto Kill Monsters"]="ออโต้กำจัดมอนสเตอร์",
["Auto Pumpkin Moon"]="ออโต้กิจกรรมพระจันทร์ฟักทอง",
["Halloween Before Eggs"]="ให้ฮาโลวีนสำคัญกว่าการเก็บไข่",
["Phantom Express"]="รถไฟปีศาจ Phantom Express",
["Auto Ride The Train"]="ออโต้ขึ้นรถไฟ",
["Auto Trade Souls"]="ออโต้แลกวิญญาณ",
["Auto Ghouler"]="ออโต้ Ghouler",
["Ghouler"]="Ghouler",
["Pumpkin Boss"]="บอสฟักทอง",
["Auto Pumpkin Boss"]="ออโต้ต่อสู้บอสฟักทอง",
["Auto Manor Key"]="ออโต้เก็บกุญแจคฤหาสน์",
["Ghost Dog Quest"]="เควสต์สุนัขผี",
["Auto Ghost Dog Quest"]="ออโต้ทำเควสต์สุนัขผี",
["Auto Fish"]="ออโต้ตกปลา",
["Candy Shop"]="ร้านขนมฮาโลวีน",
["Auto Buy Halloween Egg"]="ออโต้ซื้อไข่ฮาโลวีน",

-- These composite strings appear as one label in BF v1.8.6.
-- Dynamic variants are handled separately in TranslateLine.
["Dimension OPEN | Train OPEN | Ghouler - | Pumpkin Boss closed"]="มิติเปิด | รถไฟเปิด | Ghouler - | บอสฟักทองปิด",
["Candy Corn 200 | Souls 0 | Tickets 0"]="ข้าวโพดลูกกวาด 200 | วิญญาณ 0 | ตั๋ว 0",


--========================================================
-- BF V1.8.7 - TASK PRIORITY / SPIRIT PRIORITY (ADDED ONLY)
-- Captions and dropdown choices from ZIGZAG screenshots.
--========================================================
["Task Priority"]="ลำดับความสำคัญของงาน",
["Task"]="งาน",
["Move Up"]="เลื่อนขึ้น",
["Move Down"]="เลื่อนลง",
["To Top"]="ย้ายขึ้นบนสุด",
["Order (top first)"]="ลำดับงาน (บนสุดก่อน)",
["Capture The Egg"]="จับไข่",
["Steal Filter Eggs"]="ขโมยไข่ตามตัวกรอง",
["Steal Recipe Eggs"]="ขโมยไข่สำหรับสูตร",
["Shooting Star"]="ดาวตก",
["Butterfly Bloom"]="ผีเสื้อผลิบาน",
["Halloween Eggs"]="ไข่ฮาโลวีน",
["Pumpkin Moon"]="พระจันทร์ฟักทอง",
["Halloween Farming"]="ฟาร์มฮาโลวีน",
["Spirit Priority"]="ลำดับความสำคัญของวิญญาณ",
["Vengeful"]="วิญญาณพยาบาท",
["Haunted"]="วิญญาณสิงสู่",
["Lost"]="วิญญาณหลงทาง",
["Monsters For"]="เวลาต่อมอนสเตอร์",
["Fish For"]="เวลาตกปลา",
["Auto Ride Train"]="ออโต้ขึ้นรถไฟ",
["Steal Wisp Eggs"]="ขโมยไข่เควสต์ Wisp",
["Quest"]="เควสต์",


--========================================================
-- BF v2.0.1 - UFO / BAT / STEAL MODE UPDATE (ADDED ONLY)
-- Screenshots: UFO page, Bat page, auto-steal modes and Tween speed.
-- Keep original BF controls and all existing mappings untouched.
--========================================================
["UFO Sightings"]="กิจกรรมพบเห็น UFO",
["Auto UFO Sightings"]="ออโต้กิจกรรม UFO",
["Rare UFO Vault + Capsules"]="ห้องนิรภัย UFO หายาก + แคปซูล",
["Rare UFO Vault"]="ห้องนิรภัย UFO หายาก",
["UFO Capsules"]="แคปซูล UFO",
["Auto Trade In (Alien ชาร์ด)"]="ออโต้แลก (ชาร์ดเอเลี่ยน)",
["Auto Trade In (Alien Shards)"]="ออโต้แลก (ชาร์ดเอเลี่ยน)",
["Auto Trade-In (Alien Shards)"]="ออโต้แลก (ชาร์ดเอเลี่ยน)",
["Alien Shards"]="ชาร์ดเอเลี่ยน",
["Alien Shard"]="ชาร์ดเอเลี่ยน",
["Waiting for tonight's UFO."]="กำลังรอ UFO ของคืนนี้",
["Waiting for tonight’s UFO."]="กำลังรอ UFO ของคืนนี้",
["Waiting for tonight's UFO"]="กำลังรอ UFO ของคืนนี้",
["UFO event"]="กิจกรรม UFO",
["UFO Event"]="กิจกรรม UFO",
["Bat"]="ไม้ตี",
["Steal From Other Players"]="ขโมยจากผู้เล่นอื่น",
["Steal from other players"]="ขโมยจากผู้เล่นอื่น",
["Tween Speed"]="ความเร็ว Tween",
["Tween speed"]="ความเร็ว Tween",
["Instant Steal Speed"]="ความเร็วขโมยทันที",
["Auto Steal Settings"]="ตั้งค่าการขโมยอัตโนมัติ",

}


--========================================================
-- BREAK AND STEAL AN EGG: ISOLATED MAP TRANSLATION PACK
-- Never merged into legacy Steal an Egg dictionary.
--========================================================
local BREAK_STEAL_TEXT = {
    ["Break and Steal an Egg"]="ทุบและขโมยไข่",
    ["Auto Farm"]="ฟาร์มอัตโนมัติ",
    ["Auto Farm Eggs"]="ฟาร์มไข่อัตโนมัติ",
    ["Break Eggs (none = auto)"]="ไข่ที่จะทุบ (ไม่เลือก = อัตโนมัติ)",
    ["Max Egg HP (0 = no limit)"]="พลังชีวิตไข่สูงสุด (0 = ไม่จำกัด)",
    ["Target Priority"]="ลำดับความสำคัญของเป้าหมาย",
    ["Luckiest"]="โชคสูงสุด",
    ["Egg Cycle (Plasma Method)"]="วนฟาร์มไข่ (วิธีพลาสมา)",
    ["Cycle Eggs"]="ไข่ที่ต้องการวนฟาร์ม",
    ["Wait For Hatch"]="รอไข่ฟัก",
    ["Movement"]="รูปแบบการเคลื่อนที่",
    ["Walk Only"]="เดินเท่านั้น",
    ["Steal Other Hatches"]="ขโมยไข่จากจุดฟักของผู้อื่น",
    ["Only Steal Pen Upgrades"]="ขโมยเฉพาะสิ่งที่ช่วยอัปเกรดคอก",
    ["Steal Filter"]="ตัวกรองการขโมย",
    ["Pet Rarities (none = all)"]="ความหายากสัตว์เลี้ยง (ไม่เลือก = ทั้งหมด)",
    ["Mutations (none = all)"]="การกลายพันธุ์ (ไม่เลือก = ทั้งหมด)",
    ["Sizes (none = all)"]="ขนาด (ไม่เลือก = ทั้งหมด)",
    ["Steal Above $/s"]="ขโมยที่มีรายได้มากกว่า $/วินาที",
    ["Steal Below $/s (0 = no limit)"]="ขโมยที่มีรายได้ต่ำกว่า $/วินาที (0 = ไม่จำกัด)",
    ["Also Steal Mutations"]="ขโมยตัวกลายพันธุ์ด้วย",
    ["Mutated Rarities (none = all)"]="ระดับความหายากตัวกลายพันธุ์ (ไม่เลือก = ทั้งหมด)",
    ["Mutated Steal Above $/s"]="ขโมยตัวกลายพันธุ์ที่มีรายได้มากกว่า $/วินาที",
    ["Steals"]="รายการขโมย",
    ["Recent"]="ล่าสุด",
    ["Time"]="เวลา",
    ["Animal"]="สัตว์เลี้ยง",
    ["nothing stolen yet"]="ยังไม่ได้ขโมยอะไร",
    ["Pickups: 0 hatching: 0"]="เก็บไข่: 0 | กำลังฟัก: 0",
    ["Auto Place"]="วางสัตว์เลี้ยงอัตโนมัติ",
    ["Auto Place Best"]="วางตัวที่ดีที่สุดอัตโนมัติ",
    ["Place Best Now"]="วางตัวที่ดีที่สุดตอนนี้",
    ["Auto Merge"]="ผสมอัตโนมัติ",
    ["Animals"]="สัตว์เลี้ยง",
    ["Auto Merge Selected"]="ผสมสัตว์ที่เลือกอัตโนมัติ",
    ["Auto Merge All Eligible"]="ผสมสัตว์ทุกตัวที่เข้าเงื่อนไข",
    ["Only Merge Below $/s (0 = no limit)"]="ผสมเฉพาะตัวที่มีรายได้ต่ำกว่า $/วินาที (0 = ไม่จำกัด)",
    ["Only Merge Above $/s (0 = no limit)"]="ผสมเฉพาะตัวที่มีรายได้มากกว่า $/วินาที (0 = ไม่จำกัด)",
    ["Sell Below $/s"]="ขายตัวที่มีรายได้ต่ำกว่า $/วินาที",
    ["Sell Rarities (none = all)"]="ระดับความหายากที่จะขาย (ไม่เลือก = ทั้งหมด)",
    ["Sell Mutations (none = all)"]="การกลายพันธุ์ที่จะขาย (ไม่เลือก = ทั้งหมด)",
    ["Sell Sizes (none = all)"]="ขนาดที่จะขาย (ไม่เลือก = ทั้งหมด)",
    ["Sell Now"]="ขายตอนนี้",
    ["Sell Eggs Below $/s"]="ขายไข่ที่มีรายได้ต่ำกว่า $/วินาที",
    ["Sell Egg Rarities (none = all)"]="ความหายากของไข่ที่จะขาย (ไม่เลือก = ทั้งหมด)",
    ["Give To Friend"]="มอบให้เพื่อน",
    ["Give"]="มอบให้",
    ["Give Above $/s"]="มอบตัวที่มีรายได้มากกว่า $/วินาที",
    ["Give Below $/s"]="มอบตัวที่มีรายได้ต่ำกว่า $/วินาที",
    ["Collect Drops At My Base"]="เก็บของที่ดรอปในฐานฉัน",
    ["Sync Merge Below + Steal Above To Pen"]="ผสมตัวมูลค่าต่ำและขโมยตัวมูลค่าสูงเข้าคอก",
    ["Merge Priority"]="ลำดับความสำคัญในการผสม",
    ["Most Copies"]="ตัวที่มีซ้ำมากที่สุด",
    ["Merge eggs"]="ผสมไข่",
    ["Auto Place + Hatch Eggs"]="วางและฟักไข่อัตโนมัติ",
    ["Egg Place Priority"]="ลำดับความสำคัญในการวางไข่",
    ["Best Egg"]="ไข่ที่ดีที่สุด",
    ["Fuse Machine"]="เครื่องหลอมรวม",
    ["Auto fuse"]="หลอมอัตโนมัติ",
    ["Farm Fuse Pets"]="ฟาร์มสัตว์เลี้ยงสำหรับหลอม",
    ["Auto Fuse (Needs 100B Speed)"]="หลอมอัตโนมัติ (ต้องมีความเร็ว 100B)",
    ["Merge Predictor"]="คาดการณ์ผลการผสม",
    ["No three alike to merge yet."]="ยังไม่มีสัตว์ชนิดเดียวกันครบ 3 ตัวเพื่อผสม",
    ["Treadmill"]="ลู่วิ่ง",
    ["Auto Treadmill"]="ลู่วิ่งอัตโนมัติ",
    ["Auto Upgrade Treadmill"]="อัปเกรดลู่วิ่งอัตโนมัติ",
    ["Pen upgrades"]="อัปเกรดคอก",
    ["Auto Upgrade Pen"]="อัปเกรดคอกอัตโนมัติ",
    ["Pickaxe"]="อีเต้อ",
    ["Best pickaxe"]="อีเต้อที่ดีที่สุด",
    ["Auto Buy + Equip Best Pickaxe"]="ซื้อและใช้อีเต้อที่ดีที่สุดอัตโนมัติ",
    ["Trail"]="รอยวิ่ง",
    ["Best trail"]="รอยวิ่งที่ดีที่สุด",
    ["Auto Buy + Equip Best Trail"]="ซื้อและใช้รอยวิ่งที่ดีที่สุดอัตโนมัติ",
    ["No trail owned"]="ยังไม่มีรอยวิ่ง",
    ["Index"]="สมุดสะสม",
    ["Auto Claim Index"]="รับรางวัลสมุดสะสมอัตโนมัติ",
    ["Auto Complete Index"]="เก็บสมุดสะสมให้ครบอัตโนมัติ",
    ["Bats"]="ไม้ตี",
    ["Auto Claim Bats"]="รับไม้ตีอัตโนมัติ",
    ["Auto Equip Best Bat"]="ใช้ไม้ตีที่ดีที่สุดอัตโนมัติ",
    ["Egg Hunt"]="ตามล่าไข่",
    ["Titanic Egg"]="ไข่ไททานิก",
    ["Prioritize Titanic Egg"]="ให้ความสำคัญกับไข่ไททานิก",
    ["Luckiest Eggs Here"]="ไข่ที่มีโชคสูงสุดในเซิร์ฟนี้",
    ["Egg hop"]="ย้ายเซิร์ฟเวอร์หาไข่",
    ["Server Hop For Eggs"]="ย้ายเซิร์ฟเวอร์เพื่อหาไข่",
    ["Min Egg Luck (blank = any)"]="ค่าโชคไข่ขั้นต่ำ (เว้นว่าง = ทั้งหมด)",
    ["Hop For Titanic Egg"]="ย้ายเซิร์ฟเวอร์หาไข่ไททานิก",
    ["Protection"]="ระบบป้องกัน",
    ["Stop Everything"]="หยุดทุกฟังก์ชัน",
    ["Tutorial"]="บทสอนเล่น",
    ["Auto Complete Tutorial"]="ทำบทสอนเล่นให้จบอัตโนมัติ",
    ["Activity"]="กิจกรรมที่ทำ",
    ["Job loop"]="วงจรการทำงาน",
    ["idle"]="ว่าง",
    ["ready"]="พร้อม",
    ["No Effects"]="ปิดเอฟเฟกต์",
    ["Server"]="เซิร์ฟเวอร์",
    ["Copy Job ID"]="คัดลอกรหัสเซิร์ฟเวอร์",
    ["Join Job ID"]="เข้าด้วยรหัสเซิร์ฟเวอร์",
    ["paste a Job ID"]="วางรหัสเซิร์ฟเวอร์",
    ["Join Server"]="เข้าเซิร์ฟเวอร์",
    ["Rejoin"]="เข้าเซิร์ฟเวอร์ใหม่",
    ["Webhook"]="เว็บฮุก",
    ["URL Webhook"]="ลิงก์เว็บฮุก",
    ["Discord User ID (optional)"]="Discord User ID (ไม่บังคับ)",
    ["tag @everyone"]="แท็ก @everyone",
    ["Merge Webhook"]="แจ้งเตือนเมื่อผสม",
    ["Upgrade Webhook"]="แจ้งเตือนเมื่ออัปเกรด",
    ["Kick Webhook"]="แจ้งเตือนเมื่อถูกเตะ",
    ["Inventory Full Webhook"]="แจ้งเตือนเมื่อกระเป๋าเต็ม",
    ["Send Test Message"]="ส่งข้อความทดสอบ",
    ["Alert Filter"]="ตัวกรองการแจ้งเตือน",
    ["Min Merge Result $/s (0 = every merge)"]="รายได้ขั้นต่ำหลังผสม $/วินาที (0 = ทุกครั้ง)",
    ["Min Weight KG (0 = no limit)"]="น้ำหนักขั้นต่ำ KG (0 = ไม่จำกัด)",
    ["Min Income $/s (0 = no limit)"]="รายได้ขั้นต่ำ $/วินาที (0 = ไม่จำกัด)",
    ["Pet ESP"]="ESP สัตว์เลี้ยง",
    ["Only Steal Filter Pets"]="แสดงเฉพาะสัตว์ที่ตรงตัวกรองขโมย",
    ["Hatch Preview"]="ดูตัวอย่างก่อนฟัก",
    ["Inventory ESP"]="ESP กระเป๋า",
    ["Egg ESP"]="ESP ไข่",
    ["Eggs (none = all)"]="ไข่ (ไม่เลือก = ทั้งหมด)",
    ["Min Luck (blank = any)"]="ค่าโชคขั้นต่ำ (เว้นว่าง = ทั้งหมด)",
    ["My Base ESP"]="ESP ฐานของฉัน",
    ["Leaderboard"]="ตารางอันดับ",
    ["Where You Stand"]="ตำแหน่งอันดับของคุณ",
    ["Money board"]="ตารางอันดับรายได้",
    ["Target"]="เป้าหมาย",
    ["Next Rank"]="อันดับถัดไป",
    ["When your eggs land"]="เมื่อไข่ของคุณเข้าฐาน",
    ["Leaderboard Mode"]="โหมดตารางอันดับ",
    ["Seeds"]="เมล็ดพันธุ์",
    ["Seed"]="เมล็ดพันธุ์",
    ["Hit"]="สำเร็จ",
    ["Miss"]="พลาด",
    ["Grows"]="เติบโต",
    ["no Gold / Diamond to seed yet"]="ยังไม่มีทองหรือเพชรให้เพาะเมล็ด",
    ["Rank"]="อันดับ",
    ["Player"]="ผู้เล่น",
    ["Income"]="รายได้",
    ["Under 25B speed: trains when idle"]="ความเร็วต่ำกว่า 25B: ฝึกเมื่อว่าง",
    ["Diamonds"]="เพชร",
    ["Diamond Shop"]="ร้านค้าเพชร",
    ["Auto Buy Best Plot Skin"]="ซื้อสกินฐานที่ดีที่สุดอัตโนมัติ",
    ["Auto Buy Ride Eggs"]="ซื้อไข่พาหนะอัตโนมัติ",
    ["Fence: none"]="รั้ว: ไม่มี",
    ["Rides"]="พาหนะ",
    ["Ride"]="ขี่พาหนะ",
    ["Auto Ride Fastest Mount"]="ขี่พาหนะที่เร็วที่สุดอัตโนมัติ",
    ["Not riding"]="ไม่ได้ขี่พาหนะ",
    ["No rideables yet"]="ยังไม่มีพาหนะ",
    ["Weather"]="สภาพอากาศ",
    ["Hacker Takeover"]="แฮกเกอร์ยึดครอง",
    ["Time Fracture"]="รอยแยกเวลา",
    ["Voidfall"]="ห้วงว่างถล่ม",
    ["Angelic Storm"]="พายุเทวทูต",
    ["Thunderstorm"]="พายุฝนฟ้าคะนอง",
    ["Blizzard"]="พายุหิมะ",
    ["Next 12 hours"]="อีก 12 ชั่วโมงข้างหน้า",
    ["Next Hacker Takeover"]="แฮกเกอร์ยึดครองครั้งถัดไป",
    ["Next Time Fracture"]="รอยแยกเวลาครั้งถัดไป",
    ["Next Voidfall"]="ห้วงว่างถล่มครั้งถัดไป",
    ["Next Angelic Storm"]="พายุเทวทูตครั้งถัดไป",
    ["Next Thunderstorm"]="พายุฝนฟ้าคะนองครั้งถัดไป",
    ["Next Blizzard"]="พายุหิมะครั้งถัดไป",
    -- New UI captions/choices visible in BF v1.1.9 (Break and Steal only).
    ["Auto Sell"]="ขายอัตโนมัติ",
    ["Auto Place Best Now"]="วางสัตว์เลี้ยงที่ดีที่สุดตอนนี้",
    ["Auto Place + Hatch"]="วางและฟักไข่อัตโนมัติ",
    ["Sell Eggs"]="ขายไข่",
    ["Sell"]="ขาย",
    ["Place"]="วาง",
    ["Merge"]="ผสม",
    ["Hatch"]="ฟักไข่",
    ["Farm"]="ฟาร์ม",
    ["Steal"]="ขโมย",
    ["Auto"]="อัตโนมัติ",
    ["Pickups"]="จำนวนที่เก็บ",
    ["hatching"]="กำลังฟัก",
    ["Carry"]="กำลังถือ",
    ["Eggs broken"]="ไข่ที่ทุบแล้ว",
    ["Damage"]="พลังโจมตี",
    ["hits/s"]="ครั้ง/วินาที",
    ["Pen"]="คอก",
    ["no treadmill"]="ยังไม่มีลู่วิ่ง",
    ["locked"]="ล็อกอยู่",
    ["Speed power"]="พลังความเร็ว",
    ["This session"]="รอบนี้",
    ["Active"]="กำลังทำงาน",
    ["Job ID"]="รหัสเซิร์ฟเวอร์",
    ["Auto Rejoin"]="เข้าเซิร์ฟเวอร์ใหม่อัตโนมัติ",
    ["Auto Reconnect"]="เชื่อมต่อใหม่อัตโนมัติ",
    ["Auto Join New Server"]="ย้ายไปเซิร์ฟเวอร์ใหม่อัตโนมัติ",
    ["Join New Server"]="เข้าเซิร์ฟเวอร์ใหม่",
    ["Anti AFK"]="ป้องกันการหลุดเมื่อ AFK",
    ["AFK Protection"]="ระบบป้องกันการหลุด AFK",
    ["Max FPS"]="เพิ่ม FPS สูงสุด",
    ["Maximize FPS"]="เพิ่ม FPS สูงสุด",
    ["FPS Boost"]="เพิ่ม FPS",
    ["Not riding yet"]="ยังไม่ได้ขี่พาหนะ",
    ["No three alike to merge yet"]="ยังไม่มีสัตว์ชนิดเดียวกันครบ 3 ตัวเพื่อผสม",
    ["Next fence"]="รั้วถัดไป",
    ["None"]="ไม่มี",
    ["All"]="ทั้งหมด",
    ["None = All"]="ไม่เลือก = ทั้งหมด",
    ["Upgrade"]="อัปเกรด",
    ["Current"]="ปัจจุบัน",
    ["Total"]="รวมทั้งหมด",
    ["Session"]="รอบการเล่น",
    ["Rows"]="รายการ",
    ["Steals per hour"]="จำนวนที่ขโมยต่อชั่วโมง",
    ["Diamonds per hour"]="เพชรต่อชั่วโมง",
    ["Rarity"]="ความหายาก",
    ["Mutations"]="การกลายพันธุ์",
    ["Sizes"]="ขนาด",
    ["Time until"]="เวลาเหลือ",
    ["Gap"]="ส่วนต่าง",
    ["ETA"]="เวลาที่คาดการณ์",
    ["e.g. 100m, 1b, 30b"]="เช่น 100m, 1b, 30b",
    ["e.g. 500t, 1qa"]="เช่น 500t, 1qa",
    ["e.g. 10m, 1b"]="เช่น 10m, 1b",
    ["e.g. 3"]="เช่น 3",
    ["e.g. 5"]="เช่น 5",
    ["0 sold for $0"]="ขายแล้ว 0 ตัว ได้เงิน $0",
    ["0 fused"]="หลอมแล้ว 0 ตัว",
    ["0 growing"]="กำลังเติบโต 0 ตัว",
    ["0 claimed this session"]="รับรางวัลไปแล้ว 0 ครั้งในรอบนี้",
    ["0 rows"]="0 รายการ",
    ["past #100"]="อันดับต่ำกว่า 100",
 }

--========================================================
-- V2.6.5 - BREAK AND STEAL AN EGG: POPUP / DROPDOWN OPTIONS
-- Added separately from the LEGACY dictionary (T).
-- Same English option is translated everywhere it appears in this map,
-- including dynamically opened / duplicated dropdown menus.
--========================================================
local BREAK_STEAL_POPUP_TEXT = {
    -- Size choices (farm filter, selling filter, ESP, etc.)
    ["Normal"]="ปกติ",
    ["Big"]="ใหญ่",
    ["Huge"]="ใหญ่มาก",
    ["Titanic"]="ไททานิก",

    -- Mutations / variants (all corresponding dropdowns)
    ["Gold"]="ทอง",
    ["Golden"]="ทอง",
    ["Diamond"]="เพชร",
    ["Shiny"]="เปล่งประกาย",
    ["Radioactive"]="กัมมันตรังสี",
    ["Rainbow"]="เรนโบว์",
    ["Lightning"]="สายฟ้า",
    ["Frozen"]="เยือกแข็ง",
    ["Angelic"]="เทวทูต",
    ["Hacker"]="แฮกเกอร์",
    ["Time"]="เวลา",
    ["Void"]="ความว่างเปล่า",
    ["Inferno"]="เพลิงนรก",
    ["Omega"]="โอเมกา",
    ["Spectral"]="วิญญาณ",
    ["Ethereal"]="ไร้รูปกาย",
    ["Primordial"]="ปฐมกาล",

    -- Rarity choices that are also found in sell/merge/steal popups
    ["Secret"]="ซีเคร็ต",
    ["Celestial"]="เซเลสเชียล",
    ["Common"]="ธรรมดา",
    ["Uncommon"]="ไม่ธรรมดา",
    ["Rare"]="แรร์",
    ["Epic"]="อีพิก",
    ["Legendary"]="เลเจนดารี",
    ["Mythic"]="มิธิค",
    ["Mythical"]="มิธิค",
    ["Divine"]="ดีไวน์",
    ["Eternal"]="อีเทอร์นัล",
    ["Exclusive"]="เอ็กซ์คลูซีฟ",

    -- Egg placement / merging order (repeated dropdown items)
    ["Most Copies"]="ตัวที่มีซ้ำมากที่สุด",
    ["Best Egg"]="ไข่ที่ดีที่สุด",
    ["Fastest Egg"]="ไข่ที่เร็วที่สุด",
    ["Rarest"]="หายากที่สุด",

    -- Movement choices: keep TP/version identifiers recognizable
    ["Walk Only"]="เดินเท่านั้น",
    ["TP v1 (Risky)"]="วาร์ป TP v1 (เสี่ยง)",
    ["TP v2 (Risky)"]="วาร์ป TP v2 (เสี่ยง)",
    ["TP v1 (risky)"]="วาร์ป TP v1 (เสี่ยง)",
    ["TP v2 (risky)"]="วาร์ป TP v2 (เสี่ยง)",
}

-- Merge only into the Break and Steal dictionary, NEVER into T.
local BREAK_STEAL_POPUP_LOWER={}
for english,thai in pairs(BREAK_STEAL_POPUP_TEXT) do
    BREAK_STEAL_TEXT[english]=thai
    BREAK_STEAL_POPUP_LOWER[string.lower(english)]=thai
end

local BREAK_STEAL_LOWER={}
for english,thai in pairs(BREAK_STEAL_TEXT) do
    BREAK_STEAL_LOWER[string.lower(english)]=thai
end

-- Only translations of the new game's changing status lines.
local function TranslateBreakStealDynamic(raw)
    -- Break and Steal v1.1.9 changing values: do not touch legacy maps.
    local count, more = raw:match("^(%d+)%s+in the backpack%s+sells? under%s+(.+)$")
    if count then return count.." ตัวในกระเป๋า | ขายตัวที่มีรายได้ต่ำกว่า "..more end
    count,more=raw:match("^(%d+)%s+sold for%s+(.+)$")
    if count then return "ขายแล้ว "..count.." ตัว | ได้เงิน "..more end
    local incomes=raw:match("^Takes above%s+(.+)$")
    if incomes then return "เก็บเฉพาะรายได้มากกว่า "..incomes end
    local carried,damage,hits=raw:match("^Carry%s+(%d+/%d+)%s+damage%s+([^%s]+)%s+([^%s]+)%s+hits/s$")
    if carried then return "กำลังถือ "..carried.." | โจมตี "..damage.." | "..hits.." ครั้ง/วินาที" end
    local broken,hour=raw:match("^Eggs broken%s+(%d+)%s+(%S+)%s+an hour$")
    if broken then return "ทุบไข่แล้ว "..broken.." ฟอง | "..hour.." ฟอง/ชั่วโมง" end
    local diamonds,rate=raw:match("^Diamonds%s+(%S+)%s+(%S+)%s+an hour$")
    if diamonds then return "เพชร "..diamonds.." | "..rate.." ต่อชั่วโมง" end
    local speed,current=raw:match("^Speed power%s+(%S+)%s+%(%+(%S+)%s+this session%)$")
    if speed then return "พลังความเร็ว "..speed.." (เพิ่ม "..current.." ในรอบนี้)" end
    local treadmill,multi=raw:match("^[Nn]o treadmill%s+x(%S+)%s+%(locked%)$")
    if treadmill then return "ยังไม่มีลู่วิ่ง | x"..treadmill.." (ยังล็อก)" end
    local kind,num,attacks=raw:match("^(.-)%s+([%d%.]+)%s+damage%s+([%d%.]+)%s+hits/s$")
    if kind then return kind.." | พลังโจมตี "..num.." | "..attacks.." ครั้ง/วินาที" end
    local past=raw:match("^past%s+#(%d+)$")
    if past then return "อันดับต่ำกว่า #"..past end
    local gap=raw:match("^Gap:%s*(.+)$")
    if gap then return "ส่วนต่าง: "..gap end
    local eta=raw:match("^ETA:%s*(.+)$")
    if eta then
        eta=eta:gsub("and ~", "และประมาณ ")
               :gsub("more variant giants", "ตัวระดับยักษ์พิเศษเพิ่มเติม")
        return "เวลาประมาณ: "..eta
    end
    local income=raw:match("^Takes any pet over%s+(.+)%s+%(your pen's weakest%),%s*new ones too$")
    if income then return "รับสัตว์เลี้ยงทุกตัวที่รายได้มากกว่า "..income.." (เทียบตัวที่รายได้น้อยสุดในคอก) รวมตัวใหม่ด้วย" end
    local fence=raw:match("^Next fence:%s*(.+)$")
    if fence then return "รั้วถัดไป: "..fence end
    local hrs,mins,secs,state=raw:match("^(%d%d):(%d%d):(%d%d)%s+(%a+)$")
    if hrs then
        local states={ready="พร้อม", idle="ว่าง", running="กำลังทำงาน", waiting="กำลังรอ"}
        local localized=states[string.lower(state)]
        if localized then return hrs..":"..mins..":"..secs.." "..localized end
    end
    local sample=raw:match("^e%.g%.%s+(.+)$")
    if sample then return "เช่น "..sample end
    if raw:match("^[Nn]o three alike to merge yet%.?$") then
        return "ยังไม่มีสัตว์ชนิดเดียวกันครบ 3 ตัวเพื่อผสม"
    end
    local n, h = raw:match("^Pen%s*(%d+)%s*/%s*(%d+)$")
    if n then return "คอก "..n.."/"..h end
    n,h = raw:match("^Pickups:%s*(%d+)%s+hatching:%s*(%d+)$")
    if n then return "เก็บไข่: "..n.." | กำลังฟัก: "..h end
    n,h = raw:match("^(%d+)%s+merged%s+(%d+)%s+eggs%s+hatched$")
    if n then return "ผสมแล้ว "..n.." ครั้ง | ฟักไข่ "..h.." ฟอง" end
    n,h = raw:match("^Machine needs%s+(.+)%s+speed%s+%(you:%s*(.+)%)$")
    if n then return "เครื่องต้องการความเร็ว "..n.." (คุณมี "..h..")" end
    n = raw:match("^next in%s+(.+)$")
    if n then return "อีก "..n end
    n = raw:match("^(%d+)%s+growing$")
    if n then return "กำลังเติบโต "..n end
    n = raw:match("^(%d+)%s+fused$")
    if n then return "หลอมแล้ว "..n end
    n = raw:match("^(%d+)%s+rows$")
    if n then return n.." รายการ" end
    n = raw:match("^(%d+)%s+claimed this session$")
    if n then return "ได้รับในรอบนี้ "..n end
    n = raw:match("^Job ID:%s*(.+)$")
    if n then return "รหัสเซิร์ฟเวอร์: "..n end
    n,h = raw:match("^(.+)%s+from the pen%s+weakest%s+(.+)$")
    if n then return "รายได้จากคอก "..n.." | ตัวต่ำสุด "..h end
    n,h = raw:match("^(.+)%s+damage%s+(.+)%s+hits/s$")
    if n then return n.." ดาเมจ | "..h.." ครั้ง/วินาที" end
    n,h = raw:match("^(.+)%s+%(Zone%s+(%d+),%s*(.-)%s+hp%)$")
    if n then return nil end -- keep pet/egg names unchanged
    local w=raw:match("^Next%s+(.+)$")
    if w then
        local names={
            ["Hacker Takeover"]="แฮกเกอร์ยึดครอง",
            ["Time Fracture"]="รอยแยกเวลา",
            ["Voidfall"]="ห้วงว่างถล่ม",
            ["Angelic Storm"]="พายุเทวทูต",
            ["Thunderstorm"]="พายุฝนฟ้าคะนอง",
            ["Blizzard"]="พายุหิมะ",
        }
        for en,thai in pairs(names) do
            if w:sub(1,#en)==en then
                return thai.." ครั้งถัดไป"..w:sub(#en+1)
            end
        end
    end
    return nil
end

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
-- ZIGZAG THEME HELPERS
-- ใช้ UI Import ของ BF เอง
-- ไม่มี Loop ถาวร
--========================================================

local function IsThemeImportBox(object)
    if not object
        or not object:IsA("TextBox")
    then
        return false
    end

    local ok,placeholder=
        pcall(function()
            return object.PlaceholderText
        end)

    if not ok
        or type(placeholder)~="string"
    then
        return false
    end

    local clean=
        string.lower(
            Clean(placeholder)
        )

    return
        clean:find(
            "paste a theme code",
            1,
            true
        )~=nil
        or
        Clean(placeholder):find(
            "วางโค้ดธีม",
            1,
            true
        )~=nil
end

local function HasZigzagWallpaper(root)
    if not root
        or not root.Parent
    then
        return false
    end

    local function Check(object)
        if not object:IsA("ImageLabel")
            and not object:IsA("ImageButton")
        then
            return false
        end

        local ok,image=
            pcall(function()
                return object.Image
            end)

        return
            ok
            and type(image)=="string"
            and image:find(
                ZIGZAG_THEME_ASSET,
                1,
                true
            )~=nil
    end

    if Check(root) then
        return true
    end

    for _,object in ipairs(
        root:GetDescendants()
    ) do
        if Check(object) then
            return true
        end
    end

    return false
end

local function GetButtonText(object)
    if not object
        or not object:IsA("TextButton")
    then
        return ""
    end

    local ok,text=
        pcall(function()
            return object.Text
        end)

    if ok
        and type(text)=="string"
    then
        return Clean(text)
    end

    return ""
end

local function PressButton(button)
    if not button
        or not button.Parent
    then
        return false
    end

    if type(firesignal)=="function" then
        local ok=
            pcall(function()
                firesignal(
                    button.MouseButton1Click
                )
            end)

        if ok then
            return true
        end
    end

    if type(getconnections)=="function" then
        local ok,connections=
            pcall(
                getconnections,
                button.MouseButton1Click
            )

        if ok
            and type(connections)=="table"
        then
            local fired=false

            for _,connection
                in ipairs(connections)
            do
                pcall(function()
                    if
                        type(connection.Fire)
                        =="function"
                    then
                        connection:Fire()
                        fired=true
                    elseif
                        type(connection.Function)
                        =="function"
                    then
                        connection.Function()
                        fired=true
                    end
                end)
            end

            if fired then
                return true
            end
        end
    end

    return false
end

local function IsThemeNavButton(object)
    if not object:IsA("TextButton") then
        return false
    end

    local text=
        string.lower(
            Clean(
                GetButtonText(object)
            )
        )

    return
        text=="theming"
        or text=="theme"
        or text=="ธีม"
end

local function FindThemeNavButton(root)
    for _,object in ipairs(
        root:GetDescendants()
    ) do
        if IsThemeNavButton(object) then
            return object
        end
    end

    return nil
end

local function FindThemeImportBox(root)
    if IsThemeImportBox(root) then
        return root
    end

    for _,object in ipairs(
        root:GetDescendants()
    ) do
        if IsThemeImportBox(object) then
            return object
        end
    end

    return nil
end

local function IsThemeImportButton(object)
    if not object:IsA("TextButton") then
        return false
    end

    local text=
        string.lower(
            Clean(
                GetButtonText(object)
            )
        )

    return
        text=="import code"
        or text=="import"
        or text=="นำเข้าโค้ด"
        or text=="นำเข้า"
end

local function FindThemeImportButton(
    box,
    root
)
    local current=
        box.Parent

    for _=1,6 do
        if not current then
            break
        end

        for _,object in ipairs(
            current:GetDescendants()
        ) do
            if IsThemeImportButton(object) then
                return object
            end
        end

        if current==root then
            break
        end

        current=
            current.Parent
    end

    for _,object in ipairs(
        root:GetDescendants()
    ) do
        if IsThemeImportButton(object) then
            return object
        end
    end

    return nil
end

local function FindZigzagButton(root)
    for _,object in ipairs(
        root:GetDescendants()
    ) do
        if object:IsA("TextButton") then
            local text=
                string.upper(
                    Clean(
                        GetButtonText(object)
                    )
                )

            if text=="ZIGZAG" then
                return object
            end
        end
    end

    return nil
end

local function TryApplyZigzagTheme(root)
    if ZIGZAG_THEME_APPLIED
        or ZIGZAG_THEME_RUNNING
        or not root
        or not root.Parent
    then
        return
    end

    if HasZigzagWallpaper(root) then
        ZIGZAG_THEME_APPLIED=true

        print(
            "✅ ZIGZAG THEME ALREADY ACTIVE"
        )

        return
    end

    ZIGZAG_THEME_RUNNING=true

    task.spawn(function()
        local box=
            FindThemeImportBox(root)

        if not box then
            local themeButton=
                FindThemeNavButton(root)

            if themeButton then
                PressButton(
                    themeButton
                )

                task.wait(0.25)

                box=
                    FindThemeImportBox(root)
            end
        end

        if box
            and not ZIGZAG_THEME_IMPORT_ATTEMPTED
        then
            ZIGZAG_THEME_IMPORT_ATTEMPTED=true

            pcall(function()
                box.Text=
                    ZIGZAG_THEME_JSON
            end)

            if type(firesignal)=="function" then
                pcall(function()
                    firesignal(
                        box.FocusLost,
                        false
                    )
                end)
            end

            task.wait(0.1)

            local importButton=
                FindThemeImportButton(
                    box,
                    root
                )

            if importButton then
                local pressed=
                    PressButton(
                        importButton
                    )

                if pressed then
                    print(
                        "✅ ZIGZAG THEME IMPORT SENT"
                    )
                else
                    warn(
                        "[ZIGZAG] พบปุ่ม Import แต่กดอัตโนมัติไม่ได้"
                    )
                end
            else
                warn(
                    "[ZIGZAG] ยังไม่พบปุ่ม Import Theme"
                )
            end

            task.wait(0.55)
        end

        if not HasZigzagWallpaper(root) then
            local zigzagButton=
                FindZigzagButton(root)

            if zigzagButton then
                PressButton(
                    zigzagButton
                )
                task.wait(0.4)
            end
        end

        if HasZigzagWallpaper(root) then
            ZIGZAG_THEME_APPLIED=true

            print(
                "✅ ZIGZAG THEME APPLIED"
            )

            pcall(function()
                StarterGui:SetCore(
                    "SendNotification",
                    {
                        Title="💜 ZIGZAG Theme",
                        Text="ใช้ธีม ZIGZAG อัตโนมัติแล้ว",
                        Duration=4
                    }
                )
            end)
        else
            print(
                "ℹ️ ZIGZAG Theme waiting for BF Theme UI"
            )
        end

        ZIGZAG_THEME_RUNNING=false
    end)
end

--========================================================
-- TRANSLATE ONE LINE: ORIGINAL V2.4 ENGINE PRESERVED
--========================================================

local function TranslateLine(line, mapMode)
    if type(line)~="string" or line=="" then
        return line
    end

    local lead=line:match("^(%s*)") or ""
    local tail=line:match("(%s*)$") or ""
    local c=line:match("^%s*(.-)%s*$") or line

    if c=="" then
        return line
    end

    -- Map-specific dictionary applies ONLY inside Break and Steal UI.
    if mapMode=="BREAK_STEAL" then
        local mapped=BREAK_STEAL_LOWER[string.lower(c)]
        if mapped then return lead..mapped..tail end
        local plainNew=c:gsub("<[^>]+>","")
        mapped=BREAK_STEAL_LOWER[string.lower(plainNew)]
        if mapped then
            if plainNew~=c then
                return lead..c:gsub(EscapePattern(plainNew),mapped,1)..tail
            end
            return lead..mapped..tail
        end
        mapped=TranslateBreakStealDynamic(plainNew)
        if mapped then return lead..mapped..tail end

        -- Multi-select dropdown summaries, e.g. "Gold, Rainbow" or "Big, Huge".
        -- Convert only if EVERY piece is a known popup choice. Never rewrite
        -- pet names, prices or arbitrary comma-separated status text.
        if plainNew:find(",",1,true) then
            local options={}
            local optionCount=0
            local valid=true
            for piece in (plainNew..","):gmatch("(.-),") do
                local choice=piece:match("^%s*(.-)%s*$")
                local translated=BREAK_STEAL_POPUP_LOWER[string.lower(choice)]
                if not translated then
                    valid=false
                    break
                end
                optionCount+=1
                options[#options+1]=translated
            end
            if valid and optionCount>=2 then
                local summary=table.concat(options,", ")
                if plainNew~=c then
                    return lead..c:gsub(EscapePattern(plainNew),function()
                        return summary
                    end,1)..tail
                end
                return lead..summary..tail
            end
        end
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
    -- BF V1.8.6 HALLOWEEN DYNAMIC STATUS
    -- These two summary lines update while the game runs.
    -- Keep existing generic translation rules untouched.
    --====================================================
    local dimensionState,trainState,ghoulerState,bossState=
        plain:match(
            "^Dimension%s+([^|]+)%s*|%s*Train%s+([^|]+)%s*|%s*Ghouler%s+([^|]+)%s*|%s*Pumpkin Boss%s+([^|]+)$"
        )

    if dimensionState then
        local states={
            ["open"]="เปิด",
            ["closed"]="ปิด",
            ["waiting"]="กำลังรอ",
            ["active"]="ทำงาน",
            ["inactive"]="ไม่ทำงาน",
        }
        local function State(s)
            s=s:match("^%s*(.-)%s*$")
            return states[string.lower(s)] or s
        end
        return lead
            .."มิติ"..State(dimensionState)
            .." | รถไฟ"..State(trainState)
            .." | Ghouler "..State(ghoulerState)
            .." | บอสฟักทอง"..State(bossState)
            ..tail
    end

    local candyCorn,souls,tickets=
        plain:match(
            "^Candy Corn%s+([%d,%.]+)%s*|%s*Souls%s+([%d,%.]+)%s*|%s*Tickets%s+([%d,%.]+)$"
        )
    if candyCorn then
        return lead
            .."ข้าวโพดลูกกวาด "..candyCorn
            .." | วิญญาณ "..souls
            .." | ตั๋ว "..tickets
            ..tail
    end

    --====================================================
    -- DYNAMIC
    --====================================================

    -- BF v1.8.7: task-priority counter (e.g. 13 / 13 rows)
    local rowNow,rowTotal=plain:match("^(%d+)%s*/%s*(%d+)%s+rows$")
    if rowNow then
        return lead..rowNow.." / "..rowTotal.." รายการ"..tail
    end

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
        {"Auto Admin Treadmill","ออโต้ลู่วิ่งแอดมิน"},

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



        -- BF v2.0.1: UFO, Bat and auto-steal (decorated or mixed labels)
        {"Auto UFO Sightings","ออโต้กิจกรรม UFO"},
        {"UFO Sightings","กิจกรรมพบเห็น UFO"},
        {"Rare UFO Vault %+ Capsules","ห้องนิรภัย UFO หายาก + แคปซูล"},
        {"Rare UFO Vault","ห้องนิรภัย UFO หายาก"},
        {"UFO Capsules","แคปซูล UFO"},
        {"Auto Trade In %(Alien ชาร์ด%)","ออโต้แลก (ชาร์ดเอเลี่ยน)"},
        {"Auto Trade In %(Alien Shards%)","ออโต้แลก (ชาร์ดเอเลี่ยน)"},
        {"Auto Trade%-In %(Alien Shards%)","ออโต้แลก (ชาร์ดเอเลี่ยน)"},
        {"Waiting for tonight's UFO%.","กำลังรอ UFO ของคืนนี้"},
        {"Waiting for tonight’s UFO%.","กำลังรอ UFO ของคืนนี้"},
        {"Steal From Other Players","ขโมยจากผู้เล่นอื่น"},
        {"Steal from other players","ขโมยจากผู้เล่นอื่น"},
        {"Tween Speed","ความเร็ว Tween"},
        {"Tween speed","ความเร็ว Tween"},

        -- BF v1.8.7 TASK PRIORITY (decorated labels / breadcrumbs / lists)
        {"Task Priority","ลำดับความสำคัญของงาน"},
        {"Spirit Priority","ลำดับความสำคัญของวิญญาณ"},
        {"Capture The Egg","จับไข่"},
        {"Steal Filter Eggs","ขโมยไข่ตามตัวกรอง"},
        {"Steal Recipe Eggs","ขโมยไข่สำหรับสูตร"},
        {"Order %(top first%)","ลำดับงาน (บนสุดก่อน)"},
        {"Move Up","เลื่อนขึ้น"},
        {"Move Down","เลื่อนลง"},
        {"To Top","ย้ายขึ้นบนสุด"},
        {"Shooting Stars","ดาวตก"},
        {"Shooting Star","ดาวตก"},
        {"Butterfly Bloom","ผีเสื้อผลิบาน"},
        {"Halloween Farming","ฟาร์มฮาโลวีน"},
        {"Halloween Eggs","ไข่ฮาโลวีน"},
        {"Pumpkin Moon","พระจันทร์ฟักทอง"},
        {"Vengeful","วิญญาณพยาบาท"},
        {"Haunted","วิญญาณสิงสู่"},
        {"Lost","วิญญาณหลงทาง"},
        {"Monsters For","เวลาต่อมอนสเตอร์"},
        {"Fish For","เวลาตกปลา"},

        -- BF v1.8.6 HALLOWEEN (decorated/extended menu text)
        {"Auto Halloween Eggs","ออโต้เก็บไข่ฮาโลวีน"},
        {"Auto Kill Monsters","ออโต้กำจัดมอนสเตอร์"},
        {"Auto Pumpkin Moon","ออโต้กิจกรรมพระจันทร์ฟักทอง"},
        {"Halloween Before Eggs","ให้ฮาโลวีนสำคัญกว่าการเก็บไข่"},
        {"Auto Ride The Train","ออโต้ขึ้นรถไฟ"},
        {"Auto Trade Souls","ออโต้แลกวิญญาณ"},
        {"Auto Ghouler","ออโต้ Ghouler"},
        {"Auto Pumpkin Boss","ออโต้ต่อสู้บอสฟักทอง"},
        {"Auto Manor Key","ออโต้เก็บกุญแจคฤหาสน์"},
        {"Auto Ghost Dog Quest","ออโต้ทำเควสต์สุนัขผี"},
        {"Auto Buy Halloween Egg","ออโต้ซื้อไข่ฮาโลวีน"},
        {"Auto Fish","ออโต้ตกปลา"},
        {"Steal Rarities","ระดับความหายากของไข่ที่จะขโมย"},

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

local function Translate(text, mapMode)
    if type(text)~="string" or text=="" then
        return text
    end

    if not text:find("\n",1,true) then
        return TranslateLine(text, mapMode)
    end

    local output={}

    for line in (text.."\n"):gmatch("(.-)\n") do
        table.insert(
            output,
            TranslateLine(line, mapMode)
        )
    end

    return table.concat(output,"\n")
end

--========================================================
-- BF SIGNATURES
--========================================================

local SIGNATURES={
"auto farm eggs",
"break eggs (none = auto)",
"steal above $/s",
"merge predictor",
"titanic egg",
"only merge below $/s",
"steal other hatches",
"auto buy best plot skin",
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
"auto halloween eggs",
"auto ride the train",
"auto pumpkin boss",
"auto ghost dog quest",
 "auto buy halloween egg",
 "task priority",
 "spirit priority",
 "auto ufo sightings",
 "rare ufo vault",
 "steal from other players",
 "tween speed",
"break eggs (none = auto)",
"steal other hatches",
"merge predictor",
"luckiest eggs here",
"where you stand",
"auto place best",
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
-- MAP SCOPE: distinguish Break and Steal an Egg from legacy maps
-- No guessed game.PlaceId; identify the real BigFroot window by its labels.
--========================================================
local BREAK_STEAL_ANCHORS={
    ["break eggs (none = auto)"]=true,
    ["egg cycle (plasma method)"]=true,
    ["only merge below $/s (0 = no limit)"]=true,
    ["steal other hatches"]=true,
    ["luckiest eggs here"]=true,
    ["min egg luck (blank = any)"]=true,
    ["no three alike to merge yet."]=true,
    ["no three alike to merge yet"]=true,
    ["merge predictor"]=true,
    ["where you stand"]=true,
    ["ทุบไข่ (ไม่เลือก = อัตโนมัติ)"]=true,
    ["ไข่ที่จะทุบ (ไม่เลือก = อัตโนมัติ)"]=true,
    ["วนฟาร์มไข่ (วิธีพลาสมา)"]=true,
    ["ขโมยไข่จากจุดฟักของผู้อื่น"]=true,
    ["ไข่ที่มีโชคสูงสุดในเซิร์ฟนี้"]=true,
    ["คาดการณ์ผลการผสม"]=true,
    ["ตำแหน่งอันดับของคุณ"]=true,
}

local function IsBreakStealAnchor(raw)
    return type(raw)=="string"
        and BREAK_STEAL_ANCHORS[string.lower(Clean(raw))]==true
end

local function DetectBFMapMode(root)
    -- Strong, exclusive markers only. Generic labels such as 'Auto Sell',
    -- 'Farm', 'Diamonds' are deliberately not enough to switch the map.
    for _,o in ipairs(root:GetDescendants()) do
        if IsText(o) and IsBreakStealAnchor(GetRawText(o)) then
            return "BREAK_STEAL"
        end
    end
    return "LEGACY"
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

local MapModeByRoot=setmetatable({}, {__mode="k"})
local function ModeForTextObject(object)
    local node=object
    while node do
        local mode=MapModeByRoot[node]
        if mode then return mode end
        node=node.Parent
    end
    return "LEGACY"
end

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
        local mode=ModeForTextObject(object)
        -- Do not modify fields the user types into on the new map.
        if mode=="BREAK_STEAL" and object:IsA("TextBox") then
            return
        end
        local old=object.Text
        local new=Translate(old,mode)

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
                Translate(old, ModeForTextObject(object))

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
    MapModeByRoot[root]=DetectBFMapMode(root)

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

    --====================================================
    -- ZIGZAG AUTO THEME
    --====================================================

    task.delay(
        0.35,
        function()
            if root
                and root.Parent
            then
                TryApplyZigzagTheme(
                    root
                )
            end
        end
    )

    local descendantConnection=
        root.DescendantAdded
        :Connect(function(object)
            if IsThemeImportBox(object) then
                task.delay(
                    0.15,
                    function()
                        if root
                            and root.Parent
                        then
                            TryApplyZigzagTheme(
                                root
                            )
                        end
                    end
                )
            end

            if not IsText(object) then
                return
            end

            task.defer(function()
                if object
                    and object.Parent
                then
                    if MapModeByRoot[root]=="LEGACY"
                        and IsBreakStealAnchor(GetRawText(object)) then
                        MapModeByRoot[root]="BREAK_STEAL"
                        for _,existingObject in ipairs(root:GetDescendants()) do
                            if IsText(existingObject) then ApplyText(existingObject) end
                        end
                    end
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
                MapModeByRoot[root]=nil
                RootConnections[root]=nil
            end
        end)

    RootConnections[root]={
        descendantConnection,
        ancestryConnection
    }

    -- The new game's UI may initially expose only its title.
    -- Detect its map pack again once the menu pages have appeared.
    if MapModeByRoot[root]=="LEGACY" then
        for _,delaySeconds in ipairs({1.2, 4, 8}) do
            task.delay(delaySeconds,function()
                if not root or not root.Parent
                    or MapModeByRoot[root]~="LEGACY" then
                    return
                end
                if DetectBFMapMode(root)=="BREAK_STEAL" then
                    MapModeByRoot[root]="BREAK_STEAL"
                    for _,o in ipairs(root:GetDescendants()) do
                        if IsText(o) then ApplyText(o) end
                    end
                end
            end)
        end
    end

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
            if MapModeByRoot[root]=="LEGACY"
                and IsBreakStealAnchor(text) then
                MapModeByRoot[root]="BREAK_STEAL"
                for _,existingObject in ipairs(root:GetDescendants()) do
                    if IsText(existingObject) then ApplyText(existingObject) end
                end
            end
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
-- TRY THEME ON CLAIMED BF ROOT
--========================================================

local function TryThemeOnBF()
    if ZIGZAG_THEME_APPLIED then
        return
    end

    for root,_ in pairs(
        ClaimedRoots
    ) do
        if root
            and root.Parent
        then
            TryApplyZigzagTheme(
                root
            )
            return
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
    "✅ ZIGZAG BF Translator V2.6.5 TWO MAP POPUP THAI armed"
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
-- ตรวจเฉพาะช่วงเริ่ม ไม่มี Loop สแกนถาวร
--========================================================

task.spawn(function()
    task.wait(0.5)
    RefreshHUI()
    CheckCandidates()
    TryThemeOnBF()

    task.wait(1)
    RefreshHUI()
    CheckCandidates()
    TryThemeOnBF()

    task.wait(2)
    RefreshHUI()
    CheckCandidates()
    TryThemeOnBF()

    task.wait(3)
    RefreshHUI()
    CheckCandidates()
    TryThemeOnBF()

    task.wait(4)
    CheckCandidates()
    TryThemeOnBF()
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
                    Text="ZIGZAG V2.6.5 | Multi-Map + Popup Thai",
                    Duration=5
                }
            )
        end)
    end
)

--========================================================
-- CONSOLE
--========================================================

print("========================================")
print("✅ BIGFROOT THAI - ZIGZAG V2.6.5 TWO MAP + DROPDOWN THAI FULL MERGED")
print("✅ WORKING V2.5.2 BASE PRESERVED")
print("✅ V2.4 TRANSLATOR ENGINE PRESERVED")
print("✅ BFLoader INCLUDED")
print("✅ BF V1.7.9 ENCHANTED UPDATE")
print("✅ BF V1.8.2 RACE TRANSLATIONS")
print("✅ BF V1.8.6 HALLOWEEN TRANSLATIONS")
print("✅ BF V1.8.7 TASK PRIORITY / SPIRITS TRANSLATIONS")
print("✅ BF v2.0.1 UFO / BAT / TWEEN / STEAL TRANSLATIONS")
print("✅ PHANTOM EXPRESS / PUMPKIN BOSS / GHOST DOG / CANDY SHOP")
print("✅ HALLOWEEN DYNAMIC STATUS / CURRENCY")
print("✅ RACE RALLY / RACE REWARDS / SHOOTING STARS")
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
print("✅ ZIGZAG THEME EMBEDDED")
print("✅ ICON: 104570286698558")
print("✅ WALLPAPER: 104570286698558")
print("✅ AUTO THEME IMPORT / APPLY")
print("✅ AUTO ADMIN TREADMILL TRANSLATED")
print("✅ PLOT CENTER = กลางฐาน")
print("✅ PEN AREA = พื้นที่คอก")
print("✅ START AREA = พื้นที่เริ่มต้น")
print("✅ 1ST AREA = พื้นที่แรก (ไม่ต้องเคลม)")
print("✅ BREAK AND STEAL: POPUP DROPDOWN CHOICES TRANSLATED IN EVERY COPY")
print("✅ LEGACY STEAL AN EGG DICTIONARY UNCHANGED")
print("✅ NO RENDERSTEPPED TRANSLATION")
print("✅ NO PERMANENT FULL SCAN")
print("========================================")
