unit fExecExcluiApuracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, uCtrlApuracao, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbspin, Mask, wwdbedit, Wwdotdot, Wwdbcomb,
  mIndicador, mContratoLoja, mImovel, mImovelouMestre;

type
  TfrmExecExcluiApuracao = class(TfrmOkCancelar)
    molContratoLoja1: TmolContratoLoja;
    molIndicador1: TmolIndicador;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    cboMes: TwwDBComboBox;
    dbspnAno: TwwDBSpinEdit;
    GroupBox2: TGroupBox;
    chkPrevisto: TCheckBox;
    chkRealizado: TCheckBox;
    GroupBox3: TGroupBox;
    chkManual: TCheckBox;
    chkCalculado: TCheckBox;
    chkImportado: TCheckBox;
    chkRegra: TCheckBox;
    GroupBox4: TGroupBox;
    cmdtApura: TCMDateTimePicker;
    molImovelouMestre1: TmolImovelouMestre;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molContratoLoja1btnBuscaContratoClick(Sender: TObject);
  private
    { Private declarations }
    CtrlApuracao : TCtrlApuracao;
  public
    { Public declarations }
  end;

var
  frmExecExcluiApuracao: TfrmExecExcluiApuracao;

implementation

uses uModuloIndicadores, uComunsImobiliario, uVerificaPreenchimento, uSistema, dBaseDados, uMensErro;

{$R *.DFM}

procedure TfrmExecExcluiApuracao.FormCreate(Sender: TObject);
var iAno, iMes, iDia : Word;
begin
  inherited;
  CtrlApuracao := TCtrlApuracao.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlApuracao.Initialize (dtmBaseDados.dbBaseDados, true, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, true,
                           ComunsImobiliario.MensErroMT);

  // Carrega competência default
  DecodeDate(Date, iAno, iMes, iDia);
  cboMes.ItemIndex := iMes - 1;
  DBspnAno.Value   := iAno;

  // Zera as variáveis dos frames
  molContratoLoja1.btnLimpaContratoClick(Self);
  molImovelouMestre1.btnLimpaImovelClick(self);
  molIndicador1.btnLimpaIndicadorClick(self);
end;

procedure TfrmExecExcluiApuracao.bbtnConfirmarClick(Sender: TObject);
var iMes, iAno : Integer;
    dLanca     : TDateTime;
    sTipoLanca, sTipoInc : String;
begin
  inherited;
  if MsgDlg('Confirma a exclusão das apurações conforme parâmetros indicados ? ' +#13+
            'ATENÇÃO - Este processo não poderá ser desfeito', 'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrYes then begin

    sTipoLanca := '';
    sTipoInc   := '';
    dLanca     := -1;
    iMes       := -1;
    iAno       := -1;
    if cboMes.ItemIndex >= 0 then iMes       := cboMes.ItemIndex + 1;
    if DBspnAno.Text <> ''   then iAno       := StrToInt(DBspnAno.Text);
    if cmdtApura.Text <> ''  then dLanca     := cmdtApura.Date;
    if chkPrevisto.Checked   then sTipoLanca := sTipoLanca + 'P';
    if chkRealizado.Checked  then sTipoLanca := sTipoLanca + 'R';
    if chkManual.Checked     then sTipoInc   := sTipoInc   + 'M';
    if chkCalculado.Checked  then sTipoInc   := sTipoInc   + 'C';
    if chkImportado.Checked  then sTipoInc   := sTipoInc   + 'I';
    if chkRegra.Checked      then sTipoInc   := sTipoInc   + 'R';

    if CtrlApuracao.ExcluiApuracao(molIndicador1.iIndicador,
                                   molImovelouMestre1.iImovel,
                                   molContratoLoja1.iContrato,
                                   iMes, iAno, dLanca, sTipoLanca, sTipoInc) then begin

      MsgDlg('Apurações Excluídas com Sucesso', 'Informação', mtInformation, [mbOk], 0);
    end;
  end;
end;

procedure TfrmExecExcluiApuracao.molContratoLoja1btnBuscaContratoClick(Sender: TObject);
begin
  inherited;
  molContratoLoja1.iImovelFiltro := molImovelouMestre1.iImovel;
  molContratoLoja1.btnBuscaContratoClick(Sender);
end;

end.
