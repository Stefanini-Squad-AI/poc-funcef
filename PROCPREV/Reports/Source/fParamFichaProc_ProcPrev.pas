unit fParamFichaProc_ProcPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MontaSelect,
  fCustomParamFichaProc, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmParamFichaProc_ProcPrev = class(TfrmCustomParamFichaProc)
    rgImprimirOBSObjeto: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamFichaProc_ProcPrev: TfrmParamFichaProc_ProcPrev;

implementation

{$R *.DFM}

procedure TfrmParamFichaProc_ProcPrev.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PROCESSOTRAB.INDMATERIA   IN (2,3)');
end;

procedure TfrmParamFichaProc_ProcPrev.bbtnConfirmarClick(Sender: TObject);
begin
  Cmp_Padrao.ParamByName('TipoContraparte').asString := TipoPessoa;
  Cmp_Padrao.ParamByName('ImprimirOBSObjeto').asBoolean := (rgImprimirOBSObjeto.ItemIndex = 0);
  inherited;
end;

end.
