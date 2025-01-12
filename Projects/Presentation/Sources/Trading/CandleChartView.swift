import UIKit


struct Candle {
  let open: CGFloat
  let high: CGFloat
  let low: CGFloat
  let close: CGFloat
}

class CandleChartView: UIView {
    var candles: [Candle] = [
      Candle(open: 100, high: 110, low: 95, close: 105),
      Candle(open: 105, high: 115, low: 100, close: 110),
      Candle(open: 110, high: 120, low: 108, close: 115),
      Candle(open: 115, high: 125, low: 110, close: 105),
      Candle(open: 105, high: 112, low: 102, close: 108),
      Candle(open: 100, high: 110, low: 95, close: 105),
      Candle(open: 105, high: 115, low: 100, close: 110),
      Candle(open: 110, high: 120, low: 108, close: 115),
      Candle(open: 115, high: 125, low: 110, close: 105),
      Candle(open: 105, high: 112, low: 102, close: 108),
      Candle(open: 100, high: 110, low: 95, close: 105),
      Candle(open: 105, high: 115, low: 100, close: 110),
      Candle(open: 110, high: 120, low: 108, close: 115),
      Candle(open: 115, high: 125, low: 110, close: 105),
      Candle(open: 105, high: 112, low: 102, close: 108),
      Candle(open: 100, high: 110, low: 95, close: 105),
      Candle(open: 105, high: 115, low: 100, close: 110),
      Candle(open: 110, high: 120, low: 108, close: 115),
      Candle(open: 115, high: 125, low: 110, close: 105),
      Candle(open: 105, high: 112, low: 102, close: 108),
    ] // Array of candlestick data // Array of candlestick data
    private var highlightedCandleIndex: Int? = nil // Index of the currently highlighted candle

    private let tooltipLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGestureRecognizer()
        addSubview(tooltipLabel)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGestureRecognizer()
        addSubview(tooltipLabel)
    }

    private func setupGestureRecognizer() {
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        addGestureRecognizer(gestureRecognizer)
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawCandles(in: rect)
        if let index = highlightedCandleIndex {
            highlightCandle(at: index, in: rect)
        }
    }

    private func drawCandles(in rect: CGRect) {
        guard !candles.isEmpty else { return }

        let chartWidth = rect.width
        let chartHeight = rect.height
        let maxPrice = candles.map { $0.high }.max() ?? 1
        let minPrice = candles.map { $0.low }.min() ?? 0
        let priceRange = maxPrice - minPrice
        let candleWidth = chartWidth / CGFloat(candles.count)

        for (index, candle) in candles.enumerated() {
            let x = CGFloat(index) * candleWidth
            let openY = chartHeight - ((candle.open - minPrice) / priceRange * chartHeight)
            let closeY = chartHeight - ((candle.close - minPrice) / priceRange * chartHeight)
            let highY = chartHeight - ((candle.high - minPrice) / priceRange * chartHeight)
            let lowY = chartHeight - ((candle.low - minPrice) / priceRange * chartHeight)

            let isBullish = candle.close > candle.open
            let color = isBullish ? UIColor.systemGreen : UIColor.systemRed
            color.setFill()
            color.setStroke()

            // Draw wick
            let wickPath = UIBezierPath()
            wickPath.move(to: CGPoint(x: x + candleWidth / 2, y: highY))
            wickPath.addLine(to: CGPoint(x: x + candleWidth / 2, y: lowY))
            wickPath.lineWidth = 2
            wickPath.stroke()

            // Draw rounded body
            let bodyRect = CGRect(
                x: x + candleWidth * 0.25,
                y: min(openY, closeY),
                width: candleWidth * 0.5,
                height: abs(openY - closeY)
            )
            let roundedBodyPath = UIBezierPath(roundedRect: bodyRect, cornerRadius: 4)
            roundedBodyPath.fill()
        }
    }

    private func highlightCandle(at index: Int, in rect: CGRect) {
        guard index < candles.count else { return }

        let chartWidth = rect.width
        let chartHeight = rect.height
        let candleWidth = chartWidth / CGFloat(candles.count)
        let candle = candles[index]
        let maxPrice = candles.map { $0.high }.max() ?? 1
        let minPrice = candles.map { $0.low }.min() ?? 0
        let priceRange = maxPrice - minPrice

        let x = CGFloat(index) * candleWidth
        let highY = chartHeight - ((candle.high - minPrice) / priceRange * chartHeight)

        // Update tooltip label
        tooltipLabel.text = """
        Open: \(candle.open)
        High: \(candle.high)
        Low: \(candle.low)
        Close: \(candle.close)
        """
        let labelWidth: CGFloat = 100
        let labelHeight: CGFloat = 60
        tooltipLabel.frame = CGRect(
            x: max(0, min(x + candleWidth / 2 - labelWidth / 2, rect.width - labelWidth)),
            y: max(0, highY - labelHeight - 10),
            width: labelWidth,
            height: labelHeight
        )
        tooltipLabel.isHidden = false
    }

    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: self)
        let chartWidth = bounds.width
        let candleWidth = chartWidth / CGFloat(candles.count)

        let index = Int(location.x / candleWidth)
        if index >= 0 && index < candles.count {
            highlightedCandleIndex = index
            setNeedsDisplay()
        }

        if gesture.state == .ended {
            tooltipLabel.isHidden = true
            highlightedCandleIndex = nil
            setNeedsDisplay()
        }
    }
}
