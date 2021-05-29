function tradingview() {
  let i = 0;
  while (document.querySelector(`#tradingview${i += 1}`)) {
              let tradingview = document.querySelector(`#tradingview${i}`);
              new TradingView.MediumWidget(
                      {
                      "symbols": [
                        [
                          "Crypto",
                          `BINANCE:${JSON.parse(tradingview.dataset.coin)}USDT|12M`
                        ]
                      ],
                      "chartOnly": false,
                      "width": "100%",
                      "height": "100%",
                      "locale": "en",
                      "colorTheme": "light",
                      "gridLineColor": "#F0F3FA",
                      "trendLineColor": "#2196F3",
                      "fontColor": "#787B86",
                      "underLineColor": "#E3F2FD",
                      "isTransparent": false,
                      "autosize": true,
                      "container_id": `tradingview${i}`
                    }
                      );
            }
}

export {tradingview}
