(() => {
    const FLAG = "ee:d1:80:d3:0f:9d:12:be:5a:51:f7:de:e4:00:f9:66:63:f3:22:45:a7:e3:61:2d:2e:8d:7a:ee:0e:23:95:be:56:97:2e:4c:02:60:70:76:49:b0:f8:f1:53:6c:96:0a:21:8d:47:57:f8:c7:1a:0d:9b:35:68:d3:14:96:c9:39:de:6c:09:24:37:de:0a:f2:43:30";
    const S_BOX = [5, 93, 198, 126, 167, 62, 153, 163, 137, 21, 96, 193, 241, 32, 76, 139, 185, 213, 136, 176, 214, 172, 109, 240, 220, 147, 180, 30, 81, 254, 110, 38, 229, 209, 216, 114, 188, 218, 119, 194, 237, 83, 181, 144, 152, 120, 250, 189, 41, 35, 217, 183, 151, 192, 55, 99, 
        131, 133, 199, 3, 197, 113, 9, 34, 233, 255, 169, 211, 13, 68, 130, 206, 97, 178, 31, 187, 69, 75, 6, 171, 166, 226, 125, 230, 16, 36, 224, 53, 33, 195, 10, 27, 17, 175, 140, 236, 50, 196, 24, 12, 85, 26, 89, 186, 160, 161, 251, 165, 190, 249, 123, 116, 29, 43, 48, 117, 191, 142, 210, 1, 44, 23, 248, 67, 0, 103, 246, 135, 247, 92, 22, 202, 244, 150, 56, 57, 25, 154, 205, 158, 111, 225, 168, 107, 174, 145, 90, 143, 39, 227, 58, 71, 14, 88, 200, 11, 122, 203, 235, 64, 40, 146, 19, 141, 54, 231, 252, 47, 239, 100, 157, 124, 222, 74, 201, 108, 102, 234, 91, 
        78, 28, 15, 221, 155, 159, 18, 112, 215, 148, 79, 243, 46, 223, 4, 173, 177, 20, 149, 61, 51, 127, 42, 115, 104, 170, 121, 128, 204, 60, 66, 253, 84, 63, 2, 77, 134, 179, 105, 73, 162, 82, 37, 132, 52, 106, 101, 65, 228, 245, 238, 86, 59, 164, 7, 8, 45, 80, 72, 208, 212, 156, 207, 95, 87, 49, 219, 129, 94, 232, 242, 182, 98, 118, 138, 184, 70];
    const MAGIC = 32;

    function* getFlagArr() {
        let arr = FLAG.split(':');
        for (const e of arr)
            yield e;
    }

    function* getString() { // Add confusion (no, not the cryptographic property)
        let i = 0;
        for (const b of getFlagArr())
            yield (String.fromCharCode(S_BOX[(S_BOX[parseInt(b, 16)] + i++ - MAGIC) & 0xFF]));
    }

    document.getElementById("submit_flag").onclick = (ev) => {
        let resultObject = document.getElementById("result");
        let inp = document.getElementById("flag").value?.trim();
        if (!inp) {
            document.getElementById("result").textContent = "Please enter a flag!";
            return;
        }

        let chars = [...inp];
        let correct = true;
        for (const c of getString()) {
            if (c !== chars.shift()) {
                correct = false;
            }
        }

        let flagDisplay = document.getElementById("flagDisplay");
        if (correct) {
            resultObject.textContent = "Correct!";
            flagDisplay.hidden = false;
            flagDisplay.textContent = inp;
        }
        else {
            resultObject.textContent = "That's not the right flag...";
            flagDisplay.hidden = true;
        }
        // Restart animation
        resultObject.style.animation = "none";
        resultObject.offsetHeight;
        resultObject.style.animation = "";
    };
})();
