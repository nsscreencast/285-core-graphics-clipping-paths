import UIKit
import PlaygroundSupport

final class CustomView: UIView {
	override func draw(_ rect: CGRect) {
		guard let context = UIGraphicsGetCurrentContext() else { return }

		let colorSpace = CGColorSpaceCreateDeviceRGB()
		let color = CGColor(colorSpace: colorSpace, components: [1, 1, 1, 1])!

		context.setFillColor(color)
		context.fill(bounds)

//		context.saveGState()
//
//		let path = CGMutablePath()
//		path.addEllipse(in: CGRect(x: 25, y: 25, width: 100, height: 100))
//		context.addPath(path)
//		context.clip()
//
//		context.setFillColor(CGColor(colorSpace: colorSpace, components: [1, 0, 0, 1])!)
//		context.fill(CGRect(x: 50, y: 50, width: 100, height: 100))
//
//		context.restoreGState()
//
//		context.setFillColor(CGColor(colorSpace: colorSpace, components: [0, 0, 1, 1])!)
//		context.fill(CGRect(x: 150, y: 150, width: 100, height: 100))

		let path = CGMutablePath()
		path.addRoundedRect(in: CGRect(x: 50, y: 50, width: 100, height: 100), cornerWidth: 10, cornerHeight: 10)
		context.addPath(path)
		context.clip()

		let colors = [
			CGColor(colorSpace: colorSpace, components: [1, 0, 0, 1])!,
			CGColor(colorSpace: colorSpace, components: [1, 0, 1, 1])!
		] as CFArray

		let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: nil)!

		context.drawLinearGradient(gradient, start: CGPoint(x: 50, y: 50), end: CGPoint(x: 50, y: 150), options: [.drawsAfterEndLocation, .drawsBeforeStartLocation])






	}
}

PlaygroundPage.current.liveView = CustomView(frame: CGRect(x: 0, y: 0, width: 320, height: 320))
