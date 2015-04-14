within IDEAS.Fluid.Production.Interfaces;
partial model PartialHeatPump_save

  //Extensions
  extends PartialHeater_save(heatSource(heatPumpWaterWater=true));

  Modelica.Fluid.Interfaces.FluidPort_a port_a1(
                                               redeclare package Medium =
        Medium) "Fluid inlet"
    annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1(
                                               redeclare package Medium =
        Medium) "Fluid outlet"
    annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  FixedResistances.Pipe_HeatPort evaporator(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=dp_nominal,
    m=mWater,
    energyDynamics=energyDynamics,
    massDynamics=massDynamics,
    p_start=p_start,
    T_start=T_start,
    X_start=X_start,
    C_start=C_start,
    C_nominal=C_nominal,
    dynamicBalance=dynamicBalance,
    from_dp=from_dp,
    linearizeFlowResistance=linearizeFlowResistance,
    deltaM=deltaM,
    homotopyInitialization=homotopyInitialization,
    mSenFac=if mWater > Modelica.Constants.eps then 1 + cDry/
        Medium.specificHeatCapacityCp(Medium.setState_pTX(
        Medium.p_default,
        Medium.T_default,
        Medium.X_default))/mWater else 0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,0})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalLosses1(
                                                                          G=
        UALoss) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-54,-70})));
equation
  connect(heatSource.heatPortE, evaporator.heatPort) annotation (Line(
      points={{-10,26},{-56,26},{-56,0},{-60,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalLosses1.port_b, heatPort) annotation (Line(
      points={{-54,-80},{-54,-100},{-30,-100}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(evaporator.heatPort, thermalLosses1.port_a) annotation (Line(
      points={{-60,-1.77636e-015},{-56,-1.77636e-015},{-56,-60},{-54,-60}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Line(
          points={{-100,60},{-20,60},{-40,40},{-20,20},{-40,0},{-20,-20},{-40,
              -40}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{100,60},{20,60},{40,40},{20,20},{40,0},{20,-20},{40,-40}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{-20,0},{0,0}},
          color={191,0,0},
          thickness=0.5),
        Polygon(
          points={{0,-10},{0,10},{20,0},{0,-10}},
          lineColor={191,0,0},
          fillColor={191,0,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-40,-40},{-20,-60},{-92,-60}},
          color={0,0,255},
          smooth=Smooth.None),
        Line(
          points={{40,-40},{20,-60},{90,-60}},
          color={0,0,255},
          smooth=Smooth.None)}));
end PartialHeatPump_save;
