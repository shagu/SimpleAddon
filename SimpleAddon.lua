-- This addon can be used to run macros on login.
-- At first, a frame is generated with is the most
-- basic part of an addon. Second, the SlashCommand function
-- is defined as "local" to not be polluting the global space
-- (pollution in global space can cause other addons to misbehave)
local frame = CreateFrame("Button", "SimpleAddon", UIParent)
local SlashCommand

-- The code inside the OnEvent function, will run whenever
-- a registered event is fired.
frame:SetScript("OnEvent",function()
  -- Your macro code goes into here. Make sure to
  -- remove "/run" or "/script" from the beginning of your lines.
  -- Here's an example:
  --   /run GameTooltip:SetScale(1.7)
  -- would become:
  GameTooltip:SetScale(1.7)

  -- If you need to a specific addon command to trigger,
  -- things get more complicated. First of all, you should
  -- put your command into the SlashCommand brackets.
  -- (If you want to dig deeper, have a look at the "SlashCommand"
  -- function itself at the bottom)
  --
  -- Here's an example:
  --   /db rares
  -- Would become:
  SlashCommand("/db rares")
end)

-- We now set the frame to run after each loading screen.
-- This event is called "PLAYER_ENTERING_WORLD".
-- If you want, you can add more events to the frame,
-- just copy the line and replace the event with the one
-- you'd like to have. A list of evens can be found here:
-- https://github.com/shagu/wow-vanilla-api/blob/master/events.md
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

-- Congratulations, you're done! If you want to learn more, read below
-- to understand what the SlashCommand function does in detail :)

-------------------------------------------------------------------------

-- This is the SlashCommand function. It takes a text and lets it run
-- through the chat input editbox, same as you would have typed it in
-- the chat.

SlashCommand = function(text)
  -- Write your "text" into the editbox
  ChatFrameEditBox:SetText(text)

  -- Simulate a "Enter" key press on it
  ChatEdit_SendText(ChatFrameEditBox)
end
