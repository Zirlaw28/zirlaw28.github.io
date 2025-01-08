# Fonction pour obtenir le temps d'inactivité en secondes
function Get-IdleTime {
    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;

    public class IdleTime {
        [DllImport("user32.dll")]
        static extern bool GetLastInputInfo(ref LASTINPUTINFO plii);

        [StructLayout(LayoutKind.Sequential)]
        struct LASTINPUTINFO {
            public uint cbSize;
            public uint dwTime;
        }

        public static uint GetIdleTime() {
            LASTINPUTINFO lastInput = new LASTINPUTINFO();
            lastInput.cbSize = (uint)Marshal.SizeOf(lastInput);
            GetLastInputInfo(ref lastInput);
            return ((uint)Environment.TickCount - lastInput.dwTime) / 1000;
        }
    }
"@

    return [IdleTime]::GetIdleTime()
}

# Boucle principale
while ($true) {
    $idleTime = Get-IdleTime
    
    # Si l'inactivité dépasse 2 minutes (120 secondes)
    if ($idleTime -ge 120) {
        # Ouvrir la page web spécifiée
        Start-Process "https://zirlaw28.github.io/"
        
        # Attendre 5 minutes avant de vérifier à nouveau
        Start-Sleep -Seconds 300
    }
    
    # Attendre 5 secondes avant la prochaine vérification
    Start-Sleep -Seconds 5
}
