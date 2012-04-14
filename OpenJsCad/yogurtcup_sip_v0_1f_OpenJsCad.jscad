function main() {

    var resolution = 24; // increase to get smoother corners (will get slow!)
    var thickness = 3;
    
    var lip = CSG.cylinder({
        start: [0, 55, 0],
        end: [0, 58, 0],
        radius: 42.5,
        resolution: resolution
    });
    
    var basket = CSG.cylinder({
        start: [0, 0, 0],
        end: [0, 58, 0],
        radiusStart: 27.5,
        radiusEnd: 30,
        resolution: 16
    });
    
    var basket_void = CSG.cylinder({
        start: [0, 3, 0],
        end: [0, 58, 0],
        radiusStart: (27.5-thickness),
        radiusEnd: (30-thickness),
        resolution: 16
    });
    
    var basket_drain = CSG.cylinder({
        start: [0, 0, 0],
        end: [0, 3, 0],
        radius: 3,
        resolution: 16
    });
    
  var result = basket;
  result = result.union(lip);
  result = result.subtract(basket_void);
  result = result.subtract(basket_drain);
  return result;

}