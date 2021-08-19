-- This addon can be used to run macros on login.

-- At first, a frame is generated, which is the most
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

  -- If you want to trigger a specific addon command,
  -- you'll need to put your command into the SlashCommand brackets.
  -- Here's an example:
  --   /db rares
  -- Would become:
  SlashCommand("/db rares")

  -- That's all so far.
end)

-- We now set the frames function to run after each loading screen.
-- The event for this is called "PLAYER_ENTERING_WORLD".
-- If you want, you can add more events to the same frame,
-- just copy the line and replace the event with the one
-- you'd like to have. A list of evens can be found here:
-- https://github.com/shagu/wow-vanilla-api/blob/master/events.md
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

-- This is the SlashCommand function you used above.
-- It takes a text and lets it run through the chat input editbox,
-- same as you would have typed it in the chat.
SlashCommand = function(text)
  -- Write your "text" into the editbox
  ChatFrameEditBox:SetText(text)

  -- Simulate a "Enter" key press on it
  ChatEdit_SendText(ChatFrameEditBox)
end

-- You're done! Congratulations!
-- If you get any errors, the error message includes the
-- Filename and the line number where the error happened.
-- This helps you navigating to fix your mistake, if any.
