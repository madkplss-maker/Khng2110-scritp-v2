local Players=game:GetService("Players")
local TweenService=game:GetService("TweenService")
local UIS=game:GetService("UserInputService")
local player=Players.LocalPlayer

local gui=Instance.new("ScreenGui")
gui.Name="khng2110"
gui.ResetOnSpawn=false
gui.Parent=player:WaitForChild("PlayerGui")

local main=Instance.new("Frame")
main.Size=UDim2.new(0,650,0,420)
main.Position=UDim2.new(.5,-325,.5,-210)
main.BackgroundColor3=Color3.fromRGB(25,25,29)
main.BorderSizePixel=0
main.Parent=gui

Instance.new("UICorner",main).CornerRadius=UDim.new(0,10)

local top=Instance.new("Frame")
top.Size=UDim2.new(1,0,0,45)
top.BackgroundColor3=Color3.fromRGB(31,31,36)
top.BorderSizePixel=0
top.Parent=main

local title=Instance.new("TextLabel")
title.Size=UDim2.new(1,-100,1,0)
title.Position=UDim2.new(0,18,0,0)
title.BackgroundTransparency=1
title.Text="khng2110"
title.TextColor3=Color3.fromRGB(235,235,235)
title.TextSize=18
title.Font=Enum.Font.GothamBold
title.TextXAlignment=Enum.TextXAlignment.Left
title.Parent=top

local close=Instance.new("TextButton")
close.Size=UDim2.new(0,40,0,35)
close.Position=UDim2.new(1,-45,0,5)
close.BackgroundTransparency=1
close.Text="×"
close.TextColor3=Color3.fromRGB(220,220,220)
close.TextSize=26
close.Font=Enum.Font.GothamBold
close.Parent=top

local side=Instance.new("Frame")
side.Size=UDim2.new(0,175,1,-45)
side.Position=UDim2.new(0,0,0,45)
side.BackgroundColor3=Color3.fromRGB(21,21,25)
side.BorderSizePixel=0
side.Parent=main

local search=Instance.new("TextBox")
search.Size=UDim2.new(1,-20,0,38)
search.Position=UDim2.new(0,10,0,12)
search.BackgroundColor3=Color3.fromRGB(31,31,36)
search.BorderSizePixel=0
search.PlaceholderText="🔍  Search"
search.PlaceholderColor3=Color3.fromRGB(145,145,150)
search.TextColor3=Color3.fromRGB(230,230,230)
search.TextSize=13
search.Font=Enum.Font.Gotham
search.Parent=side

Instance.new("UICorner",search).CornerRadius=UDim.new(0,7)

local farm=Instance.new("TextButton")
farm.Size=UDim2.new(1,-20,0,40)
farm.Position=UDim2.new(0,10,0,65)
farm.BackgroundColor3=Color3.fromRGB(38,38,44)
farm.BorderSizePixel=0
farm.Text="  Farm"
farm.TextColor3=Color3.fromRGB(235,235,235)
farm.TextSize=14
farm.Font=Enum.Font.GothamMedium
farm.TextXAlignment=Enum.TextXAlignment.Left
farm.Parent=side

Instance.new("UICorner",farm).CornerRadius=UDim.new(0,7)

local content=Instance.new("Frame")
content.Size=UDim2.new(1,-175,1,-45)
content.Position=UDim2.new(0,175,0,45)
content.BackgroundColor3=Color3.fromRGB(27,27,31)
content.BorderSizePixel=0
content.Parent=main

local heading=Instance.new("TextLabel")
heading.Size=UDim2.new(1,-30,0,45)
heading.Position=UDim2.new(0,15,0,8)
heading.BackgroundTransparency=1
heading.Text="Farm"
heading.TextColor3=Color3.fromRGB(240,240,240)
heading.TextSize=17
heading.Font=Enum.Font.GothamBold
heading.TextXAlignment=Enum.TextXAlignment.Left
heading.Parent=content

local scroll=Instance.new("ScrollingFrame")
scroll.Size=UDim2.new(1,-20,1,-60)
scroll.Position=UDim2.new(0,10,0,55)
scroll.BackgroundTransparency=1
scroll.BorderSizePixel=0
scroll.ScrollBarThickness=4
scroll.Parent=content

local layout=Instance.new("UIListLayout")
layout.Padding=UDim.new(0,8)
layout.Parent=scroll

local padding=Instance.new("UIPadding")
padding.PaddingLeft=UDim.new(0,5)
padding.PaddingRight=UDim.new(0,5)
padding.PaddingBottom=UDim.new(0,10)
padding.Parent=scroll

local states={}

local function toggle(name,callback)
	local row=Instance.new("Frame")
	row.Size=UDim2.new(1,-5,0,52)
	row.BackgroundColor3=Color3.fromRGB(32,32,37)
	row.BorderSizePixel=0
	row.Parent=scroll
	Instance.new("UICorner",row).CornerRadius=UDim.new(0,7)

	local label=Instance.new("TextLabel")
	label.Size=UDim2.new(1,-75,1,0)
	label.Position=UDim2.new(0,15,0,0)
	label.BackgroundTransparency=1
	label.Text=name
	label.TextColor3=Color3.fromRGB(225,225,225)
	label.TextSize=14
	label.Font=Enum.Font.GothamMedium
	label.TextXAlignment=Enum.TextXAlignment.Left
	label.Parent=row

	local button=Instance.new("TextButton")
	button.Size=UDim2.new(0,45,0,26)
	button.Position=UDim2.new(1,-58,.5,-13)
	button.BackgroundColor3=Color3.fromRGB(55,55,61)
	button.BorderSizePixel=0
	button.Text=""
	button.Parent=row
	Instance.new("UICorner",button).CornerRadius=UDim.new(1,0)

	local circle=Instance.new("Frame")
	circle.Size=UDim2.new(0,20,0,20)
	circle.Position=UDim2.new(0,3,.5,-10)
	circle.BackgroundColor3=Color3.fromRGB(220,220,220)
	circle.BorderSizePixel=0
	circle.Parent=button
	Instance.new("UICorner",circle).CornerRadius=UDim.new(1,0)

	states[name]=false

	button.MouseButton1Click:Connect(function()
		states[name]=not states[name]
		local on=states[name]

		TweenService:Create(button,TweenInfo.new(.15),{
			BackgroundColor3=on and Color3.fromRGB(70,150,90) or Color3.fromRGB(55,55,61)
		}):Play()

		TweenService:Create(circle,TweenInfo.new(.15),{
			Position=on and UDim2.new(1,-23,.5,-10) or UDim2.new(0,3,.5,-10)
		}):Play()

		if callback then callback(on) end
	end)
end

toggle("Auto Farm Level",function(on) print("Auto Farm Level",on) end)
toggle("Gom Quái",function(on) print("Gom Quái",on) end)
toggle("Auto Attack",function(on) print("Auto Attack",on) end)
toggle("Auto Quest",function(on) print("Auto Quest",on) end)
toggle("Tìm Đảo Theo Level",function(on) print("Tìm Đảo Theo Level",on) end)

task.wait()
scroll.CanvasSize=UDim2.new(0,0,0,layout.AbsoluteContentSize.Y+15)

close.MouseButton1Click:Connect(function()
	main.Visible=false
end)

UIS.InputBegan:Connect(function(input,processed)
	if not processed and input.KeyCode==Enum.KeyCode.RightShift then
		main.Visible=not main.Visible
	end
end)

local dragging=false
local dragStart
local startPos

top.InputBegan:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
		dragging=true
		dragStart=input.Position
		startPos=main.Position
		input.Changed:Connect(function()
			if input.UserInputState==Enum.UserInputState.End then
				dragging=false
			end
		end)
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
		local delta=input.Position-dragStart
		main.Position=UDim2.new(
			startPos.X.Scale,startPos.X.Offset+delta.X,
			startPos.Y.Scale,startPos.Y.Offset+delta.Y
		)
	end
end)
