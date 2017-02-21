; PixelPoint represents a point and the color of the pixel at the point
class PixelPoint
{
  point := ""
  colorValue := ""

  __new() {
    this.point := ""
    this.colorValue := ""
  }

  getPoint() {
    return this.point
  }

  getColorValue() {
    return this.colorValue
  }
}
