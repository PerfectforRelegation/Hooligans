import UIKit
import SwiftUI
import Domain

class StockChartView: UIView {
  let stockPrices: [CGFloat] = [
      100, 98.34, 98.08, 96.35, 98.52, 94.43, 90.38, 91.05, 91.27, 90.99,
      95.63, 95.88, 97.77, 95.47, 94.15, 90.26, 89.11, 87.42, 89.28, 86.83,
      82.39, 82.05, 77.08, 80.41, 81.46, 81.15, 81.03, 78.89, 76.31, 77.86,
      75.11, 74.00, 72.44, 72.10, 70.70, 75.30, 72.47, 72.64, 74.81, 74.00,
      71.68, 69.26, 70.95, 66.91, 66.91, 63.52, 66.77, 68.88, 71.37, 76.18
  ]

  override func draw(_ rect: CGRect) {
    super.draw(rect)
    drawStockChart(in: rect)
  }

  private func drawStockChart(in rect: CGRect) {
    guard stockPrices.count > 1 else { return }

    let path = UIBezierPath()
    let chartWidth = rect.width
    let chartHeight = rect.height
    let maxPrice = stockPrices.max() ?? 1000
    let minPrice = stockPrices.min() ?? 0

    let xStep = chartWidth / CGFloat(stockPrices.count)
    let yScale = chartHeight / CGFloat(maxPrice - minPrice + 50)

    let firstPoint = CGPoint(x:0, y: chartHeight - (stockPrices[0] - minPrice) * yScale)
    path.move(to: firstPoint)

    for (index, price) in stockPrices.enumerated() {
      let x = CGFloat(index) * xStep
      let y = chartHeight - (price - minPrice) * yScale
      path.addLine(to: CGPoint(x: x, y: y))
    }

    UIColor.systemBlue.setStroke()
    path.lineWidth = 2.0
    path.stroke()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      PreviewContainer {
        StockChartView()
      }
    }
}


struct PreviewContainer<T: UIView>: UIViewRepresentable {
    let view: T

    init(_ viewBuilder: @escaping () -> T) {

        view = viewBuilder()
    }

    // MARK: - UIViewRepresentable
    func makeUIView(context: Context) -> T {
        return view
    }

    func updateUIView(_ view: T, context: Context) {

        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
