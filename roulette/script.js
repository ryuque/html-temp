let clickcontrol = false;
let roulette; // rouletteオブジェクトを保存する変数を追加

function showRoulette() {
    var rouletteElement = document.querySelector('.roulette');
    rouletteElement.style.visibility = 'visible';
}

// 関数: 要素を非表示にする
function hideRoulette() {
    var rouletteElement = document.querySelector('.roulette');
    rouletteElement.style.visibility = 'hidden';
}
hideRoulette();

// JavaScriptで動的に中身を設定する関数
function setRandomContent(data) {
    // 各div要素にランダムな値を設定
    let k=0;
    for (let i = 0; i < 20; i++) {
        let currentElement = data[k];// 0から19のランダムな数
        let elementDiv = document.getElementById('slot' + i);
        if (currentElement == null) {
            k=0;
            currentElement = data[k]
            elementDiv.innerHTML = `
            <img src="${currentElement.imageURL}" alt="Image for ${currentElement.number}">
            <p class="itemname">${currentElement.itemname}</p>`;

        }else{
            elementDiv.innerHTML = `
            <img src="${currentElement.imageURL}" alt="Image for ${currentElement.number}">
            <p class="itemname">${currentElement.itemname}</p>`;
            k++;
        }
        elementDiv.setAttribute('data-rarity', currentElement.rarity);
    }
}

function close(itemname, amount) {
    $.post('https://roulette/close',JSON.stringify({itemname: itemname, amount: amount}));
    hideRoulette();
}


window.addEventListener('message', function(event){
    let v = event.data;
    if(v.type == "gacha"){
        clickcontrol = true;
        setRandomContent(v.data);
        showRoulette();
        let itemname = v.getitem;
        let amount = v.amount;
        let options = {
            spacing: 10,
        
            acceleration: 300, 
        
            fps: 60, 
        
            audio: "libs/vanillaRoulette/click.wav",
        
            selector: ":scope > *",

            stopCallback : function(){
                close(itemname, amount);
                console.log(`Selected prize index is: ${itemname}`);
            },
            startCallback : null
        };
        
        // 2回目以降は既存のrouletteオブジェクトを再利用
        if (!roulette) {
            roulette = new Roulette(".roulette", options);
        }
        $(".roulette").click(function (e) {
            if(clickcontrol == true){
                clickcontrol = false;
                e.preventDefault();
                roulette.rotateTo(v.hitnum, { time: 5, random: true });

            }
        });
    }
})





