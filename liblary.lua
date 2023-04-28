local Library = {}

function Library:CreateLib(title)
    local UI = {}
    
    -- Create the main UI frame
    local Frame = Instance.new("ScreenGui")
    Frame.Name = title
    Frame.Parent = game.CoreGui
    
    -- Create the title bar
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 30)
    TitleBar.Position = UDim2.new(0, 0, 0, 0)
    TitleBar.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    TitleBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TitleBar.BorderSizePixel = 1
    TitleBar.Parent = Frame
    
    -- Create the title label
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "Title"
    TitleLabel.Size = UDim2.new(1, 0, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextSize = 20
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TitleBar
    
    -- Create the main container frame
    local Container = Instance.new("Frame")
    Container.Name = "Container"
    Container.Size = UDim2.new(1, 0, 1, -30)
    Container.Position = UDim2.new(0, 0, 0, 30)
    Container.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Container.BorderSizePixel = 1
    Container.Parent = TitleBar
    
    -- Function to create a new tab
    function UI:NewTab(name)
        local Tab = {}
        
        -- Create the tab button
        local Button = Instance.new("TextButton")
        Button.Name = name
        Button.Size = UDim2.new(0, 100, 0, 30)
        Button.Position = UDim2.new(0, #Container:GetChildren() * 100, 0, 0)
        Button.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
        Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Button.BorderSizePixel = 1
        Button.Font = Enum.Font.SourceSansBold
        Button.Text = name
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 14
        Button.Parent = TitleBar
        
        -- Create the tab section container
        local SectionContainer = Instance.new("Frame")
        SectionContainer.Name = name
        SectionContainer.Size = UDim2.new(1, 0, 1, 0)
        SectionContainer.Position = UDim2.new(0, 0, 0, 0)
        SectionContainer.BackgroundTransparency = 1
        SectionContainer.Parent = Container
     -- Function to create a new section within the tab
function Tab:NewSection(sectionName)
    local Section = {}
    
    -- Create the section label
    local Label = Instance.new("TextLabel")
    Label.Name = sectionName
    Label.Size = UDim2.new(1, 0, 0, 30)
    Label.Position = UDim2.new(0, 0, 0, 0)
    Label.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Label.BorderSizePixel = 1
    Label.Font = Enum.Font.SourceSansBold
    Label.Text = sectionName
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 14
    Label.Parent = SectionContainer
    
    -- Create the section container
    local SectionFrame = Instance.new("Frame")
    SectionFrame.Name = sectionName
    SectionFrame.Size = UDim2.new(1, 0, 1, -30)
    SectionFrame.Position = UDim2.new(0, 0, 0, 30)
    SectionFrame.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
    SectionFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    SectionFrame.BorderSizePixel = 1
    SectionFrame.Parent = SectionContainer
    
    -- Function to create a new button within the section
    function Section:NewButton(name, info, callback)
        local Button = Instance.new("TextButton")
        Button.Name = name
        Button.Size = UDim2.new(1, -10, 0, 30)
        Button.Position = UDim2.new(0, 5, 0, #SectionFrame:GetChildren() * 35)
        Button.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
        Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Button.BorderSizePixel = 1
        Button.Font = Enum.Font.SourceSansBold
        Button.Text = name
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 14
        Button.Parent = SectionFrame
        
        -- Create the button info tooltip
        local Tooltip = Instance.new("TextLabel")
        Tooltip.Name = "Tooltip"
        Tooltip.Size = UDim2.new(1, -10, 0, 20)
        Tooltip.Position = UDim2.new(0, 5, 0, (#SectionFrame:GetChildren() - 1) * 35 + 30)
        Tooltip.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
        Tooltip.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Tooltip.BorderSizePixel = 1
        Tooltip.Font = Enum.Font.SourceSans
        Tooltip.Text = info
        Tooltip.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tooltip.TextSize = 14
        Tooltip.Visible = false
        Tooltip.Parent = SectionFrame
        
        -- Add tooltip functionality to the button
        Button.MouseEnter:Connect(function()
            Tooltip.Visible = true
        end)
        
        Button.MouseLeave:Connect(function()
            Tooltip.Visible = false
        end)
        
        -- Add the button callback
        Button.MouseButton1Click:Connect(callback)
    end
    
    return Section
end

return UI
end

return Library
