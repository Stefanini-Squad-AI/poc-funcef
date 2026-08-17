unit fParamFichaProc_ModCon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MontaSelect,
  fCustomParamFichaProc, CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmParamFichaProc_ModCon = class(TfrmCustomParamFichaProc)
    rgImprimirRateio: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamFichaProc_ModCon: TfrmParamFichaProc_ModCon;

implementation

uses uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamFichaProc_ModCon.FormCreate(Sender: TObject);
begin
  inherited;
  with (MontaSelect) do
  begin
    Filtro.Add('PROCESSOTRAB.INDMATERIA    = 1');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') or (CtrlUsoGeralRH.UsuXFilial <> '') then
    begin
      Tabelas.Add('FUNCIONARIO');
      Filtro.Add('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
    end;

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Filtro.Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);
  end;
end;

procedure TfrmParamFichaProc_ModCon.bbtnConfirmarClick(Sender: TObject);
begin
  Cmp_Padrao.ParamByName('ImprimirRateio').asBoolean := (rgImprimirRateio.ItemIndex = 0);
  inherited;                                                                             
end;

end.
