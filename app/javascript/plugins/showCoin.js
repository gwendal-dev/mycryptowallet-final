function showCoin() {
  let tradingview = document.querySelector(`#tradingview`);
  if (tradingview) {
    if (JSON.parse(tradingview.dataset.coin) != 'USDT') {
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
          "allow_symbol_change": false,
          "hide_side_toolbar": false,
          "container_id": "tradingview"
        }
          );
    } else {
      new TradingView.widget(
          {
          "width": "100%",
          "height": 500,
          "symbol": `KRAKEN:${JSON.parse(tradingview.dataset.coin)}USD`,
          "interval": "D",
          "timezone": "Etc/UTC",
          "theme": "light",
          "style": "1",
          "locale": "fr",
          "toolbar_bg": "#f1f3f6",
          "enable_publishing": false,
          "allow_symbol_change": false,
          "hide_side_toolbar": false,
          "container_id": "tradingview"
        }
          );
      }
    }
}

export {showCoin}
