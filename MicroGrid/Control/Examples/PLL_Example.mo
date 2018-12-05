within MicroGrid.Control.Examples;

model PLL_Example
  extends Modelica.Icons.Example;
  Electrical.Sources.threePhaseAC threePhaseAC1 annotation(Placement(visible = true, transformation(origin = {-60, -27.139}, extent = {{-17.139, -17.139}, {17.139, 17.139}}, rotation = -90)));
  Electrical.BasicComponents.ground ground1 annotation(Placement(visible = true, transformation(origin = {-60, -67.417}, extent = {{-12.583, -12.583}, {12.583, 12.583}}, rotation = 0)));
  Electrical.BasicComponents.resistor resistor1 annotation(Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-12.388, -12.388}, {12.388, 12.388}}, rotation = -270)));
  Electrical.BasicComponents.resistor resistor2 annotation(Placement(visible = true, transformation(origin = {-60, 60}, extent = {{-12.388, -12.388}, {12.388, 12.388}}, rotation = -270)));
  Electrical.BasicComponents.resistor resistor3 annotation(Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-12.388, -12.388}, {12.388, 12.388}}, rotation = -270)));
  Electrical.BasicComponents.ground ground2 annotation(Placement(visible = true, transformation(origin = {-60, 92.583}, extent = {{-12.583, -12.583}, {12.583, 12.583}}, rotation = -540)));
  Sensors.voltageSensor voltageSensor1 annotation(Placement(visible = true, transformation(origin = {-20, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Sensors.voltageSensor voltageSensor2 annotation(Placement(visible = true, transformation(origin = {0, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Sensors.voltageSensor voltageSensor3 annotation(Placement(visible = true, transformation(origin = {20, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  PhaseLockedLoop.DSOGI_PLL dSOGI_PLL1 annotation(Placement(visible = true, transformation(origin = {57.58, -35.577}, extent = {{17.58, -17.58}, {-17.58, 17.58}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue V_D annotation(Placement(visible = true, transformation(origin = {8.035, -67.174}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue V_Q annotation(Placement(visible = true, transformation(origin = {7.73, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Interfaces.Control2Real control2Real1 annotation(Placement(visible = true, transformation(origin = {37.824, -67.089}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Interfaces.Control2Real control2Real2 annotation(Placement(visible = true, transformation(origin = {37.817, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(resistor1.n, ground2.p) annotation(Line(visible = true, origin = {-65, 75.978}, points = {{-5, -6.067}, {-5, 1.022}, {5, 1.022}, {5, 4.022}}, color = {0, 0, 255}));
  connect(resistor3.n, ground2.p) annotation(Line(visible = true, origin = {-55, 75.978}, points = {{5, -6.067}, {5, 1.022}, {-5, 1.022}, {-5, 4.022}}, color = {0, 0, 255}));
  connect(resistor2.n, ground2.p) annotation(Line(visible = true, origin = {-60, 74.955}, points = {{0, -5.045}, {-0, 5.045}}, color = {0, 0, 255}));
  connect(resistor2.p, threePhaseAC1.p2) annotation(Line(visible = true, origin = {-60, 19.702}, points = {{0, 30.387}, {-0, -30.387}}, color = {0, 0, 255}));
  connect(resistor3.p, threePhaseAC1.p1) annotation(Line(visible = true, origin = {-49.858, 6.887}, points = {{-0.142, 43.203}, {-0.142, -12.815}, {0.142, -12.815}, {0.142, -17.572}}, color = {0, 0, 255}));
  connect(ground1.p, threePhaseAC1.gnd) annotation(Line(visible = true, origin = {-60, -49.213}, points = {{0, -5.621}, {0, 5.621}}, color = {0, 0, 255}));
  connect(threePhaseAC1.gnd, voltageSensor1.n) annotation(Line(visible = true, origin = {-40, -40.073}, points = {{-20, -3.52}, {-20, -8.276}, {20, -8.276}, {20, 20.073}}, color = {0, 0, 255}));
  connect(threePhaseAC1.gnd, voltageSensor2.n) annotation(Line(visible = true, origin = {-30, -35.073}, points = {{-30, -8.52}, {-30, -13.276}, {30, -13.276}, {30, 35.073}}, color = {0, 0, 255}));
  connect(threePhaseAC1.gnd, voltageSensor3.n) annotation(Line(visible = true, origin = {-20, -30.073}, points = {{-40, -13.52}, {-40, -18.276}, {40, -18.276}, {40, 50.073}}, color = {0, 0, 255}));
  connect(voltageSensor1.p, threePhaseAC1.p1) annotation(Line(visible = true, origin = {-34.858, -1.171}, points = {{14.858, 1.171}, {14.858, 4.171}, {-14.858, 4.171}, {-14.858, -9.514}}, color = {0, 0, 255}));
  connect(voltageSensor2.p, threePhaseAC1.p2) annotation(Line(visible = true, origin = {-30, 13.829}, points = {{30, 6.171}, {30, 9.171}, {-30, 9.171}, {-30, -24.514}}, color = {0, 0, 255}));
  connect(voltageSensor1.voltSignal, dSOGI_PLL1.vA) annotation(Line(visible = true, origin = {27.358, -13.026}, points = {{-38.008, 3.026}, {19.004, 3.026}, {19.004, -6.053}}, color = {255, 0, 0}));
  connect(voltageSensor2.voltSignal, dSOGI_PLL1.vB) annotation(Line(visible = true, origin = {41.894, 0.275}, points = {{-32.544, 9.725}, {16.272, 9.725}, {16.272, -19.45}}, color = {255, 0, 0}));
  connect(voltageSensor3.voltSignal, dSOGI_PLL1.vC) annotation(Line(visible = true, origin = {56.374, 13.642}, points = {{-27.024, 16.358}, {13.512, 16.358}, {13.512, -32.717}}, color = {255, 0, 0}));
  connect(threePhaseAC1.p3, resistor1.p) annotation(Line(visible = true, origin = {-70.142, 32.157}, points = {{-0.142, -42.843}, {-0.142, 12.455}, {0.142, 12.455}, {0.142, 17.933}}, color = {0, 0, 255}));
  connect(voltageSensor3.p, threePhaseAC1.p3) annotation(Line(visible = true, origin = {-25.142, 28.829}, points = {{45.142, 11.171}, {45.142, 14.171}, {-45.142, 14.171}, {-45.142, -39.514}}, color = {0, 0, 255}));
  connect(V_D.numberPort, control2Real1.OutputReal) annotation(Line(visible = true, origin = {24.252, -67.132}, points = {{-4.716, -0.042}, {0.572, -0.042}, {0.572, 0.042}, {3.572, 0.042}}, color = {1, 37, 163}));
  connect(V_Q.numberPort, control2Real2.OutputReal) annotation(Line(visible = true, origin = {23.524, -80}, points = {{-4.293, 0}, {4.293, 0}}, color = {1, 37, 163}));
  connect(control2Real1.InputSignal, dSOGI_PLL1.vD) annotation(Line(visible = true, origin = {50.512, -62.065}, points = {{-3.588, -5.124}, {1.794, -5.124}, {1.794, 10.248}}, color = {0, 128, 0}));
  connect(control2Real2.InputSignal, dSOGI_PLL1.vQ) annotation(Line(visible = true, origin = {58.155, -70.645}, points = {{-11.238, -9.455}, {5.619, -9.455}, {5.619, 18.911}}, color = {0, 128, 0}));
  annotation(experiment(StopTime = 1.0));
end PLL_Example;
