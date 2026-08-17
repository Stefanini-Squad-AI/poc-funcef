{ This translator module component translates the series of TChart }

unit IvChaMod;

interface

uses
  Classes, IvMulti;

type
  TIvChartModule = class(TIvModule)
  public
    function TranslateComponent(
      translator: TIvTranslator;
      component: TComponent): Boolean; override;
  end;

implementation

uses
  IvCommon, IvDictio,
  TeEngine;

function TIvChartModule.TranslateComponent(
  translator: TIvTranslator;
  component: TComponent): Boolean;
var
  i: Integer;
  series: TChartSeries;
begin
  if (component is TChartSeries) then
  begin
    { Translates the series labels }

    if translator.Targets.IsPropertyInTargets(component.ClassName, 'Caption') then
    begin
      series := TChartSeries(component);
      for i := 0 to series.Count - 1 do
      begin
        series.XLabel[i] := translator.DoTranslateContextString(
          series,
          component.Name,
          'Caption',
          series.XLabel[i]);
      end;
    end;
    Result := True;
  end
  else
    Result := False;
end;

begin
  Modules.Add(TIvChartModule.Create(nil));
end.
