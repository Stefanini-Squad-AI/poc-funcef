unit fParamListaPresenca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, IvDictio,
  fParamReports_Padrao, ExtCtrls, CmParamReport, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, wwdbdatetimepicker, CMDateTimePicker, RListaPresenca, RListaPresenca2;

type
  TfrmParamListaPresenca = class(TfrmParamReports_Padrao)
    rgTipoRelatorio: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  public
    RptListaPresenca: TRptListaPresenca;
  end;

var
  frmParamListaPresenca: TfrmParamListaPresenca;

implementation

uses uSistema;

{$R *.DFM}

procedure TfrmParamListaPresenca.FormCreate(Sender: TObject);
begin
  inherited;
  RptListaPresenca := TRptListaPresenca.Create(Application);
  RptListaPresenca2 := TRptListaPresenca2.Create(Application);
end;

procedure TfrmParamListaPresenca.FormDestroy(Sender: TObject);
begin
  FreeAndNil(RptListaPresenca);
  FreeAndNil(RptListaPresenca2);
  inherited;
end;

procedure TfrmParamListaPresenca.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if rgTipoRelatorio.ItemIndex = 2 then
  begin
    RptListaPresenca.CrmRptCM.IdReports := 3837;
    RptListaPresenca.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
    RptListaPresenca.CrmRptCM.OrigemCM := 1;
    RptListaPresenca.CrmRptCM.IdModulo := Sistema.IdModulo;
    RptListaPresenca.CrmRptCM.IdUsuario := Sistema.IdUsuario;
    RptListaPresenca.CrmRptCM.Print;
  end
  else
  begin
    RptListaPresenca2.iOpcao := rgTipoRelatorio.ItemIndex;
    RptListaPresenca2.CrmRptCM.IdReports := 3837;
    RptListaPresenca2.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
    RptListaPresenca2.CrmRptCM.OrigemCM := 1;
    RptListaPresenca2.CrmRptCM.IdModulo := Sistema.IdModulo;
    RptListaPresenca2.CrmRptCM.IdUsuario := Sistema.IdUsuario;
    RptListaPresenca2.CrmRptCM.Print;
  end;
end;

end.
