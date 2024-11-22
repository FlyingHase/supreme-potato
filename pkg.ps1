

Invoke-WebRequest -URI "https://steamuserimages-a.akamaihd.net/ugc/775111879946189452/6ECB32C6C2CE523D739E208D64146F2DDC4870EC/?imw=512&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false" -OutFile "C:\Users\Public\Documents\IMG_test.jpg"

$imgPath="C:\Users\Public\Documents\IMG_test.jpg"
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32 {   
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@
add-type $code 
[Win32.Wallpaper]::SetWallpaper($imgPath)
