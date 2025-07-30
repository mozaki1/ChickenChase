local splash = script.Parent  -- startScreen

-- Ensure splash is enabled at start
splash.Enabled = true

-- Wait 3 seconds, then hide and destroy the splash screen
task.wait(3)
splash.Enabled = false
splash:Destroy()

-- Note: AccessModifierType cannot be set from a script at runtime.
-- If you want to restrict editing/running this script, use Studio's permissions or Team Create settings.

