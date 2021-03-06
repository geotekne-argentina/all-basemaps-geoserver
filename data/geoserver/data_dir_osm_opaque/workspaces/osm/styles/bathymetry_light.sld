<?xml version="1.0" encoding="UTF-8"?><sld:StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:sld="http://www.opengis.net/sld" xmlns:gml="http://www.opengis.net/gml" xmlns:ogc="http://www.opengis.net/ogc" version="1.0.0">
  <sld:NamedLayer>
    <sld:Name>Default Styler</sld:Name>
    <sld:UserStyle>
      <sld:Name>Default Styler</sld:Name>
      <sld:FeatureTypeStyle>
        <sld:Rule>
          <sld:Title>bathymetry</sld:Title>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">
                <ogc:Function name="Interpolate">
                  <ogc:PropertyName>depth</ogc:PropertyName>
                  <ogc:Literal>0</ogc:Literal>
                  <ogc:Literal>#CAD2D3</ogc:Literal>
                  <ogc:Literal>10000</ogc:Literal>
                  <ogc:Function name="darken">
                    <ogc:Literal>#CAD2D3</ogc:Literal>
                    <ogc:Literal>30%</ogc:Literal>
                  </ogc:Function>
                  <ogc:Literal>color</ogc:Literal>
                </ogc:Function>
              </sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:VendorOption name="ruleEvaluation">first</sld:VendorOption>
        <sld:VendorOption name="sortBy">depth</sld:VendorOption>
      </sld:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</sld:StyledLayerDescriptor>

