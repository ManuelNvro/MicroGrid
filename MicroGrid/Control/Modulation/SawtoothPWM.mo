within MicroGrid.Control.Modulation;

model SawtoothPWM "Generate the firing signal for switch"
  extends Modelica.Electrical.PowerConverters.Icons.Control;
  parameter Modelica.SIunits.Frequency f = 1000 "Switching frequency";
  Modelica.Blocks.Interfaces.BooleanOutput fire "Firing PWM signal" annotation(Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {60, 110})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = 1, uMin = 0) annotation(Placement(transformation(extent = {{-38, -10}, {-18, 10}})));
  Modelica.Blocks.Logical.Less greaterEqual annotation(Placement(transformation(extent = {{-10, 10}, {10, -10}}, origin = {44, -8})));
  Modelica.Blocks.Discrete.ZeroOrderHold zeroOrderHold(final startTime = 0, final samplePeriod = 1 / f, ySample.start = 0, ySample.fixed = true) annotation(Placement(transformation(extent = {{-8, -10}, {12, 10}})));
  Modelica.Blocks.Sources.SawTooth sawtooth(final period = 1 / f, final amplitude = 1, final nperiod = -1, final offset = 0, final startTime = 0) annotation(Placement(transformation(origin = {-28, -50}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.SignalBus InputDutyRatio annotation(Placement(transformation(extent = {{-124, -22}, {-64, 20}})));
  Interfaces.Control2Real control2Real annotation(Placement(transformation(extent = {{-68, -10}, {-48, 10}})));
equation
  connect(limiter.y, zeroOrderHold.u) annotation(Line(points = {{-17, 0}, {-10, 0}}, color = {0, 0, 127}));
  connect(zeroOrderHold.y, greaterEqual.u2) annotation(Line(points = {{13, 0}, {32, 0}}, color = {0, 0, 127}));
  connect(sawtooth.y, greaterEqual.u1) annotation(Line(points = {{-17, -50}, {22, -50}, {22, -8}, {32, -8}}, color = {0, 0, 127}));
  connect(greaterEqual.y, fire) annotation(Line(points = {{55, -8}, {60, -8}, {60, 110}}, color = {255, 0, 255}));
  connect(InputDutyRatio, control2Real.InputSignal) annotation(Line(points = {{-94, -1}, {-82, -1}, {-82, 0}, {-67.4, 0}}, color = {0, 128, 0}, thickness = 0.5));
  connect(limiter.u, control2Real.OutputReal) annotation(Line(points = {{-40, 0}, {-48, 0}}, color = {0, 0, 127}));
  annotation(Icon(graphics = {Line(points = {{-80, 40}, {80, 40}}, color = {255, 0, 0}), Line(points = {{-52, -140}}, color = {0, 0, 255}), Line(points = {{-80.1563, 54.922}, {-50, 70}, {-50, 30}, {30, 70}, {30, 30}, {79.531, 54.766}}, color = {0, 0, 255}), Line(points = {{-50, 80}, {-50, -80}}, color = {0, 0, 255}, pattern = LinePattern.Dash), Line(points = {{-30, 80}, {-30, -80}}, color = {0, 0, 255}, pattern = LinePattern.Dash), Line(points = {{30, 80}, {30, -80}}, color = {0, 0, 255}, pattern = LinePattern.Dash), Line(points = {{50, 80}, {50, -80}}, color = {0, 0, 255}, pattern = LinePattern.Dash), Line(points = {{-80, -80}, {-50, -80}, {-50, -40}, {-30, -40}, {-30, -80}, {30, -80}, {30, -40}, {50, -40}, {50, -80}, {80, -80}}, color = {255, 0, 255})}));
end SawtoothPWM;
