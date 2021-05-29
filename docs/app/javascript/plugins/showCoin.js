function showCoin() {
  let tradingview = document.querySelector(`#tradingview`);
  if (tradingview) {
  new TradingView.widget(
    {
    "width": "100%",
    "height": 500,
    "symbol": `BINANCE:${JSON.parse(tradingview.dataset.coin)}USDT`,
    "interval": "D",
    "timezone": "Etc/UTC",
    "theme": "light",
    "style": "1",
    "locale": "fr",
    "toolbar_bg": "#f1f3f6",
    "enable_publishing": false,
    "allow_symbol_change": true,
    "studies": [
      "BB@tv-basicstudies",
    ],
    "container_id": "tradingview"
  }
    );
}
}

export {showCoin}
