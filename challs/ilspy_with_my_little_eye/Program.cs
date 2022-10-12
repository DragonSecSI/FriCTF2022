using System;
using System.Text;
using System.Security.Cryptography;

string iv = "t0ju/tgPQ3n2g56QY9xWaw==";
string key = "rRWl2x6LVsCIvvXd17zdRyYigj1TmQ/kICwGm1spYuc=";
string flagEnc = "lB9Y3bF6f4T/gQ2eHfCZaxlRMSuDO+8FOcjI4TdvQf9KutxRzzVOfuQuyn4KglO/kBaGEsnacNGMlNskQP1oGQ==";

Console.WriteLine("What is the flag?");
var inp = Console.ReadLine();

if (string.IsNullOrWhiteSpace(inp))
{
    Console.WriteLine("Please give me a string!");
    return;
}

var bytes = Encoding.UTF8.GetBytes(inp);
using var aes = Aes.Create();
aes.IV = Convert.FromBase64String(iv);
aes.Key = Convert.FromBase64String(key);
bytes = aes.EncryptCbc(bytes, aes.IV);

if (Convert.FromBase64String(flagEnc).SequenceEqual(bytes)) 
    Console.WriteLine("You got it!");
else
    Console.WriteLine("Try again...");
