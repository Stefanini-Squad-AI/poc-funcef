unit fCadRegHon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCustomCadRegHon,
  CMProcuraSubTipo, ExtCtrls, DBCtrls, MontaSelect, Db, DBClient, uCMClientDataSet, ImgList,
  CmEventosCadastro, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, StdCtrls, TB97,
  Buttons, TB97Ctls, TREdit, wwdblook, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe,
  wwdbdatetimepicker, CMDateTimePicker, Mask;

type
  TfrmCadRegHon = class(TfrmCustomCadRegHon)
    Label30: TLabel;
    Label13: TLabel;
    Label20: TLabel;
    dbedNumJCJ: TDBEdit;
    dbedJCJ: TDBEdit;
    dblckVara: TwwDBLookupCombo;
    rgSituacao: TDBRadioGroup;
    CMProcuraContraparte: TCMProcuraSubTipo;
    procedure FormCreate(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
  end;

var
  frmCadRegHon: TfrmCadRegHon;

implementation

uses uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadRegHon.FormCreate(Sender: TObject);
begin
  inherited;
  if (CtrlUsoGeralRH.UsuXCCusto <> '') or (CtrlUsoGeralRH.UsuXFilial <> '') then
  begin
    MontaSelect.Tabelas.Add('FUNCIONARIO');

    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      MontaSelect.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' + CtrlUsoGeralRH.UsuXCCusto);

    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      MontaSelect.Filtro.Add('FUNCIONARIO.IDESTAB IN ' + CtrlUsoGeralRH.UsuXFilial);

    MontaSelect.Filtro.Add('FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA');
  end;
end;

procedure TfrmCadRegHon.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert,dsEdit]) and (dbedNumJCJ.CanFocus) then
    dbedNumJCJ.SetFocus;
end;

end.
