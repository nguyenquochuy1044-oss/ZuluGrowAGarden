if not game:IsLoaded()then game.Loaded:Wait()end if Library then Library:Unload()end if getgenv().LoadingScriptSlap then
return end getgenv().LoadingScriptSlap=true pcall(function()Fixed=loadstring(game:HttpGet(
[[https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/Fix.lua]]))()fireclickdetector=
fireclickdetector or Fixed.fireclickdetector fireproximityprompt=fireproximityprompt or Fixed.fireproximityprompt end)
local a=[[https://raw.githubusercontent.com/tanhoangviet/Obsidian-UI-Modded/main/]]local b=tostring(os.time())local 
function RepoAsset(c)return a..c..'?v='..b end local c=loadstring(game:HttpGet(RepoAsset('Library.lua')))()local d=
loadstring(game:HttpGet(RepoAsset('addons/ThemeManager.lua')))()local e=loadstring(game:HttpGet(RepoAsset(
'addons/SaveManager.lua')))()local f=c.Options local g=c.Toggles local h=c:CreateLoading({Title='Azusa Article Hub',Icon
=83462777349222,TotalSteps=5})h:SetMessage('Initializing...')h:SetDescription('Loading game data...')local j=game:
GetService('Players').LocalPlayer.PlayerGui:FindFirstChild('LoadingIndicator',true)if j and j.Visible then local k=os.
clock()+12 repeat task.wait(0.1)until not j.Parent or not j.Visible or os.clock()>k end h:SetCurrentStep(1)h:
SetDescription('Game data ready.')task.wait(0.25)_G.ConnectFun={}local function IsCallable(k)return typeof(k)==
'function'end local function ResolveExecutorName()local k,l=false if IsCallable(identifyexecutor)then k,l=pcall(
identifyexecutor)if k and l then return tostring(l)end end if IsCallable(getexecutorname)then k,l=pcall(getexecutorname)
if k and l then return tostring(l)end end return'Unknown'end local k={namecall_hook=IsCallable(hookmetamethod)and
IsCallable(getnamecallmethod),newcclosure=IsCallable(newcclosure),queue_on_teleport=IsCallable(queueonteleport)or
IsCallable(queue_on_teleport),fireclickdetector=IsCallable(fireclickdetector),firetouchinterest=IsCallable(
firetouchinterest),fireproximityprompt=IsCallable(fireproximityprompt),clipboard=IsCallable(setclipboard)or IsCallable(
toclipboard),custom_asset=IsCallable(getcustomasset)and IsCallable(writefile)and IsCallable(isfile)}local l={
namecall_hook='namecall hook',newcclosure='newcclosure',queue_on_teleport='queue on teleport',fireclickdetector=
'click detector fire',firetouchinterest='touch interest fire',fireproximityprompt='proximity prompt fire',clipboard=
'clipboard',custom_asset='custom asset images'}local m=0 for n,o in pairs({k.namecall_hook,k.queue_on_teleport,k.
fireclickdetector,k.firetouchinterest,k.fireproximityprompt,k.custom_asset})do if o then m+=1 end end ExecutorSupport=k
ExecutorSupport.Name=ResolveExecutorName()ExecutorSupport.Summary=string.format('%d/6 core APIs',m)ExecutorSupport.
Labels=l local n={}function CheckExecutorSupport(o,p,q)if ExecutorSupport and ExecutorSupport[o]==true then return true
end local r=p and g and g[p]if r and r.Value==true and IsCallable(r.SetValue)then r:SetValue(false)end if not q and not
n[o]then n[o]=true local s=(ExecutorSupport and ExecutorSupport.Labels and ExecutorSupport.Labels[o])or tostring(o)local
t='Executor does not support '..s..'. Disabled unsupported function.'if Notification then Notification(t,_G.TimeNotify
or 5)elseif c and c.Notify then c:Notify(t,_G.TimeNotify or 5)end end return false end local function 
InstallUnsupportedStub(o,p)if ExecutorSupport[o]==true then return end local q=(getgenv and getgenv())or _G if
IsCallable(q[p])then return end q[p]=function()CheckExecutorSupport(o)end end InstallUnsupportedStub('fireclickdetector'
,'fireclickdetector')InstallUnsupportedStub('firetouchinterest','firetouchinterest')InstallUnsupportedStub(
'fireproximityprompt','fireproximityprompt')if h then h:SetCurrentStep(2)h:SetDescription('Executor support: '..
ExecutorSupport.Name..' ('..ExecutorSupport.Summary..')')task.wait(0.25)end function Create(o,p,q)local r=Instance.new(o
)if p then for s,t in pairs(p)do pcall(function()r[s]=t end)end end if q then for s,t in ipairs(q)do if typeof(t)==
'Instance'then t.Parent=r end end end return r end function VectorTween(o)o=o or{}o.Part=o.Part or nil o.Place=o.Place
or nil o.Speed=o.Speed or 80 local p=game:GetService('Players')local q=p.LocalPlayer local r=q.Character or q.
CharacterAdded:Wait()local s=r:WaitForChild('HumanoidRootPart')local t=o.Part or s local u=t:FindFirstChild('FreezeBV')
if not u then u=Create('BodyVelocity',{Name='FreezeBV',P=10000,MaxForce=Vector3.new(1e9,1e9,1e9),Velocity=Vector3.zero,
Parent=t})end repeat task.wait()local w=o.Place-t.Position local y=w.Magnitude if y>0 then u.Velocity=w.Unit*o.Speed
else u.Velocity=Vector3.zero end until(t.Position-o.Place).Magnitude<5 u.Velocity=Vector3.zero u:Destroy()end function
CreateFreezeBV(o)o=o or{}o.Name=o.Name or'FreezeBV'o.Remove=o.Remove or false o.Velocity=o.Velocity or Vector3.zero o.
MaxForce=o.MaxForce or Vector3.new(1e9,1e9,1e9)local p=game.Players.LocalPlayer local q=p.Character if not q then return
nil end local r=q:FindFirstChild('HumanoidRootPart')if not r then return nil end local s=o.Name local t=typeof(o.
MaxForce)=='Vector3'and o.Velocity local u=typeof(o.Velocity)=='Vector3'and o.MaxForce local w=r:FindFirstChild(s)if o.
Remove then if w then w:Destroy()end return nil end if not w then return Create('BodyVelocity',{Name=s,Parent=r,P=10000,
MaxForce=u,Velocity=t})end return w end function FoundPlr(o,p)local q for r,s in pairs(game.Players:GetPlayers())do if
string.sub(s.Name,1,#o):lower()==o:lower()then q=s break end end if p and q then Notification('Found Player [ '..q.Name
..' ]',_G.TimeNotify)else if p then Notification("Can't find player",_G.TimeNotify)end end return q end function
InsideBox(o,p)local q=p.CFrame:PointToObjectSpace(o.Position)local r=p.Size/2 return math.abs(q.X)<=r.X+1.2 and math.
abs(q.Y)<=r.Y and math.abs(q.Z)<=r.Z+1.2 end local o=game:GetService('UserInputService')local p=game:GetService(
'TweenService')MobileOn=table.find({Enum.Platform.Android,Enum.Platform.IOS},o:GetPlatform())if game.CoreGui:
FindFirstChild('Cooldown Script')==nil then local q=Create('ScreenGui',{Name='Cooldown Script',IgnoreGuiInset=true,
Parent=game.CoreGui})local r=Create('ImageLabel',{Size=UDim2.new(0.215,0,0.059,0),Position=UDim2.new(1.01,0,0.305,-50),
BackgroundTransparency=1,AnchorPoint=Vector2.new(1,0),Image='rbxassetid://17253889398',ImageColor3=Color3.fromRGB(255,
255,255),Visible=false,ClipsDescendants=true,Parent=q},{Create('UIAspectRatioConstraint',{AspectRatio=6.438,AspectType=
Enum.AspectType.FitWithinMaxSize})})local s=Create('Frame',{Size=UDim2.new(1,0,0.98,0),Position=UDim2.new(0,0,0.5,0),
BackgroundTransparency=1,AnchorPoint=Vector2.new(0,0.5),ClipsDescendants=true,Parent=r},{Create('ImageLabel',{Size=UDim2
.new(0,161,1,0),Position=UDim2.new(0,0,0,0),BackgroundTransparency=1,Image='rbxassetid://17253892073',ImageColor3=Color3
.fromRGB(255,255,255),AutoLocalize=true,Interactable=true})})local t=Create('TextLabel',{Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,0,0),TextScaled=true,Text='',Rotation=15,TextColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,Font=Enum.Font.FredokaOne,ZIndex=2,Parent=r},{Create('UIPadding',{PaddingBottom=UDim.new(0.15,0
),PaddingLeft=UDim.new(0.05,0),PaddingRight=UDim.new(0.05,0),PaddingTop=UDim.new(0.15,0)}),Create('UIStroke',{Thickness=
0.84,StrokeSizingMode=Enum.StrokeSizingMode.FixedSize,Color=Color3.new(0,0,0)})})end function SpringText(q,r)local s=r
or 10 local t=0 local u=0 local w=169 local y=8 local z z=game:GetService('RunService').Heartbeat:Connect(function(A)t+=
(u-s)*w*A t*=math.exp(-y*A)s+=t*A q.Rotation=s if math.abs(s)<0.01 and math.abs(t)<0.01 then q.Rotation=0 z:Disconnect()
end end)end function Cooldown(q,r)if game.CoreGui:FindFirstChild('Cooldown Script')then if game.CoreGui[
'Cooldown Script'].ImageLabel.Visible then return end spawn(function()local s=p:Create(game.CoreGui['Cooldown Script'].
ImageLabel.Frame,TweenInfo.new(q,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Size=UDim2.new(0.001,0,0.98,0)})s:
Play()s.Completed:Wait()game.CoreGui['Cooldown Script'].ImageLabel.Visible=false game.CoreGui['Cooldown Script'].
ImageLabel.Frame.Size=UDim2.new(1,0,0.98,0)game.CoreGui['Cooldown Script'].ImageLabel.TextLabel.Rotation=15 p:Create(
game.CoreGui['Cooldown Script'].ImageLabel,TweenInfo.new(0.06,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{
Position=UDim2.new(1.01,0,0.305,-50)}):Play()end)spawn(function()game.CoreGui['Cooldown Script'].ImageLabel.TextLabel.
Text=r game.CoreGui['Cooldown Script'].ImageLabel.Visible=true p:Create(game.CoreGui['Cooldown Script'].ImageLabel,
TweenInfo.new(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(0.98,0,0.3,-50)}):Play()
SpringText(game.CoreGui['Cooldown Script'].ImageLabel.TextLabel,20)end)end end function CheckCooldown()return game.
CoreGui:FindFirstChild('Cooldown Script')and game.CoreGui['Cooldown Script']:FindFirstChild('ImageLabel')and game.
CoreGui['Cooldown Script'].ImageLabel.Visible end if game.CoreGui:FindFirstChild('Gui Button Script')==nil then local q=
Create('ScreenGui',{Name='Gui Button Script',Enabled=false,Parent=game.CoreGui})function CreatedButton(r)r.ButtonName=r.
ButtonName or'U'r.ButtonPosition=r.ButtonPosition or UDim2.new(0.175,0,0.175,0)r.ButtonSize=r.ButtonSize or UDim2.new(
0.65,0,0.65,0)r.ButtonImage=r.ButtonImage or'rbxassetid://82648533253503'r.Callback=r.Callback or function()end local s=
Create('Frame',{Name=r.ButtonName..'AbilityFrame',Size=UDim2.new(0.3,0,0.5,0),Position=UDim2.new(0.65,0,0.5,0),
BackgroundTransparency=1,ZIndex=1,Parent=q})local t=Create('ImageButton',{Name='Button'..r.ButtonName,AnchorPoint=
Vector2.new(0.5,0.5),Size=UDim2.new(0.45,0,0.45,0),Position=UDim2.new(0.7,-25,-0.25,-25),BackgroundTransparency=1,ZIndex
=1,Draggable=true,Parent=s},{Create('UIAspectRatioConstraint',{AspectType=Enum.AspectType.FitWithinMaxSize,AspectRatio=1
,DominantAxis='Width'})})local u=Create('ImageLabel',{Name=r.ButtonName..'Button',Position=UDim2.new(0.175,0,0.175,0),
Size=UDim2.new(0.65,0,0.65,0),BackgroundTransparency=1,Image=r.ButtonImage,ImageColor3=Color3.fromRGB(255,255,255),
ZIndex=1,Parent=t})local w=t.Size local function PlayHoverSound(y)local z=Instance.new('Sound')z.SoundId='rbxassetid://'
..y z.Volume=2 z.PlaybackSpeed=1 z.Parent=workspace z:Play()game:GetService('Debris'):AddItem(z,2)end t.MouseEnter:
Connect(function()PlayHoverSound(10066942189)p:Create(u,TweenInfo.new(0.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out
),{ImageColor3=Color3.fromRGB(115,115,115)}):Play()end)t.MouseLeave:Connect(function()p:Create(u,TweenInfo.new(0.2,Enum.
EasingStyle.Quad,Enum.EasingDirection.Out),{ImageColor3=Color3.fromRGB(255,255,255)}):Play()end)t.MouseButton1Click:
Connect(function()PlayHoverSound(10066936758)u.ImageColor3=Color3.fromRGB(255,255,255)if CheckCooldown()then return end
local y,z=pcall(r.Callback)if not y then print(z)end end)end end if MobileOn and CreatedButton then CreatedButton({
Callback=function()if not AnimationRoll then AnimationRoll=Instance.new('Animation')AnimationRoll.AnimationId=
'rbxassetid://16299510063'end local q=game:GetService('Players').LocalPlayer if q.Character and q.Character:
FindFirstChild('Humanoid')and q.Character.Humanoid.Health>0 and not q.Character:FindFirstChild('HumanoidRootPart'):
FindFirstChild('FreezeBV')then Cooldown(2,'Roll Script')local r=q.Character:WaitForChild('Humanoid')local s=q.Character:
WaitForChild('HumanoidRootPart')r.Animator:LoadAnimation(AnimationRoll):Play()local t=CreateFreezeBV({Velocity=s.CFrame.
LookVector*100,MaxForce=Vector3.new(1e6,0,1e6)})game:GetService('Debris'):AddItem(t,0.17)for u,w in pairs(q.Character:
GetDescendants())do if w:IsA('BasePart')then w.Massless=true end end task.delay(0.6,function()if q.Character then for u,
w in pairs(q.Character:GetChildren())do if w:IsA('BasePart')then w.Massless=false end end end end)end end})end if not
game.CoreGui:FindFirstChild('Keybind Script')then local q=Create('ScreenGui',{Name='Keybind Script',Enabled=false,
IgnoreGuiInset=true,Parent=game.CoreGui})function CreatedKeybind(r)r.Name=r.Name or'U'r.Key=r.Key or Enum.KeyCode.U r.
Text=r.Text or'Keybind'r.Callback=r.Callback or function()end local s=Create('Frame',{Size=UDim2.new(0.198,0,0.094,0),
Position=UDim2.new(0.98,0,0.6,-50),BackgroundTransparency=1,AnchorPoint=Vector2.new(1,0),Visible=true,Parent=q},{Create(
'UIAspectRatioConstraint',{AspectRatio=6.07,AspectType=Enum.AspectType.FitWithinMaxSize}),Create('UIListLayout',{Padding
=Vector2.new(0.25,0),SortOrder='LayoutOrder',VerticalAlignment='Bottom'})})local t=Create('Frame',{Size=UDim2.new(1,0,1,
0),Position=UDim2.new(0,0,0,0),BackgroundTransparency=1,AnchorPoint=Vector2.new(1,0),Visible=true,Parent=s})local u=
Create('Folder',{Parent=t},{Create('TextLabel',{Size=UDim2.new(0.167,0,0.759,0),Position=UDim2.new(0.051,0,0.001,0),
BackgroundTransparency=1,TextColor3=Color3.new(255,255,255),Font='FredokaOne',Text=r.Name,TextScaled=true,ZIndex=2,
Visible=true},{Create('UIStroke',{Thickness=1.296})})})local w=Create('ImageLabel',{Size=UDim2.new(0.17,0,1,0),Position=
UDim2.new(0.049,0,-5.4E-2,0),BackgroundTransparency=1,Image='rbxassetid://132237752209803',ImageColor3=Color3.fromRGB(47
,47,47),Parent=t},{Create('ImageLabel',{Size=UDim2.new(0.9,0,0.9,0),Position=UDim2.new(0.5,0,0,0),BackgroundTransparency
=1,AnchorPoint=Vector2.new(0.5,0),Image='rbxassetid://94740529495833',ImageColor3=Color3.fromRGB(84,84,84)})})local y=
Create('TextLabel',{Size=UDim2.new(0.703,0,0.619,0),Position=UDim2.new(0.288,0,0.055,0),BackgroundTransparency=1,
TextColor3=Color3.new(255,255,255),Font='FredokaOne',Text=r.Text,TextScaled=true,Visible=true,Parent=t},{Create(
'UIStroke',{Thickness=1.232})})local z=u:FindFirstChildOfClass('TextLabel')local A=w:FindFirstChildOfClass('ImageLabel')
local B=TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)table.insert(_G.ConnectFun,o.InputEnded:
Connect(function(C,D)if C.KeyCode==r.Key then p:Create(z,B,{Position=UDim2.new(0.051,0,0.001,0)}):Play()p:Create(A,B,{
Position=UDim2.new(0.5,0,0,0),ImageColor3=Color3.fromRGB(84,84,84)}):Play()end end))table.insert(_G.ConnectFun,o.
InputBegan:Connect(function(C,D)if D then return end if CheckCooldown()and(game.CoreGui:FindFirstChild('Keybind Script')
and game.CoreGui:FindFirstChild('Keybind Script').Enabled)or(game.CoreGui:FindFirstChild('Gui Roll Script')and not game.
CoreGui:FindFirstChild('Gui Roll Script').Enabled)then return end if C.KeyCode==r.Key then p:Create(z,B,{Position=UDim2.
new(0.05,0,0.001,3)}):Play()p:Create(A,B,{Position=UDim2.new(0.5,0,0,4),ImageColor3=Color3.fromRGB(122,122,122)}):Play()
pcall(r.Callback)end end))end end if not MobileOn and CreatedKeybind then CreatedKeybind({Text='Roll Script',Callback=
function()local q=game:GetService('Players')local r=Instance.new('Animation')r.AnimationId='rbxassetid://16299510063'
local s=q.LocalPlayer if s.Character and s.Character:FindFirstChild('Humanoid')and s.Character.Humanoid.Health>0 and not
s.Character:FindFirstChild('HumanoidRootPart'):FindFirstChild('FreezeBV')then Cooldown(2,'Roll Script')local t=s.
Character:WaitForChild('Humanoid')local u=s.Character:WaitForChild('HumanoidRootPart')t.Animator:LoadAnimation(r):Play()
local w=CreateFreezeBV({Velocity=u.CFrame.LookVector*100,MaxForce=Vector3.new(1e6,0,1e6)})game:GetService('Debris'):
AddItem(w,0.17)for y,z in pairs(s.Character:GetDescendants())do if z:IsA('BasePart')then z.Massless=true end end task.
delay(0.6,function()if s.Character then for y,z in pairs(s.Character:GetChildren())do if z:IsA('BasePart')then z.
Massless=false end end end end)end end})end function ShowButtonU(q)if MobileOn then if game.CoreGui:FindFirstChild(
'Gui Button Script')then game.CoreGui:FindFirstChild('Gui Button Script').Enabled=q end else if game.CoreGui:
FindFirstChild('Keybind Script')then game.CoreGui:FindFirstChild('Keybind Script').Enabled=q end end end if not game.
CoreGui:FindFirstChild('Gui Track')then local q=Create('ScreenGui',{Name='Gui Track',Enabled=false,Parent=game.CoreGui})
local r=Create('Frame',{Size=UDim2.new(0.2,0,0.1,0),Position=UDim2.new(0.02,0,0.87,0),BackgroundColor3=Color3.new(1,1,1)
,BorderColor3=Color3.new(0,0,0),BorderSizePixel=1,Active=true,BackgroundTransparency=0,Parent=q},{Create('UIStroke',{
Color=Color3.new(0,0,0),Thickness=2.5}),Create('UICorner',{CornerRadius=UDim.new(0,8)})})local s=Create('Frame',{Size=
UDim2.new(1,0,1,0),Position=UDim2.new(0,0,0,0),BackgroundColor3=Color3.fromRGB(255,0,0),BorderColor3=Color3.new(0,0,0),
BorderSizePixel=1,Active=true,BackgroundTransparency=0.3,Parent=r},{Create('UICorner',{CornerRadius=UDim.new(0,8)})})
local t=Create('Frame',{Name='Frame1',Size=UDim2.new(1,0,1,0),Position=UDim2.new(0,0,0,0),BackgroundTransparency=1,
ClipsDescendants=true,Parent=s})local u=Create('Frame',{Name='FrameTo',Size=UDim2.new(1,0,1,0),Position=UDim2.new(0,0,0,
0),BackgroundColor3=Color3.fromRGB(0,255,0),BackgroundTransparency=0.15,Parent=t},{Create('UICorner',{CornerRadius=UDim.
new(0,8)})})local w=Create('TextLabel',{Size=UDim2.new(1,0,1,0),Position=UDim2.new(0,0,0,0),BackgroundColor3=Color3.new(
0,0,0),BorderColor3=Color3.new(0,0,0),BorderSizePixel=1,Text='',TextSize=16,ZIndex=5,BackgroundTransparency=1,TextColor3
=Color3.new(0,0,0),Font=Enum.Font.Code,TextWrapped=true,Parent=r},{Create('UITextSizeConstraint',{MaxTextSize=35})})end
function GuiTrackUpdate(q,r)r=r or{}r.Text=r.Text or'Bruh'r.Size=r.Size or 1 if r.Size>1 then r.Size=1 end local s=q or
false if not s then game.CoreGui['Gui Track'].Frame:FindFirstChild('TextLabel').Text='Nah'game.CoreGui['Gui Track'].
Frame.Frame.Frame1.Size=UDim2.new(0,0,1,0)end if game.CoreGui:FindFirstChild('Gui Track')then game.CoreGui['Gui Track'].
Enabled=s if game.CoreGui['Gui Track'].Enabled then game.CoreGui['Gui Track'].Frame:FindFirstChild('TextLabel').Text=r.
Text local t=game:GetService('TweenService'):Create(game.CoreGui['Gui Track'].Frame.Frame.Frame1,TweenInfo.new(1.5),{
Size=UDim2.new(r.Size,0,1,0)})t:Play()end end end pcall(function()if require then ControlMove=require(game:GetService(
'Players').LocalPlayer.PlayerScripts:WaitForChild('PlayerModule'):WaitForChild('ControlModule'))end end)ctrl={f=0,b=0,l=
0,r=0}ctrlCould={f=0,b=0,l=0,r=0}table.insert(_G.ConnectFun,o.InputBegan:Connect(function(q,r)if r then return end if
not _G.SetSpeedFlyCloud then _G.SetSpeedFlyCloud=0 elseif not _G.SetSpeedFly then _G.SetSpeedFly=0 end if q.KeyCode==
Enum.KeyCode.W then ctrl.f=_G.SetSpeedFly ctrlCould.f=_G.SetSpeedFlyCloud elseif q.KeyCode==Enum.KeyCode.S then ctrl.b=-
_G.SetSpeedFly ctrlCould.b=-_G.SetSpeedFlyCloud elseif q.KeyCode==Enum.KeyCode.A then ctrl.l=-_G.SetSpeedFly ctrlCould.l
=-_G.SetSpeedFlyCloud elseif q.KeyCode==Enum.KeyCode.D then ctrl.r=_G.SetSpeedFly ctrlCould.r=_G.SetSpeedFlyCloud end
end))table.insert(_G.ConnectFun,o.InputEnded:Connect(function(q,r)if r then return end if q.KeyCode==Enum.KeyCode.W then
ctrl.f=0 ctrlCould.f=0 elseif q.KeyCode==Enum.KeyCode.S then ctrl.b=0 ctrlCould.b=0 elseif q.KeyCode==Enum.KeyCode.A
then ctrl.l=0 ctrlCould.l=0 elseif q.KeyCode==Enum.KeyCode.D then ctrl.r=0 ctrlCould.r=0 end end))_G.SetSpeedFly=50
function Fly(q)_G.StartFly=q if _G.StartFly==false then if game.Players.LocalPlayer.Character and game.Players.
LocalPlayer.Character:FindFirstChildOfClass('Humanoid')and game.Players.LocalPlayer.Character.Humanoid.RootPart and game
.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild('VelocityHandler')and game.Players.LocalPlayer.Character.
HumanoidRootPart:FindFirstChild('GyroHandler')then game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler:
Destroy()game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler:Destroy()game.Players.LocalPlayer.Character.
Humanoid.PlatformStand=false end end while _G.StartFly do pcall(function()if game.Players.LocalPlayer.Character and game
.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')and game.Players.LocalPlayer.Character.Humanoid.RootPart
and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild('VelocityHandler')and game.Players.LocalPlayer.
Character.HumanoidRootPart:FindFirstChild('GyroHandler')then game.Players.LocalPlayer.Character.HumanoidRootPart.
VelocityHandler.MaxForce=Vector3.new(9e9,9e9,9e9)game.Players.LocalPlayer.Character.HumanoidRootPart.GyroHandler.
MaxTorque=Vector3.new(9e9,9e9,9e9)game.Players.LocalPlayer.Character.Humanoid.PlatformStand=true game.Players.
LocalPlayer.Character.HumanoidRootPart.GyroHandler.CFrame=CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart
.Position,game.Players.LocalPlayer.Character.HumanoidRootPart.Position+game.Workspace.CurrentCamera.CFrame.LookVector)
game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity=Vector3.new()local r=ControlMove and
ControlMove:GetMoveVector()local s=game.Players.LocalPlayer.Character.HumanoidRootPart.VelocityHandler.Velocity if
MobileOn then if r and r.X>0 then s=s+game.Workspace.CurrentCamera.CFrame.RightVector*(r.X*_G.SetSpeedFly)end if r and r
.X<0 then s=s+game.Workspace.CurrentCamera.CFrame.RightVector*(r.X*_G.SetSpeedFly)end if r and r.Z>0 then s=s-game.
Workspace.CurrentCamera.CFrame.LookVector*(r.Z*_G.SetSpeedFly)end if r and r.Z<0 then s=s-game.Workspace.CurrentCamera.
CFrame.LookVector*(r.Z*_G.SetSpeedFly)end else s=s+(game.Workspace.CurrentCamera.CFrame.LookVector*(ctrl.f+ctrl.b))+(
game.Workspace.CurrentCamera.CFrame.RightVector*(ctrl.r+ctrl.l))end game.Players.LocalPlayer.Character.HumanoidRootPart.
VelocityHandler.Velocity=s elseif game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:
FindFirstChildOfClass('Humanoid')and game.Players.LocalPlayer.Character.Humanoid.RootPart and(game.Players.LocalPlayer.
Character.HumanoidRootPart:FindFirstChild('VelocityHandler')==nil or game.Players.LocalPlayer.Character.HumanoidRootPart
:FindFirstChild('GyroHandler')==nil)then if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(
'VelocityHandler')==nil then local r=Create('BodyVelocity',{Name='VelocityHandler',Parent=game.Players.LocalPlayer.
Character.HumanoidRootPart,MaxForce=Vector3.new(0,0,0),Velocity=Vector3.new(0,0,0)})end if game.Players.LocalPlayer.
Character.HumanoidRootPart:FindFirstChild('GyroHandler')==nil then local r=Create('BodyGyro',{Name='GyroHandler',Parent=
game.Players.LocalPlayer.Character.HumanoidRootPart,MaxTorque=Vector3.new(0,0,0),P=1000,D=50})end end end)task.wait()end
end _G.ConnectAnimPlay={}function Animation(q)_G.LoadingEmote=q if not _G.LoadingEmote then if _G.ConnectAnimPlay then
for r,s in pairs(_G.ConnectAnimPlay)do s:Disconnect()end _G.ConnectAnimPlay={}end end if _G.ConnectAnimPlay then
function CheckAnim()local r={}local s=game:GetService('ReplicatedStorage'):FindFirstChild('AnimationPack',true)if game.
Players.LocalPlayer.Character:FindFirstChild('Humanoid')and s then for t,u in pairs(s:GetChildren())do if u:IsA(
'Animation')then r[u.Name:lower()]=game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(u)end end end return(r or
nil)end function AutoStopAnim(r)local s=game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')local t=game
.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')if not t then return end local u u=game:GetService(
'RunService').RenderStepped:Connect(function()if s.MoveDirection.Magnitude>0 or t.AssemblyLinearVelocity.Magnitude>5 or
s.Health<=0 and s.Sit==false then for w,y in pairs(r)do if y.IsPlaying then y:Stop()end end game:GetService(
'ReplicatedStorage').AnimationSound:FireServer()u:Disconnect()end end)return u end GuiEmote=game:GetService('Players').
LocalPlayer.PlayerGui:FindFirstChild('EmoteWheel',true)if GuiEmote and GuiEmote:FindFirstChild('EmoteWheel')then for r,s
in pairs(GuiEmote.EmoteWheel:GetChildren())do if s:IsA('ImageButton')then table.insert(_G.ConnectAnimPlay,s.
MouseButton1Click:Connect(function()local t=game.Players.LocalPlayer.Character if _G.LoadingEmote==true and t and(t:
FindFirstChildOfClass('Humanoid')and not t:FindFirstChildOfClass('Humanoid').Sit)and not(t:FindFirstChildOfClass('Tool')
and t:FindFirstChildOfClass('Tool'):FindFirstChild('Glove'))then GuiEmote.EmoteWheel.Visible=false pcall(function()game:
GetService('ReplicatedStorage').AnimationSound:FireServer()for u,w in pairs(Anims)do if w.IsPlaying then w:Stop()end end
end)spawn(function()pcall(function()repeat task.wait()until(t:FindFirstChild('Ragdolled')and t:WaitForChild('Ragdolled')
.Value)or(t:FindFirstChildOfClass('Tool')and t:FindFirstChildOfClass('Tool'):FindFirstChild('Glove'))game:GetService(
'ReplicatedStorage').AnimationSound:FireServer()for u,w in pairs(Anims)do if w.IsPlaying then w:Stop()end end end)end)
task.wait()Anims=CheckAnim()if s:FindFirstChildOfClass('TextLabel').Text:lower()=='laugh'then game:GetService(
'ReplicatedStorage').AnimationSound:FireServer('_emoteLaugh')end local u=t and t:FindFirstChildOfClass('Humanoid')if u
then for w,y in ipairs(u:GetPlayingAnimationTracks())do y:Stop()end end Anims[s:FindFirstChildOfClass('TextLabel').Text:
lower()]:Play()AutoStopAnim(Anims)end end))end end local r={}for s,t in pairs(CheckAnim())do table.insert(r,s)end table.
sort(r)for s,t in ipairs(GuiEmote.EmoteWheel:GetChildren())do if t:IsA('ImageButton')then local u=tonumber(t.Name:match(
'%d+'))local w=t:FindFirstChildOfClass('TextLabel')if u and w and r[u]then w.Text=r[u]:gsub('^%l',string.upper)end end
end end end end _G.TimeNotify=5 if game.PlaceId==6403373529 or game.PlaceId==136802962479827 or game.PlaceId==
127174121130060 or game.PlaceId==11520107397 or game.PlaceId==124596094333302 or game.PlaceId==2380077519 then if game.
ReplicatedStorage:FindFirstChild('AdminGUI')then game.ReplicatedStorage.AdminGUI:Destroy()end if game.ReplicatedStorage:
FindFirstChild('Ban')then game.ReplicatedStorage.Ban:Destroy()end if game.StarterPlayer.StarterPlayerScripts:
FindFirstChild('AntiMobileExploits',true)then game.StarterPlayer.StarterPlayerScripts:FindFirstChild(
'AntiMobileExploits',true):Destroy()end if game.ReplicatedStorage:FindFirstChild('GRAB')then game.ReplicatedStorage.GRAB
:Destroy()end if game.ReplicatedStorage:FindFirstChild('SpecialGloveAccess')then game.ReplicatedStorage.
SpecialGloveAccess:Destroy()end if game.ReplicatedStorage:FindFirstChild('WalkSpeedChanged')then game.ReplicatedStorage.
WalkSpeedChanged:Destroy()end BlackList={'stevebody','rock','Counterd','Mirage','Reversed'}AnimationSlapHit={[
'134954960138305']=true,['98790126694213']=true,['113677335266712']=true,['16102850016']=true,['86093582820019']=true,[
'97212410160106']=true,['92696348598076']=true,['12666659393201']=true,['126666659393201']=true,['82224515307861']=true,
['13526158494']=true,['13526154547']=true,['16102722988']=true,['135557283152371']=true,['90524879630106']=true,[
'16294032647']=true,['109511274923523']=true,['133068451086106']=true,['116559255414365']=true}_G.GetPotion={['Idiot']={
'Cake Mix'},['Grug']={'Mushroom'},['Nightmare']={'Dark Root','Dark Root','Dark Root'},['Confusion']={'Red Crystal',
'Blue Crystal','Glowing Mushroom'},['Power']={'Dire Flower','Red Crystal','Wild Vine'},['Paralyzing']={'Plane Flower',
'Plane Flower'},['Haste']={'Autumn Sprout','Jade Stone'},['Invisibility']={'Hazel Lily','Hazel Lily','Blue Crystal'},[
'Explosion']={'Red Crystal','Fire Flower','Fire Flower'},['Invincible']={'Elder Wood','Mushroom','Mushroom'},['Toxic']={
'Dark Root','Dark Root','Blood Rose','Red Crystal'},['Freeze']={'Winter Rose','Winter Rose','Wild Vine','Blue Crystal',
'Glowing Mushroom'},['Feather']={'Mushroom','Hazel Lily'},['Speed']={'Mushroom','Mushroom','Plane Flower','Hazel Lily',
'Blue Crystal'},['Lethal']={'Blood Rose','Blood Rose','Blood Rose','Blood Rose','Blood Rose','Blood Rose','Blood Rose',
'Blood Rose','Blood Rose','Blood Rose','Dark Root','Dark Root','Dark Root','Dark Root','Dark Root','Dark Root',
'Dark Root','Dark Root','Dark Root','Dark Root'},['Slow']={'Mushroom','Mushroom','Blue Crystal','Blue Crystal',
'Jade Stone','Plane Flower'},['Antitoxin']={'Blue Crystal','Glowing Mushroom','Plane Flower','Plane Flower','Elder Wood'
},['Corrupted Vine']={'Wild Vine','Wild Vine','Wild Vine','Blood Rose','Dark Root','Elder Wood','Jade Stone'},[
'Corrupted Field']={'Hazel Lily','Plane Flower','Plane Flower'},['Lost']={'Blue Crystal','Elder Wood','Elder Wood',
'Elder Wood','Red Crystal'}}pcall(function()if require then local q=require(game:GetService('ReplicatedStorage').BACKEND
.Shared.Flags.FlagService)local r=q.IsEnabled q.IsEnabled=function(s,...)if s=='IgnoreSafety'then return true end return
r(s,...)end end end)spawn(function()repeat task.wait()local q,r=pcall(function()return require(game:GetService(
'ReplicatedStorage').Common.Gloves)end)if q then _G.Gloves=r end until _G.Gloves end)local q=game:GetService(
'ReplicatedStorage').PlayerData:FindFirstChild(game.Players.LocalPlayer.Name)local r=q and q:FindFirstChild(
'GloveMasteryProgress')function UpdateMasteryProgress()local s,t=pcall(function()return game:GetService('HttpService'):
JSONDecode(r.Value)end)if s and t then _G.MasteryGlove=t end end UpdateMasteryProgress()r:GetPropertyChangedSignal(
'Value'):Connect(function()UpdateMasteryProgress()end)if not game.CoreGui:FindFirstChild('MasteryGui')then Create(
'ScreenGui',{Name='MasteryGui',ZIndexBehavior=Enum.ZIndexBehavior.Sibling,Parent=game.CoreGui},{Create('Frame',{Name=
'Main',Active=true,BorderSizePixel=0,Visible=false,BackgroundColor3=Color3.fromRGB(113,113,113),Size=UDim2.new(0.27766,0
,0.36659,0),Position=UDim2.new(0.65,0,0,0),BackgroundTransparency=0.3},{Create('UICorner',{CornerRadius=UDim.new(0,5)}),
Create('UIStroke',{Transparency=0.3,Thickness=1.5}),Create('UIDragDetector',{}),Create('UIAspectRatioConstraint',{
AspectRatio=1.77612}),Create('Frame',{Name='InfoMastery',BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(166,166,166),
Size=UDim2.new(0,0,1,0),Position=UDim2.new(0,0,0,0),Visible=false,BackgroundTransparency=0.2},{Create('UICorner',{
CornerRadius=UDim.new(0,5)}),Create('UIStroke',{Transparency=0.3,Thickness=1.5}),Create('TextButton',{Name='Close',
TextWrapped=true,BorderSizePixel=0,TextScaled=true,BackgroundColor3=Color3.fromRGB(204,204,204),FontFace=Font.new(
'rbxasset://fonts/families/FredokaOne.json',Enum.FontWeight.Regular,Enum.FontStyle.Normal),Size=UDim2.new(0.85,0,0.13433
,0),Position=UDim2.new(0,6,0,4),TextColor3=Color3.fromRGB(0,0,0),Text='Close'},{Create('UICorner',{CornerRadius=UDim.
new(0,5)}),Create('UIStroke',{Transparency=0.3,ApplyStrokeMode=Enum.ApplyStrokeMode.Border})}),Create('TextLabel',{Name=
'Info',TextWrapped=true,BorderSizePixel=0,TextScaled=true,BackgroundColor3=Color3.fromRGB(187,187,187),FontFace=Font.
new('rbxasset://fonts/families/FredokaOne.json',Enum.FontWeight.Regular,Enum.FontStyle.Normal),BackgroundTransparency=
0.2,Size=UDim2.new(0.85,0,0.76119,0),Position=UDim2.new(0,6,0,26),TextColor3=Color3.fromRGB(0,0,0),Text=
'Select a task info'},{Create('UICorner',{CornerRadius=UDim.new(0,5)}),Create('UIStroke',{Transparency=0.3,
ApplyStrokeMode=Enum.ApplyStrokeMode.Border})})}),Create('Frame',{Name='masteryGlove',BorderSizePixel=0,BackgroundColor3
=Color3.fromRGB(139,139,139),Size=UDim2.new(0.94958,0,0.9403,0),Position=UDim2.new(0.02521,0,0.02985,0),
BackgroundTransparency=0.2},{Create('UICorner',{CornerRadius=UDim.new(0,5)}),Create('ScrollingFrame',{Name='Progress',
Active=true,BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255,255),ScrollBarImageTransparency=1,
AutomaticCanvasSize=Enum.AutomaticSize.Y,Size=UDim2.new(0.9292,0,0.88889,0),Position=UDim2.new(0.0354,0,0.04762,0),
ScrollBarThickness=0,BackgroundTransparency=1},{Create('UIListLayout',{HorizontalAlignment=Enum.HorizontalAlignment.
Center,Padding=UDim.new(0,2)}),Create('Folder',{Name='TaskHere'},{Create('Frame',{Name='Task [???]',BorderSizePixel=0,
Visible=false,BackgroundColor3=Color3.fromRGB(255,255,255),Size=UDim2.new(1,0,0.32143,0),BackgroundTransparency=0.2},{
Create('UICorner',{CornerRadius=UDim.new(0,5)}),Create('ImageButton',{Name='Info [???]',BorderSizePixel=0,
BackgroundTransparency=1,BackgroundColor3=Color3.fromRGB(255,255,255),Image='rbxassetid://108984542249016',Size=UDim2.
new(0.09524,0,0.77778,0),ImageColor3=Color3.fromRGB(0,0,0),Position=UDim2.new(0,4,0,4)}),Create('TextLabel',{Name=
'ProgressTask',TextWrapped=true,BorderSizePixel=0,TextSize=10,TextStrokeColor3=Color3.fromRGB(255,255,255),TextScaled=
true,BackgroundColor3=Color3.fromRGB(255,255,255),FontFace=Font.new('rbxasset://fonts/families/FredokaOne.json',Enum.
FontWeight.Regular,Enum.FontStyle.Normal),TextColor3=Color3.fromRGB(0,0,0),BackgroundTransparency=1,Size=UDim2.new(
0.69524,0,0.77778,0),Position=UDim2.new(0.02857,24,0.11111,0),Text='Soon'}),Create('ImageLabel',{Name='TaskUnComplete',
BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255,255),Image='rbxassetid://100988669582287',Size=UDim2.new(
0.10476,0,0.61111,0),BackgroundTransparency=1,Position=UDim2.new(0.8619,0,0.18,0)},{Create('ImageLabel',{Name='Complete'
,BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255,255),Image='rbxassetid://88066926099934',Size=UDim2.new(
1.27273,0,1.18182,0),Visible=false,BackgroundTransparency=1,Position=UDim2.new(0,0,-0.18182,0)})})})})})})})})end local
s=game:GetService('TweenService')local t=game.CoreGui:FindFirstChild('MasteryGui')local u=t and t:FindFirstChild('Main')
local w=u and u:FindFirstChild('InfoMastery')local y=w and w:FindFirstChild('Info')local z=w and w:FindFirstChild(
'Close')local A=TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out)local B=false local C=''local function 
ToggleInfoPanel(D,E)if not w then return end if E and y then y.Text=E end if D then w.Visible=true local F=s:Create(w,A,
{Size=UDim2.new(0.336,0,1,0),Position=UDim2.new(0,-88,0,2)})F:Play()else local F=s:Create(w,A,{Size=UDim2.new(0,0,1,0),
Position=UDim2.new(0,0,0,2)})F:Play()F.Completed:Connect(function()if w.Size.X.Offset==0 and w.Size.X.Scale==0 then w.
Visible=false end end)end end if z then z.MouseButton1Click:Connect(function()ToggleInfoPanel(false)end)end function
ShowMasteryGui(D)if u then u.Visible=D if not D then ToggleInfoPanel(false)end end end function UpdateTaskGloveMastery()
local D={}if not _G.MasteryGlove then return D end local function findMastery(E)for F,G in pairs(_G.MasteryGlove)do if F
:lower()==CheckGlove():lower()then for H,I in pairs(G)do if H:lower()==E:lower()then return tonumber(I)end end end end
return 0 end local E=CheckGlove():lower()if _G.Gloves then for F,G in pairs(_G.Gloves)do if F:lower()==E and G.
MasteryInfo and G.MasteryInfo.MasteryChallenges then local H=0 for I,J in pairs(G.MasteryInfo.MasteryChallenges)do H+=1
local K=tonumber(findMastery(I))or 0 local L=tonumber(J.ProgressMaxQuantity)or 1 D[H]={Text=J.Name,Max=L,Current=K,Info=
J.HoverTip,Percent=math.clamp(math.floor((K/L)*100),0,100)}end end end end if#D==0 then D[1]={Text='No '..(CheckGlove
and CheckGlove()or'Unknown')..' glove mastery or soon',IsFallback=true,Info='You should change to a glove with mastery.'
}else for F,G in ipairs(D)do G.Percent=math.min(math.floor((G.Current/G.Max)*100),100)end end return D end local D={}
table.insert(_G.ConnectFun,game:GetService('RunService').RenderStepped:Connect(function()if not u or not u.Visible then
return end local E=CheckGlove()or'Unknown'if C~=''and C~=E then ToggleInfoPanel(false)end C=E local F=u:FindFirstChild(
'masteryGlove')local G=F and F:FindFirstChild('Progress')local H=G and G:FindFirstChild('TaskHere')if not H then return
end local I=UpdateTaskGloveMastery()D=I local J=H:FindFirstChild('Task [???]')or H:FindFirstChildOfClass('Frame')for K,L
in ipairs(G:GetChildren())do if L.Name:match('^Task %[%d+%]$')then L.Visible=false end end for K,L in ipairs(I)do local
M='Task ['..K..']'local N='Info ['..K..']'local O=G:FindFirstChild(M)if not O and J then O=J:Clone()O.Name=M O.Visible=
true O.Parent=G local P=O:FindFirstChild('Info [???]')if P then P.Name=N P.MouseButton1Click:Connect(function()local Q=D
[K]if Q then ToggleInfoPanel(true,'Task '..K..': '..Q.Info)end end)end end if O then local P=O:FindFirstChild(
'ProgressTask')local Q=O:FindFirstChild('TaskUnComplete')and O.TaskUnComplete:FindFirstChild('Complete')if P and P:IsA(
'TextLabel')then if L.IsFallback then P.Text=L.Text if Q then Q.Visible=false end else P.Text=string.format(
'%s (%d/%d) (%d%%)',L.Text,L.Current,L.Max,L.Percent)if Q then Q.Visible=(L.Current>=L.Max)end end O.Visible=true end
end end end))function EquipGloveRemote(E)if game:GetService('ReplicatedStorage'):FindFirstChild('_NETWORK')and game:
GetService('ReplicatedStorage')._NETWORK:FindFirstChild('SelectGlove [STUDIO]')then game:GetService('ReplicatedStorage')
._NETWORK['SelectGlove [STUDIO]']:FireServer(tostring(E))end end function CheckUnlockGlove(E)return game.Players.
LocalPlayer:FindFirstChild('_unlockedGloves')and game.Players.LocalPlayer._unlockedGloves:FindFirstChild(E)end function
CheckGlove()return game.Players.LocalPlayer:FindFirstChild('leaderstats')and game.Players.LocalPlayer.leaderstats:
FindFirstChild('Glove')and game.Players.LocalPlayer.leaderstats.Glove.Value end function CheckSlap()local E=game.Players
.LocalPlayer:FindFirstChild('leaderstats')local F=E and E:FindFirstChild('Slaps')if not F then return 0 end return
tonumber(F.Value)or 0 end function IsNetworkOwner(E)return E.ReceiveAge==0 end function couldfound()GetCloudYour=nil for
E,F in pairs(game.Workspace:GetChildren())do if F.Name:match(game.Players.LocalPlayer.Name)and F:FindFirstChild(
'VehicleSeat')then GetCloudYour=F end end return GetCloudYour end function notSlap(E,F)if not E then return false end
for G,H in ipairs(E:GetChildren())do local I=H.Name:lower()for J,K in ipairs(F)do if I:find(K:lower())then return false
end end end return true end local function GetHookGloveName()return tostring(EquipGlove or'Default'):lower()end local 
function ShouldPatchMethodGlove(E,F)if MethodGlove~=true then return false end return(E=='GoldenHit'and F:find('golden')
)or(E=='GeneralHit'and(F:find('glovel')or F:find('mace')or F:find('charge')or F:find('stalker')))end local function 
PatchMethodGloveArgs(E,F)local G=tostring(E)local H=GetHookGloveName()if not ShouldPatchMethodGlove(G,H)then return
false end if not H:find('stalker')then F[2]=H:find('mace')and 200 or true else F[3]=48 end return true end local 
function PatchFrostbiteArgs(E,F)if tostring(E)~='GeneralAbility'or MethodGlove~=true then return false end if not
GetHookGloveName():find('frostbite')then return false end if not type(F[1]):find('number')or not type(F[2]):find(
'number')then return false end F[1]=3 F[2]=2 return true end local function ShouldBlockFireServer(E,F)local G=tostring(E
)return(G=='GeneralAbility'and F[1]=='antispam'and getgenv().AntiSpamBypass)or(G=='Piano'and getgenv().AntiPiano)end
local function TrackReplicaRoll(E,F)if tostring(E)=='Duplicate'and F[1]==true then ReplicaCount+=1 end end local 
function PatchPsychokinesisArgs(E,F)if tostring(E)~='Psychokinesis'or MethodGlove~=true then return false end if typeof(
F[1])~='table'or typeof(F[1]['throwbackAlpha'])~='number'then return false end F[1]['throwbackAlpha']=math.huge return
true end local function ShouldBlockClientSignal(E,F)local G=tostring(E)if G=='Confuse'and getgenv().AntiConfuse then
return true end return G=='VFX'and F[1]=='NightmareEffect'and getgenv().AntiNightmare end local function 
InstallNamecallHook()if CheckExecutorSupport and not CheckExecutorSupport('namecall_hook',nil,true)then getgenv().
HookDisabled=true return false end if getgenv().HookNamecallInstalled then getgenv().HookDisabled=false return true end
local E local F=function(F,...)if not E then return end if getgenv().HookDisabled then return E(F,...)end local G={...}
local H=getnamecallmethod()if H=='FireServer'then if PatchMethodGloveArgs(F,G)or PatchFrostbiteArgs(F,G)then return E(F,
unpack(G))end if ShouldBlockFireServer(F,G)then return end TrackReplicaRoll(F,G)elseif H=='InvokeServer'then if
PatchPsychokinesisArgs(F,G)then return E(F,unpack(G))end elseif H=='FireClient'or H=='FireAllClients'then if
ShouldBlockClientSignal(F,G)then return end end return E(F,...)end if newcclosure then F=newcclosure(F)end E=
hookmetamethod(game,'__namecall',F)getgenv().HookFun=E getgenv().HookNamecallInstalled=true getgenv().HookDisabled=false
return true end local function RefreshNamecallHook()local E=MethodGlove==true or getgenv().AntiSpamBypass==true or
getgenv().AntiPiano==true or getgenv().AntiConfuse==true or getgenv().AntiNightmare==true if E then if not
InstallNamecallHook()then MethodGlove=false getgenv().AntiSpamBypass=false getgenv().AntiPiano=false getgenv().
AntiConfuse=false getgenv().AntiNightmare=false if CheckExecutorSupport then CheckExecutorSupport('namecall_hook')end
return false end elseif getgenv().HookNamecallInstalled then getgenv().HookDisabled=true end return true end if not
loadingGetOut then loadingGetOut=true MethodGlove,EquipGlove,ReplicaCount=false,'Default',0 end if MethodGlove==nil then
MethodGlove=false end if EquipGlove==nil then EquipGlove='Default'end if ReplicaCount==nil then ReplicaCount=0 end
getgenv().InstallSlapNamecallHook=InstallNamecallHook getgenv().RefreshSlapNamecallHook=RefreshNamecallHook
RefreshNamecallHook()local function combinations(E,F)local G={}local function recurse(H,I)if#I==F then table.insert(G,
table.clone(I))return end for J=H,#E do table.insert(I,E[J])recurse(J+1,I)table.remove(I)end end recurse(1,{})return G
end function findGroup(E,F)local G={}for H,I in pairs(game.Players:GetChildren())do if I~=game.Players.LocalPlayer and I
.Character and I.Character:FindFirstChild('HumanoidRootPart')and I.Character:FindFirstChild('Ragdolled')and not I.
Character.HumanoidRootPart:FindFirstChild('BlockedShield')and I.Character.Ragdolled.Value==false and I.Character.
isInArena.Value==true and notSlap(I.Character,BlackList)then table.insert(G,I)end end if#G~=0 then for H,I in ipairs(
combinations(G,F))do local J=true for K=1,#I do for L=K+1,#I do local M=I[K].Character local N=I[L].Character if not(M
and M:FindFirstChild('HumanoidRootPart')and N and N:FindFirstChild('HumanoidRootPart'))then J=false break end local O=M.
HumanoidRootPart.Position local P=N.HumanoidRootPart.Position if(O-P).Magnitude>=E then J=false break end end if not J
then break end end if J then return I end end end return nil end function equipglove(E)if CheckGlove():lower()~=E:lower(
)then EquipGloveRemote(E)local F=workspace.Lobby:FindFirstChild(E)if F and fireclickdetector then fireclickdetector(F.
ClickDetector)end end end function slapglove(E)local F=CheckGlove()local G if gloveHits[F]then gloveHits[F]:FireServer(E
)else if F then if F:lower()=='stalker'then G={E,false,45}elseif F:lower()=='glovel'then G={E,true}elseif F:lower()==
'mace'then G={E,100}else G={E}end gloveHits['All']:FireServer(unpack(G))end end end if not workspace:FindFirstChild(
'SafeBoxSpace')then Create('Part',{Name='SafeBoxSpace',Anchored=true,CanCollide=true,Transparency=0.5,Position=Vector3.
new(0,15000,0),Size=Vector3.new(150,5,150),Parent=workspace})end if not workspace:FindFirstChild('SafeBox')then local E=
Create('Part',{Name='SafeBox',Anchored=true,CanCollide=true,Transparency=0.5,Position=Vector3.new(-55E2,-5E3,-5E3),Size=
Vector3.new(21,5,21),Parent=workspace},{Create('Part',{Name='S1',Anchored=true,CanCollide=true,Transparency=0.5,Position
=Vector3.new(-5499.91,-4991.5,-4989.09),Size=Vector3.new(20,13,2)}),Create('Part',{Name='S2',Anchored=true,CanCollide=
true,Transparency=0.5,Size=Vector3.new(21,14,2),CFrame=CFrame.new(-5510.27979,-4991.5,-5000.08984)*CFrame.Angles(0,math.
rad(-90),0)}),Create('Part',{Name='S3',Anchored=true,CanCollide=true,Transparency=0.5,Position=Vector3.new(-5499.3,-
4991.5,-5011.12),Size=Vector3.new(21,13,2)}),Create('Part',{Name='S4',Anchored=true,CanCollide=true,Transparency=0.5,
Size=Vector3.new(22,13,2),CFrame=CFrame.new(-5489.97559,-4991.5,-4999.52637)*CFrame.Angles(0,math.rad(-90),0)}),Create(
'Part',{Name='S5',Anchored=true,CanCollide=true,Transparency=0.5,Position=Vector3.new(-5499.39,-4984,-5000.07),Size=
Vector3.new(24,3,24)})})for F,G in ipairs(workspace.SafeBox:GetChildren())do if G:IsA('BasePart')and G~=workspace.
SafeBox then Create('WeldConstraint',{Part0=workspace.SafeBox,Part1=G,Name=G.Name..' (Weld)',Parent=workspace.SafeBox})G
.Anchored=false end end end if not workspace:FindFirstChild('Bed')then local E=Create('Part',{Name='Bed',Anchored=true,
CanCollide=false,Transparency=1,Position=Vector3.new(-100019.5,104,-15E2),Size=Vector3.new(0.01,0.01,0.01),Parent=
workspace},{Create('Part',{Name='Bed1',Anchored=true,Position=Vector3.new(-100025,104,-15E2),Size=Vector3.new(1,6,7),
BrickColor=BrickColor.new('Burnt Sienna')}),Create('Part',{Name='Bed2',Anchored=true,Position=Vector3.new(-100023,104.5,
-15E2),Size=Vector3.new(2,1,6),BrickColor=BrickColor.new('Mid gray')}),Create('Part',{Name='Bed3',Anchored=true,Position
=Vector3.new(-100019,104,-15E2),Size=Vector3.new(11,1,7),BrickColor=BrickColor.new('Crimson')}),Create('Part',{Name=
'Bed4',Anchored=true,Position=Vector3.new(-100013,104,-15E2),Size=Vector3.new(1,6,7),BrickColor=BrickColor.new(
'Burnt Sienna')}),Create('Part',{Name='Bed5',Anchored=true,Position=Vector3.new(-100019,103,-15E2),Size=Vector3.new(11,1
,7),BrickColor=BrickColor.new('Dark orange')})})for F,G in ipairs(workspace.Bed:GetChildren())do if G:IsA('BasePart')and
G~=workspace.Bed then Create('WeldConstraint',{Part0=workspace.Bed,Part1=G,Name=G.Name..' (Weld)',Parent=workspace.Bed})
G.Anchored=false end end end if not workspace:FindFirstChild('Safespot')then local E=Create('Part',{Name='Safespot',
Position=Vector3.new(10000,-50,10000),Size=Vector3.new(500,10,500),Anchored=true,CanCollide=true,Transparency=0.5,Parent
=workspace},{Create('Part',{Name='DefendPart',Position=Vector3.new(10000.2,13,9752.45),Size=Vector3.new(500,117,5),
Anchored=true,CanCollide=true,Transparency=0.5}),Create('Part',{Name='DefendPart1',Position=Vector3.new(10248.2,13,
10002.4),Size=Vector3.new(5,117,496),Anchored=true,CanCollide=true,Transparency=0.5}),Create('Part',{Name='DefendPart2',
Position=Vector3.new(9998.13,13,10247.2),Size=Vector3.new(497,117,6),Anchored=true,CanCollide=true,Transparency=0.5}),
Create('Part',{Name='DefendPart3',Position=Vector3.new(9752.71,13,9999.28),Size=Vector3.new(7,117,490),Anchored=true,
CanCollide=true,Transparency=0.5}),Create('Part',{Name='DefendPart4',Position=Vector3.new(10001.1,76,9999.66),Size=
Vector3.new(491,10,491),Anchored=true,CanCollide=true,Transparency=0.5})})for F,G in ipairs(workspace.Safespot:
GetChildren())do if G:IsA('BasePart')and G~=workspace.Safespot then Create('WeldConstraint',{Part0=workspace.Safespot,
Part1=G,Name=G.Name..' (Weld)',Parent=workspace.Safespot})G.Anchored=false end end end if not workspace:FindFirstChild(
'Psycho')then Create('Part',{Name='Psycho',Size=Vector3.new(2000,1,2000),Anchored=true,Transparency=1,CanCollide=false,
Rotation=Vector3.new(0,0,0),CFrame=CFrame.new(17800.9082,2947,-226.017517),Parent=workspace},{Create('Part',{Name=
'Kraken',Size=Vector3.new(2000,1,2000),Anchored=true,Transparency=1,CanCollide=false,Position=Vector3.new(221,29,-12632)
}),Create('Part',{Name='Retro1',Size=Vector3.new(2000,1,2000),Anchored=true,Transparency=1,CanCollide=false,Position=
Vector3.new(-16643.6289,770.0464,4707.8193)},{Create('Part',{Name='Retro2',Size=Vector3.new(2000,1,2000),Anchored=true,
Transparency=1,CanCollide=false,Position=Vector3.new(-16862.791,-7.87957,4791.5551)}),Create('Part',{Name='Retro3',Size=
Vector3.new(2000,1,2000),Anchored=true,Transparency=1,CanCollide=false,Position=Vector3.new(-28023.3046,-219.9238,
4906.6015)})})})end if workspace:FindFirstChild('BobWalk1')==nil then local E=Create('Part',{CanCollide=false,Anchored=
true,CFrame=CFrame.new(23.2798462,-19.8447475,1.83554196,-1,0,0,0,-1,0,0,0,1),Size=Vector3.new(1139.2593994140625,1.5,
2048),Name='BobWalk1',Transparency=1,Parent=workspace})local F={{CFrame=CFrame.new(-458.458344,-9.25,1.83554196,-1,0,0,0
,-1,0,0,0,1),Size=Vector3.new(1139.2593994140625,1.5,2048),Name='BobWalk2'},{CFrame=CFrame.new(-690.65979,47.25,
1.83554196,-1,0,0,0,-1,0,0,0,1),Size=Vector3.new(674.8563232421875,0.6048492789268494,2048),Name='BobWalk3'},{CFrame=
CFrame.new(402.964996,29.25,222.310089,-1,0,0,0,-1,0,0,0,1),Size=Vector3.new(379.88922119140625,1.5,160.8837127685547),
Name='BobWalk4'},{CFrame=CFrame.new(178.719162,-18.9417267,1.83554196,-0.989596844,-0.143868446,0,0.143868446,-
0.989596844,0,0,0,1),Size=Vector3.new(143.94830322265625,1.5,2048),Name='BobWalk5'},{CFrame=CFrame.new(-309.152832,
15.4761791,1.83554196,-0.816968799,-0.576681912,0,0.576681912,-0.816968799,0,0,0,1),Size=Vector3.new(110.13511657714844,
2.740000009536743,2048),Name='BobWalk6'},{CFrame=CFrame.new(174.971924,5.34897423,222.310089,-0.838688731,0.544611216,0,
-0.544611216,-0.838688731,0,0,0,1),Size=Vector3.new(89.76103210449219,1.5,160.8837127685547),Name='BobWalk7'},{CFrame=
CFrame.new(402.965027,5.49165154,74.8157959,2.98023224e-5,-1.1414289499999999E-5,-1,-0.668144584,-0.744031429,-
1.1414289499999999E-5,-0.744031489,0.668144584,-2.98023224E-5),Size=Vector3.new(74.23055267333984,1,379.88922119140625),
Name='BobWalk8'},{Size=Vector3.new(379.88922119140625,1.5,39.77305603027344),CFrame=CFrame.new(402.964996,29.9136467,
121.981705,-1,0,0,0,-1,0,0,0,1),Name='BobWalk9'},{Size=Vector3.new(1,88.66793823242188,34.42972946166992),CFrame=CFrame.
new(134.084229,-17.8583984,94.3953705,0.541196942,-0.354067981,0.762719929,-0.840263784,-0.192543149,0.506837189,-
3.25982571E-2,-0.915184677,-0.401714325),Name='BobWalk10'},{CFrame=CFrame.new(168.441879,2.46393585,125.815231,-
0.350553155,-0.534268022,0.769201458,-0.198098332,0.845035911,0.496660322,-0.915352523,0.0217281878,-0.402067661),Size=
Vector3.new(1,0.9999924302101135,82.1865463256836),Name='BobWalk11'},{Name='BobWalk12',Size=Vector3.new(1,
13.53612232208252,9.847718238830566),CFrame=CFrame.new(206.315063,26.9295502,105.471031,0.534210563,-0.415855825,-
0.73599112,-0.845072925,-0.285055399,-0.452321947,-2.1697551E-2,0.863601387,-0.503708005)},{Name='BobWalk13',Size=
Vector3.new(1,13.53612232208252,99.8001480102539),CFrame=CFrame.new(165.965088,2.12955856,77.8575592,-0.53421092,-
0.415855944,0.735991359,0.845073164,-0.285055757,0.452322066,0.0216975808,0.863601625,0.503708005)},{Name='BobWalk14',
Size=Vector3.new(1,74.23055267333984,80.699951171875),CFrame=CFrame.new(172.67041,5.49164963,74.8157959,-4.58955765E-5,
2.05039978e-5,1,0.743987858,0.668193102,2.05039978e-5,-0.668193102,0.743987858,-4.58955765E-5)},{Name='BobWalk15',Size=
Vector3.new(1,0.8520558476448059,39.773048400878906),CFrame=CFrame.new(212.753906,30.0632439,121.981705,-0.283976078,-
0.95883137,0,0.95883137,-0.283976078,0,0,0,1)},{Name='BobWalk16',Size=Vector3.new(1,36.08900451660156,16.739320755004883
),CFrame=CFrame.new(212.884216,30.1233234,121.984734,0.544644356,0.33412537,-0.769235253,-0.838644743,0.223680317,-
0.496630788,0.00612583756,0.915602207,0.402038693)},{Name='BobWalk17',Size=Vector3.new(1,36.08900451660156,
82.1865463256836),CFrame=CFrame.new(174.83577,5.55865097,141.871262,-0.544644356,0.33412537,0.769235253,0.838644743,
0.223680317,0.496630788,-6.12583756E-3,0.915602207,-0.402038693)},{Name='BobWalk18',Size=Vector3.new(1,88.66793823242188
,47.76289749145508),CFrame=CFrame.new(165.427338,2.97219658,77.884697,-0.541196942,-0.354067981,-0.762719929,0.840263784
,-0.192543149,-0.506837189,0.0325982571,-0.915184677,0.401714325)}}for G,H in ipairs(F)do Create('Part',{Name=H.Name,
Size=H.Size,CFrame=H.CFrame,Anchored=true,CanCollide=false,Transparency=1,Parent=E})end for G,H in ipairs(workspace.
BobWalk1:GetChildren())do if H:IsA('BasePart')and H~=workspace.BobWalk1 then Create('WeldConstraint',{Part0=workspace.
BobWalk1,Part1=H,Name=H.Name..' (Weld)',Parent=workspace.BobWalk1})H.Anchored=false end end end if workspace:
FindFirstChild('VoidPart')==nil then local E=Create('Part',{Position=Vector3.new(-80.5,-10.005,-246.5),Name='VoidPart',
Size=Vector3.new(2048,1,2048),Anchored=true,Transparency=1,CanCollide=false,Parent=workspace},{Create('Part',{Name=
'TAntiVoid',Size=Vector3.new(2048,15,2048),Position=Vector3.new(3393,228,97),Anchored=true,Transparency=1,CanCollide=
false})})end elseif game.PlaceId==9431156611 then local q=game.ReplicatedStorage.Remotes if q:FindFirstChild('Ban')then
q:FindFirstChild('Ban'):Destroy()end if q:FindFirstChild('Grab')then q:FindFirstChild('Grab'):Destroy()end if q:
FindFirstChild('LegacyBan')then q:FindFirstChild('LegacyBan'):Destroy()end if q:FindFirstChild('LegacyAntiCheatFunction'
)then q:FindFirstChild('LegacyAntiCheatFunction'):Destroy()end end h:SetCurrentStep(3)h:SetDescription(
'Applying game patches...')task.wait(0.25)local q=loadstring(game:HttpGet(
[[https://raw.githubusercontent.com/bocaj111004/ESPLibrary/refs/heads/main/Library.lua]]))()function Notification(r,s)if
_G.ChooseNotify=='Obsidian'then c:Notify(r,s or 5)elseif _G.ChooseNotify=='Roblox'then game:GetService('StarterGui'):
SetCore('SendNotification',{Title='Error',Text=r,Icon='rbxassetid://7733658504',Duration=s or 5})end if _G.
NotificationSound then local t=Instance.new('Sound',workspace)t.SoundId='rbxassetid://4590662766't.Volume=_G.VolumeTime
or 2 t.PlayOnRemove=true t:Destroy()end end local r=
[[https://raw.githubusercontent.com/tanhoangviet/ToolForLua/refs/heads/main/]]local s=loadstring(game:HttpGet(r..
'TopbarPlus_Extended.lua'))()local t=s.Ex local u=s.Presets local w=t.watermark({realtime=true,interval=1,color=Color3.
fromRGB(180,220,255)})local y=tick()local z=0 local A=60 table.insert(_G.ConnectFun,game:GetService('RunService').
RenderStepped:Connect(function()z+=1 if(tick()-y)>=1 then A=z y=tick()z=0 end local B=workspace.DistributedGameTime
local C=math.floor(B/3600)local D=math.floor((B%3600)/60)local E=math.floor(B%60)w.setText((
'FPS: %s | %s MS | %02d Hour / %02d Minute / %02d Second'):format(math.floor(A),math.floor(game:GetService('Stats').
Network.ServerStatsItem['Data Ping']:GetValue()),C,D,E))end))Window=c:CreateWindow({Footer='Giang Hub Version: 2.0.3',
Icon=97940383057976,NotifySide='Right',MenuFadeTime=0,SidebarCompacted=true,MobileButtonsMode='Normal',BackgroundImage=
'rbxassetid://94107130237217',DynamicIsland=true,DynamicIslandAsset=97940383057976,DynamicIslandText='Giang Hub',
DynamicIslandClosedText='Open UI',DynamicIslandOpenText='Close UI',DynamicIslandTopOffset=12,DynamicIslandGlow=true,
DynamicIslandGlowColor='AccentColor',DynamicIslandGlowTransparency=0.5,DynamicIslandShadow=true,DynamicIslandIdleDelay=
2.2,DynamicIslandIdleTransparency=0.56,DynamicIslandHoldDuration=0.45,CornerRadius=2,BorderColor=Color3.fromHex(
'#E6FFFB'),BorderThickness=1.5,Size=UDim2.new(0,500,0,500),TabsMode='Sidebar',FullscreenBackground=true,
FullscreenBackgroundTransparency=1})local B={Info='info',Script='code',Anti='shield-check',Badges='badge-check',Local=
'user-round',Misc='boxes',GlovesOptional='hand',Settings='settings',Main='layout-dashboard',Combat='swords',Boss='skull'
,Esp='eye',Help='circle-question-mark',Mastery='trophy'}local C={Farm=B.Mastery,SpringDefense=B.Local,ThanosTycoon=B.
Combat,PhaseWormhole=B.Misc,RunBrick=B.Mastery,HelpSetup=B.Help,HelpAB=B.Help,HelpVS=B.Combat,HelpTM=B.Misc,HelpQuick=B.
Mastery,GloveSpam=B.GlovesOptional,GloveTarget=B.Combat,GloveCollect=B.Misc,GloveUtility=B.Settings}local D=c and c.
ImageManager local E=D and D.AddAsset and D.GetAsset and ExecutorSupport and ExecutorSupport.custom_asset local function 
AddGloveAsset(F,G,H)if not E then return end pcall(D.AddAsset,G,0,H)local I=D.GetAsset(G)if I and I~='rbxassetid://0'
then C[F]=I end end if h then h:SetCurrentStep(4)h:SetDescription(E and'Downloading glove tab icons...'or
'Executor custom images unsupported, using fallback icons.')end AddGloveAsset('Farm','SlapReplicaIcon',
[[https://static.wikia.nocookie.net/roblox-slap-battles/images/5/51/ReplicaHoldingUpdated.png/revision/latest/scale-to-width-down/128?cb=20220921035241]]
)AddGloveAsset('SpringDefense','SlapSpringIcon',
[[https://static.wikia.nocookie.net/roblox-slap-battles/images/5/5e/Screenshot_20260403-151033.jpg/revision/latest/scale-to-width-down/128?cb=20260403210743]]
)AddGloveAsset('ThanosTycoon','SlapThanosIcon',
[[https://static.wikia.nocookie.net/roblox-slap-battles/images/f/f6/Thanosglove.JPG/revision/latest/scale-to-width-down/128?cb=20230314010648]]
)AddGloveAsset('PhaseWormhole','SlapPhaseIcon',
[[https://static.wikia.nocookie.net/roblox-slap-battles/images/e/e2/Phase.gif/revision/latest/scale-to-width-down/128?cb=20230924142944]]
)AddGloveAsset('RunBrick','SlapRunIcon',
[[https://static.wikia.nocookie.net/roblox-slap-battles/images/4/48/RunHeld.jpg/revision/latest/scale-to-width-down/128?cb=20240809185110]]
)AddGloveAsset('HelpSetup','SlapDefaultIcon',
[[https://static.wikia.nocookie.net/roblox-slap-battles/images/4/48/Defaultheld.png/revision/latest/scale-to-width-down/128?cb=20230702234707]]
)AddGloveAsset('HelpAB','SlapAcrobatIcon',
[[https://static.wikia.nocookie.net/roblox-slap-battles/images/e/e0/Player_holding_acrobat.png/revision/latest/scale-to-width-down/128?cb=20230314010502]]
)AddGloveAsset('HelpVS','SlapVoodooIcon',
[[https://static.wikia.nocookie.net/roblox-slap-battles/images/b/b3/VoodooEquipped.png/revision/latest/scale-to-width-down/128?cb=20230712113411]]
)AddGloveAsset('HelpTM','SlapTycoonIcon',
[[https://static.wikia.nocookie.net/roblox-slap-battles/images/e/ee/Tycoonheld.png/revision/latest/scale-to-width-down/128?cb=20251123203723]]
)AddGloveAsset('HelpQuick','SlapBrickIcon',
[[https://static.wikia.nocookie.net/roblox-slap-battles/images/5/56/BrickUpdated.png/revision/latest/scale-to-width-down/128?cb=20240809184630]]
)AddGloveAsset('GloveSpam','SlapGoldenIcon',
[[https://static.wikia.nocookie.net/roblox-slap-battles/images/5/54/Golden.jpeg/revision/latest/scale-to-width-down/128?cb=20230314005655]]
)AddGloveAsset('GloveTarget','SlapStalkerIcon',
[[https://static.wikia.nocookie.net/roblox-slap-battles/images/e/e7/Stalker_Glove_Equipped.png/revision/latest/scale-to-width-down/128?cb=20241206162115]]
)AddGloveAsset('GloveCollect','SlapGlovelIcon',
[[https://static.wikia.nocookie.net/roblox-slap-battles/images/c/ce/Glovel_Glove.png/revision/latest/scale-to-width-down/128?cb=20240323200014]]
)AddGloveAsset('GloveUtility','SlapMaceIcon',
[[https://static.wikia.nocookie.net/roblox-slap-battles/images/b/b5/MaceHolding.png/revision/latest/scale-to-width-down/128?cb=20241227163801]]
)getgenv().SlapGloveIcon=C if game.PlaceId==6403373529 or game.PlaceId==136802962479827 or game.PlaceId==127174121130060
or game.PlaceId==11520107397 or game.PlaceId==124596094333302 or game.PlaceId==2380077519 or 
game.PlaceId==9015014224 then Window:ChangeTitle(
'Slap Battles \u{1f44f}')Tabs={Tab=Window:AddTab('Info',B.Info),Tab1=Window:AddTab('Script',B.Script),Tab2=Window:
AddTab('Anti',B.Anti),Tab3=Window:AddTab('Badges',B.Badges),Tab4=Window:AddTab('Local',B.Local),Tab5=Window:AddTab(
'Misc',B.Misc),Tab6=Window:AddTab('Gloves Optional',B.GlovesOptional),['UI Settings']=Window:AddTab('UI Settings',B.
Settings)}local function AddInfoGuideCard(F,G,H,I,J,K)return Tabs.Tab:addcard({Title=F,Desc=G,Icon=H,TargetTab=I,Side=J,
Height=78,BarHeight=78,DisableHoverGrow=true,LayoutOrder=K,BottomBarTransparency=0.18,StrokeColor='AccentColor',
StrokeTransparency=0.45})end local F=Tabs.Tab:AddLeftGroupbox('Server')CanYouFps=F:AddLabel('Your Fps [ '..math.floor(
workspace:GetRealPhysicsFPS())..' ]',true)CanYouPing=F:AddLabel('Your Ping [ '..game:GetService('Stats').Network.
ServerStatsItem['Data Ping']:GetValueString()..' ]',true)ServerPlayer=F:AddLabel('Player In Server [ '..#game.Players:
GetPlayers()..' / '..game.Players.MaxPlayers..' ]',true)TimeServer=F:AddLabel('Server Time [ '..math.floor(workspace.
DistributedGameTime/60/60)..' Hour | '..math.floor(workspace.DistributedGameTime/60)-(math.floor(workspace.
DistributedGameTime/60/60)*60)..' Minute | '..math.floor(workspace.DistributedGameTime)-(math.floor(workspace.
DistributedGameTime/60)*60)..' Second ]',true)TimeNow=F:AddLabel('Now Time [ '..os.date('%X')..' ]',true)if tonumber(os.
date('%H'))>=5 and tonumber(os.date('%H'))<12 then AlarmTime=F:AddLabel('Good Morning [ '..tonumber(os.date('%H'))..
' Hour ]',true)elseif tonumber(os.date('%H'))>=12 and tonumber(os.date('%H'))<17 then AlarmTime=F:AddLabel(
'Good Afternoon [ '..tonumber(os.date('%H'))..' Hour ]',true)elseif tonumber(os.date('%H'))>=17 and tonumber(os.date(
'%H'))<21 then AlarmTime=F:AddLabel('Good Evening [ '..tonumber(os.date('%H'))..' Hour ]',true)else AlarmTime=F:
AddLabel('Good Night [ '..tonumber(os.date('%H'))..' Hour ]',true)end AgeAccYou=F:AddLabel('You Account Age [ '..game.
Players.LocalPlayer.AccountAge..' ]',true)if game.Workspace:FindFirstChild('RoomsFolder')then PocketSpawn={}for G,H in
pairs(game.Workspace.RoomsFolder:GetChildren())do if string.find(H.Name,"'s Room")then table.insert(PocketSpawn,H)end
end end if#PocketSpawn==0 then PocketKeypad=F:AddLabel('Pocket Room [ No ]',true)elseif#PocketSpawn>0 then PocketKeypad=
F:AddLabel('Pocket Room [ Yes ] [ '..#PocketSpawn..' ]',true)end if game.Players.LocalPlayer.Character:
FindFirstChildOfClass('Humanoid').Health==0 then ResetTime=F:AddLabel('Time Spawn [ '..game.Players.RespawnTime..' ]',
true)else ResetTime=F:AddLabel('Time Spawn [ Not Dead ]',true)end CodeKeypad=F:AddLabel('Code Keypad [ '..tostring((#
game.Players:GetPlayers())*25+1100-7)..' ]',true)if not game.Workspace:FindFirstChild('Keypad')then KeypadSpawn=F:
AddLabel('Keypad Spawn [ No ]',true)else KeypadSpawn=F:AddLabel('Keypad Spawn [ Yes ]',true)end if not game.Workspace:
FindFirstChild('Toolbox')then ToolboxSpawn=F:AddLabel('Player Spawn Toolbox [ No ]',true)else ToolboxSpawn=F:AddLabel(
'Player Spawn Toolbox [ Yes ]',true)end if not game.Workspace:FindFirstChild('Gravestone')then GravestoneSpawn=F:
AddLabel('Gravestone Spawn [ No ]',true)else GravestoneSpawn=F:AddLabel('Gravestone Spawn [ Yes ]',true)end if not game.
Workspace:FindFirstChild('Gift')then GiftSpawn=F:AddLabel('Player Spawn Gift [ No ]',true)else GiftSpawn=F:AddLabel(
'Player Spawn Gift [ Yes ]',true)end if workspace.Arena.island5.Slapples:FindFirstChild('GoldenSlapple')and workspace.
Arena.island5.Slapples.GoldenSlapple:FindFirstChild('Glove')and workspace.Arena.island5.Slapples.GoldenSlapple.Glove.
Transparency==1 then GoldenSlappleSpawn=F:AddLabel('Golden Slapple Spawn [ No ]',true)else GoldenSlappleSpawn=F:
AddLabel('Golden Slapple Spawn [ Yes ]',true)end if game.Workspace:FindFirstChild('JetOrb')then OrbSpawn=F:AddLabel(
'Spawn Orb [ Jet ]',true)elseif game.Workspace:FindFirstChild('PhaseOrb')then OrbSpawn=F:AddLabel('Spawn Orb [ Phase ]',
true)elseif game.Workspace:FindFirstChild('SiphonOrb')then OrbSpawn=F:AddLabel('Spawn Orb [ Siphon ]',true)elseif game.
Workspace:FindFirstChild('MATERIALIZEOrb')then OrbSpawn=F:AddLabel('Spawn Orb [ MATERIALIZE ]',true)else OrbSpawn=F:
AddLabel('Spawn Orb [ No ]',true)end CheckNullShards=F:AddLabel('Check Null Shard [ '..game.ReplicatedStorage.PlayerData
[game.Players.LocalPlayer.Name].NullShards.Value..' ]',true)CheckTournamentWins=F:AddLabel('Check Tournament Win [ '..
game.ReplicatedStorage.PlayerData[game.Players.LocalPlayer.Name].TournamentWins.Value..' ]',true)CheckSlap=F:AddLabel(
'Check Slap [ '..CheckSlap()..' ]',true)Glove={}for G,H in pairs(game.Workspace.Lobby.GloveStands:GetChildren())do if H.
Name~='Unknown'then table.insert(Glove,H)end end F:AddLabel('Much Glove [ '..#Glove..' ]',true)GloveCheck=F:AddLabel(
"You're Using Glove [ "..CheckGlove()..' ]',true)PlateTime=F:AddLabel('Plate Time [ 0 ]',true)GravityYou=F:AddLabel(
'Gravity [ '..game.Workspace.Gravity..' ]')PositionYou=F:AddLabel('Position In Your [ '..tostring(math.round(game.
Players.LocalPlayer.Character.HumanoidRootPart.Position.X)..', '..math.round(game.Players.LocalPlayer.Character.
HumanoidRootPart.Position.Y)..', '..math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z))..' ]',
true)local G=Tabs.Tab:AddLeftGroupbox('Glove Badge / Slap')local H={}local I={}for J,K in pairs(game.Players.LocalPlayer
._unlockedGloves:GetChildren())do if K.Value==true then table.insert(H,K)end if K.Value==false then table.insert(I,K)end
end G:AddInput('Players',{Default='',Numeric=false,Text='Player',Finished=true,Placeholder='Username',Callback=function(
J)_G.CheckGlovePlayer=FoundPlr(J,false)if _G.CheckGlovePlayer then PlayersCheck:SetText('Player Check [ \u{2705} ] [ '..
_G.CheckGlovePlayer.Name..' ]',_G.TimeNotify)else PlayersCheck:SetText('Player Check [ \u{274c} ]',_G.TimeNotify)end end
})GeneralBadge=G:AddLabel('General Glove / Badge [ \u{2705} - '..(#H==0 and'Nah'or#H)..' / \u{274c} - '..(#I==0 and'Nah'
or#I)..' ]',true)PlayersCheck=G:AddLabel('Player Check [ User ]',true)G:AddButton({Text='Check Glove / Badge',Func=
function()local J={}local K={}local L=game.Players:FindFirstChild(_G.CheckGlovePlayer)or game.Players.LocalPlayer local
M=L:FindFirstChild('_unlockedGloves')for N,O in pairs(M:GetChildren())do if O.Value==true then table.insert(J,O)end if O
.Value==false then table.insert(K,O)end end GeneralBadge:SetText('General Glove / Badge [ \u{2705} - '..(#J==0 and'Nah'
or#J)..' / \u{274c} - '..(#K==0 and'Nah'or#K)..' ]',true)for N,O in pairs(M:GetChildren())do GloveBadges['Check '..O.
Name]:SetText(O.Name..' - '..(O.Value==true and'\u{2705}'or'\u{274c}'),true)end end})GloveBadges={}for J,K in pairs(game
.Players.LocalPlayer._unlockedGloves:GetChildren())do GloveBadges['Check '..K.Name]=G:AddLabel(K.Name..' - '..(K.Value==
true and'\u{2705}'or'\u{274c}'),true)end local J=Tabs.Tab:AddRightGroupbox('Toggle Return')J:AddToggle('Toggle Set',{
Text='Toggle Return',Default=false,Callback=function(K)_G.AutoSetInfo=K end})table.insert(_G.ConnectFun,game:GetService(
'RunService').RenderStepped:Connect(function()if not _G.AutoSetInfo then return end pcall(function()CanYouFps:SetText(
'Your Fps [ '..math.floor(workspace:GetRealPhysicsFPS())..' ]')CanYouPing:SetText('Your Ping [ '..game:GetService(
'Stats').Network.ServerStatsItem['Data Ping']:GetValueString()..' ]')ServerPlayer:SetText('Player In Server [ '..#game.
Players:GetPlayers()..' / '..game.Players.MaxPlayers..' ]',true)TimeServer:SetText('Server Time [ '..math.floor(
workspace.DistributedGameTime/60/60)..' Hour | '..math.floor(workspace.DistributedGameTime/60)-(math.floor(workspace.
DistributedGameTime/60/60)*60)..' Minute | '..math.floor(workspace.DistributedGameTime)-(math.floor(workspace.
DistributedGameTime/60)*60)..' Second ]')TimeNow:SetText('Now Time [ '..os.date('%X')..' ]')if tonumber(os.date('%H'))>=
5 and tonumber(os.date('%H'))<12 then AlarmTime:SetText('Good Morning [ '..tonumber(os.date('%H'))..' Hour ]')elseif
tonumber(os.date('%H'))>=12 and tonumber(os.date('%H'))<17 then AlarmTime:SetText('Good Afternoon [ '..tonumber(os.date(
'%H'))..' Hour ]')elseif tonumber(os.date('%H'))>=17 and tonumber(os.date('%H'))<21 then AlarmTime:SetText(
'Good Evening [ '..tonumber(os.date('%H'))..' Hour ]')else AlarmTime:SetText('Good Night [ '..tonumber(os.date('%H'))..
' Hour ]')end if game.Workspace:FindFirstChild('RoomsFolder')then PocketSpawn={}for K,L in pairs(game.Workspace.
RoomsFolder:GetChildren())do if string.find(L.Name,"'s Room")then table.insert(PocketSpawn,L)end end end if#PocketSpawn
==0 then PocketKeypad:SetText('Pocket Room [ No ]')elseif#PocketSpawn>0 then PocketKeypad:SetText(
'Pocket Room [ Yes ] [ '..#PocketSpawn..' ]')end AgeAccYou:SetText('You Account Age [ '..game.Players.LocalPlayer.
AccountAge..' ]')if game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Health==0 then ResetTime:
SetText('Time Spawn [ '..game.Players.RespawnTime..' ]')else ResetTime:SetText('Time Spawn [ Not Dead ]')end CodeKeypad:
SetText('Code Keypad [ '..tostring((#game.Players:GetPlayers())*25+1100-7)..' ]')if not game.Workspace:FindFirstChild(
'Keypad')then KeypadSpawn:SetText('Keypad Spawn [ No ]')else KeypadSpawn:SetText('Keypad Spawn [ Yes ]')end if not game.
Workspace:FindFirstChild('Toolbox')then ToolboxSpawn:SetText('Player Spawn Toolbox [ No ]')else ToolboxSpawn:SetText(
'Player Spawn Toolbox [ Yes ]')end if not game.Workspace:FindFirstChild('Gravestone')then GravestoneSpawn:SetText(
'Gravestone Spawn [ No ]')else GravestoneSpawn:SetText('Gravestone Spawn [ Yes ]')end if not game.Workspace:
FindFirstChild('Gift')then GiftSpawn:SetText('Player Spawn Gift [ No ]')else GiftSpawn:SetText(
'Player Spawn Gift [ Yes ]')end if workspace.Arena.island5.Slapples:FindFirstChild('GoldenSlapple')and workspace.Arena.
island5.Slapples.GoldenSlapple:FindFirstChild('Glove')and workspace.Arena.island5.Slapples.GoldenSlapple.Glove.
Transparency==1 then GoldenSlappleSpawn:SetText('Golden Slapple Spawn [ No ]')else GoldenSlappleSpawn:SetText(
'Golden Slapple Spawn [ Yes ]')end if game.Workspace:FindFirstChild('JetOrb')then OrbSpawn:SetText('Spawn Orb [ Jet ]')
elseif game.Workspace:FindFirstChild('PhaseOrb')then OrbSpawn:SetText('Spawn Orb [ Phase ]')elseif game.Workspace:
FindFirstChild('SiphonOrb')then OrbSpawn:SetText('Spawn Orb [ Siphon ]')elseif game.Workspace:FindFirstChild(
'MATERIALIZEOrb')then OrbSpawn:SetText('Spawn Orb [ MATERIALIZE ]')else OrbSpawn:SetText('Spawn Orb [ No ]')end
CheckNullShards:SetText('Check Null Shard [ '..game.ReplicatedStorage.PlayerData[game.Players.LocalPlayer.Name].
NullShards.Value..' ]')CheckTournamentWins:SetText('Check Tournament Win [ '..game.ReplicatedStorage.PlayerData[game.
Players.LocalPlayer.Name].TournamentWins.Value..' ]')CheckSlap:SetText('Check Slap [ '..game.Players.LocalPlayer.
leaderstats.Slaps.Value..' ]')GloveCheck:SetText("You're Using Glove [ "..CheckGlove()..' ]')PlateTime:SetText(
'Plate Time [ '..(game.Players.LocalPlayer.Character:FindFirstChild('PlateCounter')and game.Players.LocalPlayer.
Character:FindFirstChild('PlateCounter').Value or'0')..' ]')GravityYou:SetText('Gravity [ '..game.Workspace.Gravity..
' ]',true)PositionYou:SetText('Position In Your [ '..tostring(math.round(game.Players.LocalPlayer.Character.
HumanoidRootPart.Position.X)..', '..math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)..', '..
math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z))..' ]')end)end))J:AddButton('Copy Position',
function()if setclipboard then setclipboard(tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.
Position.X)..', '..math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)..', '..math.round(game.
Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)))Notification('Copied Success',_G.TimeNotify)else
Notification(tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X)..', '..math.round(game.
Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)..', '..math.round(game.Players.LocalPlayer.Character.
HumanoidRootPart.Position.Z)),_G.TimeNotify)end end)local K=Tabs.Tab:AddRightGroupbox('Search Glove Player')K:AddInput(
'GlovePlayers',{Default='',Numeric=false,Text='Search Glove',Finished=false,Placeholder='Glove',Callback=function(L)
local M=L local N for O,P in pairs(game.Workspace.Lobby.GloveStands:GetChildren())do if string.sub(P.Name,1,#M):lower()
==M:lower()then N=P break end end if N then _G.GlovePlayer=N.Name TagGlove:SetText('Glove Check [ \u{2705} ] [ '..N.Name
..' ]',_G.TimeNotify)else TagGlove:SetText('Glove Check [ \u{274c} ]',_G.TimeNotify)end end})TagGlove=K:AddLabel(
'Glove Search [ Nah ]',true)K:AddButton({Text='Search Glove',Func=function()_G.GloveSearch={}_G.PlayerOwner={}for L,M in
pairs(game.Players:GetChildren())do if M~=game.Players.LocalPlayer then for N,O in pairs(M._unlockedGloves:GetChildren()
)do if O.Name==_G.GlovePlayer and O.Value==true then table.insert(_G.GloveSearch,O)_G.PlayerOwner[#_G.PlayerOwner+1]=(M.
Name==M.DisplayName and' \u{2022} '..M.Name or' \u{2022} '..M.Name..' ('..M.DisplayName..')')OwnerPlayer:SetText(
'Owner [\n'..(_G.PlayerOwner==0 and'Nah'or(table.concat(_G.PlayerOwner,',\n')))..'\n]')end end end end if#_G.GloveSearch
>0 then SearchPlayer:SetText('Player Owner [ '..(#_G.GloveSearch==0 and'Nah'or#_G.GloveSearch)..' ]')elseif#_G.
GloveSearch==0 then SearchPlayer:SetText('Player Owner [ Nah ]')OwnerPlayer:SetText('Owner [ Nah ]')end end})K:
AddToggle('Search Glove',{Text='Auto Search Glove',Default=false,Callback=function(L)_G.AutoSearchGlove=L while _G.
AutoSearchGlove do _G.GloveSearch={}_G.PlayerOwner={}for M,N in pairs(game.Players:GetChildren())do if N~=game.Players.
LocalPlayer then for O,P in pairs(N._unlockedGloves:GetChildren())do if P.Name==_G.GlovePlayer and P.Value==true then
table.insert(_G.GloveSearch,P)_G.PlayerOwner[#_G.PlayerOwner+1]=(N.Name==N.DisplayName and' \u{2022} '..N.Name or
' \u{2022} '..N.Name..' ('..N.DisplayName..')')OwnerPlayer:SetText('Owner [\n'..(_G.PlayerOwner==0 and'Nah'or(table.
concat(_G.PlayerOwner,',\n')))..'\n]')end end end end if#_G.GloveSearch>0 then SearchPlayer:SetText('Player Owner [ '..(
#_G.GloveSearch==0 and'Nah'or#_G.GloveSearch)..' ]')elseif#_G.GloveSearch==0 then SearchPlayer:SetText(
'Player Owner [ Nah ]')OwnerPlayer:SetText('Owner [ Nah ]')end task.wait()end end})SearchPlayer=K:AddLabel(
'Player Owner [ Nah ]',true)OwnerPlayer=K:AddLabel('Owner [ Nah ]',true)local L=Tabs.Tab:AddRightGroupbox('Check')L:
AddInput('Players',{Default='',Numeric=false,Text='Player',Finished=true,Placeholder='Username',Callback=function(M)_G.
CheckPlayer=FoundPlr(M,false)if _G.CheckPlayer then PlayersCheck1:SetText('Player Check [ \u{2705} ] [ '.._G.CheckPlayer
.Name..' ]')else PlayersCheck1:SetText('Player Check [ \u{274c} ]')end end})PlayersCheck1=L:AddLabel(
'Player Check [ Nah ]',true)L:AddToggle('Toggle Set',{Text='Toggle Return',Default=false,Callback=function(M)_G.
AutosetCheckPlayer=M end})table.insert(_G.ConnectFun,game:GetService('RunService').RenderStepped:Connect(function()if
not _G.AutosetCheckPlayer then return end pcall(function()if _G.CheckPlayer.Character and game.ReplicatedStorage.
PlayerData:FindFirstChild(_G.CheckPlayer.Name)then CheckNullShardsPlayer:SetText('Check Null Shard [ '..game.
ReplicatedStorage.PlayerData[_G.CheckPlayer.Name].NullShards.Value..' ]')CheckTournamentWinsPlayer:SetText(
'Check Tournament Win [ '..game.ReplicatedStorage.PlayerData[_G.CheckPlayer.Name].TournamentWins.Value..' ]')
CheckSlapPlayer:SetText('Check Slap [ '..game.Players[_G.CheckPlayer.Name].leaderstats.Slaps.Value..' ]')
GloveCheckPlayer:SetText('Using Glove [ '..game.Players[_G.CheckPlayer.Name].leaderstats.Glove.Value..' ]')if game.
Players[_G.CheckPlayer].Character~=nil and game.Players[_G.CheckPlayer.Name].Character:FindFirstChild('HumanoidRootPart'
)~=nil then PositionPlayer:SetText('Position [ '..tostring(math.round(game.Players[_G.CheckPlayer.Name].Character.
HumanoidRootPart.Position.X)..', '..math.round(game.Players[_G.CheckPlayer].Character.HumanoidRootPart.Position.Y)..', '
..math.round(game.Players[_G.CheckPlayer].Character.HumanoidRootPart.Position.Z))..' ]')else PositionPlayer:SetText(
'Position [ Nah ]')end else CheckNullShardsPlayer:SetText('Check Null Shard [ Nah ]')CheckTournamentWinsPlayer:SetText(
'Check Tournament Win [ Nah ]')CheckSlapPlayer:SetText('Check Slap [ Nah ]')GloveCheckPlayer:SetText(
'Using Glove [ Nah ]')PositionPlayer:SetText('Position [ Nah ]')end end)end))CheckNullShardsPlayer=L:AddLabel(
'Check Null Shard [ Nah ]',true)CheckTournamentWinsPlayer=L:AddLabel('Check Tournament Win [ Nah ]',true)CheckSlapPlayer
=L:AddLabel('Check Slap [ Nah ]',true)GloveCheckPlayer=L:AddLabel('Using Glove [ Nah ]',true)PositionPlayer=L:AddLabel(
'Position [ Nah ]',true)local M=Tabs.Tab1:AddLeftGroupbox('Script Basic')M:AddButton({Text='Execute | Ui Library',Func=
function()loadstring(game:HttpGet(
[[https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/Executor.lua]]))()end})M:AddButton(
{Text='Keyboard',Func=function()loadstring(game:HttpGet(
[[https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt]],true))()end})M:AddButton({Text=
'Inf yield Delta',Func=function()loadstring(game:HttpGet(
[[https://gist.githubusercontent.com/lxnnydev/c533c374ca4c1dcef4e1e10e33fa4a0c/raw/03e74f184f801dad77d3ebe1e2f18c6ac87ca612/delta___IY.gistfile1.txt.lua]]
,true))()end})M:AddButton({Text='Inf yield',Func=function()loadstring(game:HttpGet((
[[https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source]]),true))()end})local N=Tabs.Tab1:
AddRightGroupbox('Script')N:AddButton({Text='Position Gui',Func=function()loadstring(game:HttpGet(
[[https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/Position.lua]],true))()end})N:
AddButton({Text='Dex V2',Func=function()loadstring(game:HttpGet('https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt')
)()wait(2)repeat task.wait()if game.Players.LocalPlayer.PlayerGui:FindFirstChild('Dex')and game.Players.LocalPlayer.
PlayerGui.Dex.ResetOnSpawn==true then game.Players.LocalPlayer.PlayerGui.Dex.ResetOnSpawn=false end until game.Players.
LocalPlayer.PlayerGui:FindFirstChild('Dex')and game.Players.LocalPlayer.PlayerGui.Dex.ResetOnSpawn==false end})N:
AddButton({Text='Dex V3',Func=function()loadstring(game:HttpGet(
[[https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua]],true))()end})N:
AddButton({Text='Dex V4',Func=function()loadstring(game:HttpGet(
[[https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/Dex-v4.lua]]))()end})N:AddButton({
Text='Simple Spy',Func=function()loadstring(game:HttpGet(
[[https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/SimpleSpy/SourceBeta.lua]]))()end})
local O=Tabs.Tab2:AddLeftGroupbox('Toggle All')_G.AntiToggles={}if game.Workspace:FindFirstChild('NoChanged')==nil then
Create('BoolValue',{Name='NoChanged',Parent=workspace})end _G.AntiToggles['Toggle Anti']=O:AddToggle('Toggle Anti',{Text
='Toggle Anti',Default=false,Callback=function(P)game.Workspace.NoChanged.Value=P end}):AddKeyPicker('ToggleAnti',{
Default='X',Text='Toggle Anti',Mode='Toggle',SyncToggleState=true})local P=Tabs.Tab2:AddRightGroupbox('Anti')P:
AddSlider('Transparency Anti Void',{Text='Transparency Anti Void',Default=0.5,Min=0,Max=1,Rounding=1,Compact=true,
Callback=function(Q)_G.Transparency=Q end})P:AddDropdown('Choose Anti Void',{Text='Choose Anti Void',Values={'Normal',
'Retro','Water','Psycho','Bob','Fall'},Default='',Multi=false,Callback=function(Q)_G.AntiVoidChoose=Q end})local Q=P:
AddDependencyBox()Q:AddButton({Text='Set Fall Pos',Visible=false,Func=function()if LoadSetFallPos then return end
LoadSetFallPos=true local R=game:GetService('Players')local S=R.LocalPlayer local T=S.Character if T and T:
FindFirstChild('HumanoidRootPart')then for U,V in pairs(workspace:GetChildren())do if V.Name=='Old Fall (Yourself)'then
V:Destroy()end end if not workspace:FindFirstChild('Old Fall (Yourself)')then local U=R:
GetHumanoidDescriptionFromUserId(S.UserId)local V=R:CreateHumanoidModelFromDescription(Instance.new(
'HumanoidDescription'),Enum.HumanoidRigType.R6)V.Name='Old Fall (Yourself)'V.Parent=workspace local W=T.HumanoidRootPart
local X=W.Position V:SetPrimaryPartCFrame(CFrame.new(X))V.Humanoid:ApplyDescription(U)end end task.wait(0.3)
LoadSetFallPos=false end})table.insert(_G.ConnectFun,game:GetService('RunService').RenderStepped:Connect(function()if
workspace:FindFirstChild('Old Fall (Yourself)')then for R,S in pairs(workspace:FindFirstChild('Old Fall (Yourself)'):
GetChildren())do if S:IsA('BasePart')then S.Anchored=true S.CanCollide=false S.Transparency=_G.Transparency or 0.7 end
end end end))Q:AddButton({Text='Destroy Fall Pos',Visible=false,Func=function()if game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')then for R,S in pairs(workspace:GetChildren())do if S.Name=='Old Fall (Yourself)'then
S:Destroy()end end end end})Q:SetupDependencies({{f['Choose Anti Void'],'Fall'}})function partapply(R,S)R.CanCollide=S
and true or false R.Transparency=S and _G.Transparency or 1 for T,U in ipairs(R:GetChildren())do if U:IsA('BasePart')
then U.CanCollide=S and true or false U.Transparency=S and _G.Transparency or 1 end end end function disable(R)if R:IsA(
'BasePart')then R.CanCollide=false R.Transparency=1 end end function disableChildren(R)for S,T in ipairs(R:
GetDescendants())do if T:IsA('BasePart')then disable(T)end end end _G.AntiToggles['Anti Void']=P:AddToggle('Anti Void',{
Text='Anti Void',Default=false,Callback=function(R)_G.AntiVoid=R while _G.AntiVoid do if game.Players.LocalPlayer.
Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y<-30 then
if _G.AntiVoidChoose=='Fall'then if workspace:FindFirstChild('Old Fall (Yourself)')and workspace['Old Fall (Yourself)']:
FindFirstChild('HumanoidRootPart')then FallCFrame=workspace['Old Fall (Yourself)'].HumanoidRootPart.CFrame else
FallCFrame=game.Workspace.Origo.CFrame*CFrame.new(0,-5,0)end game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(
FallCFrame)end end for S,T in ipairs(workspace:GetChildren())do if T.Name=='BobWalk1'and T:IsA('BasePart')then
partapply(T,_G.AntiVoidChoose:lower():find('bob'))end if T.Name=='Psycho'and T:IsA('BasePart')then partapply(T,_G.
AntiVoidChoose:lower():find('psycho'))if T:FindFirstChild('Kraken')then partapply(T.Kraken,_G.AntiVoidChoose:lower():
find('water'))end if T:FindFirstChild('Retro1')then partapply(T.Retro1,_G.AntiVoidChoose:lower():find('retro'))end end
if T.Name=='VoidPart'then partapply(T,_G.AntiVoidChoose=='Normal')if T:FindFirstChild('TAntiVoid')then partapply(T.
TAntiVoid,_G.AntiVoidChoose:lower():find('normal')or _G.AntiVoidChoose:lower():find('bob'))end end end task.wait()end
for S,T in ipairs(workspace:GetChildren())do if T.Name=='BobWalk1'then disable(T)disableChildren(T)end if T.Name==
'Psycho'then disable(T)if T:FindFirstChild('Kraken')then disable(T.Kraken)end if T:FindFirstChild('Retro1')then disable(
T.Retro1)disableChildren(T.Retro1)end end if T.Name=='VoidPart'then disable(T)if T:FindFirstChild('TAntiVoid')then
disable(T.TAntiVoid)end end end end})_G.AntiToggles['Anti Portal']=P:AddToggle('Anti Portal',{Text='Anti Portal',Default
=false,Callback=function(R)_G.AntiPortal=R if _G.AntiPortal==true then workspace.Lobby.Teleport2.CanTouch=false
workspace.Lobby.Teleport3.CanTouch=false workspace.Lobby.Teleport4.CanTouch=false workspace.Lobby.Teleport6.CanTouch=
false else workspace.Lobby.Teleport2.CanTouch=true workspace.Lobby.Teleport3.CanTouch=true workspace.Lobby.Teleport4.
CanTouch=true workspace.Lobby.Teleport6.CanTouch=true end end})_G.AntiToggles['Anti Admin']=P:AddToggle('Anti Admin',{
Text='Anti Admin',Default=false,Callback=function(R)_G.AntiMods=R while _G.AntiMods do for S,T in pairs(game.Players:
GetChildren())do if T:GetRankInGroupAsync(9950771)>=2 then _G.AntiKick=false game.Players.LocalPlayer:Kick(
'High Rank Player Detected.'..' [ '..T.Name..' ]')break end end task.wait()end end})_G.AntiToggles['Anti Kick']=P:
AddToggle('Anti Kick',{Text='Anti Kick',Default=false,Callback=function(R)_G.AntiKick=R while _G.AntiKick do for S,T in
pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetDescendants())do if T.Name=='ErrorPrompt'then game:GetService(
'TeleportService'):TeleportToPlaceInstance(game.PlaceId,game.JobId,game.Players.LocalPlayer)end end task.wait()end end})
_G.AntiToggles['Anti Afk']=P:AddToggle('Anti Afk',{Text='Anti Afk',Default=false,Callback=function(R)_G.AntiAfk=R if
getconnections then for S,T in next,getconnections(game.Players.LocalPlayer.Idled)do if _G.AntiAfk then T:Disable()else
T:Enable()end end end if not getconnections then if not AntiAfkConnect then AntiAfkConnect=game.Players.LocalPlayer.
Idled:Connect(function()if _G.AntiAfk then game:GetService('VirtualUser'):CaptureController()game:GetService(
'VirtualUser'):ClickButton2(Vector2.new())end end)end end end})_G.AntiToggles['Anti Obby']=P:AddToggle('Anti Obby',{Text
='Anti Obby',Default=false,Callback=function(R)_G.AntiObby=R while _G.AntiObby do for S,T in pairs(game.Workspace:
GetChildren())do if string.find(T.Name,'Lava')then if T.CanTouch==true then T.CanTouch=false end end end task.wait()end
if _G.AntiObby==false then for S,T in pairs(game.Workspace:GetChildren())do if string.find(T.Name,'Lava')then if T.
CanTouch==false then T.CanTouch=true end end end end end})_G.AntiToggles['Anti Megarock']=P:AddToggle('Anti Megarock',{
Text='Anti Megarock | Custom',Default=false,Callback=function(R)_G.AntiRock=R while _G.AntiRock do for S,T in pairs(game
.Players:GetChildren())do if T.Character and T.Character:FindFirstChild('rock')then T.Character.rock.CanTouch=false T.
Character.rock.CanQuery=false end end task.wait()end end})_G.AntiToggles['Anti Cherry']=P:AddToggle('Anti Cherry',{Text=
'Anti Cherry',Default=false,Callback=function(R)_G.AntiCherry=R while _G.AntiCherry do if workspace:FindFirstChild(
'cherry_storage')then for S,T in pairs(workspace.cherry_storage:GetChildren())do if not T.Name:match(game.Players.
LocalPlayer.Name)and T:FindFirstChild('clone_remote')and T:FindFirstChild('HumanoidRootPart')then slapglove(T:
FindFirstChild('HumanoidRootPart'))end end end task.wait()end end})_G.AntiToggles['Anti Spam Bypass']=P:AddToggle(
'Anti Spam Bypass',{Text='Anti Spam Bypass (Chainsaw)',Default=false,Callback=function(R)if R and CheckExecutorSupport
and not CheckExecutorSupport('namecall_hook','Anti Spam Bypass')then getgenv().AntiSpamBypass=false return end getgenv()
.AntiSpamBypass=R if getgenv().RefreshSlapNamecallHook then getgenv().RefreshSlapNamecallHook()end end})_G.AntiToggles[
'Anti Piano']=P:AddToggle('Anti Piano',{Text='Anti Piano',Default=false,Callback=function(R)if CheckExecutorSupport and
CheckExecutorSupport('namecall_hook',nil,true)then if R and not CheckExecutorSupport('namecall_hook','Anti Piano')then
getgenv().AntiPiano=false return end getgenv().AntiPiano=R if getgenv().RefreshSlapNamecallHook then getgenv().
RefreshSlapNamecallHook()end end if not CheckExecutorSupport or not CheckExecutorSupport('namecall_hook',nil,true)then
local S=game:GetService('ReplicatedStorage'):FindFirstChild('Piano')or game:GetService('ReplicatedStorage'):
FindFirstChild('_Piano_')if S then S.Name=R and'_Piano_'or'Piano'end end end})_G.AntiToggles['Anti Boss Guide']=P:
AddToggle('Anti Boss Guide',{Text='Anti Join Boss Guide',Default=false,Callback=function(R)_G.AntiJoinBossGuide=R while
_G.AntiJoinBossGuide do for S,T in pairs(workspace.BountyHunterRoom.Build:GetChildren())do if T.Name=='Model'and T:
FindFirstChild('Meshes/boxshadow_Cube.005')and T['Meshes/boxshadow_Cube.005']:FindFirstChild('Hitbox')then T[
'Meshes/boxshadow_Cube.005'].Hitbox.CanTouch=false end end task.wait()end end})_G.AntiToggles['Anti Snowball']=P:
AddToggle('Anti Snowball',{Text='Anti Snowball',Default=false,Callback=function(R)_G.AntiSnowball=R while _G.
AntiSnowball do for S,T in pairs(workspace:GetChildren())do if T.Name=='Snowball'then T:Destroy()end end task.wait()end
end})_G.AntiToggles['Anti Ball Baller']=P:AddToggle('Anti Ball Baller',{Text='Anti Ball Baller',Default=false,Callback=
function(R)_G.AntiBallBaller=R while _G.AntiBallBaller do for S,T in pairs(game.Workspace:GetChildren())do if T.Name==
'ClonedBall'then T:Destroy()end end task.wait()end end})_G.AntiToggles['Anti Venom Infected']=P:AddToggle(
'Anti Venom Infected',{Text='Anti Is Ice',Default=false,Callback=function(R)_G.AntiVenomInfected=R while _G.
AntiVenomInfected do for S,T in pairs(game.Workspace:GetChildren())do if T.Name=='is_ice'then T.CanTouch=false end end
task.wait()end end})_G.AntiToggles['Anti Ghost Player']=P:AddToggle('Anti Ghost Player',{Text='Anti Ghost Player',
Default=false,Callback=function(R)_G.AntiGhostPlayer=R while _G.AntiGhostPlayer do for S,T in pairs(game.Players:
GetChildren())do if T~=game.Players.LocalPlayer.Name and game.Workspace:FindFirstChild(T.Name..'_Body')and game.
Workspace[T.Name..'_Body']:FindFirstChild('Part')then slapglove(game.Workspace[T.Name..'_Body'].Part)end end task.wait()
end end})_G.AntiToggles['Anti Trap']=P:AddToggle('Anti Trap',{Text='Anti Trap',Default=false,Callback=function(R)_G.
AntiTrap=R while _G.AntiTrap do for S,T in pairs(game.Workspace:GetChildren())do if T.Name=='BearTrap'and T:
FindFirstChild('HitBox')then T.HitBox.CanTouch=false T.HitBox.CanQuery=false end end task.wait()end end})_G.AntiToggles[
'Anti Paint Splash']=P:AddToggle('Anti Paint Splash',{Text='Anti Paint Splash',Default=false,Callback=function(R)_G.
AntiPaintSplash=R while _G.AntiPaintSplash do for S,T in pairs(game.Workspace:GetChildren())do if string.find(T.Name:
lower(),'paint')then T.CanTouch=false T.CanQuery=false end end task.wait()end end})_G.AntiToggles['Anti Tycoon Mastery']
=P:AddToggle('Anti Tycoon Mastery',{Text='Anti Tycoon Kill Brick',Default=false,Callback=function(R)_G.AntiTycoonMatery=
R while _G.AntiTycoonMatery do for S,T in pairs(game.Workspace:GetChildren())do if string.find(T.Name:lower(),'tycoon')
and not T.Name:match(game.Players.LocalPlayer.Name)and T:FindFirstChild('Building')then for U,V in pairs(T:
GetDescendants())do if V.Name:lower():find('killbrick')or V.Name:lower():find('doorbeam')then V.CanTouch=false V.
CanQuery=false end end end end task.wait(0.3)end end})_G.AntiToggles['Anti Lure']=P:AddToggle('Anti Lure',{Text=
'Anti Lure',Default=false,Callback=function(R)_G.AntiLure=R while _G.AntiLure do local function foundlurechar()local S
for T,U in pairs(game.Players.LocalPlayer.Character:GetChildren())do if U.Name:lower():find('lure')then S=U end end
return S end for S,T in pairs(game.Workspace:GetChildren())do if string.find(T.Name,'_lure')and T:FindFirstChild('Root')
and T:FindFirstChild('watercircle')and foundlurechar()then local U=game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=T.Root.CFrame wait(0.5)game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=U wait(0.5)end end task.wait()end end})_G.AntiToggles['Anti Mail']=P:AddToggle(
'Anti Mail',{Text='Anti Mail',Default=false,Callback=function(R)game.Players.LocalPlayer.Character.YouHaveGotMail.
Disabled=R _G.AntiMail=R while _G.AntiMail do if game.Players.LocalPlayer.Character:FindFirstChild('YouHaveGotMail')then
game.Players.LocalPlayer.Character.YouHaveGotMail.Disabled=true end task.wait()end end})_G.AntiToggles['Anti Water']=P:
AddToggle('Anti Water',{Text='Anti Water',Default=false,Callback=function(R)_G.AntiWater=R while _G.AntiWater do if game
.Workspace:FindFirstChild('puddles')then for S,T in pairs(game.Workspace.puddles:GetChildren())do if T.Name=='puddle'
then T.CanTouch=false end end end task.wait()end end})_G.AntiToggles['Anti Jail Admin']=P:AddToggle('Anti Jail Admin',{
Text='Anti Jail Admin',Default=false,Callback=function(R)_G.AntiJailAdmin=R while _G.AntiJailAdmin do for S,T in pairs(
game.Workspace:GetChildren())do if T.Name=='jail'then for U,V in pairs(T:GetChildren())do if V:IsA('BasePart')then V.
CanCollide=false end end end end task.wait()end end})_G.AntiToggles['Anti Mitten Blind']=P:AddToggle('Anti Mitten Blind'
,{Text='Anti Mitten Blind',Default=false,Callback=function(R)_G.AntiMittenBlind=R while _G.AntiMittenBlind do if game.
Players.LocalPlayer.PlayerGui:FindFirstChild('MittenBlind')then game.Players.LocalPlayer.PlayerGui:FindFirstChild(
'MittenBlind'):Destroy()end task.wait()end end})_G.AntiToggles['Anti Knockoff']=P:AddToggle('Anti Knockoff',{Text=
'Anti Knockoff',Default=false,Callback=function(R)_G.AntiKnock=R while _G.AntiKnock do if game.Workspace.CurrentCamera
and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')and game.
Workspace.CurrentCamera.CameraSubject~=game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')and game.
Workspace.CurrentCamera.CameraSubject==game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s_falsehead")then
game.Workspace.CurrentCamera.CameraSubject=game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')end task.
wait()end end})_G.AntiToggles['Anti Hallow']=P:AddToggle('Anti Hallow',{Text='Anti Hallow - Jack',Default=false,Callback
=function(R)if game.Players.LocalPlayer:FindFirstChild('PlayerScripts'):FindFirstChild('LegacyClient')and game.Players.
LocalPlayer.PlayerScripts.LegacyClient:FindFirstChild('HallowJackAbilities')then game.Players.LocalPlayer.PlayerScripts.
LegacyClient.HallowJackAbilities.Disabled=R end end})_G.AntiToggles['Anti Booster']=P:AddToggle('Anti Booster',{Text=
'Anti Booster',Default=false,Callback=function(R)_G.AntiBooster=R while _G.AntiBooster do for S,T in pairs(game.Players.
LocalPlayer.Character:GetDescendants())do if T.Name=='BoosterObject'then T:Destroy()end end task.wait()end end})_G.
AntiToggles['Anti Squid']=P:AddToggle('Anti Squid',{Text='Anti Squid',Default=false,Callback=function(R)_G.AntiSquid=R
if _G.AntiSquid==false then game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled=true end while _G.AntiSquid do if game.
Players.LocalPlayer.PlayerGui:FindFirstChild('SquidInk')then game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled=false
end task.wait()end end})_G.AntiToggles['Anti Lamp']=P:AddToggle('Anti Lamp',{Text='Anti Lamp',Default=false,Callback=
function(R)_G.AntiLamp=R while _G.AntiLamp do for S,T in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren())do if T.
Name:find('whiteframe')then T.Enabled=false end end for S,T in pairs(game.Lighting:GetChildren())do if T.Name:find(
'lampcc')then T.Enabled=false end end task.wait()end end})_G.AntiToggles['Anti Pie']=P:AddToggle('Anti Pie',{Text=
'Anti Pie',Default=false,Callback=function(R)_G.AntiPie=R while _G.AntiPie do if game.Players.LocalPlayer.PlayerGui:
FindFirstChild('PieSplash')then game.Players.LocalPlayer.PlayerGui:FindFirstChild('PieSplash'):Destroy()end task.wait()
end end})_G.AntiToggles['Anti Conveyor']=P:AddToggle('Anti Conveyor',{Text='Anti Conveyor',Default=false,Callback=
function(R)if game.Players.LocalPlayer:FindFirstChild('PlayerScripts'):FindFirstChild('LegacyClient')and game.Players.
LocalPlayer.PlayerScripts.LegacyClient:FindFirstChild('ConveyorVictimized')then game.Players.LocalPlayer.PlayerScripts.
LegacyClient.ConveyorVictimized.Disabled=R end end})_G.AntiToggles['Anti Ice']=P:AddToggle('Anti Ice',{Text='Anti Ice',
Default=false,Callback=function(R)_G.AntiIce=R while _G.AntiIce do for S,T in pairs(game.Players.LocalPlayer.Character:
GetChildren())do if T.Name=='Icecube'then T:Destroy()if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')
then game.Players.LocalPlayer.Character.Humanoid.PlatformStand=false game.Players.LocalPlayer.Character.Humanoid.
AutoRotate=true end end end task.wait()end end})_G.AntiToggles['Anti Time Stop']=P:AddToggle('Anti Time Stop',{Text=
'Anti Time Stop',Default=false,Callback=function(R)_G.AntiTimestop=R while _G.AntiTimestop do for S,T in pairs(game.
Players.LocalPlayer.Character:GetChildren())do if T.ClassName=='Part'then T.Anchored=false end end task.wait()end end})
_G.AntiToggles['Anti Null']=P:AddToggle('Anti Null',{Text='Anti Null',Default=false,Callback=function(R)_G.AntiNull=R
while _G.AntiNull do for S,T in pairs(game.Workspace:GetChildren())do if T.Name=='Imp'and T:FindFirstChild('Body')then
slapglove(T:FindFirstChild('Body'))end end task.wait()end end})_G.AntiToggles['Anti Run']=P:AddToggle('Anti Run',{Text=
'Anti Run',Default=false,Callback=function(R)_G.AutoExit=R while _G.AutoExit do if game.Players.LocalPlayer.Character:
FindFirstChild('InLabyrinth')then for S,T in pairs(workspace:GetChildren())do if string.find(T.Name,'Labyrinth')and T:
FindFirstChild('Doors')then for U,V in ipairs(T.Doors:GetChildren())do if V:FindFirstChild('Hitbox')and V.Hitbox:
FindFirstChild('TouchInterest')then V.Hitbox.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end end
end end end task.wait()end end})_G.AntiToggles['Anti Record']=P:AddToggle('Anti Record',{Text='Anti Record (Chat)',
Default=false,Callback=function(R)_G.AntiRecord=R end})local function findRec(R)if R~=game.Players.LocalPlayer then R.
Chatted:Connect(function(S)Words=S:split(' ')if _G.AntiRecord==true then for T,U in pairs(Words)do if U:lower():match(
'recording')or U:lower():match(' rec')or U:lower():match('record')or U:lower():match('discor')or U:lower():match(
' disco')or U:lower():match(' disc')or U:lower():match('ticket')or U:lower():match('tickets')or U:lower():match(' ds')or
U:lower():match(' dc')or U:lower():match('dizzy')or U:lower():match('dizzycord')or U:lower():match(' clip')or U:lower():
match('proof')or U:lower():match('evidence')then g['Anti Kick']:SetValue(false)game.Players.LocalPlayer:Kick(
'Possible player recording detected.'..' [ '..R.Name..' ] [ '..S..' ]')end end end end)end end for R,S in pairs(game.
Players:GetChildren())do findRec(S)end game.Players.PlayerAdded:Connect(function(R)findRec(R)end)_G.AntiToggles[
'Anti REDACTED']=P:AddToggle('Anti REDACTED',{Text='Anti [REDACTED]',Default=false,Callback=function(R)if game.Players.
LocalPlayer:FindFirstChild('PlayerScripts'):FindFirstChild('LegacyClient')and game.Players.LocalPlayer.PlayerScripts.
LegacyClient:FindFirstChild('Well')then game.Players.LocalPlayer.PlayerScripts.LegacyClient.Well.Disabled=R end end})_G.
AntiToggles['Anti Brazil']=P:AddToggle('Anti Brazil',{Text='Anti Brazil',Default=false,Callback=function(R)_G.AntiBrazil
=R while _G.AntiBrazil do for S,T in pairs(game.workspace.Lobby.brazil:GetChildren())do if T.CanTouch==true then T.
CanTouch=false end end task.wait()end if _G.AntiBrazil==false then for S,T in pairs(game.workspace.Lobby.brazil:
GetChildren())do if T.CanTouch==false then T.CanTouch=true end end end end})_G.AntiToggles['Anti Za Hando']=P:AddToggle(
'Anti Za Hando',{Text='Anti Za Hando',Default=false,Callback=function(R)_G.AntiZaHando=R while _G.AntiZaHando do for S,T
in pairs(game.Workspace:GetChildren())do if T.Name=='Part'and not(T:FindFirstChild('brownsmoke')and T:FindFirstChild(
'Sound'))then T:Destroy()end end task.wait()end end})_G.AntiToggles['Anti Bob']=P:AddToggle('Anti Bob',{Text='Anti Bob',
Default=false,Callback=function(R)_G.AntiBob=R while _G.AntiBob do for S,T in pairs(game.Workspace:GetChildren())do if
string.find(T.Name:lower(),'bob_')and T:FindFirstChild('HumanoidRootPart')and T:FindFirstChild('Target')and T.Target.
Value==game.Players.LocalPlayer.Name then if IsNetworkOwner(T.HumanoidRootPart)then if firetouchinterest then
firetouchinterest(T.HumanoidRootPart,workspace.Arena.CubeOfDeathArea['the cube of death(i heard it kills)'],0)
firetouchinterest(T.HumanoidRootPart,workspace.Arena.CubeOfDeathArea['the cube of death(i heard it kills)'],1)end T.
HumanoidRootPart:PivotTo(workspace.Arena.CubeOfDeathArea['the cube of death(i heard it kills)'].Part.CFrame)end end end
task.wait()end end})_G.AntiToggles['Anti Iceskate']=P:AddToggle('Anti Iceskate',{Text='Anti Ice Skate',Default=false,
Callback=function(R)_G.AntiIceskate=R while _G.AntiIceskate do if workspace:FindFirstChild('IceBin')then for S,T in
pairs(workspace.IceBin:GetChildren())do if T:IsA('BasePart')then T:Destroy()end end end task.wait()end end})_G.
AntiToggles['Anti Mouse Trap']=P:AddToggle('Anti Iceskate',{Text='Anti Mouse Trap',Default=false,Callback=function(R)_G.
AntiMouseTrap=R while _G.AntiMouseTrap do for S,T in pairs(workspace:GetChildren())do if T.Name:lower()=='mouse trap'and
T:FindFirstChild('Hitbox')then T:FindFirstChild('Hitbox').CanTouch=false T:FindFirstChild('Hitbox').CanQuery=false end
end task.wait()end end})_G.AntiToggles['Anti Fort']=P:AddToggle('Anti Fort',{Text='Anti Fort',Default=false,Callback=
function(R)_G.AntiFort=R while _G.AntiFort do for S,T in pairs(game.Workspace:GetChildren())do if T.Name=='Part'and T:
FindFirstChild('brownsmoke')and T:FindFirstChild('Sound')then T.CanCollide=false end end task.wait()end end})_G.
AntiToggles['Anti Pusher']=P:AddToggle('Anti Pusher',{Text='Anti Pusher',Default=false,Callback=function(R)_G.AntiPusher
=R while _G.AntiPusher do for S,T in pairs(game.Workspace:GetChildren())do if T.Name=='wall'then T.CanCollide=false end
end task.wait()end end})_G.AntiToggles['Anti Defend']=P:AddToggle('Anti Defend',{Text='Anti Defend',Default=false,
Callback=function(R)_G.NoclipBarrier=R if _G.NoclipBarrier==false then for S,T in pairs(game.Workspace:GetChildren())do
if string.find(T.Name,'\u{c5}Barrier')and T.CanCollide==false then T.CanCollide=true end end end while _G.NoclipBarrier
do for S,T in pairs(game.Workspace:GetChildren())do if string.find(T.Name,'\u{c5}Barrier')and T.CanCollide==true then T.
CanCollide=false end end task.wait()end end})_G.AntiToggles['Anti Bubble']=P:AddToggle('Anti Bubble',{Text='Anti Bubble'
,Default=false,Callback=function(R)_G.AntiBubble=R while _G.AntiBubble do for S,T in pairs(workspace:GetChildren())do if
T.Name=='BubbleObject'and T:FindFirstChildOfClass('Weld')then T:FindFirstChildOfClass('Weld'):Destroy()end end task.
wait()end end})_G.AntiToggles['Anti Pylon']=P:AddToggle('Anti Pylon',{Text='Anti Pylon',Default=false,Callback=function(
R)_G.AntiPylon=R while _G.AntiPylon do for S,T in pairs(workspace:GetChildren())do if T.Name=='Pylon'and T:
FindFirstChild('OwningPlayer')and T.OwningPlayer.Value~=game.Players.LocalPlayer.Name then if T:FindFirstChild('Hitbox')
then T:FindFirstChild('Hitbox'):Destroy()end end end task.wait()end end})_G.AntiToggles['Anti Pile']=P:AddToggle(
'Anti Pile',{Text='Anti Pile',Default=false,Callback=function(R)_G.AntiPile=R while _G.AntiPile do for S,T in pairs(
workspace:GetChildren())do if T.Name:find('Pile')and T.CanTouch==true then T.CanTouch=false end end task.wait()end end})
_G.AntiToggles['Anti Stun']=P:AddToggle('Anti Stun',{Text='Anti Stun',Default=false,Callback=function(R)_G.AntiStun=R
while _G.AntiStun do if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Workspace:FindFirstChild(
'Shockwave')and game.Players.LocalPlayer.Character.Ragdolled.Value==false then game.Players.LocalPlayer.Character.
Humanoid.PlatformStand=false end task.wait()end end})_G.AntiToggles['Anti COD']=P:AddToggle('Anti COD',{Text=
'Anti Cube Of Death',Default=false,Callback=function(R)_G.AntiCod=R while _G.AntiCod do if game.Workspace:
FindFirstChild('the cube of death(i heard it kills)',1)and game.Workspace.Arena.CubeOfDeathArea[
'the cube of death(i heard it kills)']:FindFirstChild('Part')then game.Workspace.Arena.CubeOfDeathArea[
'the cube of death(i heard it kills)'].CanTouch=false game.Workspace.Arena.CubeOfDeathArea[
'the cube of death(i heard it kills)'].Part.CanTouch=false end task.wait()end if game.Workspace:FindFirstChild(
'the cube of death(i heard it kills)',1)and game.Workspace.Arena.CubeOfDeathArea['the cube of death(i heard it kills)']:
FindFirstChild('Part')then game.Workspace.Arena.CubeOfDeathArea['the cube of death(i heard it kills)'].CanTouch=true
game.Workspace.Arena.CubeOfDeathArea['the cube of death(i heard it kills)'].Part.CanTouch=true end end})_G.AntiToggles[
'Anti Death Barriers']=P:AddToggle('Anti Death Barriers',{Text='Anti Death Barriers',Default=false,Callback=function(R)
_G.AntiDead=R while _G.AntiDead do if game.Workspace:FindFirstChild('DEATHBARRIER')then workspace.DEATHBARRIER.CanTouch=
not R for S,T in pairs(game.Workspace.DEATHBARRIER:GetChildren())do if T.ClassName=='Part'and T.Name=='BLOCK'then T.
CanTouch=not R end end end workspace.DEATHBARRIER2.CanTouch=not R workspace.dedBarrier.CanTouch=not R workspace.
ArenaBarrier.CanTouch=not R workspace.AntiDefaultArena.CanTouch=not R task.wait()end if game.Workspace:FindFirstChild(
'DEATHBARRIER')then workspace.DEATHBARRIER.CanTouch=true for S,T in pairs(game.Workspace.DEATHBARRIER:GetChildren())do
if T.ClassName=='Part'and T.Name=='BLOCK'then T.CanTouch=true end end end workspace.DEATHBARRIER2.CanTouch=true
workspace.dedBarrier.CanTouch=true workspace.ArenaBarrier.CanTouch=true workspace.AntiDefaultArena.CanTouch=true end})P:
AddDropdown('Anti RagdollV',{Text='Anti Ragdoll',Values={'V0.5','V1','V2','V3'},Default='',Multi=false,Callback=function
(R)_G.AntiRagdolledV=R end})_G.AntiToggles['Anti Ragdoll']=P:AddToggle('Anti Ragdoll',{Text='Anti Ragdoll',Default=false
,Callback=function(R)_G.AntiRagdoll=R if R==false then if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild('AntiRagBV')then game.Players.
LocalPlayer.Character.HumanoidRootPart:FindFirstChild('AntiRagBV'):Destroy()end if game.Players.LocalPlayer.Character:
FindFirstChild('Torso')then game.Players.LocalPlayer.Character.Torso.Anchored=false end end end})table.insert(_G.
ConnectFun,game:GetService('RunService').RenderStepped:Connect(function()if _G.AntiRagdoll then if game.Players.
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid'
)then if game.Players.LocalPlayer.Character:FindFirstChild('Ragdolled')and game.Players.LocalPlayer.Character:
WaitForChild('Ragdolled').Value==true then for R,S in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:
GetChildren())do if S:IsA('BodyVelocity')or S:IsA('VectorForce')or S:IsA('LinearVelocity')or S:IsA('BodyGyro')or S:IsA(
'BodyAngularVelocity')then if not(S.Name=='AntiRagBV'or S.Name=='GyroHandler'or S.Name=='VelocityHandler'or S.Name==
'FreezeBV'or S.Name=='HelpMasteryFreezeBv')then S:Destroy()end end end if _G.AntiRagdolledV=='V1'then if game.Players.
LocalPlayer.Character:FindFirstChild('Torso')then game.Players.LocalPlayer.Character.Torso.Anchored=true end end if _G.
AntiRagdolledV=='V2'then if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.Players.
LocalPlayer.Character.HumanoidRootPart:FindFirstChild('AntiRagBV')==nil then CreateFreezeBV({Name='AntiRagBV'})end end
if _G.AntiRagdolledV=='V3'then local R=game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.
LocalPlayer.Character.Humanoid.MoveDirection if R and R.Magnitude>0 then game.Players.LocalPlayer.Character:
FindFirstChild('Humanoid'):Move(R,false)end if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')then game.
Players.LocalPlayer.Character:FindFirstChild('Humanoid'):ChangeState(Enum.HumanoidStateType.Running)end for S,T in
ipairs(game.Players.LocalPlayer.Character:GetDescendants())do if T:IsA('Motor6D')then T.Enabled=true elseif T:IsA(
'BallSocketConstraint')or T:IsA('HingeConstraint')then T.Enabled=false end end end elseif game.Players.LocalPlayer.
Character:WaitForChild('Ragdolled').Value==false then hasBounced=false CreateFreezeBV({Remove=true,Name='AntiRagBV'})if
game.Players.LocalPlayer.Character:FindFirstChild('Torso')then game.Players.LocalPlayer.Character.Torso.Anchored=false
end end end end end))local R=Tabs.Tab3:AddLeftGroupbox('Teleport / Show')R:AddDropdown('Teleport Safe',{Text=
'Teleport Safe',Values={'SafeSpotBox 1.0','SafeSpotBox 2.0','Bed'},Default='',Multi=false,Callback=function(S)if S==
'SafeSpotBox 1.0'then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(
0,5,0)elseif S=='SafeSpotBox 2.0'then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['Safespot'].
CFrame*CFrame.new(0,10,0)elseif S=='Bed'then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['Bed']
.Bed3.CFrame*CFrame.new(0,0,-1)end end})R:AddDropdown('Retro Obby',{Text='Retro Obby',Values={'Get Badge','Show All',
'Off Show All','Teleport Spawn 1','Teleport Spawn 2','Teleport Spawn 3','Click Button'},Default='',Multi=false,Callback=
function(S)if S=='Get Badge'then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.FinishDoor_Retro.
Part.CFrame elseif S=='Show All'then if game.ReplicatedStorage.Assets:FindFirstChild('Retro')then game.ReplicatedStorage
.Assets.Retro.Parent=game.Workspace end elseif S=='Off Show All'then if game.Workspace:FindFirstChild('Retro')then game.
Workspace.Retro.Parent=game.ReplicatedStorage:FindFirstChild('Assets')end elseif S=='Teleport Spawn 1'then if game.
Workspace:FindFirstChild('Retro')and game.Workspace.Retro:FindFirstChild('Map')and game.Workspace.Retro.Map:
FindFirstChild('RetroObbyMap')and game.Workspace.Retro.Map.RetroObbyMap:FindFirstChild('Spawn')then game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace.Retro.Map.RetroObbyMap.Spawn.CFrame end elseif S==
'Teleport Spawn 2'then if game.Workspace:FindFirstChild('Retro')and game.Workspace.Retro:FindFirstChild('Map')and game.
Workspace.Retro.Map:FindFirstChild('RetroObbyMap')and game.Workspace.Retro.Map.RetroObbyMap:FindFirstChild(
'Spawn_stage2')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace.Retro.Map.RetroObbyMap.
Spawn_stage2.CFrame end elseif S=='Teleport Spawn 3'then if game.Workspace:FindFirstChild('Retro')and game.Workspace.
Retro:FindFirstChild('Map')and game.Workspace.Retro.Map:FindFirstChild('RetroObbyMap')and game.Workspace.Retro.Map.
RetroObbyMap:FindFirstChild('Spawn_stage3')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.
Workspace.Retro.Map.RetroObbyMap.Spawn_stage3.CFrame end elseif S=='Click Button'then repeat task.wait()if game.
ReplicatedStorage:FindFirstChild('Assets')and game.ReplicatedStorage.Assets:FindFirstChild('Retro')then game.
ReplicatedStorage.Assets.Retro.Parent=game.Workspace end until game.Workspace:FindFirstChild('Retro')and game.Workspace.
Retro:FindFirstChild('Map')wait(1.5)if game.Workspace:FindFirstChild('Retro')and game.Workspace.Retro:FindFirstChild(
'Map')then for T,U in pairs(workspace.Retro.Map.RetroObbyMap:GetChildren())do if U.Name=='Model'and U:FindFirstChild(
'StaffApp')and U.StaffApp:FindFirstChild('Button')and U.StaffApp.Button:FindFirstChild('ClickDetector')then game.Players
.LocalPlayer.Character.HumanoidRootPart.CFrame=U.StaffApp.Button.CFrame wait(0.3)fireclickdetector(U.StaffApp.Button.
ClickDetector)end end end end end})R:AddDropdown('Repressed Memory',{Text='Repressed Memory',Values={'Show All',
'Off Show All','Teleport Enter','Teleport Portal','Teleport Bob Plushie','Click Bob Plushie'},Default='',Multi=false,
Callback=function(S)if S=='Show All'then if game.ReplicatedStorage:FindFirstChild('RepressedMemoriesMap')then game.
ReplicatedStorage.RepressedMemoriesMap.Parent=game.Workspace end elseif S=='Off Show All'then if game.Workspace:
FindFirstChild('RepressedMemoriesMap')then game.Workspace.RepressedMemoriesMap.Parent=game.ReplicatedStorage end elseif
S=='Teleport Enter'then if game.Workspace:FindFirstChild('RepressedMemoriesMap')then game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=game.Workspace.RepressedMemories.Limbo.CFrame*CFrame.new(0,-5,0)end elseif S=='Teleport Portal'
then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace.RepressedMemories.SimonSaysGate.Portal.
CFrame elseif S=='Teleport Bob Plushie'then if game.Workspace:FindFirstChild('RepressedMemoriesMap')then game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace.RepressedMemories._ugcQuestObjectBobPlushie.Handle.CFrame
elseif game.ReplicatedStorage:FindFirstChild('RepressedMemoriesMap')then game.ReplicatedStorage.RepressedMemoriesMap.
Parent=game.Workspace wait(1.5)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace.
RepressedMemories._ugcQuestObjectBobPlushie.Handle.CFrame end elseif S=='Click Bob Plushie'then repeat task.wait()if
game.ReplicatedStorage:FindFirstChild('RepressedMemoriesMap')then game.ReplicatedStorage.RepressedMemoriesMap.Parent=
game.Workspace end until game.Workspace:FindFirstChild('RepressedMemoriesMap')wait(1)if game.Workspace:FindFirstChild(
'RepressedMemoriesMap')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace.RepressedMemories.
_ugcQuestObjectBobPlushie.Handle.CFrame wait(0.5)fireclickdetector(workspace.RepressedMemories._ugcQuestObjectBobPlushie
.ClickDetector)end wait(2)if game.Workspace:FindFirstChild('RepressedMemoriesMap')then game.Workspace.
RepressedMemoriesMap.Parent=game.ReplicatedStorage end end end})R:AddDropdown('Map Kraken',{Text='Map Kraken',Values={
'Show All','Off Show All','Teleport Enter'},Default='',Multi=false,Callback=function(S)if S=='Show All'then if game.
ReplicatedStorage:FindFirstChild('AbyssAssets')and game.ReplicatedStorage.AbyssAssets:FindFirstChild('Abyss')then game.
ReplicatedStorage.AbyssAssets.Abyss.Parent=game.Workspace end elseif S=='Off Show All'then if game.Workspace:
FindFirstChild('Abyss')then game.Workspace.Abyss.Parent=game.ReplicatedStorage:FindFirstChild('AbyssAssets')end elseif S
=='Teleport Enter'then if game.Workspace:FindFirstChild('Abyss')then game.Players.LocalPlayer.Character.HumanoidRootPart
.CFrame=game.Workspace.Abyss.Spawn.CFrame*CFrame.new(0,10,0)end end end})local S=Tabs.Tab3:AddLeftGroupbox('Badge Auto')
S:AddDropdown('Map Kraken',{Text='Badge Auto Get',Values={'Boxing','Doorkeeper','Bind','Lotus','Conker','FrostBite',
'Plate','Plunger','Admin','Chain','Riftshot','Fan','Reflect','Fight Guide','Counter + Elude'},Default='',Multi=false,
Callback=function(T)_G.AutoGetBadgeGlove=T end})S:AddButton({Text='Auto Get Badge',Func=function()local T=
queueonteleport or queue_on_teleport if T then local U=
'\r\nif not game:IsLoaded() then\r\n    game.Loaded:Wait()\r\nend\r\nrepeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")\r\n_G.AutoGetBadgeGlove = "__Glove__"\r\ntask.wait(2)\r\npcall(function()\r\n    Fixed = loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/Fix.lua"))()\r\n    fireclickdetector = fireclickdetector or Fixed.fireclickdetector\r\n    fireproximityprompt = fireproximityprompt or Fixed.fireproximityprompt\r\nend)\r\nlocal Players = game:GetService("Players")\r\nlocal Virtual = game:GetService("VirtualUser")\r\nlocal ReplicatedStorage = game:GetService("ReplicatedStorage")\r\nlocal LocalPlayer = Players.LocalPlayer\r\nlocal PlayerGui = LocalPlayer.PlayerGui\r\nlocal Backpack = LocalPlayer.Backpack\r\nlocal Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()\r\nlocal Root = Character:WaitForChild("HumanoidRootPart")\r\n\r\nLocalPlayer.CharacterAdded:Connect(function()\r\n    Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()\r\n    Root = Character:WaitForChild("HumanoidRootPart")\r\nend)\r\n\r\nlocal function TP(cf)\r\n    if Root then\r\n        Root.CFrame = cf\r\n    end\r\nend\r\n\r\nlocal function fire(object, data)\r\n    local datafire = {\r\n        fireclick = data.fireclick or false,\r\n        firetouch = data.firetouch or false,\r\n        fireprompt = data.fireprompt or false,\r\n    }\r\n        \r\n    if datafire.fireclick and fireclickdetector then\r\n        local objectFindClick = object:IsA("ClickDetector") and object or object:FindFirstChildWhichOfClass("ClickDetector", true)\r\n        if objectFindClick then\r\n            fireclickdetector(objectFindClick, 0)\r\n            fireclickdetector(objectFindClick, 1)\r\n        end\r\n    end\r\n    if datafire.firetouch and firetouchinterest then\r\n        local objectFindTouch = ((object:IsA("TouchTransmitter") or object:IsA("TouchInterest")) and object.Parent) or (object:IsA("BasePart") and object)\r\n        if objectFindTouch and Root then\r\n            firetouchinterest(Root, objectFindTouch, 0)\r\n            firetouchinterest(Root, objectFindTouch, 1)\r\n        end\r\n    end\r\n    if datafire.fireprompt and fireproximityprompt then\r\n        local objectFindProximity = object:IsA("ProximityPrompt") and object or object:FindFirstChildWhichOfClass("ProximityPrompt", true)\r\n        if objectFindProximity then\r\n            fireproximityprompt(objectFindProximity, 0)\r\n            fireproximityprompt(objectFindProximity, 1)\r\n        end\r\n    end\r\nend\r\n\r\nif game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then\r\n    if _G.AutoGetBadgeGlove == "Boxing" then\r\n        if game.Workspace:FindFirstChild("BoxingGloves") == nil then\r\n            TP(game.Workspace.Buildings.house:FindFirstChild("TP").CFrame * CFrame.new(0,10,0))\r\n        end\r\n        repeat task.wait() until game.Workspace:FindFirstChild("BoxingGloves")\r\n        task.wait(0.6)\r\n        if game.Workspace:FindFirstChild("BoxingGloves") then\r\n            for i,v in pairs(game.Workspace:GetChildren()) do\r\n                if v.Name == "BoxingGloves" and v:FindFirstChild("ClickDetector") then\r\n                    fire(v.ClickDetector, {fireclick = true})\r\n                    TP(v.CFrame)\r\n                end\r\n            end\r\n        end\r\n    elseif _G.AutoGetBadgeGlove == "Doorkeeper" then\r\n        local OpenedDoors = {}\r\n        while true and task.wait() do\r\n            if workspace:FindFirstChild("Hallways") then\r\n                for i, v in pairs(workspace.Hallways:GetChildren()) do\r\n                    local HallwayDoor = v:FindFirstChild("Doors")\r\n                    if HallwayDoor then\r\n                        for j, b in pairs(HallwayDoor:GetChildren()) do\r\n                            if b:IsA("Model") and tonumber(b.Name) then\r\n                                if OpenedDoors[b] then \r\n                                    continue \r\n                                end\r\n                                local DoorHitbox = b:FindFirstChild("Hitbox")\r\n                                local Click = DoorHitbox and DoorHitbox:FindFirstChild("ClickDetector")\r\n                                if DoorHitbox then\r\n                                    repeat task.wait()\r\n                                        fire(Click, {fireclick = true})\r\n                                        TP(DoorHitbox.CFrame * CFrame.new(0, 0, -5))\r\n                                    until b:GetAttribute("Open")\r\n                                    OpenedDoors[b] = true\r\n                                end\r\n                            end\r\n                        end\r\n                    end\r\n                end\r\n            end\r\n        end\r\n    elseif _G.AutoGetBadgeGlove == "Bind" then\r\n        if game.Workspace:FindFirstChild("Orb") and game.Workspace.Orb:FindFirstChild("Meshes/rock chain glove_defaultglove_cell.001") then\r\n            fire(game.Workspace.Orb.ClickDetector, {fireclick = true})\r\n            TP(workspace.Orb["Meshes/rock chain glove_defaultglove_cell.001"].CFrame)\r\n        end\r\n    elseif _G.AutoGetBadgeGlove == "Lotus" then\r\n        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Lotus2Complete"):FireServer()\r\n        if PlayerGui:FindFirstChild("Akari") then\r\n            PlayerGui.Akari:Destroy()\r\n        end\r\n        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Minigames"):WaitForChild("Complete"):FireServer()\r\n        task.wait(0.5)\r\n        for i, v in pairs(workspace:GetChildren()) do\r\n            if v:IsA("Folder") and v.Name:find("Lotus") and v:FindFirstChild("Lotus") and v.Lotus:FindFirstChild("Primary") and v.Lotus.Primary:FindFirstChild("ClickDetector") then\r\n                for j, b in pairs(v.Lotus:GetChildren()) do\r\n                    if b:IsA("BasePart") and not b.Name:find("Primary") and b.Transparency < 1 then\r\n                        TP(v.Lotus.Primary.CFrame * CFrame.new(0, 5, 0))\r\n                        fire(v.Lotus.Primary.ClickDetector, {fireclick = true})\r\n                        repeat task.wait() until b.Transparency >= 1\r\n                        break\r\n                    end\r\n                end\r\n            end\r\n        end\r\n    elseif _G.AutoGetBadgeGlove == "Conker" then\r\n        ReplicatedStorage.Remotes.Dialogue.FinishedNPCDialogue:FireServer()\r\n        repeat task.wait() until workspace:FindFirstChild("Map"):FindFirstChild("Props"):FindFirstChild("BasketCollection") and workspace.Map.Props.BasketCollection:FindFirstChild("Basket")\r\n        fire(workspace.Map.Props.BasketCollection.Basket.ClickDetector, {fireclick = true})\r\n        repeat task.wait() until Character:FindFirstChild("ConkerHoldVisual")\r\n        task.wait(2.8)\r\n        TP(workspace.Map.CoreAssets.Bowl["Sphere.002"].CFrame)\r\n        \r\n        task.spawn(function()\r\n            workspace.NPCs.DescendantAdded:Connect(function(s)\r\n                if s.Name == "squirrel" then\r\n                    pcall(function()\r\n                        while task.wait() and s do\r\n                            if s:FindFirstChild("HumanoidRootPart") then\r\n                                ReplicatedStorage.Remotes.tool.use:FireServer("slap")\r\n                                ReplicatedStorage.Remotes.tool.hit:FireServer("slap", {Instance = s.HumanoidRootPart})\r\n                            end\r\n                        end\r\n                    end)\r\n                end\r\n            end)\r\n            workspace.DescendantAdded:Connect(function(n)\r\n                if n.Name == "Conker" then\r\n                    if n:FindFirstChildOfClass("TouchTransmitter") then\r\n                        TP(n.CFrame)\r\n                        fire(n, {firetouch = true})\r\n                        task.delay(0.1, function()\r\n                            TP(workspace.Map.CoreAssets.Bowl["Sphere.002"].CFrame)\r\n                            task.wait(0.5)\r\n                            workspace.Map.CoreAssets.Bowl.ProximityPrompt.HoldDuration = 0\r\n                            fire(workspace.Map.CoreAssets.Bowl.ProximityPrompt, {fireprompt = true})\r\n                            pcall(function()\r\n                                workspace.Map.CoreAssets.Bowl.ProximityPrompt:InputHoldBegin()\r\n                                workspace.Map.CoreAssets.Bowl.ProximityPrompt:InputHoldEnd()\r\n                            end)\r\n                        end)\r\n                    end\r\n                end\r\n            end)\r\n        end)\r\n    elseif _G.AutoGetBadgeGlove == "FrostBite" then\r\n        TP(CFrame.new(-554, 177, 56))\r\n        task.wait(0.7)\r\n        for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do\r\n            if v.ClassName == "ProximityPrompt" then\r\n                v.HoldDuration = 0\r\n                fire(v, {fireprompt = true})\r\n            end\r\n        end\r\n    elseif _G.AutoGetBadgeGlove == "Plate" then\r\n        repeat task.wait() until workspace:FindFirstChild("Obstacles")\r\n        if workspace:FindFirstChild("Obstacles") then workspace.Obstacles:Destroy() end\r\n        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Bypass plate obstacles",Icon = "rbxassetid://7733658504",Duration = 5})\r\n        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Wait in until glove appear",Icon = "rbxassetid://7733658504",Duration = 5})\r\n        workspace:GetAttributeChangedSignal("Completed"):Connect(function()\r\n            if workspace:GetAttribute("Completed") == true then\r\n                game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Done Bro",Icon = "rbxassetid://7733658504",Duration = 5})\r\n                while task.wait() do\r\n                    if workspace:FindFirstChild("Glove Model"):FindFirstChild("Hand") then\r\n                        TP(workspace["Glove Model"].Hand.CFrame)\r\n                    end\r\n                end\r\n            end\r\n        end)\r\n    elseif _G.AutoGetBadgeGlove == "Plunger" then\r\n        local Plunger = workspace:FindFirstChild("plunger glove")\r\n        if Plunger and Plunger:FindFirstChild("plungerglove") then\r\n            Plunger:FindFirstChild("plungerglove").CFrame = Root.CFrame\r\n            fire(Plunger:FindFirstChildOfClass("ClickDetector"), {fireclick = true})\r\n        end\r\n    elseif _G.AutoGetBadgeGlove == "Admin" then\r\n        task.wait(10)\r\n        TP(CFrame.new(502, 76, 59))\r\n        if getconnections then\r\n            for i,v in next, getconnections(LocalPlayer.Idled) do\r\n                v:Disable() \r\n            end\r\n        end\r\n        if not getconnections then\r\n            LocalPlayer.Idled:Connect(function()\r\n                Virtual:CaptureController()\r\n                Virtual:ClickButton2(Vector2.new())\r\n            end)\r\n        end\r\n    elseif _G.AutoGetBadgeGlove == "Chain" then\r\n        repeat task.wait() until game.Workspace:FindFirstChild("Map") and game.Workspace.Map:FindFirstChild("CodeBrick")\r\n        local Code = {}\r\n        if game.Workspace.Map.CodeBrick.SurfaceGui:FindFirstChild("IMGTemplate") then\r\n\t\tCode = {}\r\n\t\tfor i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do\r\n\t\t\tif v.Name == "IMGTemplate" then\r\n\t\t\t    if v.Image == "http://www.roblox.com/asset/?id=9648769161" then\r\n\t\t\t\t\t    table.insert(Code, "4")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then\r\n\t\t\t\t\t    table.insert(Code, "2")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then\r\n\t\t\t\t\t    table.insert(Code, "3")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then\r\n\t\t\t\t\t    table.insert(Code, "9")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then\r\n\t\t\t\t\t    table.insert(Code, "8")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then\r\n\t\t\t\t\t    table.insert(Code, "2")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then\r\n\t\t\t\t\t    table.insert(Code, "8")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then\r\n\t\t\t\t\t    table.insert(Code, "3")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then\r\n\t\t\t\t\t    table.insert(Code, "7")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then\r\n\t\t\t\t\t    table.insert(Code, "8")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then\r\n\t\t\t\t\t    table.insert(Code, "2")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then\r\n\t\t\t\t\t    table.insert(Code, "6")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then\r\n\t\t\t\t\t    table.insert(Code, "3")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then\r\n\t\t\t\t\t    table.insert(Code, "6")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then\r\n\t\t\t\t\t    table.insert(Code, "6")\r\n\t\t\t\t\telseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then\r\n\t\t\t\t\t    table.insert(Code, "2")\r\n\t\t\t\t\tend\r\n\t\t\t    end\r\n\t\t\tend\r\n\t\tend\r\n        if #Code ~= 0 then\r\n            for i, v in pairs(game.Workspace.Map.OriginOffice:GetChildren()) do\r\n                if v.Name:lower():find("codedoor") and v:FindFirstChild("Door") and v.Door:FindFirstChild("Keypad") and v.Door.Keypad:FindFirstChild("Buttons") then\r\n                    fire(v.Door.Keypad.Buttons.Reset.ClickDetector, {fireclick = true})\r\n                    task.wait(0.25)\r\n                    for i = 1, #Code do\r\n                        local CodeNah = Code[i]\r\n                        fire(v.Door.Keypad.Buttons[CodeNah].ClickDetector, {fireclick = true})\r\n                        task.wait(0.25)\r\n                    end\r\n                    task.wait(0.25)\r\n                    fire(v.Door.Keypad.Buttons.Enter.ClickDetector, {fireclick = true})\r\n                end\r\n            end\r\n        end\r\n        game:GetService("TeleportService"):Teleport(6403373529)\r\n    elseif _G.AutoGetBadgeGlove == "Counter + Elude" then\r\n        Time = 121\r\n        task.wait(0.4)\r\n        game.Workspace.CounterLever.ClickDetector.MouseClick:Connect(function()\r\n            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,100,0)\r\n            task.wait(0.2)\r\n            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true\r\n            for i = 1, Time do\r\n                Time = Time - 1\r\n                game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "You wait time [ "..i.." ] receive.",Icon = "rbxassetid://7733658504",Duration = 1})\r\n                task.wait(1)\r\n            end\r\n            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false\r\n            for i, v in pairs(workspace.Maze:GetChildren()) do\r\n                if v.Name == "Part" and v:FindFirstChild("A0") and v:FindFirstChild("ClickDetector") then\r\n                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,-20,0)\r\n                    v.ClickDetector.MouseClick:Connect(function()\r\n                        game.Workspace.Ruins.Elude.Glove.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame\r\n                    end)\r\n                end\r\n            end\r\n        end)\r\n        task.wait(0.7)\r\n        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.CounterLever.Main.CFrame\r\n        pcall(function()\r\n            fireclickdetector(game.Workspace.CounterLever.ClickDetector)\r\n            repeat task.wait() until Time == 0\r\n            for i, v in pairs(workspace.Maze:GetChildren()) do\r\n                if v.Name == "Part" and v:FindFirstChild("A0") and v:FindFirstChild("ClickDetector") then\r\n                    fireclickdetector(v.ClickDetector)\r\n                end\r\n            end\r\n        end)\r\n    elseif _G.AutoGetBadgeGlove == "Riftshot" or _G.AutoGetBadgeGlove == "Fan" then\r\n        task.spawn(function()\r\n            while true do\r\n                Dialogue = game.Workspace:FindFirstChild("DialoguePrompts")\r\n                NPC = game.Workspace:FindFirstChild("NPCS")\r\n                Buildings = game.Workspace:FindFirstChild("Buildings")\r\n                task.wait()\r\n            end\r\n        end)\r\n        if _G.AutoGetBadgeGlove == "Riftshot" then\r\n            task.wait(0.4)\r\n            if Dialogue and Dialogue:FindFirstChild("Sharpshooter Sam") and Dialogue["Sharpshooter Sam"]:FindFirstChildOfClass("ProximityPrompt") then\r\n                TP(Dialogue["Sharpshooter Sam"].CFrame)\r\n                repeat task.wait() until (Root.Position - Dialogue["Sharpshooter Sam"].Position).Magnitude <= 10\r\n            end\r\n            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Bypass Success, bomb will bring you, your job is to shoot the bomb (Goodluck!)",Icon = "rbxassetid://7733658504",Duration = 5})\r\n            task.wait(0.3)\r\n            for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do\r\n                if v.Name:find("Sharpshooter Sam\'s") then\r\n                    SharpshooterTarget = v\r\n                end\r\n            end\r\n            task.wait(0.3)\r\n            while true do\r\n                if Character:FindFirstChild("HumanoidRootPart") then\r\n                    if SharpshooterTarget then\r\n                        for i, v in pairs(SharpshooterTarget:GetChildren()) do\r\n                            if v.Name:find("bomb") and v:FindFirstChild("Handle") then\r\n                                v.Handle.CFrame = Root.CFrame * CFrame.new(0, 0, -7)\r\n                            end\r\n                        end\r\n                    end\r\n                end\r\n                task.wait()\r\n            end\r\n        elseif _G.AutoGetBadgeGlove == "Fan" then\r\n            for i = 1, 2 do\r\n                if Dialogue and Dialogue:FindFirstChild("PabloPinkyPoo") and Dialogue.PabloPinkyPoo:FindFirstChildOfClass("ProximityPrompt") then\r\n                    TP(Dialogue.PabloPinkyPoo.CFrame * CFrame.new(0, 0, -5))\r\n                    repeat task.wait() until (Root.Position - Dialogue.PabloPinkyPoo.Position).Magnitude <= 10\r\n                    task.wait(0.2)\r\n                    repeat task.wait()\r\n                        fire(Dialogue.PabloPinkyPoo:FindFirstChildOfClass("ProximityPrompt"), {fireprompt = true})\r\n                    until PlayerGui:FindFirstChild("Dialogues"):FindFirstChild("DialogueFrame") and PlayerGui.Dialogues.DialogueFrame.Visible == true\r\n                    task.wait(0.5)\r\n                end\r\n                task.wait(0.1)\r\n                repeat task.wait() until PlayerGui:FindFirstChild("Dialogues"):FindFirstChild("DialogueFrame") and PlayerGui.Dialogues.DialogueFrame.Visible == false\r\n                task.wait(0.6)\r\n            end\r\n            task.wait(0.5)\r\n            if game.Workspace.QuestStuff:FindFirstChild("Key") and game.Workspace.QuestStuff.Key.Transparency == 0 then\r\n                TP(game.Workspace.QuestStuff.Key.CFrame)\r\n                repeat task.wait() until (Root.Position - game.Workspace.QuestStuff.Key.Position).Magnitude <= 10\r\n                task.wait(0.3)\r\n                if game.Workspace.QuestStuff.Key:FindFirstChild("ClickDetector") then\r\n                    fire(game.Workspace.QuestStuff.Key.ClickDetector, {fireclick = true})\r\n                end\r\n                repeat task.wait() until game.Workspace.QuestStuff:FindFirstChild("Key") and game.Workspace.QuestStuff.Key.Transparency ~= 0\r\n                task.wait(0.3)\r\n            end\r\n            task.wait(2.6)\r\n            if Buildings and Buildings:FindFirstChild("oog\'s cage") and Buildings["oog\'s cage"]:FindFirstChild("Door") then\r\n                TP(Buildings["oog\'s cage"].Door.Door.CFrame * CFrame.new(-3,0,0))\r\n                repeat task.wait() until (Root.Position - Buildings["oog\'s cage"].Door.Door.Position).Magnitude <= 10\r\n                task.wait(0.3)\r\n                fire(Buildings["oog\'s cage"].Door.ClickDetector, {fireclick = true})\r\n            end\r\n            task.wait(0.3)\r\n            if Dialogue and Dialogue:FindFirstChild("PabloPinkyPoo") and Dialogue.PabloPinkyPoo:FindFirstChildOfClass("ProximityPrompt") then\r\n                TP(Dialogue.PabloPinkyPoo.CFrame * CFrame.new(0, 0, -5))\r\n                repeat task.wait() until (Root.Position - Dialogue.PabloPinkyPoo.Position).Magnitude <= 10\r\n                task.wait(0.2)\r\n                repeat task.wait()\r\n                    fire(Dialogue.PabloPinkyPoo:FindFirstChildOfClass("ProximityPrompt"), {fireprompt = true})\r\n                until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Dialogues"):FindFirstChild("DialogueFrame") and game:GetService("Players").LocalPlayer.PlayerGui.Dialogues.DialogueFrame.Visible == true\r\n            end\r\n        end\r\n    elseif _G.AutoGetBadgeGlove == "Reflect" then\r\n        local Stage1 = workspace:FindFirstChild("Stage1")\r\n        if workspace:FindFirstChild("Stage1") then\r\n            repeat task.wait() \r\n                if Stage1:FindFirstChild("Lobby") and Stage1.Lobby.Portals:FindFirstChild("normal") then\r\n                    fire(Stage1.Lobby.Portals.normal.Teleport1, {firetouch = true})\r\n                end\r\n                if Stage1:FindFirstChild("glove") then\r\n                    TP(Stage1.glove:FindFirstChild("Touch").CFrame)\r\n                end\r\n            until Character:FindFirstChild("Evolg") or Backpack:FindFirstChild("Evolg")\r\n            local GloveEvolg = Character:FindFirstChild("Evolg") or Backpack:FindFirstChild("Evolg")\r\n            if GloveEvolg and GloveEvolg:FindFirstChild("Glove") and GloveEvolg.Glove:FindFirstChild("HitParticles") then\r\n                GloveEvolg.Glove:FindFirstChild("HitParticles"):Destroy()\r\n            end\r\n            repeat task.wait()\r\n                if Backpack:FindFirstChild("Evolg") then\r\n                    Backpack:FindFirstChild("Evolg").Parent = Character\r\n                end\r\n                if Character:FindFirstChild("Evolg") and Character.Evolg:FindFirstChild("Network") then\r\n                    for i, v in pairs(workspace:GetChildren()) do\r\n                        if v.Name:find("shadow") and v:FindFirstChild("HumanoidRootPart") then\r\n                            Character:WaitForChild("Evolg"):WaitForChild("Network"):FireServer("Hit",v.HumanoidRootPart)\r\n                        end\r\n                    end\r\n                end\r\n            until Stage1:FindFirstChild("Mirror") and Stage1.Mirror:FindFirstChild("Touch") and Stage1.Mirror.Touch:FindFirstChild("TouchInterest")\r\n            task.wait(0.5)\r\n            TP(Stage1.Mirror:FindFirstChild("Touch").CFrame)\r\n        end\r\n        repeat task.wait() until workspace:FindFirstChild("Stage2")\r\n        task.wait(4)\r\n        if workspace:FindFirstChild("Stage2") then\r\n            local Stage2 = workspace:FindFirstChild("Stage2")\r\n            if Stage2:FindFirstChild("Lobby") and Stage2.Lobby.Portals:FindFirstChild("normal") then\r\n                TP(Stage2.Lobby.Portals.normal.Teleport1.CFrame)\r\n            end\r\n            task.wait(0.5)\r\n            repeat task.wait()\r\n                if Stage2:FindFirstChild("spinner") and Stage2.spinner:FindFirstChild("Part") and Stage2.spinner.Part.Transparency < 0.5 then\r\n                    TP(Stage2.spinner:FindFirstChild("Part").CFrame * CFrame.new(0, 60, 0))\r\n                    task.wait(0.3)\r\n                    Root.Anchored = true\r\n                end\r\n            until Stage2:FindFirstChild("Mirror") and Stage2.Mirror:FindFirstChild("Touch") and Stage2.Mirror.Touch:FindFirstChild("TouchInterest")\r\n            task.wait(0.4)\r\n            Root.Anchored = false\r\n            TP(Stage2.Mirror:FindFirstChild("Touch").CFrame)\r\n            task.wait(4)\r\n        end\r\n        repeat task.wait() until workspace:FindFirstChild("Stage3")\r\n        task.wait(0.3)\r\n        if workspace:FindFirstChild("Stage3") then\r\n            task.wait(5)\r\n            local Stage3 = workspace:FindFirstChild("Stage3")\r\n            if Stage3:FindFirstChild("Lobby") and Stage3.Lobby.Portals:FindFirstChild("default") then\r\n                TP(Stage3.Lobby.Portals.default.Teleport2.CFrame)\r\n            end\r\n        end\r\n        repeat task.wait() until workspace:FindFirstChild("BossArena")\r\n        if workspace:FindFirstChild("BossAttackDebris") then\r\n            workspace.BossAttackDebris:Destroy()\r\n        end\r\n        local Boss = workspace:FindFirstChild("BossArena")\r\n        if Boss:FindFirstChild("Arena") and Boss.Arena:FindFirstChild("startTrigger") then\r\n            TP(Boss.Arena:FindFirstChild("startTrigger").CFrame)\r\n        end\r\n        repeat task.wait()\r\n            if Boss:FindFirstChild("Arena"):FindFirstChild("mirrors") then\r\n                for i, v in pairs(Boss.Arena.mirrors:GetChildren()) do\r\n                    if v:IsA("Model") and v:FindFirstChild("Meshes/Mirror1_Plane.008") and v["Meshes/Mirror1_Plane.008"].Transparency < 0.5 then\r\n                        TP(v:FindFirstChild("Meshes/Mirror1_Plane.008").CFrame)\r\n                    end\r\n                end\r\n            end\r\n        until workspace:FindFirstChild("Rig") and workspace.Rig:FindFirstChild("Humanoid").Health <= 0\r\n    elseif _G.AutoGetBadgeGlove == "Fight Guide" then\r\n        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "You wait time [ 10 second ].",Icon = "rbxassetid://7733658504",Duration = 1})\r\n        task.wait(10)\r\n        TP(CFrame.new(3260, -70, 823))\r\n        task.wait(2)\r\n        for i,v in pairs(game.Workspace:GetDescendants()) do\r\n            if v.Name == "ShackLever" and v:FindFirstChild("ClickDetector") then\r\n                fire(v.ClickDetector, {fireclick = true})\r\n            end\r\n        end\r\n        repeat task.wait() until workspace.Map.Components:FindFirstChild("GuideNPC") ~= nil\r\n        task.wait(0.56)\r\n        TP(CFrame.new(595, 120, -330))\r\n        task.wait(0.3)\r\n        Root.Anchored = true\r\n        while true do\r\n            for i,v in pairs(game.Workspace:GetChildren()) do\r\n                if v.Name == "TrackGloveMissile" or v.Name == "golem" or v.Name == "DungeonGolem" or v.Name == "ReplicaNPC" or v.Name == "GuideNPC" then\r\n                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then\r\n                        game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern").Parent = game.Players.LocalPlayer.Character\r\n                    elseif game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then\r\n                        if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then\r\n                            game.Players.LocalPlayer.Character:FindFirstChild("Lantern"):Activate()\r\n                            if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") and game.Players.LocalPlayer.Character.Lantern:FindFirstChild("Network") then\r\n                                game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer("Hit", v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Hitbox") or v:FindFirstChild("Cube.001") or v)\r\n                            end\r\n                        end\r\n                    end\r\n                end\r\n            end\r\n            task.wait()\r\n        end\r\n    else\r\n        loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/File-Script/Slap_Battles.lua"))()\r\n    end\r\nend'
U=U:gsub('__Glove__',tostring(_G.AutoGetBadgeGlove))T(U)elseif not T then Notification(
'Bruh, Not only executor you autoexe',_G.TimeNotify)end local U=game:GetService('TeleportService')if _G.
AutoGetBadgeGlove=='Riftshot'or _G.AutoGetBadgeGlove=='OOG'or _G.AutoGetBadgeGlove=='Boxing'then game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=game.workspace.Lobby.brazil.portal.CFrame elseif _G.AutoGetBadgeGlove==
'Doorkeeper'then U:Teleport(125845699717230)elseif _G.AutoGetBadgeGlove=='Bind'then U:Teleport(74169485398268)elseif _G.
AutoGetBadgeGlove=='Lotus'then U:Teleport(74169485398268)elseif _G.AutoGetBadgeGlove=='Conker'then U:Teleport(
101113181694564)elseif _G.AutoGetBadgeGlove=='FrostBite'then U:Teleport(17290438723)elseif _G.AutoGetBadgeGlove=='Plate'
then U:Teleport(106620300132058)elseif _G.AutoGetBadgeGlove=='Chain'then U:Teleport(9431156611)elseif _G.
AutoGetBadgeGlove=='Counter + Elude'then U:Teleport(11828384869)elseif _G.AutoGetBadgeGlove=='Plunger'then if workspace:
FindFirstChild('BountyHunterRoom')and workspace.BountyHunterRoom:FindFirstChild('PlungerMain')then game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.BountyHunterRoom:FindFirstChild('PlungerMain').CFrame if
fireclickdetector then fireclickdetector(workspace.BountyHunterRoom.PlungerMain:FindFirstChildOfClass('ClickDetector'))
end end repeat task.wait()until workspace:FindFirstChild('plungers')and workspace.plungers:FindFirstChild(
'ToiletPlunger').Transparency<1 wait(0.4)if workspace:FindFirstChild('plungers')and workspace.plungers:FindFirstChild(
'ToiletPlunger')and workspace.plungers.ToiletPlunger:FindFirstChildOfClass('ClickDetector')then if fireclickdetector
then fireclickdetector(workspace.plungers.ToiletPlunger:FindFirstChildOfClass('ClickDetector'))end end elseif _G.
AutoGetBadgeGlove=='Admin'then repeat task.wait()if game.ReplicatedStorage:FindFirstChild('Assets')and game.
ReplicatedStorage.Assets:FindFirstChild('Retro')then game.ReplicatedStorage.Assets.Retro.Parent=game.Workspace end until
game.Workspace:FindFirstChild('Retro')and game.Workspace.Retro:FindFirstChild('Map')wait(1.5)if game.Workspace:
FindFirstChild('Retro')and game.Workspace.Retro:FindFirstChild('Map')then for V,W in pairs(workspace.Retro.Map.
RetroObbyMap:GetChildren())do if W.Name=='Model'and W:FindFirstChild('StaffApp')and W.StaffApp:FindFirstChild('Button')
and W.StaffApp.Button:FindFirstChild('ClickDetector')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=W.
StaffApp.Button.CFrame wait(0.3)fireclickdetector(W.StaffApp.Button.ClickDetector)end end end elseif _G.
AutoGetBadgeGlove=='Reflect'then if workspace:FindFirstChild('BountyHunterRoom'):FindFirstChild('QuestObjects'):
FindFirstChild('ShatteredRealityMirror'):FindFirstChild('Meshes/Mirror1_Plane.007')then if workspace.BountyHunterRoom.
QuestObjects.ShatteredRealityMirror['Meshes/Mirror1_Plane.007'].Transparency<=0 then game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=workspace.BountyHunterRoom.QuestObjects.ShatteredRealityMirror['Meshes/Mirror1_Plane.007'].
CFrame wait(0.4)fireproximityprompt(workspace.BountyHunterRoom.QuestObjects.ShatteredRealityMirror[
'Meshes/Mirror1_Plane.007'].ProximityPrompt)else Notification(
[[You have complete 4 quest hitman (2 quest easy, 2 quest hard)]],_G.TimeNotify)end end elseif _G.AutoGetBadgeGlove==
'Fight Guide'then for V,W in pairs(workspace.BountyHunterRoom.Build:GetChildren())do if W.Name=='Model'and W:
FindFirstChild('Meshes/boxshadow_Cube.005')and W['Meshes/boxshadow_Cube.005']:FindFirstChild('Hitbox')then game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=W['Meshes/boxshadow_Cube.005'].Hitbox.CFrame end end end end})local T=Tabs
.Tab3:AddRightGroupbox('Badge')T:AddButton({Text='Get Glove Kinetic',Func=function()if CheckGlove()=='Stun'and game.
Players.LocalPlayer.Character:FindFirstChild('entered')then OGL=game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame repeat task.wait()game.ReplicatedStorage.SelfKnockback:FireServer({['Force']=-99})until game.Players.LocalPlayer.
Character:WaitForChild('KineticSlappedBadgeCounter').Value>=100 wait(1.5)repeat if game.Players.LocalPlayer.Character.
Humanoid.Health==0 or game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil then break end if game.Players.
LocalPlayer.Backpack:FindFirstChild('Stun')then game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.
LocalPlayer.Backpack.Stun)end wait(0.1)local U=game.Players:GetChildren()local V=U[math.random(1,#U)]repeat V=U[math.
random(1,#U)]until V~=game.Players.LocalPlayer and V.Character:FindFirstChild('entered')and V.Character:FindFirstChild(
'rock')==nil and V.Character.Head:FindFirstChild('UnoReverseCard')==nil and V.Character.Humanoid.Health~=0 Target=V game
.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=Target.Character.HumanoidRootPart.CFrame*CFrame.new(0,-20,0)wait(
0.25)game.ReplicatedStorage.StunR:FireServer(game.Players.LocalPlayer.Character.Stun)game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=OGL wait(0.5)if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:
FindFirstChild('EMPStunBadgeCounter')then Notification('Counter Stun [ '..game.Players.LocalPlayer.Character.
EMPStunBadgeCounter.Value..' ]',_G.TimeNotify)end wait(12.3)until game.Players.LocalPlayer.Character:FindFirstChild(
'EMPStunBadgeCounter')and game.Players.LocalPlayer.Character.EMPStunBadgeCounter.Value>=50 else Notification(
"You don't have Stun equipped, or you aren't in the arena",_G.TimeNotify)end end})T:AddButton({Text='Auto Win Kraken',
Func=function()if game.Workspace:FindFirstChild('Abyss')~=nil then Notification(
'When the kraken stops attack, click to hit.',_G.TimeNotify)repeat task.wait()if game.Workspace:FindFirstChild('Abyss')
and game.Workspace.Abyss:FindFirstChild('Ship')and game.Workspace.Abyss.Ship:FindFirstChild('Ghost_Ship')and game.
Workspace.Abyss.Ship.Ghost_Ship:FindFirstChild('Wall')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=
game.Workspace.Abyss.Ship.Ghost_Ship.Wall.CFrame*CFrame.new(0,10,0)else break end for U,V in pairs(game.Workspace:
GetChildren())do if V.Name=='kraken_hurtbox'then V.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end
end until game.Workspace:FindFirstChild('Abyss')==nil else Notification(
"You have enter Map Abyss [ don't show all, not work ]",_G.TimeNotify)end end})T:AddButton({Text='Get Glove Bomb',Func=
function()if CheckGlove()=='Warp'and not game:GetService('BadgeService'):UserHasBadgeAsync(game.Players.LocalPlayer.
UserId,2124919840)then OldTouch=workspace.DEATHBARRIER.CanTouch local U=game.Players:GetChildren()local V=U[math.random(
1,#U)]repeat V=U[math.random(1,#U)]until V~=game.Players.LocalPlayer and V.Character:FindFirstChild('entered')and V.
Character:FindFirstChild('Ragdolled').Value==false Target=V game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=
Target.Character:FindFirstChild('HumanoidRootPart').CFrame task.wait(0.2)game.ReplicatedStorage.WarpHt:FireServer(Target
.Character:WaitForChild('HumanoidRootPart'))task.wait(0.15)workspace.DEATHBARRIER.CanTouch=true game.Players.LocalPlayer
.Character.HumanoidRootPart.CFrame=game:GetService('Workspace').DEATHBARRIER.CFrame wait(0.1)game:GetService(
'ReplicatedStorage').WLOC:FireServer()wait(0.2)workspace.DEATHBARRIER.CanTouch=OldTouch else Notification(
"You don't have Warp equipped, or you have owner badge",_G.TimeNotify)end end})T:AddButton({Text='Get Glove Plank',Func=
function()if CheckGlove()=='Fort'and not game:GetService('BadgeService'):UserHasBadgeAsync(game.Players.LocalPlayer.
UserId,4031317971987872)then local U=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame game.Players.LocalPlayer
.Character.HumanoidRootPart.CFrame=workspace.SafeBoxSpace.CFrame*CFrame.new(0,60,0)wait(0.3)game:GetService(
'ReplicatedStorage').Fortlol:FireServer()wait(0.7)for V,W in pairs(workspace:GetChildren())do if W.Name=='Part'and W:
FindFirstChild('brownsmoke')and W:FindFirstChild('Sound')and(game.Players.LocalPlayer.Character.HumanoidRootPart.
Position-W.Position).Magnitude<=200 then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=W.CFrame*CFrame.new(
0,25,0)end end else Notification("You don't have Fort equipped, or you have Owner Badge",_G.TimeNotify)end end})T:
AddButton({Text='Get Glove Pyscho (Win Obby)',Func=function()if game.Workspace:FindFirstChild('RepressedMemoriesMap')
then OldPlayerCF=game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame PsychokiTrigger=workspace:
FindFirstChild('RepressedMemoriesMap')and workspace.RepressedMemoriesMap:FindFirstChild('Psychokinesis'):FindFirstChild(
'Triggers')Start=PsychokiTrigger and PsychokiTrigger:FindFirstChild('StartPsychoEvent')Stop=PsychokiTrigger and
PsychokiTrigger:FindFirstChild('StopPsychoEvent')VectorTween({Place=Start.Position,Speed=80})VectorTween({Place=Stop.
Position,Speed=40})VectorTween({Place=OldPlayerCF.Position,Speed=130})else Notification(
"You have enter limbo [ don't show all, not work ]",_G.TimeNotify)end end})T:AddButton({Text='Get Answer Recall',Func=
function()local U=workspace:FindFirstChild('RepressedMemories')local V=U and U:FindFirstChild('RepressedMemoriesNPC')
local W=V and V:FindFirstChild('Head')local X=W and W:FindFirstChild('Dialog')if U and X then for Y,Z in pairs(X:
GetDescendants())do if Z:IsA('DialogChoice')then if Z:FindFirstChild('RightChoice')then Z.UserDialog='Uhhh, idk'end if Z
:FindFirstChild('FailChoice')then Z:Destroy()end end end else Notification(
"You have enter limbo [ don't show all, not work ]",_G.TimeNotify)end end})T:AddButton({Text='Get Glove Blasphemy',Func=
function()if CheckGlove()=='bus'and not game:GetService('BadgeService'):UserHasBadgeAsync(game.Players.LocalPlayer.
UserId,3335299217032061)then OGL=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame _G.AntiRagdolledV='V3'g[
'Anti Ragdoll']:SetValue(true)repeat if game.Players.LocalPlayer.Character.Humanoid.Health==0 or game.Players.
LocalPlayer.Character:FindFirstChild('entered')==nil then break end if game.Players.LocalPlayer.Character:
FindFirstChild('entered')then local U=game.Players:GetChildren()local V=U[math.random(1,#U)]repeat V=U[math.random(1,#U)
]until V~=game.Players.LocalPlayer and V.Character:FindFirstChild('rock')==nil and V.Character.Head:FindFirstChild(
'UnoReverseCard')==nil and V.Character:FindFirstChild('entered')Target=V game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=Target.Character.HumanoidRootPart.CFrame task.wait(0.34)game:GetService('ReplicatedStorage').
busmoment:FireServer()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=OGL wait(0.8)repeat task.wait()for W,X
in pairs(game.Workspace:GetChildren())do if X.Name=='BusModel'then X.CFrame=game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame end end until game.Workspace:FindFirstChild('BusModel')==nil end wait(5.5)until game:GetService(
'BadgeService'):UserHasBadgeAsync(game.Players.LocalPlayer.UserId,3335299217032061)else Notification(
"You don't have bus equipped, or you have owner badge",_G.TimeNotify)end end})T:AddButton({Text=
'Auto Quests Chest All Glove',Func=function()if workspace.Arena.CannonIsland.TreasureSpots:FindFirstChild(
'_treasureSpot5').Decal.Transparency==0 then repeat task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame=workspace.Arena.CannonIsland.TreasureSpots:FindFirstChild('_treasureSpot5').CFrame game:GetService(
'ReplicatedStorage').DigEvent:FireServer({['index']=2,['cf']=CFrame.new()})until game.Workspace:FindFirstChild(
'TreasureChestFolder')and game.Workspace.TreasureChestFolder:FindFirstChild('TreasureChest')wait(1)if game.Workspace:
FindFirstChild('TreasureChestFolder')and game.Workspace.TreasureChestFolder:FindFirstChild('TreasureChest')and game.
Workspace.TreasureChestFolder.TreasureChest:FindFirstChild('OpenRemote')then game.Workspace.TreasureChestFolder.
TreasureChest.OpenRemote:FireServer()end game:GetService('Players').LocalPlayer.Reset:FireServer()wait(0.2)repeat task.
wait()until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.LocalPlayer.Character.Humanoid.Health>
0 wait(0.2)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.BountyHunterRoom.BountyHunterBooth.
_configPart.CFrame*CFrame.new(-5,0,0)end end})T:AddButton({Text='Get Glove [Redacted]',Func=function()if
CheckUnlockGlove('[REDACTED]').Value==false then for U,V in pairs(workspace.PocketDimension.Doors:GetChildren())do if
CheckUnlockGlove('[REDACTED]').Value==false then repeat task.wait()until game.Players.LocalPlayer.Character and game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character:FindFirstChild(
'Humanoid')and game.Players.LocalPlayer.Character.Humanoid.Health>0 game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame=V.CFrame task.wait(0.5)end end else Notification('you have owner [REDACTED]',_G.TimeNotify)end end})T:AddButton({
Text='Voodoo + Fish + Trap Farm',Func=function()if CheckGlove()=='Ghost'and game.Players.LocalPlayer.Character:
FindFirstChild('entered')==nil then game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()equipglove('ZZZZZZZ')
wait(0.2)game:GetService('ReplicatedStorage').ZZZZZZZSleep:FireServer()equipglove('Brick')wait(0.2)if not game.Players.
LocalPlayer.Character:FindFirstChild('entered')and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
then repeat task.wait()game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace.Lobby.Teleport1.CFrame)until
game.Players.LocalPlayer.Character:FindFirstChild('entered')end wait(0.35)game.Players.LocalPlayer.Character:
SetPrimaryPartCFrame(game.Workspace['SafeBox'].CFrame*CFrame.new(0,5,0))wait(0.2)repeat task.wait()if game.Players.
LocalPlayer.Backpack:FindFirstChild('Brick')then game.Players.LocalPlayer.Backpack:FindFirstChild('Brick').Parent=game.
Players.LocalPlayer.Character end if game.Players.LocalPlayer.Character:FindFirstChild('Brick')then game:GetService(
'ReplicatedStorage').lbrick:FireServer()end until(game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.
Players.LocalPlayer.Character.Humanoid.Health<=0)or game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil or
CheckUnlockGlove('Trap')==true else Notification("You don't have Ghost equipped, or You have go to lobby",_G.TimeNotify)
end end})T:AddButton({Text='Get Duck & Orange & Knife Badge',Func=function()if not game:GetService('BadgeService'):
UserHasBadgeAsync(game.Players.LocalPlayer.UserId,2124760907)or not game:GetService('BadgeService'):UserHasBadgeAsync(
game.Players.LocalPlayer.UserId,2128220957)or not game:GetService('BadgeService'):UserHasBadgeAsync(game.Players.
LocalPlayer.UserId,2124760916)then fireclickdetector(game.Workspace.Lobby.Scene.knofe.ClickDetector)fireclickdetector(
game.Workspace.Arena.island5.Orange.ClickDetector)fireclickdetector(game.Workspace.Arena['default island'][
'Rubber Ducky'].ClickDetector)else Notification('You have Owner 3 badge',_G.TimeNotify)end end})T:AddButton({Text=
'Get Free Ice Skate',Func=function()if not game:GetService('BadgeService'):UserHasBadgeAsync(game.Players.LocalPlayer.
UserId,2906002612987222)then game:GetService('ReplicatedStorage').IceSkate:FireServer('Freeze')else Notification(
'You have Owner badge',_G.TimeNotify)end end})T:AddButton({Text='Get Free Lamp',Func=function()if CheckGlove()==
'ZZZZZZZ'and not game:GetService('BadgeService'):UserHasBadgeAsync(game.Players.LocalPlayer.UserId,490455814138437)then
for U=1,5 do game:GetService('ReplicatedStorage').nightmare:FireServer('LightBroken')end else Notification(
"You don't have ZZZZZZZ equipped, or Owner badge",_G.TimeNotify)end end})T:AddButton({Text='Get Free Camera',Func=
function()if workspace:FindFirstChild('Camera_Obtainment_PNGS')then local U=game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame CreateFreezeBV()for V,W in pairs(workspace.Camera_Obtainment_PNGS:GetChildren())do if W:IsA(
'BasePart')then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(W.CFrame)task.wait(0.4)game:GetService(
'ReplicatedStorage'):FindFirstChild('Assets'):FindFirstChild('Obtainments'):FindFirstChild('Camera'):FindFirstChild(
'Remotes'):FindFirstChild('IsPhotoValid'):InvokeServer(W)end end game.Players.LocalPlayer.Character:
SetPrimaryPartCFrame(U)CreateFreezeBV({Remove=true})end end})T:AddButton({Text='Get Free Recall',Func=function()repeat
task.wait()game:GetService('ReplicatedStorage').RecallReset:FireServer(nil,true)until game:GetService(
'ReplicatedStorage').RecallLastInteractionSteps:InvokeServer(false):lower()==
'simon says walk through the portal to collect your reward'task.wait(2)game.Players.LocalPlayer.Character.
HumanoidRootPart:PivotTo(workspace.RepressedMemories.Portal.CFrame)end})T:AddButton({Text='Get The Schlop',Func=function
()if CheckGlove()=='Cloud'and CheckUnlockGlove('fish')and game.Players.LocalPlayer.Character:FindFirstChild('entered')==
nil then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.Arena.CannonIsland.Cannon.Base.CFrame*
CFrame.new(0,2,35)wait(0.3)game:GetService('ReplicatedStorage').CloudAbility:FireServer()equipglove('fish')wait(0.2)if
not game.Players.LocalPlayer.Character:FindFirstChild('entered')and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then repeat task.wait()game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace.Lobby.
Teleport1.CFrame)until game.Players.LocalPlayer.Character:FindFirstChild('entered')end wait(0.3)if game.Players.
LocalPlayer.Character:FindFirstChild('entered')and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')~=nil
and game.Players.LocalPlayer.Character.Humanoid.Sit==false then for U,V in pairs(game.Workspace:GetChildren())do if V.
Name:match(game.Players.LocalPlayer.Name)and V:FindFirstChild('VehicleSeat')then game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=V.VehicleSeat.CFrame end end end wait(0.7)for U=1,10 do for V,W in pairs(game.Workspace:
GetChildren())do if W.Name:match(game.Players.LocalPlayer.Name)and W:FindFirstChild('VehicleSeat')then W.VehicleSeat.
CFrame=CFrame.new(245,129,-91)end end task.wait()end wait(0.4)game:GetService('ReplicatedStorage').GeneralAbility:
FireServer()wait(0.5)repeat task.wait()if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:
FindFirstChild('entered')then for U,V in pairs(game.Players.LocalPlayer.Character:GetChildren())do if V.ClassName==
'Part'and V.Name~='Humanoid'then V.CFrame=game.workspace.Arena.Plate.CFrame end end end until game.Players.LocalPlayer.
Character:WaitForChild('Ragdolled').Value==false else Notification(
[[You don't have equiped Cloud | Badge Fish | You are in the lobby.]],_G.TimeNotify)end end})T:AddButton({Text=
'Get Undead',Func=function()if CheckGlove()=='Clock'then Notification('Ok, you have wait until revival you',_G.
TimeNotify)if not game.Players.LocalPlayer.Character:FindFirstChild('entered')and game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')then repeat task.wait()firetouchinterest(game.Players.LocalPlayer.Character:
WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,0)firetouchinterest(game.Players.LocalPlayer.
Character:WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,1)until game.Players.LocalPlayer.Character
:FindFirstChild('entered')end wait(0.4)game:GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer(
CFrame.new(17952.8671875,-125.5584487915039,-3477.072021484375))CreateFreezeBV()game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,30,0)wait(0.2)repeat task.wait()if workspace:
FindFirstChild(game.Players.LocalPlayer.Name.."'s clock")and game.Players.LocalPlayer.Character:GetAttribute(
'CurrentAbility')and game.Players.LocalPlayer.Character:GetAttribute('CurrentAbility')==7 then game:GetService(
'ReplicatedStorage'):WaitForChild('Events'):WaitForChild('Clock'):FireServer(game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame)end until game.Players.LocalPlayer.Character:FindFirstChild('RevivalCharm')and game.Players.
LocalPlayer.Character:FindFirstChild('RevivalCharm'):GetAttribute('clock')wait(0.3)repeat task.wait()until not game.
Players.LocalPlayer.Character:FindFirstChild('RevivalCharm')wait(0.1)game.Players.LocalPlayer.Character.HumanoidRootPart
.CFrame=game:GetService('Workspace').DEATHBARRIER.CFrame else Notification("You don't have Clock",_G.TimeNotify)end end}
)T:AddButton({Text='Get Debug',Func=function()if workspace:FindFirstChild('Debug Room')then local U={'_','_','_','7'}
local V=workspace:FindFirstChild('Debug Room')local W=V:FindFirstChild('UncollectedGloves')local X=V:FindFirstChild(
'Keypad')local Y=X and X:FindFirstChild('Buttons')local Z=X and X:FindFirstChild('Backpiece')local _=V:FindFirstChild(
'DuckTable')local aa=_ and _:FindFirstChild('DuckTable')local ab=aa and aa:FindFirstChild('Duckies')local ac=V:
FindFirstChild('MazeNumber',true)local ad=V:FindFirstChild('AdminNumber',true)if ab and ac and ad then U[1]=tostring(ab.
Value)U[2]=tostring(ad.Text)U[3]=tostring(ac.Text)end task.wait(0.1)if W then for ae,af in pairs(W:GetChildren())do if
af:IsA('Model')then local ag=af:FindFirstChildOfClass('ClickDetector')if ag then fireclickdetector(ag)end local ah=af:
FindFirstChildWhichIsA('TouchTransmitter')if ah then firetouchinterest(game.Players.LocalPlayer.Character.
HumanoidRootPart,ah.Parent,0)firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,ah.Parent,1)end end
end end task.wait(0.3)codeglove=table.concat(U)Notification('OK, you got code: '..codeglove)task.wait(0.3)if Y then for
ae=1,#codeglove do local af=codeglove:sub(ae,ae)if Y:FindFirstChild(af)and Y[af]:FindFirstChild('ClickDetector')then
fireclickdetector(Y[af].ClickDetector)wait(0.3)end end wait(0.5)if Y:FindFirstChild('Enter')and Y.Enter:FindFirstChild(
'ClickDetector')then fireclickdetector(Y.Enter.ClickDetector)end end end end})T:AddButton({Text='Get Lag',Func=function(
)if game.Players.LocalPlayer.Character:FindFirstChild('entered')then Notification('If you get glove lag you can reset',5
)CreateFreezeBV()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,30,
0)else Notification("You aren't in the arena",_G.TimeNotify)end end})T:AddButton({Text='Get Join Cheese',Func=function()
if CheckGlove()=='el gato'and game.Players.LocalPlayer.Character:FindFirstChild('entered')then game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=workspace.Arena.CannonIsland.Cannon.Base.CFrame*CFrame.new(0,2,35)wait(0.37)workspace.
Cheese.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-5)if fireclickdetector then
fireclickdetector(workspace.Cheese.ClickDetector)end else Notification(
"You don't have el gato equipped, or you aren't in the arena",_G.TimeNotify)end end})if workspace:FindFirstChild('Arena'
)and workspace.Arena:FindFirstChild('XmasSnowPeeps')then T:AddButton({Text='Get Join Boss Jerry',Func=function()for aa,
ab in pairs(workspace.Arena.XmasSnowPeeps:GetChildren())do if ab:IsA('BasePart')then local ac=ab:FindFirstChild(
'ClickDetector',true)if ac then if fireclickdetector then fireclickdetector(ac)end end end end repeat task.wait()until
workspace:FindFirstChild('XmasIsland')and workspace.XmasIsland:FindFirstChild('Portal')and workspace.XmasIsland.Portal.
Transparency==0 wait(0.3)game.Players.LocalPlayer.Character:PivotTo(workspace.XmasIsland.Portal.CFrame*CFrame.new(0,5,0)
)end})end T:AddButton({Text='Get Join Retro',Func=function()if CheckGlove()=='Retro'then if game.Players.LocalPlayer.
Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then if workspace.Arena:
FindFirstChild('CannonIsland')and workspace.Arena.CannonIsland:FindFirstChild('Cannon Island [OLD]')then for aa,ab in
pairs(workspace.Arena.CannonIsland:FindFirstChild('Cannon Island [OLD]'):GetChildren())do if ab.Name=='Model'and ab:
FindFirstChild('Towers')and ab.Towers:FindFirstChild('RevealHitbox')and ab.Towers:FindFirstChild('TeleportSFHitbox')then
repeat task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ab.Towers.RevealHitbox.CFrame*CFrame.new(3,
0,0)*CFrame.Angles(math.rad(0),math.rad(50),math.rad(0))wait(0.2)game:GetService('ReplicatedStorage').RetroAbility:
FireServer('Ban Hammer')until ab.Towers:FindFirstChild('Ring of Fire')~=nil wait(0.2)game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=ab.Towers:FindFirstChild('Ring of Fire').CFrame end end end end else Notification(
"You don't have Retro equip",5)end end})T:AddButton({Text='Join Map Slenderman',Func=function()if CheckGlove()==
'Balloony'and CheckUnlockGlove('Pocket').Value==true and(workspace:FindFirstChild('TapeRecorder')and workspace.
TapeRecorder:FindFirstChild('Front'))then if workspace:FindFirstChild('TapeRecorder')and workspace.TapeRecorder:
FindFirstChild('Front')then _G.Code={}Soon={}if workspace.TapeRecorder:FindFirstChild('PowerButton').Color~=Color3.
fromRGB(0,255,0)then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.TapeRecorder:FindFirstChild(
'PowerButton').CFrame*CFrame.new(0,0,-5)wait(0.5)if fireproximityprompt then fireproximityprompt(workspace.TapeRecorder.
Front:FindFirstChild('ProximityPrompt'))end end repeat task.wait()if workspace.TapeRecorder:FindFirstChild('PowerButton'
).Color==Color3.fromRGB(0,255,0)then for aa,ab in pairs(workspace.TapeRecorder.Front:FindFirstChild('DigitsSFX'):
GetChildren())do if ab:IsA('Sound')and ab.Playing==true and not Soon[ab.Name]then table.insert(_G.Code,ab.Name)Soon[ab.
Name]=true end end end until workspace.TapeRecorder:FindFirstChild('PowerButton').Color==Color3.fromRGB(255,0,0)wait(0.3
)if game.Players.LocalPlayer.Character:FindFirstChild('entered')then game:GetService('Players').LocalPlayer.Reset:
FireServer()wait(0.3)repeat task.wait()until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.
LocalPlayer.Character.Humanoid.Health>0 end wait(0.13)equipglove('Pocket')wait(0.2)game:GetService('ReplicatedStorage').
GeneralAbility:FireServer(workspace.Arena.CannonIsland.Cannon.Base.CFrame*CFrame.new(0,0,35))wait(0.2)repeat task.wait()
until workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Pocket")and workspace[game.Players.LocalPlayer.Name..
"'s Pocket"]:FindFirstChild('Hitbox')and workspace[game.Players.LocalPlayer.Name.."'s Pocket"]:FindFirstChild(
'ProximityPrompt')wait(0.3)repeat task.wait()firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),
workspace.Lobby.Teleport1.TouchInterest.Parent,0)firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild(
'Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,1)until game.Players.LocalPlayer.Character:FindFirstChild(
'entered')end wait(0.3)if workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Pocket"):FindFirstChild('Hitbox')
then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace[game.Players.LocalPlayer.Name.."'s Pocket"].
Hitbox.CFrame wait(0.4)fireproximityprompt(workspace[game.Players.LocalPlayer.Name.."'s Pocket"].ProximityPrompt)end
wait(5)if game.Workspace:FindFirstChild('RoomsFolder')then for aa,ab in pairs(game.Workspace.RoomsFolder:GetChildren())
do if ab.Name==(game.Players.LocalPlayer.Name.."'s Room")and ab:FindFirstChild('PocketKeypad')then fireclickdetector(ab.
PocketKeypad.Buttons:FindFirstChild('Reset'):FindFirstChild('ClickDetector'))wait(0.2)for ac,ad in ipairs(_G.Code)do
fireclickdetector(ab.PocketKeypad.Buttons:FindFirstChild(ad):FindFirstChild('ClickDetector'))wait(0.46)end task.wait(
0.15)fireclickdetector(ab.PocketKeypad.Buttons:FindFirstChild('Enter'):FindFirstChild('ClickDetector'))end end end wait(
0.3)game:GetService('Players').LocalPlayer.Reset:FireServer()wait(0.3)repeat task.wait()until game.Players.LocalPlayer.
Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.
Character:FindFirstChild('Humanoid')and game.Players.LocalPlayer.Character.Humanoid.Health>0 wait(0.3)for aa,ab in
pairs(workspace.BountyHunterRoom:FindFirstChild('BountyHunterMysteryRoom'):FindFirstChild('Pages'):GetChildren())do if
ab:IsA('BasePart')and ab:FindFirstChild('ClickDetector')then fireclickdetector(ab:FindFirstChild('ClickDetector'))end
end wait(0.3)repeat task.wait()until workspace:FindFirstChild('BountyHunterRoom')and workspace.BountyHunterRoom:
FindFirstChild('BountyHunterLever')and workspace.BountyHunterRoom.BountyHunterLever:FindFirstChild('Root')wait(0.15)if
workspace:FindFirstChild('BountyHunterRoom')and workspace.BountyHunterRoom:FindFirstChild('BountyHunterLever')and
workspace.BountyHunterRoom.BountyHunterLever:FindFirstChild('Root')then if game.Players.LocalPlayer.Character and game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then game.Players.LocalPlayer.Character.HumanoidRootPart
.CFrame=workspace.BountyHunterRoom.BountyHunterLever.Root.CFrame wait(0.4)if fireproximityprompt then
fireproximityprompt(workspace.BountyHunterRoom.BountyHunterLever.Root:FindFirstChild('ProximityPrompt'))end repeat task.
wait()until workspace.Lobby:FindFirstChild('Clothesline Model')and workspace.Lobby['Clothesline Model']:FindFirstChild(
'Part')and workspace.Lobby['Clothesline Model'].Part:FindFirstChild('jerma').Texture=='rbxassetid://16591849948'game.
Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.Lobby['Clothesline Model']:FindFirstChild('Part').CFrame
wait(0.3)if fireclickdetector then fireclickdetector(workspace.Lobby['Clothesline Model'].Part:FindFirstChild(
'ClickDetector'))end end end else Notification(
[[You don't have Balloon or not owner glove Pocket, or you have equip Pocket spawn Tape Recorder]],_G.TimeNotify)end end
})T:AddButton({Text='Join Job Application',Func=function()equipglove('Extended')wait(0.3)if workspace:FindFirstChild(
'JobApplication')and workspace.JobApplication:FindFirstChild('paper')then game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=workspace.JobApplication.paper.CFrame wait(0.3)fireclickdetector(workspace.JobApplication.paper.
ClickDetector)end end})T:AddButton({Text='Join Map Egger',Func=function()if workspace:FindFirstChild('EasterHuntEggs')==
nil then Notification('You have get Hitman quest',_G.TimeNotify)repeat task.wait()until workspace:FindFirstChild(
'EasterHuntEggs')end if workspace:FindFirstChild('EasterHuntEggs')then for aa,ab in pairs(workspace.EasterHuntEggs:
GetChildren())do ab.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end end wait(0.5)if workspace:
FindFirstChild('EggTeleport')==nil then repeat task.wait()until workspace:FindFirstChild('EggTeleport')end if workspace:
FindFirstChild('EggTeleport')and workspace.EggTeleport:FindFirstChild('ClickDetector')then game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=workspace:FindFirstChild('EggTeleport').CFrame if fireclickdetector then
fireclickdetector(workspace.EggTeleport.ClickDetector)end end end})T:AddButton({Text='Join Map Plunger',Func=function()
if workspace:FindFirstChild('BountyHunterRoom')and workspace.BountyHunterRoom:FindFirstChild('PlungerMain')then game.
Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.BountyHunterRoom:FindFirstChild('PlungerMain').CFrame if
fireclickdetector then fireclickdetector(workspace.BountyHunterRoom.PlungerMain:FindFirstChildOfClass('ClickDetector'))
end end repeat task.wait()until workspace:FindFirstChild('plungers')and workspace.plungers:FindFirstChild(
'ToiletPlunger').Transparency<1 wait(0.4)if workspace:FindFirstChild('plungers')and workspace.plungers:FindFirstChild(
'ToiletPlunger')and workspace.plungers.ToiletPlunger:FindFirstChildOfClass('ClickDetector')then if fireclickdetector
then fireclickdetector(workspace.plungers.ToiletPlunger:FindFirstChildOfClass('ClickDetector'))end end end})T:AddToggle(
'Friday the 13th',{Text='Auto Join Friday the 13th',Default=false,Callback=function(aa)_G.Fridayth=aa while _G.Fridayth
do if game.Players.LocalPlayer.Character:FindFirstChild('InLabyrinth')then for ab,ac in pairs(workspace:GetChildren())do
if string.find(ac.Name,'Labyrinth')and ac:FindFirstChild('PaintingModel')and ac.PaintingModel:FindFirstChild('HitBox')
then if ac.PaintingModel.HitBox:FindFirstChild('TouchInterest')then game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame=ac.PaintingModel:FindFirstChild('HitBox').CFrame end end end end task.wait()end end})if hookmetamethod then local
aa=T:AddLabel('Glove Replica',true)table.insert(_G.ConnectFun,game:GetService('RunService').RenderStepped:Connect(
function()local ab=(1-(0.9998666666666667)^ReplicaCount)*100 if aa then if CheckGlove():lower():find('replica')then aa:
SetText(string.format('Spawn Replica: %d | Rate: 1/7500 | Chance: %.2f%%',ReplicaCount,ab))else aa:SetText(
'Replica reset, The reason is because you changed gloves ['..CheckGlove()..']')ReplicaCount=0 end end end))end T:
AddDropdown('Farm Bob',{Text='Farm Bob',Values={'Walk','Teleport'},Default='',Multi=false,Callback=function(aa)_G.
BobFarmCh=aa end})T:AddToggle('Bob',{Text='Bob Farm',Default=false,Callback=function(aa)_G.BobFarm=aa if CheckGlove()~=
'Replica'and aa==true then Notification("You don't have Replica equipped",5)wait(0.05)g['Bob']:SetValue(false)end end})
local aa=false local ab=0 table.insert(_G.ConnectFun,game:GetService('RunService').Heartbeat:Connect(function()if _G.
BobFarm and CheckGlove()=='Replica'then if aa and(os.clock()-ab>5)then aa=false end if aa then return end local ac,ad=
pcall(function()local ac=game:GetService('Players').LocalPlayer.Character if not ac then return end local ad=ac:
FindFirstChild('HumanoidRootPart')local ae=ac:FindFirstChild('Humanoid')if ad and ae and ae.Health>0 then if not ac:
FindFirstChild('entered')then local af=game.Workspace:FindFirstChild('Lobby'):FindFirstChild('Teleport1')if af then if
_G.BobFarmCh=='Walk'then ae:MoveTo(af.Position)else firetouchinterest(ad,af,0)firetouchinterest(ad,af,1)end end else aa=
true ab=os.clock()if _G.BobFarmCh=='Walk'then ae:MoveTo(ad.Position)end task.wait(0.19)game:GetService(
'ReplicatedStorage').Duplicate:FireServer(true)task.wait(0.2)game:GetService('Players').LocalPlayer.Reset:FireServer()
repeat task.wait()ac=game:GetService('Players').LocalPlayer.Character or nil until ac and not ac:FindFirstChild(
'entered')and ac:FindFirstChild('HumanoidRootPart')task.wait(0.5)aa=false end end end)if not ac then aa=false end end
end))T:AddToggle('Bus Stab',{Text='Bus Stab',Default=false,Callback=function(ac)_G.BusStab=ac while _G.BusStab do if
game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then for ad,ae in pairs(game.Workspace:GetChildren(
))do if ae.Name=='BusModel'then ae.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end end end task.
wait()end end})T:AddToggle('Toolbox Farm',{Text='Toolbox Farm',Default=false,Callback=function(ac)_G.Toolboxfarm=ac
while _G.Toolboxfarm do if game.Workspace:FindFirstChild('Toolbox')then for ad,ae in pairs(game.Workspace:GetChildren())
do if ae.Name=='Toolbox'then if ae:FindFirstChild('Main')then ae.Main.CFrame=game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame*CFrame.new(-5,-1.63,0)end if fireclickdetector and ae:FindFirstChild('ClickDetector')then
fireclickdetector(ae.ClickDetector,0)fireclickdetector(ae.ClickDetector,1)end end end end task.wait()end end})T:
AddToggle('Hallow Jack Farm',{Text='Hallow Jack Farm',Default=false,Callback=function(ac)_G.HallowJackFarm=ac while _G.
HallowJackFarm do if workspace:FindFirstChild('Gravestone')then for ad,ae in pairs(game.Workspace:GetChildren())do if ae
.Name=='Gravestone'and ae:FindFirstChild('ClickDetector')then if game.Players.LocalPlayer.Character:FindFirstChild(
'KillstreakLevel')and game.Players.LocalPlayer.Character.KillstreakLevel.Value>9 then for af,ag in pairs(ae:GetChildren(
))do if ag:IsA('BasePart')then ag.CFrame=game.Players.LocalPlayer.Character.Head.CFrame*CFrame.new(0,1,0)end end if
fireclickdetector then fireclickdetector(ae.ClickDetector,0)fireclickdetector(ae.ClickDetector,1)end end end end elseif
workspace:FindFirstChild('Gravestone')==nil and game.Players.LocalPlayer.Character:FindFirstChild('KillstreakLevel')and
game.Players.LocalPlayer.Character:FindFirstChild('KillstreakLevel').Value>9 then game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=workspace['Safespot'].CFrame*CFrame.new(0,10,0)end task.wait()end end})T:AddDropdown('OrbFarm',{
Text='Orb Farm',Values={'Phase','Jet','MATERIALIZE','Siphon','Glitch'},Default={'Phase','Jet'},Multi=true})T:AddToggle(
'Orb Farm',{Text='Auto Orb Farm',Default=false,Callback=function(ac)_G.FarmOrbTP=ac while _G.FarmOrbTP do if game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character:FindFirstChild(
'entered')then local ad=f.OrbFarm and f.OrbFarm.Value or nil if ad then for ae,af in pairs(game.Workspace:GetChildren())
do if(ad['Jet']and af.Name=='JetOrb')or(ad['Phase']and af.Name=='PhaseOrb')or(ad['MATERIALIZE']and af.Name==
'MATERIALIZEOrb')or(ad['Siphon']and af.Name=='SiphonOrb')or(ad['Glitch']and af.Name:find('Orb')and af:FindFirstChild(
'Attachment')and af.Attachment:FindFirstChild('OrbGlitchEffect'))then local ag=game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart').CFrame game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame=
af.CFrame wait(0.37)game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame=ag wait(0.7)end end end
end task.wait()end end})T:AddToggle('Phase Or Jet Glitch',{Text='Phase & Jet Glitch',Default=false,Callback=function(ac)
_G.Glitchfarm=ac while _G.Glitchfarm do if CheckGlove()=='Error'then for ad,ae in pairs(game.Workspace:GetChildren())do
if ae.Name=='JetOrb'or ae.Name=='PhaseOrb'then game.ReplicatedStorage.Errorhit:FireServer(ae)end end end task.wait()end
end})T:AddToggle('Gift Farm',{Text='Gift Farm',Default=false,Callback=function(ac)_G.Giftfarm=ac while _G.Giftfarm do if
game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then for ad,ae in pairs(game.Workspace:GetChildren(
))do if ae.Name=='Gift'then ae.CFrame=game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame end
end end task.wait()end end})T:AddToggle('AutoFram Brick',{Text='AutoFram Brick',Default=false,Callback=function(ac)_G.
Brickfarm=ac if CheckGlove()=='Brick'then while _G.Brickfarm do if game.Players.LocalPlayer.Character:FindFirstChild(
'Brick')then game:GetService('ReplicatedStorage').lbrick:FireServer()end task.wait()end elseif Brickfarm==true then
Notification("You don't have Brick equipped",_G.TimeNotify)wait(0.05)g['AutoFram Brick']:SetValue(false)end end})T:
AddToggle('Get Tycoon',{Text='Get Tycoon',Default=false,Callback=function(ac)_G.AutoTpPlate=ac if game.Players.
LocalPlayer.Character:FindFirstChild('entered')and#game.Players:GetPlayers()>=7 then while _G.AutoTpPlate do if game.
Players.LocalPlayer.Character:FindFirstChild('entered')and#game.Players:GetPlayers()>=7 then game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=game.workspace.Arena.Plate.CFrame end task.wait()end elseif _G.AutoTpPlate==true then
Notification('You need enter erane, or 7 people the server',_G.TimeNotify)wait(0.05)g['Get Tycoon']:SetValue(false)end
end})TabBoxMastery=Tabs.Tab3:AddRightTabbox()local ac=TabBoxMastery:AddTab('Mastery')ac:AddDropdown('Farm Mastery',{Text
='Farm Mastery',Values={'Replica','Baller','Null'},Default='',Multi=false,Callback=function(ad)_G.FarmMastery=ad end})
function MasteryPlayers(ad,ae)local af=game.Players.LocalPlayer local ag=af.Character if not ag or not ag:
FindFirstChild('HumanoidRootPart')then return end local function enterporter(ah)if not ag then return end if not ag:
FindFirstChild('entered')then local U=workspace.Lobby[ah].TouchInterest.Parent repeat task.wait()if firetouchinterest
then firetouchinterest(ag.Head,U,0)firetouchinterest(ag.Head,U,1)else ag.HumanoidRootPart.CFrame=U.CFrame end until ag:
FindFirstChild('entered')end end af.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)wait(
0.5)if ae==true then if ag:FindFirstChild('entered')==nil and game.Players.LocalPlayer:FindFirstChild('leaderstats'):
FindFirstChild('Slaps').Value>=666 then equipglove('Ghost')repeat task.wait()until CheckGlove():lower()=='ghost'game.
ReplicatedStorage.Ghostinvisibilityactivated:FireServer()equipglove(ad)task.wait(1)for ah,U in pairs(ag:GetChildren())do
if U:IsA('BasePart')and U.Name~='HumanoidRootPart'then U.Transparency=0 end end end end enterporter('Teleport1')wait(
0.35)af.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)wait(0.3)if ag:FindFirstChild(
'entered')then local ah={}for U,V in pairs(game.Players:GetChildren())do if V~=game.Players.LocalPlayer and V.Character
and V.Character:FindFirstChild('HumanoidRootPart')and V.Character.HumanoidRootPart.BrickColor~=BrickColor.new(
'New Yeller')and V.Character:FindFirstChild('Ragdolled')and not V.Character.HumanoidRootPart:FindFirstChild(
'BlockedShield')and V.Character.Ragdolled.Value==false and V.Character.isInArena.Value==true and notSlap(V.Character,
BlackList)then table.insert(ah,V)end end if#ah~=0 then return ah[math.random(#ah)]end end return nil end function
SpawnFarmMastery()local ad=game.Players.LocalPlayer local ae=ad.Character if not ae or not ae:FindFirstChild(
'HumanoidRootPart')then return end local af=CheckGlove()local ag if _G.FarmMastery then if _G.FarmMastery:lower()==
'baller'then ag='Baller'elseif _G.FarmMastery:lower()=='null'then ag='Null'else ag='Replica'end else ag='Replica'end
local function abilityspawn()local ah=CheckGlove():lower()if ah=='baller'then game.ReplicatedStorage.GeneralAbility:
FireServer()elseif ah=='null'then game.ReplicatedStorage.NullAbility:FireServer()else game.ReplicatedStorage.Duplicate:
FireServer(true)end end local function enterporter(ah)if not ae then return end if not ae:FindFirstChild('entered')then
local U=workspace.Lobby[ah].TouchInterest.Parent repeat task.wait()if firetouchinterest then firetouchinterest(ae.Head,U
,0)firetouchinterest(ae.Head,U,1)else ae.HumanoidRootPart.CFrame=U.CFrame end until ae:FindFirstChild('entered')end end
equipglove(ag)task.wait(0.3)if ag:lower()~='null'then enterporter('Teleport2')end wait(0.3)ae.HumanoidRootPart.CFrame=
workspace['SafeBox'].CFrame*CFrame.new(0,5,0)if ag:lower()=='null'then ae.HumanoidRootPart.CFrame=workspace.
BountyHunterRoom.Build.Union.CFrame*CFrame.new(0,0,5)end task.wait(0.6)if ag:lower()~='null'then abilityspawn()else
repeat task.wait()abilityspawn()until ag:lower()~='null'or(workspace:FindFirstChild('Imp')and workspace.Imp:
FindFirstChild('Body'))end if ag:lower()~='null'then ad.Reset:FireServer()repeat task.wait()until ad.Character and ad.
Character:FindFirstChild('HumanoidRootPart')and not ad.Character:FindFirstChild('entered')end equipglove(af)task.wait(
0.3)enterporter('Teleport1')ae.HumanoidRootPart.CFrame=workspace.SafeBox.CFrame*CFrame.new(0,5,0)end ac:AddDropdown(
'Spring Mastery',{Text='Spring Mastery',Values={'Jump Over Player','Evade Player','Jump Land 2 Sec Player'},Default='',
Multi=false,Callback=function(ad)_G.SpringMastery=ad end})ac:AddToggle('Auto Spring Mastery',{Text='Auto Spring Mastery'
,Default=false,Callback=function(ad)_G.AutoSpringMastery=ad if CheckGlove()=='Spring'then while _G.AutoSpringMastery do
local ae=MasteryPlayers(CheckGlove(),false)if ae then CreateFreezeBV()for af,ag in pairs(game.Players.LocalPlayer.
Character:GetChildren())do if ag:IsA('BasePart')then ag.CanCollide=true end end if _G.SpringMastery=='Jump Over Player'
then game:GetService('ReplicatedStorage'):WaitForChild('SpringJump'):FireServer()wait(0.56)game.Players.LocalPlayer.
Character:SetPrimaryPartCFrame(ae.Character:FindFirstChild('HumanoidRootPart').CFrame*CFrame.new(0,-6,5))repeat task.
wait()until _G.AutoSpringMastery==false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.Character:
FindFirstChild('HumanoidRootPart').Position).Magnitude<8 wait(0.3)for af=1,3 do slapglove(ae.Character.HumanoidRootPart)
task.wait()end wait(0.2)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.
new(0,5,0)wait(2.7)elseif _G.SpringMastery=='Evade Player'then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(
ae.Character:FindFirstChild('HumanoidRootPart').CFrame*CFrame.new(0,-6,5))repeat task.wait()until _G.AutoSpringMastery==
false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.Character:FindFirstChild('HumanoidRootPart').
Position).Magnitude<8 wait(0.3)for af=1,3 do slapglove(ae.Character.HumanoidRootPart)task.wait()end game:GetService(
'ReplicatedStorage'):WaitForChild('SpringJump'):FireServer()wait(0.1)game.Players.LocalPlayer.Character.HumanoidRootPart
.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)wait(2.7)elseif _G.SpringMastery=='Jump Land 2 Sec Player'then game
:GetService('ReplicatedStorage'):WaitForChild('SpringJump'):FireServer()task.wait(1.4)game.Players.LocalPlayer.Character
:SetPrimaryPartCFrame(ae.Character:FindFirstChild('HumanoidRootPart').CFrame*CFrame.new(0,-6,5))repeat task.wait()until
_G.AutoSpringMastery==false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.Character:FindFirstChild(
'HumanoidRootPart').Position).Magnitude<8 wait(0.3)for af=1,3 do slapglove(ae.Character.HumanoidRootPart)task.wait()end
wait(0.2)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)wait(
4.6)end end task.wait()end elseif _G.AutoSpringMastery==true then Notification("You don't have Spring equipped",_G.
TimeNotify)wait(0.05)g['Auto Spring Mastery']:SetValue(false)end end})ac:AddDropdown('Acrobat Mastery',{Text=
'Acrobat Mastery',Values={'Roll Slap Player','Slap Roll Player','Combo Player'},Default='',Multi=false,Callback=function
(ad)_G.AcrobatMastery=ad end})ac:AddToggle('Auto Acrobat Mastery',{Text='Auto Acrobat Mastery',Default=false,Callback=
function(ad)_G.AutoAcrobatMastery=ad if CheckGlove()=='Acrobat'then while _G.AutoAcrobatMastery do local ae=
MasteryPlayers(CheckGlove(),true)if ae then CreateFreezeBV()if _G.AcrobatMastery=='Roll Slap Player'then game:
GetService('ReplicatedStorage').Roll:FireServer()wait(0.8)game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(ae.
Character:FindFirstChild('Head').CFrame*CFrame.new(0,7,0))repeat task.wait()until _G.AutoAcrobatMastery==false or(game.
Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.Character:FindFirstChild('HumanoidRootPart').Position).
Magnitude<8 wait(0.3)for af=1,3 do slapglove(ae.Character.Head)task.wait()end wait(0.2)game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)wait(2.7)elseif _G.AcrobatMastery==
'Slap Roll Player'then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(ae.Character:FindFirstChild('Head').
CFrame*CFrame.new(0,7,0))repeat task.wait()until _G.AutoAcrobatMastery==false or(game.Players.LocalPlayer.Character.
HumanoidRootPart.Position-ae.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude<8 wait(0.3)for af=1,3 do
game:GetService('ReplicatedStorage').Roll:FireServer()slapglove(ae.Character.Head)task.wait()end wait(0.1)game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)wait(2.7)elseif _G.
AcrobatMastery=='Combo Player'then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(ae.Character:FindFirstChild(
'Head').CFrame*CFrame.new(0,7,0))repeat task.wait()until _G.AutoAcrobatMastery==false or(game.Players.LocalPlayer.
Character.HumanoidRootPart.Position-ae.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude<8 wait(0.3)for
af=1,3 do slapglove(ae.Character.Head)task.wait()end wait(0.2)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)game:GetService('ReplicatedStorage').Roll:FireServer()repeat task.wait()
until _G.AutoAcrobatMastery==false or ae.Character:FindFirstChild('Ragdolled').Value==false wait(0.15)game.Players.
LocalPlayer.Character:SetPrimaryPartCFrame(ae.Character:FindFirstChild('Head').CFrame*CFrame.new(0,7,0))repeat task.
wait()until _G.AutoAcrobatMastery==false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.Character:
FindFirstChild('HumanoidRootPart').Position).Magnitude<8 wait(0.3)for af=1,3 do slapglove(ae.Character.Head)task.wait()
end wait(0.2)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)
wait(4.4)end end task.wait()end elseif _G.AutoAcrobatMastery==true then Notification("You don't have Acrobat equipped",
_G.TimeNotify)wait(0.05)g['Auto Acrobat Mastery']:SetValue(false)end end})ac:AddDropdown('Phantom Mastery',{Text=
'Phantom Mastery',Values={'Jumpscare Player','Combo Player'},Default='',Multi=false,Callback=function(ad)_G.
PhantomMastery=ad end})ac:AddToggle('Auto Phantom Mastery',{Text='Auto Phantom Mastery',Default=false,Callback=function(
ad)_G.AutoPhantomMastery=ad if CheckGlove()=='Phantom'then while _G.AutoPhantomMastery do local ae=MasteryPlayers(
CheckGlove(),true)if ae then CreateFreezeBV()PhantomTool=(game.Players.LocalPlayer.Character:FindFirstChild(CheckGlove()
)or game.Players.LocalPlayer.Backpack:FindFirstChild(CheckGlove()))or nil if _G.PlankMastery=='Jumpscare Player'then
repeat task.wait()if PhantomTool then game:GetService('ReplicatedStorage').PhantomDash:InvokeServer(PhantomTool)end
until _G.AutoPhantomMastery==false or game.Players.LocalPlayer.Character:GetAttribute('phantom')wait(0.4)repeat task.
wait()until _G.AutoPhantomMastery==false or not game.Players.LocalPlayer.Character:GetAttribute('phantom')wait(0.3)game.
Players.LocalPlayer.Character:SetPrimaryPartCFrame(ae.Character:FindFirstChild('Head').CFrame*CFrame.new(0,7,0))repeat
task.wait()until _G.AutoPhantomMastery==false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.
Character:FindFirstChild('HumanoidRootPart').Position).Magnitude<8 wait(0.3)for af=1,5 do slapglove(ae.Character.Head)
task.wait()end wait(0.2)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.
new(0,5,0)wait(0.65)elseif _G.PlankMastery=='Combo Player'then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(
ae.Character:FindFirstChild('Head').CFrame*CFrame.new(0,7,0))repeat task.wait()until _G.AutoPhantomMastery==false or(
game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.Character:FindFirstChild('HumanoidRootPart').Position).
Magnitude<8 wait(0.3)for af=1,3 do slapglove(ae.Character.Head)task.wait()end wait(0.2)game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)wait(0.35)repeat task.wait()if
PhantomTool then game:GetService('ReplicatedStorage').PhantomDash:InvokeServer(PhantomTool)end until _G.
AutoPhantomMastery==false or game.Players.LocalPlayer.Character:GetAttribute('phantom')wait(0.4)repeat task.wait()until
_G.AutoPhantomMastery==false or not game.Players.LocalPlayer.Character:GetAttribute('phantom')task.wait(0.1)local af=
players[math.random(#players)]game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(af.Character:FindFirstChild('Head'
).CFrame*CFrame.new(0,7,0))repeat task.wait()until _G.AutoPhantomMastery==false or(game.Players.LocalPlayer.Character.
HumanoidRootPart.Position-af.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude<8 wait(0.3)for ag=1,3 do
slapglove(af.Character.Head)task.wait()end wait(0.2)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace
['SafeBox'].CFrame*CFrame.new(0,5,0)wait(4.4)end end task.wait()end elseif _G.AutoPhantomMastery==true then
Notification("You don't have Phantom equipped, or you have 19k+ slap",_G.TimeNotify)wait(0.05)g['Auto Phantom Mastery']:
SetValue(false)end end})ac:AddDropdown('Plank Mastery',{Text='Plank Mastery',Values={'Ambush Player','Plank Hit Player'}
,Default='',Multi=false,Callback=function(ad)_G.PlankMastery=ad end})ac:AddToggle('Auto Plank Mastery',{Text=
'Auto Plank Mastery',Default=false,Callback=function(ad)_G.AutoPlankMastery=ad if CheckGlove()=='Plank'then while _G.
AutoPlankMastery do local ae=MasteryPlayers(CheckGlove(),true)if ae then CreateFreezeBV()if _G.PlankMastery==
'Ambush Player'then if not workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Plank")or workspace:
FindFirstChild(game.Players.LocalPlayer.Name.."'s Plank"):GetAttribute('collect')then game:GetService(
'ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer(CFrame.new(0,0,0),Vector3.new(math.huge,0,0))wait(1.7)end
if workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Plank")and not workspace:FindFirstChild(game.Players.
LocalPlayer.Name.."'s Plank"):GetAttribute('collect')then CreateFreezeBV({Remove=true})game.Players.LocalPlayer.
Character:SetPrimaryPartCFrame(workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Plank").CFrame*CFrame.new(0,0
,3)*CFrame.Angles(math.rad(60),math.rad(0),math.rad(0)))wait(1.7)game.Players.LocalPlayer.Character:
SetPrimaryPartCFrame(workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Plank").CFrame*CFrame.new(0,7,0)*CFrame
.Angles(math.rad(60),math.rad(0),math.rad(0)))end wait(2.5)CreateFreezeBV()wait(0.25)game.Players.LocalPlayer.Character:
SetPrimaryPartCFrame(ae.Character:FindFirstChild('Head').CFrame*CFrame.new(0,7,0))repeat task.wait()until _G.
AutoPlankMastery==false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.Character:FindFirstChild(
'HumanoidRootPart').Position).Magnitude<8 wait(0.3)for af=1,5 do slapglove(ae.Character.Head)task.wait()end wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)task.wait(4.5)
elseif _G.PlankMastery=='Plank Hit Player'then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(ae.Character:
FindFirstChild('HumanoidRootPart').CFrame*CFrame.new(0,0,6))repeat task.wait()until _G.AutoPlankMastery==false or(game.
Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.Character:FindFirstChild('HumanoidRootPart').Position).
Magnitude<8 wait(0.3)game:GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer(CFrame.new(0,0,0),
Vector3.new(math.huge,0,0))wait(0.3)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].
CFrame*CFrame.new(0,5,0)wait(3.7)end end task.wait()end elseif _G.AutoPlankMastery==true then Notification(
"You don't have Plank equipped, or you have 19k+ slap",_G.TimeNotify)wait(0.05)g['Auto Plank Mastery']:SetValue(false)
end end})ac:AddDropdown('Moon Mastery',{Text='Moon Mastery',Values={'Unequip + Ragdoll Time','Slap Player'},Default='',
Multi=false,Callback=function(ad)_G.MoonMastery=ad end})ac:AddToggle('Auto Moon Mastery',{Text='Auto Moon Mastery',
Default=false,Callback=function(ad)_G.AutoMoonMastery=ad if not _G.AutoMoonMastery then CreateFreezeBV({Remove=true})end
if CheckGlove()=='Moon'then while _G.AutoMoonMastery do if _G.MoonMastery=='Slap Player'then local ae=MasteryPlayers(
CheckGlove(),true)if ae then CreateFreezeBV()game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(ae.Character:
FindFirstChild('Head').CFrame*CFrame.new(0,7,0))repeat task.wait()until _G.AutoMoonMastery==false or(game.Players.
LocalPlayer.Character.HumanoidRootPart.Position-ae.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude<8
wait(0.3)for af=1,3 do slapglove(ae.Character:FindFirstChild('Head'))wait(0.2)end game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)task.wait(4.5)end elseif _G.MoonMastery==
'Unequip + Ragdoll Time'then if game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then repeat task.wait()firetouchinterest(game.Players.
LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,0)firetouchinterest(game.
Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,1)until game.Players.
LocalPlayer.Character:FindFirstChild('entered')wait(0.3)end game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=
workspace['SafeBox'].CFrame*CFrame.new(0,5,0)CreateFreezeBV()game.ReplicatedStorage.SelfKnockback:FireServer({['Force']=
-99})if game.Players.LocalPlayer.Character:FindFirstChild('Moon')then game.Players.LocalPlayer.Character:FindFirstChild(
'Moon').Parent=game.Players.LocalPlayer.Backpack end if game.Players.LocalPlayer.Backpack:FindFirstChild('Moon')then
game.Players.LocalPlayer.Backpack:FindFirstChild('Moon').Parent=game.Players.LocalPlayer.Character end end task.wait()
end elseif ad==true then Notification("You don't have Moon equipped",_G.TimeNotify)wait(0.05)g['Auto Moon Mastery']:
SetValue(false)end end})ac:AddDropdown('Eggler Mastery',{Text='Eggler Mastery',Values={'Unegg Slap Player',
'Deny Slap Player'},Default='',Multi=false,Callback=function(ad)_G.EgglerMastery=ad end})ac:AddToggle(
'Auto Eggler Mastery',{Text='Auto Eggler Mastery',Default=false,Callback=function(ad)_G.AutoEgglerMastery=ad if not _G.
AutoEgglerMastery then CreateFreezeBV({Remove=true})end if CheckGlove()=='Eggler'then while _G.AutoEgglerMastery do
local ae=MasteryPlayers(CheckGlove(),true)if ae then CreateFreezeBV()if _G.EgglerMastery=='Deny Slap Player'then game.
Players.LocalPlayer.Character:SetPrimaryPartCFrame(ae.Character:FindFirstChild('Head').CFrame*CFrame.new(0,7,0))repeat
task.wait()until _G.AutoEgglerMastery==false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.
Character:FindFirstChild('HumanoidRootPart').Position).Magnitude<8 wait(0.3)for af=1,3 do slapglove(random.Character:
FindFirstChild('Head'))task.wait(0.2)end game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox']
.CFrame*CFrame.new(0,5,0)repeat task.wait()game:GetService('ReplicatedStorage'):WaitForChild('Events'):WaitForChild(
'EgglerRAbility'):FireServer()until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:
GetAttribute('isEgg')repeat task.wait()game:GetService('ReplicatedStorage'):WaitForChild('Events'):WaitForChild(
'EgglerRAbility'):FireServer()until game.Players.LocalPlayer.Character and not game.Players.LocalPlayer.Character:
GetAttribute('isEgg')elseif _G.EgglerMastery=='Unegg Slap Player'then repeat task.wait()game:GetService(
'ReplicatedStorage'):WaitForChild('Events'):WaitForChild('EgglerRAbility'):FireServer()until game.Players.LocalPlayer.
Character and game.Players.LocalPlayer.Character:GetAttribute('isEgg')repeat task.wait()game:GetService(
'ReplicatedStorage'):WaitForChild('Events'):WaitForChild('EgglerRAbility'):FireServer()until game.Players.LocalPlayer.
Character and not game.Players.LocalPlayer.Character:GetAttribute('isEgg')wait(0.3)for af=1,3 do slapglove(random.
Character:FindFirstChild('Head'))task.wait(0.2)end game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace[
'SafeBox'].CFrame*CFrame.new(0,5,0)end task.wait(4.5)end task.wait()end elseif ad==true then Notification(
"You don't have Eggler equipped",_G.TimeNotify)wait(0.05)g['Auto Eggler Mastery']:SetValue(false)end end})ac:
AddDropdown('Thanos Mastery',{Text='Thanos Mastery',Values={'Ambush Player','Combo Player'},Default='',Multi=false,
Callback=function(ad)_G.ThanosMastery=ad end})ac:AddToggle('Auto Thanos Mastery',{Text='Auto Thanos Mastery',Default=
false,Callback=function(ad)_G.AutoThanosMastery=ad if not _G.AutoThanosMastery then CreateFreezeBV({Remove=true})end if
CheckGlove()=='Thanos'then while _G.AutoThanosMastery do local ae=MasteryPlayers(CheckGlove(),true)if ae then
CreateFreezeBV()if _G.ThanosMastery=='Ambush Player'then game:GetService('ReplicatedStorage'):WaitForChild(
'GeneralAbility'):FireServer(2)task.wait(1.9)for af=1,3 do game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(ae.
Character:FindFirstChild('Head').CFrame*CFrame.new(0,7,0))repeat task.wait()until _G.AutoThanosMastery==false or(game.
Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.Character:FindFirstChild('HumanoidRootPart').Position).
Magnitude<8 wait(0.3)slapglove(ae.Character:FindFirstChild('Head'))task.wait(0.8)end game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)elseif _G.ThanosMastery=='Combo Player'then game.
Players.LocalPlayer.Character:SetPrimaryPartCFrame(ae.Character:FindFirstChild('Head').CFrame*CFrame.new(0,7,0))repeat
task.wait()until _G.AutoThanosMastery==false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.
Character:FindFirstChild('HumanoidRootPart').Position).Magnitude<8 wait(0.3)for af=1,3 do slapglove(ae.Character:
FindFirstChild('Head'))task.wait(0.2)end game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox']
.CFrame*CFrame.new(0,5,0)game:GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer(2)task.wait(1.9)
for af=1,3 do game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(ae.Character:FindFirstChild('Head').CFrame*CFrame.
new(0,7,0))repeat task.wait()until _G.AutoThanosMastery==false or(game.Players.LocalPlayer.Character.HumanoidRootPart.
Position-ae.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude<8 wait(0.3)slapglove(ae.Character:
FindFirstChild('Head'))task.wait(0.9)end game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox']
.CFrame*CFrame.new(0,5,0)end task.wait(5.8)end task.wait()end elseif ad==true then Notification(
"You don't have Thanos equipped",_G.TimeNotify)wait(0.05)g['Auto Thanos Mastery']:SetValue(false)end end})ac:
AddDropdown('Chain Mastery',{Text='Chain Mastery',Values={'Arc lightning','Lightning 3 player',
'Lightning 6 player (7 player)','Slap (No player group)'},Default='',Multi=false,Callback=function(ad)_G.ChainMastery=ad
end})ac:AddToggle('Auto Chain Mastery',{Text='Auto Chain Mastery',Default=false,Callback=function(ad)_G.AutoChainMastery
=ad if not _G.AutoChainMastery then CreateFreezeBV({Remove=true})end if CheckGlove()=='Chain'then while _G.
AutoChainMastery do local ae=MasteryPlayers(CheckGlove(),true)if _G.ChainMastery:find('lightning')or _G.ChainMastery:
find('Lightning')then if _G.ChainMastery=='Arc lightning'then numberPlayers=2 elseif _G.ChainMastery==
'Lightning 3 player'then numberPlayers=3 elseif _G.ChainMastery=='Lightning 6 player (7 player)'then numberPlayers=7 end
local af=findGroup(20,(numberPlayers or 2))if af then local ag=af[math.random(1,#af)]if ag.Character and ag.Character:
FindFirstChild('HumanoidRootPart')and ag.Character:FindFirstChild('Head')and ag.Character:FindFirstChild('Ragdolled')and
not ag.Character.HumanoidRootPart:FindFirstChild('BlockedShield')and ag.Character.Ragdolled.Value==false and ag.
Character.isInArena.Value==true and notSlap(ag.Character,BlackList)then CreateFreezeBV()game.Players.LocalPlayer.
Character:SetPrimaryPartCFrame(ag.Character:FindFirstChild('Head').CFrame*CFrame.new(0,7,0))repeat task.wait()until _G.
AutoChainMastery==false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ag.Character:FindFirstChild(
'HumanoidRootPart').Position).Magnitude<8 wait(0.26)for ah=1,3 do slapglove(ag.Character:FindFirstChild('Head'))task.
wait(0.2)end game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)
wait(0.4)repeat task.wait()until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:
FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')wait(0.2)end end
elseif _G.ChainMastery:find('Slap')then if ae then CreateFreezeBV()game.Players.LocalPlayer.Character:
SetPrimaryPartCFrame(ae.Character:FindFirstChild('Head').CFrame*CFrame.new(0,7,0))repeat task.wait()until _G.
AutoChainMastery==false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.Character:FindFirstChild(
'HumanoidRootPart').Position).Magnitude<8 task.wait(0.25)for af=1,3 do slapglove(ae.Character:FindFirstChild('Head'))
wait(0.2)end game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)
wait(0.4)game:GetService('Players').LocalPlayer.Reset:FireServer()wait(0.3)repeat task.wait()until game.Players.
LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer
.Character:FindFirstChild('HumanoidRootPart')wait(0.2)end end task.wait()end elseif ad==true then Notification(
"You don't have Chain equipped",_G.TimeNotify)wait(0.05)g['Auto Chain Mastery']:SetValue(false)end end})ac:AddDropdown(
'Obby Mastery',{Text='Obby Mastery',Values={'Spam Obby','Slap Entity'},Default='',Multi=false,Callback=function(ad)_G.
ObbyMastery=ad end})ac:AddToggle('Auto Obby Mastery',{Text='Auto Obby Mastery',Default=false,Callback=function(ad)_G.
AutoObbyMastery=ad if CheckGlove()=='Obby'then while _G.AutoObbyMastery do if _G.ObbyMastery:match('Entity')then local
ae=CheckGlove()SpawnFarmMastery(true)repeat task.wait()until game.Players.LocalPlayer.Character:FindFirstChild('entered'
)wait(0.5)for af,ag in ipairs(workspace:GetChildren())do if ag~=game.Players.LocalPlayer and ag.Name:find('\u{c5}'..game
.Players.LocalPlayer.Name)and ag:FindFirstChild('HumanoidRootPart')then repeat task.wait()if ag:FindFirstChild(
'HumanoidRootPart')then slapglove(ag:FindFirstChild('HumanoidRootPart'))end until ag:FindFirstChild('HumanoidRootPart')
==nil or _G.AutoObbyMastery==false end if ag.Name=='Imp'and ag:FindFirstChild('Body')then repeat task.wait()if ag:
FindFirstChild('Body')then slapglove(ag:FindFirstChild('Body'))end until ag:FindFirstChild('Body')==nil or _G.
AutoObbyMastery==false end end game:GetService('Players').LocalPlayer.Reset:FireServer()repeat task.wait()until not _G.
AutoObbyMastery or game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')==
nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')equipglove(ae)elseif _G.ObbyMastery==
'Spam Obby'then if not workspace:FindFirstChild('ObbyItem'..game.Players.LocalPlayer.Name..'LavaBlock')then repeat task.
wait()if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character:
FindFirstChild('entered')==nil then equipglove('Fort')repeat task.wait()until not _G.AutoObbyMastery or CheckGlove()==
'Fort'wait(0.3)repeat task.wait()if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:
FindFirstChild('entered')==nil then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace:
FindFirstChild('Lobby'):FindFirstChild('Teleport1').CFrame end until game.Players.LocalPlayer.Character and game.Players
.LocalPlayer.Character:FindFirstChild('entered')task.wait(0.6)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
=workspace.BountyHunterRoom.BountyHunterBooth._bountyRoomWarpPart.CFrame task.wait(0.5)game.Players.LocalPlayer.
Character.Humanoid:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,0,20))task.wait(4)
game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
CreateFreezeBV({Name='SpamObby'})game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(209,-28006,1)
wait(0.8)for ae=1,2 do game:GetService('ReplicatedStorage').Fortlol:FireServer()wait(3.6)end game:GetService('Players').
LocalPlayer.Reset:FireServer()wait(0.3)repeat task.wait()until game.Players.LocalPlayer.Character and game.Players.
LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')wait(0.5)equipglove('Obby')repeat task.wait()until not _G.AutoObbyMastery or CheckGlove()=='Obby'
wait(0.4)repeat task.wait()if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild(
'entered')==nil then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace:FindFirstChild('Lobby'):
FindFirstChild('Teleport1').CFrame end until game.Players.LocalPlayer.Character:FindFirstChild('entered')task.wait(0.6)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.BountyHunterRoom.BountyHunterBooth.
_bountyRoomWarpPart.CFrame task.wait(0.5)game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Players.LocalPlayer.
Character.HumanoidRootPart.Position+Vector3.new(0,0,20))task.wait(4)game.Players.LocalPlayer.Character.Humanoid:MoveTo(
game.Players.LocalPlayer.Character.HumanoidRootPart.Position)CreateFreezeBV({Name='SpamObby'})game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=CFrame.new(209,-28006,1)wait(0.8)for ae,af in pairs(workspace:GetChildren())do if af.
Name=='Part'and af:FindFirstChild('brownsmoke')and af:FindFirstChild('Sound')and(root.Position-af.Position).Magnitude<=
50 then FortWall=af break end end if FortWall then local ae=FortWall.Size local af=FortWall.Position.Y+(ae.Y/2)+0.4 game
:GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer(CFrame.new(FortWall.Position.X,af,FortWall.
Position.Z)*CFrame.Angles(math.rad(0),55,0),1)end task.wait(4)end until not _G.AutoObbyMastery or workspace:
FindFirstChild('ObbyItem'..game.Players.LocalPlayer.Name..'LavaBlock')task.wait(5.3)end if workspace:FindFirstChild(
'ObbyItem'..game.Players.LocalPlayer.Name..'LavaBlock')then game:GetService('ReplicatedStorage'):WaitForChild(
'GeneralAbility'):FireServer(workspace:FindFirstChild('ObbyItem'..game.Players.LocalPlayer.Name..'LavaBlock').CFrame,1)
end task.wait(4.3)end task.wait()end elseif ad==true then Notification("You don't have Obby equipped",_G.TimeNotify)
wait(0.05)g['Auto Obby Mastery']:SetValue(false)end end})ac:AddDropdown('Bonk Mastery',{Text='BONK Mastery',Values={
'BONK Player','BONK + Slap'},Default='',Multi=false,Callback=function(ad)_G.BonkMastery=ad end})ac:AddToggle(
'Auto Bonk Mastery',{Text='Auto BONK Mastery',Default=false,Callback=function(ad)_G.AutoBonkMastery=ad if not _G.
AutoBonkMastery then CreateFreezeBV({Remove=true})end if CheckGlove()=='BONK'then while _G.AutoBonkMastery do if _G.
BonkMastery:match('BONK')then local ae=MasteryPlayers(CheckGlove(),true)if ae then CreateFreezeBV()game.Players.
LocalPlayer.Character:SetPrimaryPartCFrame(ae.Character:FindFirstChild('Head').CFrame*CFrame.new(0,7,0))repeat task.
wait()until _G.AutoBonkMastery==false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.Character:
FindFirstChild('HumanoidRootPart').Position).Magnitude<8 task.wait(0.25)game:GetService('ReplicatedStorage'):
WaitForChild('BONK'):FireServer()if _G.BonkMastery=='BONK + Slap'then wait(0.2)for af=1,3 do slapglove(ae.Character:
FindFirstChild('Head'))wait(0.2)end end game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].
CFrame*CFrame.new(0,5,0)wait(0.4)game:GetService('Players').LocalPlayer.Reset:FireServer()wait(0.3)repeat task.wait()
until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')end end task.wait()end elseif ad==true then
Notification("You don't have BONK equipped",_G.TimeNotify)wait(0.05)g['Auto Bonk Mastery']:SetValue(false)end end})ac:
AddDropdown('Voodoo Mastery',{Text='Voodoo Mastery',Values={'Farm Voodoo','Voodoo Slap 20 Player'},Default='',Multi=
false,Callback=function(ad)_G.VoodooMastery=ad end})ac:AddToggle('Auto Voodoo Mastery',{Text='Auto Voodoo Mastery',
Default=false,Callback=function(ad)_G.AutoVoodooMastery=ad if not _G.AutoVoodooMastery then for ae,af in pairs(game.
Players.LocalPlayer.Character:GetChildren())do if af:IsA('BasePart')then af.CanCollide=true end end end if CheckGlove()
=='Voodoo'then while _G.AutoVoodooMastery do if _G.VoodooMastery:match('Voodoo')then local ae=MasteryPlayers(CheckGlove(
),true)if ae then CreateFreezeBV()for af,ag in pairs(game.Players.LocalPlayer.Character:GetChildren())do if ag:IsA(
'BasePart')then ag.CanCollide=false end end game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(ae.Character:
FindFirstChild('HumanoidRootPart').CFrame*CFrame.new(0,-6,5))repeat task.wait()until _G.AutoVoodooMastery==false or(game
.Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.Character:FindFirstChild('HumanoidRootPart').Position).
Magnitude<8 task.wait(0.25)slapglove(ae.Character:FindFirstChild('Head'))wait(0.2)repeat task.wait()until ae.Character:
FindFirstChild('DOLLPART')wait(0.1)game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(ae.Character:FindFirstChild(
'DOLLPART'))wait(0.2)slapglove(ae.Character:FindFirstChild('DOLLPART'))game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)if _G.VoodooMastery=='Farm Voodoo'then wait(0.4)
game:GetService('Players').LocalPlayer.Reset:FireServer()wait(0.3)repeat task.wait()until game.Players.LocalPlayer.
Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')end if _G.VoodooMastery=='Farm Voodoo'then task.wait(7)end end end task.wait()end
elseif ad==true then Notification("You don't have Voodoo equipped",_G.TimeNotify)wait(0.05)g['Auto Voodoo Mastery']:
SetValue(false)end end})ac:AddDropdown('Car Mastery',{Text='Car Mastery',Values={'Farm Exp (Clone)','Farm Exp (Player)',
'Upgrade All'},Default='',Multi=false,Callback=function(ad)_G.CarMastery=ad end})ac:AddToggle('Auto Car Mastery',{Text=
'Auto Car Mastery',Default=false,Callback=function(ad)_G.AutoCarMastery=ad if CheckGlove()=='Car Keys'then while _G.
AutoCarMastery do if _G.CarMastery=='Farm Exp (Clone)'then local ae=CheckGlove()SpawnFarmMastery(true)repeat task.wait()
until game.Players.LocalPlayer.Character:FindFirstChild('entered')wait(0.5)for af,ag in ipairs(workspace:GetChildren())
do if ag~=game.Players.LocalPlayer and ag.Name:find('\u{c5}'..game.Players.LocalPlayer.Name)and ag:FindFirstChild(
'HumanoidRootPart')then repeat task.wait()if ag:FindFirstChild('HumanoidRootPart')then if game.Players.LocalPlayer.
Character:FindFirstChild('CarKeysCar')then ag.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.CarKeysCar.
Front:FindFirstChild('BumperHitbox').CFrame*CFrame.new(0,10,0)game.Players.LocalPlayer.Character.CarKeysCar:
FindFirstChild('VehicleSeat').CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,55,0)*CFrame.Angles(math.rad(-90),0,0)end
end until ag:FindFirstChild('HumanoidRootPart')==nil or _G.AutoCarMastery==false end end game:GetService('Players').
LocalPlayer.Reset:FireServer()repeat task.wait()until not _G.AutoCarMastery or game.Players.LocalPlayer.Character and
game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')equipglove(ae)elseif _G.CarMastery=='Farm Exp (Player)'then if game.Players.LocalPlayer.Character:
FindFirstChild('CarKeysCar')==nil then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].
CFrame*CFrame.new(0,5,0)wait(0.3)repeat task.wait()until _G.AutoCarMastery==false or game.Players.LocalPlayer.Character:
FindFirstChild('CarKeysCar')and game.Players.LocalPlayer.Character.CarKeysCar:FindFirstChild('VehicleSeat')wait(3)else
if game.Players.LocalPlayer.Character:FindFirstChild('CarKeysCar')then game.Players.LocalPlayer.Character.CarKeysCar.
Front:FindFirstChild('BumperHitbox').Size=Vector3.new(25,25,25)game.Players.LocalPlayer.Character.CarKeysCar.Front:
FindFirstChild('BumperHitbox').CanCollide=false for ae,af in pairs(game.Players:GetChildren())do if af~=game.Players.
LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and af.Character and game.Players.
LocalPlayer.Character:FindFirstChild('entered')then if af.Character:FindFirstChild('entered')and af.Character:
FindFirstChild('HumanoidRootPart')and af.Character:FindFirstChild('stevebody')==nil and af.Character:FindFirstChild(
'rock')==nil and af.Character.HumanoidRootPart.BrickColor~=BrickColor.new('New Yeller')and af.Character.Ragdolled.Value
==false and af.Character:FindFirstChild('Mirage')==nil then if af.Character.Head:FindFirstChild('UnoReverseCard')==nil
then af.Character.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.CarKeysCar.Front:FindFirstChild(
'BumperHitbox').CFrame*CFrame.new(0,10,0)game.Players.LocalPlayer.Character.CarKeysCar:FindFirstChild('VehicleSeat').
CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,55,0)*CFrame.Angles(math.rad(-90),0,0)end end end end end end elseif _G.
CarMastery=='Upgrade All'then for ae,af in pairs(game:GetService('Players').LocalPlayer.PlayerGui:GetChildren())do if af
.Name=='CarKeysGUI'and af:FindFirstChild('CarKeysAttributes')then for ag,ah in pairs(af.CarKeysAttributes:GetChildren())
do if ah.ClassName=='ImageLabel'then game:GetService('ReplicatedStorage').CarKeysUpgrade:FireServer(ah.Name)wait(0.15)
end end end end end task.wait()end elseif ad==true then Notification("You don't have Car Keys equipped",_G.TimeNotify)
wait(0.05)g['Auto Car Mastery']:SetValue(false)end end})ac:AddDropdown('Defense Mastery',{Text='Defense Mastery',Values=
{'Slap 20 Player','Slap Player From Cude (Walk)','Slap Player From Cude (TP)','Cude Player'},Default='',Multi=false,
Callback=function(ad)_G.DefenseMastery=ad end})ac:AddToggle('Auto Defense Mastery',{Text='Auto Defense Mastery',Default=
false,Callback=function(ad)_G.AutoDefenseMastery=ad if CheckGlove()=='Defense'then while _G.AutoDefenseMastery do if _G.
DefenseMastery=='Slap 20 Player'then local ae,af=math.huge for ag,ah in pairs(game.Players:GetChildren())do if ah~=game.
Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and ah.Character and game.
Players.LocalPlayer.Character:FindFirstChild('entered')then if ah.Character:FindFirstChild('entered')and ah.Character:
FindFirstChild('HumanoidRootPart')and ah.Character:FindFirstChild('stevebody')==nil and ah.Character:FindFirstChild(
'rock')==nil and ah.Character.HumanoidRootPart.BrickColor~=BrickColor.new('New Yeller')and ah.Character.Ragdolled.Value
==false and ah.Character:FindFirstChild('Mirage')==nil then if ah.Character.Head:FindFirstChild('UnoReverseCard')==nil
then if(ah.Character.HumanoidRootPart.Position-game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude<
ae then af=ah.Character end end end end end if af then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(af.
HumanoidRootPart.CFrame)task.wait(0.3)slapglove(af.HumanoidRootPart)wait(0.25)end elseif _G.DefenseMastery:match(
'Slap Player From Cude')then local ae if game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name..'\u{c5}Barrier')
then for af,ag in pairs(game.Players:GetChildren())do if ag~=game.Players.LocalPlayer and game.Players.LocalPlayer.
Character:FindFirstChild('HumanoidRootPart')and ag.Character and game.Players.LocalPlayer.Character:FindFirstChild(
'entered')then if ag.Character:FindFirstChild('entered')and ag.Character:FindFirstChild('HumanoidRootPart')and ag.
Character:FindFirstChild('stevebody')==nil and ag.Character:FindFirstChild('rock')==nil and ag.Character.
HumanoidRootPart.BrickColor~=BrickColor.new('New Yeller')and ag.Character.Ragdolled.Value==false and ag.Character:
FindFirstChild('Mirage')==nil then if ag.Character.Head:FindFirstChild('UnoReverseCard')==nil then if(ag.Character.
HumanoidRootPart.Position-game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name..'\u{c5}Barrier').Position).
Magnitude<20 then ae=ag.Character end end end end end end if ae then if _G.DefenseMastery=='Slap Player From Cude (TP)'
then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(ae.HumanoidRootPart.CFrame)wait(0.3)slapglove(ae.
HumanoidRootPart)wait(0.3)game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.Workspace:FindFirstChild(game.
Players.LocalPlayer.Name..'\u{c5}Barrier').CFrame)elseif _G.DefenseMastery=='Slap Player From Cude (Walk)'then if game.
Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then for af,ag in pairs(game.Players.LocalPlayer.Character:GetChildren())do if ag:IsA('Tool')and ag:
FindFirstChild('Glove')then if(ag:FindFirstChild('Glove').Position-ae.HumanoidRootPart.Position).Magnitude<=5 then game:
GetService('VirtualUser'):ClickButton1(Vector2.new(200,200))else game.Players.LocalPlayer.Character.Humanoid:MoveTo(ae.
HumanoidRootPart.Position)end end end end end else if game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name..
'\u{c5}Barrier')then if _G.DefenseMastery=='Slap Player From Cude (TP)'then game.Players.LocalPlayer.Character:
SetPrimaryPartCFrame(game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name..'\u{c5}Barrier').CFrame)elseif _G.
DefenseMastery=='Slap Player From Cude (Walk)'then game.Players.LocalPlayer.Character.Humanoid:MoveTo(game.Workspace:
FindFirstChild(game.Players.LocalPlayer.Name..'\u{c5}Barrier').Position)end end end elseif _G.DefenseMastery==
'Cude Player'then if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then for ae,af in pairs(game.
Players:GetChildren())do if af~=game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')and af.Character then if af.Character:FindFirstChild('entered')and af.Character:FindFirstChild(
'HumanoidRootPart')and af.Character:FindFirstChild('stevebody')==nil and af.Character:FindFirstChild('rock')==nil and af
.Character.HumanoidRootPart.BrickColor~=BrickColor.new('New Yeller')and af.Character.Ragdolled.Value==false and af.
Character:FindFirstChild('Mirage')==nil then if af.Character.Head:FindFirstChild('UnoReverseCard')==nil then if game.
Players.LocalPlayer.Character:FindFirstChild('entered')then if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(af.Character:FindFirstChild('Head').
CFrame*CFrame.new(0,7,0))repeat task.wait()until _G.AutoDefenseMastery==false or(game.Players.LocalPlayer.Character.
HumanoidRootPart.Position-af.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude<6 wait(0.22)game:
GetService('ReplicatedStorage').Barrier:FireServer(1)wait(0.05)game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(
workspace['SafeBox'].CFrame*CFrame.new(0,5,0))task.wait(3.5)end end end end end end end end task.wait()end elseif ad==
true then Notification("You don't have Defense equipped",_G.TimeNotify)wait(0.05)g['Auto Defense Mastery']:SetValue(
false)end end})ac:AddDropdown('Tycoon Mastery',{Text='Tycoon Mastery',Values={'15k Point Die','Defense Tycoon (Walk)',
'Defense Tycoon (TP)','Kill Player (Tycoon God)'},Default='',Multi=false,Callback=function(ad)_G.TycoonMastery=ad end})
ac:AddToggle('Auto Tycoon Mastery',{Text='Auto Tycoon Mastery',Default=false,Callback=function(ad)_G.AutoTycoonMastery=
ad if CheckGlove()=='Tycoon'then while _G.AutoTycoonMastery do if _G.TycoonMastery=='15k Point Die'then if game.Players.
LocalPlayer.Character:FindFirstChild('entered')then if game.Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.
LocalPlayer.Name)and game.Workspace['\u{c5}Tycoon'..game.Players.LocalPlayer.Name]:GetAttribute('LastCount')<15000 then
for ae,af in pairs(game.Workspace:GetChildren())do if af.Name:match(game.Players.LocalPlayer.Name)and af:FindFirstChild(
'Click')then fireclickdetector(af.Click.ClickDetector,0)fireclickdetector(af.Click.ClickDetector,1)end end
GuiTrackUpdate(true,{Text='Tycoon Your Point\n'..game.Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.
Name):GetAttribute('LastCount')..' / 15000',Size=game.Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.
Name):GetAttribute('LastCount')/15000})elseif game.Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.
Name)==nil then game:GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer(CFrame.new(17894,-
26.257728576660156,-3579.11279296875,0.9996822476387024,-1.1041408759515647E-10,0.02520809881389141,
2.8899729831444176e-10,1,-7.080715569429685E-9,-2.520809881389141E-2,7.085750652890965e-9,0.9996822476387024))spawn(
function()repeat task.wait()game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace['SafeBox'].CFrame*CFrame.
new(0,5,0))until(game.Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name)and game.Workspace[
'\u{c5}Tycoon'..game.Players.LocalPlayer.Name]:GetAttribute('LastCount')>=15000)or(game.Players.LocalPlayer.Character
and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.LocalPlayer.Character:FindFirstChild(
'Humanoid').Health<=0)end)wait(1)end if game.Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name)and
game.Workspace['\u{c5}Tycoon'..game.Players.LocalPlayer.Name]:GetAttribute('LastCount')>=15000 then GuiTrackUpdate(false
)repeat task.wait()game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.Workspace.DEATHBARRIER.CFrame)until game
.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.
LocalPlayer.Character:FindFirstChild('Humanoid').Health<=0 end end elseif _G.TycoonMastery:match('Defense Tycoon')then
if game.Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name)then local ae for af,ag in pairs(game.
Players:GetChildren())do if ag~=game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')and ag.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')then if ag.Character
:FindFirstChild('entered')and ag.Character:FindFirstChild('HumanoidRootPart')and ag.Character:FindFirstChild('stevebody'
)==nil and ag.Character:FindFirstChild('rock')==nil and ag.Character.HumanoidRootPart.BrickColor~=BrickColor.new(
'New Yeller')and ag.Character.Ragdolled.Value==false and ag.Character:FindFirstChild('Mirage')==nil then if ag.Character
.Head:FindFirstChild('UnoReverseCard')==nil then if(ag.Character.HumanoidRootPart.Position-game.Workspace:
FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name):FindFirstChild('End').Position).Magnitude<30 then ae=ag.
Character end if _G.TycoonMastery=='Defense Tycoon (Walk)'then if(game.Players.LocalPlayer.Character.HumanoidRootPart.
Position-game.Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name):FindFirstChild('End').Position).
Magnitude>45 then local ah=(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ag.Character.HumanoidRootPart.
Position).Magnitude if ah<75 then ae=ag.Character end end end end end end end if ae then if _G.TycoonMastery==
'Defense Tycoon (Walk)'then if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.LocalPlayer
.Character:FindFirstChild('HumanoidRootPart')then for af,ag in pairs(game.Players.LocalPlayer.Character:GetChildren())do
if ag:IsA('Tool')and ag:FindFirstChild('Glove')then if(ag:FindFirstChild('Glove').Position-ae.HumanoidRootPart.Position)
.Magnitude<=5 then game:GetService('VirtualUser'):ClickButton1(Vector2.new(200,200))else game.Players.LocalPlayer.
Character.Humanoid:MoveTo(ae.HumanoidRootPart.Position)end end end end elseif _G.TycoonMastery=='Defense Tycoon (TP)'
then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(ae.HumanoidRootPart.CFrame)wait(0.3)for af=1,1000 do
slapglove(ae.HumanoidRootPart)end end else if game.Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.
Name):FindFirstChild('End')then if _G.TycoonMastery=='Defense Tycoon (Walk)'then game.Players.LocalPlayer.Character.
Humanoid:MoveTo(game.Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name):FindFirstChild('End').
Position)elseif _G.TycoonMastery=='Defense Tycoon (TP)'then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game
.Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name):FindFirstChild('End').CFrame)end end end end
elseif _G.TycoonMastery=='Kill Player (Tycoon God)'then if game.Players.LocalPlayer.Character:FindFirstChild('entered')
then if game.Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name)and game.Workspace['\u{c5}Tycoon'..
game.Players.LocalPlayer.Name]:GetAttribute('LastCount')<5000 then for ae,af in pairs(game.Workspace:GetChildren())do if
af.Name:match(game.Players.LocalPlayer.Name)and af:FindFirstChild('Click')then fireclickdetector(af.Click.ClickDetector,
0)fireclickdetector(af.Click.ClickDetector,1)end end GuiTrackUpdate(true,{Text='Tycoon Your Point\n'..game.Workspace:
FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name):GetAttribute('LastCount')..' / 5000',Size=game.Workspace:
FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name):GetAttribute('LastCount')/5000})elseif game.Workspace:
FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name)==nil then game:GetService('ReplicatedStorage'):
WaitForChild('GeneralAbility'):FireServer(CFrame.new(17894,-26.257728576660156,-3579.11279296875,0.9996822476387024,-
1.1041408759515647E-10,0.02520809881389141,2.8899729831444176e-10,1,-7.080715569429685E-9,-2.520809881389141E-2,
7.085750652890965e-9,0.9996822476387024))spawn(function()repeat task.wait()game.Players.LocalPlayer.Character:
SetPrimaryPartCFrame(workspace['SafeBox'].CFrame*CFrame.new(0,5,0))until(game.Workspace:FindFirstChild('\u{c5}Tycoon'..
game.Players.LocalPlayer.Name)and game.Workspace['\u{c5}Tycoon'..game.Players.LocalPlayer.Name]:GetAttribute('LastCount'
)>=5000)or(game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.
Players.LocalPlayer.Character:FindFirstChild('Humanoid').Health<=0)end)wait(1)end if game.Workspace:FindFirstChild(
'\u{c5}Tycoon'..game.Players.LocalPlayer.Name)and game.Workspace['\u{c5}Tycoon'..game.Players.LocalPlayer.Name]:
GetAttribute('LastCount')>=5000 then GuiTrackUpdate(false)if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then for ae,af in pairs(game.Players:GetChildren())do if af~=game.Players.LocalPlayer and game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and af.Character then if af.Character:FindFirstChild(
'entered')and af.Character:FindFirstChild('HumanoidRootPart')and af.Character:FindFirstChild('stevebody')==nil and af.
Character:FindFirstChild('rock')==nil and af.Character.HumanoidRootPart.BrickColor~=BrickColor.new('New Yeller')and af.
Character.Ragdolled.Value==false and af.Character:FindFirstChild('Mirage')==nil then if af.Character.Head:
FindFirstChild('UnoReverseCard')==nil then if game.Players.LocalPlayer.Character:FindFirstChild('entered')then if game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then game.Players.LocalPlayer.Character:
SetPrimaryPartCFrame(af.Character:FindFirstChild('HumanoidRootPart').CFrame)repeat task.wait()until _G.AutoTycoonMastery
==false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-af.Character:FindFirstChild('HumanoidRootPart').
Position).Magnitude<6 wait(0.35)slapglove(af.Character:FindFirstChild('HumanoidRootPart'))wait(0.05)game.Players.
LocalPlayer.Character:SetPrimaryPartCFrame(workspace['SafeBox'].CFrame*CFrame.new(0,5,0))task.wait(7)end end end end end
end end end end end task.wait()end GuiTrackUpdate(false)elseif ad==true then Notification(
"You don't have Tycoon equipped",_G.TimeNotify)wait(0.05)g['Auto Tycoon Mastery']:SetValue(false)end end})ac:
AddDropdown('Phase Mastery',{Text='Phase Mastery',Values={'200 Second Island','Slap + Ability','Ability + Slap (2 Sec)'}
,Default='',Multi=false,Callback=function(ad)_G.PhaceMastery=ad end})ac:AddToggle('Auto Phase Mastery',{Text=
'Auto Phase Mastery',Default=false,Callback=function(ad)_G.AutoPhaseMastery=ad if CheckGlove()=='Phase'then while _G.
AutoPhaseMastery do if _G.PhaceMastery=='200 Second Island'then if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then if not _G.PlaceTp then _G.PlaceTp={['Island 1']=workspace.Arena.island4:FindFirstChild('moyai').
CFrame*CFrame.new(0,0,-30),['Island 2']=game.workspace:FindFirstChild('Origo').CFrame*CFrame.new(0,-5,0),['Island 3']=
workspace.Arena['Sakura Tree']['petal pile'].CFrame*CFrame.new(0,5,0),['Island 4']=workspace.Arena.island2['Sakura Tree'
]['petal pile'].CFrame*CFrame.new(0,5,0),['Island 5']=workspace.Arena.island3['Sakura Tree']['petal pile'].CFrame*CFrame
.new(0,5,0),['Island 6']=workspace.Arena.island5:FindFirstChild('Union').CFrame*CFrame.new(0,3.25,0),['Island 7']=
workspace.Arena.CannonIsland.Cannon:FindFirstChild('Base').CFrame*CFrame.new(0,0,35),['Island 8']=workspace.Arena.Fort:
FindFirstChild('Floor').CFrame*CFrame.new(0,5,0)}end for ae,af in pairs(_G.PlaceTp)do if _G.AutoPhaseMastery==true then
game:GetService('ReplicatedStorage').PhaseA:FireServer()wait(0.3)repeat task.wait()if game.Players.LocalPlayer.Character
:FindFirstChild('HumanoidRootPart')then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(af)end until game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character.HumanoidRootPart:
FindFirstChild('BlackheartREAL')==nil task.wait(1)end end end elseif _G.PhaceMastery:match('Ability')then local ae=
MasteryPlayers(CheckGlove(),true)if ae then if _G.AutoPhaseMastery==true then game.Players.LocalPlayer.Character:
SetPrimaryPartCFrame(ae.Character.HumanoidRootPart.CFrame)repeat task.wait()until _G.AutoPhaseMastery==false or(game.
Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.Character.HumanoidRootPart.Position).Magnitude<6 wait(0.35)if
_G.PhaceMastery=='Slap + Ability'then slapglove(ae.Character.HumanoidRootPart)game:GetService('ReplicatedStorage').
PhaseA:FireServer()game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace['SafeBox'].CFrame*CFrame.new(0,5,0)
)wait(0.2)repeat task.wait()until game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.Players.
LocalPlayer.Character.HumanoidRootPart:FindFirstChild('BlackheartREAL')==nil elseif _G.PhaceMastery==
'Ability + Slap (2 Sec)'then game:GetService('ReplicatedStorage').PhaseA:FireServer()task.wait(0.2)repeat task.wait()
until game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character.
HumanoidRootPart:FindFirstChild('BlackheartREAL')==nil task.wait(0.1)game.Players.LocalPlayer.Character:
SetPrimaryPartCFrame(v.Character:FindFirstChild('HumanoidRootPart').CFrame)repeat task.wait()until _G.AutoPhaseMastery==
false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ae.Character.HumanoidRootPart.Position).Magnitude<
6 task.wait(0.25)slapglove(ae.Character.HumanoidRootPart)game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(
workspace['SafeBox'].CFrame*CFrame.new(0,5,0))end task.wait(3)end end end task.wait()end elseif ad==true then
Notification("You don't have Phase equipped",_G.TimeNotify)wait(0.05)g['Auto Phase Mastery']:SetValue(false)end end})ac:
AddDropdown('Shard Mastery',{Text='Shard Mastery',Values={'Aimbot Overkill','Get Slap','Aimbot Character'},Default='',
Multi=false,Callback=function(ad)_G.ShardMastery=ad end})ac:AddToggle('Auto Shard Mastery',{Text='Auto Shard Mastery',
Default=false,Callback=function(ad)_G.AutoShardMastery=ad if CheckGlove()=='Shard'then while _G.AutoShardMastery do if
_G.ShardMastery=='Aimbot Overkill'then for ae,af in pairs(game.Players:GetChildren())do if af~=game.Players.LocalPlayer
and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and af.Character then if af.Character:
FindFirstChild('entered')and af.Character:FindFirstChild('HumanoidRootPart')and af.Character:FindFirstChild('stevebody')
==nil and af.Character:FindFirstChild('rock')==nil and af.Character.HumanoidRootPart.BrickColor~=BrickColor.new(
'New Yeller')and af.Character.Ragdolled.Value==false and af.Character:FindFirstChild('Mirage')==nil then if af.
leaderstats.Glove.Value=='OVERKILL'then if game.Players.LocalPlayer.Character:FindFirstChild('entered')and game.Players.
LocalPlayer.Character:FindFirstChild('Ragdolled').Value==false then game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame=CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(af.Character.HumanoidRootPart
.Position.X,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y,af.Character.HumanoidRootPart.Position.Z))end
end end end end elseif _G.ShardMastery=='Get Slap'then if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then local ae=CheckGlove()SpawnFarmMastery(true)repeat task.wait()until game.Players.LocalPlayer.
Character:FindFirstChild('entered')wait(0.6)for af,ag in ipairs(workspace:GetChildren())do if ag~=game.Players.
LocalPlayer and ag.Name:find('\u{c5}'..game.Players.LocalPlayer.Name)and ag:FindFirstChild('HumanoidRootPart')then
repeat task.wait()if ag:FindFirstChild('HumanoidRootPart')then slapglove(ag:FindFirstChild('HumanoidRootPart'))end until
ag:FindFirstChild('HumanoidRootPart')==nil or _G.AutoShardMastery==false end if ag.Name=='Imp'and ag:FindFirstChild(
'Body')then repeat task.wait()if ag:FindFirstChild('Body')then slapglove(ag:FindFirstChild('Body'))end until ag:
FindFirstChild('Body')==nil or _G.AutoShardMastery==false end end game:GetService('Players').LocalPlayer.Reset:
FireServer()repeat task.wait()until not _G.AutoShardMastery or game.Players.LocalPlayer.Character and game.Players.
LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')equipglove(ae)end elseif _G.ShardMastery=='Aimbot Character'then if game.Players.LocalPlayer.
Character:FindFirstChild('HumanoidRootPart')then local ae,af=math.huge for ag,ah in pairs(game.Players:GetChildren())do
if ah~=game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and ah.
Character then if ah.Character:FindFirstChild('entered')and ah.Character:FindFirstChild('HumanoidRootPart')and ah.
Character:FindFirstChild('stevebody')==nil and ah.Character:FindFirstChild('rock')==nil and ah.Character.
HumanoidRootPart.BrickColor~=BrickColor.new('New Yeller')and ah.Character.Ragdolled.Value==false and ah.Character:
FindFirstChild('Mirage')==nil then if ah.Character.Head:FindFirstChild('UnoReverseCard')==nil then local U=(game.Players
.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position-ah.Character.HumanoidRootPart.Position).Magnitude if
U<ae then ae,af=U,ah end end end end end if af then if game.Players.LocalPlayer.Character:FindFirstChild('entered')and
game.Players.LocalPlayer.Character:FindFirstChild('Ragdolled').Value==false then game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(af.Character
.HumanoidRootPart.Position.X,game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y,af.Character.
HumanoidRootPart.Position.Z))end end end end task.wait()end elseif _G.AutoShardMastery==true then Notification(
"You don't have Shard equipped",_G.TimeNotify)wait(0.05)g['Auto Shard Mastery']:SetValue(false)end end})ac:AddDropdown(
'Space Mastery',{Text='Space Mastery',Values={'Place Time','Complete On Island Slapple'},Default='',Multi=false,Callback
=function(ad)_G.SpaceMastery=ad end})ac:AddToggle('Auto Space Mastery',{Text='Auto Space Mastery',Default=false,Callback
=function(ad)_G.AutoSpaceMastery=ad if CheckGlove()=='Space'then while _G.AutoSpaceMastery do if _G.SpaceMastery==
'Place Time'then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0
)task.wait(1)game:GetService('ReplicatedStorage').ZeroGSound:FireServer()game:GetService('Players').LocalPlayer.Reset:
FireServer()repeat wait()until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.LocalPlayer.
Character.Humanoid.Health>0 wait(0.3)elseif _G.SpaceMastery=='Complete On Island Slapple'then if game.Players.
LocalPlayer.Character:FindFirstChild('entered')==nil then repeat task.wait()until game.Players.LocalPlayer.Character if
not game.Players.LocalPlayer.Character:FindFirstChild('entered')and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then repeat task.wait()firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),
workspace.Lobby.Teleport1.TouchInterest.Parent,0)firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild(
'Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,1)until game.Players.LocalPlayer.Character:FindFirstChild(
'entered')end end wait(0.5)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(227,48,169)wait(0.25)
for ae,af in ipairs(game.Workspace.Arena.CannonIsland:GetDescendants())do if af.ClassName=='ProximityPrompt'then
fireproximityprompt(af)end end repeat task.wait()until game.Players.LocalPlayer.Character:FindFirstChild('Ragdolled')and
game.Players.LocalPlayer.Character:WaitForChild('Ragdolled').Value==true wait(0.3)if game.Players.LocalPlayer.Backpack:
FindFirstChild('Space')then game.Players.LocalPlayer.Backpack:FindFirstChild('Space').Parent=game.Players.LocalPlayer.
Character end wait(0.2)game:GetService('ReplicatedStorage').ZeroGSound:FireServer()wait(1)repeat task.wait()if game.
Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')then for ae,af in pairs(
game.Players.LocalPlayer.Character:GetChildren())do if af.ClassName=='Part'and af.Name~='Humanoid'then af.CFrame=game.
workspace.Arena.island5.Union.CFrame*CFrame.new(0,3.25,0)end end end until game.Players.LocalPlayer.Character:
FindFirstChild('Ragdolled')and game.Players.LocalPlayer.Character:WaitForChild('Ragdolled').Value==false wait(1)game.
Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.workspace.Arena.island5.Union.CFrame*CFrame.new(0,3.25,0))task.
wait(6)end task.wait()end elseif _G.AutoSpaceMastery==true then Notification("You don't have Space equipped",_G.
TimeNotify)wait(0.05)g['Auto Space Mastery']:SetValue(false)end end})ac:AddDropdown('Flash Mastery',{Text=
'Flash Mastery',Values={'Time + Slap','Ambush'},Default='',Multi=false,Callback=function(ad)_G.FlashMastery=ad end})ac:
AddToggle('Auto Flash Mastery',{Text='Auto Flash Mastery',Default=false,Callback=function(ad)_G.AutoFlashMastery=ad if
CheckGlove()=='Flash'then while _G.AutoFlashMastery do if _G.FlashMastery=='Time + Slap'then for ae=1,9000 do spawn(
function()game:GetService('ReplicatedStorage').FlashTeleport:FireServer()end)end elseif _G.FlashMastery=='Ambush'then if
game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then local ae=CheckGlove()SpawnFarmMastery(true)
repeat task.wait()until game.Players.LocalPlayer.Character:FindFirstChild('entered')wait(0.6)game:GetService(
'ReplicatedStorage').FlashTeleport:FireServer()for af,ag in ipairs(workspace:GetChildren())do if ag~=game.Players.
LocalPlayer and ag.Name:find('\u{c5}'..game.Players.LocalPlayer.Name)and ag:FindFirstChild('HumanoidRootPart')then
spawn(function()repeat if CheckGlove()=='Flash'and ag:FindFirstChild('HumanoidRootPart')then game:GetService(
'ReplicatedStorage').FlashTeleport:FireServer()end task.wait(2.3)until ag:FindFirstChild('HumanoidRootPart')==nil or _G.
AutoFlashMastery==false end)repeat task.wait()if ag:FindFirstChild('HumanoidRootPart')then slapglove(ag:FindFirstChild(
'HumanoidRootPart'))end until ag:FindFirstChild('HumanoidRootPart')==nil or _G.AutoFlashMastery==false end if ag.Name==
'Imp'and ag:FindFirstChild('Body')then repeat task.wait()if ag:FindFirstChild('Body')then slapglove(ag:FindFirstChild(
'Body'))end until ag:FindFirstChild('Body')==nil or _G.AutoFlashMastery==false end end game:GetService('Players').
LocalPlayer.Reset:FireServer()repeat task.wait()until not _G.AutoFlashMastery or game.Players.LocalPlayer.Character and
game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')equipglove(ae)end end task.wait()end elseif _G.AutoFlashMastery==true then Notification(
"You don't have Flash equipped",_G.TimeNotify)wait(0.05)g['Auto Flash Mastery']:SetValue(false)end end})ac:AddDropdown(
'Fort Mastery',{Text='Fort Mastery',Values={'Build','Build + Break'},Default='',Multi=false,Callback=function(ad)_G.
FortMastery=ad end})ac:AddToggle('Auto Fort Mastery',{Text='Auto Fort Mastery',Default=false,Callback=function(ad)_G.
AutoFortMastery=ad if CheckGlove()=='Fort'then spawn(function()while _G.AutoFortMastery do if game.Players.LocalPlayer.
Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character:FindFirstChild('entered')then game:
GetService('ReplicatedStorage').Fortlol:FireServer()end wait(3.4)end end)while _G.AutoFortMastery do if _G.FortMastery==
'Build + Break'then if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then repeat task.wait()if
game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then firetouchinterest(game.Players.LocalPlayer.
Character.HumanoidRootPart,workspace.Lobby.Teleport1,0)firetouchinterest(game.Players.LocalPlayer.Character.
HumanoidRootPart,workspace.Lobby.Teleport1,1)end until game.Players.LocalPlayer.Character:FindFirstChild('entered')
repeat task.wait()if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then firetouchinterest(game.
Players.LocalPlayer.Character.HumanoidRootPart,workspace.Lobby.Teleport1,0)firetouchinterest(game.Players.LocalPlayer.
Character.HumanoidRootPart,workspace.Lobby.Teleport1,1)end if game.Players.LocalPlayer.Backpack:FindFirstChild('Fort')
then game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Fort)end game.Players.
LocalPlayer.Character:SetPrimaryPartCFrame(workspace['SafeBox'].CFrame*CFrame.new(0,5,0))for ae,af in pairs(game.
Workspace:GetChildren())do if af.Name=='Part'and af:FindFirstChild('brownsmoke')and af:FindFirstChild('Sound')and 200>=(
game.Players.LocalPlayer.Character.HumanoidRootPart.Position-af.Position).Magnitude then if af.CanCollide==true then
game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(af.CFrame)task.wait(0.05)if game.Players.LocalPlayer.Character
and game.Players.LocalPlayer.Character:FindFirstChild('Ragdolled')and game.Players.LocalPlayer.Character:WaitForChild(
'Ragdolled').Value==false then game.ReplicatedStorage.SelfKnockback:FireServer({['Force']=-99})end end end end until _G.
AutoFortMastery==false or game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild(
'Humanoid')and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid').Health<=0 end elseif _G.FortMastery==
'Build'then if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then repeat task.wait()if game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then firetouchinterest(game.Players.LocalPlayer.
Character.HumanoidRootPart,workspace.Lobby.Teleport1,0)firetouchinterest(game.Players.LocalPlayer.Character.
HumanoidRootPart,workspace.Lobby.Teleport1,1)end until game.Players.LocalPlayer.Character:FindFirstChild('entered')
repeat task.wait()if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then firetouchinterest(game.
Players.LocalPlayer.Character.HumanoidRootPart,workspace.Lobby.Teleport1,0)firetouchinterest(game.Players.LocalPlayer.
Character.HumanoidRootPart,workspace.Lobby.Teleport1,1)end if game.Players.LocalPlayer.Backpack:FindFirstChild('Fort')
then game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Fort)end game.Players.
LocalPlayer.Character:SetPrimaryPartCFrame(workspace['SafeBox'].CFrame*CFrame.new(0,5,0))until _G.AutoFortMastery==false
or game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.
LocalPlayer.Character:FindFirstChild('Humanoid').Health<=0 end end task.wait()end elseif _G.AutoFortMastery==true then
Notification("You don't have Fort equipped",_G.TimeNotify)wait(0.05)g['Auto Fort Mastery']:SetValue(false)end end})ac:
AddDropdown('Rob Mastery',{Text='Rob Mastery',Values={'Studs','Get Kill'},Default='',Multi=false,Callback=function(ad)_G
.RobMastery=ad end})local ad=1 ac:AddToggle('Auto Rob Mastery',{Text='Auto Rob Mastery',Default=false,Callback=function(
ae)_G.AutoRobMastery=ae if CheckGlove()=='rob'then while _G.AutoRobMastery do if _G.RobMastery=='Studs'then if game.
Players.LocalPlayer.Character:FindFirstChild('entered')then local af={CFrame.new(9762,38,10237),CFrame.new(9763,38,9761)
,CFrame.new(10241,38,9758),CFrame.new(10236,38,10236)}function NextTweenRob()local ag=af[ad]ad=ad+1 if ad>#af then ad=1
end return ag end game:GetService('ReplicatedStorage').rob:FireServer()for ag,ah in pairs(game.Players.LocalPlayer.
PlayerGui:GetChildren())do if ah.Name=='whiteframe'then ah:Destroy()end end repeat task.wait()until _G.AutoRobMastery==
false or game.Players.LocalPlayer.Character:FindFirstChild('entered')and game.Players.LocalPlayer.Character and game.
Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid'
).Health>0 and game.Players.LocalPlayer.Character:FindFirstChild('Head').Transparency==1 if game.Players.LocalPlayer.
Character:FindFirstChild('entered')then local ag=NextTweenRob()if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(ag)end end end elseif _G.RobMastery==
'Get Kill'then if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then local af=CheckGlove()
SpawnFarmMastery(true)repeat task.wait()until game.Players.LocalPlayer.Character:FindFirstChild('entered')wait(0.5)
CreateFreezeBV()local function AbilityRob()game:GetService('ReplicatedStorage').rob:FireServer()for ag,ah in pairs(game.
Players.LocalPlayer.PlayerGui:GetChildren())do if ah.Name=='whiteframe'then ah:Destroy()end end end for ag,ah in ipairs(
workspace:GetChildren())do if ah~=game.Players.LocalPlayer and ah.Name:find('\u{c5}'..game.Players.LocalPlayer.Name)and
ah:FindFirstChild('HumanoidRootPart')then repeat task.wait()AbilityRob()if game.Players.LocalPlayer.Character:
FindFirstChild('Head')and game.Players.LocalPlayer.Character.Head.Transparency>=1 then if ah:FindFirstChild(
'HumanoidRootPart')then ah.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end end
until ah:FindFirstChild('HumanoidRootPart')==nil or(ah:FindFirstChild('Head')and ah.Head.Transparency>=1)or _G.
AutoRobMastery==false end if ah.Name=='Imp'and ah:FindFirstChild('Body')then repeat task.wait()AbilityRob()if game.
Players.LocalPlayer.Character:FindFirstChild('Head')and game.Players.LocalPlayer.Character.Head.Transparency>=1 then if
ah:FindFirstChild('Body')then ah:FindFirstChild('Body').CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame end end until ah:FindFirstChild('Body')==nil or _G.AutoRobMastery==false end end game:GetService('Players').
LocalPlayer.Reset:FireServer()repeat task.wait()until not _G.AutoRobMastery or game.Players.LocalPlayer.Character and
game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')equipglove(af)end end task.wait()end elseif _G.AutoRobMastery==true then Notification(
"You don't have Rob equipped",_G.TimeNotify)wait(0.05)g['Auto Rob Mastery']:SetValue(false)end end})ac:AddDropdown(
'Cloud Mastery',{Text='Cloud Mastery',Values={'Studs (200k Fly)','Afk (200 Min)','Pickup Player (100 Player)'},Default=
'',Multi=false,Callback=function(ae)_G.CloudMastery=ae end})local ae=1 _G.GetPlayerSit={}ac:AddToggle(
'Auto Cloud Mastery',{Text='Auto Cloud Mastery',Default=false,Callback=function(af)_G.AutoCloudMastery=af if CheckGlove(
)=='Cloud'then while _G.AutoCloudMastery do if _G.CloudMastery=='Studs (200k Fly)'then if game.Players.LocalPlayer.
Character:FindFirstChild('entered')then local ag=couldfound()local ah={CFrame.new(730,128,-600),CFrame.new(-680,22,500)}
function NextTween()local U=ah[ae]ae=ae+1 if ae>#ah then ae=1 end return U end if game.Players.LocalPlayer.Character:
FindFirstChild('entered')and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')~=nil and game.Players.
LocalPlayer.Character.Humanoid.Sit==true then if ag and ag:FindFirstChild('VehicleSeat')then VectorTween({Part=ag.
VehicleSeat,Place=NextTween().Position,Speed=80})end elseif game.Players.LocalPlayer.Character:FindFirstChild('entered')
and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')~=nil and game.Players.LocalPlayer.Character.Humanoid.
Sit==false then if ag and ag:FindFirstChild('VehicleSeat')then VectorTween({Place=ag.VehicleSeat.Position,Speed=80})end
end end elseif _G.CloudMastery=='Afk (200 Min)'then if game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil
then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.Arena.CannonIsland.Cannon.Base.CFrame*CFrame.
new(0,2,35)wait(0.3)game:GetService('ReplicatedStorage').CloudAbility:FireServer()fireclickdetector(workspace.Lobby.
Diamond.ClickDetector)wait(0.2)if not game.Players.LocalPlayer.Character:FindFirstChild('entered')and game.Players.
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then repeat task.wait()game.Players.LocalPlayer.Character:
SetPrimaryPartCFrame(workspace.Lobby.Teleport1.CFrame)until game.Players.LocalPlayer.Character:FindFirstChild('entered')
end wait(0.3)local ag=couldfound()repeat task.wait()if game.Players.LocalPlayer.Character:FindFirstChild('entered')and
game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')~=nil and game.Players.LocalPlayer.Character.Humanoid.Sit==
false then if ag and ag:FindFirstChild('VehicleSeat')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ag.
VehicleSeat.CFrame end end until game.Players.LocalPlayer.Character:FindFirstChild('entered')and game.Players.
LocalPlayer.Character:FindFirstChild('Humanoid')~=nil and game.Players.LocalPlayer.Character.Humanoid.Sit==true task.
wait(1)if ag and ag:FindFirstChild('VehicleSeat')then VectorTween({Part=ag.VehicleSeat,Place=Vector3.new(CFrame.new(245,
129,-91)),Speed=80})end wait(0.3)game:GetService('ReplicatedStorage').Rockmode:FireServer()g['Anti Afk']:SetValue(true)
end elseif _G.CloudMastery=='Pickup Player (100 Player)'then local ag=couldfound()local ah=game.Players:GetChildren()
local U=ah[math.random(1,#ah)]if _G.GetPlayerSit[U]then return end if U~=game.Players.LocalPlayer and game.Players.
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and U.Character then if U.Character:FindFirstChild('entered')and
U.Character:FindFirstChild('HumanoidRootPart')and U.Character:FindFirstChild('Humanoid')and U.Character:FindFirstChild(
'stevebody')==nil and U.Character:FindFirstChild('rock')==nil and U.Character.Humanoid.Sit==false and U.Character.
HumanoidRootPart.BrickColor~=BrickColor.new('New Yeller')and U.Character.Ragdolled.Value==false and U.Character:
FindFirstChild('Mirage')==nil then repeat task.wait()if ag and ag:FindFirstChild('Seat')then U.Character.
HumanoidRootPart.CFrame=ag.Seat.CFrame end until U.Character.Humanoid.Sit==true if not _G.GetPlayerSit[U]then _G.
GetPlayerSit[U]=true end if U.Character.Humanoid.Sit==true then slapglove(U.Character.HumanoidRootPart)end task.wait(0.5
)end end end task.wait()end elseif _G.AutoCloudMastery==true then Notification("You don't have Cloud equipped",_G.
TimeNotify)wait(0.05)g['Auto Cloud Mastery']:SetValue(false)end end})ac:AddDropdown('Wormhole Mastery',{Text=
'Wormhole Mastery',Values={'Place','Teleport Time','Ambush Player'},Default='',Multi=false,Callback=function(af)_G.
WormholeMastery=af end})ac:AddToggle('Auto Wormhole Mastery',{Text='Auto Wormhole Mastery',Default=false,Callback=
function(af)_G.AutoWormholeMastery=af if CheckGlove()=='Wormhole'then while _G.AutoWormholeMastery do if _G.
WormholeMastery=='Place'then game:GetService('ReplicatedStorage').WormholePlace:FireServer()elseif _G.WormholeMastery==
'Teleport Time'then game:GetService('ReplicatedStorage').WormholeTP:FireServer(CFrame.new(-57.48336410522461,-
4.672852516174316,67.94768524169922,0.5769212245941162,0.0005397791974246502,0.8167997002601624,1.468715993269143e-7,
0.9999997615814209,-6.609398988075554E-4,-0.8167998790740967,0.00038141835830174387,0.5769210457801819))elseif _G.
WormholeMastery=='Ambush Player'then if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then local
ag=CheckGlove()SpawnFarmMastery(true)repeat task.wait()until game.Players.LocalPlayer.Character:FindFirstChild('entered'
)wait(0.5)game:GetService('ReplicatedStorage').WormholeTP:FireServer(CFrame.new(-57.48336410522461,-4.672852516174316,
67.94768524169922,0.5769212245941162,0.0005397791974246502,0.8167997002601624,1.468715993269143e-7,0.9999997615814209,-
6.609398988075554E-4,-0.8167998790740967,0.00038141835830174387,0.5769210457801819))for ah,U in ipairs(workspace:
GetChildren())do if U~=game.Players.LocalPlayer and U.Name:find('\u{c5}'..game.Players.LocalPlayer.Name)and U:
FindFirstChild('HumanoidRootPart')then repeat task.wait()if U:FindFirstChild('HumanoidRootPart')then slapglove(U:
FindFirstChild('HumanoidRootPart'))game:GetService('ReplicatedStorage').WormholeTP:FireServer(CFrame.new(-
57.48336410522461,-4.672852516174316,67.94768524169922,0.5769212245941162,0.0005397791974246502,0.8167997002601624,
1.468715993269143e-7,0.9999997615814209,-6.609398988075554E-4,-0.8167998790740967,0.00038141835830174387,
0.5769210457801819))end until U:FindFirstChild('HumanoidRootPart')==nil or _G.AutoWormholeMastery==false end if U.Name==
'Imp'and U:FindFirstChild('Body')then repeat task.wait()if U:FindFirstChild('Body')then slapglove(U:FindFirstChild(
'Body'))end until U:FindFirstChild('Body')==nil or _G.AutoWormholeMastery==false end end game:GetService('Players').
LocalPlayer.Reset:FireServer()repeat task.wait()until not _G.AutoWormholeMastery or game.Players.LocalPlayer.Character
and game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')equipglove(ag)end end task.wait()end elseif _G.AutoWormholeMastery==true then
Notification("You don't have Wormhole equipped",_G.TimeNotify)wait(0.05)g['Auto Wormhole Mastery']:SetValue(false)end
end})ac:AddDropdown('Run Mastery',{Text='Run Mastery',Values={'Esp Player','Auto Kill Player'},Default='',Multi=false,
Callback=function(af)_G.RunMastery=af end})ac:AddToggle('Auto Run Mastery',{Text='Auto Run Mastery',Default=false,
Callback=function(af)_G.AutoRunMastery=af if CheckGlove()=='Run'then if _G.AutoRunMastery==false then if _G.RunMastery==
'Esp Player'then for ag,ah in ipairs(game.Players:GetChildren())do if ah~=game.Players.LocalPlayer and ah.Character and
ah.Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
and ah.Character:FindFirstChild('InLabyrinth')then if ah.Character.HumanoidRootPart:FindFirstChild('RunEsp')then ah.
Character.HumanoidRootPart.RunEsp:Destroy()end end end end end while _G.AutoRunMastery do if _G.RunMastery=='Esp Player'
then if game.Players.LocalPlayer.Character:FindFirstChild('InLabyrinth')then for ag,ah in ipairs(game.Players:
GetChildren())do if ah~=game.Players.LocalPlayer and ah.Character and ah.Character:FindFirstChild('HumanoidRootPart')and
game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and ah.Character:FindFirstChild('InLabyrinth')then
if ah.Character.HumanoidRootPart:FindFirstChild('RunEsp')==nil then RunEsp=Instance.new('BillboardGui',ah.Character.
HumanoidRootPart)RunEsp.Adornee=ah.Character.HumanoidRootPart RunEsp.Name='RunEsp'RunEsp.Size=UDim2.new(0,100,0,150)
RunEsp.AlwaysOnTop=true RunEspText=Instance.new('TextLabel',RunEsp)RunEspText.BackgroundTransparency=1 RunEspText.Font=
Enum.Font.SourceSansBold RunEspText.Size=UDim2.new(0,100,0,100)RunEspText.TextSize=15 RunEspText.TextStrokeTransparency=
0.5 RunEspText.Text='Target Player'end elseif ah.Character and ah.Character:FindFirstChild('HumanoidRootPart')and game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and ah.Character:FindFirstChild('InLabyrinth')==nil then
if ah.Character.HumanoidRootPart:FindFirstChild('RunEsp')then ah.Character.HumanoidRootPart.RunEsp:Destroy()end end end
end elseif _G.RunMastery=='Auto Kill Player'then if game.Players.LocalPlayer.Character:FindFirstChild('InLabyrinth')then
for ag,ah in ipairs(game.Players:GetChildren())do if ah~=game.Players.LocalPlayer and ah.Character and ah.Character:
FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and ah.
Character:FindFirstChild('InLabyrinth')then ah.Character.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame end end end end task.wait()end elseif _G.AutoRunMastery==true then Notification(
"You don't have Run equipped",_G.TimeNotify)wait(0.05)g['Auto Run Mastery']:SetValue(false)end end})ac:AddDropdown(
'Glovel Mastery',{Text='Glovel Mastery',Values={'Dip (350 Time)','Land Player'},Default='',Multi=false,Callback=function
(af)_G.GlovelMastery=af end})ac:AddToggle('Auto Glovel Mastery',{Text='Auto Glovel Mastery',Default=false,Callback=
function(af)_G.AutoGlovelMastery=af if CheckGlove()=='Glovel'then while _G.AutoGlovelMastery do if _G.GlovelMastery==
'Dip (350 Time)'then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0
,5,0)wait(0.3)for ag=1,400 do spawn(function()game:GetService('ReplicatedStorage').GlovelFunc:InvokeServer()end)task.
wait(0.05)end wait(0.4)game:GetService('ReplicatedStorage').GlovelCancel:FireServer()wait(0.8)elseif _G.GlovelMastery==
'Land Player'then if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then local ag=CheckGlove()
SpawnFarmMastery(true)repeat task.wait()until game.Players.LocalPlayer.Character:FindFirstChild('entered')wait(0.5)for
ah,U in ipairs(workspace:GetChildren())do if U~=game.Players.LocalPlayer and U.Name:find('\u{c5}'..game.Players.
LocalPlayer.Name)and U:FindFirstChild('HumanoidRootPart')then repeat task.wait()if U:FindFirstChild('HumanoidRootPart')
then slapglove(U:FindFirstChild('HumanoidRootPart'))end until U:FindFirstChild('HumanoidRootPart')==nil or _G.
AutoGlovelMastery==false end if U.Name=='Imp'and U:FindFirstChild('Body')then repeat task.wait()if U:FindFirstChild(
'Body')then slapglove(U:FindFirstChild('Body'))end until U:FindFirstChild('Body')==nil or _G.AutoGlovelMastery==false
end end game:GetService('Players').LocalPlayer.Reset:FireServer()repeat task.wait()until not _G.AutoGlovelMastery or
game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')equipglove(ag)end end task.wait()end elseif _G.
AutoGlovelMastery==true then Notification("You don't have Glovel equipped",_G.TimeNotify)wait(0.05)g[
'Auto Glovel Mastery']:SetValue(false)end end})ac:AddDropdown('Bomb Mastery',{Text='Bomb Mastery',Values={'Throw Bomb',
'Snipe Bomb + Void','Void Kill'},Default='',Multi=false,Callback=function(af)_G.BombMastery=af end})ac:AddToggle(
'Auto Bomb Mastery',{Text='Auto Bomb Mastery',Default=false,Callback=function(af)_G.AutoBombMastery=af if CheckGlove()==
'Bomb'then while _G.AutoBombMastery do if _G.BombMastery=='Throw Bomb'then for ag=1,1000 do spawn(function()game:
GetService('ReplicatedStorage'):WaitForChild('BombThrow'):FireServer('Ebutton')game:GetService('ReplicatedStorage'):
WaitForChild('BombThrow'):FireServer('Ebutton')end)end elseif _G.BombMastery=='Snipe Bomb + Void'then repeat task.wait()
until game.Players.LocalPlayer.Character if not game.Players.LocalPlayer.Character:FindFirstChild('entered')and game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then repeat task.wait()firetouchinterest(game.Players.
LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,0)firetouchinterest(game.
Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,1)until game.Players.
LocalPlayer.Character:FindFirstChild('entered')end if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and
game.Players.LocalPlayer.Backpack:FindFirstChild('Bomb')then game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.
Players.LocalPlayer.Backpack.Bomb)end task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace[
'SafeBox'].CFrame*CFrame.new(0,5,0)wait(0.4)game:GetService('ReplicatedStorage'):WaitForChild('BombThrow'):FireServer(
'Ebutton')task.delay(12.5,function()game:GetService('ReplicatedStorage'):WaitForChild('BombThrow'):FireServer('Ebutton')
end)repeat task.wait()if not game.Players.LocalPlayer.Character:FindFirstChild('entered')and game.Players.LocalPlayer.
Character:FindFirstChild('HumanoidRootPart')then firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild(
'Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,0)firetouchinterest(game.Players.LocalPlayer.Character:
WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,1)end if game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].
CFrame*CFrame.new(0,5,0)end until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name..'_b\u{f8}mb')wait(0.5)
repeat task.wait()if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.Workspace:
FindFirstChild(game.Players.LocalPlayer.Name..'_b\u{f8}mb')then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(
game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name..'_b\u{f8}mb').CFrame)end until game.Workspace:
FindFirstChild(game.Players.LocalPlayer.Name..'_b\u{f8}mb')==nil task.wait(0.75)repeat task.wait()game.Players.
LocalPlayer.Character:SetPrimaryPartCFrame(game.Workspace.DEATHBARRIER2.CFrame)until game.Players.LocalPlayer.Character
and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.LocalPlayer.Character:FindFirstChild(
'Humanoid').Health<=0 repeat task.wait()until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:
FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')elseif _G.
BombMastery=='Void Kill'then repeat task.wait()until game.Players.LocalPlayer.Character if not game.Players.LocalPlayer.
Character:FindFirstChild('entered')and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then repeat
task.wait()firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.
TouchInterest.Parent,0)firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.
Teleport1.TouchInterest.Parent,1)until game.Players.LocalPlayer.Character:FindFirstChild('entered')end game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)wait(0.3)game:GetService(
'ReplicatedStorage'):WaitForChild('BombThrow'):FireServer('Ebutton')repeat task.wait()if not game.Players.LocalPlayer.
Character:FindFirstChild('entered')and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.Parent
,0)firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.
Parent,1)end if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)end until game.Workspace:FindFirstChild(
game.Players.LocalPlayer.Name..'_b\u{f8}mb')task.wait(0.2)game:GetService('ReplicatedStorage'):WaitForChild('BombThrow')
:FireServer('Ebutton')task.wait(0.75)repeat task.wait()until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name
..'_b\u{f8}mb')==nil repeat task.wait()game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.Workspace.
DEATHBARRIER2.CFrame)until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild(
'Humanoid')and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid').Health<=0 repeat task.wait()until game.
Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')end task.wait()end elseif _G.AutoBombMastery==true then
Notification("You don't have Bomb equipped",_G.TimeNotify)wait(0.05)g['Auto Bomb Mastery']:SetValue(false)end end})ac:
AddToggle('Auto Stalker Mastery',{Text='Auto Stalker Mastery',Default=false,Callback=function(af)_G.AutoStalkerMastery=
af if not _G.AutoStalkerMastery then CreateFreezeBV({Remove=true})end if CheckGlove()=='Stalker'then while _G.
AutoStalkerMastery do if game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.
Character:FindFirstChild('HumanoidRootPart')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace[
'SafeBox'].CFrame*CFrame.new(0,5,0)wait(0.5)if game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and
game.Players.LocalPlayer.leaderstats.Slaps.Value>=666 then fireclickdetector(workspace.Lobby.Ghost.ClickDetector)game.
ReplicatedStorage.Ghostinvisibilityactivated:FireServer()fireclickdetector(workspace.Lobby['Stalker'].ClickDetector)task
.wait(1)for ag,ah in pairs(game.Players.LocalPlayer.Character:GetChildren())do if ah:IsA('BasePart')and ah.Name~=
'HumanoidRootPart'then ah.Transparency=0 end end end wait(0.2)repeat task.wait()firetouchinterest(game.Players.
LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,0)firetouchinterest(game.
Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,1)until game.Players.
LocalPlayer.Character:FindFirstChild('entered')end wait(0.35)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=
workspace['SafeBox'].CFrame*CFrame.new(0,5,0)if game.Players.LocalPlayer.Character:FindFirstChild('Stalker')then game.
Players.LocalPlayer.Character:FindFirstChild('Stalker').Parent=game.Players.LocalPlayer.Backpack end wait(0.3)if game.
Players.LocalPlayer.Character:FindFirstChild('entered')then local ag={}for ah,U in pairs(game.Players:GetChildren())do
if U~=game.Players.LocalPlayer and U.Character and U.Character:FindFirstChild('HumanoidRootPart')and U.Character.
HumanoidRootPart.BrickColor~=BrickColor.new('New Yeller')and U.Character:FindFirstChild('Ragdolled')and not U.Character.
HumanoidRootPart:FindFirstChild('BlockedShield')and U.Character.Ragdolled.Value==false and U.Character.isInArena.Value==
true and notSlap(U.Character,BlackList)then table.insert(ag,U)end end if#ag~=0 then repeat task.wait()until _G.
AutoStalkerMastery==false or game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil or game.Players.
LocalPlayer.Character:FindFirstChild('ReadyToBurst')local ah=ag[math.random(#ag)]CreateFreezeBV()game.Players.
LocalPlayer.Character:SetPrimaryPartCFrame(ah.Character:FindFirstChild('Head').CFrame*CFrame.new(0,7,0))repeat task.
wait()until _G.AutoStalkerMastery==false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-ah.Character:
FindFirstChild('HumanoidRootPart').Position).Magnitude<8 wait(0.3)for U=1,3 do slapglove(ah.Character:FindFirstChild(
'Head'))wait(0.2)end game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0
,5,0)task.wait(3)end end task.wait()end elseif af==true then Notification("You don't have Stalker equipped",_G.
TimeNotify)wait(0.05)g['Auto Stalker Mastery']:SetValue(false)end end})ac:AddToggle('Auto Rage Mastery',{Text=
'Auto Rage Mastery',Default=false,Callback=function(af)_G.AutoRageMastery=af if CheckGlove()=='Rage'then while _G.
AutoRageMastery do if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then local ag=CheckGlove()
SpawnFarmMastery(true)repeat task.wait()until game.Players.LocalPlayer.Character:FindFirstChild('entered')wait(0.5)
spawn(function()for ah,U in ipairs(workspace:GetChildren())do if U~=game.Players.LocalPlayer and U.Name:find('\u{c5}'..
game.Players.LocalPlayer.Name)and U:FindFirstChild('HumanoidRootPart')then repeat task.wait()if U:FindFirstChild(
'HumanoidRootPart')then slapglove(U:FindFirstChild('HumanoidRootPart'))end until U:FindFirstChild('HumanoidRootPart')==
nil or _G.AutoRageMastery==false end if U.Name=='Imp'and U:FindFirstChild('Body')then repeat task.wait()if U:
FindFirstChild('Body')then slapglove(U:FindFirstChild('Body'))end until U:FindFirstChild('Body')==nil or _G.
AutoRageMastery==false end end end)repeat task.wait()until game:GetService('Players').LocalPlayer.Character and(game:
GetService('Players').LocalPlayer.Character:GetAttribute('rage_percent')or 0)>=53 game:GetService('ReplicatedStorage'):
WaitForChild('GRRRRR'):FireServer('frenzy')repeat task.wait()until game:GetService('Players').LocalPlayer.Character and(
game:GetService('Players').LocalPlayer.Character:GetAttribute('rage_percent')or 0)<=49 game:GetService('Players').
LocalPlayer.Reset:FireServer()repeat task.wait()until not _G.AutoRageMastery or game.Players.LocalPlayer.Character and
game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')equipglove(ag)end task.wait()end elseif _G.AutoRageMastery==true then Notification(
"You don't have Rage equipped, or you have 19k+ slap",_G.TimeNotify)wait(0.05)g['Auto Rage Mastery']:SetValue(false)end
end})ac:AddToggle('Auto Stick Mastery',{Text='Auto Stick Mastery',Default=false,Callback=function(af)_G.AutoStickMastery
=af if CheckGlove()=='Stick'then while _G.AutoStickMastery do if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then local ag=CheckGlove()SpawnFarmMastery(true)repeat task.wait()until game.Players.LocalPlayer.
Character:FindFirstChild('entered')wait(0.5)for ah,U in ipairs(workspace:GetChildren())do if U~=game.Players.LocalPlayer
and U.Name:find('\u{c5}'..game.Players.LocalPlayer.Name)and U:FindFirstChild('HumanoidRootPart')then repeat task.wait()
if U:FindFirstChild('HumanoidRootPart')then slapglove(U:FindFirstChild('HumanoidRootPart'))end until U:FindFirstChild(
'HumanoidRootPart')==nil or _G.AutoGlovelMastery==false end if U.Name=='Imp'and U:FindFirstChild('Body')then repeat task
.wait()if U:FindFirstChild('Body')then slapglove(U:FindFirstChild('Body'))end until U:FindFirstChild('Body')==nil or _G.
AutoGlovelMastery==false end end game:GetService('Players').LocalPlayer.Reset:FireServer()repeat task.wait()until not _G
.AutoGlovelMastery or game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered'
)==nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')equipglove(ag)end task.wait()end elseif
af==true then Notification("You don't have Stick equipped",_G.TimeNotify)wait(0.05)g['Auto Stick Mastery']:SetValue(
false)end end})ac:AddToggle('Auto Dice Mastery',{Text='Auto Dice Mastery',Default=false,Callback=function(af)_G.
AutoDiceMastery=af if CheckGlove()=='Dice'then while _G.AutoDiceMastery do if game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')then local ag=MasteryPlayers(CheckGlove(),true)if ag then CreateFreezeBV()for ah,U in
pairs(game.Players.LocalPlayer.Character:GetChildren())do if U:IsA('BasePart')then U.CanCollide=false end end game.
Players.LocalPlayer.Character:SetPrimaryPartCFrame(ag.Character:FindFirstChild('HumanoidRootPart').CFrame*CFrame.new(0,-
6,5))repeat task.wait()until _G.AutoDiceMastery==false or(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-
ag.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude<8 slapglove(ag.Character.Head)wait(0.1)game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)task.wait(0.7)end end task.
wait()end elseif af==true then Notification("You don't have Dice equipped",_G.TimeNotify)wait(0.05)g['Auto Dice Mastery'
]:SetValue(false)end end})ac:AddToggle('Auto Booster Mastery',{Text='Auto Booster Mastery',Default=false,Callback=
function(af)_G.AutoBoosterMastery=af if CheckGlove()=='Booster'then while _G.AutoBoosterMastery do if game.Players.
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then local ag=CheckGlove()SpawnFarmMastery(true)repeat task.
wait()until game.Players.LocalPlayer.Character:FindFirstChild('entered')wait(0.5)for ah,U in ipairs(workspace:
GetChildren())do if U~=game.Players.LocalPlayer and U.Name:find('\u{c5}'..game.Players.LocalPlayer.Name)and U:
FindFirstChild('HumanoidRootPart')then for V=1,35 do if U:FindFirstChild('HumanoidRootPart')then slapglove(U:
FindFirstChild('HumanoidRootPart'))end task.wait()end end end game:GetService('Players').LocalPlayer.Reset:FireServer()
repeat task.wait()until not _G.AutoBoosterMastery or game.Players.LocalPlayer.Character and game.Players.LocalPlayer.
Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
equipglove(ag)end task.wait()end elseif _G.AutoBoosterMastery==true then Notification("You don't have Booster equipped",
_G.TimeNotify)wait(0.05)g['Auto Booster Mastery']:SetValue(false)end end})ac:AddToggle('Auto Killstreak Mastery',{Text=
'Auto Killstreak Mastery',Default=false,Callback=function(af)_G.AutoKillstreakMastery=af if af==false then
CreateFreezeBV({Remove=true})end if CheckGlove()=='Killstreak'then while _G.AutoKillstreakMastery do local ag={}for ah,U
in pairs(game.Players:GetChildren())do if U~=game.Players.LocalPlayer and U.Character and U.Character:FindFirstChild(
'HumanoidRootPart')and U.Character:FindFirstChild('Ragdolled')and not U.Character.HumanoidRootPart:FindFirstChild(
'BlockedShield')and U.Character.Ragdolled.Value==false and U.Character.isInArena.Value==true and notSlap(U.Character,
BlackList)then table.insert(ag,U)end end if#ag~=0 then CreateFreezeBV()local ah=ag[math.random(#ag)]repeat task.wait()if
ah.Character.Ragdolled.Value==false then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(ah.Character.
HumanoidRootPart.CFrame*CFrame.new(0,-10,0))task.wait(0.25)game.ReplicatedStorage.KSHit:FireServer(ah.Character:
FindFirstChild('HumanoidRootPart'))game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace['SafeBox'].CFrame*
CFrame.new(0,5,0))task.wait(0.85)end until _G.AutoKillstreakMastery~=true or(ah.Character:FindFirstChild(
'HumanoidRootPart')and ah.Character.HumanoidRootPart.Position.Y<-10)or(ah.Character:FindFirstChild('Humanoid')and ah.
Character.Humanoid.Health<=0)end task.wait()end elseif _G.AutoKillstreakMastery==true then Notification(
"You don't have Killstreak equipped",_G.TimeNotify)wait(0.05)g['Auto Killstreak Mastery']:SetValue(false)end end})ac:
AddToggle('Auto Spin Mastery',{Text='Auto Spin Mastery',Default=false,Callback=function(af)_G.AutoSpinMastery=af if
CheckGlove()=='spin'then while _G.AutoSpinMastery do if game.Players.LocalPlayer.Character:FindFirstChild('entered')==
nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then repeat task.wait()if game.Players.
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then firetouchinterest(game.Players.LocalPlayer.Character.
HumanoidRootPart,workspace.Lobby.Teleport1,0)firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
workspace.Lobby.Teleport1,1)end until game.Players.LocalPlayer.Character:FindFirstChild('entered')repeat task.wait()if
game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then firetouchinterest(game.Players.LocalPlayer.
Character.HumanoidRootPart,workspace.Lobby.Teleport1,0)firetouchinterest(game.Players.LocalPlayer.Character.
HumanoidRootPart,workspace.Lobby.Teleport1,1)end game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace[
'SafeBox'].CFrame*CFrame.new(0,5,0))until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:
FindFirstChild('Humanoid')and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid').Health<=0 end task.wait()end
elseif _G.AutoSpinMastery==true then Notification("You don't have Spin equipped",_G.TimeNotify)wait(0.05)g[
'Auto Spin Mastery']:SetValue(false)end end})ac:AddToggle('Auto Brick Mastery',{Text='Auto Big Brick',Default=false,
Callback=function(af)_G.AutoBrickMastery=af if CheckGlove()=='Brick'then while _G.AutoBrickMastery do for ag,ah in
pairs(game.Workspace:GetChildren())do if ah.Name=='Union'then ah.Size=Vector3.new(20,1,20)end end task.wait()end elseif
_G.AutoBrickMastery==true then Notification("You don't have Brick equipped",_G.TimeNotify)wait(0.05)g[
'Auto Brick Mastery']:SetValue(false)end end})local af=TabBoxMastery:AddTab('Mastery Help')table.insert(_G.ConnectFun,
game:GetService('RunService').RenderStepped:Connect(function()pcall(function()Players1=(_G.HelpPlayer1 and _G.
HelpPlayer1.Character)or nil root1=(Players1 and Players1:FindFirstChild('HumanoidRootPart'))or nil head1=(Players1 and
Players1:FindFirstChild('Head'))or nil torso1=(Players1 and Players1:FindFirstChild('Torso'))or nil hum1=(Players1 and
Players1:FindFirstChild('Humanoid'))or nil Players2=game.Players.LocalPlayer.Character or nil root=(Players2 and
Players2:FindFirstChild('HumanoidRootPart'))or nil head=(Players2 and Players2:FindFirstChild('Head'))or nil hum=(
Players2 and Players2:FindFirstChild('Humanoid'))or nil PlayersMain=(_G.HelpPlayer2 and _G.HelpPlayer2.Character)or nil
rootmain=(PlayersMain and PlayersMain:FindFirstChild('HumanoidRootPart'))or nil headmain=(PlayersMain and PlayersMain:
FindFirstChild('Head'))or nil hummain=(PlayersMain and PlayersMain:FindFirstChild('Humanoid'))or nil end)end))function
HelpMasteryJoin(ag)ag=ag or{}ag.NoCF=ag.NoCF or false ag.CloneCF=ag.CloneCF or CFrame.new(0,5,0)ag.MainCF=ag.MainCF or
CFrame.new(0,5,-3)ag.PlaceCF=ag.PlaceCF or workspace['SafeBox'].S5 if Players2 then CreateFreezeBV({Name=
'HelpMasteryFreezeBv'})if Players2 and game.Players.LocalPlayer.Backpack:FindFirstChild(CheckGlove())then game.Players.
LocalPlayer.Backpack:FindFirstChild(CheckGlove()).Parent=Players2 end if not ag.NoCF then if Players2 and Players2:
FindFirstChild('entered')then root.CFrame=ag.PlaceCF.CFrame*(_G.Players1CloneHelp and ag.CloneCF or ag.MainCF)end end if
Players2 and Players2:FindFirstChild('entered')==nil then root.CFrame=game.Workspace:FindFirstChild('Lobby'):
FindFirstChild('Teleport1').CFrame end end end af:AddLabel(
[[[<font color="rgb(73, 230, 133)">Mastery Help</font>] Please have a input Account Clone ready to help.]],true)
CloneAccHelp=af:AddInput('Players',{Text='Clone Account',Finished=true,Placeholder='Username',Callback=function(ag)_G.
HelpPlayer1=FoundPlr(ag,true)end})af:AddInput('Players1',{Text='Main Account',Finished=true,Placeholder='Username',
Callback=function(ag)_G.HelpPlayer2=FoundPlr(ag,true)end})af:AddToggle('Enabled Players 1 Help',{Text=
'Enabled Account Clone Help',Default=false,Callback=function(ag)_G.Players1CloneHelp=ag if CloneAccHelp then
CloneAccHelp:SetVisible(not _G.Players1CloneHelp)end end})af:AddDropdown('Acrobat Mastery',{Text='Acrobat Mastery',
Values={'Roll + Slap','Slap + Roll + Slap'},Default='',Multi=false,Callback=function(ag)_G.AcrobatMasteryHelp=ag end})af
:AddToggle('Auto Mastery Acrobat',{Text='Auto Mastery Acrobat',Default=false,Callback=function(ag)_G.
AutoAcrobatMasteryHelp=ag if not _G.AutoAcrobatMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})
end if _G.Players1CloneHelp or CheckGlove()=='Acrobat'then spawn(function()while _G.AutoAcrobatMasteryHelp do
CreateFreezeBV({Name='HelpMasteryFreezeBv'})if not _G.Players1CloneHelp then if Players1 and Players2 and Players2:
FindFirstChild('entered')and Players1:FindFirstChild('entered')then if _G.AcrobatMasteryHelp=='Roll + Slap'then if
Players1 and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then slapglove(root1)end game:
GetService('ReplicatedStorage'):WaitForChild('Roll'):FireServer()wait(0.2)repeat task.wait()until Players1 and Players1:
FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(1)end end end task.wait()end end)while _G.
AutoAcrobatMasteryHelp do HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=CFrame.new(0,5,5)})if not _G.
Players1CloneHelp then if Players1 and Players1:FindFirstChild('entered')and root1 and root and(root.Position-root1.
Position).Magnitude<=150 then if Players1 and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false
then if _G.AcrobatMasteryHelp=='Slap + Roll + Slap'then slapglove(root1)wait(0.2)repeat task.wait()until Players1 and
Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false game:GetService('ReplicatedStorage'):
WaitForChild('Roll'):FireServer()wait(0.3)slapglove(root1)wait(1.7)end end end end task.wait()end elseif ag==true then
Notification("You don't have Acrobat equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Acrobat']:SetValue(false)end end}
)af:AddDropdown('Tinkerer Mastery',{Text='Tinkerer Mastery',Values={'Bomb Clone','Bomb + Slap Clone'},Default='',Multi=
false,Callback=function(ag)_G.TinkeverMasteryHelp=ag end})af:AddToggle('Auto Mastery Tinkerer',{Text=
'Auto Mastery Tinkerer',Default=false,Callback=function(ag)_G.AutoTinkeverMasteryHelp=ag if not _G.
AutoTinkeverMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or
CheckGlove()=='Tinkerer'then spawn(function()while _G.AutoTinkeverMasteryHelp do CreateFreezeBV({Name=
'HelpMasteryFreezeBv'})if not _G.Players1CloneHelp then if Players1 and Players2 and Players2:FindFirstChild('entered')
and Players1:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.
Value==false then game:GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer('E_ABILITY')task.wait(
3.7)end end end task.wait()end end)while _G.AutoTinkeverMasteryHelp do HelpMasteryJoin({CloneCF=CFrame.new(0,5,-3),
MainCF=CFrame.new(0,5,0),PlaceCF=workspace.SafeBoxSpace})if not _G.Players1CloneHelp then if Players1 and Players1:
FindFirstChild('entered')and root1 and root and(root.Position-root1.Position).Magnitude<=150 then if _G.
TinkeverMasteryHelp=='Bomb + Slap Clone'then if Players1 and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.
Value then wait(0.5)repeat task.wait()until Players1 and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.
Value==false wait(0.3)for ah=1,10 do slapglove(root1)task.wait(0.85)end repeat task.wait()until Players1 and Players1:
FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.35)end end end end task.wait()end elseif ag==
true then Notification("You don't have Tinkerer equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Tinkerer']:SetValue(
false)end end})af:AddDropdown('Bubble Mastery',{Text='Bubble Mastery',Values={'Bubble + Slap Clone','Bubble Clone'},
Default='',Multi=false,Callback=function(ag)_G.BubbleMasteryHelp=ag end})af:AddToggle('Auto Mastery Bubble',{Text=
'Auto Mastery Bubble',Default=false,Callback=function(ag)_G.AutoBubbleMasteryHelp=ag if not _G.AutoBubbleMasteryHelp
then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Bubble'then
function BubbleChild()for ah,U in pairs(workspace:GetChildren())do if U.Name=='BubbleObject'and(root.Position-U.Position
).Magnitude<=200 then return U end end return nil end spawn(function()while _G.AutoBubbleMasteryHelp do CreateFreezeBV({
Name='HelpMasteryFreezeBv'})if not _G.Players1CloneHelp then if _G.BubbleMasteryHelp=='Bubble Clone'then if Players1 and
Players2 and Players2:FindFirstChild('entered')and Players1:FindFirstChild('entered')then if Players1 and Players1:
FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then game:GetService('ReplicatedStorage').BubbleThrow:
FireServer()wait(0.5)repeat task.wait()until not BubbleTo()task.wait(2)end end end end task.wait()end end)while _G.
AutoBubbleMasteryHelp do HelpMasteryJoin({NoCF=true})if Players2 and Players2:FindFirstChild('entered')then if _G.
Players1CloneHelp then if BubbleChild()then pcall(function()root.CFrame=BubbleChild().CFrame end)else root.CFrame=
workspace.SafeBoxSpace.CFrame*CFrame.new(0,9,0)end else root.CFrame=workspace.SafeBoxSpace.CFrame*CFrame.new(0,9,5.9)end
end if not _G.Players1CloneHelp then if _G.BubbleMasteryHelp=='Bubble + Slap Clone'then if Players1 and Players2 and
Players2:FindFirstChild('entered')and Players1:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild(
'Ragdolled')and Players1.Ragdolled.Value==false then slapglove(root1)wait(0.4)repeat task.wait()until Players1 and
Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.35)game:GetService(
'ReplicatedStorage').BubbleThrow:FireServer()wait(0.5)repeat task.wait()until BubbleChild()~=nil wait(0.4)repeat task.
wait()until not BubbleChild()task.wait(5.5)end end end end task.wait()end elseif ag==true then Notification(
"You don't have Bubble equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Bubble']:SetValue(false)end end})af:
AddDropdown('Engineer Mastery',{Text='Engineer Mastery',Values={'Kill Clone','Slap Clone'},Default='',Multi=false,
Callback=function(ag)_G.EngineerMasteryHelp=ag end})af:AddToggle('Auto Mastery Engineer',{Text='Auto Mastery Engineer',
Default=false,Callback=function(ag)_G.AutoEngineerMasteryHelp=ag if not _G.AutoEngineerMasteryHelp then CreateFreezeBV({
Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp and not PlayersMain and ag==true then Notification(
'You have input main account',_G.TimeNotify)wait(0.05)g['Auto Mastery Engineer']:SetValue(false)end if _G.
Players1CloneHelp or CheckGlove()=='Engineer'then function TurretSpawn()for ah,U in pairs(workspace:GetChildren())do if
U.Name:lower():find('turret')and U:FindFirstChild('Hitbox')and(root.Position-U.Hitbox.Position).Magnitude<=200 then
return U end end return nil end spawn(function()while _G.AutoEngineerMasteryHelp do Turret=TurretSpawn()CreateFreezeBV({
Name='HelpMasteryFreezeBv'})if _G.Players1CloneHelp then if PlayersMain and Players2 and Players2:FindFirstChild(
'entered')and PlayersMain:FindFirstChild('entered')then if Players2:FindFirstChild('Ragdolled')and Players2.Ragdolled.
Value==false then repeat task.wait()if Turret then for ah,U in pairs(Turret:GetChildren())do local V=U:FindFirstChild(
'Glove',true)if V then Players2:SetPrimaryPartCFrame(V.CFrame)end end end until Players2.Ragdolled.Value==true if _G.
EngineerMasteryHelp=='Kill Clone'then wait(0.5)repeat task.wait()Players2:SetPrimaryPartCFrame(game.Workspace.
DEATHBARRIER.CFrame)until not Players2 or Players2:FindFirstChild('Humanoid')and Players2:FindFirstChild('Humanoid').
Health<=0 repeat task.wait()until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:
FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')wait(0.3)end end
end else if not TurretSpawn()and Players2 and Players2:FindFirstChild('entered')and Players2:FindFirstChild('Ragdolled')
and Players2.Ragdolled.Value==false then game:GetService('ReplicatedStorage').Sentry:FireServer()wait(5.5)end end task.
wait()end end)while _G.AutoEngineerMasteryHelp do HelpMasteryJoin({NoCF=true})if Players2 and Players2:FindFirstChild(
'entered')then local ah=TurretSpawn()if _G.Players1CloneHelp then if not ah then Players2:SetPrimaryPartCFrame(workspace
.Safespot.DefendPart4.CFrame*CFrame.new(0,8,-7.5))end elseif not _G.Players1CloneHelp then Players2:
SetPrimaryPartCFrame(workspace.Safespot.DefendPart4.CFrame*ah and CFrame.new(0,8,9)or CFrame.new(0,8,0))end end task.
wait()end elseif ag==true then Notification("You don't have Engineer equipped",_G.TimeNotify)wait(0.05)g[
'Auto Mastery Engineer']:SetValue(false)end end})af:AddDropdown('Voodoo Mastery',{Text='Voodoo Mastery',Values={
'Farm Voodoo Clone','Voodoo Slap 20 Clone'},Default='',Multi=false,Callback=function(ag)_G.VoodooMasteryHelp=ag end})af:
AddToggle('Auto Mastery Voodoo',{Text='Auto Mastery Voodoo',Default=false,Callback=function(ag)_G.AutoVoodooMasteryHelp=
ag if not _G.AutoVoodooMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.
Players1CloneHelp or CheckGlove()=='Voodoo'then spawn(function()while _G.AutoVoodooMasteryHelp do CreateFreezeBV({Name=
'HelpMasteryFreezeBv'})if not _G.Players1CloneHelp then if Players1 and Players2 and Players2:FindFirstChild('entered')
and Players1:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.
Value==false then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<50 then game:GetService(
'ReplicatedStorage').GeneralAbility:FireServer()task.wait(6.66)end end end end task.wait()end end)while _G.
AutoVoodooMasteryHelp do local function FoundDollPlr(ah)local U for V,W in pairs(ah:GetChildren())do if W.Name:lower():
find('doll')then U=W end end return U end if Players2 and Players2:FindFirstChild('entered')then if Players2 and
FoundDollPlr(Players2)then TpGetDoll=CFrame.new(0,8,0)else TpGetDoll=CFrame.new(0,5,0)end end HelpMasteryJoin({CloneCF=
TpGetDoll,MainCF=CFrame.new(0,5,0)})local function HasEnabledParticle()if Players2 and Players2:FindFirstChild(
CheckGlove())and Players2[CheckGlove()]:FindFirstChild('Glove')and Players2[CheckGlove()].Glove:FindFirstChild(
'ParticleAttachement')then for ah,U in ipairs(Players2[CheckGlove()].Glove.ParticleAttachement:GetChildren())do if U.
Name:find('Particle')and U.Enabled then return true end end end return false end if not _G.Players1CloneHelp then if _G.
VoodooMasteryHelp:match('Voodoo')then if Players2 and Players2:FindFirstChild('entered')then if Players1 and Players1:
FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then if
HasEnabledParticle()then slapglove(root1)wait(0.3)repeat task.wait()until FoundDollPlr(Players1)wait(0.3)local ah=
FoundDollPlr(Players1)if ah then slapglove(ah)end task.wait(0.5)end end end end end task.wait()end elseif ag==true then
Notification("You don't have Voodoo equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Voodoo']:SetValue(false)end end})
af:AddDropdown('Bus Mastery',{Text='Bus Mastery',Values={'Farm Slap Clone','Bus Crash Clone'},Default='',Multi=false,
Callback=function(ag)_G.BusMasteryHelp=ag end})af:AddToggle('Auto Mastery Bus',{Text='Auto Mastery Bus',Default=false,
Callback=function(ag)_G.AutoBusMasteryHelp=ag if not _G.AutoBusMasteryHelp then CreateFreezeBV({Remove=true,Name=
'HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='bus'then spawn(function()while _G.
AutoBusMasteryHelp do CreateFreezeBV({Name='HelpMasteryFreezeBv'})if not _G.Players1CloneHelp then if Players1 and
Players2 and Players2:FindFirstChild('entered')and Players1:FindFirstChild('entered')then if Players1 and Players1:
FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then if(root and root1 and(root.Position-root1.Position).
Magnitude or 0)<50 then if _G.BusMasteryHelp=='Bus Crash Clone'then game:GetService('ReplicatedStorage').busmoment:
FireServer()task.wait(6.1)end end end end end task.wait()end end)while _G.AutoBusMasteryHelp do HelpMasteryJoin({CloneCF
=CFrame.new(0,5,0),MainCF=CFrame.new(0,5,6.5)})if not _G.Players1CloneHelp then if Players2 and Players2:FindFirstChild(
'entered')then if Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.
Ragdolled.Value==false then if _G.BusMasteryHelp=='Farm Slap Clone'then for ah=1,10 do if root1 then slapglove(root1)
task.wait(0.87)end end wait(0.3)repeat task.wait()until Players1 and Players1:FindFirstChild('Ragdolled')and Players1.
Ragdolled.Value==false wait(0.6)end end end end task.wait()end elseif ag==true then Notification(
"You don't have bus equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery bus']:SetValue(false)end end})af:AddDropdown(
'Shard Mastery',{Text='Shard Mastery',Values={'Slap + Shard Clone','150 Studs Clone','Shard Clone'},Default='',Multi=
false,Callback=function(ag)_G.ShardMasteryHelp=ag end})af:AddToggle('Auto Mastery Shard',{Text='Auto Mastery Shard',
Default=false,Callback=function(ag)_G.AutoShardMasteryHelp=ag if not _G.AutoShardMasteryHelp then CreateFreezeBV({Remove
=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Shard'then spawn(function()while _G.
AutoShardMasteryHelp do CreateFreezeBV({Name='HelpMasteryFreezeBv'})if not _G.Players1CloneHelp then if Players1 and
Players2 and Players2:FindFirstChild('entered')and Players1:FindFirstChild('entered')then if Players1 and Players1:
FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then if(root and root1 and(root.Position-root1.Position).
Magnitude or 0)<200 then game:GetService('ReplicatedStorage').Shards:FireServer()task.wait(4.87)end end end end task.
wait()end end)while _G.AutoShardMasteryHelp do HelpMasteryJoin({CloneCF=(_G.ShardMasteryHelp:find('Shard Clone')and
CFrame.new(0,5,0)or CFrame.new(0,5,-200)),MainCF=CFrame.new(0,5,8)})if not _G.Players1CloneHelp then if _G.
AutoShardMasteryHelp=='Slap + Shard Clone'then if Players1 and Players2 and Players2:FindFirstChild('entered')and
Players1:FindFirstChild('entered')then repeat task.wait()until Players1 and Players1:FindFirstChild('Ragdolled')and
Players1.Ragdolled.Value wait(0.5)for ah=1,5 do slapglove(root1)task.wait(0.9)end task.wait(0.8)repeat task.wait()until
Players1 and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.7)end end end task.
wait()end elseif ag==true then Notification("You don't have Shard equipped",_G.TimeNotify)wait(0.05)g[
'Auto Mastery Shard']:SetValue(false)end end})af:AddDropdown('Bonk Mastery',{Text='BONK Mastery',Values={'BONK Clone',
'BONK + Slap'},Default='',Multi=false,Callback=function(ag)_G.BonkMasteryHelp=ag end})af:AddToggle('Auto Mastery BONK',{
Text='Auto Mastery BONK',Default=false,Callback=function(ag)_G.AutoBonkMasteryHelp=ag if not _G.AutoBonkMasteryHelp then
CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='BONK'then spawn(
function()while _G.AutoBonkMasteryHelp do CreateFreezeBV({Name='HelpMasteryFreezeBv'})if not _G.Players1CloneHelp then
if Players1 and Players2 and Players2:FindFirstChild('entered')and Players1:FindFirstChild('entered')then if(root and
root1 and(root.Position-root1.Position).Magnitude or 0)<200 then game:GetService('ReplicatedStorage'):WaitForChild(
'BONK'):FireServer()end end end task.wait()end end)while _G.AutoBonkMasteryHelp do HelpMasteryJoin({CloneCF=CFrame.new(0
,5,0),MainCF=CFrame.new(0,5,5)})if Players2 and Players2:FindFirstChild('entered')then if Players1 and Players1:
FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then if _G.
BonkMasteryHelp=='BONK + Slap'then if torso1 and torso1.Size.Y<1.7 then for ah=1,9 do if torso1 and torso1.Size.Y<1.7
then slapglove(root1)task.wait(0.9)end end task.wait(0.8)repeat task.wait()until Players1 and Players1:FindFirstChild(
'Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.7)end end end end task.wait()end elseif ag==true then
Notification("You don't have BONK equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery BONK']:SetValue(false)end end})af:
AddDropdown('Hexa Mastery',{Text='Hexa Mastery',Values={'Ability Clone','Slap + Ability Clone','Kill Clone'},Default='',
Multi=false,Callback=function(ag)_G.HexaMasteryHelp=ag end})af:AddToggle('Auto Mastery Hexa',{Text='Auto Mastery Hexa',
Default=false,Callback=function(ag)_G.AutoHexaMasteryHelp=ag if not _G.AutoBonkMasteryHelp then CreateFreezeBV({Remove=
true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Hexa'then spawn(function()while _G.
AutoHexaMasteryHelp do if _G.Players1CloneHelp then CreateFreezeBV({Name='HelpMasteryFreezeBv'})if Players1 and Players2
and Players2:FindFirstChild('entered')and Players1:FindFirstChild('entered')then if _G.HexaMasteryHelp=='Kill Clone'then
repeat task.wait()until _G.AutoHexaMasteryHelp==false or Players2 and Players2:FindFirstChild('entered')and Players2:
FindFirstChild('Ragdolled')and Players2.Ragdolled.Value wait(1)repeat task.wait()Players2:SetPrimaryPartCFrame(game.
Workspace.DEATHBARRIER.CFrame)until not Players2 or Players2:FindFirstChild('Humanoid')and Players2:FindFirstChild(
'Humanoid').Health<=0 repeat task.wait()until not _G.AutoHexaMasteryHelp or game.Players.LocalPlayer.Character and game.
Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')wait(0.5)end end end task.wait()end end)while _G.AutoHexaMasteryHelp do pcall(function()
HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=CFrame.new(0,5,-7)})if not _G.Players1CloneHelp then if Players2 and
Players2:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild(
'Ragdolled')and Players1.Ragdolled.Value==false then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)
<=100 then if _G.HexaMasteryHelp=='Ability Clone'or _G.HexaMasteryHelp=='Kill Clone'then game:GetService(
'ReplicatedStorage').GeneralAbility:FireServer()elseif _G.HexaMasteryHelp=='Slap + Ability Clone'then slapglove(root1)
task.wait(0.6)game:GetService('ReplicatedStorage').GeneralAbility:FireServer()end task.wait(0.5)repeat task.wait()until
Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==
false task.wait(0.5)end end end end end)task.wait()end elseif ag==true then Notification("You don't have BONK equipped",
_G.TimeNotify)wait(0.05)g['Auto Mastery BONK']:SetValue(false)end end})af:AddDropdown('Thanos Mastery',{Text=
'Thanos Mastery',Values={'Ambush Clone','Recover/Save Yourself','Combo Clone'},Default='',Multi=false,Callback=function(
ag)_G.ThanosMasteryHelp=ag if ag=='Recover/Save Yourself'then Notification(
'Clone account have choose Recover/Save Yourself',5)end end})af:AddToggle('Auto Mastery Thanos',{Text=
'Auto Mastery Thanos',Default=false,Callback=function(ag)_G.AutoThanosMasteryHelp=ag if not _G.AutoThanosMasteryHelp
then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Thanos'then
if _G.Players1CloneHelp and not PlayersMain and ag==true then Notification('You have input main account',_G.TimeNotify)
wait(0.05)g['Auto Mastery Thanos']:SetValue(false)return end spawn(function()while _G.AutoThanosMasteryHelp do
CreateFreezeBV({Name='HelpMasteryFreezeBv'})if _G.Players1CloneHelp then if PlayersMain and Players2 and Players2:
FindFirstChild('entered')and PlayersMain:FindFirstChild('entered')and PlayersMain:FindFirstChild('Ragdolled')and
PlayersMain.Ragdolled.Value==false then if(root and rootmain and(root.Position-rootmain.Position).Magnitude or 0)<200
then if _G.ThanosMasteryHelp=='Recover/Save Yourself'then slapglove(rootmain)task.wait(6.2)end end end end task.wait()
end end)while _G.AutoThanosMasteryHelp do HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=CFrame.new(0,5,5)})if not _G
.Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild(
'entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then if _G.ThanosMasteryHelp==
'Ambush Clone'then game:GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer(2)task.wait(1.9)for ah
=1,9 do slapglove(root1)task.wait(0.8)end elseif _G.ThanosMasteryHelp=='Combo Clone'then slapglove(root1)game:
GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer(2)task.wait(1.9)slapglove(root1)else repeat
task.wait()until Players2 and Players2:FindFirstChild('entered')and Players2:FindFirstChild('Ragdolled')and Players2.
Ragdolled.Value==true wait(0.3)repeat task.wait()until Players2 and Players2:FindFirstChild('entered')and Players2:
FindFirstChild('Ragdolled')and Players2.Ragdolled.Value==false wait(0.3)game:GetService('ReplicatedStorage'):
WaitForChild('GeneralAbility'):FireServer(2)task.wait(6.3)end wait(0.5)repeat task.wait()until Players1 and Players1:
FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.5)end
end end task.wait()end elseif ag==true then Notification("You don't have Thanos equipped",_G.TimeNotify)wait(0.05)g[
'Auto Mastery Thanos']:SetValue(false)end end})af:AddDropdown('Soul Mastery',{Text='Soul Mastery',Values={'Combo clone',
'Kill clone for strongest','Kill clone AOE blast'},Default='',Multi=false,Callback=function(ag)_G.SoulMasteryHelp=ag if
ag:find('Kill')then Notification('Clone account have choose kill clone',5)end end})af:AddToggle('Auto Mastery Soul',{
Text='Auto Mastery Soul',Default=false,Callback=function(ag)_G.AutoSoulMasteryHelp=ag if not _G.AutoSoulMasteryHelp then
CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Soul'then spawn(
function()while _G.AutoSoulMasteryHelp do CreateFreezeBV({Name='HelpMasteryFreezeBv'})if _G.Players1CloneHelp then if
PlayersMain and Players2 and Players2:FindFirstChild('entered')and PlayersMain:FindFirstChild('entered')and Players2:
FindFirstChild('Ragdolled')and Players2.Ragdolled.Value==true then if(root and rootmain and(root.Position-rootmain.
Position).Magnitude or 0)<200 then if tonumber(PlayersMain:GetAttribute('souls'))>=50 then if _G.SoulMasteryHelp:find(
'Kill')and(not _G.SoulMasteryHelp=='Kill clone for strongest'or tonumber(PlayersMain:GetAttribute('charge'))>=100)then
repeat task.wait()until _G.AutoSoulMasteryHelp==false or Players2 and Players2:FindFirstChild('entered')and Players2:
FindFirstChild('Ragdolled')and Players2.Ragdolled.Value wait(1)repeat task.wait()Players2:SetPrimaryPartCFrame(game.
Workspace.DEATHBARRIER.CFrame)until not Players2 or Players2:FindFirstChild('Humanoid')and Players2:FindFirstChild(
'Humanoid').Health<=0 repeat task.wait()until not _G.AutoSoulMasteryHelp or game.Players.LocalPlayer.Character and game.
Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')end end end end end task.wait()end end)while _G.AutoSoulMasteryHelp do HelpMasteryJoin({NoCF=true})if
root and Players2 and Players2:FindFirstChild('entered')then root.CFrame=workspace['SafeBox'].S5.CFrame*(not _G.
Players1CloneHelp and CFrame.new(0,20,0)or CFrame.new(0,20,10))end if not _G.Players1CloneHelp then if Players2 and
Players2:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild(
'Ragdolled')and Players1.Ragdolled.Value==false then if tonumber(Players2:GetAttribute('souls'))>=50 and(not _G.
SoulMasteryHelp=='Kill clone for strongest'or tonumber(Players2:GetAttribute('charge'))>=100)then if _G.SoulMasteryHelp
=='Combo clone'then slapglove(root1)wait(0.2)repeat task.wait()until _G.AutoSoulMasteryHelp==false or Players2 and
Players2:FindFirstChild('entered')and Players2:FindFirstChild('Ragdolled')and not Players2.Ragdolled.Value wait(0.1)game
:GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer(false)wait(0.6)elseif _G.SoulMasteryHelp==
'Kill clone for strongest'then if tonumber(Players2:GetAttribute('charge'))>=100 then game:GetService(
'ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer(false)end elseif _G.SoulMasteryHelp==
'Kill clone AOE blast'then if tonumber(Players2:GetAttribute('souls'))>=50 then game:GetService('ReplicatedStorage'):
WaitForChild('GeneralAbility'):FireServer(true)end end else if tonumber(Players2:GetAttribute('souls'))<75 then for ah=1
,9 do slapglove(root1)task.wait(0.75)end wait(0.3)else if tonumber(Players2:GetAttribute('charge'))<100 then game:
GetService('ReplicatedStorage'):WaitForChild('Events'):WaitForChild('soul'):FireServer('charge')end end end end end end
task.wait()end elseif ag==true then Notification("You don't have Soul equipped",_G.TimeNotify)wait(0.05)g[
'Auto Mastery Soul']:SetValue(false)end end})af:AddDropdown('Eggler Mastery',{Text='Eggler Mastery',Values={
'Kill Clone 5 Time','Eggler Clone','Unegg Slap Clone','Deny Slap Eggler'},Default='',Multi=false,Callback=function(ag)_G
.EgglerMasteryHelp=ag end})af:AddToggle('Auto Mastery Eggler',{Text='Auto Mastery Eggler',Default=false,Callback=
function(ag)_G.AutoEgglerMasteryHelp=ag if not _G.AutoEgglerMasteryHelp then CreateFreezeBV({Remove=true,Name=
'HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Eggler'then local function FoundEggVictim(ah)for U,
V in pairs(workspace:GetChildren())do if V.Name:lower()=='egg_victim'and V:GetAttribute('target')==ah.Name then return V
end end return nil end spawn(function()while _G.AutoEgglerMasteryHelp do CreateFreezeBV({Name='HelpMasteryFreezeBv'})if
not _G.Players1CloneHelp then if Players1 and Players2 and Players2:FindFirstChild('entered')and Players1:
FindFirstChild('entered')then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<200 then if _G.
EgglerMasteryHelp=='Eggler Clone'or _G.EgglerMasteryHelp=='Kill Clone 5 Time'then if not FoundEggVictim(Players2)then
game:GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer()end end end end end task.wait()end end)
while _G.AutoEgglerMasteryHelp do HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=CFrame.new(0,5,-7)})if not _G.
Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild(
'entered')and not FoundEggVictim(Players1)and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false
then if _G.EgglerMasteryHelp=='Unegg Slap Clone'then repeat task.wait()game:GetService('ReplicatedStorage'):
WaitForChild('Events'):WaitForChild('EgglerRAbility'):FireServer()until Players2 and Players2:GetAttribute('isEgg')wait(
0.3)repeat task.wait()game:GetService('ReplicatedStorage'):WaitForChild('Events'):WaitForChild('EgglerRAbility'):
FireServer()until Players2 and not Players2:GetAttribute('isEgg')wait(0.3)for ah=1,9 do slapglove(root1)task.wait(0.8)
end elseif _G.EgglerMasteryHelp=='Deny Slap Eggler'then slapglove(root1)wait(0.3)game:GetService('ReplicatedStorage'):
WaitForChild('Events'):WaitForChild('EgglerRAbility'):FireServer()wait(0.3)repeat task.wait()game:GetService(
'ReplicatedStorage'):WaitForChild('Events'):WaitForChild('EgglerRAbility'):FireServer()until Players2 and not Players2:
GetAttribute('isEgg')end wait(0.67)repeat task.wait()until Players1 and Players1:FindFirstChild('entered')and Players1:
FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.5)end end elseif _G.Players1CloneHelp then if
Players2 and Players2:FindFirstChild('entered')then if FoundEggVictim(Players2)then wait(0.5)repeat task.wait()Players2:
SetPrimaryPartCFrame(game.Workspace.DEATHBARRIER.CFrame)until not Players2 or Players2:FindFirstChild('Humanoid')and
Players2:FindFirstChild('Humanoid').Health<=0 repeat task.wait()until game.Players.LocalPlayer.Character and game.
Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')wait(0.65)end end end task.wait()end elseif ag==true then Notification(
"You don't have Eggler equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Eggler']:SetValue(false)end end})af:
AddDropdown('Phantom Mastery',{Text='Phantom Mastery',Values={'Jumpscare Clone','Combo Slap Clone'},Default='',Multi=
false,Callback=function(ag)_G.PhantomMasteryHelp=ag end})af:AddToggle('Auto Mastery Phantom',{Text=
'Auto Mastery Phantom',Default=false,Callback=function(ag)_G.AutoPhantomMasteryHelp=ag if not _G.AutoPhantomMasteryHelp
then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Phantom'then
spawn(function()while _G.AutoPhantomMasteryHelp do CreateFreezeBV({Name='HelpMasteryFreezeBv'})if not _G.
Players1CloneHelp then if Players1 and Players2 and Players2:FindFirstChild('entered')and Players1:FindFirstChild(
'entered')then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<200 then if _G.PhantomMasteryHelp==
'Jumpscare Clone'then local ah=((Players2 and Players2:FindFirstChild(CheckGlove()))or game.Players.LocalPlayer.Backpack
:FindFirstChild(CheckGlove()))or nil if ah then game:GetService('ReplicatedStorage').PhantomDash:InvokeServer(ah)end end
end end end task.wait()end end)while _G.AutoPhantomMasteryHelp do HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=
CFrame.new(0,5,5)})if not _G.Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if Players1
and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then
if _G.PhantomMasteryHelp=='Jumpscare Clone'then if Players2:GetAttribute('phantom')then task.wait(0.2)repeat task.wait()
until not _G.AutoPhantomMasteryHelp or not Players2 or not Players2:GetAttribute('phantom')task.wait(0.3)for ah=1,4 do
slapglove(root1)task.wait(0.9)end wait(0.3)end else slapglove(root1)wait(0.3)local ah=((Players2 and Players2:
FindFirstChild(CheckGlove()))or game.Players.LocalPlayer.Backpack:FindFirstChild(CheckGlove()))or nil if ah then game:
GetService('ReplicatedStorage').PhantomDash:InvokeServer(ah)end wait(0.3)repeat task.wait()until not _G.
AutoPhantomMasteryHelp or not Players2 or not Players2:GetAttribute('phantom')wait(0.2)slapglove(root1)wait(4)end end
end end task.wait()end elseif ag==true then Notification("You don't have Phantom equipped",_G.TimeNotify)wait(0.05)g[
'Auto Mastery Phantom']:SetValue(false)end end})af:AddDropdown('Rage Mastery',{Text='Rage Mastery',Values={'Max Rage',
'50% Rage','Murder Rage'},Default='',Multi=false,Callback=function(ag)_G.RageMasteryHelp=ag end})af:AddToggle(
'Auto Mastery Rage',{Text='Auto Mastery Rage',Default=false,Callback=function(ag)_G.AutoRageMasteryHelp=ag if not _G.
AutoRageMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp and not
PlayersMain and ag==true then if _G.RageMasteryHelp=='Murder Rage'then Notification('You have input main account',_G.
TimeNotify)wait(0.05)g['Auto Mastery Rage']:SetValue(false)end end if _G.Players1CloneHelp or CheckGlove()=='Rage'then
spawn(function()while _G.AutoRageMasteryHelp do CreateFreezeBV({Name='HelpMasteryFreezeBv'})if not _G.Players1CloneHelp
then if Players1 and Players2 and Players2:FindFirstChild('entered')and Players1:FindFirstChild('entered')then if(
Players2 and Players2:GetAttribute('rage_percent')or 0)>55 then if Players2 and not Players2:GetAttribute('frenzy')then
game:GetService('ReplicatedStorage'):WaitForChild('GRRRRR'):FireServer('frenzy')end end end end task.wait()end end)while
_G.AutoRageMasteryHelp do pcall(function()HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=CFrame.new(0,7,0)})if not _G
.Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if(Players2 and Players2:GetAttribute(
'rage_percent')or 0)<(_G.RageMasteryHelp=='Max Rage'and 100 or 55)then if Players1 and Players1:FindFirstChild('entered'
)and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then for ah=1,5 do slapglove(root1)task.
wait(0.9)end task.wait(0.3)end end end else if _G.RageMasteryHelp=='Murder Rage'then repeat task.wait()until PlayersMain
and PlayersMain:GetAttribute('frenzy')and Players2 and Players2:FindFirstChild('Ragdolled')and Players2.Ragdolled.Value
==false wait(0.5)repeat task.wait()Players2:SetPrimaryPartCFrame(game.Workspace.DEATHBARRIER.CFrame)until not Players2
or Players2:FindFirstChild('Humanoid')and Players2:FindFirstChild('Humanoid').Health<=0 repeat task.wait()until game.
Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')task.wait(0.6)end end end)task.wait()end elseif ag==true then
Notification("You don't have Rage equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Rage']:SetValue(false)end end})af:
AddDropdown('Plank Mastery',{Text='Plank Mastery',Values={'Ambush Clone','Plank Clone','Plank Kill'},Default='',Multi=
false,Callback=function(ag)_G.PlankMasteryHelp=ag end})af:AddToggle('Auto Mastery Plank',{Text='Auto Mastery Plank',
Default=false,Callback=function(ag)_G.AutoPlankMasteryHelp=ag if not _G.AutoPlankMasteryHelp then CreateFreezeBV({Remove
=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Plank'then spawn(function()while _G.
AutoPlankMasteryHelp do if _G.Players1CloneHelp then CreateFreezeBV({Name='HelpMasteryFreezeBv'})if Players1 and
Players2 and Players2:FindFirstChild('entered')and Players1:FindFirstChild('entered')then if _G.PlankMasteryHelp==
'Plank Kill'then repeat task.wait()until _G.AutoPlankMasteryHelp==false or Players2 and Players2:FindFirstChild(
'entered')and Players2:FindFirstChild('Ragdolled')and Players2.Ragdolled.Value wait(1)repeat task.wait()Players2:
SetPrimaryPartCFrame(game.Workspace.DEATHBARRIER.CFrame)until not Players2 or Players2:FindFirstChild('Humanoid')and
Players2:FindFirstChild('Humanoid').Health<=0 repeat task.wait()until not _G.AutoPlankMasteryHelp or game.Players.
LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer
.Character:FindFirstChild('HumanoidRootPart')wait(0.5)end end end task.wait()end end)while _G.AutoPlankMasteryHelp do
pcall(function()HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=(_G.PlankMasteryHelp:find('Plank')and CFrame.new(0,5,5
)or CFrame.new(0,-20,0))})if not _G.Players1CloneHelp then if _G.PlankMasteryHelp=='Ambush Clone'then if Players2 and
Players2:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild(
'Ragdolled')and Players1.Ragdolled.Value==false then wait(0.32)if not workspace:FindFirstChild(game.Players.LocalPlayer.
Name.."'s Plank")or workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Plank"):GetAttribute('collect')then game
:GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer(CFrame.new(0,0,0),Vector3.new(math.huge,0,0))
wait(1.7)end if workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Plank")and not workspace:FindFirstChild(game
.Players.LocalPlayer.Name.."'s Plank"):GetAttribute('collect')then CreateFreezeBV({Remove=true,Name=
'HelpMasteryFreezeBv'})Players2:SetPrimaryPartCFrame(workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Plank")
.CFrame*CFrame.new(0,0,3)*CFrame.Angles(math.rad(60),math.rad(0),math.rad(0)))task.wait(1)Players2:SetPrimaryPartCFrame(
workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Plank").CFrame*CFrame.new(0,7,0)*CFrame.Angles(math.rad(60),
math.rad(0),math.rad(0)))end wait(0.8)CreateFreezeBV({Name='HelpMasteryFreezeBv'})Players2:SetPrimaryPartCFrame(root1.
CFrame*CFrame.new(0,7,0))repeat task.wait()until _G.AutoPlankMasteryHelp==false or(root and root1 and(root.Position-
root1.Position).Magnitude or 0)<8 wait(0.3)slapglove(root1)wait(0.2)root.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0
,5,0)repeat task.wait()until _G.AutoPlankMasteryHelp==false or Players1 and Players1:FindFirstChild('entered')and
Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.4)end end elseif _G.PlankMasteryHelp
:find('Plank')then if Players1 and Players2 and Players2:FindFirstChild('entered')and Players1:FindFirstChild('entered')
then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<30 then game:GetService('ReplicatedStorage'):
WaitForChild('GeneralAbility'):FireServer(CFrame.new(0,0,0),Vector3.new(math.huge,0,0))end end end end end)task.wait()
end elseif ag==true then Notification("You don't have Plank equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Plank']:
SetValue(false)end end})af:AddDropdown('Obby Mastery',{Text='Obby Mastery',Values={'Kill Clone','Slap Clone'},Default=''
,Multi=false,Callback=function(ag)_G.ObbyMasteryHelp=ag end})af:AddToggle('Auto Mastery Obby',{Text='Auto Mastery Obby',
Default=false,Callback=function(ag)_G.AutoObbyMasteryHelp=ag if not _G.AutoObbyMasteryHelp then CreateFreezeBV({Remove=
true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Obby'then if _G.Players1CloneHelp and not
PlayersMain and ag==true then Notification('You have input main account',_G.TimeNotify)wait(0.05)g['Auto Mastery Obby']:
SetValue(false)return end if not _G.Players1CloneHelp and _G.AutoObbyMasteryHelp and _G.ObbyMasteryHelp=='Kill Clone'
then repeat task.wait()if Players2:FindFirstChild('HumanoidRootPart')and Players2:FindFirstChild('Humanoid')and Players2
:FindFirstChild('entered')==nil then equipglove('Fort')repeat task.wait()until not _G.AutoObbyMasteryHelp or CheckGlove(
)=='Fort'wait(0.3)repeat task.wait()if Players2 and Players2:FindFirstChild('entered')==nil then root.CFrame=game.
Workspace:FindFirstChild('Lobby'):FindFirstChild('Teleport1').CFrame end until Players2 and Players2:FindFirstChild(
'entered')task.wait(0.5)root.CFrame=workspace.BountyHunterRoom.BountyHunterBooth._bountyRoomWarpPart.CFrame task.wait(
0.5)hum:MoveTo(root.Position+Vector3.new(0,0,20))task.wait(4)hum:MoveTo(root.Position)CreateFreezeBV({Name=
'HelpMasteryFreezeBv'})root.CFrame=CFrame.new(209,-28006,1)wait(0.7)for ah=1,2 do game:GetService('ReplicatedStorage').
Fortlol:FireServer()wait(3.6)end game:GetService('Players').LocalPlayer.Reset:FireServer()wait(0.3)repeat task.wait()
until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')wait(0.5)equipglove('Obby')repeat task.wait()until not
_G.AutoObbyMasteryHelp or CheckGlove()=='Obby'wait(0.4)repeat task.wait()if Players2 and Players2:FindFirstChild(
'entered')==nil then root.CFrame=game.Workspace:FindFirstChild('Lobby'):FindFirstChild('Teleport1').CFrame end until
game.Players.LocalPlayer.Character:FindFirstChild('entered')wait(0.4)root.CFrame=workspace.BountyHunterRoom.
BountyHunterBooth._bountyRoomWarpPart.CFrame task.wait(0.5)hum:MoveTo(root.Position+Vector3.new(0,0,20))task.wait(4)hum:
MoveTo(root.Position)CreateFreezeBV({Name='HelpMasteryFreezeBv'})root.CFrame=CFrame.new(209,-28006,1)*CFrame.Angles(math
.rad(0),-55,0)wait(0.9)for ah,U in pairs(workspace:GetChildren())do if U.Name=='Part'and U:FindFirstChild('brownsmoke')
and U:FindFirstChild('Sound')and(root.Position-U.Position).Magnitude<=50 then FortWall=U break end end if FortWall then
local ah=FortWall.Size local U=FortWall.Position.Y+(ah.Y/2)+0.4 game:GetService('ReplicatedStorage'):WaitForChild(
'GeneralAbility'):FireServer(CFrame.new(FortWall.Position.X,U,FortWall.Position.Z)*CFrame.Angles(math.rad(0),55,0),1)end
task.wait(4)end until not _G.AutoObbyMasteryHelp or workspace:FindFirstChild('ObbyItem'..game.Players.LocalPlayer.Name..
'LavaBlock')end wait(0.3)spawn(function()while _G.AutoObbyMasteryHelp do if _G.Players1CloneHelp then if PlayersMain and
Players2 and Players2:FindFirstChild('entered')and PlayersMain:FindFirstChild('entered')then CreateFreezeBV({Name=
'HelpMasteryFreezeBv'})if _G.ObbyMasteryHelp=='Kill Clone'then repeat task.wait()if workspace:FindFirstChild('ObbyItem'
.._G.HelpPlayer2.Name..'LavaBlock')then Players2:SetPrimaryPartCFrame(workspace:FindFirstChild('ObbyItem'.._G.
HelpPlayer2.Name..'LavaBlock').CFrame)end until not Players2 or Players2:FindFirstChild('Humanoid')and Players2:
FindFirstChild('Humanoid').Health<=0 repeat task.wait()until not _G.AutoObbyMasteryHelp or game.Players.LocalPlayer.
Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')wait(0.5)end end end task.wait()end end)while _G.AutoObbyMasteryHelp do pcall(function
()CreateFreezeBV({Name='HelpMasteryFreezeBv'})HelpMasteryJoin({NoCF=true})if Players2 and Players2:FindFirstChild(
'entered')then if _G.ObbyMasteryHelp=='Kill Clone'then root.CFrame=(not _G.Players1CloneHelp and CFrame.new(360,-28006,1
))else root.CFrame=workspace['SafeBox'].S5.CFrame*(_G.Players1CloneHelp and CFrame.new(0,5,0)or CFrame.new(0,5,8))end
end if not _G.Players1CloneHelp then if _G.ObbyMasteryHelp=='Slap Clone'then if Players2 and Players2:FindFirstChild(
'entered')then if Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.
Ragdolled.Value==false then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<50 then for ah=1,9 do
slapglove(root1)task.wait(0.9)end wait(0.3)repeat task.wait()until Players1 and Players1:FindFirstChild('entered')and
Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.6)end end end end end end)task.wait(
)end elseif ag==true then Notification("You don't have Obby equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Obby']:
SetValue(false)end end})af:AddDropdown('Tycoon Mastery',{Text='Tycoon Mastery',Values={'Defense Tycoon',
'Kill Clone (Tycoon God)'},Default='',Multi=false,Callback=function(ag)_G.TycoonMasteryHelp=ag end})function FoundTycoon
(ag)local ah for U,V in pairs(game.Workspace:GetChildren())do if V.Name:match('\u{c5}Tycoon')and V:FindFirstChild('End')
and(ag.Position-V.End.Position).Magnitude<=100 then ah=V end end return ah end af:AddToggle('Auto Mastery Tycoon',{Text=
'Auto Mastery Tycoon',Default=false,Callback=function(ag)_G.AutoTycoonMasteryHelp=ag if not _G.AutoTycoonMasteryHelp
then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Tycoon'then
repeat task.wait()CreateFreezeBV({Name='HelpMasteryFreezeBv'})if Players2 and Players2:FindFirstChild('entered')==nil
then root.CFrame=game.Workspace:FindFirstChild('Lobby'):FindFirstChild('Teleport1').CFrame end if Players2:
FindFirstChild('entered')then root.CFrame=CFrame.new(17894,15,-3579)end if not _G.Players1CloneHelp and not game.
Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name)and Players2:FindFirstChild('entered')then game:
GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer(CFrame.new(17893.587890625,-26.257728576660156
,-3571.69775390625,0.9998365640640259,-6.031721255794764E-8,0.01807994209229946,6.185813816728114e-8,1,-
8.466933820727718E-8,-1.8079942092299461E-2,8.577389110087097e-8,0.9998365640640259))task.wait(6.5)end until not _G.
AutoTycoonMasteryHelp or game.Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name)wait(0.3)if not _G.
Players1CloneHelp and _G.AutoTycoonMasteryHelp and _G.TycoonMasteryHelp=='Kill Clone (Tycoon God)'then if _G.
TycoonMasteryHelp=='Kill Clone (Tycoon God)'then repeat task.wait()if Players2 and Players2:FindFirstChild('entered')==
nil then root.CFrame=game.Workspace:FindFirstChild('Lobby'):FindFirstChild('Teleport1').CFrame end if game.Workspace:
FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name)then GuiTrackUpdate(true,{Text='Tycoon Your Point\n'..game.
Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name):GetAttribute('LastCount')..' / 5000',Size=game.
Workspace:FindFirstChild('\u{c5}Tycoon'..game.Players.LocalPlayer.Name):GetAttribute('LastCount')/5000})end
CreateFreezeBV({Name='HelpMasteryFreezeBv'})root.CFrame=CFrame.new(350,-28006,1)for ah,U in pairs(workspace:GetChildren(
))do local V=U:FindFirstChild('Click')if V then if U.Name:match(game.Players.LocalPlayer.Name)then local W=V:
FindFirstChildOfClass('ClickDetector')if W then fireclickdetector(W,0)fireclickdetector(W,1)end end end end until not _G
.AutoTycoonMasteryHelp or _G.TycoonMasteryHelp~='Kill Clone (Tycoon God)'or(game.Workspace:FindFirstChild('\u{c5}Tycoon'
..game.Players.LocalPlayer.Name)and game.Workspace['\u{c5}Tycoon'..game.Players.LocalPlayer.Name]:GetAttribute(
'LastCount')>=5000)GuiTrackUpdate(false)end end wait(0.3)spawn(function()while _G.AutoTycoonMasteryHelp do if _G.
Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then CreateFreezeBV({Name='HelpMasteryFreezeBv'
})if _G.TycoonMasteryHelp=='Kill Clone (Tycoon God)'then repeat task.wait()until Players2 and Players2:FindFirstChild(
'Ragdolled')and Players2.Ragdolled.Value wait(0.4)repeat task.wait()Players2:SetPrimaryPartCFrame(game.Workspace.
DEATHBARRIER.CFrame)until not Players2 or Players2:FindFirstChild('Humanoid')and Players2:FindFirstChild('Humanoid').
Health<=0 wait(0.1)repeat task.wait()until not _G.AutoTycoonMasteryHelp or game.Players.LocalPlayer.Character and game.
Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')wait(0.5)end end end task.wait()end end)while _G.AutoTycoonMasteryHelp do local ah=FoundTycoon(root)
HelpMasteryJoin({NoCF=true})if Players2 and Players2:FindFirstChild('entered')then if _G.TycoonMasteryHelp==
'Kill Clone (Tycoon God)'then root.CFrame=(not _G.Players1CloneHelp and CFrame.new(360,-28006,1)or CFrame.new(355,-28006
,1))else if ah and ah:FindFirstChild('End')then root.CFrame=ah:FindFirstChild('End').CFrame*(_G.Players1CloneHelp and
CFrame.new(0,20,0)or CFrame.new(0,25,0))else root.CFrame=CFrame.new(17894,15,-3579)end end end if not _G.
Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild(
'entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then if(root and root1 and(root.
Position-root1.Position).Magnitude or 0)<100 then if _G.TycoonMasteryHelp=='Defense Tycoon'then for U=1,9 do slapglove(
root1)task.wait(0.9)end elseif _G.TycoonMasteryHelp=='Kill Clone (Tycoon God)'then if game.Workspace:FindFirstChild(
'\u{c5}Tycoon'..game.Players.LocalPlayer.Name)and game.Workspace['\u{c5}Tycoon'..game.Players.LocalPlayer.Name]:
GetAttribute('LastCount')>=5000 then wait(0.5)slapglove(root1)end end wait(0.3)repeat task.wait()until Players1 and
Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(
0.6)end end end end task.wait()end elseif ag==true then Notification("You don't have Tycoon equipped",_G.TimeNotify)
wait(0.05)g['Auto Mastery Tycoon']:SetValue(false)end end})af:AddDropdown('Hive Mastery',{Text='Hive Mastery',Values={
'Honey Clone','Swarm Clone','Kill Clone Honey'},Default='',Multi=false,Callback=function(ag)_G.HiveMasteryHelp=ag end})
af:AddToggle('Auto Mastery Hive',{Text='Auto Mastery Hive',Default=false,Callback=function(ag)_G.AutoHiveMasteryHelp=ag
if not _G.AutoHiveMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp
or CheckGlove()=='Hive'then spawn(function()while _G.AutoHiveMasteryHelp do if _G.Players1CloneHelp then if Players2 and
Players2:FindFirstChild('entered')then CreateFreezeBV({Name='HelpMasteryFreezeBv'})if _G.HiveMasteryHelp==
'Kill Clone Honey'then repeat task.wait()until Players2 and Players2:GetAttribute('honey_mark')wait(0.4)repeat task.
wait()Players2:SetPrimaryPartCFrame(game.Workspace.DEATHBARRIER.CFrame)until not Players2 or Players2:FindFirstChild(
'Humanoid')and Players2:FindFirstChild('Humanoid').Health<=0 wait(0.1)repeat task.wait()until not _G.AutoHiveMasteryHelp
or game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')wait(0.8)end end end task.wait()end end)while _G.
AutoHiveMasteryHelp do pcall(function()HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=CFrame.new(0,7,0)})if not _G.
Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild(
'entered')and Players1:FindFirstChild('Humanoid')and Players1:FindFirstChild('Ragdolled')and Players1.Humanoid.Health>0
and Players1.Ragdolled.Value==false then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<50 then if
_G.HiveMasteryHelp=='Honey Clone'then for ah=1,9 do slapglove(root1)task.wait(0.9)end elseif _G.HiveMasteryHelp==
'Swarm Clone'then repeat task.wait()game:GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer()
until Players2 and Players2:GetAttribute('hiveability')wait(0.2)slapglove(root1)wait(0.3)repeat task.wait()until
Players2 and not Players2:GetAttribute('glovebroken')else slapglove(root1)task.wait(0.9)end repeat task.wait()until
Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==
false task.wait(0.6)end end end end end)task.wait()end elseif ag==true then Notification("You don't have Hive equipped",
_G.TimeNotify)wait(0.05)g['Auto Mastery Hive']:SetValue(false)end end})af:AddDropdown('Dice Mastery',{Text=
'Dice Mastery',Values={'Slap Clone','Kill Clone'},Default='',Multi=false,Callback=function(ag)_G.DiceMasteryHelp=ag end}
)function foundDice(ag)local ah,U=0 for V,W in pairs(workspace:GetChildren())do if W.Name:lower():find('DicePart')and W:
FindFirstChild('BillboardGui')and W.BillboardGui:FindFirstChild('ImageLabel')and W.BillboardGui.ImageLabel:
FindFirstChild('TextLabel')then if W.BillboardGui.ImageLabel.BackgroundTransparency<=0.5 then local X=(ag.Position-W.
Position).Magnitude if X and X>=60 then ah,X=math.max(ah,tonumber(W.BillboardGui.ImageLabel.TextLabel)),W end end end
end return ah,U end af:AddToggle('Auto Mastery Dice',{Text='Auto Mastery Dice',Default=false,Callback=function(ag)_G.
AutoDiceMasteryHelp=ag if not _G.AutoDiceMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if
_G.Players1CloneHelp or CheckGlove()=='Dice'then spawn(function()while _G.AutoDiceMasteryHelp do pcall(function()if _G.
Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then CreateFreezeBV({Name='HelpMasteryFreezeBv'
})if _G.DiceMasteryHelp=='Kill Clone'then local ah,U=foundDice(root)if ah and tonumber(ah)>=60 then repeat task.wait()
until Players2 and Players2:FindFirstChild('Ragdolled')and Players2.Ragdolled.Value wait(0.4)repeat task.wait()Players2:
SetPrimaryPartCFrame(game.Workspace.DEATHBARRIER.CFrame)until not Players2 or Players2:FindFirstChild('Humanoid')and
Players2:FindFirstChild('Humanoid').Health<=0 wait(0.1)repeat task.wait()until not _G.DiceMasteryHelp or game.Players.
LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer
.Character:FindFirstChild('HumanoidRootPart')wait(0.5)if U then U:Destroy()end end end end end end)task.wait()end end)
while _G.AutoDiceMasteryHelp do pcall(function()HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=CFrame.new(0,7,0)})if
not _G.Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if Players1 and Players1:
FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then if(root and
root1 and(root.Position-root1.Position).Magnitude or 0)<50 then if _G.DiceMasteryHelp=='Slap Clone'then for ah=1,10 do
slapglove(root1)task.wait(0.78)end else slapglove(root1)task.wait(0.4)end wait(0.4)repeat task.wait()until Players1 and
Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(
0.4)end end end end end)task.wait()end elseif ag==true then Notification("You don't have Dice equipped",_G.TimeNotify)
wait(0.05)g['Auto Mastery Dice']:SetValue(false)end end})af:AddDropdown('Phase Mastery',{Text='Phase Mastery',Values={
'Slap + Ability','Ability + Slap (2 Sec)'},Default='',Multi=false,Callback=function(ag)_G.PhaseMasteryHelp=ag end})af:
AddToggle('Auto Mastery Phase',{Text='Auto Mastery Phase',Default=false,Callback=function(ag)_G.AutoPhaseMasteryHelp=ag
if not _G.AutoPhaseMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp
or CheckGlove()=='Phase'then while _G.AutoPhaseMasteryHelp do HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=CFrame.
new(0,7,0)})if not _G.Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if Players1 and
Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then if(
root and root1 and(root.Position-root1.Position).Magnitude or 0)<50 then if _G.PhaseMasteryHelp=='Slap + Ability'then
slapglove(root1)game:GetService('ReplicatedStorage').PhaseA:FireServer()wait(0.2)repeat task.wait()until root and root:
FindFirstChild('BlackheartREAL')==nil wait(0.15)elseif _G.PhaseMasteryHelp=='Ability + Slap (2 Sec)'then game:
GetService('ReplicatedStorage').PhaseA:FireServer()task.wait(0.2)repeat task.wait()until root and root:FindFirstChild(
'BlackheartREAL')==nil task.wait(0.25)for ah=1,5 do slapglove(root1)task.wait(0.73)end end wait(0.56)repeat task.wait()
until Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.
Value==false task.wait(0.5)end end end end task.wait()end elseif ag==true then Notification(
"You don't have Phase equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Phase']:SetValue(false)end end})af:AddDropdown(
'Spring Mastery',{Text='Spring Mastery',Values={'Jump Over Clone','Evade Clone','Jump Land 2 Sec Clone'},Default='',
Multi=false,Callback=function(ag)_G.SpringMasteryHelp=ag end})af:AddToggle('Auto Mastery Spring',{Text=
'Auto Mastery Spring',Default=false,Callback=function(ag)_G.AutoSpringMasteryHelp=ag if not _G.AutoSpringMasteryHelp
then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Spring'then
while _G.AutoSpringMasteryHelp do HelpMasteryJoin({CloneCF=CFrame.new(0,6,0),MainCF=CFrame.new(0,6,3.8)})if not _G.
Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild(
'entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then if(root and root1 and(root.
Position-root1.Position).Magnitude or 0)<100 then if _G.SpringMasteryHelp=='Jump Over Clone'or _G.SpringMasteryHelp==
'Jump Land 2 Sec Clone'then repeat task.wait()game:GetService('ReplicatedStorage'):WaitForChild('SpringJump'):
FireServer()until char and char:FindFirstChild('JumpSoundDB')if _G.SpringMasteryHelp=='Jump Land 2 Sec Clone'then task.
wait(1.4)end wait(0.17)slapglove(root1)wait(0.3)repeat task.wait()until Players1 and Players1:FindFirstChild('entered')
and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.65)elseif _G.SpringMasteryHelp==
'Evade Clone'then slapglove(root1)repeat task.wait()until Players1 and Players1:FindFirstChild('entered')and Players1:
FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false wait(0.1)repeat task.wait()game:GetService(
'ReplicatedStorage'):WaitForChild('SpringJump'):FireServer()until char and char:FindFirstChild('JumpSoundDB')task.wait(
1.5)end end end end end task.wait()end elseif ag==true then Notification("You don't have Spring equipped",_G.TimeNotify)
wait(0.05)g['Auto Mastery Spring']:SetValue(false)end end})af:AddDropdown('Gummy Mastery',{Text='Gummy Mastery',Values={
'Slap Clone','Kill Clone'},Default='',Multi=false,Callback=function(ag)_G.GummyMasteryHelp=ag end})af:AddToggle(
'Auto Mastery Gummy',{Text='Auto Mastery Gummy',Default=false,Callback=function(ag)_G.AutoGummyMasteryHelp=ag if not _G.
AutoGummyMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or
CheckGlove()=='Gummy'then spawn(function()while _G.AutoGummyMasteryHelp do if _G.Players1CloneHelp then if Players2 and
Players2:FindFirstChild('entered')then CreateFreezeBV({Name='HelpMasteryFreezeBv'})if _G.GummyMasteryHelp=='Kill Clone'
then repeat task.wait()until Players2 and Players2:FindFirstChild('Ragdolled')and Players2.Ragdolled.Value wait(0.4)
repeat task.wait()Players2:SetPrimaryPartCFrame(game.Workspace.DEATHBARRIER.CFrame)until not Players2 or Players2:
FindFirstChild('Humanoid')and Players2:FindFirstChild('Humanoid').Health<=0 wait(0.1)repeat task.wait()until not _G.
AutoGummyMasteryHelp or game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild(
'entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')wait(0.5)end end end task.wait(
)end end)while _G.AutoGummyMasteryHelp do pcall(function()HelpMasteryJoin({CloneCF=CFrame.new(0,6,0),MainCF=CFrame.new(0
,6,3.8)})if not _G.Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if Players1 and
Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then if(
root and root1 and(root.Position-root1.Position).Magnitude or 0)<100 then if _G.GummyMasteryHelp=='Slap Clone'then
slapglove(root1)end task.wait(0.2)repeat task.wait()until Players1 and Players1:FindFirstChild('entered')and Players1:
FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.8)end end end end end)task.wait()end elseif
ag==true then Notification("You don't have Gummy equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Gummy']:SetValue(
false)end end})af:AddDropdown('Mace Mastery',{Text='Mace Mastery',Values={'Kill Clone','Slap Clone'},Default='',Multi=
false,Callback=function(ag)_G.MaceMasteryHelp=ag end})af:AddToggle('Auto Mastery Mace',{Text='Auto Mastery Mace',Default
=false,Callback=function(ag)_G.AutoMaceMasteryHelp=ag if not _G.AutoMaceMasteryHelp then CreateFreezeBV({Remove=true,
Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Mace'then spawn(function()while _G.
AutoMaceMasteryHelp do if _G.Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then
CreateFreezeBV({Name='HelpMasteryFreezeBv'})if _G.MaceMasteryHelp=='Kill Clone'then repeat task.wait()until Players2 and
Players2:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value wait(0.4)repeat task.wait()Players2:
SetPrimaryPartCFrame(game.Workspace.DEATHBARRIER.CFrame)until not Players2 or Players2:FindFirstChild('Humanoid')and
Players2:FindFirstChild('Humanoid').Health<=0 wait(0.1)repeat task.wait()until not _G.AutoMaceMasteryHelp or game.
Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')wait(0.8)end end end task.wait()end end)while _G.
AutoMaceMasteryHelp do if not _G.Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if
Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==
false then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<200 then for ah=1,10 do slapglove(root1)
task.wait(0.89)end wait(0.56)repeat task.wait()until Players1 and Players1:FindFirstChild('entered')and Players1:
FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.5)end end end end task.wait()end elseif ag==
true then Notification("You don't have Mace equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Mace']:SetValue(false)end
end})af:AddDropdown('Defense Mastery',{Text='Defense Mastery',Values={'Slap Clone 100 sec','Kill Clone Box',
'Protect Defence','Slap clone Into Box'},Default='',Multi=false,Callback=function(ag)_G.DefenseMasteryHelp=ag end})
function FoundDefenseBox(ag)local ah for U,V in pairs(game.Workspace:GetChildren())do if string.find(V.Name,
'\u{c5}Barrier')and(ag.Position-V.Position).Magnitude<=100 then ah=V end end return ah end af:AddToggle(
'Auto Mastery Defense',{Text='Auto Mastery Defense',Default=false,Callback=function(ag)_G.AutoDefenseMasteryHelp=ag if
not _G.AutoDefenseMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp
or CheckGlove()=='Defense'then spawn(function()while _G.AutoDefenseMasteryHelp and task.wait()do pcall(function()for ah,
U in pairs(game.Workspace:GetChildren())do if string.find(U.Name,'\u{c5}Barrier')then U.CanCollide=false end end if not
_G.Players1CloneHelp then if root and Players2 and Players2:FindFirstChild('entered')then local ah=FoundDefenseBox(root)
if not ah then game:GetService('ReplicatedStorage').Barrier:FireServer(1)task.wait(0.8)end end end end)end end)spawn(
function()while _G.AutoDefenseMasteryHelp do if _G.Players1CloneHelp then if root and Players2 and Players2:
FindFirstChild('entered')then CreateFreezeBV({Name='HelpMasteryFreezeBv'})local ah=FoundDefenseBox(root)if _G.
DefenseMasteryHelp=='Kill Clone Box'then if ah and InsideBox(root,ah)then if Players1:FindFirstChild('Ragdolled')and
Players1.Ragdolled.Value==true then wait(0.1)repeat task.wait()Players2:SetPrimaryPartCFrame(game.Workspace.DEATHBARRIER
.CFrame)until not Players2 or Players2:FindFirstChild('Humanoid')and Players2:FindFirstChild('Humanoid').Health<=0
repeat task.wait()until not _G.AutoHiveMasteryHelp or game.Players.LocalPlayer.Character and game.Players.LocalPlayer.
Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')wait(
0.8)end end end end end task.wait()end end)while _G.AutoDefenseMasteryHelp do CreateFreezeBV({Name='HelpMasteryFreezeBv'
})HelpMasteryJoin({NoCF=true})local ah=FoundDefenseBox(root)if Players2 and Players2:FindFirstChild('entered')then if _G
.Players1CloneHelp and ah then if _G.DefenseMasteryHelp~='Slap clone Into Box'or(Players2 and Players2:FindFirstChild(
'entered')and Players2:FindFirstChild('Ragdolled')and Players2.Ragdolled.Value==true)then Players2:SetPrimaryPartCFrame(
ah.CFrame)elseif Players2 and Players2:FindFirstChild('entered')and Players2:FindFirstChild('Ragdolled')and Players2.
Ragdolled.Value==false then Players2:SetPrimaryPartCFrame(workspace['SafeBox'].S5.CFrame*CFrame.new(0,20,25))end else
Players2:SetPrimaryPartCFrame(workspace['SafeBox'].S5.CFrame*(_G.DefenseMasteryHelp=='Slap clone Into Box'and ah and
CFrame.new(0,20,22)or CFrame.new(0,20,0)))end end if not _G.Players1CloneHelp then if Players2 and Players2:
FindFirstChild('entered')then if Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')
and Players1.Ragdolled.Value==false then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<100 then if
_G.DefenseMasteryHelp=='Slap Clone 100 sec'then for U=1,20 do if _G.AutoDefenseMasteryHelp then slapglove(root1)task.
wait(0.78)end end elseif _G.DefenseMasteryHelp=='Slap clone Into Box'then slapglove(root1)task.wait(0.9)end if ah and
InsideBox(root1,ah)then if _G.DefenseMasteryHelp=='Kill Clone Box'then slapglove(root1)task.wait(0.9)elseif _G.
DefenseMasteryHelp=='Protect Defence'then for U=1,9 do slapglove(root1)task.wait(0.9)end end end end end end end task.
wait()end elseif ag==true then Notification("You don't have Spring equipped",_G.TimeNotify)wait(0.05)g[
'Auto Mastery Spring']:SetValue(false)end end})af:AddDropdown('Moai Mastery',{Text='Moai Mastery',Values={
'Ragdoll Clone','Kill Clone','Slap Clone'},Default='',Multi=false,Callback=function(ag)_G.MoaiMasteryHelp=ag end})af:
AddToggle('Auto Mastery Moai',{Text='Auto Mastery Moai',Default=false,Callback=function(ag)_G.AutoMoaiMasteryHelp=ag if
not _G.AutoMoaiMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or
CheckGlove()=='\u{1f5ff}'then if _G.Players1CloneHelp and not PlayersMain and ag==true then Notification(
'You have input main account',_G.TimeNotify)wait(0.05)g['Auto Mastery Moai']:SetValue(false)return end if not _G.
Players1CloneHelp and _G.AutoMoaiMasteryHelp then repeat task.wait()if Players2:FindFirstChild('HumanoidRootPart')and
Players2:FindFirstChild('entered')==nil then CreateFreezeBV({Name='HelpMasteryFreezeBv'})equipglove('Fort')repeat task.
wait()until not _G.AutoMoaiMasteryHelp or CheckGlove()=='Fort'wait(0.3)repeat task.wait()if Players2 and Players2:
FindFirstChild('entered')==nil then root.CFrame=game.Workspace:FindFirstChild('Lobby'):FindFirstChild('Teleport1').
CFrame end until Players2 and Players2:FindFirstChild('entered')task.wait(0.5)root.CFrame=workspace.BountyHunterRoom.
BountyHunterBooth._bountyRoomWarpPart.CFrame task.wait(0.5)hum:MoveTo(root.Position+Vector3.new(0,0,20))task.wait(4)hum:
MoveTo(root.Position)CreateFreezeBV({Name='HelpMasteryFreezeBv'})root.CFrame=CFrame.new(209,-28006,1)wait(0.5)for ah=1,2
do game:GetService('ReplicatedStorage').Fortlol:FireServer()wait(3.6)end game:GetService('Players').LocalPlayer.Reset:
FireServer()wait(0.3)repeat task.wait()until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:
FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')wait(0.5)
equipglove('\u{1f5ff}')repeat task.wait()until not _G.AutoMoaiMasteryHelp or CheckGlove()=='\u{1f5ff}'wait(0.4)repeat
task.wait()if Players2 and Players2:FindFirstChild('entered')==nil then root.CFrame=game.Workspace:FindFirstChild(
'Lobby'):FindFirstChild('Teleport1').CFrame end until game.Players.LocalPlayer.Character:FindFirstChild('entered')
CreateFreezeBV({Name='HelpMasteryFreezeBv'})task.wait(0.5)root.CFrame=workspace.BountyHunterRoom.BountyHunterBooth.
_bountyRoomWarpPart.CFrame task.wait(0.5)hum:MoveTo(root.Position+Vector3.new(0,0,20))task.wait(4)hum:MoveTo(root.
Position)CreateFreezeBV({Name='HelpMasteryFreezeBv'})root.CFrame=CFrame.new(209,-28006,1)wait(0.56)for ah,U in pairs(
workspace:GetChildren())do if U.Name=='Part'and U:FindFirstChild('brownsmoke')and U:FindFirstChild('Sound')and(root.
Position-U.Position).Magnitude<=50 then FortWall=U break end end if FortWall then local ah=FortWall.Size local U=
FortWall.Position.Y+(ah.Y/2)+2.6 game:GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):FireServer(CFrame.
new(FortWall.Position.X,U,FortWall.Position.Z))end task.wait(4)end until not _G.AutoMoaiMasteryHelp or workspace:
FindFirstChild('\u{c5}MoyaiStatue'..game:GetService('Players').LocalPlayer.Name)end wait(0.3)spawn(function()while _G.
AutoMoaiMasteryHelp do if _G.Players1CloneHelp then if PlayersMain and Players2 and Players2:FindFirstChild('entered')
and PlayersMain:FindFirstChild('entered')then CreateFreezeBV({Name='HelpMasteryFreezeBv'})if _G.MoaiMasteryHelp==
'Ragdoll Clone'or _G.MoaiMasteryHelp=='Kill Clone'then repeat task.wait()if workspace:FindFirstChild('\u{c5}MoyaiStatue'
.._G.HelpPlayer2.Name)and workspace['\u{c5}MoyaiStatue'.._G.HelpPlayer2.Name]:FindFirstChild('Hitbox')then Players2:
SetPrimaryPartCFrame(workspace:FindFirstChild('\u{c5}MoyaiStatue'.._G.HelpPlayer2.Name).Hitbox.CFrame*CFrame.new(0,7,0))
end until not Players2 or Players2:FindFirstChild('Ragdolled')and Players2.Ragdolled.Value if _G.MoaiMasteryHelp==
'Ragdoll Clone'then game:GetService('Players').LocalPlayer.Reset:FireServer()elseif _G.MoaiMasteryHelp=='Kill Clone'then
repeat task.wait()Players2:SetPrimaryPartCFrame(game.Workspace.DEATHBARRIER.CFrame)until not Players2 or Players2:
FindFirstChild('Humanoid')and Players2:FindFirstChild('Humanoid').Health<=0 end wait(0.4)repeat task.wait()until not _G.
AutoMoaiMasteryHelp or game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild(
'entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')end end end task.wait()end end)
while _G.AutoMoaiMasteryHelp do CreateFreezeBV({Name='HelpMasteryFreezeBv'})HelpMasteryJoin({NoCF=true})if Players2 and
Players2:FindFirstChild('entered')then if not _G.Players1CloneHelp then root.CFrame=CFrame.new(209,-28006,1)end end if
not _G.Players1CloneHelp then if _G.MoaiMasteryHelp=='Slap Clone'or _G.MoaiMasteryHelp=='Kill Clone'then if Players2 and
Players2:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild(
'Ragdolled')and Players1.Ragdolled.Value then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<50
then slapglove(root1)task.wait(0.9)repeat task.wait()until Players1 and Players1:FindFirstChild('entered')and Players1:
FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.6)end end end end end task.wait()end elseif
ag==true then Notification("You don't have Moai equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Moai']:SetValue(false)
end end})af:AddDivider()af:AddToggle('Auto Mastery Wormhole',{Text='Auto Mastery Wormhole',Default=false,Callback=
function(ag)_G.AutoWormholeMasteryHelp=ag if not _G.AutoWormholeMasteryHelp then CreateFreezeBV({Remove=true,Name=
'HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Wormhole'then spawn(function()while _G.
AutoWormholeMasteryHelp do if not _G.Players1CloneHelp then CreateFreezeBV({Name='HelpMasteryFreezeBv'})if Players2 and
Players2:FindFirstChild('entered')and Players1 and Players1:FindFirstChild('entered')then if(root and root1 and(root.
Position-root1.Position).Magnitude or 0)<50 then game:GetService('ReplicatedStorage').WormholeTP:FireServer(CFrame.new(-
57,-4,67))end end end task.wait()end end)while _G.AutoWormholeMasteryHelp do HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),
MainCF=CFrame.new(0,7,0)})if not _G.Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if
Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==
false then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<50 then slapglove(root1)wait(0.3)repeat
task.wait()until Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.
Ragdolled.Value==false task.wait(0.4)end end end end task.wait()end elseif ag==true then Notification(
"You don't have Wormhole equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Wormhole']:SetValue(false)end end})af:
AddToggle('Auto Mastery Moon',{Text='Auto Mastery Moon',Default=false,Callback=function(ag)_G.AutoMoonMasteryHelp=ag if
not _G.AutoMoonMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or
CheckGlove()=='Moon'then while _G.AutoMoonMasteryHelp do CreateFreezeBV({Name='HelpMasteryFreezeBv'})HelpMasteryJoin({
CloneCF=CFrame.new(0,5,0),MainCF=CFrame.new(0,7,0)})if not _G.Players1CloneHelp then if Players2 and Players2:
FindFirstChild('entered')then if Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')
and Players1.Ragdolled.Value==false then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<50 then
slapglove(root1)wait(0.3)repeat task.wait()until Players1 and Players1:FindFirstChild('entered')and Players1:
FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.4)end end end end task.wait()end elseif ag==
true then Notification("You don't have Moon equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Moon']:SetValue(false)end
end})af:AddToggle('Auto Mastery Brick',{Text='Auto Mastery Brick',Default=false,Callback=function(ag)_G.
AutoBrickMasteryHelp=ag if not _G.AutoTinkeverMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})
end if _G.Players1CloneHelp or CheckGlove()=='Brick'then spawn(function()while _G.AutoBrickMasteryHelp do
CreateFreezeBV({Name='HelpMasteryFreezeBv'})if not _G.Players1CloneHelp then if Players1 and Players2 and Players2:
FindFirstChild('entered')and Players1:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild('Ragdolled')
and Players1.Ragdolled.Value==false then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<50 then
game:GetService('ReplicatedStorage').lbrick:FireServer()end end end end task.wait()end end)while _G.AutoBrickMasteryHelp
do HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=CFrame.new(0,7,3)})task.wait()end elseif ag==true then
Notification("You don't have Brick equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Brick']:SetValue(false)end end})af:
AddToggle('Auto Mastery Killstreak',{Text='Auto Mastery Killstreak',Default=false,Callback=function(ag)_G.
AutoKillstreakMasteryHelp=ag if not _G.AutoKillstreakMasteryHelp then CreateFreezeBV({Remove=true,Name=
'HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Killstreak'then spawn(function()while _G.
AutoKillstreakMasteryHelp do pcall(function()if _G.Players1CloneHelp then CreateFreezeBV({Name='HelpMasteryFreezeBv'})if
Players2 and Players2:FindFirstChild('entered')then repeat task.wait()until _G.AutoKillstreakMasteryHelp==false or
Players2 and Players2:FindFirstChild('entered')and Players2:FindFirstChild('Ragdolled')and Players2.Ragdolled.Value
wait(1)game:GetService('Players').LocalPlayer.Reset:FireServer()wait(0.25)repeat task.wait()until not _G.
AutoKillstreakMasteryHelp or game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild(
'entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')wait(0.8)end end end)task.wait(
)end end)while _G.AutoKillstreakMasteryHelp do pcall(function()HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=CFrame.
new(0,7,0)})if not _G.Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if Players1 and
Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then if(
root and root1 and(root.Position-root1.Position).Magnitude or 0)<50 then slapglove(root1)wait(0.3)repeat task.wait()
until Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.
Value==false task.wait(0.4)end end end end end)task.wait()end elseif ag==true then Notification(
"You don't have Killstreak equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Killstreak']:SetValue(false)end end})af:
AddToggle('Auto Mastery Space',{Text='Auto Mastery Space',Default=false,Callback=function(ag)_G.AutoSpaceMasteryHelp=ag
if not _G.AutoSpaceMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp
or CheckGlove()=='Space'then while _G.AutoSpaceMasteryHelp do HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=CFrame.
new(0,7,0)})if not _G.Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if Players1 and
Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then if(
root and root1 and(root.Position-root1.Position).Magnitude or 0)<50 then repeat task.wait()game:GetService(
'ReplicatedStorage'):WaitForChild('ZeroGSound'):FireServer()until _G.AutoSpaceMasteryHelp==false or root and root:
FindFirstChild('ZeroGSoundEffect')wait(0.65)for ah=1,10 do if root1 and root and root:FindFirstChild('ZeroGSoundEffect')
then slapglove(root1)task.wait(0.87)end end wait(0.3)repeat task.wait()until Players1 and Players1:FindFirstChild(
'entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.4)end end end end task
.wait()end elseif ag==true then Notification("You don't have Space equipped",_G.TimeNotify)wait(0.05)g[
'Auto Mastery Space']:SetValue(false)end end})af:AddToggle('Auto Mastery Run',{Text='Auto Mastery Run',Default=false,
Callback=function(ag)_G.AutoRunMasteryHelp=ag if not _G.AutoRunMasteryHelp then CreateFreezeBV({Remove=true,Name=
'HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Run'then if _G.Players1CloneHelp and not
PlayersMain and ag==true then Notification('You have input main account',_G.TimeNotify)wait(0.05)g['Auto Mastery Run']:
SetValue(false)return end spawn(function()while _G.AutoRunMasteryHelp do pcall(function()if not _G.Players1CloneHelp
then CreateFreezeBV({Name='HelpMasteryFreezeBv'})if Players2 and Players2:FindFirstChild('entered')and not Players2:
FindFirstChild('InLabyrinth')then if Players1 and not Players1:FindFirstChild('InLabyrinth')and Players1:FindFirstChild(
'entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then if(root and root1 and(root.
Position-root1.Position).Magnitude or 0)<100 then game:GetService('ReplicatedStorage').GeneralAbility:FireServer(root.
Position+Vector3.new(0,-3.75,0))task.wait(3.75)end end end end end)task.wait()end end)while _G.AutoRunMasteryHelp do
HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=CFrame.new(0,5,-5)})if _G.Players1CloneHelp then if Players2 and
Players2:FindFirstChild('entered')and PlayersMain and PlayersMain:FindFirstChild('entered')then if(rootmain and root and
(root.Position-rootmain.Position).Magnitude or 0)<270 then if PlayersMain:FindFirstChild('InLabyrinth')and Players2:
FindFirstChild('InLabyrinth')then repeat task.wait()Players2:SetPrimaryPartCFrame(rootmain.CFrame)until not _G.
AutoRunMasteryHelp or(hum and hum.Health<=0)or not Players2:FindFirstChild('InLabyrinth')wait(0.5)repeat task.wait()
until not _G.AutoRunMasteryHelp or not game.Players.LocalPlayer.Character:FindFirstChild('InLabyrinth')or game.Players.
LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer
.Character:FindFirstChild('HumanoidRootPart')task.wait(0.8)end end end end task.wait()end elseif ag==true then
Notification("You don't have Run equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Run']:SetValue(false)end end})af:
AddToggle('Auto Mastery Glovel',{Text='Auto Mastery Glovel',Default=false,Callback=function(ag)_G.AutoGlovelMasteryHelp=
ag if not _G.AutoGlovelMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.
Players1CloneHelp or CheckGlove()=='Glovel'then while _G.AutoGlovelMasteryHelp do HelpMasteryJoin({CloneCF=CFrame.new(0,
5,0),MainCF=CFrame.new(0,5,-3)})if not _G.Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then
if Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==
false then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<50 then for ah=1,9 do slapglove(root1)
task.wait(0.9)end wait(0.3)repeat task.wait()until Players1 and Players1:FindFirstChild('entered')and Players1:
FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.4)end end end end task.wait()end elseif ag==
true then Notification("You don't have Glovel equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Glovel']:SetValue(false)
end end})af:AddToggle('Auto Mastery Booster',{Text='Auto Mastery Booster',Default=false,Callback=function(ag)_G.
AutoBoosterMasteryHelp=ag if not _G.AutoBoosterMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})
end if _G.Players1CloneHelp or CheckGlove()=='Booster'then while _G.AutoBoosterMasteryHelp do HelpMasteryJoin({CloneCF=
CFrame.new(0,5,0),MainCF=CFrame.new(0,5,-3)})if not _G.Players1CloneHelp then if Players2 and Players2:FindFirstChild(
'entered')then if Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.
Ragdolled.Value==false then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<50 then slapglove(root1)
wait(0.3)repeat task.wait()until Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')
and Players1.Ragdolled.Value==false task.wait(2.5)end end end end task.wait()end elseif ag==true then Notification(
"You don't have Glovel equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Glovel']:SetValue(false)end end})af:AddToggle(
'Auto Mastery Rob',{Text='Auto Mastery Rob',Default=false,Callback=function(ag)_G.AutoRobMasteryHelp=ag if not _G.
AutoRobMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or
CheckGlove()=='rob'then while _G.AutoRobMasteryHelp do pcall(function()HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF
=CFrame.new(0,5,-3)})if not _G.Players1CloneHelp then if Players2 and Players2:FindFirstChild('entered')then if Players1
and Players1:FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false then
if(root and root1 and(root.Position-root1.Position).Magnitude or 0)<50 then game:GetService('ReplicatedStorage').rob:
FireServer()for ah,U in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren())do if U.Name=='whiteframe'then U:Destroy(
)end end repeat task.wait()until _G.AutoRobMasteryHelp==false or Players2:FindFirstChild('entered')and Players2 and
Players2:FindFirstChild('Humanoid')and Players2:FindFirstChild('Humanoid').Health>0 and tonumber(Players2:
FindFirstChild('Head').Transparency)<1 wait(0.3)end end end end end)task.wait()end elseif ag==true then Notification(
"You don't have rob equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Rob']:SetValue(false)end end})af:AddToggle(
'Auto Mastery Stalker',{Text='Auto Mastery Stalker',Default=false,Callback=function(ag)_G.AutoStalkerMasteryHelp=ag if
not _G.AutoStalkerMasteryHelp then CreateFreezeBV({Remove=true,Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp
or CheckGlove()=='Stalker'then while _G.AutoStalkerMasteryHelp do CreateFreezeBV({Name='HelpMasteryFreezeBv'})
HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=CFrame.new(0,4,-3)})if not _G.Players1CloneHelp then if Players2 and
Players2:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild(
'Ragdolled')and Players1.Ragdolled.Value==false then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)
<50 then for ah=1,9 do slapglove(root1)task.wait(0.9)end wait(0.3)repeat task.wait()until Players1 and Players1:
FindFirstChild('entered')and Players1:FindFirstChild('Ragdolled')and Players1.Ragdolled.Value==false task.wait(0.4)end
end end end task.wait()end elseif ag==true then Notification("You don't have Stalker equipped",_G.TimeNotify)wait(0.05)g
['Auto Mastery Stalker']:SetValue(false)end end})af:AddToggle('Auto Mastery Stick',{Text='Auto Mastery Stick',Default=
false,Callback=function(ag)_G.AutoStickMasteryHelp=ag if not _G.AutoStickMasteryHelp then CreateFreezeBV({Remove=true,
Name='HelpMasteryFreezeBv'})end if _G.Players1CloneHelp or CheckGlove()=='Stick'then while _G.AutoStickMasteryHelp do
HelpMasteryJoin({CloneCF=CFrame.new(0,5,0),MainCF=CFrame.new(0,10,0)})if not _G.Players1CloneHelp then if Players2 and
Players2:FindFirstChild('entered')then if Players1 and Players1:FindFirstChild('entered')and Players1:FindFirstChild(
'Ragdolled')and Players1.Ragdolled.Value==false then if(root and root1 and(root.Position-root1.Position).Magnitude or 0)
<50 then slapglove(root1)task.wait(0.9)end end end end task.wait()end elseif ag==true then Notification(
"You don't have Stick equipped",_G.TimeNotify)wait(0.05)g['Auto Mastery Stick']:SetValue(false)end end})local ag=Tabs.
Tab4:AddLeftGroupbox('Speed')ag:AddSlider('WalkSpeed',{Text='Speed',Default=20,Min=20,Max=1000,Rounding=0,Compact=true,
Callback=function(ah)game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=ah Walkspeed=ah end})ag:AddInput('WalkSpeed1'
,{Default='20',Numeric=false,Text='Speed',Placeholder='UserSpeed',Callback=function(ah)game.Players.LocalPlayer.
Character.Humanoid.WalkSpeed=ah Walkspeed=ah end})ag:AddToggle('SetSpeed',{Text='Auto Set Speed',Default=false,Callback=
function(ah)KeepWalkspeed=ah while KeepWalkspeed do if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')~=
nil and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed~=Walkspeed then game.Players.LocalPlayer.Character.
Humanoid.WalkSpeed=Walkspeed end task.wait()end end})local ah=Tabs.Tab4:AddRightGroupbox('Jump')ah:AddSlider('JumpPower'
,{Text='Jump',Default=50,Min=50,Max=1000,Rounding=0,Compact=true,Callback=function(U)game.Players.LocalPlayer.Character.
Humanoid.JumpPower=U Jumppower=U end})ah:AddInput('JumpPower1',{Default='50',Numeric=true,Text='Jump',Placeholder=
'UserJump',Callback=function(U)game.Players.LocalPlayer.Character.Humanoid.JumpPower=U Jumppower=U end})ah:AddToggle(
'SetJump',{Text='Auto Set Jump',Default=false,Callback=function(U)KeepJumppower=U while KeepJumppower do if game.Players
.LocalPlayer.Character:FindFirstChild('Humanoid')~=nil and game.Players.LocalPlayer.Character.Humanoid.JumpPower~=
Jumppower then game.Players.LocalPlayer.Character.Humanoid.JumpPower=Jumppower end task.wait()end end})local U=Tabs.Tab4
:AddLeftGroupbox('Remaining')U:AddSlider('HipHeight',{Text='Hip Height',Default=0,Min=0,Max=100,Rounding=0,Compact=true,
Callback=function(V)game.Players.LocalPlayer.Character.Humanoid.HipHeight=V HipHeight=V end})U:AddToggle('SetHipHeight',
{Text='Auto Set Hip Height',Default=false,Callback=function(V)KeepHipHeight=V while KeepHipHeight do if game.Players.
LocalPlayer.Character:FindFirstChild('Humanoid')~=nil and game.Players.LocalPlayer.Character.Humanoid.HipHeight~=
HipHeight then game.Players.LocalPlayer.Character.Humanoid.HipHeight=HipHeight end task.wait()end end})U:AddSlider(
'Gravity',{Text='Gravity',Default=0,Min=0,Max=100,Rounding=0,Compact=true,Callback=function(V)game.Workspace.Gravity=V
end})local V=Tabs.Tab5:AddRightGroupbox('Misc Default')V:AddDropdown('GodMobe',{Text='Godmobe',Values={'Godmode',
'Godmode + Invisibility'},Default='',Multi=false,Callback=function(W)if W=='Godmode'then if game.Players.LocalPlayer.
Character:FindFirstChild('entered')==nil then firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),
workspace.Lobby.Teleport1,0)firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.
Teleport1,1)end repeat task.wait()until game.Players.LocalPlayer.Character:FindFirstChildWhichIsA('Tool')or game.Players
.LocalPlayer.Backpack:FindFirstChildWhichIsA('Tool')for X,Y in pairs(game.Players.LocalPlayer.Character:GetChildren())do
Y.Parent=game.LogService end for X,Y in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do Y.Parent=game.
LogService end game:GetService('Players').LocalPlayer.Reset:FireServer()wait(3.82)for X,Y in pairs(game.LogService:
GetChildren())do Y.Parent=game.Players.LocalPlayer.Backpack end for X,Y in pairs(game.Players.LocalPlayer.Backpack:
GetChildren())do game.Players.LocalPlayer.Character.Humanoid:EquipTool(Y)end game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=game.workspace.Origo.CFrame*CFrame.new(0,-5,0)elseif W=='Godmode + Invisibility'then if game.
Players.LocalPlayer.leaderstats.Slaps.Value>=666 then if game.Players.LocalPlayer.Character:FindFirstChild('entered')==
nil then firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1,0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1,1)end repeat task.
wait()until game.Players.LocalPlayer.Character:FindFirstChildWhichIsA('Tool')or game.Players.LocalPlayer.Backpack:
FindFirstChildWhichIsA('Tool')for X,Y in pairs(game.Players.LocalPlayer.Character:GetChildren())do Y.Parent=game.
LogService end for X,Y in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do Y.Parent=game.LogService end game:
GetService('Players').LocalPlayer.Reset:FireServer()wait(3.82)OGlove=CheckGlove()fireclickdetector(workspace.Lobby.Ghost
.ClickDetector)game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()fireclickdetector(workspace.Lobby[OGlove].
ClickDetector)for X,Y in pairs(game.LogService:GetChildren())do Y.Parent=game.Players.LocalPlayer.Backpack end for X,Y
in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do game.Players.LocalPlayer.Character.Humanoid:EquipTool(Y)end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.workspace.Origo.CFrame*CFrame.new(0,-5,0)wait(0.5)for X,
Y in pairs(game.Players.LocalPlayer.Character:GetChildren())do if Y.Name~='Humanoid'then Y.Transparency=0 end end else
Notification('You need 666+ slaps',_G.TimeNotify)end end end})V:AddDropdown('Teleport Place',{Text='Teleport',Values={
'Arena','Lobby','Hunter Room','Tournament','Brazil','Island Slapple','Plate','Cannon Island','Keypad','Cube Of Death',
'Moai Island','Default Arena','Island 1','Island 2','Island 3'},Default='',Multi=false,Callback=function(W)if W=='Arena'
then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.workspace.Origo.CFrame*CFrame.new(0,-5,0)elseif W==
'Lobby'then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-800,328,-2.5)elseif W=='Hunter Room'
then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.BountyHunterRoom.BountyHunterBooth.
_bountyRoomWarpPart.CFrame elseif W=='Brazil'then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.
workspace.Lobby.brazil.portal.CFrame elseif W=='Island Slapple'then game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame=game.workspace.Arena.island5.Union.CFrame*CFrame.new(0,3.25,0)elseif W=='Plate'then game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=game:GetService('Workspace').Arena.Plate.CFrame elseif W=='Tournament'then if
workspace:FindFirstChild('TournamentIsland')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.
TournamentIsland.Spawns.Part.CFrame*CFrame.new(0,2,0)else Notification("Tournament Island don't not spawn.",_G.
TimeNotify)end elseif W=='Cannon Island'then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.Arena.
CannonIsland.Cannon.Base.CFrame*CFrame.new(0,0,35)elseif W=='Keypad'then if not workspace:FindFirstChild('Keypad')then
Notification("Server in don't have keypad.",_G.TimeNotify)else game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame=workspace.Keypad.Buttons.Enter.CFrame end elseif W=='Cube Of Death'then if game.Workspace:FindFirstChild(
'the cube of death(i heard it kills)',1)then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace.
Arena.CubeOfDeathArea['the cube of death(i heard it kills)'].Part.CFrame*CFrame.new(0,5,0)end elseif W=='Moai Island'
then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(215,-15.5,0.5)elseif W=='Default Arena'then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(120,360,-3)elseif W=='Island 1'then game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-211.210846,-5.27827597,4.13719559,-2.25322824E-2,1.83683113e-8
,-0.999746144,-1.83560154E-8,1,1.87866842e-8,0.999746144,1.8774661799999999e-8,-2.25322824E-2)elseif W=='Island 2'then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-8.17191315,-5.14452887,-205.249741,-0.98216176,-
3.48867246E-9,-0.188037917,-4.19987778E-9,1,3.38382322e-9,0.188037917,4.11319823e-9,-0.98216176)elseif W=='Island 3'then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(-6.66747713,-5.06731462,213.575378,0.945777893,
2.52095178e-10,0.324814111,-3.7823856E-8,1,1.09357536e-7,-0.324814111,-1.15713661E-7,0.945777893)end end})V:AddInput(
'Players',{Default='',Numeric=false,Text='Player',Finished=true,Placeholder='Username',Callback=function(W)_G.PlayerPut=
FoundPlr(W,true)end})V:AddButton('Teleport Player',function()if _G.PlayerPut and _G.PlayerPut.Character and _G.PlayerPut
.Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')
then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=_G.PlayerPut.Character.HumanoidRootPart.CFrame end end)V
:AddToggle('Auto Teleport Player',{Text='Auto Teleport Player',Default=false,Callback=function(W)_G.PlayerTele=W while
_G.PlayerTele do if _G.PlayerPut and _G.PlayerPut.Character and _G.PlayerPut.Character:FindFirstChild('HumanoidRootPart'
)and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=_G.PlayerPut.Character.HumanoidRootPart.CFrame end task.wait()end end})V:AddToggle(
'Auto View Player',{Text='Auto View Player',Default=false,Callback=function(W)_G.PlayerView=W if _G.PlayerView==false
then if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')then game.Workspace.CurrentCamera.CameraSubject=
game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')end end while _G.PlayerView do if _G.PlayerPut and _G.
PlayerPut.Character and _G.PlayerPut.Character:FindFirstChild('Humanoid')then game.Workspace.CurrentCamera.CameraSubject
=_G.PlayerPut.Character:FindFirstChild('Humanoid')else if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')
then game.Workspace.CurrentCamera.CameraSubject=game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')end end
task.wait()end end})_G.SetSpeedFly=50 V:AddInput('FlySpeed',{Default='50',Numeric=true,Text='Fly Speed',Placeholder=
'UserFlySpeed',Callback=function(W)_G.SetSpeedFly=W end})V:AddToggle('Start Fly',{Text='Start Fly',Default=false,
Callback=function(W)Fly(W)end}):AddKeyPicker('Fly',{Default='R',Text='Fly',Mode='Toggle',SyncToggleState=true})
TabBoxMisc1=Tabs.Tab5:AddLeftTabbox()local W=TabBoxMisc1:AddTab('Misc')W:AddToggle('Autofarm Slapples',{Text=
'Autofarm Slapples',Default=false,Callback=function(X)_G.SlappleFarm=X while _G.SlappleFarm do if game.Players.
LocalPlayer.Character:FindFirstChild('entered')then for Y,Z in pairs(workspace.Arena.island5.Slapples:GetChildren())do
if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character:
FindFirstChild('entered')and(Z.Name:lower()=='slapple'or Z.Name:lower()=='goldenslapple')and Z:FindFirstChild('Glove')
and Z.Glove:FindFirstChildWhichIsA('TouchTransmitter')then Z.Glove.CFrame=game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame end end end task.wait()end end}):AddKeyPicker('AutofarmSlapples',{Default='M',Text=
'Autofarm Slapples',Mode='Toggle',SyncToggleState=true})W:AddToggle('Autofarm Candy',{Text='Autofarm Candy',Default=
false,Callback=function(X)_G.CandyCornsFarm=X while _G.CandyCornsFarm do for Y,Z in pairs(game.Workspace.CandyCorns:
GetChildren())do if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then Z.CFrame=game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame end end task.wait()end end}):AddKeyPicker('AutofarmCandy',{Default='C',
Text='Autofarm Candy',Mode='Toggle',SyncToggleState=true})W:AddDropdown('Notify Workspace',{Text='Notify',Values={'Orb',
'Toolbox','Gravestone','Gift','Keypad'},Default='',Multi=true})W:AddToggle('Notify Real',{Text='Notify Choose',Default=
false,Callback=function(X)_G.NotifyThank=X if _G.NotifyThank then local function WorkspaceChild(Y)if f[
'Notify Workspace'].Value['Orb']and(Y.Name=='JetOrb'or Y.Name=='PhaseOrb'or Y.Name=='SiphonOrb'or Y.Name==
'MATERIALIZEOrb')then Notification('[Notify]: '..Y.Name:gsub('Orb',' Orb')..' Spawn',_G.TimeNotify)end if f[
'Notify Workspace'].Value['Toolbox']and Y.Name=='Toolbox'then Notification('[Notify]: Toolbox Spawn',_G.TimeNotify)end
if f['Notify Workspace'].Value['Gravestone']and Y.Name=='Gravestone'then Notification('[Notify]: Gravestone Spawn',_G.
TimeNotify)end if f['Notify Workspace'].Value['Gift']and Y.Name=='Gift'then Notification('[Notify]: Gift Spawn',_G.
TimeNotify)end if f['Notify Workspace'].Value['Keypad']and Y.Name=='Keypad'then Notification('[Notify]: Keypad Spawn',_G
.TimeNotify)end end for Y,Z in pairs(workspace:GetChildren())do WorkspaceChild(Z)end Child=workspace.ChildAdded:Connect(
function(Y)WorkspaceChild(Y)end)else if Child then Child:Disconnect()Child=nil end end end})W:AddToggle('Fling',{Text=
'Fling',Default=false,Callback=function(X)_G.FlingThen=X if not _G.FlingThen then for Y,Z in pairs(game.Players.
LocalPlayer.Character:GetChildren())do if Z:IsA('BasePart')then Z.CanCollide=true end end end while _G.FlingThen do
pcall(function()local Y=game.Players.LocalPlayer.Character or nil local Z=(Y and Y:FindFirstChild('HumanoidRootPart'))or
nil local _=(Y and Y:FindFirstChild('Ragdolled'))or nil if not(Y and Z)then return end for ai,aj in pairs(Y:GetChildren(
))do if aj:IsA('BasePart')then if _ and _.Value==true then aj.CanCollide=true else aj.CanCollide=false end end end if _
and _.Value==true then return end local ai,aj=0.1 aj=Z.Velocity if Z and(_ and _.Value==false)then Z.Velocity=aj*10000+
Vector3.new(0,10000,0)end game:GetService('RunService').RenderStepped:Wait()if Z then Z.Velocity=aj end game:GetService(
'RunService').Stepped:Wait()if Z then Z.Velocity=aj+Vector3.new(0,ai,0)ai=ai*-1 end end)task.wait()end end})W:AddButton(
{Text='Auto Keypad',DoubleClick=true,Func=function()if not workspace:FindFirstChild('Keypad')then Notification(
"Server in don't have keypad, can have started serverhop",_G.TimeNotify)task.wait(1.5)for ai,aj in ipairs(game.
HttpService:JSONDecode(game:HttpGetAsync('https://games.roblox.com/v1/games/'..game.PlaceId..
'/servers/Public?sortOrder=Asc&limit=100')).data)do if aj.playing<aj.maxPlayers and aj.JobId~=game.JobId then game:
GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,aj.id)end end else if game.Players.LocalPlayer.
Character:FindFirstChild('entered')==nil then game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').
CFrame=game.Workspace:FindFirstChild('Lobby'):FindFirstChild('Teleport1').CFrame repeat task.wait()until game.Players.
LocalPlayer.Character:FindFirstChild('entered')wait(0.5)game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart').CFrame=workspace:FindFirstChild('SafeBoxSpace').CFrame*CFrame.new(0,7,0)wait(0.5)end game.Workspace.
CurrentCamera.CameraSubject=workspace.Keypad.Buttons.Enter fireclickdetector(workspace:WaitForChild('Keypad').Buttons:
FindFirstChild('Reset').ClickDetector)local ai=tostring((#game.Players:GetPlayers())*25+1100-7)for aj=1,#ai do wait(0.5)
local X=ai:sub(aj,aj)fireclickdetector(workspace:WaitForChild('Keypad').Buttons:FindFirstChild(X).ClickDetector)end
wait(1)fireclickdetector(workspace:WaitForChild('Keypad').Buttons:FindFirstChild('Enter').ClickDetector)end end})W:
AddToggle('Auto Code Pocket Keypad',{Text='Auto Code Pocket Keypad',Default=false,Callback=function(ai)_G.
WriteCodeKeypad=ai while _G.WriteCodeKeypad and task.wait()do for aj,X in pairs(game.Workspace:FindFirstChild(
'RoomsFolder'):GetChildren())do if string.find(X.Name,"'s Room")then local Y=X:FindFirstChild('PocketKeypad',true)if Y
then if typeof(fireclickdetector)=='function'then if game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil
then game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame=game.Workspace:FindFirstChild('Lobby')
:FindFirstChild('Teleport1').CFrame repeat task.wait()until game.Players.LocalPlayer.Character:FindFirstChild('entered')
wait(0.5)game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame=workspace:FindFirstChild(
'SafeBoxSpace').CFrame*CFrame.new(0,7,0)wait(0.8)end fireclickdetector(Y.Buttons:FindFirstChild('Reset').ClickDetector)
local Z='4553293'for _=1,#Z do wait(0.26)local ak=Z:sub(_,_)fireclickdetector(Y.Buttons:FindFirstChild(ak).ClickDetector
)end task.wait(0.15)fireclickdetector(Y.Buttons:FindFirstChild('Enter').ClickDetector)end end end end end end})W:
AddInput('Write Code Keypad',{Default='',Numeric=true,Text='Write Code Keypad',Placeholder='UserCode',Callback=function(
ai)_G.writeCode=ai end})W:AddDropdown('Enter Keypad',{Text='Enter Keypad',Values={'Not Enter','Enter'},Default='Enter',
Multi=false,Callback=function(ai)_G.EnterKeypad=ai end})W:AddButton('Write Keypad',function()if not workspace:
FindFirstChild('Keypad')then Notification("Server in don't have keypad.",_G.TimeNotify)else if game.Players.LocalPlayer.
Character:FindFirstChild('entered')==nil then game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').
CFrame=game.Workspace:FindFirstChild('Lobby'):FindFirstChild('Teleport1').CFrame repeat task.wait()until game.Players.
LocalPlayer.Character:FindFirstChild('entered')wait(0.5)game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart').CFrame=workspace:FindFirstChild('SafeBoxSpace').CFrame*CFrame.new(0,7,0)wait(0.5)end game.Workspace.
CurrentCamera.CameraSubject=workspace.Keypad.Buttons.Enter fireclickdetector(workspace:WaitForChild('Keypad').Buttons:
FindFirstChild('Reset').ClickDetector)for ai=1,#_G.writeCode do wait(0.35)local aj=_G.writeCode:sub(ai,ai)
fireclickdetector(workspace:WaitForChild('Keypad').Buttons:FindFirstChild(aj).ClickDetector)end if _G.EnterKeypad==
'Enter'then fireclickdetector(workspace:WaitForChild('Keypad').Buttons:FindFirstChild('Enter').ClickDetector)end if game
.Players.LocalPlayer.Character:FindFirstChild('Humanoid')then game.Workspace.CurrentCamera.CameraSubject=game.Players.
LocalPlayer.Character:FindFirstChild('Humanoid')end end end)W:AddDropdown('Easter Egg Code',{Text='Easter Egg Code',
Values={'911','8008','666','6969','1987'},Default='',Multi=false,Callback=function(ai)_G.EggCodes=ai end})W:AddButton(
'Easter Egg Keypad',function()if not workspace:FindFirstChild('Keypad')then Notification("Server in don't have keypad.",
_G.TimeNotify)else if game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil then game.Players.LocalPlayer.
Character:FindFirstChild('HumanoidRootPart').CFrame=game.Workspace:FindFirstChild('Lobby'):FindFirstChild('Teleport1').
CFrame repeat task.wait()until game.Players.LocalPlayer.Character:FindFirstChild('entered')wait(0.5)game.Players.
LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame=workspace:FindFirstChild('SafeBoxSpace').CFrame*CFrame.
new(0,7,0)wait(0.5)end game.Workspace.CurrentCamera.CameraSubject=workspace.Keypad.Buttons.Enter fireclickdetector(
workspace:WaitForChild('Keypad').Buttons:FindFirstChild('Reset').ClickDetector)for ai=1,#_G.EggCodes do wait(0.35)local
aj=_G.EggCodes:sub(ai,ai)fireclickdetector(workspace:WaitForChild('Keypad').Buttons:FindFirstChild(aj).ClickDetector)end
wait(1)fireclickdetector(workspace:WaitForChild('Keypad').Buttons:FindFirstChild('Enter').ClickDetector)if game.Players.
LocalPlayer.Character:FindFirstChild('Humanoid')then game.Workspace.CurrentCamera.CameraSubject=game.Players.LocalPlayer
.Character:FindFirstChild('Humanoid')end end end)CloneAcc=W:AddInput('Players',{Text='Clone Account',Finished=true,
Placeholder='Username',Callback=function(ai)_G.HelpPlayer1Slap=FoundPlr(ai,true)end})W:AddToggle('Clone Help Farm Slap',
{Text='Clone Help Farm Slap',Default=false,Callback=function(ai)_G.CloneAccHelpFarm=ai end})W:AddSlider('Slap Cooldown',
{Text='Delay Slap (Clone)',Default=0.75,Min=0.7,Max=1.75,Rounding=2,Compact=true,Callback=function(ai)_G.DelaySlapClone=
ai end})W:AddDropdown('FarmSlap',{Text='AutoFarm Slap',Values={'Aimbot','Teleport','Tween','Clone Help'},Default='',
Multi=false,Callback=function(ai)_G.AutoFarmSlapBattles=ai end})local ai=0 local aj=0 local ak=1 local X={}local Y=game:
GetService('PathfindingService')local Z=game:GetService('Players')local _=game:GetService('VirtualUser')local al=game:
GetService('RunService')local am=Z.LocalPlayer local an=workspace:FindFirstChild('PathFindPartsFolder')or Instance.new(
'Folder')an.Name='PathFindPartsFolder'an.Parent=workspace local function IsValidTarget(ao)if ao==am then return false
end local ap=ao.Character local aq=am.Character if not ap or not aq then return false end if not aq:FindFirstChild(
'entered')or not ap:FindFirstChild('entered')then return false end local ar=ap:FindFirstChild('HumanoidRootPart')local
as=ap:FindFirstChildOfClass('Humanoid')if not ar or not as then return false end if ar.Position.Y<-10 then return false
end if ap:FindFirstChild('stevebody')or ap:FindFirstChild('rock')or ap:FindFirstChild('Mirage')then return false end if
ap.Head:FindFirstChild('UnoReverseCard')then return false end if _G.AutoFarmSlapBattles~='Aimbot'then if ar.BrickColor==
BrickColor.new('New Yeller')then return false end end local at=ap:FindFirstChild('Ragdolled')if _G.AutoFarmSlapBattles==
'Teleport'then if not at or at.Value==false then return false end else if at and at.Value==true then return false end
end return true end local function EquipGlove()local ao=am.Character if not ao then return end if not ao:
FindFirstChildOfClass('Tool')then for ap,aq in ipairs(am.Backpack:GetChildren())do if aq:IsA('Tool')and aq:
FindFirstChild('Glove')then aq.Parent=ao break end end end end local function DrawVisualPath(ao)an:ClearAllChildren()for
ap,aq in ipairs(ao)do local ar=Instance.new('Part')ar.Size=Vector3.new(1,1,1)ar.Position=aq.Position ar.Shape=Enum.
PartType.Ball ar.Material=Enum.Material.Neon ar.Color=Color3.fromRGB(0,255,255)ar.Anchored=true ar.CanCollide=false ar.
Parent=an end end table.insert(_G.ConnectFun,al.RenderStepped:Connect(function()local ao=am.Character local ap=ao and ao
:FindFirstChildOfClass('Humanoid')local aq=ao and ao:FindFirstChild('HumanoidRootPart')if _G.AutoFarmSlap and _G.
AutoFarmSlapBattles=='Clone Help (Duel)'then if ao and ap and ao:FindFirstChild('entered')==nil then ap:MoveTo(game.
Workspace:FindFirstChild('Lobby'):FindFirstChild('Teleport1').Position)end if ao:FindFirstChild('entered')and aq then
CreateFreezeBV({Name='Helpfarmslap'})if(aq.Position-workspace['SafeBox'].Position).Magnitude>200 then aq.CFrame=
workspace['SafeBox'].CFrame*CFrame.new(0,(_G.CloneAccHelpFarm and 55 or 50),0)if aq:FindFirstChild('Helpfarmslap')then
aq:FindFirstChild('Helpfarmslap').Velocity=Vector3.zero end else if aq:FindFirstChild('Helpfarmslap')then local ar=(
workspace['SafeBox'].Position+Vector3.new(0,(_G.CloneAccHelpFarm and 55 or 50),0)-aq.Position)local as=ar.Magnitude if
as>5 then local at=math.clamp(as*5,50,150)aq:FindFirstChild('Helpfarmslap').Velocity=ar.Unit*at else aq:FindFirstChild(
'Helpfarmslap').Velocity=Vector3.zero end end end if not _G.CloneAccHelpFarm then if ao and ao:FindFirstChild('entered')
then if _G.HelpPlayer1Slap and _G.HelpPlayer1Slap.Character and _G.HelpPlayer1Slap.Character:FindFirstChild('entered')
and _G.HelpPlayer1Slap.Character:FindFirstChild('HumanoidRootPart')then if(aq.Position-_G.HelpPlayer1Slap.Character.
HumanoidRootPart.Position).Magnitude<50 then if tick()-aj>=(_G.DelaySlapClone or 0.75)then aj=tick()slapglove(_G.
HelpPlayer1Slap.Character.HumanoidRootPart)end end end end end end end if _G.AutoFarmSlap and _G.AutoFarmSlapBattles==
'Aimbot'then if ao and ap and aq and ao:FindFirstChild('entered')then local ar,as=math.huge for at,au in pairs(game.
Players:GetPlayers())do if IsValidTarget(au)then local av=au.Character.HumanoidRootPart local aw=(aq.Position-av.
Position).Magnitude if aw<ar then as=au.Character ar=aw end end end if as then local at=as.HumanoidRootPart local au=as:
FindFirstChildOfClass('Humanoid')aq.CFrame=CFrame.new(aq.Position,Vector3.new(at.Position.X,aq.Position.Y,at.Position.Z)
)EquipGlove()if ar<=7 then ap:MoveTo(at.Position)X={}if at.Position.Y-aq.Position.Y>2.5 and au and au.FloorMaterial==
Enum.Material.Air then if ap.FloorMaterial~=Enum.Material.Air then ap.Jump=true end end else local av=Y:CreatePath({
AgentRadius=2,WaypointSpacing=4,AgentHeight=5,AgentCanJump=true,AgentJumpHeight=10,Costs={BrickFind=1000}})pcall(
function()av:ComputeAsync(aq.Position,at.Position)if av.Status==Enum.PathStatus.Success then X=av:GetWaypoints()ak=2
DrawVisualPath(X)else X={}ap:MoveTo(at.Position)end end)end if#X>0 and ak<=#X then local av=X[ak]ap:MoveTo(av.Position)
if av.Action==Enum.PathWaypointAction.Jump then ap.Jump=true end if(aq.Position-av.Position).Magnitude<=2.5 then ak=ak+1
end else ap:MoveTo(at.Position)end local av=ao:FindFirstChildOfClass('Tool')if av and av:FindFirstChild('Glove')then if(
av.Glove.Position-at.Position).Magnitude<=5.5 then _:ClickButton1(Vector2.new(200,200))end end else an:ClearAllChildren(
)X={}end end else an:ClearAllChildren()X={}end end))W:AddToggle('Auto Farm Slap',{Text='Auto Farm Slap',Default=false,
Callback=function(ao)_G.AutoFarmSlap=ao while _G.AutoFarmSlap do local ap=am.Character local aq=ap and ap:
FindFirstChildOfClass('Humanoid')local ar=ap and ap:FindFirstChild('HumanoidRootPart')if ap and aq and ar then local as=
_G.AutoFarmSlapBattles local at=ap:FindFirstChild('entered')if not at then local au=workspace:FindFirstChild('Lobby')
local av=au and au:FindFirstChild('Teleport1')if av then aq:MoveTo(av.Position)end else if as=='Aimbot'then for au,av in
ipairs(workspace:GetChildren())do if av.Name=='Union'and not av:FindFirstChild('PathfindingModifier')then local aw=
Instance.new('PathfindingModifier')aw.Label='BrickFind'aw.Parent=av end end end end if at and(not ap:FindFirstChild(
'Ragdolled')or ap.Ragdolled.Value==false)then local au local av=math.huge for aw,ax in ipairs(Z:GetPlayers())do if
IsValidTarget(ax)then local ay=ax.Character.HumanoidRootPart local az=(ar.Position-ay.Position).Magnitude if az<av then
au=ax.Character av=az end end end if au and au:FindFirstChild('HumanoidRootPart')then local aw=au.HumanoidRootPart if as
=='Teleport'then ar.CFrame=aw.CFrame*CFrame.new(0,3,0)task.wait(0.1)if typeof(slapglove)=='function'then slapglove(aw)
end task.wait(0.5)elseif as=='Tween'then local ax=au.HumanoidRootPart local ay=ax.Position+Vector3.new(0,4,0)for az,aA
in ipairs(ap:GetChildren())do if aA:IsA('BasePart')then aA.CanCollide=false end end if typeof(CreateFreezeBV)==
'function'then CreateFreezeBV({Name='AutoFarmSlapTween'})local az=ar:FindFirstChild('AutoFarmSlapTween')if az then local
aA=ay-ar.Position local aB=aA.Magnitude if aB>5 then az.Velocity=aA.Unit*80 else az.Velocity=Vector3.zero end end local
aA=(ar.Position-ay).Magnitude if aA<=6 and _G.AutoFarmSlap then if typeof(slapglove)=='function'then slapglove(ax)end
task.wait(0.6)end end elseif as=='Aimbot'then ar.CFrame=CFrame.new(ar.Position,Vector3.new(aw.Position.X,ar.Position.Y,
aw.Position.Z))EquipGlove()aq:MoveTo(aw.Position)if ar.AssemblyLinearVelocity.Magnitude<2 or(aw.Position.Y-ar.Position.Y
>3)then if aq.FloorMaterial~=Enum.Material.Air then aq.Jump=true end end end else if as=='Tween'then local aw=ar:
FindFirstChild('AutoFarmSlapTween')if aw then aw.Velocity=Vector3.zero end for ax,ay in ipairs(ap:GetChildren())do if ay
:IsA('BasePart')and ay.Name~='HumanoidRootPart'then ay.CanCollide=true end end end end end end if _G.AutoFarmSlapBattles
=='Aimbot'then task.wait()else task.wait(0.1)end end end})W:AddToggle('Auto Spam Ability',{Text='Auto Spam Ability',
Default=false,Callback=function(ao)_G.OnAbility=ao while _G.OnAbility and CheckGlove()=='Fort'do game:GetService(
'ReplicatedStorage').Fortlol:FireServer()wait(3.1)end while _G.OnAbility and CheckGlove()=='Home Run'do game:GetService(
'ReplicatedStorage').HomeRun:FireServer({['start']=true})game:GetService('ReplicatedStorage').HomeRun:FireServer({[
'finished']=true})task.wait(4.1)end while _G.OnAbility and CheckGlove()=='\u{1f5ff}'do local ap={}for aq,ar in pairs(
game.Players:GetChildren())do if ar~=game.Players.LocalPlayer and ar.Character and ar.Character:FindFirstChild(
'HumanoidRootPart')and ar.Character:FindFirstChild('Ragdolled')and not ar.Character.HumanoidRootPart:FindFirstChild(
'BlockedShield')and ar.Character.Ragdolled.Value==false and ar.Character.isInArena.Value==true and notSlap(ar.Character,
BlackList)then table.insert(ap,ar)end end if#ap~=0 then local aq=ap[math.random(#ap)]game:GetService('ReplicatedStorage'
).GeneralAbility:FireServer(CFrame.new(aq.Character.HumanoidRootPart.CFrame.X,-5.6,aq.Character.HumanoidRootPart.CFrame.
Z+5))end wait(3.1)end while _G.OnAbility and CheckGlove()=='Shukuchi'do local ap={}for aq,ar in pairs(game.Players:
GetChildren())do if ar~=game.Players.LocalPlayer and ar.Character and ar.Character:FindFirstChild('HumanoidRootPart')and
ar.Character:FindFirstChild('Ragdolled')and not ar.Character.HumanoidRootPart:FindFirstChild('BlockedShield')and ar.
Character.Ragdolled.Value==false and ar.Character.isInArena.Value==true and notSlap(ar.Character,BlackList)then table.
insert(ap,ar)end end if#ap~=0 then local aq=ap[math.random(#ap)]game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame=aq.Character.HumanoidRootPart.CFrame wait(0.09)game:GetService('ReplicatedStorage').SM:FireServer(Target)end
wait(0.8)end while _G.OnAbility and CheckGlove()=='Slicer'do game:GetService('ReplicatedStorage').Slicer:FireServer(
'sword')game:GetService('ReplicatedStorage').Slicer:FireServer('slash',game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame,Vector3.new())wait(5.1)end while _G.OnAbility and CheckGlove()=='Reverse'do game:GetService(
'ReplicatedStorage'):WaitForChild('ReverseAbility'):FireServer()task.wait(5.7)end while _G.OnAbility and CheckGlove()==
'rob'do game:GetService('ReplicatedStorage').rob:FireServer()wait(3)end while _G.OnAbility and CheckGlove()=='bob'do
game:GetService('ReplicatedStorage').bob:FireServer()wait(9)end while _G.OnAbility and(CheckGlove()=='Kraken'or
CheckGlove()=='Sbeve')do game:GetService('ReplicatedStorage').KrakenArm:FireServer()wait(5)end while _G.OnAbility and
CheckGlove()=='Psycho'do game:GetService('ReplicatedStorage').Psychokinesis:InvokeServer({['grabEnabled']=true})game:
GetService('ReplicatedStorage').Psychokinesis:InvokeServer({['throwbackAlpha']=math.huge})task.wait()end while _G.
OnAbility and CheckGlove()=='Killstreak'do game:GetService('ReplicatedStorage').KSABILI:FireServer()wait(6.9)end while
_G.OnAbility and CheckGlove()=='bus'do game:GetService('ReplicatedStorage').busmoment:FireServer()wait(5.1)end while _G.
OnAbility and CheckGlove()=='Mitten'do game.ReplicatedStorage.MittenA:FireServer(true)wait(1.55)game.ReplicatedStorage.
MittenA:FireServer(false)wait(5.1)end while _G.OnAbility and CheckGlove()=='Defense'do game:GetService(
'ReplicatedStorage').Barrier:FireServer()wait(0.25)end while _G.OnAbility and CheckGlove()=='Swashbuckler'do game.
ReplicatedStorage.Events.Swashbuckler_coins:FireServer()game.ReplicatedStorage.Events.Swashbuckler:FireServer()task.
wait()end while _G.OnAbility and CheckGlove()=='Bomb'do game:GetService('ReplicatedStorage').BombThrow:FireServer()wait(
2.5)game:GetService('ReplicatedStorage').BombThrow:FireServer()wait(4.1)end while _G.OnAbility and CheckGlove()==
'Replica'do game:GetService('ReplicatedStorage').Duplicate:FireServer(true)wait(6)end while _G.OnAbility and CheckGlove(
)=='Pusher'do game:GetService('ReplicatedStorage').PusherWall:FireServer()wait(5.1)end while _G.OnAbility and
CheckGlove()=='Jet'do local ap={}for aq,ar in pairs(game.Players:GetChildren())do if ar~=game.Players.LocalPlayer and ar
.Character and ar.Character:FindFirstChild('HumanoidRootPart')and ar.Character:FindFirstChild('Ragdolled')and not ar.
Character.HumanoidRootPart:FindFirstChild('BlockedShield')and ar.Character.Ragdolled.Value==false and ar.Character.
isInArena.Value==true and notSlap(ar.Character,BlackList)then local as=(game.Players.LocalPlayer.Character.
HumanoidRootPart.Position-ar.Character.HumanoidRootPart.Position).Magnitude if as<200 then table.insert(ap,ar)end end
end if#ap~=0 then local aq=ap[math.random(#ap)]game.ReplicatedStorage.AirStrike:FireServer(aq.Character)end wait(5.1)end
while _G.OnAbility and CheckGlove()=='Tableflip'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer()wait(
3.1)end while _G.OnAbility and CheckGlove()=='Shield'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer()
wait(3.1)end while _G.OnAbility and CheckGlove()=='Rocky'do game:GetService('ReplicatedStorage').RockyShoot:FireServer()
task.wait(7.5)end while _G.OnAbility and CheckGlove()=="God's Hand"do game:GetService('ReplicatedStorage').TimestopJump:
FireServer()game:GetService('ReplicatedStorage').Timestopchoir:FireServer()game:GetService('ReplicatedStorage').Timestop
:FireServer()wait(50.1)end while _G.OnAbility and CheckGlove()=='Za Hando'do game:GetService('ReplicatedStorage').Erase:
FireServer()wait(5.1)end while _G.OnAbility and CheckGlove()=='Baller'do game:GetService('ReplicatedStorage').
GeneralAbility:FireServer()wait(4.1)end while _G.OnAbility and CheckGlove()=='Glitch'do game:GetService(
'ReplicatedStorage').GeneralAbility:FireServer()wait(5.34)end while _G.OnAbility and CheckGlove()=='Stun'do if game:
GetService('Players').LocalPlayer.Character:FindFirstChild('Stun')then game:GetService('ReplicatedStorage').StunR:
FireServer(game:GetService('Players').LocalPlayer.Character.Stun)wait(10.1)end end while _G.OnAbility and CheckGlove()==
'STOP'do game:GetService('ReplicatedStorage').STOP:FireServer(true)wait(4.1)end while _G.OnAbility and CheckGlove()==
'Quake'do game:GetService('ReplicatedStorage'):WaitForChild('QuakeQuake'):FireServer({['start']=true})game:GetService(
'ReplicatedStorage'):WaitForChild('QuakeQuake'):FireServer({['finished']=true})task.wait()end while _G.OnAbility and
CheckGlove()=='Track'do local ap={}for aq,ar in pairs(game.Players:GetChildren())do if ar~=game.Players.LocalPlayer and
ar.Character and ar.Character:FindFirstChild('HumanoidRootPart')and ar.Character:FindFirstChild('Ragdolled')and not ar.
Character.HumanoidRootPart:FindFirstChild('BlockedShield')and ar.Character.Ragdolled.Value==false and ar.Character.
isInArena.Value==true and notSlap(ar.Character,BlackList)then local as=(game.Players.LocalPlayer.Character.
HumanoidRootPart.Position-ar.Character.HumanoidRootPart.Position).Magnitude if as<500 then table.insert(ap,ar)end end
end if#ap~=0 then local aq=ap[math.random(#ap)]game:GetService('ReplicatedStorage').GeneralAbility:FireServer(aq.
Character)end wait(10.1)end while _G.OnAbility and CheckGlove()=='Mail'do game:GetService('ReplicatedStorage').MailSend:
FireServer()wait(3.1)end while _G.OnAbility and CheckGlove()=='Shard'do game:GetService('ReplicatedStorage').Shards:
FireServer()wait(4.1)end while _G.OnAbility and CheckGlove()=='fish'do game:GetService('ReplicatedStorage').
GeneralAbility:FireServer()wait(3.05)end while _G.OnAbility and CheckGlove()=='Null'do game:GetService(
'ReplicatedStorage').NullAbility:FireServer()wait(0.01)end while _G.OnAbility and CheckGlove()=='Counter'do game:
GetService('ReplicatedStorage').Counter:FireServer()game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=20 task.wait(
6.2)end while _G.OnAbility and CheckGlove()=='Voodoo'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer()
task.wait(6.27)end while _G.OnAbility and CheckGlove()=='Swapper'do game:GetService('ReplicatedStorage').SLOC:
FireServer()wait(5.1)end while _G.OnAbility and CheckGlove()=='Gravity'do game:GetService('ReplicatedStorage').
GeneralAbility:FireServer()task.wait()end while _G.OnAbility and CheckGlove()=='Bubble'do game:GetService(
'ReplicatedStorage').BubbleThrow:FireServer()wait(3.1)end while _G.OnAbility and CheckGlove()=='Slapple'do game:
GetService('ReplicatedStorage').funnyTree:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)wait(
3.1)end while _G.OnAbility and CheckGlove()=='Detonator'do game:GetService('ReplicatedStorage').Fart:FireServer()task.
wait()end while _G.OnAbility and CheckGlove()=='Berserk'do game:GetService('ReplicatedStorage').BerserkCharge:
FireServer(game:GetService('Players').LocalPlayer.Character.Berserk)wait(2.1)end while _G.OnAbility and CheckGlove()==
'Rojo'do game:GetService('ReplicatedStorage'):WaitForChild('RojoAbility'):FireServer('Release',{game.Players.LocalPlayer
.Character.HumanoidRootPart.CFrame})task.wait()end while _G.OnAbility and CheckGlove()=='Kinetic'do OGL=game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame game.Players.LocalPlayer.Character.Humanoid:UnequipTools()for ap=1,100 do
game.ReplicatedStorage.SelfKnockback:FireServer({['Force']=0,['Direction']=Vector3.new(0,0.01,0)})task.wait(0.05)end
wait(2)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=OGL if game.Players.LocalPlayer.Backpack:
FindFirstChild('Kinetic')then game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.
Kinetic)end game:GetService('ReplicatedStorage').KineticExpl:FireServer(game.Players.LocalPlayer.Character.Kinetic,game.
Players.LocalPlayer.Character.HumanoidRootPart.Position)game.Players.LocalPlayer.Character.Humanoid:UnequipTools()wait(
2.2)end while _G.OnAbility and CheckGlove()=='Dominance'do game:GetService('ReplicatedStorage').DominanceAc:FireServer(
game.Players.LocalPlayer.Character.HumanoidRootPart.Position)wait(3.1)end while _G.OnAbility and CheckGlove()==
'[REDACTED]'do game:GetService('ReplicatedStorage').Well:FireServer()wait(5.1)end while _G.OnAbility and CheckGlove()==
'Duelist'do game:GetService('ReplicatedStorage').DuelistAbility:FireServer()wait(5.1)end while _G.OnAbility and
CheckGlove()=='Engineer'do game:GetService('ReplicatedStorage').Sentry:FireServer()wait(5.1)end while _G.OnAbility and
CheckGlove()=='Brick'do game:GetService('ReplicatedStorage').lbrick:FireServer()game:GetService('Players').LocalPlayer.
PlayerGui.BRICKCOUNT.ImageLabel.TextLabel.Text=game:GetService('Players').LocalPlayer.PlayerGui.BRICKCOUNT.ImageLabel.
TextLabel.Text+1 wait(1.1)end while _G.OnAbility and CheckGlove()=='Trap'do game:GetService('ReplicatedStorage').
funnyhilariousbeartrap:FireServer()wait(3.1)end while _G.OnAbility and CheckGlove()=='woah'do game:GetService(
'ReplicatedStorage').VineThud:FireServer()wait(5.1)end while _G.OnAbility and CheckGlove()=='Ping Pong'do game:
GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait()end while _G.OnAbility and CheckGlove()=='Recall'
do game:GetService('ReplicatedStorage').Recall:InvokeServer(game:GetService('Players').LocalPlayer.Character.Recall)
wait(3.1)end while _G.OnAbility and CheckGlove()=='ZZZZZZZ'do game:GetService('ReplicatedStorage').ZZZZZZZSleep:
FireServer()task.wait()end while _G.OnAbility and CheckGlove()=='Adios'do game:GetService('ReplicatedStorage').
AdiosActivated:FireServer()wait(8.3)end while _G.OnAbility and CheckGlove()=='Boogie'do if game.Players.LocalPlayer.
Backpack:FindFirstChild('Boogie')then game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.
Backpack.Boogie)elseif game.Players.LocalPlayer.Backpack:FindFirstChild('Boogie')==nil then game:GetService(
'ReplicatedStorage').BoogieBall:FireServer(game.Players.LocalPlayer.Character.Boogie,game.Players.LocalPlayer.Character.
HumanoidRootPart.Position)end task.wait()end while _G.OnAbility and CheckGlove()=='Balloony'do if game.Players.
LocalPlayer.Backpack:FindFirstChild('Balloony')then game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.
LocalPlayer.Backpack.Balloony)elseif game.Players.LocalPlayer.Backpack:FindFirstChild('Balloony')==nil then game:
GetService('ReplicatedStorage').GeneralAbility:FireServer(game:GetService('Players').LocalPlayer.Character.Balloony)end
task.wait()end while _G.OnAbility and CheckGlove()=='Phase'do game:GetService('ReplicatedStorage').PhaseA:FireServer()
wait(5.475)end while _G.OnAbility and CheckGlove()=='Hallow Jack'do game:GetService('ReplicatedStorage'):WaitForChild(
'Hallow'):FireServer()wait(3.1)end while _G.OnAbility and CheckGlove()=='Phantom'do game:GetService('ReplicatedStorage')
.PhantomDash:InvokeServer(workspace[game.Players.LocalPlayer.Name].Phantom)wait()end while _G.OnAbility and CheckGlove()
=='Sparky'do game:GetService('ReplicatedStorage').Sparky:FireServer(game:GetService('Players').LocalPlayer.Character.
Sparky)task.wait()end while _G.OnAbility and CheckGlove()=='Charge'do game:GetService('ReplicatedStorage').
GeneralAbility:FireServer(game:GetService('Players').LocalPlayer.Character.Charge)wait(3.1)end while _G.OnAbility and
CheckGlove()=='Coil'do if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Coil')and game.Players.
LocalPlayer.Character:FindFirstChild('Humanoid')then game:GetService('ReplicatedStorage'):WaitForChild('GeneralAbility')
:FireServer(game:GetService('Players').LocalPlayer.Character.Coil)game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=
21 wait(3.1)end end while _G.OnAbility and CheckGlove()=='Diamond'do game:GetService('ReplicatedStorage'):WaitForChild(
'Rockmode'):FireServer()task.wait()end while _G.OnAbility and CheckGlove()=='MEGAROCK'do game:GetService(
'ReplicatedStorage'):WaitForChild('Rockmode'):FireServer()task.wait()end while _G.OnAbility and CheckGlove()==
'Excavator'do game:GetService('ReplicatedStorage'):WaitForChild('Excavator'):InvokeServer()game:GetService(
'ReplicatedStorage'):WaitForChild('ExcavatorCancel'):FireServer()wait(7.3)end while _G.OnAbility and CheckGlove()==
'Thor'do if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then game:GetService(
'ReplicatedStorage').ThorAbility:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)end task.wait()
end while _G.OnAbility and CheckGlove()=='Meteor'do game:GetService('ReplicatedStorage'):WaitForChild('GeneralAbility'):
FireServer()task.wait()end while _G.OnAbility and CheckGlove()=='Sun'do game:GetService('ReplicatedStorage').
GeneralAbility:FireServer('Cast')task.wait()end while _G.OnAbility and CheckGlove()=='Whirlwind'do game:GetService(
'ReplicatedStorage').GeneralAbility:FireServer()task.wait()end while _G.OnAbility and CheckGlove()=='Guardian Angel'do
game.ReplicatedStorage.GeneralAbility:FireServer(game.Players.LocalPlayer)task.wait()end while _G.OnAbility and
CheckGlove()=='Parry'do game.ReplicatedStorage.GeneralAbility:FireServer()task.wait()end while _G.OnAbility and
CheckGlove()=='MR'do game:GetService('ReplicatedStorage').Spherify:FireServer()task.wait()end while _G.OnAbility and
CheckGlove()=='Druid'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait(3.21)end while _G.
OnAbility and CheckGlove()=='Oven'do local ap={}for aq,ar in pairs(game.Players:GetChildren())do if ar~=game.Players.
LocalPlayer and ar.Character and ar.Character:FindFirstChild('HumanoidRootPart')and ar.Character:FindFirstChild(
'Ragdolled')and not ar.Character.HumanoidRootPart:FindFirstChild('BlockedShield')and ar.Character.Ragdolled.Value==false
and ar.Character.isInArena.Value==true and notSlap(ar.Character,BlackList)then table.insert(ap,ar)end end if#ap~=0 then
local aq=ap[math.random(#ap)]game:GetService('ReplicatedStorage').GeneralAbility:FireServer(aq.Character.
HumanoidRootPart.CFrame)end task.wait()end while _G.OnAbility and CheckGlove()=='Jester'do game:GetService(
'ReplicatedStorage').GeneralAbility:FireServer('Ability1')task.wait()end while _G.OnAbility and CheckGlove()=='Ferryman'
do local ap={}for aq,ar in pairs(game.Players:GetChildren())do if ar~=game.Players.LocalPlayer and ar.Character and ar.
Character:FindFirstChild('HumanoidRootPart')and ar.Character:FindFirstChild('Ragdolled')and not ar.Character.
HumanoidRootPart:FindFirstChild('BlockedShield')and ar.Character.Ragdolled.Value==false and ar.Character.isInArena.Value
==true and notSlap(ar.Character,BlackList)then table.insert(ap,ar)end end if#ap~=0 then local aq=ap[math.random(#ap)]if
game.Players.LocalPlayer.Character:FindFirstChild('FerrymanStaff')and game.Players.LocalPlayer.Character.FerrymanStaff:
FindFirstChild('StaffConfig')and game.Players.LocalPlayer.Character.FerrymanStaff.StaffConfig:FindFirstChild(
'AbilityEvent')then game.Players.LocalPlayer.Character.FerrymanStaff.StaffConfig.AbilityEvent:FireServer('Leap')wait(
1.85)game.Players.LocalPlayer.Character.FerrymanStaff.StaffConfig.AbilityEvent:FireServer('FinishLeap',aq.Character.
HumanoidRootPart.Position)end end task.wait(5)end while _G.OnAbility and CheckGlove()=='Scythe'do game:GetService(
'ReplicatedStorage').GeneralAbility:FireServer()task.wait()end while _G.OnAbility and CheckGlove()=='Blackhole'do game:
GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait()end while _G.OnAbility and CheckGlove()==
'Jebaited'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer(game.Players.LocalPlayer.Character.
HumanoidRootPart.Position)task.wait()end while _G.OnAbility and CheckGlove()=='Blink'do game:GetService(
'ReplicatedStorage').Blink:FireServer('OutOfBody',{['dir']=Vector3.new(0,0,0),['ismoving']=false,['mousebehavior']=Enum.
MouseBehavior.Default})task.wait()end while _G.OnAbility and CheckGlove()=='Joust'do if game.Players.LocalPlayer.
Character:FindFirstChild('Humanoid')then game:GetService('ReplicatedStorage').GeneralAbility:FireServer('Start')game.
Players.LocalPlayer.Character.Humanoid.WalkSpeed=40 end task.wait()end while _G.OnAbility and CheckGlove()=='Slapstick'
do game:GetService('ReplicatedStorage').slapstick:FireServer('charge')task.wait()end while _G.OnAbility and CheckGlove()
=='Firework'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait()end while _G.OnAbility and
CheckGlove()=='Chicken'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait()end while _G.
OnAbility and CheckGlove()=='Lamp'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait()end
while _G.OnAbility and CheckGlove()=='BONK'do game:GetService('ReplicatedStorage').BONK:FireServer()task.wait()end while
_G.OnAbility and CheckGlove()=='Frostbite'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer(3,3)task.
wait()end while _G.OnAbility and CheckGlove()=='Golem'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer(
'recall')task.wait()end while _G.OnAbility and CheckGlove()=='Grab'do game:GetService('ReplicatedStorage').
GeneralAbility:FireServer()task.wait()end while _G.OnAbility and CheckGlove()=='Spoonful'do local ap={}for aq,ar in
pairs(game.Players:GetChildren())do if ar~=game.Players.LocalPlayer and ar.Character and ar.Character:FindFirstChild(
'HumanoidRootPart')and ar.Character:FindFirstChild('Ragdolled')and not ar.Character.HumanoidRootPart:FindFirstChild(
'BlockedShield')and ar.Character.Ragdolled.Value==false and ar.Character.isInArena.Value==true and notSlap(ar.Character,
BlackList)then table.insert(ap,ar)end end if#ap~=0 then local aq=ap[math.random(#ap)]game:GetService('ReplicatedStorage'
).GeneralAbility:FireServer({['state']='vfx',['origin']=aq.Character.HumanoidRootPart.CFrame*CFrame.Angles(-
3.141592502593994,1.0475832223892212,3.141592502593994),['vfx']='jumptween',['sendplr']=game:GetService('Players').
LocalPlayer})game:GetService('ReplicatedStorage').GeneralAbility:FireServer({['state']='vfx',['cf']=aq.Character.
HumanoidRootPart.CFrame*CFrame.Angles(-2.1319260597229004,0.651054859161377,2.3744168281555176),['vfx']='crash'})end
task.wait()end while _G.OnAbility and CheckGlove()=='el gato'do game:GetService('ReplicatedStorage').GeneralAbility:
FireServer()task.wait()end while _G.OnAbility and CheckGlove()=='UFO'do if game.Workspace:FindFirstChild(game.Players.
LocalPlayer.Name.."'s UFO VFX")==nil and game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s UFO")==nil
then game:GetService('ReplicatedStorage').GeneralAbility:FireServer()end task.wait(0.3)end while _G.OnAbility and
CheckGlove()=='Hive'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait()end while _G.OnAbility
and CheckGlove()=='Siphon'do local ap={}for aq,ar in pairs(game.Players:GetChildren())do if ar~=game.Players.LocalPlayer
and ar.Character and ar.Character:FindFirstChild('HumanoidRootPart')and ar.Character:FindFirstChild('Ragdolled')and not
ar.Character.HumanoidRootPart:FindFirstChild('BlockedShield')and ar.Character.Ragdolled.Value==false and ar.Character.
isInArena.Value==true and notSlap(ar.Character,BlackList)then table.insert(ap,ar)end end if#ap~=0 then local aq=ap[math.
random(#ap)]game:GetService('ReplicatedStorage').Events.Siphon:FireServer({['cf']=aq.Character.HumanoidRootPart.CFrame})
end task.wait()end while _G.OnAbility and CheckGlove()=='Demolition'do game:GetService('ReplicatedStorage').
GeneralAbility:FireServer('c4')game:GetService('ReplicatedStorage').Events.c4:FireServer()task.wait()end while _G.
OnAbility and CheckGlove()=='Shotgun'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer('buckshot')task.
wait()end while _G.OnAbility and CheckGlove()=='Beachball'do if workspace.Balls:FindFirstChild(game.Players.LocalPlayer.
Name.."'s Ball")==nil then game:GetService('ReplicatedStorage').GeneralAbility:FireServer()end wait(0.2)if workspace.
Balls:FindFirstChild(game.Players.LocalPlayer.Name.."'s Ball")then game:GetService('ReplicatedStorage').Events.BeachBall
:FireServer(workspace.Balls:FindFirstChild(game.Players.LocalPlayer.Name.."'s Ball"),Vector3.new(game:GetService(
'Workspace').CurrentCamera.CFrame.LookVector.X,0,game:GetService('Workspace').CurrentCamera.CFrame.LookVector.Z).Unit*
0.2)end task.wait()end while _G.OnAbility and CheckGlove()=='Water'do game:GetService('ReplicatedStorage').
GeneralAbility:FireServer('default')task.wait()end while _G.OnAbility and CheckGlove()=='64'do game:GetService(
'ReplicatedStorage').GeneralAbility:FireServer(game.Players.LocalPlayer.Character.Head.CFrame*CFrame.new(0,-2,0)*CFrame.
Angles(3.1415927410125732,-1.2705316543579102,3.1415927410125732))task.wait()end while _G.OnAbility and CheckGlove()==
'Fan'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait()end while _G.OnAbility and
CheckGlove()=='Shackle'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait()end while _G.
OnAbility and CheckGlove()=='Bind'do local ap={}for aq,ar in pairs(game.Players:GetChildren())do if ar~=game.Players.
LocalPlayer and ar.Character and ar.Character:FindFirstChild('HumanoidRootPart')and ar.Character:FindFirstChild(
'Ragdolled')and not ar.Character.HumanoidRootPart:FindFirstChild('BlockedShield')and ar.Character.Ragdolled.Value==false
and ar.Character.isInArena.Value==true and notSlap(ar.Character,BlackList)then table.insert(ap,ar)end end if#ap~=0 then
local aq=ap[math.random(#ap)]game:GetService('ReplicatedStorage').GeneralAbility:FireServer('default',{['goal']=aq.
Character.HumanoidRootPart.CFrame,['origin']=aq.Character.Head.CFrame})end task.wait()end while _G.OnAbility and
CheckGlove()=='Poltergeist'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer('ability2')task.wait()end
while _G.OnAbility and CheckGlove()=='Lawnmower'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer(
'lawnmower')task.wait()end while _G.OnAbility and CheckGlove()=='Virus'do game:GetService('ReplicatedStorage').
GeneralAbility:FireServer()task.wait()end while _G.OnAbility and CheckGlove()=='Baby'do game:GetService(
'ReplicatedStorage').GeneralAbility:FireServer()task.wait(8)end while _G.OnAbility and CheckGlove()=='Angler'do if game.
Players.LocalPlayer.Character:FindFirstChild('fishing_rod')then game:GetService('ReplicatedStorage').Events.Fisherman:
FireServer('cast')end task.wait()end while _G.OnAbility and CheckGlove()=='Jerry'do if game.Players.LocalPlayer.
Character:FindFirstChild('HumanoidRootPart')then game:GetService('ReplicatedStorage').GeneralAbility:FireServer(game.
Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.Angles(-3,0,-3))end task.wait()end while _G.OnAbility and
CheckGlove()=='Snowroller'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer()wait(0.3)game:GetService(
'ReplicatedStorage').GeneralAbility:FireServer('release')task.wait()end while _G.OnAbility and CheckGlove()=='Cherry'do
game:GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait()end while _G.OnAbility and CheckGlove()==
'Draw4'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait()end while _G.OnAbility and
CheckGlove()=='Mouse'do local function TrapItem(ap,aq)local ar=CFrame.new(ap.Character.HumanoidRootPart.Position.X,-5.6,
ap.Character.HumanoidRootPart.Position.Z)return{cf=ar or CFrame.new(),data={item=aq,startcf=CFrame.new(),charge=math.
huge,cf=ar or CFrame.new()}}end local ap={}for aq,ar in pairs(game.Players:GetChildren())do if ar~=game.Players.
LocalPlayer and ar.Character and ar.Character:FindFirstChild('HumanoidRootPart')and ar.Character:FindFirstChild(
'Ragdolled')and not ar.Character.HumanoidRootPart:FindFirstChild('BlockedShield')and ar.Character.Ragdolled.Value==false
and ar.Character.isInArena.Value==true and notSlap(ar.Character,BlackList)then table.insert(ap,ar)end end if#ap~=0 then
local aq=ap[math.random(#ap)]local ar=math.random(1,58)if ar>=50 then game:GetService('ReplicatedStorage'):WaitForChild(
'Events'):WaitForChild('mousetrap'):FireServer(TrapItem(aq,'mouse trap'))else game:GetService('ReplicatedStorage'):
WaitForChild('Events'):WaitForChild('mousetrap'):FireServer(TrapItem(aq,'cheese'))end end task.wait()end while _G.
OnAbility and CheckGlove()=='Agger'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait()end
while _G.OnAbility and CheckGlove()=='Debug'do game:GetService('ReplicatedStorage'):WaitForChild('Events'):WaitForChild(
'Debug'):FireServer()task.wait()end while _G.OnAbility and CheckGlove()=='Medusa'do game:GetService('ReplicatedStorage')
.GeneralAbility:FireServer(true)task.wait()end while _G.OnAbility and CheckGlove()=='Swordfighter'do game:GetService(
'ReplicatedStorage').GeneralAbility:FireServer()task.wait()end while _G.OnAbility and CheckGlove()=='Hexa'do game:
GetService('ReplicatedStorage').GeneralAbility:FireServer(true)task.wait()end while _G.OnAbility and CheckGlove()==
'Tank'do game:GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait()end while _G.OnAbility and
CheckGlove()=='Untitled Tag Glove'do game:GetService('ReplicatedStorage').UTGGeneric:FireServer('enableRunMode')for ap,
aq in pairs(game.Players:GetChildren())do if aq~=game.Players.LocalPlayer and game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')and aq.Character then if aq.Character:FindFirstChild('entered')and aq.Character:
FindFirstChild('HumanoidRootPart')and aq.Character:FindFirstChild('stevebody')==nil and aq.Character:FindFirstChild(
'rock')==nil and aq.Character.HumanoidRootPart.BrickColor~=BrickColor.new('New Yeller')and aq.Character.Ragdolled.Value
==false and aq.Character:FindFirstChild('Mirage')==nil then if(game.Players.LocalPlayer.Character.HumanoidRootPart.
Position-aq.Character.HumanoidRootPart.Position).Magnitude<=30 then game:GetService('ReplicatedStorage').UTGGeneric:
FireServer('slideStun',aq.Character)end end end end task.wait()end while _G.OnAbility and CheckGlove()=='Killstreak'and
game.Players.LocalPlayer.Character:FindFirstChild('KS250Complete')do if game.Players.LocalPlayer.Character:
FindFirstChild('KS250Complete')then game:GetService('ReplicatedStorage').TheForce:FireServer()for ap,aq in pairs(game.
Workspace:GetChildren())do if aq.Name=='Part'then aq:Destroy()end end end task.wait()end end}):AddKeyPicker(
'SpamAbility',{Default='B',Text='Auto Spam Ability',Mode='Toggle',SyncToggleState=true})W:AddToggle('Method Glove',{Text
='Method Glove',Tooltip='Method: Glovel, Charge, Golden, Psython, Stalker, Frostbite',Default=false,Callback=function(ao
)if ao and CheckExecutorSupport and not CheckExecutorSupport('namecall_hook','Method Glove')then MethodGlove=false
return end MethodGlove=ao if getgenv().RefreshSlapNamecallHook then getgenv().RefreshSlapNamecallHook()end while
MethodGlove do if EquipGlove~=CheckGlove()then EquipGlove=CheckGlove()end task.wait()end end})W:AddToggle(
'Show Button Roll',{Text='Show Button Roll (Custom)',Default=false,Callback=function(ao)ShowButtonU(ao)end})W:AddToggle(
'Show Gui Mastery',{Text='Show Gui Mastery (Custom)',Default=false,Callback=function(ao)ShowMasteryGui(ao)end})W:
AddSlider('Delay Cooldown',{Text='Delay No Cooldown',Default=0.1,Min=0.1,Max=0.9,Rounding=1,Compact=true,Callback=
function(ao)_G.DelayCooldown=ao end})W:AddToggle('No Cooldown',{Text='No Cooldown',Default=false,Callback=function(ao)_G
.NoCooldown=ao while _G.NoCooldown do local ap=(game.Players.LocalPlayer.Character and game.Players.LocalPlayer.
Character:FindFirstChildOfClass('Tool'))or game.Players.LocalPlayer.Backpack:FindFirstChildOfClass('Tool')local aq=ap
and ap:FindFirstChild('Glove')local ar=aq and ap and ap:FindFirstChildOfClass('LocalScript')if ar then local as=ar:
Clone()ar:Destroy()as.Parent=ap end task.wait(_G.DelayCooldown or 0.1)end end})W:AddToggle('Infinite Rhythm',{Text=
'Infinite Rhythm',Default=false,Callback=function(ao)_G.RhythmNoteSpam=ao if CheckGlove()=='Rhythm'then while _G.
RhythmNoteSpam do game.Players.LocalPlayer.PlayerGui.Rhythm.LocalScript.Disabled=false game.Players.LocalPlayer.
PlayerGui.Rhythm.LocalScript.Disabled=true game.Players.LocalPlayer.Character.Rhythm:Activate()task.wait()end elseif ao
==true then Notification("You don't have Rhythm equipped",_G.TimeNotify)wait(0.05)g['Infinite Rhythm']:SetValue(false)
end end})W:AddToggle('Auto Fix Generator',{Text='Auto Fix Generator (Shopkeeper)',Default=false,Callback=function(ao)_G.
AutoFixGenerator=ao if CheckGlove()=='Shopkeeper'then while _G.AutoFixGenerator do local ap=workspace:FindFirstChild(
game.Players.LocalPlayer.Name..'_shop')local aq=ap and ap:FindFirstChild('shop_model',true)local ar=aq and aq:
FindFirstChild('FixTheGenerator',true)local as=false if ar and ar.Parent then for at,au in pairs(ar.Parent:GetChildren()
)do if au.Name:lower():find('smoke')then as=true end end if fireproximityprompt and as then fireproximityprompt(ar,0)
fireproximityprompt(ar,1)end end task.wait(0.54)end elseif ao==true then Notification(
"You don't have Shopkeeper equipped",_G.TimeNotify)wait(0.05)g['Auto Fix Generator']:SetValue(false)end end})W:
AddDropdown('Aimbot',{Text='Aimbot',Values={'Shard','Horse','Retro (Rocket Launcher)','Scythe','Tableflip','Slasher',
'G-X'},Default='',Multi=false,Callback=function(ao)_G.AimbotGlove=ao end})W:AddDropdown('AimbotCharacter',{Text=
'Aimbot Character',Values={'Character','Camera'},Default='Character',Multi=false,Callback=function(ao)_G.AimbotCharacter
=ao end})W:AddToggle('Aimbot',{Text='Aimbot',Default=false,Callback=function(ao)_G.Aimbot=ao end})_G.SharpnessAimbot=0 W
:AddSlider('Sharpness',{Text='Sharpness Aimbot',Default=0,Min=0,Max=10,Rounding=0,Compact=true,Callback=function(ao)_G.
SharpnessAimbot=ao end})W:AddToggle('No Aimbot',{Text='No Aimbot Friends',Default=false,Callback=function(ao)_G.
AimbotNoFriends=ao end})function Aimbot(ao,ap)local aq=game.Players.LocalPlayer.Character if not aq then return end
local ar=aq:FindFirstChild('HumanoidRootPart')if not ar then return end local as=workspace.CurrentCamera local at=ao.
AssemblyLinearVelocity local au=ao.Position+(at*ap)if _G.AimbotCharacter=='Camera'then as.CFrame=CFrame.lookAt(as.CFrame
.Position,au)else ar.CFrame=CFrame.lookAt(ar.Position,Vector3.new(au.X,ar.Position.Y,au.Z))end end function
foundShardYourself()local ao for ap,aq in pairs(workspace:GetChildren())do if aq.Name:lower():find(game.Players.
LocalPlayer.Name:lower()..' sky sh\u{e5}rd')then ao=aq end end return ao end function aimbotTarget()local ao,ap,aq=math.
huge for ar,as in pairs(game.Players:GetChildren())do if as~=game.Players.LocalPlayer and game.Players.LocalPlayer.
Character:FindFirstChild('HumanoidRootPart')and as.Character then if as.Character:FindFirstChild('entered')and as.
Character:FindFirstChild('HumanoidRootPart')and as.Character:FindFirstChild('stevebody')==nil and as.Character:
FindFirstChild('rock')==nil and as.Character.HumanoidRootPart.BrickColor~=BrickColor.new('New Yeller')and as.Character:
FindFirstChild('Mirage')==nil then if as.Character.Head:FindFirstChild('UnoReverseCard')==nil and as:FindFirstChild(
'leaderstats'):FindFirstChild('Glove')and as.leaderstats.Glove.Value:lower()~='parry'then local at=(game.Players.
LocalPlayer.Character.HumanoidRootPart.Position-as.Character.HumanoidRootPart.Position).Magnitude if at and at<=ao then
if not _G.AimbotNoFriends or not game.Players.LocalPlayer:IsFriendsWith(as.UserId)then ap,aq,ao=as.Character,as.
Character:FindFirstChild('HumanoidRootPart'),at end end end end end end return ap,aq,ao end spawn(function()table.
insert(_G.ConnectFun,game:GetService('RunService').Heartbeat:Connect(function()if not _G.Aimbot then return end local ao
=game.Players.LocalPlayer.Character if not ao then return end local ap=ao:FindFirstChild('HumanoidRootPart')local aq=ao:
FindFirstChild('Humanoid')local ar=aq and aq:FindFirstChildOfClass('Animator')local as,at,au=aimbotTarget()local av if
ap and at then if ao and not ao:FindFirstChild('stevebody')and not ao:FindFirstChild('rock')and ao:FindFirstChild(
'Ragdolled')and not ao.Ragdolled.Value then if _G.AimbotGlove=='Horse'and CheckGlove():lower():find('horse')then if(ao:
FindFirstChild('Horse')and ao.Horse:FindFirstChild('RootPart'))or ao:FindFirstChild('Lance')then av=true end end if _G.
AimbotGlove=='Shard'and CheckGlove():lower():find('shard')then local aw=foundShardYourself()if aw then av=true end end
if _G.AimbotGlove=='Retro (Rocket Launcher)'and CheckGlove():lower():find('retro')then if ao:FindFirstChild(
'Rocket Launcher')then av=true end end if(_G.AimbotGlove=='Scythe'and CheckGlove():lower():find('scythe'))or(_G.
AimbotGlove=='Slasher'and CheckGlove():lower():find('slasher'))or(_G.AimbotGlove=='G-X'and CheckGlove():lower():find(
'g-x'))then if ar then for aw,ax in ipairs(ar:GetPlayingAnimationTracks())do local ay=ax.Animation.AnimationId:match(
'%d+')if _G.AimbotGlove=='Scythe'and CheckGlove():lower():find('scythe')then if ay:find('15505686151')then av=true end
end if _G.AimbotGlove=='G-X'and CheckGlove():lower():find('g-x')then if ay:find('102526718788106')then av=true end end
if _G.AimbotGlove=='Slasher'and CheckGlove():lower():find('slasher')then if(ay:find('123476113915973')or ay:find(
'79720215321255'))and not ay:find('136125547655440')then av=true end end end end end if _G.AimbotGlove=='Tableflip'and
CheckGlove():lower():find('tableflip')then for aw,ax in pairs(workspace:GetChildren())do if ax.Name:lower():find(
'tableobject')and ax:FindFirstChild('TableOwner')and ax.TableOwner.Value:find(game.Players.LocalPlayer.Name)then if(ap.
Position-ax.Position).Magnitude<=7 then av=true break end end end end if av and at then if _G.AimbotCharacter~='Camera'
then if not AutoRotate and aq then AutoRotate=aq.AutoRotate aq.AutoRotate=false end end Aimbot(at,_G.SharpnessAimbot)
else if AutoRotate and aq then aq.AutoRotate=AutoRotate AutoRotate=nil end end end end end))end)W:AddSlider(
'Parry Range',{Text='Range Parry (Distance)',Default=15,Min=10,Max=35,Rounding=1,Compact=true,Callback=function(ao)_G.
RangeParry=ao end})W:AddToggle('Direction check',{Text='Direction Check',Default=false,Callback=function(ao)_G.
DirectionCheck=ao end})local ao=game:GetService('Players')W:AddToggle('Auto Parry',{Text='Auto Parry (Block)',Default=
false,Callback=function(ap)if CheckGlove()=='Parry'then _G.AutoParry=ap if ap then for aq,ar in pairs(ao:GetPlayers())do
if ar~=ao.LocalPlayer then SetupPlayer(ar)end end end elseif ap==true then Notification("You don't have Parry equipped",
_G.TimeNotify)wait(0.05)g['Auto Parry']:SetValue(false)end end})W:AddToggle('Auto Counter',{Text='Auto Counter',Default=
false,Callback=function(ap)if CheckGlove()=='Counter'then _G.AutoCounter=ap if ap then for aq,ar in pairs(ao:GetPlayers(
))do if ar~=ao.LocalPlayer then SetupPlayer(ar)end end end elseif ap==true then Notification(
"You don't have Counter equipped",_G.TimeNotify)wait(0.05)g['Auto Counter']:SetValue(false)end end})spawn(function()
local function SetupCharacter(ap,aq)local ar=aq:WaitForChild('Humanoid')local as=ar:WaitForChild('Animator')as.
AnimationPlayed:Connect(function(at)if not(_G.AutoParry or _G.AutoCounter)then return end if CheckGlove()~='Parry'and
CheckGlove()~='Counter'then return end if aq:FindFirstChild('entered')and aq:FindFirstChild('HumanoidRootPart')and aq:
FindFirstChild('stevebody')==nil and aq:FindFirstChild('rock')==nil and aq.HumanoidRootPart.BrickColor~=BrickColor.new(
'New Yeller')and aq:FindFirstChild('Mirage')==nil then if aq.Head:FindFirstChild('UnoReverseCard')==nil then local au=aq
:FindFirstChild('HumanoidRootPart')local av=game.Players.LocalPlayer.Character.HumanoidRootPart local aw=(au.Position-av
.Position).Unit local ax=av.CFrame.LookVector:Dot(aw)if AnimationSlapHit[tostring(at.Animation.AnimationId):match('%d+')
]and(not _G.DirectionCheck or ax>0.3)then if(av.Position-(au.Position+au.Velocity*0.12)).Magnitude<=(_G.RangeParry or 18
)then task.spawn(function()if CheckGlove()=='Parry'then game:GetService('ReplicatedStorage').GeneralAbility:FireServer()
end if CheckGlove()=='Counter'then game:GetService('ReplicatedStorage'):WaitForChild('Counter'):FireServer()end if game.
Players.LocalPlayer.Backpack:FindFirstChild(CheckGlove())then game.Players.LocalPlayer.Character.Humanoid:EquipTool(game
.Players.LocalPlayer.Backpack:FindFirstChild(CheckGlove()))end end)end end end end end)end function SetupPlayer(ap)ap.
CharacterAdded:Connect(function(aq)SetupCharacter(ap,aq)end)if ap.Character then SetupCharacter(ap,ap.Character)end end
for ap,aq in pairs(ao:GetPlayers())do if aq~=ao.LocalPlayer then SetupPlayer(aq)end end ao.PlayerAdded:Connect(function(
ap)if ap~=ao.LocalPlayer then SetupPlayer(ap)end end)table.insert(_G.ConnectFun,game:GetService('RunService').Heartbeat:
Connect(function()if not _G.AutoParry or not _G.AutoCounter then return end if CheckGlove()~='Parry'or CheckGlove()~=
'Counter'then return end if not game.Players.LocalPlayer.Character or not game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')then return end local ap for aq,ar in pairs(game.Players:GetChildren())do if ar~=game.
Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and ar.Character then local
as=ar.Character:FindFirstChild('HumanoidRootPart')local at=game.Players.LocalPlayer.Character.HumanoidRootPart local au=
at and as and(as.Position-at.Position).Unit local av=at and au and at.CFrame.LookVector:Dot(au)local aw=ar.Character:
FindFirstChild(ar.leaderstats.Glove.Value)and ar.Character[ar.leaderstats.Glove.Value]:FindFirstChild('Glove')if aw and
ar.leaderstats.Glove.Value:lower()=='overkill'and av and av>0.3 then if(at.Position-(as.Position+as.Velocity*0.12)).
Magnitude<=(_G.RangeParry or 18)then if CheckGlove()=='Parry'then game:GetService('ReplicatedStorage').GeneralAbility:
FireServer()end if CheckGlove()=='Counter'then game:GetService('ReplicatedStorage'):WaitForChild('Counter'):FireServer()
end if game.Players.LocalPlayer.Backpack:FindFirstChild(CheckGlove())then game.Players.LocalPlayer.Character.Humanoid:
EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(CheckGlove()))end end end if at and as and ar.Character:
FindFirstChild('entered')and ar.Character:FindFirstChild('HumanoidRootPart')and ar.Character:FindFirstChild('stevebody')
==nil and ar.Character:FindFirstChild('rock')==nil and as.BrickColor~=BrickColor.new('New Yeller')and ar.Character.
Ragdolled.Value==false and ar.Character:FindFirstChild('Mirage')==nil then if(ar.Character:FindFirstChild('Horse')and ar
.Character.Horse:FindFirstChild('RootPart'))or ar.Character:FindFirstChild('Lance')then if ar.Character:FindFirstChild(
'Lance')then ap=(at.Position-ar.Character:FindFirstChild('Lance').Position).Magnitude else ap=(at.Position-ar.Character.
Horse:FindFirstChild('RootPart').Position).Magnitude end if tonumber(ap)and ap<=(_G.RangeParry or 20)then if _G.
AutoParry then if CheckGlove()=='Parry'then game:GetService('ReplicatedStorage'):WaitForChild('Counter'):FireServer()end
if game.Players.LocalPlayer.Backpack:FindFirstChild(CheckGlove())then game.Players.LocalPlayer.Character.Humanoid:
EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(CheckGlove()))end end end end end end end for aq,ar in pairs(
workspace:GetChildren())do if ar.Name:match('Slicer_Hitbox')then if(game.Players.LocalPlayer.Character.HumanoidRootPart.
Position-ar.Position).Magnitude<=18 then if game.Players.LocalPlayer.Backpack:FindFirstChild(CheckGlove())then game.
Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(CheckGlove()))end game
:GetService('ReplicatedStorage').GeneralAbility:FireServer()end end end end))end)W:AddToggle('Auto Play Rhythm',{Text=
'Auto Play Rhythm',Default=false,Callback=function(ap)if CheckGlove()~='Rhythm'and ap==true then Notification(
"You don't have Rhythm equipped",_G.TimeNotify)wait(0.05)g['Infinite Rhythm']:SetValue(false)end end})local ap={}table.
insert(_G.ConnectFun,game:GetService('RunService').Heartbeat:Connect(function()if not g['Auto Play Rhythm']or not g[
'Auto Play Rhythm'].Value then return end local aq=game.Players.LocalPlayer.PlayerGui:FindFirstChild('Rhythm')local ar=(
aq and aq:FindFirstChild('MainFrame'))if not ar then return end local as=ar:FindFirstChild('Pointer')local at=ar:
FindFirstChild('Bars')if not as or not at then return end for au,av in ipairs(at:GetChildren())do if av:IsA('Frame')and
av.Name~='BarHit'then local aw=av:GetDebugId(5)local ax,ay=as.AbsolutePosition,as.AbsoluteSize local az,aA=av.
AbsolutePosition,av.AbsoluteSize local aB=not(ax.X+ay.X<az.X or ax.X>az.X+aA.X or ax.Y+ay.Y<az.Y or ax.Y>az.Y+aA.Y)if aB
and not ap[aw]then ap[aw]=true if game.Players.LocalPlayer.Character:FindFirstChild('Rhythm')then game.Players.
LocalPlayer.Character:FindFirstChild('Rhythm'):Activate()end elseif not aB then ap[aw]=false end end end end))W:
AddButton('Get All Sword',function()if CheckGlove()=='Swordfighter'then for aq,ar in pairs({'Ice Dagger','Darkheart',
'Ghostwalker','Venomshank','Windforce','Illumina','Firebrand'})do game:GetService('ReplicatedStorage').Events.swordevent
:FireServer('AddSword',ar)end else Notification("You don't have Swordfighter equipped",_G.TimeNotify)end end)W:
AddToggle('Auto Slap Cherry',{Text='Auto Cherry Fast',Default=false,Callback=function(aq)_G.AutoSlapCherry=aq if
CheckGlove()=='Cherry'then while _G.AutoSlapCherry do if workspace:FindFirstChild('cherry_storage')then for ar,as in
pairs(workspace.cherry_storage:GetChildren())do if as.Name:match(game.Players.LocalPlayer.Name)and as:FindFirstChild(
'clone_remote')then as.clone_remote:FireServer()end end end task.wait()end elseif _G.AutoSlapCherry==true then
Notification("You don't have Cherry equipped",_G.TimeNotify)wait(0.05)g['Auto Slap Cherry']:SetValue(false)end end})W:
AddToggle('Auto 5 More Fast',{Text='Auto 5 More Fast',Default=false,Callback=function(aq)_G.AutoSlapFiveMore=aq if
CheckGlove()=='5 More'then while _G.AutoSlapFiveMore do if workspace:FindFirstChild(game.Players.LocalPlayer.Name..
'_More')then for ar,as in pairs(workspace:FindFirstChild(game.Players.LocalPlayer.Name..'_More'):GetChildren())do if as:
IsA('Model')then game:GetService('ReplicatedStorage'):WaitForChild('Events'):WaitForChild('fivemore'):FireServer()end
end end task.wait()end elseif _G.AutoSlapCherry==true then Notification("You don't have 5 More equipped",_G.TimeNotify)
wait(0.05)g['Auto 5 More Fast']:SetValue(false)end end})W:AddToggle('Free Emote',{Text='Free Emote',Default=false,
Callback=function(aq)Animation(aq)end})W:AddDropdown('ArenaEnter',{Text='Enter',Values={'Arena','Arena Default'},Default
='',Multi=false,Callback=function(aq)_G.AutoEnter=aq end})W:AddToggle('Auto Enter',{Text='Auto Enter',Default=false,
Callback=function(aq)_G.AutoEnterJoin=aq while _G.AutoEnterJoin do if _G.AutoEnter=='Arena'then EnterPo=workspace.Lobby:
FindFirstChild('Teleport1')elseif _G.AutoEnter=='Arena Default'then EnterPo=workspace.Lobby:FindFirstChild('Teleport2')
end if EnterPo then if game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.
Character:FindFirstChild('HumanoidRootPart')then repeat task.wait()if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,EnterPo,0)
firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,EnterPo,1)end until game.Players.LocalPlayer.
Character:FindFirstChild('entered')end end task.wait()end end})_G.SlapAuraCharacter='HumanoidRootPart'_G.ReachSlapArua=
25 _G.DelaySlapArua=0.35 _G.SlapAuraFriend='Fight'_G.SlapAuraChoose='Normal'_G.WidthHitbox=15 _G.LengthHitbox=10 W:
AddSlider('Reach Aura',{Text='Reach Slap Aura',Default=25,Min=10,Max=400,Rounding=0,Compact=true,Callback=function(aq)_G.
ReachSlapArua=aq end})W:AddSlider('Delay Aura',{Text='Delay Slap Aura',Default=0.75,Min=0.35,Max=1,Rounding=2,Compact=
true,Callback=function(aq)_G.DelaySlapArua=aq end})W:AddDropdown('Slap Friend',{Text='Slap Aura Friend',Values={'Fight',
'Not Fight'},Default='Fight',Multi=false,Callback=function(aq)_G.SlapAuraFriend=aq end})W:AddDropdown('ChooseCharacter',
{Text='Slap Aura Character',Values={'HumanoidRootPart','Head','Left Arm','Left Leg','Right Arm','Right Leg'},Default=
'HumanoidRootPart',Multi=false,Callback=function(aq)_G.SlapAuraCharacter=aq end})W:AddDropdown('Slap Aura Choose',{Text=
'Slap Aura Choose',Values={'Normal','Target','Reverse','Hitbox'},Default='Normal',Multi=false,Callback=function(aq)_G.
SlapAuraChoose=aq end})local aq=W:AddDependencyBox()aq:SetupDependencies({{f['Slap Aura Choose'],'Hitbox'}})aq:
AddDivider()aq:AddSlider('Width Hitbox',{Text='Width Hitbox',Default=15,Min=10,Max=30,Rounding=0,Compact=true,Callback=
function(ar)_G.WidthHitbox=ar end})aq:AddSlider('Length Hitbox',{Text='Length Hitbox',Default=10,Min=10,Max=30,Rounding=
0,Compact=true,Callback=function(ar)_G.LengthHitbox=ar end})aq:AddDivider()function checkRagdollBaseFake(ar)for as,at in
pairs(ar:GetChildren())do if at:IsA('BasePart')and at.Name:lower():find('fake')then return false end end return true end
function SlapHitbox()local ar=game.Players.LocalPlayer local as=ar.Character local at=as and as:FindFirstChild(
'HumanoidRootPart')if not at then return end local au=as:FindFirstChildOfClass('Tool')local av=au and au:FindFirstChild(
'Glove')if not(au and av)then return end local aw=av.Position local ax=CFrame.new(at.Position,at.Position+at.CFrame.
LookVector)local ay=-(_G.LengthHitbox/2)-1 local az=CFrame.new(aw)*ax.Rotation*CFrame.new(0,0,ay)local aA=Create('Part',
{Name='SlapZone',Size=Vector3.new(_G.WidthHitbox,8,_G.LengthHitbox),Anchored=true,CanCollide=false,CanTouch=false,
CanQuery=false,Material=Enum.Material.ForceField,Transparency=0.5,Color=Color3.fromRGB(255,0,0),CFrame=az,Parent=
workspace})local aB=false if workspace:FindFirstChild('cherry_storage')then for aC,aD in pairs(workspace.cherry_storage:
GetChildren())do if string.find(aD.Name,'Cherry')and aD:FindFirstChild('HumanoidRootPart')then if InsideBox(aD.
HumanoidRootPart,aA)then aB=true slapglove(aD.HumanoidRootPart)end end end end for aC,aD in pairs(workspace:GetChildren(
))do if string.find(aD.Name,'\u{c5}')and aD:FindFirstChild('HumanoidRootPart')then if InsideBox(aD.HumanoidRootPart,aA)
then aB=true slapglove(aD.HumanoidRootPart)end end if aD.Name=='Balls'then for aE,aF in pairs(aD:GetChildren())do if
string.find(aF.Name,"'s Ball")then if InsideBox(aF,aA)then aB=true slapglove(aF)end end end end end if not aB then for
aC,aD in pairs(game.Players:GetPlayers())do if aD~=ar and aD.Character and aD.Character:FindFirstChild(
'HumanoidRootPart')then local aE=aD.Character if aE:FindFirstChild('entered')and aE:FindFirstChild('Humanoid')and aE:
FindFirstChild('Ragdolled')and notSlap(aE,BlackList)and aE.HumanoidRootPart.BrickColor~=BrickColor.new('New Yeller')and(
aE.Ragdolled.Value==false or checkRagdollBaseFake(aE))then if aE.Head:FindFirstChild('UnoReverseCard')==nil or
CheckGlove()=='Error'then if aE.Humanoid.Health>0 then if InsideBox(aE.HumanoidRootPart,aA)then aB=true slapglove(aE.
HumanoidRootPart)break end end end end end end end if aB then aA.Color=Color3.fromRGB(0,255,0)else aA.Color=Color3.
fromRGB(255,0,0)end task.delay(0.45,function()if aA then aA:Destroy()end end)return aB end local ar=false local function 
IsSlapping(as)local at=as:GetPlayingAnimationTracks()for au,av in pairs(at)do local aw=tostring(av.Animation.AnimationId
):match('%d+')if AnimationSlapHit[aw]and av.TimePosition<0.75 then return true end end return false end table.insert(_G.
ConnectFun,game:GetService('RunService').Heartbeat:Connect(function()if not(_G.SlapAura and _G.SlapAuraChoose=='Hitbox')
then return end local as=game.Players.LocalPlayer local at=as.Character local au=at and at:FindFirstChildOfClass(
'Humanoid')local av=at and at:FindFirstChild('Ragdolled')if not at or not au then return end local aw=at:
FindFirstChildOfClass('Tool')if aw and aw:FindFirstChild('Glove')then if aw:GetAttribute('CustomActivatedEnabled')then
return end aw:SetAttribute('CustomActivatedEnabled',true)local ax=game:GetService('UserInputService')local ay ay=ax.
InputBegan:Connect(function(az,aA)if aA then return end if az.UserInputType==Enum.UserInputType.MouseButton1 or az.
UserInputType==Enum.UserInputType.Touch then if aw.Parent==at and not ar then task.wait(0.05)if IsSlapping(au)then ar=
true task.spawn(function()while aw.Parent==at and IsSlapping(au)and av and not av.Value and(_G.SlapAura and _G.
SlapAuraChoose=='Hitbox')do local aB=SlapHitbox()if aB then break end task.wait()end ar=false end)end end end end)aw.
Unequipped:Connect(function()aw:SetAttribute('CustomActivatedEnabled',nil)if ay then ay:Disconnect()end ar=false end)end
end))W:AddToggle('Slap Aura',{Text='Slap Aura',Default=false,Callback=function(as)_G.SlapAura=as task.spawn(function()
while _G.SlapAura do local function PlayerTarget(at)local au for av,aw in pairs(game.Players:GetChildren())do if aw~=
game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and aw.Character then
if aw.Character:FindFirstChild('entered')and aw.Character:FindFirstChild('HumanoidRootPart')and aw.Character:
FindFirstChild('Ragdolled')and aw.Character.HumanoidRootPart.BrickColor~=BrickColor.new('New Yeller')and notSlap(aw.
Character,BlackList)and(tonumber(_G.DelaySlapArua)>0.7 or(aw.Character.Ragdolled.Value==false or checkRagdollBaseFake(aw
.Character)))then if aw.Character.Head:FindFirstChild('UnoReverseCard')==nil or CheckGlove()=='Error'then if _G.
ReachSlapArua>=(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-aw.Character.HumanoidRootPart.Position).
Magnitude then if _G.SlapAuraFriend=='Fight'or(_G.SlapAuraFriend=='Not Fight'and not game.Players.LocalPlayer:
IsFriendsWith(aw.UserId))then au=aw.Character:WaitForChild(_G.SlapAuraCharacter)if at and au then slapglove(au)end end
end end end end end return au end if _G.SlapAuraChoose=='Target'then local at=PlayerTarget(false)if at then slapglove(at
)end elseif _G.SlapAuraChoose=='Normal'then PlayerTarget(true)end task.wait(tonumber(_G.DelaySlapArua)or 0.05)end end)
while _G.SlapAura do if _G.SlapAuraChoose=='Normal'then if workspace:FindFirstChild('cherry_storage')then for at,au in
pairs(workspace.cherry_storage:GetChildren())do if string.find(au.Name,'Cherry')and au:FindFirstChild('HumanoidRootPart'
)then if _G.ReachSlapArua>=(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-au.HumanoidRootPart.Position).
Magnitude then slapglove(au:WaitForChild(_G.SlapAuraCharacter))end end end end for at,au in pairs(workspace:GetChildren(
))do if string.find(au.Name,'\u{c5}')and au:FindFirstChild('HumanoidRootPart')then if _G.ReachSlapArua>=(game.Players.
LocalPlayer.Character.HumanoidRootPart.Position-au.HumanoidRootPart.Position).Magnitude then slapglove(au:WaitForChild(
_G.SlapAuraCharacter))end end if au.Name=='Balls'then for av,aw in pairs(au:GetChildren())do if string.find(aw.Name,
"'s Ball")then if _G.ReachSlapArua>=(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-aw.Position).Magnitude
then game:GetService('ReplicatedStorage').Events.BeachBall:FireServer(aw,Vector3.new(game:GetService('Workspace').
CurrentCamera.CFrame.LookVector.X,0,game:GetService('Workspace').CurrentCamera.CFrame.LookVector.Z).Unit*0.2)end end end
end end elseif _G.SlapAuraChoose=='Reverse'then if CheckGlove()=='Reverse'then for at,au in pairs(game.Players:
GetChildren())do if au~=game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')and au.Character then if au.Character:FindFirstChild('entered')and au.Character:FindFirstChild(
'HumanoidRootPart')and au.Character.HumanoidRootPart.BrickColor~=BrickColor.new('New Yeller')and au.Character.Ragdolled.
Value==false and notSlap(targetChar,{'stevebody','rock','Counterd','Mirage'})then if au.Character.Head:FindFirstChild(
'UnoReverseCard')and game.Players.LocalPlayer.Character.Head:FindFirstChild('UnoReverseCard')then if _G.ReachSlapArua>=(
game.Players.LocalPlayer.Character.HumanoidRootPart.Position-au.Character.HumanoidRootPart.Position).Magnitude then if
_G.SlapAuraFriend=='Fight'or(_G.SlapAuraFriend=='Not Fight'and not game.Players.LocalPlayer:IsFriendsWith(au.UserId))
then slapglove(au.Character:WaitForChild(_G.SlapAuraCharacter))end end end end end end end end task.wait()end end}):
AddKeyPicker('SlapAura',{Default='H',Text='Slap Aura',Mode='Toggle',SyncToggleState=true})_G.ReachShukuchi=50 _G.
ShukuchiFriend='Fight'W:AddSlider('Reach Shukuchi',{Text='Reach Shukuchi',Default=50,Min=1,Max=130,Rounding=0,Compact=
true,Callback=function(as)_G.ReachShukuchi=as end})W:AddDropdown('Shukuchi Friend',{Text='Shukuchi Friend',Values={
'Fight','Not Fight'},Default='Fight',Multi=false,Callback=function(as)_G.ShukuchiFriend=as end})W:AddToggle(
'Auto Shukuchi Player',{Text='Auto Shukuchi Player',Default=false,Callback=function(as)_G.AutoShukuchi=as if CheckGlove(
)=='Shukuchi'then while _G.AutoShukuchi do for at,au in pairs(game.Players:GetChildren())do if au~=game.Players.
LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and au.Character then if au.
Character:FindFirstChild('entered')and au.Character:FindFirstChild('HumanoidRootPart')and au.Character.HumanoidRootPart.
BrickColor~=BrickColor.new('New Yeller')and au.Character.Ragdolled.Value==false and notSlap(au.Character,BlackList)then
if _G.ReachSlapArua>=(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-au.Character.HumanoidRootPart.
Position).Magnitude then if _G.ShukuchiFriend=='Fight'or(_G.ShukuchiFriend=='Not Fight'and not game.Players.LocalPlayer:
IsFriendsWith(au.UserId))then game:GetService('ReplicatedStorage').SM:FireServer(au)end end end end end task.wait()end
elseif _G.AutoShukuchi==true then Notification("You don't have Shukuchi equipped.",_G.TimeNotify)wait(0.05)g[
'Auto Shukuchi Player']:SetValue(false)end end})_G.ReachHitbox=10 W:AddSlider('Reach HitBox',{Text='Reach Hitbox',
Default=10,Min=4,Max=30,Rounding=0,Compact=true,Callback=function(as)_G.ReachHitbox=as end})W:AddToggle(
'Hitbox Player Mod',{Text='Hitbox Player & Mod,',Default=false,Callback=function(as)_G.HitboxPlayer=as while _G.
HitboxPlayer do for at,au in pairs(game.Players:GetChildren())do if au~=game.Players.LocalPlayer and game.Players.
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and au.Character and au.Character:FindFirstChild(
'HumanoidRootPart')then local av=(au.Character:FindFirstChild('Humanoid')and au.Character:FindFirstChild('Humanoid').Sit
and au.Character:FindFirstChild('Humanoid').SeatPart)or nil local aw=game.Players.LocalPlayer.Character.HumanoidRootPart
:FindFirstChild('LeashRope')local ax if aw and aw.Attachment1 then ax=game.Players:GetPlayerFromCharacter(aw.Attachment1
:FindFirstAncestorOfClass('Model'))end if not au.Character:FindFirstChild('Horse')and notSlap(au.Character,BlackList)and
ax~=au and not av then au.Character.HumanoidRootPart.Size=Vector3.new(_G.ReachHitbox,_G.ReachHitbox,_G.ReachHitbox)au.
Character.HumanoidRootPart.Transparency=0.75 else au.Character.HumanoidRootPart.Size=Vector3.new(2,2,1)au.Character.
HumanoidRootPart.Transparency=1 end end end for at,au in pairs(workspace:GetChildren())do if string.find(au.Name,
'\u{c5}')and au:FindFirstChild('HumanoidRootPart')then au.HumanoidRootPart.Size=Vector3.new(_G.ReachHitbox,_G.
ReachHitbox,_G.ReachHitbox)au.HumanoidRootPart.Transparency=0.75 end end task.wait()end if _G.HitboxPlayer==false then
for at,au in pairs(game.Players:GetChildren())do if au~=game.Players.LocalPlayer and au.Character and au.Character:
FindFirstChild('HumanoidRootPart')then au.Character.HumanoidRootPart.Size=Vector3.new(2,2,1)au.Character.
HumanoidRootPart.Transparency=1 end end for at,au in pairs(workspace:GetChildren())do if string.find(au.Name,'\u{c5}')
and au:FindFirstChild('HumanoidRootPart')then au.HumanoidRootPart.Size=Vector3.new(2,2,1)au.HumanoidRootPart.
Transparency=1 end end end end}):AddKeyPicker('Hitbox',{Default='Z',Text='Hitbox Player & Mod',Mode='Toggle',
SyncToggleState=true})_G.GloveExtendReach=5 W:AddSlider('Extend Glove',{Text='Extend Glove',Default=5,Min=2,Max=20,
Rounding=0,Compact=true,Callback=function(as)_G.GloveExtendReach=as end})W:AddDropdown('Extend Option',{Text=
'Extend Option',Values={'Meat Stick','Pancake','Growth','North Korea Wall','Slight Extend'},Default='',Multi=false,
Callback=function(as)GloveExtendOption=as end})W:AddToggle('Extend Glove',{Text='Extend Glove',Default=false,Callback=
function(as)_G.GloveExtendGet=as if _G.GloveExtendGet==false then local function GloveOff(at)if at:IsA('Tool')and at:
FindFirstChild('Glove')then at:FindFirstChild('Glove').Size=Vector3.new(2.5,2.5,1.7)at:FindFirstChild('Glove').
Transparency=0 end end for at,au in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do GloveOff(au)end for at,au
in pairs(game.Players.LocalPlayer.Character:GetChildren())do GloveOff(au)end end while _G.GloveExtendGet do local 
function GloveReachOn(at)if at.ClassName=='Tool'and at:FindFirstChild('Glove')then if GloveExtendOption=='Meat Stick'
then GloveReachTo=Vector3.new(0,_G.GloveExtendReach,2)elseif GloveExtendOption=='Pancake'then GloveReachTo=Vector3.new(0
,_G.GloveExtendReach,_G.GloveExtendReach)elseif GloveExtendOption=='Growth'then GloveReachTo=Vector3.new(_G.
GloveExtendReach,_G.GloveExtendReach,_G.GloveExtendReach)elseif GloveExtendOption=='North Korea Wall'then GloveReachTo=
Vector3.new(_G.GloveExtendReach,0,_G.GloveExtendReach)elseif GloveExtendOption=='Slight Extend'then GloveReachTo=Vector3
.new(_G.GloveExtendReach,_G.GloveExtendReach,tonumber(_G.GloveExtendReach..'.7'))end if GloveReachTo then at:
FindFirstChild('Glove').Size=GloveReachTo end end end for at,au in pairs(game.Players.LocalPlayer.Backpack:GetChildren()
)do GloveReachOn(au)end for at,au in pairs(game.Players.LocalPlayer.Character:GetChildren())do GloveReachOn(au)end task.
wait()end end}):AddKeyPicker('ExtendGlove',{Default='C',Text='Extend Glove',Mode='Toggle',SyncToggleState=true})W:
AddInput('Auto Change Nametag',{Default='Change Nametag...',Numeric=false,Text='Change Name',Placeholder='Change',
Callback=function(as)_G.FakeName=as end})W:AddToggle('NameTag',{Text='Auto Set NameTag',Default=false,Callback=function(
as)_G.AutoSetNameTag=as while _G.AutoSetNameTag do if game.Players.LocalPlayer.Character:FindFirstChild('Head')and game.
Players.LocalPlayer.Character.Head:FindFirstChild('Nametag')then if game.Players.LocalPlayer.Character.Head.Nametag:
FindFirstChild('Labels')then for at,au in pairs(game.Players.LocalPlayer.Character.Head.Nametag.Labels:GetChildren())do
if au:IsA('TextLabel')then au.Text=_G.FakeName end end end end task.wait()end end})W:AddInput('Auto Change Slap',{
Default='Change Slap...',Numeric=false,Text='Change Slap / Random',Placeholder='Change',Callback=function(as)_G.FakeSlap
=as end})W:AddToggle('SlapFake',{Text='Auto Set Slap',Default=false,Callback=function(as)_G.AutoChangeSlapFake=as while
_G.AutoChangeSlapFake do if game.Players.LocalPlayer.leaderstats.Slaps.Value~=_G.FakeSlap then game.Players.LocalPlayer.
leaderstats.Slaps.Value=_G.FakeSlap end task.wait()end end})W:AddToggle('Auto Set Random Slap',{Text=
'Auto Set Random Slap',Default=false,Callback=function(as)_G.AutoChangeSlapFake=as while _G.AutoChangeSlapFake do if
game.Players.LocalPlayer.leaderstats:FindFirstChild('Slaps')then local at=math.random(0,(_G.FakeSlap or 9e9))game.
Players.LocalPlayer.leaderstats.Slaps.Value=at end task.wait()end end})W:AddInput('Auto Change Glove',{Default=
'Change Glove...',Numeric=false,Text='Change Glove',Placeholder='Change',Callback=function(as)_G.FakeGlove=as end})W:
AddToggle('GloveFake',{Text='Auto Set Glove',Default=false,Callback=function(as)_G.AutoChangeSlapFake=as while _G.
AutoChangeSlapFake do if game.Players.LocalPlayer.leaderstats.Glove.Value~=_G.FakeGlove then game.Players.LocalPlayer.
leaderstats.Glove.Value=_G.FakeGlove end task.wait()end end})W:AddDropdown('Tycoon',{Text='Tycoon',Values={'All','Your',
'Other'},Default='All',Multi=false,Callback=function(as)_G.TycoonAuto=as end})W:AddToggle('Bring Drop End',{Text=
'Bring Drop End (Network Owner)',Default=false,Callback=function(as)_G.DropEndTycoon=as end})W:AddToggle('Click Tycoon',
{Text='Auto Click Tycoon',Default=false,Callback=function(as)_G.AutoClickTycoon=as while _G.AutoClickTycoon do local 
function BringDrop(at)if _G.DropEndTycoon then if at and at:FindFirstChild('End')and at.End:IsA('BasePart')then for au,
av in pairs(at:GetChildren())do if av.Name:lower()=='tycoondrop'and IsNetworkOwner(av)then av.CFrame=at.End.CFrame end
end end end end for at,au in pairs(workspace:GetChildren())do local av=au:FindFirstChild('Click')if av then local aw=au.
Name:find('Tycoon')local ax=au.Name:match(game.Players.LocalPlayer.Name)if(_G.TycoonAuto=='All'and aw)or(_G.TycoonAuto==
'Your'and ax)or(_G.TycoonAuto=='Other'and aw and not ax)then BringDrop(au)local ay=av:FindFirstChildOfClass(
'ClickDetector')if ay then fireclickdetector(ay,0)fireclickdetector(ay,1)end end end end task.wait()end end})W:
AddToggle('Auto Destroy Tycoon',{Text='Auto Destroy Tycoon',Default=false,Callback=function(as)_G.AutoDestroyTycoon=as
while _G.AutoDestroyTycoon do for at,au in pairs(workspace:GetChildren())do if au:FindFirstChild('Destruct')then local
av=au.Name:find('Tycoon')local aw=au.Name:match(game.Players.LocalPlayer.Name)if(_G.TycoonAuto=='All'and av)or(_G.
TycoonAuto=='Your'and aw)or(_G.TycoonAuto=='Other'and av and not aw)then fireclickdetector(au.Destruct.ClickDetector,0)
fireclickdetector(au.Destruct.ClickDetector,1)end end end task.wait()end end})local as=TabBoxMisc1:AddTab('Esp')as:
AddToggle('Esp Glove',{Text='Esp Glove',Default=false,Callback=function(at)_G.EspPlayer=at for au,av in pairs(game.
Players:GetChildren())do if av~=game.Players.LocalPlayer and av.Character and av.Character:FindFirstChild('Head')and av.
Character:FindFirstChild('HumanoidRootPart')and av.Character:FindFirstChild('Humanoid')then q:RemoveESP(av.Character)end
end while _G.EspPlayer do local au=_G.ColorESP or Color3.new(255,255,255)for av,aw in ipairs(game.Players:GetChildren())
do if aw~=game.Players.LocalPlayer and aw.Character and aw.Character:FindFirstChild('Head')and aw.Character:
FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then q:
AddESP({Object=aw.Character,Text=aw.leaderstats.Glove.Value,Color=au})q:UpdateObjectText(aw.Character,aw.leaderstats.
Glove.Value)q:UpdateObjectColor(aw.Character,au)q:SetOutlineColor(au)end end task.wait()end end}):AddColorPicker(
'Color Esp',{Default=Color3.new(255,255,255),Callback=function(at)_G.ColorESP=at end}):AddKeyPicker('EspGlove',{Default=
'T',Text='Esp Glove',Mode='Toggle',SyncToggleState=true})as:AddToggle('Esp',{Text='Esp Orb',Default=false,Callback=
function(at)_G.EspOrb=at for au,av in pairs(workspace:GetChildren())do if av.Name:find('Orb')then q:RemoveESP(av)end end
while _G.EspOrb do local au=_G.ColorESP1 or Color3.fromRGB(28,3,252)for av,aw in pairs(workspace:GetChildren())do if aw.
Name:find('Orb')then q:AddESP({Object=aw,Text=aw.Name:gsub('Orb',' Orb'),Color=au})q:UpdateObjectText(aw,aw.Name:gsub(
'Orb',' Orb'))q:UpdateObjectColor(aw,au)q:SetOutlineColor(au)end end task.wait()end end}):AddColorPicker('Color Esp Orb'
,{Default=Color3.fromRGB(28,3,252),Callback=function(at)_G.ColorESP1=at end})as:AddToggle('Esp',{Text=
'Esp Toolbox, Gravestone...',Default=false,Callback=function(at)_G.EspChoose=at for au,av in pairs(workspace:
GetChildren())do if av.Name=='Keypad'or av.Name=='Gift'or av.Name=='Gravestone'or av.Name=='Toolbox'then q:RemoveESP(av)
end end while _G.EspChoose do local au=_G.ColorESP2 or Color3.fromRGB(9,230,86)for av,aw in pairs(workspace:GetChildren(
))do if aw.Name=='Keypad'or aw.Name=='Gift'or aw.Name=='Gravestone'or aw.Name=='Toolbox'then q:AddESP({Object=aw,Text=aw
.Name,Color=au})q:UpdateObjectText(aw,aw.Name)q:UpdateObjectColor(aw,au)q:SetOutlineColor(au)end end task.wait()end end}
):AddColorPicker('Color Esp Choose',{Default=Color3.fromRGB(9,230,86),Callback=function(at)_G.ColorESP2=at end})as:
AddDivider()local at={}for au,av in ipairs(Enum.Font:GetEnumItems())do table.insert(at,av.Name)end as:AddDropdown('Font'
,{Text='Set Font',Values=at,Default='Code',Multi=false,Callback=function(au)if q then q:SetFont(au)end end})as:
AddToggle('Show Distance',{Text='Show Distance',Default=false,Callback=function(au)if q then q:SetShowDistance(au)end
end})as:AddToggle('Show Rainbow',{Text='Show Rainbow',Default=false,Callback=function(au)if q then q:SetRainbow(au)end
end})as:AddToggle('Show Tracers',{Text='Show Tracers',Default=false,Callback=function(au)if q then q:SetTracers(au)end
end})as:AddDropdown('TracersOrigin',{Text='Tracers Origin',Multi=false,Values={'Bottom','Top','Center','Mouse'},Callback
=function(au)if q then q:SetTracerOrigin(au)end end})as:AddToggle('Show Arrows',{Text='Show Arrows',Default=false,
Callback=function(au)if q then q:SetArrows(au)end end})as:AddSlider('ArrowsSize',{Text='Set Arrows Radius',Default=300,
Min=0,Max=500,Rounding=0,Compact=false,Callback=function(au)if q then q:SetArrowRadius(au)end end})as:AddSlider(
'SetTextSize',{Text='Set TextSize',Default=15,Min=1,Max=50,Rounding=1,Compact=false,Callback=function(au)if q then q:
SetTextSize(au)end end})as:AddSlider('SetFillTransparency',{Text='Set Fill Transparency',Default=0.6,Min=0,Max=1,
Rounding=1,Compact=false,Callback=function(au)if q then q:SetFillTransparency(au)end end})as:AddSlider(
'SetOutlineTransparency',{Text='Set OutLine Transparency',Default=0.6,Min=0,Max=1,Rounding=1,Compact=false,Callback=
function(au)if q then q:SetOutlineTransparency(au)end end})local au=Tabs.Tab5:AddRightGroupbox('Misc Help')au:AddInput(
'Players',{Default='',Numeric=false,Text='Player',Finished=true,Placeholder='Username',Callback=function(av)_G.
PlayerPut1=FoundPlr(av,true)end})au:AddDropdown('Retro',{Text='Retro',Values={'Get Retro','Teleport Button',
'Enter Retro'},Default='',Multi=false,Callback=function(av)_G.HelpPlayerGetHehe=av end})au:AddButton('Help Player Retro'
,function()if _G.HelpPlayerGetHehe=='Get Retro'then if CheckGlove()=='Grab'then if game.Workspace:FindFirstChild('Retro'
)==nil then game.ReplicatedStorage.Assets.Retro.Parent=game.Workspace end wait(1)if game.Players.LocalPlayer.Backpack:
FindFirstChild('Grab')then game.Players.LocalPlayer.Backpack:FindFirstChild('Grab').Parent=game.Players.LocalPlayer.
Character end wait(1)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=_G.PlayerPut1.Character.HumanoidRootPart
.CFrame*CFrame.new(0,0,3)wait(0.2)game:GetService('ReplicatedStorage').GeneralAbility:FireServer()wait(0.6)game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.FinishDoor_Retro.Part.CFrame wait(1)if game.Players.LocalPlayer.
Character:FindFirstChild('Grab')then game.Players.LocalPlayer.Character:FindFirstChild('Grab').Parent=game.Players.
LocalPlayer.Backpack end else Notification("You don't have Grab equipped",_G.TimeNotify)end elseif _G.HelpPlayerGetHehe
=='Teleport Button'then if CheckGlove()=='Grab'then if game.Workspace:FindFirstChild('Retro')==nil then game.
ReplicatedStorage.Assets.Retro.Parent=game.Workspace end wait(1)if game.Players.LocalPlayer.Backpack:FindFirstChild(
'Grab')then game.Players.LocalPlayer.Backpack:FindFirstChild('Grab').Parent=game.Players.LocalPlayer.Character end wait(
1)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=_G.PlayerPut1.Character.HumanoidRootPart.CFrame*CFrame.new(
0,0,3)wait(0.2)game:GetService('ReplicatedStorage').GeneralAbility:FireServer()wait(0.6)if game.Workspace:
FindFirstChild('Retro')and game.Workspace.Retro:FindFirstChild('Map')then for av,aw in pairs(workspace.Retro.Map.
RetroObbyMap:GetChildren())do if aw.Name=='Model'and aw:FindFirstChild('StaffApp')and aw.StaffApp:FindFirstChild(
'Button')and aw.StaffApp.Button:FindFirstChild('ClickDetector')then game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame=aw.StaffApp.Button.CFrame end end end wait(1)if game.Players.LocalPlayer.Character:FindFirstChild('Grab')then
game.Players.LocalPlayer.Character:FindFirstChild('Grab').Parent=game.Players.LocalPlayer.Backpack end else
Notification("You don't have Grab equipped",_G.TimeNotify)end elseif _G.HelpPlayerGetHehe=='Enter Retro'then if
CheckGlove()=='Glitch'and game.Players.LocalPlayer.leaderstats.Slaps.Value>=50000 and game.Players.LocalPlayer.Character
:FindFirstChild('entered')==nil and _G.PlayerPut1.Character:FindFirstChild('entered')then game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=_G.PlayerPut1.Character.HumanoidRootPart.CFrame wait(0.35)game:GetService(
'ReplicatedStorage').GeneralAbility:FireServer()fireclickdetector(workspace.Lobby['Error'].ClickDetector)task.wait(8.5)
repeat task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=_G.PlayerPut1.Character.HumanoidRootPart.
CFrame until 4.5>=(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-_G.PlayerPut1.Character.HumanoidRootPart
.Position).Magnitude or game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.LocalPlayer.
Character.Humanoid.Health<=0 or _G.PlayerPut1.Character:FindFirstChild('Humanoid')and _G.PlayerPut1.Character.Humanoid.
Health<=0 wait(0.07)if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.LocalPlayer.
Character.Humanoid.Health>0 or _G.PlayerPut1.Character:FindFirstChild('Humanoid')and _G.PlayerPut1.Character.Humanoid.
Health>0 then game.ReplicatedStorage.Errorhit:FireServer(_G.PlayerPut1.Character:WaitForChild('Head'))end else
Notification('You have in Lobby | Player [ '.._G.PlayerPut1.Name..
[[ ] in arena, or You don't have Glitch equipped, or you have don't have 50K Slap]],_G.TimeNotify)end end end)au:
AddButton('Help Player Quake',function()if CheckGlove()=='Home Run'and game.Players.LocalPlayer.Character:
FindFirstChild('entered')==nil and _G.PlayerPut1.leaderstats.Glove.Value=='Berserk'then game:GetService(
'ReplicatedStorage').HomeRun:FireServer({['start']=true})fireclickdetector(workspace.Lobby.woah.ClickDetector)wait(4.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=_G.PlayerPut1.Character.HumanoidRootPart.CFrame task.wait(0.2
)game:GetService('ReplicatedStorage').VineThud:FireServer()task.wait(1)fireclickdetector(workspace.Lobby['Home Run'].
ClickDetector)wait(0.4)spawn(function()repeat task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=_G.
PlayerPut1.Character.Character.HumanoidRootPart.CFrame until 4.5>=(game.Players.LocalPlayer.Character.HumanoidRootPart.
Position-_G.PlayerPut1.Character.Character.HumanoidRootPart.Position).Magnitude or game.Players.LocalPlayer.Character:
FindFirstChild('Humanoid')and game.Players.LocalPlayer.Character.Humanoid.Health<=0 or _G.PlayerPut1.Character:
FindFirstChild('Humanoid')and _G.PlayerPut1.Character.Humanoid.Health<=0 end)wait(0.7)game:GetService(
'ReplicatedStorage').HomeRun:FireServer({['finished']=true})else Notification(
[[You don't have Home Run equipped, or you have to go lobby, or player don't have Berserk equipped.]],_G.TimeNotify)end
end)au:AddButton('Help Player Goofy',function()if CheckGlove()=='Confusion'and game.Players.LocalPlayer.Character:
FindFirstChild('entered')==nil and game:GetService('BadgeService'):UserHasBadgeAsync(game.Players.LocalPlayer.UserId,
2133016756)then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=_G.PlayerPut1.Character.HumanoidRootPart.
CFrame wait(0.2)game:GetService('ReplicatedStorage').GeneralHit:FireServer(_G.PlayerPut1.Character:WaitForChild(
'HumanoidRootPart'))fireclickdetector(workspace.Lobby.Goofy.ClickDetector)wait(2)game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=_G.PlayerPut1.Character.HumanoidRootPart.CFrame wait(0.2)game:GetService('ReplicatedStorage').
GeneralHit:FireServer(_G.PlayerPut1.Character.Character:WaitForChild('HumanoidRootPart'))else Notification(
"You don't have Confusion equipped, or you have to go lobby.",_G.TimeNotify)end end)au:AddButton(
'Help Player Wheelchair',function()local av=0 local aw={}for ax,ay in pairs({'bull','bomb','brick','slicer','blasphemy',
'tableflip','l.o.l.b.o.m.b'})do local az=false for aA,aB in pairs(game.Players.LocalPlayer:FindFirstChild(
'_unlockedGloves'):GetChildren())do if aB.Value==true and string.find(aB.Name:lower(),ay)then av+=1 az=true break end
end if not az then table.insert(aw,ay)end end if tonumber(av)==7 then if game.Players.LocalPlayer.Character:
FindFirstChild('entered')==nil and _G.PlayerPut1.Character:FindFirstChild('entered')then spawn(function()repeat task.
wait()CreateFreezeBV()if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')then game.Players.LocalPlayer.
Character.Humanoid.PlatformStand=true end until StopFreezeBV wait(0.3)CreateFreezeBV({Remove=true})end)if _G.PlayerPut1.
Character:FindFirstChild('HumanoidRootPart')then local ax=_G.PlayerPut1.Character local ay=ax and ax:FindFirstChild(
'HumanoidRootPart')equipglove('Bull')spawn(function()repeat task.wait()game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=ay.CFrame*CFrame.new(0,5,0)*CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0))until ax:
FindFirstChild('Ragdolled')and ax.Ragdolled.Value==true end)wait(0.3)repeat task.wait()slapglove(ay)task.wait(0.3)until
ax:FindFirstChild('Ragdolled')and ax.Ragdolled.Value==true wait(0.1)repeat task.wait()until ax:FindFirstChild(
'Ragdolled')and ax.Ragdolled.Value==false wait(0.35)equipglove('Bomb')spawn(function()repeat task.wait()game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=ay.CFrame*CFrame.new(0,5,0)*CFrame.Angles(math.rad(-90),math.rad(0),math.
rad(0))until ax:FindFirstChild('Ragdolled')and ax.Ragdolled.Value==true end)wait(0.5)game:GetService('ReplicatedStorage'
):WaitForChild('BombThrow'):FireServer('Ebutton')game:GetService('ReplicatedStorage'):WaitForChild('BombThrow'):
FireServer('Ebutton')wait(0.12)repeat task.wait()until ax:FindFirstChild('Ragdolled')and ax.Ragdolled.Value==false
equipglove('Brick')task.wait(0.1)repeat task.wait()until game.Players.LocalPlayer.Character if game.Players.LocalPlayer.
Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then
repeat task.wait()firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.
TouchInterest.Parent,0)firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.
Teleport1.TouchInterest.Parent,1)until game.Players.LocalPlayer.Character:FindFirstChild('entered')end task.wait(0.3)
repeat task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ay.CFrame*CFrame.new(0,0,5)if game.Players.
LocalPlayer.Backpack:FindFirstChild('Brick')then game.Players.LocalPlayer.Backpack.Brick.Parent=game.Players.LocalPlayer
.Character else game:GetService('ReplicatedStorage').lbrick:FireServer()end until ax:FindFirstChild('Ragdolled')and ax.
Ragdolled.Value==true wait(0.3)repeat task.wait()until ax:FindFirstChild('Ragdolled')and ax.Ragdolled.Value==false game:
GetService('Players').LocalPlayer.Reset:FireServer()wait(0.3)repeat task.wait()until game.Players.LocalPlayer.Character
and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character:
FindFirstChild('Humanoid')and game.Players.LocalPlayer.Character.Humanoid.Health>0 task.wait(0.55)equipglove('Slicer')
task.wait(0.1)repeat task.wait()until game.Players.LocalPlayer.Character if game.Players.LocalPlayer.Character:
FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then repeat task
.wait()firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest
.Parent,0)firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.
TouchInterest.Parent,1)until game.Players.LocalPlayer.Character:FindFirstChild('entered')end task.wait(0.5)repeat task.
wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ay.CFrame*CFrame.new(0,8,0)*CFrame.Angles(math.rad(90),
math.rad(0),math.rad(0))if game.Players.LocalPlayer.Backpack:FindFirstChild('Slicer')then game.Players.LocalPlayer.
Backpack.Slicer.Parent=game.Players.LocalPlayer.Character else game:GetService('ReplicatedStorage').Slicer:FireServer(
'slash',game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame,Vector3.new())end until ax:FindFirstChild('Ragdolled'
)and ax.Ragdolled.Value==true wait(0.3)repeat task.wait()until ax:FindFirstChild('Ragdolled')and ax.Ragdolled.Value==
false task.wait(0.1)game:GetService('Players').LocalPlayer.Reset:FireServer()wait(0.3)repeat task.wait()until game.
Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.Players.
LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.LocalPlayer.Character.Humanoid.Health>0 task.wait(0.5)
equipglove('Blasphemy')spawn(function()repeat task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ay.
CFrame*CFrame.new(0,5,0)*CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0))until ax:FindFirstChild('Ragdolled')and ax.
Ragdolled.Value==true end)task.wait(0.36)repeat task.wait()slapglove(ay)task.wait(0.3)until ax:FindFirstChild(
'Ragdolled')and ax.Ragdolled.Value==true wait(0.1)repeat task.wait()until ax:FindFirstChild('Ragdolled')and ax.Ragdolled
.Value==false wait(0.1)equipglove('Tableflip')spawn(function()repeat task.wait()game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=ay.CFrame*CFrame.new(0,5,0)*CFrame.Angles(math.rad(-90),math.rad(0),math.rad(0))until ax:
FindFirstChild('Ragdolled')and ax.Ragdolled.Value==true end)task.wait(0.37)game:GetService('ReplicatedStorage').
GeneralAbility:FireServer()wait(0.1)repeat task.wait()until ax:FindFirstChild('Ragdolled')and ax.Ragdolled.Value==false
equipglove('L.O.L.B.O.M.B')repeat task.wait()until game.Players.LocalPlayer.Character if game.Players.LocalPlayer.
Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then
repeat task.wait()firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.
TouchInterest.Parent,0)firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.
Teleport1.TouchInterest.Parent,1)until game.Players.LocalPlayer.Character:FindFirstChild('entered')end wait(0.3)spawn(
function()repeat task.wait()if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=ay.CFrame*CFrame.new(0,3,0)end until game.Players.LocalPlayer.Character:
FindFirstChild('Humanoid')and game.Players.LocalPlayer.Character.Humanoid.Health<=0 end)game:GetService('Players').
LocalPlayer.Reset:FireServer()wait(0.7)StopFreezeBV=true end else Notification(
'You have to go lobby or, player have to go arena.',_G.TimeNotify)end else Notification('You have owner '..'"7 Glove"'..
' ('..table.concat(', ',aw)..')',_G.TimeNotify)end end)au:AddSlider('Time Help Berserk',{Text='Time Help Berserk',
Default=3,Min=1,Max=3,Rounding=0,Callback=function(av)_G.TimeHelpGotIm=av end})au:AddButton('Help Player Berserk',
function()if CheckGlove()=='Kinetic'and game.Players.LocalPlayer.Character:FindFirstChild('entered')and _G.PlayerPut1.
Character:FindFirstChild('entered')then for av=1,_G.TimeHelpGotIm do game.Players.LocalPlayer.Character.HumanoidRootPart
.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)game.Players.LocalPlayer.Character.Humanoid:UnequipTools()repeat
task.wait()game.ReplicatedStorage.SelfKnockback:FireServer({['Force']=-99})until game.Players.LocalPlayer.Character:
WaitForChild('KineticSlappedBadgeCounter').Value>=100 wait(2.8)spawn(function()repeat task.wait()game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=_G.PlayerPut1.Character.Head.CFrame*CFrame.new(0,5.8,0)*CFrame.Angles(math
.rad(90),math.rad(0),math.rad(0))until _G.PlayerPut1.Character:FindFirstChild('Ragdolled')and _G.PlayerPut1.Character.
Ragdolled.Value==true end)wait(0.28)if game.Players.LocalPlayer.Backpack:FindFirstChild('Kinetic')then game.Players.
LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Kinetic)end wait(0.19)game:GetService(
'ReplicatedStorage').KineticExpl:FireServer(game.Players.LocalPlayer.Character.Kinetic,game.Players.LocalPlayer.
Character.HumanoidRootPart.Position)game.Players.LocalPlayer.Character.Humanoid:UnequipTools()wait(0.7)game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=workspace['SafeBox'].CFrame*CFrame.new(0,5,0)wait(3.8)end else
Notification([[You don't have Kinetic equipped, or you have to go Arena, or player have go to arena.]],_G.TimeNotify)end
end)local av=Tabs.Tab6:AddLeftGroupbox('Glove')av:AddDropdown('Santa',{Text='Santa Ability',Values={'Bob Plush',
'Snow Peep','Milk'},Default='',Multi=false,Callback=function(aw)SantaAbility=aw end})av:AddToggle('Spam Santa',{Text=
'Auto Ability Santa',Default=false,Callback=function(aw)SantaSpam=aw if CheckGlove()=='Santa'then while SantaSpam do if
SantaAbility=='Bob Plush'then game:GetService('ReplicatedStorage').GeneralAbility:FireServer('bobplush')elseif
SantaAbility=='Snow Peep'then game:GetService('ReplicatedStorage').GeneralAbility:FireServer('snowpeep')elseif
SantaAbility=='Milk'then game:GetService('ReplicatedStorage').GeneralAbility:FireServer('milk')end task.wait()end elseif
SantaSpam==true then Notification("You don't have Santa equipped",_G.TimeNotify)wait(0.05)g['Spam Santa']:SetValue(false
)end end})av:AddDropdown('AdminAbility',{Text='Admin Ability',Values={'Fling','Anvil','Invisibility'},Default='',Multi=
false,Callback=function(aw)AbilityAdmin=aw end})av:AddToggle('Spam Admin',{Text='Auto Ability Admin',Default=false,
Callback=function(aw)AdminSpam=aw while AdminSpam do game:GetService('ReplicatedStorage').AdminAbility:FireServer(
AbilityAdmin)task.wait()end end})av:AddDropdown('RetroAbility',{Text='Retro Ability',Values={'Rocket Launcher',
'Ban Hammer','Bomb'},Default='',Multi=false,Callback=function(aw)RetroAbility=aw end})av:AddToggle('Spam Retro',{Text=
'Auto Ability Retro',Default=false,Callback=function(aw)RetroSpam=aw while RetroSpam do game:GetService(
'ReplicatedStorage').RetroAbility:FireServer(RetroAbility)task.wait()end end})av:AddDropdown('SlapStickAbility',{Text=
'SlapStick Ability',Values={'runeffect','fullcharged','dash','addarm','charge','cancelrun','discharge'},Default='',Multi
=false,Callback=function(aw)SlapstickAbility=aw end})av:AddToggle('Spam Slapstick',{Text='Auto Ability Slapstick',
Default=false,Callback=function(aw)SlapstickSpam=aw if CheckGlove():lower():find('slapstick')then if SlapstickSpam==true
then game:GetService('ReplicatedStorage').slapstick:FireServer('addarm')end while SlapstickSpam do game:GetService(
'ReplicatedStorage').slapstick:FireServer(SlapstickAbility)task.wait()end elseif aw==true then Notification(
"You don't have Slapstick equipped",5)wait(0.05)g['Spam Slapstick']:SetValue(false)end end})av:AddInput('Players',{
Default='',Numeric=false,Text='Player',Finished=true,Placeholder='Username',Callback=function(aw)if aw=='Me'or aw=='me'
or aw=='Username'or aw==''then SaveThePlayer=game.Players.LocalPlayer.Name else SaveThePlayer=FoundPlr(aw,true).Name end
end})av:AddToggle('Godmobe Player',{Text='Auto Godmobe Player',Default=false,Callback=function(aw)if SaveThePlayer==nil
then SaveThePlayer=game.Players.LocalPlayer.Name end GuardianAngelSpam=aw if CheckGlove()=='Guardian Angel'then while
GuardianAngelSpam do game:GetService('ReplicatedStorage').GeneralAbility:FireServer(game.Players[SaveThePlayer])task.
wait()end elseif GuardianAngelSpam==true then Notification("You don't have Guardian Angel equipped.",_G.TimeNotify)wait(
0.05)g['Godmobe Player']:SetValue(false)end end})av:AddInput('Players',{Default='',Numeric=false,Text='Player',Finished=
true,Placeholder='Username',Callback=function(aw)if aw=='Me'or aw=='me'or aw=='Username'or aw==''then DivebombExplosion=
game.Players.LocalPlayer.Name else DivebombExplosion=FoundPlr(aw,true).Name end end})av:AddSlider('ChargeExplosion',{
Text='Charge Explosion',Default=20,Min=20,Max=100,Rounding=0,Compact=true,Callback=function(aw)_G.ChargeExplosion=aw end
})av:AddToggle('Ability Divebomb',{Text='Auto Ability Divebomb',Default=false,Callback=function(aw)if DivebombExplosion
==nil then DivebombExplosion=game.Players.LocalPlayer.Name end _G.DivebombSpam=aw if CheckGlove()=='Divebomb'then while
_G.DivebombSpam do game:GetService('ReplicatedStorage').RocketJump:InvokeServer({['chargeAlpha']=100,['rocketJump']=true
})game:GetService('ReplicatedStorage').RocketJump:InvokeServer({['position']=game.Players[DivebombExplosion].Character.
HumanoidRootPart.Position,['explosion']=true,['explosionAlpha']=_G.ChargeExplosion})task.wait()end elseif _G.
DivebombSpam==true then Notification("You don't have Divebomb equipped.",_G.TimeNotify)wait(0.05)g['Ability Divebomb']:
SetValue(false)end end})av:AddInput('Players',{Default='',Numeric=false,Text='Player',Finished=true,Placeholder=
'Username',Callback=function(aw)_G.BarrelPlayer=FoundPlr(aw,true).Name end})av:AddToggle('AbilityBarrelPlayer',{Text=
'Auto Barrel Player',Default=false,Callback=function(aw)_G.BarrelSpamPlayer=aw if CheckGlove()=='Barrel'then while _G.
BarrelSpamPlayer do game:GetService('ReplicatedStorage').GeneralAbility:FireServer({['cf']=game.Players[_G.BarrelPlayer]
.Character.HumanoidRootPart.CFrame})task.wait()end elseif _G.BarrelSpamPlayer==true then Notification(
"You don't have Barrel equipped.",_G.TimeNotify)wait(0.05)g.AbilityBarrelPlayer:SetValue(false)end end})av:AddInput(
'Players',{Default='',Numeric=false,Text='Player',Finished=true,Placeholder='Username',Callback=function(aw)_G.
BindPlayer=FoundPlr(aw,true)end})av:AddDropdown('BindAbility',{Text='Bind Ability',Values={'Default','Ultimate'},Default
='',Multi=false,Callback=function(aw)_G.BindAbility=aw end})av:AddToggle('AbilityBindPlayer',{Text='Auto Bind Player',
Default=false,Callback=function(aw)_G.BindSpamPlayer=aw if CheckGlove()=='Bind'then while _G.BindSpamPlayer do if _G.
BindAbility=='Default'then game:GetService('ReplicatedStorage').GeneralAbility:FireServer('default',{['goal']=game.
Players[_G.BindPlayer].Character.HumanoidRootPart.CFrame,['origin']=game.Players[_G.BindPlayer].Character.Head.CFrame})
elseif _G.BindAbility=='Ultimate'then game:GetService('ReplicatedStorage').GeneralAbility:FireServer('ultimate',{['goal'
]=game.Players[_G.BindPlayer].Character.HumanoidRootPart.CFrame*CFrame.Angles(3.141592502593994,1.0641214847564697,-
3.141592502593994),['origin']=game.Players[_G.BindPlayer].Character.HumanoidRootPart.CFrame*CFrame.Angles(
3.141592502593994,1.0641214847564697,-3.141592502593994)})end task.wait()end elseif _G.BindSpamPlayer==true then
Notification("You don't have Bind equipped.",_G.TimeNotify)wait(0.05)g.AbilityBindPlayer:SetValue(false)end end})_G.
PlayerChoose='Username'av:AddDropdown('PlayerChoose',{Text='Player Choose',Values={'Username','Random'},Default='',Multi
=false,Callback=function(aw)_G.PlayerChoose=aw end})av:AddInput('Players',{Default='',Numeric=false,Text='Player',
Finished=true,Placeholder='Username',Callback=function(aw)_G.PlayerButton=FoundPlr(aw,true).Name end})av:AddButton(
'Swapper Player Void',function()if _G.PlayerChoose=='Random'then local aw={}for ax,ay in pairs(game.Players:GetChildren(
))do if ay~=game.Players.LocalPlayer and ay.Character and ay.Character:FindFirstChild('HumanoidRootPart')and ay.
Character:FindFirstChild('Ragdolled')and not ay.Character.HumanoidRootPart:FindFirstChild('BlockedShield')and not ay.
Character:FindFirstChild('Counterd')and not ay.Character:FindFirstChild('Mirage')and not ay.Character:FindFirstChild(
'rock')and not ay.Character:FindFirstChild('Reversed')and ay.Character.Ragdolled.Value==false and ay.Character.isInArena
.Value==true then table.insert(aw,ay)end end if#aw~=0 then _G.PlayerButton=aw[math.random(#aw)].Name end end if game.
Players.LocalPlayer.Character:FindFirstChild('Swapper')or game.Players.LocalPlayer.Backpack:FindFirstChild('Swapper')
then OGL=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame CreateFreezeBV()repeat task.wait()if workspace[_G.
PlayerButton]:FindFirstChild('HumanoidRootPart')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=
workspace[_G.PlayerButton].HumanoidRootPart.CFrame*CFrame.new(0,-70,0)end until game.Players[_G.PlayerButton].Character
and workspace[_G.PlayerButton]:FindFirstChild('HumanoidRootPart')and workspace[_G.PlayerButton]:FindFirstChild('entered'
)and workspace[_G.PlayerButton].Ragdolled.Value==false task.wait(0.6)game:GetService('ReplicatedStorage').SLOC:
FireServer()wait(0.25)CreateFreezeBV({Remove=true})task.wait(0.05)game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame=OGL else Notification([[You don't have Swapper equipped, or you aren't in the arena.]],_G.TimeNotify)end end)av:
AddButton('Home Run Kill Player',function()if _G.PlayerChoose=='Random'then local aw={}for ax,ay in pairs(game.Players:
GetChildren())do if ay~=game.Players.LocalPlayer and ay.Character and ay.Character:FindFirstChild('HumanoidRootPart')and
ay.Character:FindFirstChild('Ragdolled')and not ay.Character.HumanoidRootPart:FindFirstChild('BlockedShield')and not ay.
Character:FindFirstChild('Counterd')and not ay.Character:FindFirstChild('Mirage')and not ay.Character:FindFirstChild(
'rock')and not ay.Character:FindFirstChild('Reversed')and ay.Character.Ragdolled.Value==false and ay.Character.isInArena
.Value==true then table.insert(aw,ay)end end if#aw~=0 then _G.PlayerButton=aw[math.random(#aw)].Name end end if
CheckGlove()=='Home Run'and game.Players[_G.PlayerButton].Character:FindFirstChild('entered')then CreateFreezeBV()OGL=
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame game.Players[_G.PlayerButton].Character.HumanoidRootPart.Size
=Vector3.new(50,50,50)game:GetService('ReplicatedStorage').HomeRun:FireServer({['start']=true})wait(4.2)game:GetService(
'ReplicatedStorage').HomeRun:FireServer({['finished']=true})task.wait(0.12)game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=game.Players[_G.PlayerButton].Character.HumanoidRootPart.CFrame task.wait(0.25)game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=OGL CreateFreezeBV({Remove=true})else Notification(
"You don't have Home Run equipped",_G.TimeNotify)end end)av:AddButton('Hive Player',function()if _G.PlayerChoose==
'Random'then local aw={}for ax,ay in pairs(game.Players:GetChildren())do if ay~=game.Players.LocalPlayer and ay.
Character and ay.Character:FindFirstChild('HumanoidRootPart')and ay.Character:FindFirstChild('Ragdolled')and not ay.
Character.HumanoidRootPart:FindFirstChild('BlockedShield')and not ay.Character:FindFirstChild('Counterd')and not ay.
Character:FindFirstChild('Mirage')and not ay.Character:FindFirstChild('rock')and not ay.Character:FindFirstChild(
'Reversed')and ay.Character.Ragdolled.Value==false and ay.Character.isInArena.Value==true then table.insert(aw,ay)end
end if#aw~=0 then _G.PlayerButton=aw[math.random(#aw)].Name end end if CheckGlove()=='Hive'and game.Players[_G.
PlayerButton].Character:FindFirstChild('entered')then CreateFreezeBV()OGL=game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame game:GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait(4.2)game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=game.Players[_G.PlayerButton].Character.HumanoidRootPart.CFrame repeat
task.wait()until(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-game.Players[_G.PlayerButton].Character.
HumanoidRootPart.Position).Magnitude<=7 task.wait(0.33)game:GetService('ReplicatedStorage'):WaitForChild('GeneralHit'):
FireServer(game.Players[_G.PlayerButton].Character:WaitForChild('HumanoidRootPart'))wait(0.25)game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=OGL CreateFreezeBV({Remove=true})else Notification("You don't have Hive equipped",_G.
TimeNotify)end end)av:AddButton('Quake Player',function()if _G.PlayerChoose=='Random'then local aw={}for ax,ay in pairs(
game.Players:GetChildren())do if ay~=game.Players.LocalPlayer and ay.Character and ay.Character:FindFirstChild(
'HumanoidRootPart')and ay.Character:FindFirstChild('Ragdolled')and not ay.Character.HumanoidRootPart:FindFirstChild(
'BlockedShield')and not ay.Character:FindFirstChild('Counterd')and not ay.Character:FindFirstChild('Mirage')and not ay.
Character:FindFirstChild('rock')and not ay.Character:FindFirstChild('Reversed')and ay.Character.Ragdolled.Value==false
and ay.Character.isInArena.Value==true then table.insert(aw,ay)end end if#aw~=0 then _G.PlayerButton=aw[math.random(#aw)
].Name end end if CheckGlove()=='Quake'and game.Players.LocalPlayer.Character:FindFirstChild('entered')and game.Players[
_G.PlayerButton].Character:FindFirstChild('entered')then CreateFreezeBV()OGL=game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame repeat task.wait()if game.Players.LocalPlayer.Backpack:FindFirstChild('Quake')then game.Players.
LocalPlayer.Backpack.Quake.Parent=game.Players.LocalPlayer.Character end until game.Players.LocalPlayer.Character:
FindFirstChild('Quake')task.wait(0.3)game:GetService('ReplicatedStorage'):WaitForChild('QuakeQuake'):FireServer({[
'start']=true})wait(3.45)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Players[_G.PlayerButton].
Character:FindFirstChild('Head').CFrame*CFrame.new(0,4,0)repeat task.wait()until(game.Players.LocalPlayer.Character.
HumanoidRootPart.Position-game.Players[_G.PlayerButton].Character.HumanoidRootPart.Position).Magnitude<=7 task.wait(0.35
)game:GetService('ReplicatedStorage'):WaitForChild('QuakeQuake'):FireServer({['finished']=true})game.Players.LocalPlayer
.Character.HumanoidRootPart.CFrame=OGL CreateFreezeBV({Remove=true})else Notification("You don't have Quake equipped.",
_G.TimeNotify)end end)av:AddButton('Cards Player',function()if _G.PlayerChoose=='Random'then local aw={}for ax,ay in
pairs(game.Players:GetChildren())do if ay~=game.Players.LocalPlayer and ay.Character and ay.Character:FindFirstChild(
'HumanoidRootPart')and ay.Character:FindFirstChild('Ragdolled')and not ay.Character.HumanoidRootPart:FindFirstChild(
'BlockedShield')and not ay.Character:FindFirstChild('Counterd')and not ay.Character:FindFirstChild('Mirage')and not ay.
Character:FindFirstChild('rock')and not ay.Character:FindFirstChild('Reversed')and ay.Character.Ragdolled.Value==false
and ay.Character.isInArena.Value==true then table.insert(aw,ay)end end if#aw~=0 then _G.PlayerButton=aw[math.random(#aw)
].Name end end if CheckGlove()=='Jester'then game:GetService('ReplicatedStorage').GeneralAbility:FireServer('Ability3',
game.Players[_G.PlayerButton])else Notification("You don't have Jester glove equipped",_G.TimeNotify)end end)av:
AddButton('Grab Player Teleport',function()if CheckGlove()=='Grab'and game.Players.LocalPlayer.Character:FindFirstChild(
'entered')and game.Players[_G.PlayerButton].Character:FindFirstChild('entered')then CreateFreezeBV()if game.Players.
LocalPlayer.Backpack:FindFirstChild('Grab')then game.Players.LocalPlayer.Backpack:FindFirstChild('Grab').Parent=game.
Players.LocalPlayer.Character end wait(0.36)OLG=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=game.Players[_G.PlayerButton].Character.HumanoidRootPart.CFrame*CFrame.
new(0,0,3)wait(0.2)game:GetService('ReplicatedStorage').GeneralAbility:FireServer()wait(0.15)game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=OLG wait(0.37)if game.Players.LocalPlayer.Character:FindFirstChild('Grab')then game.
Players.LocalPlayer.Character:FindFirstChild('Grab').Parent=game.Players.LocalPlayer.Backpack end CreateFreezeBV({Remove
=true})else Notification([[You don't have Grab equipped, or you have to go Arena, or player go to Arena]],_G.TimeNotify)
end end)av:AddToggle('Auto Oven Player',{Text='Auto Oven Player',Default=false,Callback=function(aw)_G.OvenPlayerAuto=aw
if CheckGlove()=='Oven'then while _G.OvenPlayerAuto do if _G.PlayerChoose=='Random'then local ax={}for ay,az in pairs(
game.Players:GetChildren())do if az~=game.Players.LocalPlayer and az.Character and az.Character:FindFirstChild(
'HumanoidRootPart')and az.Character:FindFirstChild('Ragdolled')and not az.Character.HumanoidRootPart:FindFirstChild(
'BlockedShield')and not az.Character:FindFirstChild('Counterd')and not az.Character:FindFirstChild('Mirage')and not az.
Character:FindFirstChild('rock')and not az.Character:FindFirstChild('Reversed')and az.Character.Ragdolled.Value==false
and az.Character.isInArena.Value==true then table.insert(ax,az)end end if#ax~=0 then _G.PlayerButton=ax[math.random(#ax)
].Name end end if not game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Oven")then game:GetService(
'ReplicatedStorage').GeneralAbility:FireServer(game.Players[_G.PlayerButton].Character.HumanoidRootPart.CFrame)end task.
wait()end elseif _G.OvenPlayerAuto==true then Notification("You don't have Oven equipped.",_G.TimeNotify)wait(0.05)g[
'Auto Oven Player']:SetValue(false)end end})av:AddToggle('Auto Cards Player',{Text='Auto Cards Player',Default=false,
Callback=function(aw)_G.OvenPlayerAuto=aw if CheckGlove()=='Jester'then while _G.OvenPlayerAuto do if _G.PlayerChoose==
'Random'then local ax={}for ay,az in pairs(game.Players:GetChildren())do if az~=game.Players.LocalPlayer and az.
Character and az.Character:FindFirstChild('HumanoidRootPart')and az.Character:FindFirstChild('Ragdolled')and not az.
Character.HumanoidRootPart:FindFirstChild('BlockedShield')and not az.Character:FindFirstChild('Counterd')and not az.
Character:FindFirstChild('Mirage')and not az.Character:FindFirstChild('rock')and not az.Character:FindFirstChild(
'Reversed')and az.Character.Ragdolled.Value==false and az.Character.isInArena.Value==true then table.insert(ax,az)end
end if#ax~=0 then _G.PlayerButton=ax[math.random(#ax)].Name end end if CheckGlove()=='Jester'then game:GetService(
'ReplicatedStorage').GeneralAbility:FireServer('Ability3',game.Players[_G.PlayerButton])end task.wait()end elseif _G.
OvenPlayerAuto==true then Notification("You don't have Jester equipped.",_G.TimeNotify)wait(0.05)g['Auto Cards Player']:
SetValue(false)end end})av:AddToggle('Auto Siphon Player',{Text='Auto Siphon Player',Default=false,Callback=function(aw)
_G.AutoSiphonPlayer=aw if CheckGlove()=='Siphon'then while _G.AutoSiphonPlayer do if _G.PlayerChoose=='Random'then local
ax={}for ay,az in pairs(game.Players:GetChildren())do if az~=game.Players.LocalPlayer and az.Character and az.Character:
FindFirstChild('HumanoidRootPart')and az.Character:FindFirstChild('Ragdolled')and not az.Character.HumanoidRootPart:
FindFirstChild('BlockedShield')and not az.Character:FindFirstChild('Counterd')and not az.Character:FindFirstChild(
'Mirage')and not az.Character:FindFirstChild('rock')and not az.Character:FindFirstChild('Reversed')and az.Character.
Ragdolled.Value==false and az.Character.isInArena.Value==true then table.insert(ax,az)end end if#ax~=0 then _G.
PlayerButton=ax[math.random(#ax)].Name end end if game.Players.LocalPlayer.Character:FindFirstChild('entered')and game.
Players[_G.PlayerButton].Character:FindFirstChild('entered')then game:GetService('ReplicatedStorage').Events.Siphon:
FireServer({['cf']=game.Players[_G.PlayerButton].Character.HumanoidRootPart.CFrame})end task.wait()end elseif _G.
AutoSiphonPlayer==true then Notification("You don't have Siphon equipped.",_G.TimeNotify)wait(0.05)g[
'Auto Siphon Player']:SetValue(false)end end})av:AddDropdown('Black Hole',{Text='Black Hole',Values={'Normal',
'Teleport Cannon Island'},Default='',Multi=false,Callback=function(aw)_G.BlackHoleCre=aw end})av:AddButton(
'Auto Create Black Hole',function()if game.Players.LocalPlayer.Character:FindFirstChild('entered')==nil and game:
GetService('BadgeService'):UserHasBadgeAsync(game.Players.LocalPlayer.UserId,2125950512)and game:GetService(
'BadgeService'):UserHasBadgeAsync(game.Players.LocalPlayer.UserId,2147429609)then game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=game.workspace.Origo.CFrame*CFrame.new(0,30,0)wait(0.1)game.Players.LocalPlayer.Character.
HumanoidRootPart.Anchored=true wait(0.05)fireclickdetector(workspace.Lobby['rob'].ClickDetector)wait(0.3)game:
GetService('ReplicatedStorage').rob:FireServer()repeat task.wait()until game.Players.LocalPlayer.Character and game.
Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid'
).Health>0 and game.Players.LocalPlayer.Character:FindFirstChild('RobTransformed')and game.Players.LocalPlayer.Character
:FindFirstChild('Head')and game.Players.LocalPlayer.Character.Head.Transparency>=1 fireclickdetector(workspace.Lobby[
'bob'].ClickDetector)game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored=false repeat task.wait()until
CheckGlove()=='bob'game:GetService('ReplicatedStorage').bob:FireServer()wait(0.5)for aw=1,26 do for ax,ay in pairs(
workspace:GetChildren())do if ay.Name:match(game.Players.LocalPlayer.Name)and ay:FindFirstChild('HumanoidRootPart')then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ay.HumanoidRootPart.CFrame end end end if _G.BlackHoleCre==
'Teleport Cannon Island'then repeat task.wait()until game.Players.LocalPlayer.Character if not game.Players.LocalPlayer.
Character:FindFirstChild('entered')and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then repeat
task.wait()firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.
TouchInterest.Parent,0)firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.
Teleport1.TouchInterest.Parent,1)until game.Players.LocalPlayer.Character:FindFirstChild('entered')end wait(0.27)game.
Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(227,48,169)wait(0.25)for aw,ax in ipairs(game.Workspace
.Arena.CannonIsland:GetDescendants())do if ax.ClassName=='ProximityPrompt'then fireproximityprompt(ax)end end end else
Notification([[You have in lobby, or You don't have badge bob, or badge rob.]],_G.TimeNotify)end end)av:AddButton(
'Auto Enter Map Null',function()if game.Workspace:FindFirstChild('Blackhole_Particles')==nil then Notification(
'When will someone create a black hole [ BOB + ROB ].',_G.TimeNotify)return end if CheckGlove()~='Default'then if game.
Players.LocalPlayer.Character:FindFirstChild('entered')then game:GetService('Players').LocalPlayer.Reset:FireServer()
wait(0.4)repeat task.wait()until game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.
LocalPlayer.Character.Humanoid.Health>0 wait(0.3)end if game.Players.LocalPlayer.Character:FindFirstChild('entered')==
nil then equipglove('Default')end end if game.Players.LocalPlayer.Character:FindFirstChild('entered')~=nil then repeat
task.wait()until game.Players.LocalPlayer.Character if not game.Players.LocalPlayer.Character:FindFirstChild('entered')
and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then repeat task.wait()firetouchinterest(game.
Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,0)firetouchinterest(
game.Players.LocalPlayer.Character:WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,1)until game.
Players.LocalPlayer.Character:FindFirstChild('entered')end end wait(0.3)if game.Players.LocalPlayer.Character:
FindFirstChild('entered')then repeat task.wait()if game.Workspace:FindFirstChild('Blackhole_Particles')and game.
Workspace.Blackhole_Particles:FindFirstChild('BlackHole')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
=game.Workspace.Blackhole_Particles.BlackHole.CFrame end until game.Players.LocalPlayer.Character:FindFirstChild(
'Humanoid')and game.Players.LocalPlayer.Character.Humanoid.Health==0 end end)av:AddButton('Auto Enter Cannon',function()
if not game.Players.LocalPlayer.Character:FindFirstChild('entered')and game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')then repeat task.wait()firetouchinterest(game.Players.LocalPlayer.Character:
WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,0)firetouchinterest(game.Players.LocalPlayer.
Character:WaitForChild('Head'),workspace.Lobby.Teleport1.TouchInterest.Parent,1)until game.Players.LocalPlayer.Character
:FindFirstChild('entered')wait(0.26)end if game.Players.LocalPlayer.Character:FindFirstChild('entered')then game.Players
.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(227,48,169)wait(0.25)for aw,ax in ipairs(game.Workspace.Arena.
CannonIsland:GetDescendants())do if ax.ClassName=='ProximityPrompt'then fireproximityprompt(ax)end end end end)local aw=
Tabs.Tab6:AddRightGroupbox('Misc Glove')aw:AddButton('Spawn Orb Siphon',function()if game.Players.LocalPlayer.Character:
FindFirstChild('entered')and CheckGlove()=='Siphon'then repeat task.wait()game:GetService('ReplicatedStorage').Events.
Siphon:FireServer({['cf']=game.Workspace.Arena.CubeOfDeathArea['the cube of death(i heard it kills)'].Part.CFrame})until
game.Workspace.Arena.CubeOfDeathArea['the cube of death(i heard it kills)']:FindFirstChild('siphon_charge')repeat task.
wait()if game.Workspace.Arena.CubeOfDeathArea['the cube of death(i heard it kills)']:FindFirstChild('siphon_charge')then
game.Workspace.Arena.CubeOfDeathArea['the cube of death(i heard it kills)'].CFrame=game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame end until game.Workspace.Arena.CubeOfDeathArea['the cube of death(i heard it kills)']:
FindFirstChild('siphon_charge')==nil else Notification("You don't have Siphon equipped or you haven't in arena.",_G.
TimeNotify)end end)aw:AddButton('Ability Lure Safe',function()if game.Players.LocalPlayer.Character:FindFirstChild(
'entered')and CheckGlove()=='Lure'then OldTP=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.Arena.CannonIsland.Cannon.Base.CFrame*CFrame.new(0,0,35)task.
wait(0.2)game:GetService('ReplicatedStorage').GeneralAbility:FireServer()task.wait(0.15)game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=OldTP else Notification("You don't have Lure equipped or you haven't in arena.",_G.
TimeNotify)end end)aw:AddToggle('Auto Collect Ingredients',{Text='Auto Collect Ingredients',Default=false,Callback=
function(ax)_G.AutoPickupIngredients=ax while _G.AutoPickupIngredients do if CheckGlove()=='Alchemist'and game.Workspace
:FindFirstChild('Alchemist_Ingredients_')then for ay,az in pairs(game.Workspace:FindFirstChild('Alchemist_Ingredients_')
:GetChildren())do if az:IsA('Model')and az:FindFirstChild('Clickbox')and az.Clickbox:FindFirstChild('ClickDetector')then
az.Clickbox.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end end end task.wait()end end})aw:
AddToggle('Auto Collect Pillow',{Text='Auto Collect Pillow',Default=false,Callback=function(ax)_G.AutoCollectPillow=ax
while _G.AutoCollectPillow do if CheckGlove()=='Pillow'and game.Workspace:FindFirstChild('pillows_')then for ay,az in
pairs(game.Workspace:FindFirstChild('pillows_'):GetChildren())do if az.Name=='pillow_model'and az:FindFirstChild(
'Clickbox')and az.Clickbox:FindFirstChild('ClickDetector')then az.Clickbox.CFrame=game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame end end end task.wait()end end})aw:AddToggle('Infinity Pillow',{Text='Infinity Pillow',Default=
false,Callback=function(ax)_G.InfinityPillow=ax if CheckGlove()=='Pillow'then while _G.InfinityPillow do game:
GetService('ReplicatedStorage').Events.PillowEvent:FireServer('AddPillow')task.wait()end elseif _G.InfinityPillow==true
then Notification("You don't have Pillow equipped",_G.TimeNotify)wait(0.05)g['Infinity Pillow']:SetValue(false)end end})
aw:AddToggle('Infinite Ingredients',{Text='Infinite Ingredients',Default=false,Callback=function(ax)_G.
InfiniteIngredients=ax if CheckGlove()=='Alchemist'then while _G.InfiniteIngredients do if CheckGlove()=='Alchemist'then
for ay,az in ipairs({'Mushroom','Glowing Mushroom','Fire Flower','Winter Rose','Dark Root','Dire Flower','Autumn Sprout'
,'Elder Wood','Hazel Lily','Wild Vine','Jade Stone','Lamp Grass','Blood Rose','Plane Flower','Blue Crystal',
'Red Crystal','Cake Mix'})do game.ReplicatedStorage.AlchemistEvent:FireServer('AddItem',az)end end task.wait()end elseif
_G.InfiniteIngredients==true then g['Infinite Ingredients']:SetValue(false)wait(0.05)Notification(
"You don't have Alchemist equipped",_G.TimeNotify)end end})local ax={}for ay,az in pairs(_G.GetPotion)do table.insert(ax
,ay)end aw:AddDropdown('Potion',{Text='Potion',Values=ax,Default='',Multi=false,Callback=function(ay)_G.MakePotion=ay
end})aw:AddSlider('Potion1',{Text='Potion',Default=1,Min=1,Max=100,Rounding=0,Compact=true,Callback=function(ay)_G.
PotionNumber=ay end})aw:AddDropdown('Potion2',{Text='Potion',Values={'Number','Normal'},Default='',Multi=false,Callback=
function(ay)_G.Potion2=ay end})aw:AddButton('Get Potions',function()if CheckGlove()=='Alchemist'then if not game.
Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Cauldron")then game:GetService('ReplicatedStorage').
GeneralAbility:FireServer()end if _G.Potion2=='Normal'then for ay=1,#_G.GetPotion[_G.MakePotion]do repeat task.wait()if
not game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Cauldron")then game:GetService('ReplicatedStorage')
.GeneralAbility:FireServer()end until game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Cauldron")game:
GetService('ReplicatedStorage').AlchemistEvent:FireServer('AddItem',_G.GetPotion[_G.MakePotion][ay])game:GetService(
'ReplicatedStorage').AlchemistEvent:FireServer('MixItem',_G.GetPotion[_G.MakePotion][ay])task.wait()end game:GetService(
'ReplicatedStorage').AlchemistEvent:FireServer('BrewPotion')elseif _G.Potion2=='Number'then for ay=1,_G.PotionNumber do
for az=1,#_G.GetPotion[_G.MakePotion]do repeat task.wait()if not game.Workspace:FindFirstChild(game.Players.LocalPlayer.
Name.."'s Cauldron")then game:GetService('ReplicatedStorage').GeneralAbility:FireServer()end until game.Workspace:
FindFirstChild(game.Players.LocalPlayer.Name.."'s Cauldron")game:GetService('ReplicatedStorage').AlchemistEvent:
FireServer('AddItem',_G.GetPotion[_G.MakePotion][az])game:GetService('ReplicatedStorage').AlchemistEvent:FireServer(
'MixItem',_G.GetPotion[_G.MakePotion][az])end game:GetService('ReplicatedStorage').AlchemistEvent:FireServer(
'BrewPotion')end end else Notification("You don't have Alchemist equipped",_G.TimeNotify)end end)aw:AddButton(
'Get All Potions',function()if CheckGlove()=='Alchemist'then if not game.Workspace:FindFirstChild(game.Players.
LocalPlayer.Name.."'s Cauldron")then game:GetService('ReplicatedStorage').GeneralAbility:FireServer()end for ay,az in
pairs(_G.GetPotion)do for aA,aB in pairs(az)do repeat task.wait(0.2)if not game.Workspace:FindFirstChild(game.Players.
LocalPlayer.Name.."'s Cauldron")then game:GetService('ReplicatedStorage').GeneralAbility:FireServer()end until game.
Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Cauldron")game:GetService('ReplicatedStorage').
AlchemistEvent:FireServer('AddItem',aB)game:GetService('ReplicatedStorage').AlchemistEvent:FireServer('MixItem',aB)task.
wait(0.07)end game:GetService('ReplicatedStorage').AlchemistEvent:FireServer('BrewPotion')end else Notification(
"You don't have Alchemist equipped",_G.TimeNotify)end end)aw:AddToggle('Auto Get Potion',{Text='Auto Get Potion',Default
=false,Callback=function(ay)_G.AutoMakePotion=ay if CheckGlove()=='Alchemist'then while _G.AutoMakePotion do if
CheckGlove()=='Alchemist'then if not game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s Cauldron")then
game:GetService('ReplicatedStorage').GeneralAbility:FireServer()end for az=1,#_G.GetPotion[_G.MakePotion]do game:
GetService('ReplicatedStorage').AlchemistEvent:FireServer('AddItem',_G.GetPotion[_G.MakePotion][az])game:GetService(
'ReplicatedStorage').AlchemistEvent:FireServer('MixItem',_G.GetPotion[_G.MakePotion][az])end game:GetService(
'ReplicatedStorage').AlchemistEvent:FireServer('BrewPotion')end task.wait(0.01)end elseif _G.AutoMakePotion==true then g
['Auto Get Potion']:SetValue(false)wait(0.05)Notification("You don't have Alchemist equipped",_G.TimeNotify)end end})aw:
AddToggle('Auto PingPong',{Text='Auto Slap Ping Pong',Default=false,Callback=function(ay)_G.AutoPingPongReal=ay while _G
.AutoPingPongReal do if CheckGlove()=='Ping Pong'then if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then for az,aA in pairs(game.Workspace:GetChildren())do if aA.Name:find('_PingPongBall')and(game.
Players.LocalPlayer.Character.HumanoidRootPart.Position-aA.Position).Magnitude<=48 then game:GetService(
'ReplicatedStorage'):WaitForChild('PingPongEvent'):FireServer()end end end end task.wait()end end})aw:AddInput('Players'
,{Default='',Numeric=false,Text='Player',Finished=true,Placeholder='Username',Callback=function(ay)_G.PlayerButton2=
FoundPlr(ay,true).Name end})aw:AddInput('SpeedOrbit',{Default='20',Numeric=false,Text='Speed',Placeholder='UserSpeed',
Callback=function(ay)if ay=='inf'or ay=='Inf'or ay=='infinity'or ay=='Infinity'then OrbitSpeed=9e9 else OrbitSpeed=ay
end end})aw:AddSlider('Extend',{Text='Extend Ability',Default=0,Min=0,Max=100,Rounding=0,Compact=true,Callback=function(
ay)_G.ExtendPingPong=ay end})aw:AddDropdown('Clone',{Text='Clone',Values={'Orbit','Orbit Player'},Default='',Multi=false
,Callback=function(ay)_G.Clone=ay end})aw:AddToggle('Auto Clone',{Text='Auto Clone',Default=false,Callback=function(ay)
_G.CloneAuto=ay if CheckGlove()=='Cherry'or CheckGlove()=='Replica'then while _G.CloneAuto do local az=CFrame.new(math.
cos(tick()*OrbitSpeed+(i-1)*math.pi/2)*_G.ExtendPingPong,0,math.sin(tick()*OrbitSpeed+(i-1)*math.pi/2)*_G.ExtendPingPong
)if CheckGlove()=='Cherry'then if workspace:FindFirstChild('cherry_storage')then for aA,aB in pairs(workspace.
cherry_storage:GetChildren())do if aB.Name==('Cherry '..game.Players.LocalPlayer.Name)and aB:FindFirstChild(
'HumanoidRootPart')and aB:FindFirstChild('clone_remote')and IsNetworkOwner(aB.HumanoidRootPart)then aB.clone_remote:
FireServer()if _G.Clone=='Orbit'then aB.HumanoidRootPart.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame*az elseif _G.Clone=='Orbit Player'then aB.HumanoidRootPart.CFrame=game.Players[_G.PlayerButton2].Character.
HumanoidRootPart.CFrame*az end end end end elseif CheckGlove()=='Replica'then for aA,aB in pairs(game.Workspace:
GetChildren())do if aB.Name==('\u{c5}'..game.Players.LocalPlayer.Name)and aB:FindFirstChild('HumanoidRootPart')and
IsNetworkOwner(aB.HumanoidRootPart)then if _G.Clone=='Orbit'then aB.HumanoidRootPart.CFrame=game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame*az elseif _G.Clone=='Orbit Player'then aB.HumanoidRootPart.CFrame=game.Players[_G.
PlayerButton2].Character.HumanoidRootPart.CFrame*az end end end end task.wait()end elseif _G.CloneAuto==true then
Notification("You don't have Cherry or Replica equipped",_G.TimeNotify)wait(0.05)g['Auto Clone']:SetValue(false)end end}
)aw:AddDropdown('Ping Pong Choose',{Text='Ping Pong',Values={'Fling','Fling Player','Orbit','Orbit Player'},Default='',
Multi=false,Callback=function(ay)_G.PingPongServer=ay end})aw:AddToggle('PingPong',{Text='Ping Pong',Default=false,
Callback=function(ay)_G.PingPongServerBr=ay if CheckGlove()=='Ping Pong'then PingPongBall=game.Players.LocalPlayer.Name
..'_PingPongBall'if _G.PingPongServer=='Orbit'then Orbit='0'if OrbitSpeed==nil then OrbitSpeed=1 end game.Players.
LocalPlayer.Character.Torso.RadioPart.Rotation=game.Players.LocalPlayer.Character.HumanoidRootPart.Rotation end while _G
.PingPongServerBr do if _G.PingPongServer=='Orbit'then game:GetService('ReplicatedStorage').GeneralAbility:FireServer()
Orbit=Orbit+OrbitSpeed game.Players.LocalPlayer.Character.Torso.RadioPart.Rotation=Vector3.new(-180,Orbit,-180)if game.
Players.LocalPlayer.Character.Torso.RadioPart:GetChildren()[2]then for az,aA in pairs(game.Workspace:GetChildren())do if
aA.ClassName=='Part'and aA.Name==PingPongBall then aA.CFrame=game.Players.LocalPlayer.Character.Torso.RadioPart.CFrame*
CFrame.new(0,0,-_G.ExtendPingPong)*CFrame.Angles(math.rad(0),math.rad(-90),math.rad(0))end end for az,aA in pairs(game.
Players.LocalPlayer.Character.Torso.RadioPart:GetChildren())do if aA.ClassName=='Part'and aA.Name==PingPongBall then aA.
CFrame=game.Players.LocalPlayer.Character.Torso.RadioPart.CFrame*CFrame.new(0,0,_G.ExtendPingPong)*CFrame.Angles(math.
rad(0),math.rad(90),math.rad(0))end end elseif game.Players.LocalPlayer.Character.Torso.RadioPart:GetChildren()[1]or
game.Players.LocalPlayer.Character.Torso.RadioPart:GetChildren()[2]then for az,aA in pairs(game.Workspace:GetChildren())
do if aA.ClassName=='Part'and aA.Name==PingPongBall then aA.Parent=game.Players.LocalPlayer.Character.Torso.RadioPart
break end end end elseif _G.PingPongServer=='Orbit Player'then game:GetService('ReplicatedStorage').GeneralAbility:
FireServer()if game.Players[_G.PlayerButton2].Character and game.Players[_G.PlayerButton2].Character:WaitForChild(
'Ragdolled').Value==false then for az,aA in pairs(game.Workspace:GetChildren())do if aA.Name==(game.Players.LocalPlayer.
Name..'_PingPongBall')then aA.CFrame=game.Players[_G.PlayerButton2].Character.HumanoidRootPart.CFrame*CFrame.new(math.
cos(tick()*OrbitSpeed+(az-1)*math.pi/2)*_G.ExtendPingPong,0,math.sin(tick()*OrbitSpeed+(az-1)*math.pi/2)*_G.
ExtendPingPong)end end end elseif _G.PingPongServer=='Fling'then game:GetService('ReplicatedStorage').GeneralAbility:
FireServer()for az,aA in pairs(game.Players:GetPlayers())do if aA~=game.Players.LocalPlayer and game.Players.LocalPlayer
.Character:FindFirstChild('HumanoidRootPart')and aA.Character then if aA.Character:FindFirstChild('entered')and aA.
Character:FindFirstChild('HumanoidRootPart')and aA.Character:FindFirstChild('stevebody')==nil and aA.Character:
FindFirstChild('rock')==nil and aA.Character.HumanoidRootPart.BrickColor~=BrickColor.new('New Yeller')and aA.Character.
Ragdolled.Value==false and aA.Character:FindFirstChild('Mirage')==nil then for aB,aC in pairs(game.Workspace:
GetChildren())do if aC.Name==(game.Players.LocalPlayer.Name..'_PingPongBall')then aC.CFrame=aA.Character.
HumanoidRootPart.CFrame break end end end end end elseif _G.PingPongServer=='Fling Player'then game:GetService(
'ReplicatedStorage').GeneralAbility:FireServer()if game.Players[_G.PlayerButton2].Character and game.Players[_G.
PlayerButton2].Character:WaitForChild('Ragdolled').Value==false then for az,aA in pairs(game.Workspace:GetChildren())do
if aA.Name==(game.Players.LocalPlayer.Name..'_PingPongBall')then aA.CFrame=game.Players[_G.PlayerButton2].Character.
HumanoidRootPart.CFrame end end end end task.wait(0.01)end elseif ay==true then Notification(
"You don't have Ping Pong equipped.",_G.TimeNotify)wait(0.05)g['PingPong']:SetValue(false)end end})aw:AddSlider(
'ExtendRob',{Text='Extend HitBox Rob',Default=16,Min=16,Max=400,Rounding=1,Compact=true,Callback=function(ay)_G.
ExtendHitboxRob=ay end})aw:AddDropdown('Hitbox Rob',{Text='Hitbox Rob',Values={'You','All'},Default='All',Multi=false,
Callback=function(ay)_G.RobHitbox=ay end})aw:AddToggle('Hitbox Rob',{Text='Hitbox All Rob & Color',Default=false,
Callback=function(ay)_G.HitboxRob=ay while _G.HitboxRob do if _G.RobHitbox=='All'then for az,aA in pairs(game.Workspace:
GetChildren())do if aA.Name=='Field'then aA.Size=Vector3.new(_G.ExtendHitboxRob,_G.ExtendHitboxRob,_G.ExtendHitboxRob)aA
.BrickColor=BrickColor.new(_G.ColorHitboxRob)end end elseif _G.RobHitbox=='You'then for az,aA in pairs(game.Workspace:
GetChildren())do if aA.Name=='Field'and(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-aA.Position).
Magnitude<=1 then aA.Size=Vector3.new(_G.ExtendHitboxRob,_G.ExtendHitboxRob,_G.ExtendHitboxRob)aA.BrickColor=BrickColor.
new(_G.ColorHitboxRob)end end end task.wait()end if _G.HitboxRob==false then for az,aA in pairs(game.Workspace:
GetChildren())do if aA.Name=='Field'then aA.Size=Vector3.new(16,16,16)aA.BrickColor=BrickColor.new(255,255,255)end end
end end}):AddColorPicker('Color Hitbox Rob',{Default=Color3.new(255,255,255),Callback=function(ay)_G.ColorHitboxRob=ay
end})_G.SetSpeedFlyCloud=2 aw:AddInput('FlySpeed',{Default='2',Numeric=true,Text='Fly Speed Cloud',Placeholder=
'UserFlySpeed',Callback=function(ay)_G.SetSpeedFlyCloud=ay end})aw:AddToggle('Cloud Speed',{Text='Cloud Speed',Default=
false,Callback=function(ay)_G.CloudSpeed=ay if CheckGlove()=='Cloud'then while _G.CloudSpeed do for az,aA in pairs(game.
Workspace:GetChildren())do if aA.Name:match(game.Players.LocalPlayer.Name)and aA:FindFirstChild('BodyVelocity')and aA:
FindFirstChild('VehicleSeat')then if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')then if 3>=(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-aA.
VehicleSeat.Position).Magnitude then local aB=aA.BodyVelocity.Velocity if MobileOn then local aC=require(game.Players.
LocalPlayer.PlayerScripts:WaitForChild('PlayerModule'):WaitForChild('ControlModule')):GetMoveVector()if aC.X>0 then aB=
aB+game.Workspace.CurrentCamera.CFrame.RightVector*(aC.X*_G.SetSpeedFlyCloud)end if aC.X<0 then aB=aB+game.Workspace.
CurrentCamera.CFrame.RightVector*(aC.X*_G.SetSpeedFlyCloud)end if aC.Z>0 then aB=aB-game.Workspace.CurrentCamera.CFrame.
LookVector*(aC.Z*_G.SetSpeedFlyCloud)end if aC.Z<0 then aB=aB-game.Workspace.CurrentCamera.CFrame.LookVector*(aC.Z*_G.
SetSpeedFlyCloud)end else aB=aB+(game.Workspace.CurrentCamera.CFrame.LookVector*(ctrlCould.f.f+ctrlCould.b))+(game.
Workspace.CurrentCamera.CFrame.RightVector*(ctrlCould.r+ctrlCould.l))end aA.BodyVelocity.Velocity=aB end end end end
task.wait()end elseif _G.CloudSpeed==true then Notification("You don't have Cloud equipped.",_G.TimeNotify)wait(0.05)g[
'Cloud Speed']:SetValue(false)end end})aw:AddInput('Players',{Default='',Numeric=false,Text='Player',Finished=true,
Placeholder='Username',Callback=function(ay)_G.PlayerButton3=FoundPlr(ay,true).Name end})aw:AddDropdown('Cloud Bring',{
Text='Cloud Seat',Values={'Player','Your'},Default='Player',Multi=false,Callback=function(ay)_G.CloudBring=ay end})aw:
AddToggle('Auto Bring Cloud',{Text='Auto Seat Cloud',Default=false,Callback=function(ay)_G.BringCloud=ay if CheckGlove()
=='Cloud'then while _G.BringCloud do if _G.CloudBring=='Player'then if game.Players.LocalPlayer.Character:
FindFirstChild('entered')and game.Players[_G.PlayerButton3].Character:FindFirstChild('entered')and game.Players[_G.
PlayerButton3].Character.Humanoid.Sit==false then for az,aA in pairs(game.Workspace:GetChildren())do if aA.Name:match(
game.Players.LocalPlayer.Name)and aA:FindFirstChild('VehicleSeat')then aA.VehicleSeat.CFrame=game.Players[_G.
PlayerButton3].Character.HumanoidRootPart.CFrame*CFrame.new(0,-2.32,0)end end end elseif _G.CloudBring=='Your'then if
game.Players.LocalPlayer.Character:FindFirstChild('entered')and game.Players.LocalPlayer.Character:FindFirstChild(
'Humanoid')~=nil and game.Players.LocalPlayer.Character.Humanoid.Sit==false then for az,aA in pairs(game.Workspace:
GetChildren())do if aA.Name:match(game.Players.LocalPlayer.Name)and aA:FindFirstChild('VehicleSeat')then aA.VehicleSeat.
CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,-2.32,0)end end end end task.wait()end
elseif _G.BringCloud==true then Notification("You don't have Cloud equipped.",_G.TimeNotify)wait(0.05)g[
'Auto Bring Cloud']:SetValue(false)end end})aw:AddDropdown('Firework Bring',{Text='Firework Seat',Values={'Player',
'Your'},Default='Player',Multi=false,Callback=function(ay)_G.FireworkBring=ay end})aw:AddToggle('Auto Bring Firework',{
Text='Auto Seat Firework',Default=false,Callback=function(ay)_G.BringFirework=ay if CheckGlove()=='Firework'then while
_G.BringFirework do if _G.FireworkBring=='Player'then if game.Players.LocalPlayer.Character:FindFirstChild('entered')and
game.Players[_G.PlayerButton3].Character:FindFirstChild('entered')and game.Players[_G.PlayerButton3].Character.Humanoid.
Sit==false then for az,aA in pairs(game.Workspace:GetChildren())do if aA.Name:match(game.Players.LocalPlayer.Name)and aA
:FindFirstChild('VehicleSeat')then aA.VehicleSeat.CFrame=game.Players[_G.PlayerButton3].Character.HumanoidRootPart.
CFrame end end end elseif _G.FireworkBring=='Your'then if game.Players.LocalPlayer.Character:FindFirstChild('entered')
and game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')~=nil and game.Players.LocalPlayer.Character.
Humanoid.Sit==false then for az,aA in pairs(game.Workspace:GetChildren())do if aA.Name:match(game.Players.LocalPlayer.
Name)and aA:FindFirstChild('VehicleSeat')then aA.VehicleSeat.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame end end end end task.wait()end elseif _G.BringFirework==true then Notification(
"You don't have Firework equipped.",_G.TimeNotify)wait(0.05)g['Auto Bring Firework']:SetValue(false)end end})aw:
AddToggle('Auto Full Kinetic',{Text='Auto Full Kinetic',Default=false,Callback=function(ay)_G.FullKineticSpam=ay if
CheckGlove()=='Kinetic'and game.Players.LocalPlayer.Character:FindFirstChild('entered')then while _G.FullKineticSpam do
game.ReplicatedStorage.SelfKnockback:FireServer({['Force']=0,['Direction']=Vector3.new(0,0.01,0)})task.wait()end elseif
_G.FullKineticSpam==true then Notification("You don't have Kinetic equipped.",_G.TimeNotify)wait(0.05)g[
'Auto Full Kinetic']:SetValue(false)end end})aw:AddButton('Infinite Invisibility',function()if game.Players.LocalPlayer.
Character:FindFirstChild('entered')==nil and game.Players.LocalPlayer.leaderstats.Slaps.Value>=666 then local ay=
CheckGlove()fireclickdetector(workspace.Lobby.Ghost.ClickDetector)game.ReplicatedStorage.Ghostinvisibilityactivated:
FireServer()fireclickdetector(workspace.Lobby[ay].ClickDetector)task.wait(1)for az,aA in pairs(game.Players.LocalPlayer.
Character:GetChildren())do if aA:IsA('BasePart')and aA.Name~='HumanoidRootPart'then aA.Transparency=0 end end else
Notification('You need to be in lobby and have 666+ slaps.',_G.TimeNotify)end end)table.insert(_G.ConnectFun,game.
Workspace.NoChanged.Changed:Connect(function()for ay,az in pairs(_G.AntiToggles)do spawn(function()g[ay]:SetValue(game.
Workspace.NoChanged.Value)end)end end))elseif game.PlaceId==11828384869 then Window:ChangeTitle(
'Maze Elude \u{1f441}\u{fe0f}')Tabs={Tab=Window:AddTab('Misc',B.Misc),['UI Settings']=Window:AddTab('UI Settings',B.
Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Misc')aa:AddButton('Get Elude + Counter',function()Time=121 wait(0.4)game.
Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.CounterLever.Main.CFrame game.Workspace.CounterLever.
ClickDetector.MouseClick:Connect(function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(0,100,0
)wait(0.2)game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored=true for ab=1,Time do Time=Time-1 game:
GetService('StarterGui'):SetCore('SendNotification',{Title='Error',Text='You wait time [ '..Time..' ] receive.',Icon=
'rbxassetid://7733658504',Duration=1})wait(1)end game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored=false for
ab,ac in pairs(workspace.Maze:GetChildren())do if ac.Name=='Part'and ac:FindFirstChild('A0')and ac:FindFirstChild(
'ClickDetector')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ac.CFrame*CFrame.new(0,-20,0)ac.
ClickDetector.MouseClick:Connect(function()game.Workspace.Ruins.Elude.Glove.CFrame=game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame end)end end end)pcall(function()fireclickdetector(game.Workspace.CounterLever.ClickDetector)
repeat task.wait()until Time==0 wait(2)for ab,ac in pairs(workspace.Maze:GetChildren())do if ac.Name=='Part'and ac:
FindFirstChild('A0')and ac:FindFirstChild('ClickDetector')then fireclickdetector(ac.ClickDetector)end end end)end)aa:
AddButton('Teleport Alchemist Plushie',function()if game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored==true
then game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored=false wait(0.5)game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=game.Workspace._ugcQuestObjectEludeHat.Handle.CFrame else game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=game.Workspace._ugcQuestObjectEludeHat.Handle.CFrame end end)elseif game.PlaceId==13833961666
then Window:ChangeTitle('Boss Bob \26')if workspace:FindFirstChild('VoidPart')==nil then local aa=Instance.new('Part',
workspace)aa.Name='VoidPart'aa.Position=Vector3.new(-36,-3,16)aa.Size=Vector3.new(2000,1,2000)aa.Anchored=true aa.
Transparency=1 aa.CanCollide=false end Tabs={Tab=Window:AddTab('Script',B.Script),Tab1=Window:AddTab('Misc',B.Misc),[
'UI Settings']=Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddRightGroupbox('Script')aa:AddButton('Fly V3'
,function()loadstring(game:HttpGet([[https://raw.githubusercontent.com/Giangplay/Script/main/Fly_V3.lua]]))()end)aa:
AddButton('Anti Lag',function()loadstring(game:HttpGet(
[[https://raw.githubusercontent.com/Giangplay/Script/main/Anti-lag.lua]]))()end)aa:AddButton('Inf Yield',function()
loadstring(game:HttpGet(([[https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source]]),true))()end)aa:
AddButton('Executor | Ui Library',function()loadstring(game:HttpGet(
[[https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/Executor.lua]]))()end)aa:AddButton(
'RemoteSpy',function()loadstring(game:HttpGet(
[[https://raw.githubusercontent.com/Giangplay/Script/main/RemoteSpy-V2.lua]],true))()end)local ab=Tabs.Tab:
AddLeftGroupbox('Info')CanYouFps=ab:AddLabel('Your Fps [ '..math.floor(workspace:GetRealPhysicsFPS())..' ]',true)
CanYouPing=ab:AddLabel('Your Ping [ '..game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValueString()..
' ]',true)TimeServer=ab:AddLabel('Server Time [ '..math.floor(workspace.DistributedGameTime/60/60)..' Hour | '..math.
floor(workspace.DistributedGameTime/60)-(math.floor(workspace.DistributedGameTime/60/60)*60)..' Minute | '..math.floor(
workspace.DistributedGameTime)-(math.floor(workspace.DistributedGameTime/60)*60)..' Second ]',true)TimeNow=ab:AddLabel(
'Now Time [ '..os.date('%X')..' ]',true)Health=ab:AddLabel('Health [ '..game.Players.LocalPlayer.Character.Humanoid.
Health..' ]',true)HealthBoss=ab:AddLabel('Health Boss [ Nah ]',true)if tonumber(os.date('%H'))>=5 and tonumber(os.date(
'%H'))<12 then AlarmTime=ab:AddLabel('Good Morning [ '..tonumber(os.date('%H'))..' Hour ]',true)elseif tonumber(os.date(
'%H'))>=12 and tonumber(os.date('%H'))<17 then AlarmTime=ab:AddLabel('Good Afternoon [ '..tonumber(os.date('%H'))..
' Hour ]',true)elseif tonumber(os.date('%H'))>=17 and tonumber(os.date('%H'))<21 then AlarmTime=ab:AddLabel(
'Good Evening [ '..tonumber(os.date('%H'))..' Hour ]',true)else AlarmTime=ab:AddLabel('Good Night [ '..tonumber(os.date(
'%H'))..' Hour ]',true)end AgeAccYou=ab:AddLabel('You Account Age [ '..game.Players.LocalPlayer.AccountAge..' ]',true)ab
:AddToggle('Auto Set Info',{Text='Auto Set Info',Default=false,Callback=function(ac)_G.InfoServerSet=ac end})table.
insert(_G.ConnectFun,game.RunService.Heartbeat:Connect(function()if not _G.InfoServerSet then return end pcall(function(
)CanYouFps:SetText('Your Fps [ '..math.floor(workspace:GetRealPhysicsFPS())..' ]',true)CanYouPing:SetText('Your Ping [ '
..game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValueString()..' ]',true)TimeServer:SetText(
'Server Time [ '..math.floor(workspace.DistributedGameTime/60/60)..' Hour | '..math.floor(workspace.DistributedGameTime/
60)-(math.floor(workspace.DistributedGameTime/60/60)*60)..' Minute | '..math.floor(workspace.DistributedGameTime)-(math.
floor(workspace.DistributedGameTime/60)*60)..' Second ]',true)TimeNow:SetText('Now Time [ '..os.date('%X')..' ]',true)
Health:SetText('Health [ '..game.Players.LocalPlayer.Character.Humanoid.Health..' ]',true)if game.Workspace:
FindFirstChild('BossFolder')and game.Workspace.BossFolder:FindFirstChild('Health')then HealthBoss:SetText(
'Health Boss [ '..game.Workspace.BossFolder.Health.Value..' ]',true)else HealthBoss:SetText(
'Check Health Boss [ Not Started Yet ]',true)end if tonumber(os.date('%H'))>=5 and tonumber(os.date('%H'))<12 then
AlarmTime:SetText('Good Morning [ '..tonumber(os.date('%H'))..' Hour ]',true)elseif tonumber(os.date('%H'))>=12 and
tonumber(os.date('%H'))<17 then AlarmTime:SetText('Good Afternoon [ '..tonumber(os.date('%H'))..' Hour ]',true)elseif
tonumber(os.date('%H'))>=17 and tonumber(os.date('%H'))<21 then AlarmTime:SetText('Good Evening [ '..tonumber(os.date(
'%H'))..' Hour ]',true)else AlarmTime:SetText('Good Night [ '..tonumber(os.date('%H'))..' Hour ]',true)end AgeAccYou:
SetText('You Account Age [ '..game.Players.LocalPlayer.AccountAge..' ]',true)end)end))table.insert(_G.ConnectFun,game.
RunService.Heartbeat:Connect(function()if _G.AntiRing then if game.Workspace:FindFirstChild('Ring')then game.Workspace:
FindFirstChild('Ring'):Destroy()end end if _G.AntiRagdoll then if game.Players.LocalPlayer.Character and game.Players.
LocalPlayer.Character:WaitForChild('HumanoidRootPart')then if game.Players.LocalPlayer.Character:WaitForChild(
'Ragdolled').Value==true then game.Players.LocalPlayer.Character.Torso.Anchored=true else game.Players.LocalPlayer.
Character.Torso.Anchored=false end end end end))local ac=Tabs.Tab1:AddLeftGroupbox('Combat')ac:AddToggle('Damage Boss',{
Text='Damage Boss',Default=false,Callback=function(ad)_G.DameBossBob=ad while _G.DameBossBob do if game.Workspace:
FindFirstChild('bobBoss')then game.Workspace.bobBoss.DamageEvent:FireServer()end task.wait()end end})ac:AddToggle(
'Auto Click Tycoon',{Text='Auto Click Tycoon',Default=false,Callback=function(ad)_G.AutoTycoon=ad while _G.AutoTycoon do
for ae,af in pairs(workspace:GetChildren())do if string.find(af.Name,'\u{c5}Tycoon')and af:FindFirstChild('Click')then
fireclickdetector(af.Click.ClickDetector,0)fireclickdetector(af.Click.ClickDetector,1)end end task.wait()end end})ac:
AddDropdown('Glove',{Text='Glove',Values={'Killstreak','Reaper',"God's Hand",'Tycoon'},Default='Player',Multi=false,
Callback=function(ad)GloveSlap=ad end})ac:AddToggle('Slap Aura Bob Mini',{Text='Slap Aura Bob Mini',Default=false,
Callback=function(ad)_G.SlapBobClone=ad while _G.SlapBobClone do if game.Workspace:FindFirstChild('BobClone')then for ae
,af in pairs(workspace:GetChildren())do if af.Name=='BobClone'then if GloveSlap=='Killstreak'then game:GetService(
'ReplicatedStorage').KSHit:FireServer(af:FindFirstChild('HumanoidRootPart'))elseif GloveSlap=='Reaper'then game:
GetService('ReplicatedStorage').ReaperHit:FireServer(af:FindFirstChild('HumanoidRootPart'))elseif GloveSlap==
"God's Hand"then game:GetService('ReplicatedStorage').Godshand:FireServer(af:FindFirstChild('HumanoidRootPart'))elseif
GloveSlap=='Tycoon'then game:GetService('ReplicatedStorage').GeneralHit:FireServer(af:FindFirstChild('HumanoidRootPart')
)end end end end task.wait()end end})ac:AddButton('Slap Aura Bob Mini',function()if game.Workspace:FindFirstChild(
'BobClone')then for ad,ae in pairs(workspace:GetChildren())do if ae.Name=='BobClone'then if GloveSlap=='Killstreak'then
game:GetService('ReplicatedStorage').KSHit:FireServer(ae:FindFirstChild('HumanoidRootPart'))elseif GloveSlap=='Reaper'
then game:GetService('ReplicatedStorage').ReaperHit:FireServer(ae:FindFirstChild('HumanoidRootPart'))elseif GloveSlap==
"God's Hand"then game:GetService('ReplicatedStorage').Godshand:FireServer(ae:FindFirstChild('HumanoidRootPart'))elseif
GloveSlap=='Tycoon'then game:GetService('ReplicatedStorage').GeneralHit:FireServer(ae:FindFirstChild('HumanoidRootPart')
)end end end end end)ac:AddButton('Button Fight Rock',function()if game.CoreGui:FindFirstChild('SlapRock')==nil then
local ad=Instance.new('ScreenGui')local ae=Instance.new('ImageButton')local af=Instance.new('UICorner')local ag=Instance
.new('ParticleEmitter')ad.Parent=game.CoreGui ad.Name='SlapRock'ad.ZIndexBehavior=Enum.ZIndexBehavior.Sibling ae.Parent=
ad ae.Image='http://www.roblox.com/asset/?id=85284641800085'ae.BackgroundColor3=Color3.fromRGB(0,0,0)ae.BorderSizePixel=
0 ae.Position=UDim2.new(2.0833336999999994E-2,0,0.10528908129999999,0)ae.Size=UDim2.new(0,50,0,50)ae.Draggable=true af.
Parent=ae af.CornerRadius=UDim.new(0,12)ag.Parent=ae ag.LightEmission=1 ag.Size=NumberSequence.new({
NumberSequenceKeypoint.new(0,0.1),NumberSequenceKeypoint.new(1,0)})ag.Lifetime=NumberRange.new(0.5,1)ag.Rate=0 ag.Speed=
NumberRange.new(5,10)ag.Color=ColorSequence.new(Color3.fromRGB(255,85,255),Color3.fromRGB(85,255,255))local ah=game:
GetService('TweenService'):Create(ae,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Rotation=360})ae
.MouseEnter:Connect(function()game:GetService('TweenService'):Create(ae,TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.
EasingDirection.Out),{Size=UDim2.new(0,65,0,65)}):Play()end)ae.MouseLeave:Connect(function()game:GetService(
'TweenService'):Create(ae,TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(0,50,0,50)})
:Play()end)ae.MouseButton1Down:Connect(function()for ai,aj in pairs(workspace:GetChildren())do if aj.Name=='SpiritRock'
and aj:FindFirstChild('DamageEvent')then aj.DamageEvent:FireServer()end end ag.Rate=100 task.delay(1,function()ag.Rate=0
end)ah:Play()ah.Completed:Connect(function()ae.Rotation=0 end)end)end end)local ad=Tabs.Tab1:AddRightGroupbox('Anti')ad:
AddButton('Remove VFX',function()if game.Players.LocalPlayer.PlayerScripts:FindFirstChild('VFXListener')then game.
Players.LocalPlayer.PlayerScripts.VFXListener:Destroy()end end)ad:AddToggle('Anti Ring',{Text='Anti Ring',Default=false,
Callback=function(ae)_G.AntiRing=ae end}):AddKeyPicker('AntiRing',{Default='X',Text='Anti Ring',Mode='Toggle',
SyncToggleState=true})ad:AddToggle('Anti Void Damage',{Text='Anti Void Damage',Default=false,Callback=function(ae)game.
Workspace['VoidPart'].CanCollide=ae if ae==true then game.Workspace['VoidPart'].Transparency=0.5 else game.Workspace[
'VoidPart'].Transparency=1 end end}):AddKeyPicker('AntiVoidDamage',{Default='X',Text='Anti Void Damage',Mode='Toggle',
SyncToggleState=true})ad:AddToggle('Anti Ragdoll',{Text='Anti Ragdoll',Default=false,Callback=function(ae)_G.AntiRagdoll
=ae end}):AddKeyPicker('AntiRagdoll',{Default='X',Text='Anti Ragdoll',Mode='Toggle',SyncToggleState=true})elseif game.
PlaceId==9431156611 then if game.Workspace.Map.CodeBrick.SurfaceGui:FindFirstChild('IMGTemplate')then Code={}for aa,ab
in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren())do if ab.Name=='IMGTemplate'then if ab.Image==
'http://www.roblox.com/asset/?id=9648769161'then table.insert(Code,'4')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648765536'then table.insert(Code,'2')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648762863'then table.insert(Code,'3')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648759883'then table.insert(Code,'9')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648755440'then table.insert(Code,'8')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648752438'then table.insert(Code,'2')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648749145'then table.insert(Code,'8')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648745618'then table.insert(Code,'3')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648742013'then table.insert(Code,'7')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648738553'then table.insert(Code,'8')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648734698'then table.insert(Code,'2')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648730082'then table.insert(Code,'6')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648723237'then table.insert(Code,'3')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648718450'then table.insert(Code,'6')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648715920'then table.insert(Code,'6')elseif ab.Image==
'http://www.roblox.com/asset/?id=9648712563'then table.insert(Code,'2')end end end end Window:ChangeTitle(
'Slap Royale \u{1f3c6}')Tabs={Tab=Window:AddTab('Combat',B.Combat),Tab1=Window:AddTab('Anti / Misc',B.Anti),[
'UI Settings']=Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Combat Tools',B.Combat)
TabBoxCombat1=aa:AddTabbox({Name='Combat Tabs'})local ab=TabBoxCombat1:AddTab('Combat',B.Combat)ab:AddToggle('Slap Aura'
,{Text='Slap Aura',Default=false,Callback=function(ac)_G.SlapAura=ac while _G.SlapAura do for ad,ae in pairs(game.
Players:GetChildren())do if ae~=game.Players.LocalPlayer and ae.Character then if ae.Character:FindFirstChild('Dead')==
nil and ae.Character:FindFirstChild('HumanoidRootPart')and not ae.Character:GetAttribute('inBus')and ae.Character:
GetAttribute('inMatch')==true and ae.Character:GetAttribute('Ragdolled')==false and not game.Players.LocalPlayer.
Character:GetAttribute('inBus')and game.Players.LocalPlayer.Character:GetAttribute('inMatch')==true and game.Players.
LocalPlayer.Character:GetAttribute('Ragdolled')==false then if(game.Players.LocalPlayer.Character.HumanoidRootPart.
Position-ae.Character.HumanoidRootPart.Position).Magnitude<=20 then game.ReplicatedStorage.Remotes.Slap:FireServer(ae.
Character:WaitForChild('HumanoidRootPart'))end end end end task.wait(0.3)end end}):AddKeyPicker('SlapAura',{Default='F',
Text='Slap Aura',Mode='Toggle',SyncToggleState=true})_G.GloveExtendReach=5 ab:AddSlider('Extend Glove',{Text=
'Extend Glove',Default=5,Min=2,Max=20,Rounding=0,Compact=true,Callback=function(ac)_G.GloveExtendReach=ac end})ab:
AddDropdown('Extend Option',{Text='Extend Option',Values={'Meat Stick','Pancake','Growth','North Korea Wall',
'Slight Extend'},Default='',Multi=false,Callback=function(ac)GloveExtendOption=ac end})ab:AddToggle('Extend Glove',{Text
='Extend Glove',Default=false,Callback=function(ac)_G.GloveExtendGet=ac if _G.GloveExtendGet==false then local function 
GloveOff(ad)if ad:IsA('Tool')and ad:FindFirstChild('Glove')then ad:FindFirstChild('Glove').Size=Vector3.new(2.5,2.5,1.7)
ad:FindFirstChild('Glove').Transparency=0 end end for ad,ae in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do
GloveOff(ae)end for ad,ae in pairs(game.Players.LocalPlayer.Character:GetChildren())do GloveOff(ae)end end while _G.
GloveExtendGet do local function GloveReachOn(ad)if ad.ClassName=='Tool'and ad:FindFirstChild('Glove')then if
GloveExtendOption=='Meat Stick'then GloveReachTo=Vector3.new(0,_G.GloveExtendReach,2)elseif GloveExtendOption=='Pancake'
then GloveReachTo=Vector3.new(0,_G.GloveExtendReach,_G.GloveExtendReach)elseif GloveExtendOption=='Growth'then
GloveReachTo=Vector3.new(_G.GloveExtendReach,_G.GloveExtendReach,_G.GloveExtendReach)elseif GloveExtendOption==
'North Korea Wall'then GloveReachTo=Vector3.new(_G.GloveExtendReach,0,_G.GloveExtendReach)elseif GloveExtendOption==
'Slight Extend'then GloveReachTo=Vector3.new(3,3,3.7)end ad:FindFirstChild('Glove').Size=GloveReachTo or Vector3.new(2.5
,2.5,1.7)ad:FindFirstChild('Glove').Transparency=0.5 end end for ad,ae in pairs(game.Players.LocalPlayer.Backpack:
GetChildren())do GloveReachOn(ae)end for ad,ae in pairs(game.Players.LocalPlayer.Character:GetChildren())do
GloveReachOn(ae)end task.wait()end end})_G.ReachHitbox=10 ab:AddSlider('Reach HitBox',{Text='Reach Hitbox',Default=10,
Min=10,Max=25,Rounding=0,Compact=true,Callback=function(ac)_G.ReachHitbox=ac end})ab:AddToggle('Hitbox Player',{Text=
'Hitbox Player',Default=false,Callback=function(ac)_G.HitboxPlayer=ac while _G.HitboxPlayer do for ad,ae in pairs(game.
Players:GetChildren())do if ae~=game.Players.LocalPlayer and ae.Character and ae.Character:FindFirstChild(
'HumanoidRootPart')then ae.Character.HumanoidRootPart.Size=Vector3.new(_G.ReachHitbox,_G.ReachHitbox,_G.ReachHitbox)ae.
Character.HumanoidRootPart.Transparency=0.75 end end task.wait()end if _G.HitboxPlayer==false then for ad,ae in pairs(
game.Players:GetChildren())do if ae~=game.Players.LocalPlayer and ae.Character and ae.Character:FindFirstChild(
'HumanoidRootPart')then ae.Character.HumanoidRootPart.Size=Vector3.new(2,2,1)ae.Character.HumanoidRootPart.Transparency=
1 end end end end})ab:AddButton({Text='Leave Bus Early',Tooltip='People Vote You',Func=function()game.ReplicatedStorage.
Remotes.BusJumping:FireServer()repeat task.wait()until game.Players.LocalPlayer.PlayerGui:FindFirstChild('JumpPrompt')
game.Players.LocalPlayer.PlayerGui.JumpPrompt:Destroy()end})ab:AddButton({Text='Check Rank Admin / Other',Func=function(
)for ac,ad in pairs(game.Players:GetChildren())do if ad:GetRankInGroupAsync(9950771)>=2 then game.Players.LocalPlayer:
Kick('High Rank Player Detected.'..' [ '..ad.Name..' ]')break end end end})local ac=Tabs.Tab:AddRightGroupbox('Item')ac:
AddToggle('Auto Use Item Power',{Text='Auto Use Item Power',Default=false,Callback=function(ad)_G.AutoUseItemPower=ad
while _G.AutoUseItemPower do if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')then for ae,af in pairs(
game.Players.LocalPlayer.Backpack:GetChildren())do if af.Name=="Bull's essence"or af.Name=='Potion of Strength'or af.
Name=='Boba'or af.Name=='Speed Potion'or af.Name=='Frog Potion'or af.Name=='Strength Brew'or af.Name=='Frog Brew'or af.
Name=='Speed Brew'then game.Players.LocalPlayer.Character.Humanoid:EquipTool(af)af:Activate()end end end task.wait(0.5)
end end})ac:AddToggle('Auto Pickup Item',{Text='Auto Pickup Item',Default=false,Callback=function(ad)_G.AutoPickUpItem=
ad while _G.AutoPickUpItem do if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then for ae,af in
ipairs(game.Workspace.Items:GetChildren())do if af:IsA('Tool')and af:FindFirstChild('Handle')and typeof(af.Handle:
GetAttribute('ItemId'))=='string'then if(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-af.Handle.Position
).Magnitude<=17 then game.ReplicatedStorage.Remotes.Item:FireServer(af:FindFirstChild('Handle'):GetAttribute('ItemId'))
end end end end task.wait(0.3)end end})ac:AddSlider('Health Throw Tomahawk',{Text='Health Aimbot',Default=25,Min=10,Max=
100,Rounding=0,Compact=true})ac:AddToggle('Throw Aimbot Tomahawk',{Text='Throw Aimbot Tomahawk',Default=false,Callback=
function(ad)_G.TomahawkAimbot=ad while _G.TomahawkAimbot do if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then if game.Players.LocalPlayer.Character:FindFirstChild('Tomahawk')then for ae,af in pairs(game.
Players:GetChildren())do if af~=game.Players.LocalPlayer and af.Character and af.Character:FindFirstChildOfClass(
'Humanoid')and af.Character:FindFirstChildOfClass('Humanoid').Health<=(f['Health Throw Tomahawk'].Value or 50)then if af
.Character:FindFirstChild('Dead')==nil and af.Character:FindFirstChild('HumanoidRootPart')and af.Character:GetAttribute(
'inMatch')==true and game.Players.LocalPlayer.Character:GetAttribute('inMatch')==true and game.Players.LocalPlayer.
Character:GetAttribute('Ragdolled')==false then if(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-af.
Character.HumanoidRootPart.Position).Magnitude<=30 then game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):
WaitForChild('Throw'):FireServer(af.Character.HumanoidRootPart.Position+Vector3.new(0,3,0))end end end end end end task.
wait()end end})ac:AddSlider('AutoHeal',{Text='Auto Heal',Default=25,Min=10,Max=100,Rounding=0,Compact=true})ac:
AddToggle('Auto Heal',{Text='Auto Heal',Default=false,Callback=function(ad)_G.AutoHeal=ad while _G.AutoHeal do if game.
Players.LocalPlayer.Character:FindFirstChild('Humanoid')then for ae,af in pairs(game.Players.LocalPlayer.Backpack:
GetChildren())do for ag,ah in pairs({'Apple','Bandage','Boba','First Aid Kit','Healing Brew','Healing Potion'})do if af.
Name==ah and game.Players.LocalPlayer.Character.Humanoid.Health<(f['AutoHeal'].Value or 45)then game.Players.LocalPlayer
.Character.Humanoid:EquipTool(af)wait(0.27)af:Activate()break end end end end task.wait()end end})ac:AddButton(
'Use Item Power',function()for ad,ae in pairs(game.Players.LocalPlayer.Backpack:GetChildren())do if ae.Name==
"Bull's essence"or ae.Name=='Potion of Strength'or ae.Name=='Boba'or ae.Name=='Speed Potion'or ae.Name=='Frog Potion'or
ae.Name=='Strength Brew'or ae.Name=='Frog Brew'or ae.Name=='Speed Brew'then game.Players.LocalPlayer.Character.Humanoid:
EquipTool(ae)ae:Activate()task.wait(0.07)end end end)local ad=TabBoxCombat1:AddTab('ESP',B.Esp)ad:AddToggle('Esp Glove',
{Text='Esp Glove',Default=false,Callback=function(ae)_G.EspPlayer=ae for af,ag in pairs(game.Players:GetChildren())do if
ag~=game.Players.LocalPlayer and ag.Character and ag.Character:FindFirstChild('Head')and ag.Character:FindFirstChild(
'HumanoidRootPart')and ag.Character:FindFirstChild('Humanoid')then q:RemoveESP(ag.Character)end end while _G.EspPlayer
do local af=_G.ColorESP or Color3.new(255,255,255)for ag,ah in ipairs(game.Players:GetChildren())do if ah~=game.Players.
LocalPlayer and ah.Character and ah.Character:FindFirstChild('Dead')==nil and ah.Character:FindFirstChild('Head')and ah.
Character:FindFirstChild('Humanoid')and ah.Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.
Character:FindFirstChild('HumanoidRootPart')then q:AddESP({Object=ah.Character,Text='',Color=af})q:UpdateObjectText(ah.
Character,(ah:GetRankInGroupAsync(9950771)>=2 and'[RANK]\n'or'')..ah.Glove.Value..' | Health: '..ah.Character:
FindFirstChild('Humanoid').Health)q:UpdateObjectColor(ah.Character,af)q:SetOutlineColor(af)elseif ah.Character:
FindFirstChild('Dead')then q:RemoveESP(ah.Character)end end task.wait()end end}):AddColorPicker('Color Esp',{Default=
Color3.new(255,255,255),Callback=function(ae)_G.ColorESP=ae end})ad:AddToggle('Esp1',{Text='Item Esp',Default=false,
Callback=function(ae)_G.ItemESP=ae if _G.ItemESP==false then for af,ag in ipairs(game.Workspace.Items:GetChildren())do
if ag.ClassName=='Tool'and ag:FindFirstChild('Handle')then q:RemoveESP(ag)end end end while _G.ItemESP do for af,ag in
ipairs(game.Workspace.Items:GetChildren())do local ah=_G.ColorESP1 or Color3.new(9,237,32)if ag.ClassName=='Tool'and ag:
FindFirstChild('Handle')and not ag:FindFirstChild('Glove')then q:AddESP({Object=ag,Text='',Color=ah})q:UpdateObjectText(
ag,ag.Name)q:UpdateObjectColor(ag,ah)q:SetOutlineColor(ah)end end task.wait()end end}):AddColorPicker('Color Esp Item',{
Default=Color3.new(9,237,32),Callback=function(ae)_G.ColorESP1=ae end})ad:AddDivider()local ae={}for af,ag in ipairs(
Enum.Font:GetEnumItems())do table.insert(ae,ag.Name)end ad:AddDropdown('Font',{Text='Set Font',Values=ae,Default='Code',
Multi=false,Callback=function(af)if q then q:SetFont(af)end end})ad:AddToggle('Show Distance',{Text='Show Distance',
Default=false,Callback=function(af)if q then q:SetShowDistance(af)end end})ad:AddToggle('Show Rainbow',{Text=
'Show Rainbow',Default=false,Callback=function(af)if q then q:SetRainbow(af)end end})ad:AddToggle('Show Tracers',{Text=
'Show Tracers',Default=false,Callback=function(af)if q then q:SetTracers(af)end end})ad:AddDropdown('TracersOrigin',{
Text='Tracers Origin',Multi=false,Values={'Bottom','Top','Center','Mouse'},Callback=function(af)if q then q:
SetTracerOrigin(af)end end})ad:AddToggle('Show Arrows',{Text='Show Arrows',Default=false,Callback=function(af)if q then
q:SetArrows(af)end end})ad:AddSlider('ArrowsSize',{Text='Set Arrows Radius',Default=300,Min=0,Max=500,Rounding=0,Compact
=false,Callback=function(af)if q then q:SetArrowRadius(af)end end})ad:AddSlider('SetTextSize',{Text='Set TextSize',
Default=15,Min=1,Max=50,Rounding=1,Compact=false,Callback=function(af)if q then q:SetTextSize(af)end end})ad:AddSlider(
'SetFillTransparency',{Text='Set Fill Transparency',Default=0.6,Min=0,Max=1,Rounding=1,Compact=false,Callback=function(
af)if q then q:SetFillTransparency(af)end end})ad:AddSlider('SetOutlineTransparency',{Text='Set OutLine Transparency',
Default=0.6,Min=0,Max=1,Rounding=1,Compact=false,Callback=function(af)if q then q:SetOutlineTransparency(af)end end})
local af=Tabs.Tab1:AddLeftGroupbox('Anti')af:AddToggle('Anti COD',{Text='Anti Cube of Death',Default=false,Callback=
function(ag)_G.AntiCubeofDeath=ag while _G.AntiCubeofDeath do if workspace.Map:FindFirstChild('ColossalCanyon')then for
ah,ai in pairs(workspace.Map.ColossalCanyon:GetChildren())do if ai.Name:lower()=='cube of death'then ai.CanTouch=not ag
end end end task.wait()end end})af:AddToggle('Anti Ice',{Text='Anti Ice',Default=false,Callback=function(ag)_G.AntiIce=
ag while _G.AntiIce do for ah,ai in pairs(game.Players.LocalPlayer.Character:GetChildren())do if ai.Name=='Icecube'then
ai:Destroy()if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')then game.Players.LocalPlayer.Character.
Humanoid.PlatformStand=false game.Players.LocalPlayer.Character.Humanoid.AutoRotate=true end end end task.wait()end end}
)af:AddToggle('Anti Acid',{Text='Anti Acid',Default=false,Callback=function(ag)for ah,ai in pairs(workspace.Map.
AcidAbnormality:GetDescendants())do if ai.Name=='Acid'and ai:IsA('BasePart')then ai.CanTouch=not ag ai.CanCollide=ag end
end end})af:AddToggle('Anti Lava',{Text='Anti Lava',Default=false,Callback=function(ag)local ah=workspace.Map:
FindFirstChild('DragonDepths',true):FindFirstChild('Lava',true)if ah then ah.CanTouch=not value ah.CanCollide=ag end end
})af:AddDropdown('Anti RagdollV',{Text='Anti Ragdoll',Values={'V0.5','V1','V2','V3'},Default='',Multi=false,Callback=
function(ag)_G.AntiRagdolledV=ag end})af:AddToggle('Anti Ragdoll',{Text='Anti Ragdoll',Default=false,Callback=function(
ag)_G.AntiRagdoll=ag if ag==false then if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.
Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild('AntiRagBV')then game.Players.LocalPlayer.Character.
HumanoidRootPart:FindFirstChild('AntiRagBV'):Destroy()end if game.Players.LocalPlayer.Character:FindFirstChild('Torso')
then game.Players.LocalPlayer.Character.Torso.Anchored=false end end end})table.insert(_G.ConnectFun,game:GetService(
'RunService').RenderStepped:Connect(function()if _G.AntiRagdoll then if game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')then if game.Players.
LocalPlayer.Character:GetAttribute('Ragdolled')then for ag,ah in pairs(game.Players.LocalPlayer.Character.
HumanoidRootPart:GetChildren())do if ah:IsA('BodyVelocity')or ah:IsA('VectorForce')or ah:IsA('LinearVelocity')or ah:IsA(
'BodyGyro')or ah:IsA('BodyAngularVelocity')then if not(ah.Name=='AntiRagBV'or ah.Name=='GyroHandler'or ah.Name==
'VelocityHandler'or ah.Name=='FreezeBV')then ah:Destroy()end end end if _G.AntiRagdolledV=='V2'then CreateFreezeBV({Name
='AntiRagBV'})end if _G.AntiRagdolledV=='V1'then if game.Players.LocalPlayer.Character:FindFirstChild('Torso')then game.
Players.LocalPlayer.Character.Torso.Anchored=true end end if _G.AntiRagdolledV=='V3'then local ag=game.Players.
LocalPlayer.Character:FindFirstChild('Humanoid')and game.Players.LocalPlayer.Character.Humanoid.MoveDirection if ag and
ag.Magnitude>0 then game.Players.LocalPlayer.Character:FindFirstChild('Humanoid'):Move(ag,false)end if game.Players.
LocalPlayer.Character:FindFirstChild('Humanoid')then game.Players.LocalPlayer.Character:FindFirstChild('Humanoid'):
ChangeState(Enum.HumanoidStateType.Running)end for ah,ai in ipairs(game.Players.LocalPlayer.Character:GetDescendants())
do if ai:IsA('Motor6D')then ai.Enabled=true elseif ai:IsA('BallSocketConstraint')or ai:IsA('HingeConstraint')then ai.
Enabled=false end end end else CreateFreezeBV({Name='AntiRagBV',Remove=true})if game.Players.LocalPlayer.Character:
FindFirstChild('Torso')then game.Players.LocalPlayer.Character.Torso.Anchored=false end end end end end))local ag=Tabs.
Tab1:AddRightGroupbox('Misc')CodeLab=ag:AddLabel('Code [ ???? ]')ag:AddButton('Get Lab Code',function()if Code and
CodeLab then CodeLab:SetText('Code [ '..table.concat(Code)..' ]')end end)ag:AddButton('Get Chain',function()if Code then
for ah,ai in pairs(game.Workspace.Map.OriginOffice:GetChildren())do if ai.Name:find('Close')and ai:FindFirstChild('Door'
)and ai.Door:FindFirstChild('Keypad')and ai.Door.Keypad:FindFirstChild('Buttons')then fireclickdetector(ai.Door.Keypad.
Buttons.Reset.ClickDetector)wait(0.25)for aj=1,#Code do local ak=Code[aj]fireclickdetector(ai.Door.Keypad.Buttons[ak].
ClickDetector)wait(0.25)end wait(0.25)fireclickdetector(ai.Door.Keypad.Buttons.Enter.ClickDetector)end end end end)ag:
AddToggle('Free Emote',{Text='Free Emote',Default=false,Callback=function(ah)Animation(ah)end})elseif game.PlaceId==
14422118326 then Window:ChangeTitle('Maze Null \u{2620}\u{fe0f}')Tabs={Tab=Window:AddTab('Misc',B.Misc),['UI Settings']=
Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Misc')aa:AddToggle('Anti Null',{Text=
'Anti Null',Default=false,Callback=function(ab)_G.AntiNull=ab while _G.AntiNull do for ac,ad in pairs(game.Workspace.
Mobs:GetChildren())do if ad.Name=='Imp'and ad:FindFirstChild('Body')then game:GetService('ReplicatedStorage').b:
FireServer(ad.Body)end end task.wait()end end})aa:AddInput('FlySpeed',{Default='50',Numeric=true,Text='Fly Speed',
Placeholder='UserFlySpeed',Callback=function(ab)_G.SetSpeedFly=ab end})_G.SetSpeedFly=50 aa:AddToggle('Start Fly',{Text=
'Start Fly',Default=false,Callback=function(ab)Fly(ab)end}):AddKeyPicker('Fly',{Default='R',Text='Fly',Mode='Toggle',
SyncToggleState=true})aa:AddButton('Teleport Rob Plushie',function()game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame=CFrame.new(4833.31,-214,800.529)wait(1)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.
_ugcQuestObjectBobPlushie.Handle.CFrame end)aa:AddDropdown('Badge',{Text='Badge',Values={'Tinkever','Null'},Default='',
Multi=false,Callback=function(ab)if ab=='Null'then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.
new(5458,-184,1822)elseif ab=='Tinkever'then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(
4833.31,-214,800.529)end end})elseif game.PlaceId==16034567693 then Window:ChangeTitle('ADMIN ROOM \26')Tabs={Tab=Window
:AddTab('Misc',B.Misc),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Info')
CanYouFps=aa:AddLabel('Your Fps [ '..math.floor(workspace:GetRealPhysicsFPS())..' ]',true)CanYouPing=aa:AddLabel(
'Your Ping [ '..game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValueString()..' ]',true)ServerPlayer=
aa:AddLabel('Player In Server [ '..#game.Players:GetPlayers()..' / '..game.Players.MaxPlayers..' ]',true)TimeServer=aa:
AddLabel('Server Time [ '..math.floor(workspace.DistributedGameTime/60/60)..' Hour | '..math.floor(workspace.
DistributedGameTime/60)-(math.floor(workspace.DistributedGameTime/60/60)*60)..' Minute | '..math.floor(workspace.
DistributedGameTime)-(math.floor(workspace.DistributedGameTime/60)*60)..' Second ]',true)TimeNow=aa:AddLabel(
'Now Time [ '..os.date('%X')..' ]',true)if tonumber(os.date('%H'))>=5 and tonumber(os.date('%H'))<12 then AlarmTime=aa:
AddLabel('Good Morning [ '..tonumber(os.date('%H'))..' Hour ]',true)elseif tonumber(os.date('%H'))>=12 and tonumber(os.
date('%H'))<17 then AlarmTime=aa:AddLabel('Good Afternoon [ '..tonumber(os.date('%H'))..' Hour ]',true)elseif tonumber(
os.date('%H'))>=17 and tonumber(os.date('%H'))<21 then AlarmTime=aa:AddLabel('Good Evening [ '..tonumber(os.date('%H'))
..' Hour ]',true)else AlarmTime=aa:AddLabel('Good Night [ '..tonumber(os.date('%H'))..' Hour ]',true)end AgeAccYou=aa:
AddLabel('You Account Age [ '..game.Players.LocalPlayer.AccountAge..' ]',true)aa:AddToggle('Toggle Set',{Text=
'Toggle Return',Default=false,Callback=function(ab)_G.AutoSetInfo=ab if _G.AutoSetInfo==true then AutoSetInfoServer=game
:GetService('RunService').RenderStepped:Connect(function()if _G.AutoSetInfo==true then CanYouFps:SetText('Your Fps [ '..
math.floor(workspace:GetRealPhysicsFPS())..' ]',true)CanYouPing:SetText('Your Ping [ '..game:GetService('Stats').Network
.ServerStatsItem['Data Ping']:GetValueString()..' ]',true)ServerPlayer:SetText('Player In Server [ '..#game.Players:
GetPlayers()..' / '..game.Players.MaxPlayers..' ]',true)TimeServer:SetText('Server Time [ '..math.floor(workspace.
DistributedGameTime/60/60)..' Hour | '..math.floor(workspace.DistributedGameTime/60)-(math.floor(workspace.
DistributedGameTime/60/60)*60)..' Minute | '..math.floor(workspace.DistributedGameTime)-(math.floor(workspace.
DistributedGameTime/60)*60)..' Second ]',true)TimeNow:SetText('Now Time [ '..os.date('%X')..' ]',true)if tonumber(os.
date('%H'))>=5 and tonumber(os.date('%H'))<12 then AlarmTime:SetText('Good Morning [ '..tonumber(os.date('%H'))..
' Hour ]',true)elseif tonumber(os.date('%H'))>=12 and tonumber(os.date('%H'))<17 then AlarmTime:SetText(
'Good Afternoon [ '..tonumber(os.date('%H'))..' Hour ]',true)elseif tonumber(os.date('%H'))>=17 and tonumber(os.date(
'%H'))<21 then AlarmTime:SetText('Good Evening [ '..tonumber(os.date('%H'))..' Hour ]',true)else AlarmTime:SetText(
'Good Night [ '..tonumber(os.date('%H'))..' Hour ]',true)end AgeAccYou:SetText('You Account Age [ '..game.Players.
LocalPlayer.AccountAge..' ]',true)end end)end if _G.AutoSetInfo==false then if AutoSetInfoServer then AutoSetInfoServer:
Disconnect()AutoSetInfoServer=nil return AutoSetInfoServer end end end})local ab=Tabs.Tab:AddRightGroupbox('Misc')ab:
AddToggle('Anti Afk',{Text='Anti Afk',Default=false,Callback=function(ac)_G.AntiAfk=ac for ad,ae in next,getconnections(
game.Players.LocalPlayer.Idled)do if _G.AntiAfk then ae:Disable()else ae:Enable()end end end})ab:AddButton(
'Teleport Room',function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(502,76,59)wait(4)g[
'Anti Afk']:SetValue(true)end)elseif game.PlaceId==17290438723 then Window:ChangeTitle('Frostbite Map Obby \u{1f3bf}')
Tabs={Tab=Window:AddTab('Misc',B.Misc),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:
AddLeftGroupbox('Misc')aa:AddButton('Teleport Badge',function()game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame=CFrame.new(-554,177,56)wait(0.7)for ab,ac in ipairs(game:GetService('Workspace'):GetDescendants())do if ac.
ClassName=='ProximityPrompt'then ac.HoldDuration=0 fireproximityprompt(ac)end end end)elseif game.PlaceId==18550498098
then Window:ChangeTitle('Boss Guide \u{2694}\u{fe0f}')if game.Workspace:FindFirstChild('VoidPart')==nil then local aa=
Instance.new('Part',workspace)aa.Position=Vector3.new(538,55,-231)aa.Name='VoidPart'aa.Size=Vector3.new(2048,11,2048)aa.
Anchored=true aa.Transparency=1 aa.CanCollide=false local ab=Instance.new('Part',aa)ab.Position=Vector3.new(595,120,-330
)ab.Name='Safe'ab.Size=Vector3.new(2000,10,2000)ab.Anchored=true ab.Transparency=0.5 ab.CanCollide=true end Tabs={Tab=
Window:AddTab('Misc',B.Misc),Tab1=Window:AddTab('Anti',B.Anti),Tab2=Window:AddTab('Local',B.Local),['UI Settings']=
Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Prepare')aa:AddButton('Start Enter + 1 HP',
function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(3258,-68,823)wait(2.8)game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace['the cube of life'].Part.CFrame wait(0.5)game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace['Big Heart'].CFrame wait(1)game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=game.Workspace.ShackLever.Base.CFrame wait(0.5)for ab,ac in pairs(game.Workspace:
GetDescendants())do if ac.Name=='ShackLever'and ac:FindFirstChild('ClickDetector')then fireclickdetector(ac.
ClickDetector,0)fireclickdetector(ac.ClickDetector,1)end end end):AddButton('Start Enter',function()game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(3258,-68,823)wait(2)for ab,ac in pairs(game.Workspace:
GetDescendants())do if ac.Name=='ShackLever'and ac:FindFirstChild('ClickDetector')then fireclickdetector(ac.
ClickDetector,0)fireclickdetector(ac.ClickDetector,1)end end end)aa:AddButton('Teleport Safe',function()if game.
Workspace.VoidPart:FindFirstChild('Safe')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace.
VoidPart.Safe.CFrame*CFrame.new(0,25,0)end end):AddButton('Guide',function()if game.Workspace.VoidPart:FindFirstChild(
'Safe')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace.VoidPart.Safe.CFrame*CFrame.new(0,
-40,0)end end)aa:AddButton('Lever Lobby',function()for ab,ac in pairs(game.Workspace:GetDescendants())do if ac.Name==
'Gate1Lever'and ac:FindFirstChild('ClickDetector')then fireclickdetector(ac.ClickDetector,0)fireclickdetector(ac.
ClickDetector,1)end end end)aa:AddInput('FlySpeed',{Default='50',Numeric=true,Text='Fly Speed',Placeholder=
'UserFlySpeed',Callback=function(ab)_G.SetSpeedFly=ab end})_G.SetSpeedFly=50 aa:AddToggle('Start Fly',{Text='Start Fly',
Default=false,Callback=function(ab)Fly(ab)end}):AddKeyPicker('Fly',{Default='R',Text='Fly',Mode='Toggle',SyncToggleState
=true})local ab=Tabs.Tab:AddRightGroupbox('Combat')function slapglove(ac)local ad=game.Players.LocalPlayer if not ad
then return end local ae=ad.Character local af=ad.Backpack if not ae then return end local ag=ac if not ag then return
end if af:FindFirstChild('Lantern')then af:FindFirstChild('Lantern').Parent=game.Players.LocalPlayer.Character end if ae
:FindFirstChild('Lantern')and ae.Lantern:FindFirstChild('Network')then ae.Lantern:Activate()ae.Lantern.Network:
FireServer('Hit',ag)end end ab:AddToggle('Fight Trask',{Text='Auto Slap Trask',Default=false,Callback=function(ac)_G.
BringTrask=ac while _G.BringTrask do for ad,ae in pairs(game.Workspace:GetChildren())do if ae.Name:lower()==
'trackglovemissile'then slapglove(ae)end end task.wait()end end}):AddKeyPicker('FightTrask',{Default='V',Text=
'Fight Trask',Mode='Toggle',SyncToggleState=true})ab:AddToggle('Fight Boss Final',{Text='Slap  Boss Final',Default=false
,Callback=function(ac)_G.FightBossFinal=ac while _G.FightBossFinal do if game.Workspace:FindFirstChild('GuideNPC')and
game.Workspace.GuideNPC:FindFirstChild('HumanoidRootPart')then slapglove(game.Workspace.GuideNPC.HumanoidRootPart)end
task.wait()end end}):AddKeyPicker('FightBossFinal',{Default='V',Text='Fight Boss Final',Mode='Toggle',SyncToggleState=
true})ab:AddToggle('Fight Replica',{Text='Fight Replica',Default=false,Callback=function(ac)_G.FightReplica=ac while _G.
FightReplica do for ad,ae in pairs(game.workspace:GetChildren())do if ae.Name:lower()=='replicanpc'and ae:
FindFirstChild('HumanoidRootPart')then slapglove(ae.HumanoidRootPart)end end task.wait()end end}):AddKeyPicker(
'FightReplica',{Default='V',Text='Fight Replica',Mode='Toggle',SyncToggleState=true})ab:AddToggle('Fight Golem',{Text=
'Fight Golem',Default=false,Callback=function(ac)_G.FightGolem=ac while _G.FightGolem do for ad,ae in pairs(game.
Workspace:GetChildren())do if ae.Name:lower()=='golem'or ae.Name:lower()=='dungeongolem'then slapglove(ae:
FindFirstChild('Hitbox')or ae:FindFirstChild('Cube.001'))end end task.wait()end end}):AddKeyPicker('FightGolem',{Default
='V',Text='Fight Golem',Mode='Toggle',SyncToggleState=true})ab:AddToggle('Fight All',{Text='Fight All',Default=false,
Callback=function(ac)_G.FightAll=ac while _G.FightAll do for ad,ae in pairs(game.Workspace:GetChildren())do if ae.Name:
lower()=='trackglovemissile'or ae.Name:lower()=='golem'or ae.Name:lower()=='dungeongolem'or ae.Name:lower()==
'replicanpc'or ae.Name:lower()=='guidenpc'then slapglove(ae:FindFirstChild('HumanoidRootPart')or ae:FindFirstChild(
'Hitbox')or ae:FindFirstChild('Cube.001')or ae)end end task.wait()end end}):AddKeyPicker('FightAll',{Default='O',Text=
'Fight All',Mode='Toggle',SyncToggleState=true})ab:AddButton('Fight Potato',function()if game.Workspace:FindFirstChild(
'PotatoLord')and game.Workspace.PotatoLord:FindFirstChild('HumanoidRootPart')then slapglove(game.Workspace.PotatoLord.
HumanoidRootPart)end end)local ac=Tabs.Tab1:AddLeftGroupbox('Anti')ac:AddToggle('Anti Void',{Text='Anti Void',Default=
false,Callback=function(ad)game.Workspace.VoidPart.CanCollide=ad if ad==true then game.Workspace.VoidPart.Transparency=
0.5 else game.Workspace.VoidPart.Transparency=1 end end})ac:AddToggle('Anti Sbeve',{Text='Anti Sbeve',Default=false,
Callback=function(ad)_G.AntiSbeve=ad while _G.AntiSbeve do for ae,af in pairs(game.Workspace.Sbeves:GetChildren())do if
af.Name=='sbeveai'then af.CanTouch=false end end task.wait()end end})ac:AddToggle('Anti Wall',{Text='Anti Wall',Default=
false,Callback=function(ad)_G.AntiWall=ad while _G.AntiWall do for ae,af in pairs(game.Workspace:GetChildren())do if af.
Name=='PusherWall'then af.CanCollide=false end end task.wait()end end})local ad=Tabs.Tab2:AddLeftGroupbox('Speed')ad:
AddSlider('WalkSpeed',{Text='Speed',Default=20,Min=20,Max=1000,Rounding=0,Compact=true,Callback=function(ae)game.Players
.LocalPlayer.Character.Humanoid.WalkSpeed=ae Walkspeed=ae end})ad:AddInput('WalkSpeed1',{Default='20',Numeric=false,Text
='Speed',Placeholder='UserSpeed',Callback=function(ae)game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=ae Walkspeed
=ae end})ad:AddToggle('SetSpeed',{Text='Auto Set Speed',Default=false,Callback=function(ae)KeepWalkspeed=ae while
KeepWalkspeed do if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')~=nil and game.Players.LocalPlayer.
Character.Humanoid.WalkSpeed~=Walkspeed then game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=Walkspeed end task.
wait()end end})local ae=Tabs.Tab2:AddRightGroupbox('Jump')ae:AddSlider('JumpPower',{Text='Jump',Default=50,Min=50,Max=
1000,Rounding=0,Compact=true,Callback=function(af)game.Players.LocalPlayer.Character.Humanoid.JumpPower=af Jumppower=af
end})ae:AddInput('JumpPower1',{Default='50',Numeric=true,Text='Jump',Placeholder='UserJump',Callback=function(af)game.
Players.LocalPlayer.Character.Humanoid.JumpPower=af Jumppower=af end})ae:AddToggle('SetJump',{Text='Auto Set Jump',
Default=false,Callback=function(af)KeepJumppower=af while KeepJumppower do if game.Players.LocalPlayer.Character:
FindFirstChild('Humanoid')~=nil and game.Players.LocalPlayer.Character.Humanoid.JumpPower~=Jumppower then game.Players.
LocalPlayer.Character.Humanoid.JumpPower=Jumppower end task.wait()end end})elseif game.PlaceId==7234087065 then spawn(
function()while true do Dialogue=game.Workspace:FindFirstChild('DialoguePrompts')NPC=game.Workspace:FindFirstChild(
'NPCS')Buildings=game.Workspace:FindFirstChild('Buildings')task.wait()end end)Window:ChangeTitle('Lobby OOG \u{1f415}')
Tabs={Tab=Window:AddTab('Misc',B.Misc),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:
AddLeftGroupbox('Main')aa:AddButton('Get Badge OOG',function()if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.QuestStuff.Key.CFrame
repeat task.wait()until game:GetService('ReplicatedStorage').RemoteEvents.SuitUpClown:FireServer()task.wait(0.25)game:
GetService('ReplicatedStorage').RemoteEvents.KeyQuest:FireServer()task.wait(0.25)game:GetService('ReplicatedStorage').
RemoteEvents.KeyAcquired:FireServer()task.wait(0.25)game:GetService('ReplicatedStorage').RemoteEvents.GOHOME:FireServer(
)task.wait(0.25)game:GetService('ReplicatedStorage').RemoteEvents.KeyBadgeReward:FireServer()end end)aa:AddButton(
'Get Badge Riftshot',function()if Dialogue and Dialogue:FindFirstChild('Sharpshooter Sam')then game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=Dialogue['Sharpshooter Sam'].CFrame end Notification(
[[Bypass Success, Now bomb will bring you, your job is to shoot]],5)wait(0.3)for ab,ac in ipairs(game:GetService(
'Workspace'):GetDescendants())do if ac.Name:find("Sharpshooter Sam's")then SharpshooterTarget=ac end end wait(0.3)while
true do if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then if SharpshooterTarget then for ab,
ac in pairs(SharpshooterTarget:GetChildren())do if ac.Name:find('bomb')and ac:FindFirstChild('Handle')then ac.Handle.
CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-7)end end end end task.wait()end end)
aa:AddButton('Get Badge Boxer',function()if game.Workspace:FindFirstChild('BoxingGloves')==nil then game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=game.Workspace.Buildings.house:FindFirstChild('TP').CFrame*CFrame.new(0,10
,0)end repeat task.wait()until game.Workspace:FindFirstChild('BoxingGloves')wait(0.6)if game.Workspace:FindFirstChild(
'BoxingGloves'):FindFirstChild('ClickDetector')then fireclickdetector(game.Workspace.BoxingGloves.ClickDetector,0)
fireclickdetector(game.Workspace.BoxingGloves.ClickDetector,1)end end)aa:AddDivider()aa:AddButton('Enter Event Area',
function()for ab,ac in ipairs(workspace.Signs:GetChildren())do if ac.Name=='Sign'and ac:FindFirstChild('Text')and ac.
Text:FindFirstChild('ClickDetector')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ac.Text.CFrame if
fireclickdetector then fireclickdetector(ac.Text.ClickDetector,0)fireclickdetector(ac.Text.ClickDetector,1)end end end
end)aa:AddButton('Enter Designer Roblox',function()repeat task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart
.CFrame=CFrame.new(249,94,-62841)until workspace.Buildings:FindFirstChild('wizard twoer 2')wait(0.8)for ab,ac in pairs(
workspace.Buildings['wizard twoer 2']:GetChildren())do if ac.Name=='Model'and ac:FindFirstChild('Trigger')then game.
Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ac:FindFirstChild('Trigger').CFrame end end end)aa:AddDivider()aa:
AddToggle('Auto Tp Clock',{Text='Auto Teleport Clock',Default=false,Callback=function(ab)_G.AutoTPClock=ab while _G.
AutoTPClock do for ac,ad in pairs(workspace.Buildings:GetChildren())do if ad.Name=='wizard twoer'and ad:FindFirstChild(
'Cone')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ad.Cone.CFrame*CFrame.new(0,15,0)end end task.
wait()end end})elseif game.PlaceId==74169485398268 then Window:ChangeTitle(
'Maze Bind \u{1f441}\u{fe0f}\u{200d}\u{1f5e8}\u{fe0f}')Tabs={Tab=Window:AddTab('Misc',B.Misc),['UI Settings']=Window:
AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Get / Teleport')aa:AddButton('Teleport Glove',
function()if fireclickdetector then if game.Workspace:FindFirstChild('Orb')then fireclickdetector(game.Workspace.Orb.
ClickDetector,0)fireclickdetector(game.Workspace.Orb.ClickDetector,1)end elseif not fireclickdetector then if game.
Workspace:FindFirstChild('Orb')and game.Workspace.Orb:FindFirstChild('Meshes/rock chain glove_defaultglove_cell.001')
then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.Orb[
'Meshes/rock chain glove_defaultglove_cell.001'].CFrame end end end)elseif game.PlaceId==102908326578005 then Window:
ChangeTitle('OOG Home Jorgis \u{1f3e0}')Tabs={Tab=Window:AddTab('Misc',B.Misc),['UI Settings']=Window:AddTab(
'UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Misc')aa:AddButton('Ball Teleport',function()for ab,ac in
ipairs(workspace.Furniture.jorgisBasketballs:GetChildren())do if ac.Name=='B-Ball'and ac:FindFirstChild('ClickDetector')
then ac.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame if fireclickdetector then fireclickdetector(ac
.ClickDetector,0)fireclickdetector(ac.ClickDetector,1)end end end end)aa:AddButton('Key Teleport',function()for ab,ac in
ipairs(workspace.Furniture.jorgisDresser:GetChildren())do if ac.Name=='Drawer'and ac:FindFirstChild('Handle')and ac.
Handle:FindFirstChild('ClickDetector')then ac.Handle.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
if fireclickdetector then fireclickdetector(ac.Handle.ClickDetector,0)fireclickdetector(ac.Handle.ClickDetector,1)end
end end end)aa:AddButton('Teleport Door',function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.
Furniture.finalDoor.Base.Base.CFrame end)elseif game.PlaceId==115782629143468 then Window:ChangeTitle(
'Obby TOH \u{1fa9c}')Tabs={Tab=Window:AddTab('Misc',B.Misc),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}
local aa=Tabs.Tab:AddLeftGroupbox('Misc')aa:AddButton('Teleport Badge',function()game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=CFrame.new(-31,190,0)end)elseif game.PlaceId==92516899071319 then Window:ChangeTitle(
'Map Dreams \u{1f4a4}')Tabs={Tab=Window:AddTab('Misc',B.Misc),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}
local aa=Tabs.Tab:AddLeftGroupbox('Misc')aa:AddToggle('Auto Collect Pillow',{Text='Auto Collect Pillow',Default=false,
Callback=function(ab)_G.AutoCollectPillow=ab while _G.AutoCollectPillow do for ac,ad in pairs(game.Workspace.map:
GetChildren())do if ad.Name=='Meshes/pillow1'and ad:FindFirstChild('ClickDetector')then fireclickdetector(ad:
FindFirstChild('ClickDetector'))end end task.wait()end end})aa:AddButton('Pick Up Unstable Artifact',function()workspace
['Unstable Artifact'].Handle.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame end)elseif game.PlaceId==
118650724506449 then Window:ChangeTitle('Bad Dreams \26')Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:
AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Badge')aa:AddButton('Teleport Badge',function()game.
Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.rooms['room exit'].EXIT.CFrame end)elseif game.PlaceId==
97220865182663 then Window:ChangeTitle('Boss Mouse \u{1f400}')if workspace.Game:FindFirstChild('Buildings')and workspace
.Game.Buildings:FindFirstChild('City')and workspace.Game.Buildings.City:FindFirstChild('City')==nil then game:
GetService('ReplicatedStorage').Remotes.PlaceBuilding:FireServer('City',Vector3.new(4.6566128730773926e-9,
43.496280670166016,-45),0)end Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab('UI Settings',B.
Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Badge')aa:AddButton('Get Glove 3000 Orb',function()game:GetService(
'ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('UnlockGloveWithOrbs'):FireServer()end)aa:AddToggle(
'Auto Slap Rat',{Text='Auto Slap Rat',Default=false,Callback=function(ab)_G.AutoSlapMouse=ab while _G.AutoSlapMouse do
if game.Workspace:FindFirstChild('Game')and game.Workspace.Game:FindFirstChild('Enemies')then for ac,ad in pairs(
workspace.Game.Enemies:GetChildren())do if ad.Name=='Rat'and ad:FindFirstChild('Hitbox')then ad.Hitbox.Anchored=true
game:GetService('ReplicatedStorage').Remotes.GloveHit:FireServer(ad.Hitbox)end end end task.wait()end end})elseif game.
PlaceId==98726100529621 then Window:ChangeTitle('Map Obby Hexa \u{1f530}')Tabs={Tab=Window:AddTab('Main',B.Main),[
'UI Settings']=Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Badge')aa:AddButton(
'Get Glove',function()if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then if workspace:
FindFirstChild('Part I')then workspace['Part I'].Obby['end'].CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame repeat task.wait()until workspace:FindFirstChild('Part 2')wait(10.5)end if workspace:FindFirstChild('Part 2')then
local ab=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame repeat task.wait(1)game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=CFrame.new(97,14,644)wait(2.4)game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame=ab wait(0.8)until workspace['Part 2']:FindFirstChild('Portal')task.wait(2.5)game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=workspace['Part 2'].Portal.CFrame repeat task.wait()until workspace:FindFirstChild('Part 3')
wait(9.5)end if workspace:FindFirstChild('Part 3')then workspace['Part 3'].TpToNext.HitBox.CFrame=game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame if fireclickdetector then fireclickdetector(workspace['Part 3'].TpToNext.
HitBox:FindFirstChild('Click'))end repeat task.wait()until workspace:FindFirstChild('Part 4')wait(7)end if workspace:
FindFirstChild('Part 4')then workspace['Part 4'].TPPart.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame repeat task.wait()until workspace:FindFirstChild('Part 5')wait(7)end if workspace:FindFirstChild('Part 5')then
workspace['Part 5'].Glove.Hitbox.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame if fireclickdetector
then fireclickdetector(workspace['Part 5'].Glove.Hitbox:FindFirstChild('Click'))end repeat task.wait()until workspace:
FindFirstChild('Finale')and workspace.Finale:FindFirstChild('Reward')wait(7)end if workspace:FindFirstChild('Finale')and
workspace.Finale:FindFirstChild('Reward')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.
Finale.Reward.Hitbox.CFrame if fireclickdetector then fireclickdetector(workspace.Finale.Reward.Hitbox:FindFirstChild(
'Click'))end end end end)elseif game.PlaceId==136005148166028 then Window:ChangeTitle(
'Map Designer Roblox \u{1f6e0}\u{fe0f}')Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab(
'UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Badge')aa:AddButton('Get Badge',function()if game.Players.
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then if fireclickdetector then fireclickdetector(workspace.
Kitchen.Fridge.HitBox:FindFirstChild('ClickDetector'))end repeat task.wait()until workspace.Kitchen.Fridge:
FindFirstChild('GrantAward')or workspace.Kitchen.Fridge:FindFirstChild('GrantAward')==nil wait(0.25)if fireclickdetector
then if workspace.Kitchen.Fridge:FindFirstChild('GrantAward')then fireclickdetector(workspace.Kitchen.Fridge.GrantAward:
FindFirstChild('ClickDetector'))end end repeat task.wait()until game:GetService('Players').LocalPlayer.Backpack:
FindFirstChild('Brewzucki')or game:GetService('Players').LocalPlayer.Character:FindFirstChild('Brewzucki')if game:
GetService('Players').LocalPlayer.Character:FindFirstChild('Brewzucki')then game:GetService('Players').LocalPlayer.
Character:FindFirstChild('Brewzucki').Parent=game:GetService('Players').LocalPlayer.Backpack end wait(0.5)local ab=game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame if fireclickdetector then if workspace.Microwave
:FindFirstChild('HitBox')then fireclickdetector(workspace.Microwave.HitBox:FindFirstChild('ClickDetector'))end end wait(
0.8)repeat task.wait()if fireclickdetector then if workspace.Microwave:FindFirstChild('HitBox')then fireclickdetector(
workspace.Microwave.HitBox:FindFirstChild('ClickDetector'))end end until game:GetService('Players').LocalPlayer.Backpack
:FindFirstChild('Brewzucki')or game:GetService('Players').LocalPlayer.Character:FindFirstChild('Brewzucki')wait(0.2)if
game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Brewzucki')then game:GetService('Players').LocalPlayer.
Backpack:FindFirstChild('Brewzucki').Parent=game:GetService('Players').LocalPlayer.Character end wait(0.3)if game:
GetService('Players').LocalPlayer.Character:FindFirstChild('Brewzucki')then game:GetService('Players').LocalPlayer.
Character:FindFirstChild('Brewzucki'):Activate()end wait(3.5)if fireclickdetector then fireclickdetector(workspace.
BasementTable.HitBox:FindFirstChild('ClickDetector'))end wait(1)if fireproximityprompt then fireproximityprompt(
workspace.BasementDoor.Door.Base:FindFirstChild('ProximityPrompt'))end wait(0.5)if game:GetService('Players').
LocalPlayer.PlayerGui:FindFirstChild('RealComputerScreenGui')~=nil then if workspace.ComputerChair:FindFirstChild('Seat'
)then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.ComputerChair.Seat.CFrame end repeat task.
wait()until game:GetService('Players').LocalPlayer.PlayerGui:FindFirstChild('RealComputerScreenGui')and game:GetService(
'Players').LocalPlayer.PlayerGui.RealComputerScreenGui.Enabled==true wait(0.5)if game:GetService('Players').LocalPlayer.
PlayerGui.RealComputerScreenGui.ComputerScreen:FindFirstChild('SuggestionsQTE').Visible==true then repeat task.wait()for
ac,ad in pairs(game.Players.LocalPlayer.PlayerGui.RealComputerScreenGui.ComputerScreen.SuggestionsQTE:GetChildren())do
if ad.Name:find('Popup_')then ad.Position=game:GetService('Players').LocalPlayer.PlayerGui.RealComputerScreenGui.
ComputerScreen.SuggestionsQTE:FindFirstChild('RecyclingBin').Position end end until game:GetService('Players').
LocalPlayer.PlayerGui.RealComputerScreenGui.ComputerScreen:FindFirstChild('UpdateGameQTE').Visible==true game:
GetService('Players').LocalPlayer.PlayerGui.RealComputerScreenGui.ComputerScreen.UpdateGameQTE.MainFrame.
PatchNotesTextBox.Text=
[[Articles - Hub, how do you feel, or are things in your life okay, you must be struggling, do you see you are tired or not?, Skibidi Toilet Dop Dop Yes Yes]]
repeat task.wait()until game:GetService('Players').LocalPlayer.PlayerGui:FindFirstChild('RealComputerScreenGui')==nil
wait(0.5)if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid').Sit==true then game.Players.LocalPlayer.
Character:FindFirstChild('Humanoid').Sit=false end end wait(0.5)game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame=workspace.Stages.Stage4:FindFirstChild('CloseDavidsDoor').CFrame wait(0.7)GuiClick=game:GetService('Players').
LocalPlayer.PlayerGui.DavidShrineQTE:FindFirstChild('DavidShrineQTE')repeat task.wait()if GuiClick.Mobile.SpawnArea:
FindFirstChild('TapLabel')then GuiClick.Mobile.SpawnArea:FindFirstChild('TapLabel').Size=UDim2.new(1001,0,1001,0)game:
GetService('VirtualUser'):Button1Down(Vector2.new(1,1))game:GetService('VirtualUser'):Button1Up(Vector2.new(1,1))elseif
GuiClick:FindFirstChild('PC').Visible==true and GuiClick.PC:FindFirstChild('QuickTimeLabel').Visible==true then game:
GetService('VirtualInputManager'):SendKeyEvent(true,GuiClick.PC.QuickTimeLabel.Text,false,x)end until game:GetService(
'Players').LocalPlayer.PlayerGui.DavidShrineQTE.DavidShrineQTE:FindFirstChild('ScoreLabel').Visible==true and game:
GetService('Players').LocalPlayer.PlayerGui.DavidShrineQTE.DavidShrineQTE:FindFirstChild('ScoreLabel').Text==
'Score: 150'end end end)elseif game.PlaceId==117232463555132 then Window:ChangeTitle('Map Retro Boss \u{2694}\u{fe0f}')
Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:
AddLeftGroupbox('Badge')aa:AddButton('Get Badge',function()if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then if workspace.Map.Components.NPCs.FinalBoss:FindFirstChild('FinalBoss')and workspace.Map.
Components.NPCs.FinalBoss.FinalBoss:FindFirstChild('HumanoidRootPart')then game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=workspace.Map.Components.NPCs.FinalBoss.FinalBoss.HumanoidRootPart.CFrame*CFrame.new(0,0,-7)end
wait(0.36)game:GetService('Players').LocalPlayer.PlayerGui.SkipButton:FindFirstChild('SkipDialogueButton').Position=
UDim2.new(0,0,0,0)game:GetService('Players').LocalPlayer.PlayerGui.SkipButton:FindFirstChild('SkipDialogueButton').
BackgroundTransparency=0.77 game:GetService('Players').LocalPlayer.PlayerGui.SkipButton:FindFirstChild(
'SkipDialogueButton').Size=UDim2.new(1,0,1,0)if workspace.Map.Components.NPCs.FinalBoss:FindFirstChild('FinalBoss')and
workspace.Map.Components.NPCs.FinalBoss.FinalBoss:FindFirstChild('Head')then if fireproximityprompt then
fireproximityprompt(workspace.Map.Components.NPCs.FinalBoss.FinalBoss.Head:FindFirstChild('ProximityPrompt'))end end
repeat task.wait()if firesignal and game:GetService('Players').LocalPlayer.PlayerGui.SkipButton:FindFirstChild(
'SkipDialogueButton')then firesignal(game:GetService('Players').LocalPlayer.PlayerGui.SkipButton:FindFirstChild(
'SkipDialogueButton').Activated)end until game:GetService('Players').LocalPlayer.PlayerGui:FindFirstChild(
'FinalBossHealthBar')and game:GetService('Players').LocalPlayer.PlayerGui.FinalBossHealthBar:FindFirstChild(
'FinalBossHealthBar').Visible==true wait(0.5)repeat task.wait()if workspace.Map.Components.NPCs.FinalBoss:
FindFirstChild('FinalBoss')and workspace.Map.Components.NPCs.FinalBoss.FinalBoss:FindFirstChild('HumanoidRootPart')then
if game.Players.LocalPlayer.Backpack:FindFirstChild('Default')then game.Players.LocalPlayer.Backpack:FindFirstChild(
'Default').Parent=game.Players.LocalPlayer.Character end workspace.Map.Components.NPCs.FinalBoss.FinalBoss.
HumanoidRootPart.Size=Vector3.new(70,70,70)workspace.Map.Components.NPCs.FinalBoss.FinalBoss.HumanoidRootPart.CFrame=
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-5)game:GetService('ReplicatedStorage').
Remotes.ToolSwingEvent:FireServer()end until game:GetService('Players').LocalPlayer.PlayerGui.SkipButton:FindFirstChild(
'SkipDialogueButton').Visible==true or game:GetService('Players').LocalPlayer.PlayerGui.FinalBossHealthBar:
FindFirstChild('FinalBossHealthBar').Visible==false or workspace.Map.Components.NPCs.FinalBoss:FindFirstChild(
'BridgeToGlove').Transparency==0 wait(0.5)workspace.Map.Components.NPCs.FinalBoss.FinalBoss.HumanoidRootPart.Size=
Vector3.new(2,2,1)repeat task.wait()if firesignal and game:GetService('Players').LocalPlayer.PlayerGui.SkipButton:
FindFirstChild('SkipDialogueButton')then firesignal(game:GetService('Players').LocalPlayer.PlayerGui.SkipButton:
FindFirstChild('SkipDialogueButton').Activated)end until workspace.Map.Components.NPCs.FinalBoss:FindFirstChild(
'BridgeToGlove')and workspace.Map.Components.NPCs.FinalBoss:FindFirstChild('BridgeToGlove').Transparency==0 wait(1)if
workspace.Map.Components:FindFirstChild('GloveIsland')and workspace.Map.Components.GloveIsland:FindFirstChild(
'ClaimGlove')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.Map.Components.GloveIsland.
ClaimGlove.CFrame wait(1)while true do wait(0.3)if fireproximityprompt then fireproximityprompt(workspace.Map.Components
.GloveIsland.ClaimGlove:FindFirstChild('ProximityPrompt'))end end end end end)elseif game.PlaceId==132277598079047 then
Window:ChangeTitle('Nightmade Slender \u{1f311}')Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab(
'UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Badge')aa:AddButton('Get Badge',function()if game.Players.
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then for ab,ac in pairs(workspace:FindFirstChild('Pages'):
GetChildren())do if ac.Name=='Page'and ac:FindFirstChild('Part')then game.Players.LocalPlayer.Character.HumanoidRootPart
.CFrame=ac.Part.CFrame wait(0.38)if fireproximityprompt then fireproximityprompt(ac.Part:FindFirstChild(
'ProximityPrompt'))end end end end end)elseif game.PlaceId==129665246576996 then Window:ChangeTitle(
'Map Egger \u{1f95a}')Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}
local aa=Tabs.Tab:AddLeftGroupbox('Badge')aa:AddButton('Get Badge',function()if game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')then if workspace:FindFirstChild('Kenneth')and workspace.Kenneth:FindFirstChild('Head'
)and workspace.Kenneth.Head:FindFirstChild('ProximityPrompt')then game.Players.LocalPlayer.Character.HumanoidRootPart.
CFrame=workspace.Kenneth.Head.CFrame wait(0.6)if fireproximityprompt then fireproximityprompt(workspace.Kenneth.Head.
ProximityPrompt)end end for ab,ac in pairs(workspace:FindFirstChild('TrialCompletedPoints'):GetChildren())do if ac.Name:
find('Trial')and ac:FindFirstChild('root')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ac.root.CFrame
wait(0.8)end end wait(2.5)if workspace:FindFirstChild('Kenneth')and workspace.Kenneth:FindFirstChild('Head')and
workspace.Kenneth.Head:FindFirstChild('ProximityPrompt')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=
workspace.Kenneth.Head.CFrame wait(0.6)if fireproximityprompt then fireproximityprompt(workspace.Kenneth.Head.
ProximityPrompt)end end end end)elseif game.PlaceId==136690395520488 then Window:ChangeTitle('Friday the 13th \u{1f52a}'
)Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:
AddLeftGroupbox('Badge')aa:AddButton('Get Badge',function()if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then if game.Players.LocalPlayer.Character:FindFirstChild('Humanoid')then game.Players.LocalPlayer.
Character:FindFirstChild('Humanoid').Sit=false end local ab=game.Workspace:FindFirstChild('Map')and game.Workspace.Map:
FindFirstChild('PuzzleStuff')wait(0.5)if ab:FindFirstChild('ButtonPlants')then for ac,ad in pairs(ab:FindFirstChild(
'ButtonPlants'):GetChildren())do if ad.Name=='Plant'and ad:FindFirstChild('Button')and ad:FindFirstChild('Hitbox')and ad
.Hitbox:FindFirstChild('ClickDetector')then repeat task.wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
=ad.Button.CFrame if fireclickdetector then fireclickdetector(ad.Hitbox:FindFirstChild('ClickDetector'))end until ad.
Button.Color~=Color3.fromRGB(255,0,0)end end end wait(0.3)repeat task.wait()if ab:FindFirstChild('Sledgehammer')and ab.
Sledgehammer:FindFirstChild('Hitbox')then if fireclickdetector then fireclickdetector(ab.Sledgehammer.Hitbox:
FindFirstChild('ClickDetector'))end end until game.Players.LocalPlayer.Backpack:FindFirstChild('Sledgehammer')or game.
Players.LocalPlayer.Character:FindFirstChild('Sledgehammer')wait(0.2)if game.Players.LocalPlayer.Backpack:
FindFirstChild('Sledgehammer')then game.Players.LocalPlayer.Backpack:FindFirstChild('Sledgehammer').Parent=game.Players.
LocalPlayer.Character wait(0.2)end if ab:FindFirstChild('Glass')then game.Players.LocalPlayer.Character.HumanoidRootPart
.CFrame=ab.Glass.CFrame wait(0.3)if ab:FindFirstChild('Glass')and ab.Glass:FindFirstChild('ClickDetector')then if
fireclickdetector then fireclickdetector(ab.Glass:FindFirstChild('ClickDetector'))end end end wait(0.5)local ac={X=0,V=0
,II=0}local function CalculatePanel(ad)local ae=tostring(ad)local af=tonumber(ae:sub(1,3))local ag=tonumber(ae:sub(4,6))
local ah=ag-af local ai={}if ah<0 then return{},''end local aj=ah//10 ah=ah%10 local ak=ah//5 ah=ah%5 local al=ah//2 ah=
ah%2 for am=1,aj do table.insert(ai,'X')end for am=1,ak do table.insert(ai,'V')end for am=1,al do table.insert(ai,'II')
end return ai,ah end local ad={['X']=10,['V']=5,['II']=2}repeat task.wait()pcall(function()repeat task.wait()until ab:
FindFirstChild('AddAmountsPanel')and ab.AddAmountsPanel:FindFirstChild('Screen')and ab.AddAmountsPanel.Screen:
FindFirstChild('SurfaceGui')and ab.AddAmountsPanel.Screen.SurfaceGui:FindFirstChild('TextLabel')and(tonumber(ab.
AddAmountsPanel.Screen.SurfaceGui.TextLabel.Text)or ab.AddAmountsPanel.Screen.SurfaceGui.TextLabel.Text:lower()==
'unlocked'or ab.AddAmountsPanel.Screen.SurfaceGui.TextLabel.Text:lower()=='error')repeat task.wait()until ab.
AddAmountsPanel.Screen.SurfaceGui.TextLabel.Text:lower()=='unlocked'or tonumber(ab.AddAmountsPanel.Screen.SurfaceGui.
TextLabel.Text)wait(0.7)local ae={X=0,V=0,II=0}local af,ag if ab:FindFirstChild('AddAmountsPanel')and ab.AddAmountsPanel
:FindFirstChild('Screen')and ab.AddAmountsPanel.Screen:FindFirstChild('SurfaceGui')and ab.AddAmountsPanel.Screen.
SurfaceGui:FindFirstChild('TextLabel')and ab.AddAmountsPanel.Screen.SurfaceGui.TextLabel.Text:lower()~='unlocked'then af
,ag=CalculatePanel(ab.AddAmountsPanel.Screen.SurfaceGui.TextLabel.Text)local ah=tonumber(ab.AddAmountsPanel.Screen.
SurfaceGui.TextLabel.Text:sub(1,3))local ai=tonumber(ab.AddAmountsPanel.Screen.SurfaceGui.TextLabel.Text:sub(4,6))if#af>
0 then for aj,ak in ipairs(af)do ah+=ad[ak]end local aj=ah..ai af,ag=CalculatePanel(aj)end if#af<0 then Notification(
[[The second number is smaller than the first number, you have reset amounts now.]],5)for aj=1,20 do for ak,al in pairs(
ab.AddAmountsPanel:GetChildren())do if al.Name=='Key'then if fireclickdetector then fireclickdetector(al.ClickDetector)
end end end end repeat task.wait()until ab.AddAmountsPanel.Screen.SurfaceGui.TextLabel.Text:lower()=='unlocked'or ab.
AddAmountsPanel.Screen.SurfaceGui.TextLabel.Text:lower()=='error'else af,ag=CalculatePanel(ab.AddAmountsPanel.Screen.
SurfaceGui.TextLabel.Text)if#af>0 then for aj,ak in pairs(af)do if ae[ak]then ae[ak]+=1 end end for aj,ak in pairs(ab.
AddAmountsPanel:GetChildren())do if ak.Name=='Key'then local al=ak:GetAttribute('AddAmount')local am=ak:FindFirstChild(
'SurfaceGui')and ak.SurfaceGui:FindFirstChild('TextLabel')for an,ao in pairs(ad)do if ao==al then if am then am.Text=an
..': '..ae[an]end end end end end for aj,ak in pairs(af)do for al,am in pairs(ab.AddAmountsPanel:GetChildren())do if am.
Name=='Key'and am:GetAttribute('AddAmount')==ad[ak]then if fireclickdetector and am:FindFirstChild('ClickDetector')then
fireclickdetector(am.ClickDetector)end end end wait(0.7)end end end end end)until ab:FindFirstChild('AddAmountsPanel')
and ab.AddAmountsPanel:FindFirstChild('Screen')and ab.AddAmountsPanel.Screen:FindFirstChild('SurfaceGui')and ab.
AddAmountsPanel.Screen.SurfaceGui:FindFirstChild('TextLabel')and ab.AddAmountsPanel.Screen.SurfaceGui.TextLabel.Text:
lower()=='unlocked'wait(0.8)for ae,af in pairs(ab.RotatedPaintings:GetChildren())do if af.Name=='Painting'and tonumber(
af:GetAttribute('RotationIndex'))~=0 then repeat task.wait(0.85)if tonumber(af:GetAttribute('RotationIndex'))>0 and
fireclickdetector then fireclickdetector(af.ClickDetector)end until tonumber(af:GetAttribute('RotationIndex'))==0 wait(
0.25)af.ClickDetector:Destroy()end end wait(0.3)repeat task.wait()if ab:FindFirstChild('ShovelChest')and ab.ShovelChest:
FindFirstChild('Hitbox')then if fireclickdetector then fireclickdetector(ab.ShovelChest.Hitbox:FindFirstChild(
'ClickDetector'))end end until game.Players.LocalPlayer.Backpack:FindFirstChild('Shovel')or game.Players.LocalPlayer.
Character:FindFirstChild('Shovel')wait(0.5)if game.Players.LocalPlayer.Backpack:FindFirstChild('Shovel')then game.
Players.LocalPlayer.Backpack:FindFirstChild('Shovel').Parent=game.Players.LocalPlayer.Character wait(0.3)end game.
Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ab:FindFirstChild('Grave'):FindFirstChild('Hitbox').CFrame*CFrame.
new(0,10,0)wait(0.5)repeat task.wait()if fireclickdetector then fireclickdetector(ab:FindFirstChild('Grave'):
FindFirstChild('Hitbox'):FindFirstChild('ClickDetector'))end until game.Workspace:FindFirstChild('Rig')and game.
Workspace.Rig:FindFirstChild('Head')and game.Workspace.Rig.Head.Transparency<=0 wait(0.3)if ab:FindFirstChild('Grave'):
FindFirstChild('Hitbox')then ClickFreezeBV(function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ab:
FindFirstChild('Grave'):FindFirstChild('Hitbox').CFrame*CFrame.new(0,25,0)end)end wait(2)repeat task.wait(0.05)if game.
Workspace:FindFirstChild('Rig')and game.Workspace.Rig:FindFirstChild('HumanoidRootPart')then if game.Players.LocalPlayer
.Backpack:FindFirstChild('Lantern')then game.Players.LocalPlayer.Backpack:FindFirstChild('Lantern').Parent=game.Players.
LocalPlayer.Character elseif game.Players.LocalPlayer.Character:FindFirstChild('Lantern')then if game.Workspace:
FindFirstChild('Rig')and game.Players.LocalPlayer.Character:FindFirstChild('Lantern')then game.Players.LocalPlayer.
Character:FindFirstChild('Lantern'):Activate()if game.Players.LocalPlayer.Character:FindFirstChild('Lantern')and game.
Players.LocalPlayer.Character.Lantern:FindFirstChild('Network')then game:GetService('Players').LocalPlayer.Character.
Lantern.Network:FireServer('Hit',game.Workspace.Rig:FindFirstChild('HumanoidRootPart'))end end end end until(workspace:
FindFirstChild('Slasher')and workspace.Slasher:FindFirstChild('Glove'))or(game.Workspace:FindFirstChild('Rig')and game.
Workspace.Rig:FindFirstChild('Humanoid')and game.Workspace.Rig.Humanoid.Health<=0)wait(0.3)repeat task.wait()until
workspace:FindFirstChild('Slasher')and workspace.Slasher:FindFirstChild('Glove')Unfreeze()task.wait(0.3)repeat task.
wait()if workspace:FindFirstChild('Slasher')and workspace.Slasher:FindFirstChild('Glove')then game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=workspace.Slasher.Glove.CFrame*CFrame.new(0,3,0)end until workspace:FindFirstChild(
'Slasher')==nil end end)elseif game.PlaceId==89837553336708 then Window:ChangeTitle('Map Plunger \u{1faa0}')Tabs={Tab=
Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox(
'Badge')aa:AddButton('Get Badge',function()if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then
local ab=workspace:FindFirstChild('plunger glove')ab:FindFirstChild('plungerglove').CFrame=game.Players.LocalPlayer.
Character:FindFirstChild('HumanoidRootPart').CFrame if fireclickdetector then fireclickdetector(ab:
FindFirstChildOfClass('ClickDetector'))end end end)elseif game.PlaceId==75803343514634 then Window:ChangeTitle(
'Shattered Reality \u{2694}\u{fe0f}')Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab('UI Settings',
B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Badge')aa:AddButton('Get Badge',function()if GetBadge then return end
GetBadge=true if game:GetService('Players').LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then local ab=
workspace:FindFirstChild('Stage1')if workspace:FindFirstChild('Stage1')then repeat task.wait()if ab:FindFirstChild(
'Lobby')and ab.Lobby.Portals:FindFirstChild('normal')then firetouchinterest(game:GetService('Players').LocalPlayer.
Character:FindFirstChild('HumanoidRootPart'),ab.Lobby.Portals.normal.Teleport1,0)firetouchinterest(game:GetService(
'Players').LocalPlayer.Character:FindFirstChild('HumanoidRootPart'),ab.Lobby.Portals.normal.Teleport1,1)end if ab:
FindFirstChild('glove')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ab.glove:FindFirstChild('Touch').
CFrame end until game:GetService('Players').LocalPlayer.Character:FindFirstChild('Evolg')or game:GetService('Players').
LocalPlayer.Backpack:FindFirstChild('Evolg')local ac=game:GetService('Players').LocalPlayer.Character:FindFirstChild(
'Evolg')or game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Evolg')if ac and ac:FindFirstChild('Glove')
and ac.Glove:FindFirstChild('HitParticles')then ac.Glove:FindFirstChild('HitParticles'):Destroy()end repeat task.wait()
if game:GetService('Players').LocalPlayer.Backpack:FindFirstChild('Evolg')then game:GetService('Players').LocalPlayer.
Backpack:FindFirstChild('Evolg').Parent=game:GetService('Players').LocalPlayer.Character end if game:GetService(
'Players').LocalPlayer.Character:FindFirstChild('Evolg')and game:GetService('Players').LocalPlayer.Character.Evolg:
FindFirstChild('Network')then for ad,ae in pairs(workspace:GetChildren())do if ae.Name:find('shadow')and ae:
FindFirstChild('HumanoidRootPart')then game:GetService('Players').LocalPlayer.Character:FindFirstChild('Evolg'):
Activate()game:GetService('Players').LocalPlayer.Character:WaitForChild('Evolg'):WaitForChild('Network'):FireServer(
'Hit',ae.HumanoidRootPart)end end end until ab:FindFirstChild('Mirror')and ab.Mirror:FindFirstChild('Touch')and ab.
Mirror.Touch:FindFirstChild('TouchInterest')wait(0.5)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ab.
Mirror:FindFirstChild('Touch').CFrame end repeat task.wait()until workspace:FindFirstChild('Stage2')wait(4)if workspace:
FindFirstChild('Stage2')then local ac=workspace:FindFirstChild('Stage2')if ac:FindFirstChild('Lobby')and ac.Lobby.
Portals:FindFirstChild('normal')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ac.Lobby.Portals.normal.
Teleport1.CFrame end wait(0.5)repeat task.wait()if ac:FindFirstChild('spinner')and ac.spinner:FindFirstChild('Part')and
ac.spinner.Part.Transparency<0.5 then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ac.spinner:
FindFirstChild('Part').CFrame*CFrame.new(0,60,0)wait(0.3)game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored=
true end until ac:FindFirstChild('Mirror')and ac.Mirror:FindFirstChild('Touch')and ac.Mirror.Touch:FindFirstChild(
'TouchInterest')wait(0.4)game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored=false game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=ac.Mirror:FindFirstChild('Touch').CFrame wait(4)end repeat task.wait()until workspace:
FindFirstChild('Stage3')wait(0.3)if workspace:FindFirstChild('Stage3')then wait(5)local ac=workspace:FindFirstChild(
'Stage3')if ac:FindFirstChild('Lobby')and ac.Lobby.Portals:FindFirstChild('default')then game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=ac.Lobby.Portals.default.Teleport2.CFrame end end repeat task.wait()until workspace:
FindFirstChild('BossArena')if workspace:FindFirstChild('BossAttackDebris')then workspace.BossAttackDebris:Destroy()end
local ac=workspace:FindFirstChild('BossArena')if ac:FindFirstChild('Arena')and ac.Arena:FindFirstChild('startTrigger')
then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ac.Arena:FindFirstChild('startTrigger').CFrame end
repeat task.wait()if ac:FindFirstChild('Arena'):FindFirstChild('mirrors')then for ad,ae in pairs(ac.Arena.mirrors:
GetChildren())do if ae:IsA('Model')and ae:FindFirstChild('Meshes/Mirror1_Plane.008')and ae['Meshes/Mirror1_Plane.008'].
Transparency<0.5 then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ae:FindFirstChild(
'Meshes/Mirror1_Plane.008').CFrame end end end until workspace:FindFirstChild('Rig')and workspace.Rig:FindFirstChild(
'Humanoid').Health<=0 Notification('Done, Get Badge (Glove, but Hitman kill)',5)end end)elseif game.PlaceId==
80420091630966 then _G.GetOldBright={['Old']={Brightness=game.Lighting.Brightness,ClockTime=game.Lighting.ClockTime,
FogEnd=game.Lighting.FogEnd,FogStart=game.Lighting.FogStart,GlobalShadows=game.Lighting.GlobalShadows,OutdoorAmbient=
game.Lighting.OutdoorAmbient},['New']={Brightness=2,ClockTime=14,FogEnd=200000,FogStart=100000,GlobalShadows=false,
OutdoorAmbient=Color3.fromRGB(128,128,128)}}for aa,ab in pairs(_G.GetOldBright.New)do game.Lighting:
GetPropertyChangedSignal(aa):Connect(function()if _G.FullBright then game.Lighting[aa]=ab end end)end Window:
ChangeTitle('Boss Mortis \u{2694}\u{fe0f}')Tabs={Tab=Window:AddTab('Main',B.Main),Tab1=Window:AddTab('Boss',B.Boss),[
'UI Settings']=Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Round 1')aa:AddToggle(
'Auto Slap Mortis',{Text='Auto Slap Snoob',Default=false,Callback=function(ab)_G.AutoSlapMortis=ab while _G.
AutoSlapMortis do if workspace:FindFirstChild('TheOutside')then for ac,ad in pairs(workspace.TheOutside:GetChildren())do
if ad.Name=='evilSnoob'and ad:FindFirstChild('hittable')then if game:GetService('Players').LocalPlayer.Character:
FindFirstChild('Lantern')and game:GetService('Players').LocalPlayer.Character.Lantern:FindFirstChild('Network')then game
:GetService('Players').LocalPlayer.Character:WaitForChild('Lantern'):WaitForChild('Network'):FireServer('Hit',ad.
hittable)game:GetService('Players').LocalPlayer.Character:FindFirstChild('Lantern'):Activate()end end end end task.wait(
)end end})aa:AddButton('Get Key',function()for ab,ac in pairs(game.Workspace:GetChildren())do if ac:IsA('Tool')and ac.
Name:find('Key')and ac:FindFirstChild('Handle')and ac:FindFirstChild('KeyClient')then repeat task.wait()game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=ac.Handle.CFrame until not ac:IsDescendantOf(workspace)end end wait(0.1)if
workspace:FindFirstChild('GateMechanism'):FindFirstChild('Touchpad')then game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=workspace.GateMechanism.Touchpad.CFrame end end)aa:AddButton('Teleport Portal',function()if game
.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then if workspace:FindFirstChild('TheOutside'):
FindFirstChild('TowerENT1')and workspace.TheOutside.TowerENT1:FindFirstChild('teleport')then game.Players.LocalPlayer.
Character.HumanoidRootPart.CFrame=workspace.TheOutside.TowerENT1.teleport.CFrame end end end)local ab=Tabs.Tab:
AddRightGroupbox('Round 2')ab:AddButton('Fix Elevator',function()if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then if game.Players.LocalPlayer.Character:FindFirstChild('Screwdriver')==nil or game.Players.
LocalPlayer.Backpack:FindFirstChild('Screwdriver')==nil then repeat task.wait()if workspace:FindFirstChild('Screwdriver'
)then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.Screwdriver.CFrame end until not workspace:
FindFirstChild('Screwdriver')end wait(0.3)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.Clickable
.boltClick.CFrame Notification('You have click, to fix',5)end end)ab:AddButton('Teleport Eli Vator',function()if game.
Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then if workspace:FindFirstChild('DialoguePrompts'):
FindFirstChild('Eli Vator')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.DialoguePrompts[
'Eli Vator'].Camera.CFrame wait(0.4)fireproximityprompt(workspace.DialoguePrompts['Eli Vator']:FindFirstChild(
'ProximityPrompt'))end end end)local ac=Tabs.Tab:AddRightGroupbox('Round 3')ac:AddButton('Teleport Hammer Big',function(
)if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then if workspace:FindFirstChild('TheOffice'):
FindFirstChild('HallwaySection3'):FindFirstChild('LargeHammerBox1'):FindFirstChild('Large Hammer')then game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.TheOffice.HallwaySection3.LargeHammerBox1['Large Hammer'].CFrame
wait(0.4)fireproximityprompt(workspace.TheOffice.HallwaySection3.LargeHammerBox1['Large Hammer']:FindFirstChild(
'ProximityPrompt'))end end end)ac:AddButton('Teleport Hook',function()if game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')then if workspace:FindFirstChild('TheOffice'):FindFirstChild('HallwaySection3')then
for ad,ae in pairs(workspace.TheOffice.HallwaySection3:GetChildren())do if ae.Name=='GlassShowcase1'and ae:
FindFirstChild('Hook')then for af,ag in pairs(ae:GetChildren())do if ag.Name=='Hook'and ag:FindFirstChild(
'ProximityPrompt')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ag.CFrame wait(0.4)
fireproximityprompt(ag:FindFirstChild('ProximityPrompt'))end end end end end end end)ac:AddButton('Teleport Glasses',
function()if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then if workspace:FindFirstChild(
'TheOffice'):FindFirstChild('toIndoor')then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.
TheOffice.toIndoor.CFrame end end end)ac:AddButton('Grappler',function()if game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')then if workspace:FindFirstChild('TheOffice'):FindFirstChild('Scaffold'):
FindFirstChild('Grappler'):FindFirstChild('GrapplingParts')then for ad,ae in pairs(workspace:FindFirstChild('TheOffice')
:FindFirstChild('Scaffold'):FindFirstChild('Grappler'):FindFirstChild('GrapplingParts'):GetChildren())do if ae:IsA(
'BasePart')then game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('TheOffice'):WaitForChild(
'GrapplerHook'):WaitForChild('onActivated'):FireServer(ae)end end end end end)local ad=Tabs.Tab1:AddLeftGroupbox(
'Boss Dice')ad:AddToggle('Tied',{Text='Anti Glare Wire',Default=false,Callback=function(ae)_G.AntiGlare=ae while _G.
AntiGlare do if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.
Character.HumanoidRootPart:FindFirstChild('WeldConstraint')then game:GetService('ReplicatedStorage'):WaitForChild(
'Remotes'):WaitForChild('ProcessJump'):FireServer()end task.wait()end end})ad:AddToggle('Tied',{Text='Anti Touch Head',
Default=false,Callback=function(ae)_G.AntiHead=ae while _G.AntiHead do if workspace:FindFirstChild('bossStorage')and
workspace.bossStorage:FindFirstChild('head')then workspace.bossStorage.head.CanTouch=false end task.wait()end if
workspace:FindFirstChild('bossStorage')and workspace.bossStorage:FindFirstChild('head')then workspace.bossStorage.head.
CanTouch=true end end})ad:AddToggle('Handleft',{Text='Auto Slap Left Hand',Default=false,Callback=function(ae)_G.
AutoSlap=ae spawn(function()while _G.AutoSlap do if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart'
)then if game:GetService('Players').LocalPlayer.Character:FindFirstChild('Lantern')then if workspace:FindFirstChild(
'bossStorage')and workspace.bossStorage:FindFirstChild('leftHand')and workspace.bossStorage.leftHand:FindFirstChild(
'PointerMimic')and workspace.bossStorage.leftHand.PointerMimic:FindFirstChild('TouchInterest')then game:GetService(
'Players').LocalPlayer.Character:FindFirstChild('Lantern'):Activate()game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart').CFrame=workspace.bossStorage.leftHand.PointerMimic.CFrame*CFrame.new(0,0,6.8)end end end task.wait()
end end)if NotificationUnSh then return end NotificationUnSh=true Notification(
[[You have turn off Shiftlock and but you have to stand still for it to work but you have to dodge the attack hand]],10)
end})CloneHead=false ad:AddToggle('Nail',{Text='Auto Slap Nail',Default=false,Callback=function(ae)_G.NailSlap=ae while
_G.NailSlap do _G.TeleportSafe=false if workspace:FindFirstChild('bossStorage')and workspace.bossStorage:FindFirstChild(
'head')then workspace.bossStorage.head.CanTouch=false end if workspace:FindFirstChild('BossfightCore')and workspace.
BossfightCore:FindFirstChild('BossTargetArea')then AreaBoss=workspace.BossfightCore.BossTargetArea end if workspace:
FindFirstChild('bossStorage')then for af,ag in pairs(workspace:WaitForChild('bossStorage'):GetChildren())do if(ag.Name:
find('thicc')or ag.Name=='nail')and ag:FindFirstChild('object')then if game:GetService('Players').LocalPlayer.Character:
FindFirstChild('Lantern')and ag:FindFirstChild('AnimationController')and ag.AnimationController:FindFirstChild(
'Animator')and#ag.AnimationController.Animator:GetPlayingAnimationTracks()==0 then if game.Players.LocalPlayer.Character
:FindFirstChild('HumanoidRootPart')then game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame=ag:
FindFirstChild('object').CFrame*CFrame.new(0,-10,0)game:GetService('Players').LocalPlayer.Character:FindFirstChild(
'Lantern'):Activate()end else _G.TeleportSafe=true end end end end if _G.TeleportSafe and AreaBoss then if game.Players.
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart').CFrame=AreaBoss.CFrame*CFrame.new(0,100,0)end if _G.StartFly==false then CreateFreezeBV()end elseif
not _G.TeleportSafe then CreateFreezeBV({Remove=true})end task.wait()end if workspace:FindFirstChild('bossStorage')and
workspace.bossStorage:FindFirstChild('head')then workspace.bossStorage.head.CanTouch=_G.AntiHead or false end
CreateFreezeBV({Remove=true})end})ad:AddButton('PickUp C4',function()if game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')then oldCF=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame for ae,af in
pairs(workspace:GetChildren())do if af.Name=='C4'then game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart').CFrame=af.CFrame wait(0.4)if fireproximityprompt then fireproximityprompt(af:FindFirstChildOfClass(
'ProximityPrompt'))end af.Destroying:Wait()end end wait(0.4)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=
oldCF end end)ad:AddButton('Install C4',function()if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')then oldCF=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame for ae,af in pairs(workspace.
ExplosiveGhosts:GetChildren())do if af:IsA('BasePart')and af:FindFirstChild('SurfaceAppearance')==nil then if game.
Players.LocalPlayer.Backpack:FindFirstChild('C4')then game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players
.LocalPlayer.Backpack:FindFirstChild('C4'))end wait(0.3)game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart').CFrame=af.CFrame wait(0.4)fireproximityprompt(af:FindFirstChildOfClass('ProximityPrompt'))wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=oldCF wait(0.5)end end end end)ad:AddButton('Pickup Bomb',
function()if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then if workspace:FindFirstChild(
'BombGlove')and workspace.BombGlove:FindFirstChild('Glove')then game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart').CFrame=workspace.BombGlove.Glove.CFrame wait(0.4)fireproximityprompt(workspace.BombGlove.Glove:
FindFirstChildOfClass('ProximityPrompt'))end end end)local ae=Tabs.Tab1:AddRightGroupbox('Misc')ae:AddToggle(
'No Cooldown Proximity',{Text='No Cooldown Proximity',Default=false,Callback=function(af)_G.NoCooldownProximity=af if _G
.NoCooldownProximity==true then for ag,ah in pairs(workspace:GetDescendants())do if ah.ClassName=='ProximityPrompt'then
ah.HoldDuration=0 end end else if CooldownProximity then CooldownProximity:Disconnect()CooldownProximity=nil end end
CooldownProximity=workspace.DescendantAdded:Connect(function(ag)if _G.NoCooldownProximity==true then if ag:IsA(
'ProximityPrompt')then ag.HoldDuration=0 end end end)end})ae:AddInput('FlySpeed',{Default='50',Numeric=true,Text=
'Fly Speed',Placeholder='UserFlySpeed',Callback=function(af)_G.SetSpeedFly=af end})_G.SetSpeedFly=50 ae:AddToggle(
'Start Fly',{Text='Start Fly',Default=false,Callback=function(af)Fly(af)end}):AddKeyPicker('Fly',{Default='R',Text='Fly'
,Mode='Toggle',SyncToggleState=true})ae:AddToggle('Full Bright',{Text='Full Bright',Default=false,Callback=function(af)
_G.FullBright=af if not _G.FullBright then for ag,ah in pairs(_G.GetOldBright.Old)do game:GetService('Lighting')[ag]=ah
end else for ag,ah in pairs(_G.GetOldBright.New)do game:GetService('Lighting')[ag]=ah end end end})ae:AddToggle('No Fog'
,{Text='No Fog',Default=false,Callback=function(af)_G.Nofog=af while _G.Nofog do for ag,ah in pairs(game:GetService(
'Lighting'):GetChildren())do if ah.ClassName=='Atmosphere'then ah.Density=0 ah.Haze=0 end end task.wait()end for ag,ah
in pairs(game:GetService('Lighting'):GetChildren())do if ah.ClassName=='Atmosphere'then ah.Density=0.3 ah.Haze=1 end end
end})elseif game.PlaceId==106620300132058 then Window:ChangeTitle('Plate \u{1f37d}\u{fe0f}')Tabs={Tab=Window:AddTab(
'Main',B.Main),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Badge')aa:
AddButton('Get Badge',function()if LoadingBadge then return end LoadingBadge=true if game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')then if workspace:FindFirstChild('Obstacles')then workspace.Obstacles:Destroy()end
Notification('Bypass plate obstacles',5)Notification('Wait in until glove appear',5)workspace:GetAttributeChangedSignal(
'Completed'):Connect(function()if workspace:GetAttribute('Completed')==true then Notification('Done Bro',5)while task.
wait()do if workspace:FindFirstChild('Glove Model'):FindFirstChild('Hand')then game.Players.LocalPlayer.Character.
HumanoidRootPart.CFrame=workspace['Glove Model'].Hand.CFrame end end end end)end end)elseif game.PlaceId==92483185275059
then Window:ChangeTitle('Maze Pim \u{1f573}\u{fe0f}')Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:
AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Badge')aa:AddButton('Get Badge',function()if
LoadingBadge then return end LoadingBadge=true repeat task.wait()until game:GetService('Players').LocalPlayer.PlayerGui:
FindFirstChild('Transition')and game:GetService('Players').LocalPlayer.PlayerGui.Transition:FindFirstChild('Frame')wait(
0.5)Transition=game:GetService('Players').LocalPlayer.PlayerGui:FindFirstChild('Transition')and game:GetService(
'Players').LocalPlayer.PlayerGui.Transition:FindFirstChild('Frame')ClickFreezeBV(function()end)repeat task.wait(0.5)
local ab=workspace:FindFirstChild('Maze')local ac=ab and ab:FindFirstChild('EndPrompt',true)local ad=workspace:
FindFirstChild('Shed')and workspace.Shed:FindFirstChild('StartDoor')and workspace.Shed.StartDoor:FindFirstChild(
'Cylinder.025')local ae=ad and ad:FindFirstChild('Attachment')and ad.Attachment:FindFirstChildOfClass('ProximityPrompt')
if Transition and Transition.BackgroundTransparency==1 then if ac then game.Players.LocalPlayer.Character:PivotTo(ac.
Parent.Parent.CFrame)if fireproximityprompt then fireproximityprompt(ac)end elseif not ab then if ad and ae then game.
Players.LocalPlayer.Character:PivotTo(ad.CFrame)if fireproximityprompt then fireproximityprompt(ae)end end end end until
workspace:FindFirstChild('Maze')and workspace.Maze:FindFirstChild('BarnMaze')repeat task.wait()until Transition and
Transition.BackgroundTransparency==1 wait(0.7)while true do local ab=workspace.Maze:FindFirstChild('ChaseOutroStart',
true)if ab then game.Players.LocalPlayer.Character:PivotTo(ab.CFrame)else game.Players.LocalPlayer.Character:PivotTo(
CFrame.new(-84,39,1421))end task.wait()end end)elseif game.PlaceId==103505724406848 then Window:ChangeTitle(
'Battles Zombie \26')Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}
local aa=Tabs.Tab:AddLeftGroupbox('Badge')aa:AddButton('Get Badge',function()repeat task.wait()until workspace:
FindFirstChild('BossAreaSpawn')and workspace:FindFirstChild('Enemies')local ab=workspace:WaitForChild('Enemies')repeat
task.wait(1)CreateFreezeBV()if workspace:FindFirstChild('BossAreaSpawn')then game.Players.LocalPlayer.Character:PivotTo(
workspace.BossAreaSpawn.CFrame*CFrame.new(0,65,0))end for ac,ad in pairs(ab:GetChildren())do if ad:FindFirstChild('Head'
)and ad:FindFirstChild('Humanoid')and ad.Humanoid.Health>0 then game:GetService('ReplicatedStorage').Remotes.GeneralHit:
FireServer(ad.Head)end end until workspace.Enemies:FindFirstChild('Boss Zombie')wait(0.6)while true do if workspace.
Enemies:FindFirstChild('Boss Zombie')and workspace.Enemies['Boss Zombie']:FindFirstChild('Head')then spawn(function()
game:GetService('ReplicatedStorage').Remotes.GeneralHit:FireServer(v.Head)end)end task.wait()end end)elseif game.PlaceId
==101113181694564 then Window:ChangeTitle('Collect Conker \u{1f34e}')Tabs={Tab=Window:AddTab('Main',B.Main),[
'UI Settings']=Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Badge')aa:AddButton(
'Get Badge',function()if LoadingBadge then return end LoadingBadge=true game:GetService('ReplicatedStorage').Remotes.
Dialogue.FinishedNPCDialogue:FireServer()repeat task.wait()until workspace:FindFirstChild('Map'):FindFirstChild('Props')
:FindFirstChild('BasketCollection')and workspace.Map.Props.BasketCollection:FindFirstChild('Basket')fireclickdetector(
workspace.Map.Props.BasketCollection.Basket.ClickDetector)repeat task.wait()until game.Players.LocalPlayer.Character:
FindFirstChild('ConkerHoldVisual')ClickFreezeBV(function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=
workspace.Map.CoreAssets.Bowl['Sphere.002'].CFrame end)task.wait(2.8)game.Players.LocalPlayer.Character.HumanoidRootPart
.CFrame=workspace.Map.CoreAssets.Bowl['Sphere.002'].CFrame spawn(function()workspace.NPCs.DescendantAdded:Connect(
function(ab)if ab.Name=='squirrel'then local ac,ad=pcall(function()while task.wait()and ab do if ab:FindFirstChild(
'HumanoidRootPart')then game:GetService('ReplicatedStorage').Remotes.tool.use:FireServer('slap')game:GetService(
'ReplicatedStorage').Remotes.tool.hit:FireServer('slap',{Instance=ab.HumanoidRootPart})end end end)end end)workspace.
DescendantAdded:Connect(function(ab)if ab.Name=='Conker'then if ab:FindFirstChildOfClass('TouchTransmitter')then game.
Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ab.CFrame if firetouchinterest then firetouchinterest(ab,game.
Players.LocalPlayer.Character.HumanoidRootPart,0)firetouchinterest(ab,game.Players.LocalPlayer.Character.
HumanoidRootPart,1)end task.delay(0.1,function()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.Map
.CoreAssets.Bowl['Sphere.002'].CFrame task.wait(0.5)workspace.Map.CoreAssets.Bowl.ProximityPrompt.HoldDuration=0 if
fireproximityprompt then fireproximityprompt(workspace.Map.CoreAssets.Bowl.ProximityPrompt)end pcall(function()workspace
.Map.CoreAssets.Bowl.ProximityPrompt:InputHoldBegin()workspace.Map.CoreAssets.Bowl.ProximityPrompt:InputHoldEnd()end)end
)end end end)end)end)elseif game.PlaceId==95706409702231 then if workspace:FindFirstChild('Attacks')then workspace:
FindFirstChild('Attacks'):Destroy()end if workspace:FindFirstChild('Effects')then workspace:FindFirstChild('Effects'):
Destroy()end Window:ChangeTitle('Boss Jerry \u{2603}\u{fe0f}')Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=
Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Badge')aa:AddButton('Get Badge',function()
CreateFreezeBV()game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame=workspace.KillPart.CFrame*
CFrame.new(0,150,0)game:GetService('RunService').RenderStepped:Connect(function()if workspace:FindFirstChild('Boss')and
workspace.Boss:FindFirstChildOfClass('Humanoid')then workspace.Boss:FindFirstChildOfClass('Humanoid').Health=-math.huge
workspace.Boss:FindFirstChildOfClass('Humanoid').Sit=true end end)end)elseif game.PlaceId==94481828238038 then local aa=
game:GetService('ReplicatedStorage'):WaitForChild('Remotes')local ab=game:GetService('CoreGui')if not ab:FindFirstChild(
'ClickButton')then local ac=Instance.new('ScreenGui',ab)ac.Name='ClickButton'local ad=Instance.new('TextButton')ad.Name=
'FlingYour'ad.Size=UDim2.new(0.12,0,0.12,0)ad.Position=UDim2.new(0.42,0,0.7,0)ad.BackgroundColor3=Color3.new(255,255,255
)ad.Text='Fling Your'ad.TextScaled=true ad.BackgroundTransparency=0 ad.TextColor3=Color3.new(0,0,0)ad.Font=Enum.Font.
Code ad.Draggable=true ad.Visible=false ad.Parent=ac Instance.new('UICorner').Parent=ad ad.MouseButton1Click:Connect(
function()if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then for ae,af in pairs(workspace.
Interactables.Instances:GetChildren())do if af.Name=='object'and af:FindFirstChild('Root'):IsA('MeshPart')and af.Root.
MeshId:find('11351437058')then if firetouchinterest then firetouchinterest(game.Players.LocalPlayer.Character.
HumanoidRootPart,af.Root,0)firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,af.Root,1)end break end
end end end)local ae=Instance.new('UIStroke')ae.Color=Color3.new(0,0,0)ae.Thickness=2.2 ae.ApplyStrokeMode='Border'ae.
Parent=ad if ad then local af=ad:Clone()af.Name='ButtonTween'af.Text='Tween Hell'af.Visible=false af.Parent=ac af.
MouseButton1Click:Connect(function()if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then if game
.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')and game.Players.
LocalPlayer.Character.Humanoid.RootPart and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(
'VelocityHandler')==nil then local ag=Instance.new('BodyVelocity')ag.Name='VelocityHandler'ag.Parent=game.Players.
LocalPlayer.Character.HumanoidRootPart ag.MaxForce=Vector3.new(100000,100000,100000)ag.Velocity=Vector3.new(0,0,0)end
local ag=game:GetService('TweenService'):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new((game.
Players.LocalPlayer.Character.HumanoidRootPart.Position-workspace.zone.Position).Magnitude/31,Enum.EasingStyle.Linear),{
CFrame=workspace.zone.CFrame})ag:Play()ag.Completed:Wait()ag:Cancel()if game.Players.LocalPlayer.Character and game.
Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')and game.Players.LocalPlayer.Character.Humanoid.RootPart
and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild('VelocityHandler')then game.Players.LocalPlayer.
Character.HumanoidRootPart.VelocityHandler:Destroy()end end end)end end Window:ChangeTitle('SnowBall \u{2603}\u{fe0f}')
Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}local ac=Tabs.Tab:
AddLeftGroupbox('Combat')ac:AddSlider('Reach Aura',{Text='Reach Slap Aura',Default=25,Min=10,Max=50,Rounding=0,Compact=
true,Callback=function(ad)_G.ReachSlapArua=ad end})ac:AddToggle('Slap Aura',{Text='Slap Aura',Default=false,Callback=
function(ad)_G.SlapAura=ad while _G.SlapAura do aa:WaitForChild('tool'):WaitForChild('use'):FireServer('slap')for ae,af
in pairs(game.Players:GetChildren())do if af~=game.Players.LocalPlayer and game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')and af.Character then if af.Character:FindFirstChild('HumanoidRootPart')and game.
Players.LocalPlayer.Team~=af.Team then if _G.ReachSlapArua>=(game.Players.LocalPlayer.Character.HumanoidRootPart.
Position-af.Character.HumanoidRootPart.Position).Magnitude then aa:WaitForChild('tool'):WaitForChild('hit'):FireServer(
'slap',{Instance=af.Character.HumanoidRootPart,Direction=af.Character.HumanoidRootPart.Position})break end end end end
task.wait(0.2)end end})ac:AddSlider('Power Snowball (Shallow)',{Text='Power Snowball (Shallow)',Default=5,Min=1,Max=10,
Rounding=0,Compact=true,Callback=function(ad)_G.PowerSnowball=ad end})ac:AddToggle('Spam SnowBall',{Text=
'Spam Throw Snowball',Default=false,Callback=function(ad)_G.ThrowSnowBall=ad while _G.ThrowSnowBall do for ae,af in
pairs(game.Players:GetChildren())do if af~=game.Players.LocalPlayer and game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')and af.Character then if af.Character:FindFirstChild('HumanoidRootPart')and game.
Players.LocalPlayer.Team~=af.Team then if 150>=(game.Players.LocalPlayer.Character.HumanoidRootPart.Position-af.
Character.HumanoidRootPart.Position).Magnitude then aa:WaitForChild('SnowballThrow'):FireServer(af.Character.
HumanoidRootPart.Position,tonumber(_G.PowerSnowball))break end end end end task.wait()end end})local ad=Tabs.Tab:
AddRightGroupbox('Misc')ad:AddToggle('Heal',{Text='Collect Heal',Default=false,Callback=function(ae)_G.CollectHeal=ae
while _G.CollectHeal do if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then for af,ag in pairs(
workspace.Interactables.Instances:GetChildren())do if ag.Name=='object'and ag:FindFirstChild('Hot Cocoa')then local ah=
ag:FindFirstChildWhichIsA('TouchTransmitter',true)if firetouchinterest then firetouchinterest(game.Players.LocalPlayer.
Character.HumanoidRootPart,ah.Parent,0)firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,ah.Parent,1
)end end end end task.wait()end end})ad:AddToggle('Button Fling',{Text='Button Fling',Default=false,Callback=function(ae
)if ab:FindFirstChild('ClickButton')and ab.ClickButton:FindFirstChild('FlingYour')then ab.ClickButton:FindFirstChild(
'FlingYour').Visible=ae end end})ad:AddToggle('Button Tween Hell',{Text='Button Tween Hell',Default=false,Callback=
function(ae)if ab:FindFirstChild('ClickButton')and ab.ClickButton:FindFirstChild('ButtonTween')then ab.ClickButton:
FindFirstChild('ButtonTween').Visible=ae end end})elseif game.PlaceId==122901288403496 then function InTable(aa,ab)for
ac,ad in ipairs(aa)do if ad==ab then return true end end return false end Window:ChangeTitle('JOB APPLICATION!!! \26')
Tabs={Tab=Window:AddTab('Main','rbxassetid://4370318685'),['UI Settings']=Window:AddTab('UI Settings',
'rbxassetid://7733955511')}local aa=Tabs.Tab:AddLeftGroupbox('Clean Trash')aa:AddButton('Collect Mop / Broom',function()
for ab,ac in pairs(workspace.Tools.Prompts:GetDescendants())do if ac:IsA('ProximityPrompt')then game.Players.LocalPlayer
.Character.HumanoidRootPart.CFrame=ac.Parent.CFrame wait(0.5)fireproximityprompt(ac)end end end)local function Unequip()
for ab,ac in ipairs(game.Players.LocalPlayer.Character:GetChildren())do if ac:IsA('Tool')then ac.Parent=game.Players.
LocalPlayer.Backpack end end end local function Equip(ab)Unequip()local ac=game.Players.LocalPlayer.Backpack:
FindFirstChild(ab)if ac and game.Players.LocalPlayer.Character then ac.Parent=game.Players.LocalPlayer.Character end end
aa:AddToggle('Auto Clean Trash',{Text='Auto Clean Trash',Default=false,Callback=function(ab)_G.AutoCleanTrash=ab while
_G.AutoCleanTrash do for ac,ad in pairs(workspace.Trash.Instances:GetChildren())do if(ad.Name=='TrashPile'or ad.Name==
'TrashSpill')then local ae=ad:FindFirstChild('trash pile')or ad:FindFirstChild('Slime')if ae then local af=game.Players.
LocalPlayer.Character.HumanoidRootPart.CFrame if ae.Name:lower():find('trash pile')then Equip('Broom')else Equip('Mop')
end game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=ae.CFrame*CFrame.new(0,5,0)repeat task.wait()game:
GetService('ReplicatedStorage').Remotes.CleanTrash:FireServer(ad)until not(ad and(ad:FindFirstChild('trash pile')or ad:
FindFirstChild('Slime')))wait(0.3)game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=af end end end task.wait()
end end})local ab=Tabs.Tab:AddRightGroupbox('Misc')ab:AddToggle('Auto Stock Shelf Glove',{Text='Auto Stock Shelf Glove',
Default=false,Callback=function(ac)_G.AutoStockGlove=ac while _G.AutoStockGlove do if workspace:FindFirstChild(
'GloveShipment')then for ad,ae in ipairs(workspace.GloveShipment:GetChildren())do if ae:IsA('Model')and ae.Name:lower():
find('stockbox_')and ae:FindFirstChild('Box')then local af=ae.Name:match('_(.+)')if not af then continue end repeat task
.wait()game:GetService('ReplicatedStorage').Remotes.PickupBox:FireServer(ae)until workspace:FindFirstChild('HeldBox_'..
af)for ag,ah in ipairs(workspace.Shelves:GetChildren())do if ah:IsA('Model')and ah:FindFirstChild('Base')and workspace:
FindFirstChild('HeldBox_'..af)then local ai=false function GloveSh()for aj,ak in pairs(ah:GetDescendants())do if ak.Name
:match('Glove')then return true end end return false end if GloveSh()then continue end repeat task.wait()game:
GetService('ReplicatedStorage').Remotes.StockShelf:FireServer(ah)until not workspace:FindFirstChild('HeldBox_'..af)or
GloveSh()break end end end end end task.wait()end end})ab:AddButton('Teleport Sell Glove',function()if workspace.Counter
:FindFirstChild('ItemPlacement')then if game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then game.
Players.LocalPlayer.Character.HumanoidRootPart.CFrame=workspace.Counter.ItemPlacement.CFrame*CFrame.new(-5,0,0)end end
end)ab:AddToggle('Auto Sell Glove',{Text='Auto Sell Glove',Default=false,Callback=function(ac)_G.AutoSellGlove=ac while
_G.AutoSellGlove do for ad,ae in ipairs(workspace:GetChildren())do for af,ag in pairs(ae:GetChildren())do if ag.Name:
find('Glove')then if not ag.Parent.Name:lower():find('heldcheckoutitem_')then game:GetService('ReplicatedStorage'):
WaitForChild('Remotes'):WaitForChild('PickupCheckoutItem'):FireServer(ag.Parent)else game:GetService('ReplicatedStorage'
):WaitForChild('Remotes'):WaitForChild('ScanCheckoutItem'):FireServer(ag.Parent.Name:match('_(.+)'))end end end end task
.wait()end end})ab:AddButton('Find Glove Sell',function()local ac={'bob','bubble','lamp','l.o.l.b.o.m.b','overkill',
'plague','sbeve','ufo'}local ad={}local ae=game.Players.LocalPlayer.PlayerGui local af=ae.WholesaleOrdering.Canvas.
Listings.ScrollingFrame for ag,ah in ipairs(af:GetChildren())do if ah.Name:lower():find('listing')and ah:FindFirstChild(
'Topbar')then local ai=ah.Topbar.ItemName.Text:lower():match('^(.-)%s*%[')if InTable(ac,ai)and not ae.Displays.
subBarHolder.day.Text:match('5')then continue end local aj=tonumber(ah.ExpectedProfit.Text:sub(2))local ak=tonumber(ah.
Cost.Text:sub(2))if aj and ak then table.insert(ad,{ah,aj,ak})end end end table.sort(ad,function(ag,ah)return ag[2]>ah[2
]end)local ag=tonumber(ae.Displays.topBarHolder.cash.Text:sub(2))or 0 for ah,ai in ipairs(ad)do if ag>=ai[3]then ag-=ai[
3]if firesignal then firesignal(ai[1].Activated)end local aj=ai[1]:FindFirstChild('ItemName',true)if aj then local ak=aj
:Clone()ak.Parent=ai[1]ak.Text='Choose Here'local function CheckToClick()if ak then if ai[1].BackgroundColor3==Color3.
fromRGB(58,158,95)then ak.Text=''elseif ai[1].BackgroundColor3==Color3.fromRGB(111,111,111)then ak.Text='Choose Here'end
end end CheckToClick()ai[1].MouseButton1Click:Connect(CheckToClick)end end end end)elseif game.PlaceId==86045914443715
then Window:ChangeTitle('Car Key \u{1f697}')Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab(
'UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Main')aa:AddButton('Get Badge',function()if game:
GetService('Players').LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then Map=game:GetService('Workspace'):
WaitForChild('Map')if Map and Map:FindFirstChild('Racetrack')then Map.Racetrack:Destroy()end if Map and Map:
FindFirstChild('kill_bricks')then Map.kill_bricks:Destroy()end local ab=Instance.new('AlignPosition',game:GetService(
'Players').LocalPlayer.Character.HumanoidRootPart)ab.Attachment0=Instance.new('Attachment',game:GetService('Players').
LocalPlayer.Character.HumanoidRootPart)ab.Mode=Enum.PositionAlignmentMode.OneAttachment ab.MaxForce=math.huge for ac=1,#
Map.Waypoints:GetChildren()do ab.Position=Map.Waypoints[tostring(ac)].Position repeat task.wait()until(game:GetService(
'Players').LocalPlayer.Character.HumanoidRootPart.Position-Map.Waypoints[tostring(ac)].Position).Magnitude<=100 end ab.
Position=Vector3.new(-1431,425,-859)end end)elseif game.PlaceId==113228834069218 or game.PlaceId==95356852680586 then
Window:ChangeTitle('Cosplay Penguins \u{1f427}')Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab(
'UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Main')if game.PlaceId==113228834069218 then aa:AddButton(
'Collect All Fish',function()if workspace:FindFirstChild('Fih')and game:GetService('Players').LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')then for ab,ac in pairs(workspace:FindFirstChild('Fih'):GetChildren())do if ac:IsA(
'Model')and ac.Name:lower()=='spinningfish'and ac:FindFirstChild('Fish')and ac.Fish:FindFirstChild('TouchInterest')then
if typeof(firetouchinterest)=='function'then firetouchinterest(game:GetService('Players').LocalPlayer.Character:
FindFirstChild('HumanoidRootPart'),ac.Fish,0)firetouchinterest(game:GetService('Players').LocalPlayer.Character:
FindFirstChild('HumanoidRootPart'),ac.Fish,1)end ac.Fish.CFrame=game:GetService('Players').LocalPlayer.Character:
FindFirstChild('HumanoidRootPart').CFrame end end end end)aa:AddButton('Teleport To Finish',function()if workspace:
FindFirstChild('FinishPart')and game:GetService('Players').LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then
if typeof(firetouchinterest)=='function'then firetouchinterest(game:GetService('Players').LocalPlayer.Character:
FindFirstChild('HumanoidRootPart'),workspace.FinishPart.TouchInterest.Parent,0)firetouchinterest(game:GetService(
'Players').LocalPlayer.Character:FindFirstChild('HumanoidRootPart'),workspace.FinishPart.TouchInterest.Parent,1)end game
:GetService('Players').LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame=workspace.FinishPart.CFrame*
CFrame.new(0,-10,0)end end)elseif game.PlaceId==95356852680586 then local ab=workspace:WaitForChild('Snowman'):
WaitForChild('Models')aa:AddButton('Pickup Item Cosplay',function()CosplayName={}for ac,ad in pairs(ab.DisplaySnowman.
Accessories:GetChildren())do if ad:IsA('Folder')then for ae,af in pairs(ad:GetDescendants())do if af:IsA('Model')then
local ag=af:FindFirstChild('Handle')if ag and ag.Transparency==0 then table.insert(CosplayName,af.Name)end end end end
end if#CosplayName>0 then for ac,ad in pairs(CosplayName)do for ae,af in pairs(workspace:FindFirstChild('Accessories'):
GetChildren())do if af.Name:lower()==ad:lower()and af:FindFirstChild('Handle')and af:FindFirstChild('ProximityPrompt')
then local ag=af:FindFirstChild('Handle',true)local ah=af:FindFirstChild('ProximityPrompt',true)repeat task.wait()if
typeof(fireproximityprompt)=='function'then fireproximityprompt(ah)end game:GetService('Players').LocalPlayer.Character:
FindFirstChild('HumanoidRootPart').CFrame=ag.CFrame*CFrame.new(0,3,0)until(game.Players.LocalPlayer.Character:
FindFirstChild(af:GetAttribute('SnowmanPartType'))and game.Players.LocalPlayer.Character:FindFirstChild(af:GetAttribute(
'SnowmanPartType')):IsA('Tool'))or(game.Players.LocalPlayer.Backpack:FindFirstChild(af:GetAttribute('SnowmanPartType'))
and game.Players.LocalPlayer.Backpack:FindFirstChild(af:GetAttribute('SnowmanPartType')):IsA('Tool'))end end end end end
)aa:AddButton('Put Snowman',function()if not(game.Players.LocalPlayer.Character:FindFirstChild('Snow')or game.Players.
LocalPlayer.Backpack:FindFirstChild('Snow'))then repeat task.wait()if typeof(fireproximityprompt)=='function'then
fireproximityprompt(workspace.Interactables.SnowObject.ProximityPrompt)end game:GetService('Players').LocalPlayer.
Character:FindFirstChild('HumanoidRootPart').CFrame=workspace.Interactables.SnowObject.CFrame*CFrame.new(0,5,0)until
game.Players.LocalPlayer.Character:FindFirstChild('Snow')or game.Players.LocalPlayer.Backpack:FindFirstChild('Snow')end
local function PlayerSnow()for ac,ad in pairs(ab.PlayerSnowman:GetChildren())do if ad:IsA('BasePart')and ad.Transparency
>0 then return false end end return true end repeat task.wait()if ab.PlayerSnowman:FindFirstChildOfClass(
'ProximityPrompt')then if typeof(fireproximityprompt)=='function'then fireproximityprompt(ab.PlayerSnowman:
FindFirstChildOfClass('ProximityPrompt'))end if game.Players.LocalPlayer.Backpack:FindFirstChild('Snow')then game.
Players.LocalPlayer.Backpack:FindFirstChild('Snow').Parent=game.Players.LocalPlayer.Character end game:GetService(
'Players').LocalPlayer.Character:FindFirstChild('HumanoidRootPart').CFrame=ab.PlayerSnowman:FindFirstChild('Head').
CFrame*CFrame.new(0,3,0)end until PlayerSnow()==true wait(0.5)for ac,ad in pairs(game.Players.LocalPlayer.Backpack:
GetChildren())do if ad:IsA('Tool')then game:GetService('Players').LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart').CFrame=ab.PlayerSnowman:FindFirstChild('Head').CFrame*CFrame.new(0,3,0)wait(0.3)game.Players.
LocalPlayer.Character.Humanoid:EquipTool(ad)wait(0.3)if typeof(fireproximityprompt)=='function'then fireproximityprompt(
ab.PlayerSnowman:FindFirstChildOfClass('ProximityPrompt'))end ad.Destroying:Wait()end end end)end elseif game.PlaceId==
79885102123162 then function CheckGloveHide(aa)for ab,ac in pairs(workspace.Map.GloveLocation:GetDescendants())do if ac:
IsA('Model')and ac.Name:lower():find(aa:lower())then if ac:GetAttribute('Visible')==true then return false end end end
return true end function CheckGloveFind(aa)for ab,ac in pairs(workspace.Map.GloveLocation:GetDescendants())do if ac:IsA(
'Model')and ac.Name:lower():find(aa:lower())then if ac:GetAttribute('Visible')==true then for ad,ae in pairs(ac:
GetDescendants())do if ae:IsA('BasePart')then return ae.CFrame end end end end end return nil end Window:ChangeTitle(
'Find Glove \u{1f50d}')Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}
local aa=Tabs.Tab:AddLeftGroupbox('Main')aa:AddButton('Find Glove Touch',function()if game:GetService('Players').
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then for ab,ac in pairs(workspace.Map.GloveLocation:
GetDescendants())do if ac:IsA('Model')then game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame=
CFrame.new(ac:GetPivot().Position)task.wait(0.3)end if ac:IsA('TouchTransmitter')and ac.Parent:IsA('BasePart')and not ac
.Parent:GetAttribute('__Hidden')then repeat task.wait()game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
.CFrame=ac.Parent.CFrame until ac.Parent:GetAttribute('__Hidden')==true task.wait(0.3)end end end end)for ab,ac in
pairs({'Plate','Scythe','Brick','Jerry','Prop','Pineapple'})do aa:AddButton('Find Glove '..ac,function()if game:
GetService('Players').LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then if ac:lower():find('plate')then if
workspace:WaitForChild('Map'):WaitForChild('obstacle/puzzles'):WaitForChild('RegularMap'):WaitForChild('Plate'):
WaitForChild('Sign'):WaitForChild('hitbox')then game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame
=workspace:WaitForChild('Map'):WaitForChild('obstacle/puzzles'):WaitForChild('RegularMap'):WaitForChild('Plate'):
WaitForChild('Sign'):WaitForChild('hitbox').CFrame Notification('You have slap Sign to plate',5)repeat task.wait()until
not CheckGloveHide(ac)wait(0.4)game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame=(CheckGloveFind(
ac)or game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame)end elseif ac:lower():find('scythe')then
Notification('You have click Pumpkin',5)for ad,ae in pairs(workspace.Map['obstacle/puzzles'].Halloween.Scythe:
GetChildren())do if ae.Name:find('Pumpkin')then for af,ag in pairs(ae:GetChildren())do if ag:IsA('BasePart')and not ag:
GetAttribute('__Hidden')then game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame=ag.CFrame repeat
task.wait()until ag:GetAttribute('__Hidden')==true break end end end end repeat task.wait()until not CheckGloveHide(ac)
wait(0.4)game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame=(CheckGloveFind(ac)or game:GetService(
'Players').LocalPlayer.Character.HumanoidRootPart.CFrame)elseif ac:lower():find('brick')then Notification(
'You have click brick in collect glove',5)game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame=
workspace.Map.GloveLocation.CastleIsland.Brick.Brick.CFrame elseif ac:lower():find('prop')then Notification(
'You have click prop in collect glove',5)game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame=
workspace.Map['obstacle/puzzles'].RegularMap.Prop.Prop_Rock.CFrame elseif ac:lower():find('pineapple')then Notification(
'You have click pineapple in collect glove',5)game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame=
workspace.Map['obstacle/puzzles'].Barzil.Pineslapple.Pineapple.CFrame elseif ac:lower():find('jerry')then Notification(
'You have click Snowpeeps 3 time for the glove to appear',5)for ad,ae in pairs(workspace.Map['obstacle/puzzles'].Winter.
Jerry_Snowpeeps:GetDescendants())do if ae:IsA('ClickDetector')then if fireclickdetector then fireclickdetector(ae)end if
ae.Parent:IsA('BasePart')then game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame=ae.Parent.CFrame
repeat task.wait()until ae.Parent:GetAttribute('__Hidden')==true end end end repeat task.wait()until not CheckGloveHide(
ac)wait(0.4)game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame=(CheckGloveFind(ac)or game:
GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame)end end end)end elseif game.PlaceId==15228348051
then spawn(function()repeat task.wait()local aa,ab=pcall(function()return require(game.ReplicatedStorage.
TowerDefenceAssets.TD_Dictionary)end)if aa then _G.TDDefence=ab end until _G.TDDefence end)local aa=game.Players.
LocalPlayer local ab=game.Workspace.Maps:WaitForChild(aa.Name.."'s Map"):WaitForChild('Defences')local ac=game:
GetService('ReplicatedStorage'):WaitForChild('TowerDefenceAssets'):WaitForChild('TD_Event')if aa:GetAttribute(
'CurrentMap')and aa:GetAttribute('CurrentMap'):lower()=='mapfarm'then SaveDefence={['Scarecrow']={CFrame.new(18.16,9.25,
-18.35),CFrame.new(18.674,9.25,-21.802),CFrame.new(15.06,9.25,-17.36),CFrame.new(17.183,9.25,-19.138),CFrame.new(16.553,
9.25,-20.415)},['Farmer2']={CFrame.new(46.449,9.9,-9.293),CFrame.new(26.838,9.9,22.784),CFrame.new(58.493,9.9,14.624),
CFrame.new(20.492,9.9,41.426)},['Farmer1']={CFrame.new(-2.882,9.9,7.012),CFrame.new(-0.657,9.9,6.825),CFrame.new(1.067,
9.9,6.587),CFrame.new(3.232,9.9,6.386),CFrame.new(5.214,9.9,5.814)},['Farmer Tencelll']={CFrame.new(21.962,9.15,-11.323)
,CFrame.new(80.139,9.15,-4.739),CFrame.new(37.594,9.15,6.968)}}else SaveDefence={['Defence2']={CFrame.new(29.4,9.667,
4.49),CFrame.new(67.45,9.667,22.996),CFrame.new(19.844,9.667,8.144),CFrame.new(24.326,9.667,50.881),CFrame.new(14.049,
9.667,32.988)},['Defence3']={CFrame.new(22.585,9.15,23.971),CFrame.new(58.277,9.15,21.029),CFrame.new(55.227,9.15,22.113
),CFrame.new(22.134,9.15,-13.296),CFrame.new(30.495,9.15,18.987),CFrame.new(48.039,9.15,-15.423)},['Defence1']={CFrame.
new(23.324,9.667,-10.98),CFrame.new(50.683,9.667,-7.535),CFrame.new(50.611,9.667,9.831),CFrame.new(38.331,9.667,-13.706)
,CFrame.new(38.883,9.667,16.625),CFrame.new(48.638,9.667,-18.055),CFrame.new(49.79,9.667,2.143),CFrame.new(53.311,9.667,
14.962)}}end Window:ChangeTitle('Map Tower Defence \u{1f33b}')Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=
Window:AddTab('UI Settings',B.Settings)}local ad=Tabs.Tab:AddLeftGroupbox('Main')ad:AddButton('Get Badge',function()
local function DeployDefences(ae)local af=SaveDefence[ae]if not af then return end for ag,ah in ipairs(af)do repeat task
.wait(0.7)local ai=false for aj,ak in pairs(ab:GetChildren())do if ak.Name==ae and ak:FindFirstChild('HumanoidRootPart')
and(ak.HumanoidRootPart.Position-ah.Position).Magnitude<1 then ai=true break end end wait(0.5)if not ai and _G.TDDefence
and _G.TDDefence.Defences[ae]then local aj=_G.TDDefence.Defences[ae].Cost local ak=aa:GetAttribute('Gold')if ak>=aj then
ac:FireServer('PlaceDefence',{['cf']=ah,['defencename']=ae})wait(0.5)end end until ai==true end end if aa:GetAttribute(
'CurrentMap'):lower()=='mapfarm'then DefenceList={'Scarecrow','Farmer1','Farmer2','Farmer Tencelll'}else DefenceList={
'Defence1','Defence2','Defence3'}end for ae,af in ipairs(DefenceList)do DeployDefences(af)end while task.wait()do if _G.
TDDefence then for ae,af in pairs(ab:GetChildren())do local ag=_G.TDDefence.Defences[af.Name]local ah=af:GetAttribute(
'Level')if ag and ah and ah<3 then local ai=tonumber(ag.Cost)or 0 local aj=ai*1.3*ah if aa:GetAttribute('Gold')>=aj then
ac:FireServer('Upgrade',{['defence']=af})end end end end end end)elseif game.PlaceId==128229958211947 then Window:
ChangeTitle('Chicken Boss \u{1f423}')Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab('UI Settings',
B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Main')aa:AddButton('Get Badge',function()if not game.Workspace:
GetAttribute('Phase')then Notification('You have wait until fight',5)repeat task.wait()until game.Workspace:
GetAttribute('Phase')end CreateFreezeBV()if game.Workspace:GetAttribute('Phase')==1 then repeat task.wait()pcall(
function()if workspace:FindFirstChild('EasterMap'):FindFirstChild('Phase1'):FindFirstChild('MapObjects')then for ab,ac
in pairs(workspace.EasterMap.Phase1.MapObjects:GetChildren())do if ac.Name:lower()=='slapapult'and ac:FindFirstChild(
'ShootButton')and ac:FindFirstChild('HandleButton')and not ac:GetAttribute('Broken')then game:GetService('Players').
LocalPlayer.Character.HumanoidRootPart.CFrame=ac.ShootButton.CFrame*CFrame.new(0,5,0)repeat task.wait()game:GetService(
'ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Egg'):WaitForChild('GloveSwing'):FireServer()game:GetService(
'ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('Egg'):WaitForChild('GloveHit'):FireServer(ac:FindFirstChild(
'HandleButton'))until(ac:GetAttribute('Charge')or 0)>=2 wait(0.3)repeat task.wait()game:GetService('ReplicatedStorage'):
WaitForChild('Remotes'):WaitForChild('Egg'):WaitForChild('GloveSwing'):FireServer()game:GetService('ReplicatedStorage'):
WaitForChild('Remotes'):WaitForChild('Egg'):WaitForChild('GloveHit'):FireServer(ac:FindFirstChild('ShootButton'))until
ac:GetAttribute('Broken')end end end end)until game.Workspace:GetAttribute('Phase')>=2 end if game.Workspace:
GetAttribute('Phase')>=2 then repeat task.wait()if workspace:FindFirstChild('ChickenBoss')then local ab,ac=workspace.
ChickenBoss:GetBoundingBox()local ad=ab.Position+Vector3.new(0,ac.Y/2+18,0)if ad then game:GetService('Players').
LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(ad,ab.Position)game:GetService('ReplicatedStorage'):
WaitForChild('Remotes'):WaitForChild('Egg'):WaitForChild('GloveSwing'):FireServer()game:GetService('ReplicatedStorage'):
WaitForChild('Remotes'):WaitForChild('Egg'):WaitForChild('GloveHit'):FireServer(workspace:WaitForChild('ChickenBoss'):
WaitForChild('Body_model'))end end until workspace:FindFirstChild('RewardGlove')end CreateFreezeBV({Remove=true})
Notification('Ok, Very done',5)end)elseif game.PlaceId==93981091811742 then Window:ChangeTitle(
'Map Cultivate Glove \u{1f9d8}')Tabs={Tab=Window:AddTab('Main',B.Main),['UI Settings']=Window:AddTab('UI Settings',B.
Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Main')aa:AddButton('Get Badge',function()if game:GetService('Players').
LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then game:GetService('ReplicatedStorage'):WaitForChild('Remotes'
):WaitForChild('Lotus2Complete'):FireServer()if game:GetService('Players').LocalPlayer.PlayerGui:FindFirstChild('Akari')
then game:GetService('Players').LocalPlayer.PlayerGui.Akari:Destroy()end game:GetService('ReplicatedStorage'):
WaitForChild('Remotes'):WaitForChild('Minigames'):WaitForChild('Complete'):FireServer()wait(0.5)for ab,ac in pairs(
workspace:GetChildren())do if ac:IsA('Folder')and ac.Name:find('Lotus')and ac:FindFirstChild('Lotus')and ac.Lotus:
FindFirstChild('Primary')and ac.Lotus.Primary:FindFirstChild('ClickDetector')then for ad,ae in pairs(ac.Lotus:
GetChildren())do if ae:IsA('BasePart')and not ae.Name:find('Primary')and ae.Transparency<1 then game:GetService(
'Players').LocalPlayer.Character.HumanoidRootPart.CFrame=ac.Lotus.Primary.CFrame*CFrame.new(0,5,0)if fireclickdetector
then fireclickdetector(ac.Lotus.Primary.ClickDetector)end repeat task.wait()until ae.Transparency>=1 break end end end
end end end)elseif game.PlaceId==77283826005207 then Window:ChangeTitle('Map Opera \u{2b55}')Tabs={Tab=Window:AddTab(
'Main',B.Main),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Main')aa:
AddButton('Get Badge',function()local ab=workspace:FindFirstChild('Map')local ac=ab and ab:FindFirstChild('Lobby')local 
function firetouch(ad)if game:GetService('Players').LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then game:
GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame=ad.CFrame*CFrame.new(0,5,0)if firetouchinterest then
firetouchinterest(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart,ad,0)firetouchinterest(game:
GetService('Players').LocalPlayer.Character.HumanoidRootPart,ad,1)end end end local function fireclick(ad,ae)if game:
GetService('Players').LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then game:GetService('Players').
LocalPlayer.Character.HumanoidRootPart.CFrame=ae.CFrame*CFrame.new(0,5,0)end if fireclickdetector then
fireclickdetector(ad)end end local function AutoComplete(ad)if ac and ac:FindFirstChild('Portal'..ad)and ac['Portal'..ad
]:FindFirstChild('Part'):FindFirstChild('TouchInterest')then firetouch(ac['Portal'..ad].Part)repeat task.wait()until ab
and ab:FindFirstChild('Challenge'..ad)wait(0.5)if ab:FindFirstChild('Challenge'..ad)and ab['Challenge'..ad]:
FindFirstChild('RedButton')then fireclick(ab['Challenge'..ad].RedButton.Button:FindFirstChild('ClickDetector'),ab[
'Challenge'..ad].RedButton.Button.Sphere)end repeat task.wait()until not ab:FindFirstChild('Challenge'..ad)and not ac[
'Portal'..ad].Part:FindFirstChild('TouchInterest')end end if game:GetService('Players').LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')then AutoComplete(1)wait(0.5)AutoComplete(2)wait(0.5)AutoComplete(3)wait(0.5)if ac and
ac:FindFirstChild('EndPortal')then local ad=not ac['Portal1'].Part:FindFirstChild('TouchInterest')local ae=not ac[
'Portal2'].Part:FindFirstChild('TouchInterest')local af=not ac['Portal3'].Part:FindFirstChild('TouchInterest')local ag=
ac:FindFirstChild('EndPortal'):FindFirstChild('Portal')if ad and ae and af and ag then firetouch(ag)end end end end)
elseif game.PlaceId==125845699717230 then Window:ChangeTitle('Map Doors \u{1f6aa}')Tabs={Tab=Window:AddTab('Main',B.Main
),['UI Settings']=Window:AddTab('UI Settings',B.Settings)}local aa=Tabs.Tab:AddLeftGroupbox('Main')aa:AddButton(
'Get Badge',function()if game:GetService('Players').LocalPlayer.Character:FindFirstChild('HumanoidRootPart')then local
ab={}while task.wait()do if workspace:FindFirstChild('Hallways')then for ac,ad in pairs(workspace.Hallways:GetChildren()
)do local ae=ad:FindFirstChild('Doors')if ae then for af,ag in pairs(ae:GetChildren())do if ag:IsA('Model')and tonumber(
ag.Name)then if ab[ag]then continue end local ah=ag:FindFirstChild('Hitbox')local ai=ah and ah:FindFirstChild(
'ClickDetector')if ah then repeat task.wait()if fireclickdetector then fireclickdetector(ai)end game:GetService(
'Players').LocalPlayer.Character.HumanoidRootPart.CFrame=ah.CFrame*CFrame.new(0,0,-5)until ag:GetAttribute('Open')ab[ag]
=true end end end end end end end end end)end if Window and Tabs then local aa=Tabs['UI Settings']:AddLeftGroupbox(
'Menu')local ab=Tabs['UI Settings']:AddRightGroupbox('Info')aa:AddDropdown('NotifySide',{Text='Notification Side',Values
={'Left','Right'},Default='Right',Multi=false,Callback=function(ac)c.NotifySide=ac end})_G.ChooseNotify='Obsidian'aa:
AddDropdown('NotifyChoose',{Text='Notification Choose',Values={'Obsidian','Roblox'},Default='',Multi=false,Callback=
function(ac)_G.ChooseNotify=ac end})_G.BackpackV2=true aa:AddToggle('Backpack v2',{Text='Backpack v2',Default=true,
Callback=function(ac)_G.BackpackV2=ac end})_G.GloveDrop=false aa:AddToggle('Glove Drop',{Text='Glove Drop Unequipped',
Default=false,Callback=function(ac)_G.GloveDrop=ac end})_G.NotificationSound=true aa:AddToggle('NotifySound',{Text=
'Notification Sound',Default=true,Callback=function(ac)_G.NotificationSound=ac end})aa:AddSlider('Volume Notification',{
Text='Volume Notification',Default=2,Min=2,Max=10,Rounding=1,Compact=true,Callback=function(ac)_G.VolumeTime=ac end})aa:
AddSlider('Time Notification',{Text='Time Notification',Default=5,Min=1,Max=25,Rounding=0,Compact=false,Callback=
function(ac)_G.TimeNotify=ac end})aa:AddToggle('KeybindMenuOpen',{Default=false,Text='Open Keybind Menu',Callback=
function(ac)c.KeybindFrame.Visible=ac end})aa:AddToggle('ShowCustomCursor',{Text='Custom Cursor',Default=true,Callback=
function(ac)c.ShowCustomCursor=ac end})aa:AddToggle('ExecuteOnTeleport',{Default=true,Text='Execute On Teleport'})aa:
AddDropdown('DPIDropdown',{Values={'50%','75%','80%','85%','100%','115%','125%','150%','175%','200%'},Default='100%',
Text='DPI Scale',Callback=function(ac)ac=ac:gsub('%%','')local ad=tonumber(ac)c:SetDPIScale(ad)end})aa:AddSlider(
'UICornerSlider',{Text='Corner Radius',Default=c.CornerRadius,Min=0,Max=20,Rounding=0,Callback=function(ac)Window:
SetCornerRadius(ac)end})aa:AddDivider()aa:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind',{Default='RightShift',NoUI=
true,Text='Menu keybind'})aa:AddButton('Unload',function()c:Unload()end)ab:AddLabel('Counter [ '..game:GetService(
'LocalizationService'):GetCountryRegionForPlayerAsync(game.Players.LocalPlayer)..' ]',true)ab:AddLabel('Executor [ '..((
ExecutorSupport and ExecutorSupport.Name)or'Unknown')..' ]',true)ab:AddLabel('Support [ '..((ExecutorSupport and
ExecutorSupport.Summary)or'Unknown')..' ]',true)ab:AddLabel('Job Id [ '..game.JobId..' ]',true)ab:AddDivider()ab:
AddButton('Copy JobId',function()local ac=setclipboard or toclipboard if ac then ac(tostring(game.JobId))c:Notify(
'Copied Success')else c:Notify(tostring(game.JobId),10)end end)ab:AddInput('Join Job',{Default='Nah',Numeric=false,Text=
'Join Job',Placeholder='UserJobId',Callback=function(ac)_G.JobIdJoin=ac end})ab:AddButton('Join JobId',function()game:
GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,_G.JobIdJoin,game.Players.LocalPlayer)end)ab:
AddButton('Copy Join JobId',function()local ac=setclipboard or toclipboard if ac then ac(
[[game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, "]]..game.JobId..
'", game.Players.LocalPlayer)')c:Notify('Copied Success')else c:Notify(tostring(game.JobId),10)end end)c.ToggleKeybind=f
.MenuKeybind d:SetLibrary(c)e:SetLibrary(c)e:IgnoreThemeSettings()e:BuildConfigSection(Tabs['UI Settings'])d:ApplyToTab(
Tabs['UI Settings'])e:LoadAutoloadConfig()end c:OnUnload(function()_G.BackpackV2=false _G.BackpackV2Loop=false _G.
GloveDropUnEquipped=false if _G.ConnectFun then for aa,ab in pairs(_G.ConnectFun)do ab:Disconnect()end _G.ConnectFun=nil
end local aa=game.CoreGui if aa:FindFirstChild('Gui Track')then aa:FindFirstChild('Gui Track'):Destroy()end if aa:
FindFirstChild('Gui Button Script')then aa:FindFirstChild('Gui Button Script'):Destroy()end if aa:FindFirstChild(
'Keybind Script')then aa:FindFirstChild('Keybind Script'):Destroy()end if aa:FindFirstChild('ClickButton')then aa:
FindFirstChild('ClickButton'):Destroy()end if getgenv().HookNamecallInstalled then getgenv().HookDisabled=true end if
game:GetService('CoreGui').RobloxGui.Backpack:FindFirstChild('Hotbar')then game:GetService('CoreGui').RobloxGui.Backpack
.Hotbar.Position=_G.Backpack['Old']['Hotbar']end if game:GetService('CoreGui').RobloxGui.Backpack:FindFirstChild(
'Inventory')then game:GetService('CoreGui').RobloxGui.Backpack.Inventory.Position=_G.Backpack['Old']['Inventory']end for
ab,ac in pairs(game:GetService('CoreGui').RobloxGui.Backpack.Hotbar:GetChildren())do if ac:IsA('TextButton')and ac:
FindFirstChild('Number')then ac.Number.Position=_G.Backpack['Old']['Backpack Number'][ac.Name]end end if game:
GetService('CoreGui').RobloxGui.Backpack.Hotbar:FindFirstChild('UIListLayout')then game:GetService('CoreGui').RobloxGui.
Backpack.Hotbar:FindFirstChild('UIListLayout'):Destroy()end for ab,ac in pairs(game:GetService('CoreGui').RobloxGui.
Backpack.Hotbar:GetChildren())do if ac:IsA('TextButton')then if ac:FindFirstChild('Equipped')then ac.Equipped.Visible=
true end if ac:FindFirstChild('SelectionObjectClipper')then ac.SelectionObjectClipper.Visible=false end if ac:
FindFirstChild('UICorner')then ac:FindFirstChild('UICorner'):Destroy()end end end for ab,ac in pairs(game:GetService(
'CoreGui').RobloxGui.Backpack.Inventory.ScrollingFrame.UIGridFrame:GetChildren())do if ac:IsA('TextButton')then if ac:
FindFirstChild('Equipped')then ac.Equipped.Visible=true end if ac:FindFirstChild('SelectionObjectClipper')then ac.
SelectionObjectClipper.Visible=false end if ac:FindFirstChild('UICorner')then ac:FindFirstChild('UICorner'):Destroy()end
end end for ab,ac in pairs(game:GetService('CoreGui').RobloxGui.Backpack.Inventory:GetChildren())do if ac.Name=='Search'
then if ac:FindFirstChild('UICorner')then ac:FindFirstChild('UICorner'):Destroy()end if ac:FindFirstChild('X')and ac['X'
]:FindFirstChild('UICorner')then ac['X']:FindFirstChild('UICorner'):Destroy()end end end if game:GetService('CoreGui').
RobloxGui.Backpack:FindFirstChild('Inventory')and game:GetService('CoreGui').RobloxGui.Backpack.Inventory:
FindFirstChild('UICorner')then game:GetService('CoreGui').RobloxGui.Backpack.Inventory:FindFirstChild('UICorner'):
Destroy()end _G.Backpack=nil gloveHits=nil if AutoSetInfoServer then AutoSetInfoServer:Disconnect()AutoSetInfoServer=nil
end end)local aa=game:GetService('TweenService')local function triggerUnequipEffect()if not savedHandle or not
savedGlove then return end local ab=Create('Model',{Name='GloveDrop',Parent=workspace})local ac=savedHandle:Clone()local
ad=savedGlove:Clone()ac.Parent=ab ad.Parent=ab ac.CanCollide=true ad.CanCollide=true ac.Anchored=false ad.Anchored=false
if ac then for ae,af in pairs(ac:GetDescendants())do if af:IsA('Weld')or af:IsA('ManualWeld')or af:IsA('WeldConstraint')
then af:Destroy()end end end if ad then for ae,af in pairs(ad:GetDescendants())do if af:IsA('Weld')or af:IsA(
'ManualWeld')or af:IsA('WeldConstraint')then af:Destroy()end if af:IsA('Script')or af:IsA('LocalScript')then af:Destroy(
)end if af:IsA('BasePart')then af.CanCollide=true end end if ad:FindFirstChild('RopeConstraint')then if ac and ac:
FindFirstChildOfClass('Attachment')then ad.RopeConstraint.Attachment1=ac:FindFirstChildOfClass('Attachment')end end end
local ae=game.Players.LocalPlayer.Character local af=ae and ae:FindFirstChild('RightHand')local ag=af and af.CFrame if
ag then ac.CFrame=ag*CFrame.new(0,-2,0)local ah=Vector3.new(0,ac.Size.Y+(ac.Size.Y/2),0)ad.CFrame=ac.CFrame*CFrame.new(-
ah)*CFrame.Angles(0,0,math.rad(50))end ac.Velocity=Vector3.new(0,0,-5)ac.RotVelocity=Vector3.new(0,0,-12)task.delay(1,
function()if ac and ad then local ah=TweenInfo.new(0.5,Enum.EasingStyle.Linear)aa:Create(ac,ah,{Transparency=1,Size=
Vector3.new(0,0,0)}):Play()aa:Create(ad,ah,{Transparency=1,Size=Vector3.new(0,0,0)}):Play()for ai,aj in pairs(ad:
GetDescendants())do if aj:IsA('BasePart')then aa:Create(aj,ah,{Transparency=1,Size=Vector3.new(0,0,0)}):Play()end end if
ad and ad:FindFirstChild('RopeConstraint')then aa:Create(ad.RopeConstraint,ah,{Thickness=0}):Play()end end end)task.
delay(1.5,function()if ab then ab:Destroy()end end)end task.spawn(function()_G.GloveDropUnEquipped=true while _G.
GloveDropUnEquipped and task.wait()do if _G.GloveDrop then local ab=game.Players.LocalPlayer.Character if not ab then
continue end local ac=ab:FindFirstChildOfClass('Tool')if ac and not isEquipped then local ad=ac:FindFirstChild('Handle')
local ae=ac:FindFirstChild('Glove')if ad and ae then isEquipped=true savedHandle=ad savedGlove=ae end elseif not ac and
isEquipped then isEquipped=false triggerUnequipEffect()savedHandle=nil savedGlove=nil end end end end)_G.BackpackV2Loop=
true if _G.Backpack==nil then _G.Backpack={['Old']={['Hotbar']=game:GetService('CoreGui').RobloxGui.Backpack.Hotbar.
Position,['Inventory']=game:GetService('CoreGui').RobloxGui.Backpack.Inventory.Position,['Backpack Number']={}},['New']=
{['Hotbar']=(game:GetService('CoreGui').RobloxGui.Backpack.Hotbar.Position+UDim2.new(0,0,0,-10)),['Inventory']=(game:
GetService('CoreGui').RobloxGui.Backpack.Inventory.Position+UDim2.new(0,0,0,-10)),['Backpack Number']={}}}wait()for ab,
ac in pairs(game:GetService('CoreGui').RobloxGui.Backpack.Hotbar:GetChildren())do if ac:IsA('TextButton')then _G.
Backpack['Old']['Backpack Number'][ac.Name]=ac.Position _G.Backpack['New']['Backpack Number'][ac.Name]=UDim2.new(0,3,0,3
)end end end spawn(function()while _G.BackpackV2Loop do if game:GetService('CoreGui').RobloxGui.Backpack:FindFirstChild(
'Hotbar')then game:GetService('CoreGui').RobloxGui.Backpack.Hotbar.Position=(_G.BackpackV2==true and(_G.Backpack['New'][
'Hotbar'])or(_G.Backpack['Old']['Hotbar']))end if game:GetService('CoreGui').RobloxGui.Backpack:FindFirstChild(
'Inventory')then game:GetService('CoreGui').RobloxGui.Backpack.Inventory.Position=(_G.BackpackV2==true and(_G.Backpack[
'New']['Inventory'])or(_G.Backpack['Old']['Inventory']))end for ab,ac in pairs(game:GetService('CoreGui').RobloxGui.
Backpack.Hotbar:GetChildren())do if ac:IsA('TextButton')and ac:FindFirstChild('Number')then ac.Number.Position=(_G.
BackpackV2==true and(_G.Backpack['New']['Backpack Number'][ac.Name])or(_G.Backpack['Old']['Backpack Number'][ac.Name]))
end end if _G.BackpackV2==true then if game:GetService('CoreGui').RobloxGui.Backpack:FindFirstChild('Inventory').Visible
==false then if game:GetService('CoreGui').RobloxGui.Backpack:FindFirstChild('Hotbar'):FindFirstChild('UIListLayout')==
nil then local ab=Instance.new('UIListLayout')ab.HorizontalAlignment=Enum.HorizontalAlignment.Left ab.Padding=UDim.new(0
,5)ab.FillDirection=Enum.FillDirection.Horizontal ab.HorizontalAlignment=Enum.HorizontalAlignment.Center ab.
VerticalAlignment=Enum.VerticalAlignment.Center ab.Parent=game:GetService('CoreGui').RobloxGui.Backpack.Hotbar end else
if game:GetService('CoreGui').RobloxGui.Backpack.Hotbar:FindFirstChild('UIListLayout')then game:GetService('CoreGui').
RobloxGui.Backpack.Hotbar:FindFirstChild('UIListLayout'):Destroy()end end for ab,ac in pairs(game:GetService('CoreGui').
RobloxGui.Backpack.Hotbar:GetChildren())do if ac:IsA('TextButton')then if ac:FindFirstChild('Equipped')then ac.Equipped.
Visible=false end if ac:FindFirstChild('Equipped')and ac:FindFirstChild('SelectionObjectClipper')then ac.
SelectionObjectClipper.Visible=true else ac.SelectionObjectClipper.Visible=false end if ac:FindFirstChild('UICorner')==
nil then local ad=Instance.new('UICorner',ac)ad.CornerRadius=UDim.new(0,10)end end end for ab,ac in pairs(game:
GetService('CoreGui').RobloxGui.Backpack.Inventory.ScrollingFrame.UIGridFrame:GetChildren())do if ac:IsA('TextButton')
then if ac:FindFirstChild('Equipped')then ac.Equipped.Visible=false end if ac:FindFirstChild('Equipped')and ac:
FindFirstChild('SelectionObjectClipper')then ac.SelectionObjectClipper.Visible=true else ac.SelectionObjectClipper.
Visible=false end if ac:FindFirstChild('UICorner')==nil then local ad=Instance.new('UICorner',ac)ad.CornerRadius=UDim.
new(0,10)end end end for ab,ac in pairs(game:GetService('CoreGui').RobloxGui.Backpack.Inventory:GetChildren())do if ac.
Name=='Search'then if ac:FindFirstChild('UICorner')==nil then local ad=Instance.new('UICorner',ac)ad.CornerRadius=UDim.
new(0,10)end if ac:FindFirstChild('X')and ac['X']:FindFirstChild('UICorner')==nil then local ad=Instance.new('UICorner',
ac['X'])ad.CornerRadius=UDim.new(0,10)end end end if game:GetService('CoreGui').RobloxGui.Backpack:FindFirstChild(
'Inventory')and game:GetService('CoreGui').RobloxGui.Backpack.Inventory:FindFirstChild('UICorner')==nil then local ab=
Instance.new('UICorner',game:GetService('CoreGui').RobloxGui.Backpack.Inventory)ab.CornerRadius=UDim.new(0,10)end elseif
_G.BackpackV2==false then if game:GetService('CoreGui').RobloxGui.Backpack.Hotbar:FindFirstChild('UIListLayout')then
game:GetService('CoreGui').RobloxGui.Backpack.Hotbar:FindFirstChild('UIListLayout'):Destroy()end for ab,ac in pairs(game
:GetService('CoreGui').RobloxGui.Backpack.Hotbar:GetChildren())do if ac:IsA('TextButton')then if ac:FindFirstChild(
'Equipped')then ac.Equipped.Visible=true end if ac:FindFirstChild('SelectionObjectClipper')then ac.
SelectionObjectClipper.Visible=false end if ac:FindFirstChild('UICorner')then ac:FindFirstChild('UICorner'):Destroy()end
end end for ab,ac in pairs(game:GetService('CoreGui').RobloxGui.Backpack.Inventory.ScrollingFrame.UIGridFrame:
GetChildren())do if ac:IsA('TextButton')then if ac:FindFirstChild('Equipped')then ac.Equipped.Visible=true end if ac:
FindFirstChild('SelectionObjectClipper')then ac.SelectionObjectClipper.Visible=false end if ac:FindFirstChild('UICorner'
)then ac:FindFirstChild('UICorner'):Destroy()end end end for ab,ac in pairs(game:GetService('CoreGui').RobloxGui.
Backpack.Inventory:GetChildren())do if ac.Name=='Search'then if ac:FindFirstChild('UICorner')then ac:FindFirstChild(
'UICorner'):Destroy()end if ac:FindFirstChild('X')and ac['X']:FindFirstChild('UICorner')then ac['X']:FindFirstChild(
'UICorner'):Destroy()end end end if game:GetService('CoreGui').RobloxGui.Backpack:FindFirstChild('Inventory')and game:
GetService('CoreGui').RobloxGui.Backpack.Inventory:FindFirstChild('UICorner')then game:GetService('CoreGui').RobloxGui.
Backpack.Inventory:FindFirstChild('UICorner'):Destroy()end end task.wait()end end)local function BackpackV2(ab)ab.
MouseEnter:Connect(function()if _G.BackpackV2==true then local ac=Instance.new('Sound',workspace)ac.SoundId=
'rbxassetid://10066942189'ac.Volume=2 ac.PlaybackSpeed=1 ac.PlayOnRemove=true ac:Destroy()game:GetService('TweenService'
):Create(ab,TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(0,70,0,70)}):Play()end end
)ab.MouseLeave:Connect(function()if _G.BackpackV2==true then local ac=Instance.new('Sound',workspace)ac.SoundId=
'rbxassetid://10066942189'ac.Volume=2 ac.PlaybackSpeed=1 ac.PlayOnRemove=true ac:Destroy()game:GetService('TweenService'
):Create(ab,TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(0,60,0,60)}):Play()end end
)ab.MouseButton1Click:Connect(function()if _G.BackpackV2==true then local ac=Instance.new('Sound',workspace)ac.SoundId=
'rbxassetid://10066936758'ac.Volume=2 ac.PlaybackSpeed=1 ac.PlayOnRemove=true ac:Destroy()local ad=game:GetService(
'TweenService'):Create(ab,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(0,70,0,70)})
ad:Play()ad.Completed:Connect(function()game:GetService('TweenService'):Create(ab,TweenInfo.new(0.1,Enum.EasingStyle.
Quad,Enum.EasingDirection.Out),{Size=UDim2.new(0,60,0,60)}):Play()end)end end)end for ab,ac in pairs(game:GetService(
'CoreGui').RobloxGui.Backpack.Hotbar:GetChildren())do if ac:IsA('TextButton')then BackpackV2(ac)end end table.insert(_G.
ConnectFun,game:GetService('CoreGui').RobloxGui.Backpack.Inventory.ScrollingFrame.UIGridFrame.ChildAdded:Connect(
function(ab)if ab:IsA('TextButton')then BackpackV2(ab)end end))function Unfreeze()if game.Players.LocalPlayer.Character:
FindFirstChild('HumanoidRootPart')and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(
'FreezeBVButton')then game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild('FreezeBVButton'):Destroy()end
end function ClickFreezeBV(ab)local ac,ad=pcall(ab)if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild('AntiRagBV1')==nil then local
ae=Instance.new('BodyVelocity')ae.Name='FreezeBVButton'ae.Parent=game.Players.LocalPlayer.Character.HumanoidRootPart ae.
MaxForce=Vector3.new(100000,100000,100000)ae.Velocity=Vector3.new(0,0,0)end local ae=game:GetService('CoreGui')if not ae
:FindFirstChild('ClickDestroyFreezeBV')then local af=Instance.new('ScreenGui',ae)af.Name='ClickDestroyFreezeBV'Freeze=
true TextButton=Instance.new('TextButton')TextButton.Name='Remote Freeze'TextButton.Size=UDim2.new(0.12,0,0.12,0)
TextButton.Position=UDim2.new(0.42,0,0.7,0)TextButton.BackgroundColor3=Color3.new(255,255,255)TextButton.Text='Unfreeze'
TextButton.TextScaled=true TextButton.BackgroundTransparency=0 TextButton.TextColor3=Color3.new(0,0,0)TextButton.Font=
Enum.Font.Code TextButton.Draggable=true TextButton.Parent=af Instance.new('UICorner').Parent=TextButton TextButton.
MouseButton1Click:Connect(function()Freeze=not Freeze if not Freeze then if TextButton then TextButton.Text='Freeze'end
Unfreeze()else if TextButton then TextButton.Text='Unfreeze'end if game.Players.LocalPlayer.Character:FindFirstChild(
'HumanoidRootPart')and game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild('FreezeBVButton')==nil then
local ag=Instance.new('BodyVelocity')ag.Name='FreezeBVButton'ag.Parent=game.Players.LocalPlayer.Character.
HumanoidRootPart ag.MaxForce=Vector3.new(100000,100000,100000)ag.Velocity=Vector3.new(0,0,0)end pcall(ab)end end)local
ag=Instance.new('UIStroke')ag.Color=Color3.new(0,0,0)ag.Thickness=2.2 ag.ApplyStrokeMode='Border'ag.Parent=TextButton
end end table.insert(_G.ConnectFun,game.Players.LocalPlayer.OnTeleport:Connect(function()if not g['ExecuteOnTeleport'].
Value or getgenv().LoadingExe then return end if CheckExecutorSupport and not CheckExecutorSupport('queue_on_teleport',
'ExecuteOnTeleport')then return end getgenv().LoadingExe=true local ab=queueonteleport or queue_on_teleport if ab then
ab(
'\r\n    if not game:IsLoaded() then\r\n        game.Loaded:Wait()\r\n    end\r\n    repeat wait() until game.Players.LocalPlayer\r\n    loadstring(game:HttpGet("https://github.com/tanhoangviet/Slap-Battles-Script/releases/latest/download/main.luau"))()\r\n'
)end end))local function safe(ab)return game.ReplicatedStorage:FindFirstChild(ab)or nil end gloveHits={['All']=safe(
'GeneralHit'),['Default']=safe('b'),['Extended']=safe('b'),['ZZZZZZZ']=safe('ZZZZZZZHit'),['Brick']=safe('BrickHit'),[
'Snow']=safe('SnowHit'),['Pull']=safe('PullHit'),['Flash']=safe('FlashHit'),['Spring']=safe('springhit'),['Swapper']=
safe('HitSwapper'),['Bull']=safe('BullHit'),['Dice']=safe('DiceHit'),['Ghost']=safe('GhostHit'),['Stun']=safe('HtStun'),
['Za Hando']=safe('zhramt'),['Fort']=safe('Fort'),['Magnet']=safe('MagnetHIT'),['Pusher']=safe('PusherHit'),['Anchor']=
safe('hitAnchor'),['Space']=safe('HtSpace'),['Boomerang']=safe('BoomerangH'),['Speedrun']=safe('Speedrunhit'),['Mail']=
safe('MailHit'),['Golden']=safe('GoldenHit'),['MR']=safe('MisterHit'),['Reaper']=safe('ReaperHit'),['Replica']=safe(
'ReplicaHit'),['Defense']=safe('DefenseHit'),['Killstreak']=safe('KSHit'),['Reverse']=safe('ReverseHit'),['Shukuchi']=
safe('ShukuchiHit'),['Duelist']=safe('DuelistHit'),['woah']=safe('woahHit'),['Ice']=safe('IceHit'),['Adios']=safe(
'hitAdios'),['Blocked']=safe('BlockedHit'),['Engineer']=safe('engiehit'),['Rocky']=safe('RockyHit'),['Conveyor']=safe(
'ConvHit'),['STOP']=safe('STOP'),['Phantom']=safe('PhantomHit'),['Wormhole']=safe('WormHit'),['Acrobat']=safe('AcHit'),[
'Plague']=safe('PlagueHit'),['[REDACTED]']=safe('ReHit'),['bus']=safe('hitbus'),['Phase']=safe('PhaseH'),['Warp']=safe(
'WarpHt'),['Bomb']=safe('BombHit'),['Bubble']=safe('BubbleHit'),['Jet']=safe('JetHit'),['Shard']=safe('ShardHIT'),[
'potato']=safe('potatohit'),['CULT']=safe('CULTHit'),['bob']=safe('bobhit'),['Buddies']=safe('buddiesHIT'),['Spy']=safe(
'SpyHit'),['Detonator']=safe('DetonatorHit'),['Rage']=safe('GRRRR'),['Trap']=safe('traphi'),['Orbit']=safe('Orbihit'),[
'Hybrid']=safe('HybridCLAP'),['Slapple']=safe('SlappleHit'),['Disarm']=safe('DisarmH'),['Dominance']=safe('DominanceHit'
),['Link']=safe('LinkHit'),['Rojo']=safe('RojoHit'),['rob']=safe('robhit'),['Rhythm']=safe('rhythmhit'),['Nightmare']=
safe('nightmarehit'),['Hitman']=safe('HitmanHit'),['Thor']=safe('ThorHit'),['Retro']=safe('RetroHit'),['Cloud']=safe(
'CloudHit'),['Null']=safe('NullHit'),['spin']=safe('spinhit'),['Pylon']=safe('PylonHit'),['Leafblower']=safe(
'LeafblowerHit'),['Poltergeist']=safe('UTGHit'),['Clock']=safe('GeneralHit'),['\u{110}\u{1ed3}ng h\u{1ed3}']=safe(
'GeneralHit'),['Untitled Tag Glove']=safe('UTGHit'),['Kinetic']=safe('HtStun'),['Recall']=safe('HtStun'),['Balloony']=
safe('HtStun'),['Sparky']=safe('HtStun'),['Boogie']=safe('HtStun'),['Stun']=safe('HtStun'),['Coil']=safe('HtStun'),[
'Diamond']=safe('DiamondHit'),['Megarock']=safe('DiamondHit'),['Moon']=safe('CelestialHit'),['Jupiter']=safe(
'CelestialHit'),['Mitten']=safe('MittenHit'),['Hallow Jack']=safe('HallowHIT'),['OVERKILL']=safe('Overkillhit'),[
'The Flex']=safe('FlexHit'),['Custom']=safe('CustomHit'),["God's Hand"]=safe('Godshand'),['Error']=safe('Errorhit')}h:
SetCurrentStep(5)h:SetMessage('Done!')h:SetDescription('Ready.')task.wait(0.25)h:Continue()getgenv().LoadingScriptSlap=
false if MobileOn then c:SetDPIScale(85)end local ab,ac=pcall(function()getgenv().WindowNah=Window loadstring(game:
HttpGet([[https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/File-Script/CreditJoin.Lua]]))()
end)
