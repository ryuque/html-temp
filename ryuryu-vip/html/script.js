function updateCoinAmount(amount) {
    // 0の部分を変更
    document.getElementById('coin-amount').innerText = amount + ' COIN';
}

function updatePlayerName(name) {
    // 0の部分を変更
    document.getElementById('player-name').innerText = 'プレイヤー名: ' + name;
}

function updateCitizenId(id) {
    // 0の部分を変更
    document.getElementById('citizen-id').innerText = '市民ID: ' + id;
}

function updateVipState(state) {
    // 0の部分を変更
    document.getElementById('vip-state').innerText = 'VIP STATE: ' + state;
}

function toggleInput(e) {
    var inputContainer = document.getElementById("input-container");
    var overlay = document.getElementById("overlay");

    if (inputContainer.style.display === "" || inputContainer.style.display === "none") {
        inputContainer.style.display = "block";
        overlay.style.display = "block";
    } else {
        inputContainer.style.display = "none";
        overlay.style.display = "none";
    }
}
  
function confirmCharge() {
    var coinInput = document.getElementById("coin-input").value;
    alert("コインをチャージしました。チャージ量: " + coinInput);
    toggleInput(); // クリック後に入力ボックスと確定ボタンを非表示にする
    // ここで他の処理を行うか、必要に応じて追加のコードを記述します。
}

// アイテムデータ
const itemsData = [
    { id: 'Item A', name: 'Item A', image: 'img/moaicoin.png', quantity: 5, coin: 5, description: 'aaaaaaa' },
    { id: 'Item B', name: 'Item B', image: 'img/moaicoin.png', quantity: 3, coin: 5, description: 'aaaaaaa' },
    // 他のアイテムデータを追加
];

// アイテム表示関数
function displayItems() {
    const itemsSection = document.getElementById('items');
    const itemsGoodsContainer = document.querySelector('.items-goods');

    itemsData.forEach(item => {
        const itemElement = document.createElement('div');
        itemElement.classList.add('item');

        const imageElement = document.createElement('img');
        imageElement.src = item.image;
        imageElement.alt = item.name;

        const nameElement = document.createElement('p');
        nameElement.classList.add('item-name');
        nameElement.textContent = item.name + ' x' + item.quantity;

        const purchaseMark = document.createElement('div');
        const purchaseText = document.createElement('p');
        purchaseMark.classList.add('purchase-button');
        purchaseText.classList.add('purchase-text');
        purchaseText.textContent = item.coin +'COIN';
        purchaseMark.appendChild(purchaseText);
        purchaseMark.addEventListener('click', () => togglepurchase(item));

        itemElement.appendChild(imageElement);
        itemElement.appendChild(nameElement);
        itemElement.appendChild(purchaseMark);

        itemsGoodsContainer.appendChild(itemElement);
    });
}

function togglepurchase(item){
    var purchasebox = document.getElementById("purchasebox");
    var overlay = document.getElementById("purchasebox-overlay");

    if (purchasebox.style.display === "" || purchasebox.style.display === "none") {
        var purchase_item_name = document.getElementById("purchase-item-name");
        var purchase_item_img = document.getElementById("purchase-item-img");
        var purchase_item_description = document.getElementById("purchase-item-description");
        var item_confirm = document.getElementById("item-confirm");

        purchase_item_name.textContent = item.name + ' x' + item.quantity;
        purchase_item_img.src = item.image;
        purchase_item_img.alt = item.id;
        purchase_item_description.textContent = item.description;
        item_confirm.textContent = item.coin + ' Coin';
        item_confirm.addEventListener('click', () => purchaseItem(item));        

        purchasebox.style.display = "block";
        overlay.style.display = "block";
    } else {
        purchasebox.style.display = "none";
        overlay.style.display = "none";
    }
} 

// 購入処理関数
function purchaseItem(itemId) {
    // ここに購入時の処理を追加（例: アイテムIDをサーバーに送信など）
    console.log(`Item with ID ${itemId.id} purchased.`);
    togglepurchase();

}

// アイテム表示
displayItems();


// JavaScriptでスクロールイベントを監視してヘッダーの透明度を変更する
document.addEventListener("DOMContentLoaded", function() {
    var header = document.querySelector("header");
    var lastScrollPosition = 0;

    window.addEventListener("scroll", function() {
        var currentScrollPosition = window.scrollY;

        if (currentScrollPosition > lastScrollPosition) {
            // 下にスクロールした場合
            header.style.opacity = 0;
        } else {
            // 上にスクロールした場合
            header.style.opacity = 1;
        }

        lastScrollPosition = currentScrollPosition;
    });
});


