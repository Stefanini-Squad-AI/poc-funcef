unit fParamFichaProc_ProcJud;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MontaSelect,
  fCustomParamFichaProc, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmParamFichaProc_ProcJud = class(TfrmCustomParamFichaProc)
    rgImprimirOBSObjeto: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamFichaProc_ProcJud: TfrmParamFichaProc_ProcJud;

implementation

{$R *.DFM}

procedure TfrmParamFichaProc_ProcJud.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA   IN (4,7)');
end;

procedure TfrmParamFichaProc_ProcJud.bbtnConfirmarClick(Sender: TObject);
begin
  Cmp_Padrao.ParamByName('ImprimirOBSObjeto').asBoolean := (rgImprimirOBSObjeto.ItemIndex = 0);
  inherited;
end;

end.
