$names = @("item1", "item2", "item3", "item4", "item5") # This is where I take a manipulated csv of our customer list and generate over 300 customer containers for use in services like Microsoft 365 tenant direct logins
$colors = @("blue", "turquoise", "green", "yellow", "orange", "red", "pink", "purple")
$icons = @("fingerprint", "briefcase", "dollar", "cart", "vacation", "gift", "food", "fruit", "pet", "tree", "chill", "circle", "fence")

# Create a combined list of color-icon pairs
$combinedList = @()
for ($i=0; $i -lt $colors.Count; $i++) {
    for ($j=0; $j -lt $icons.Count; $j++) {
        $combinedList += @{colors = $colors[$i]; icons = $icons[$j]}
    }
}

# Assign a color-icon pair to each name
$json = @()
$i = 0
foreach ($item_name in $names)
{
    $json += @{name = $item_name; color = $combinedList[$i % $combinedList.Count].colors; icon = $combinedList[$i % $combinedList.Count].icons}
    $i++
}

# Save the JSON file
$json | ConvertTo-Json | Set-Content -Path "output.json"
