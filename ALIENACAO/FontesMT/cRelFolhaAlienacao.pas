{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante...
Pendência   : 27508
Responsável : Daniel Simões
Data        : 17/03/2008
Descrição   : Ajuste dos Help Contexts...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit cRelFolhaAlienacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, fcCombo,
  fcColorCombo, Db, DBClient, uCMClientDataSet, wwdblook, 
  mResponsavel, mAdministradora, Mask, wwdbedit, Wwdbspin;

type
  TcfgRelFolhaAlienacao = class(TfrmParamReports_Padrao)
    GroupBox1: TGroupBox;
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    molAdministradora1: TmolAdministradora;
    molResponsavel1: TmolResponsavel;
    Label1: TLabel;
    Label2: TLabel;
    DBspnAnoCompetencia: TwwDBSpinEdit;
    cboMesCompetencia: TComboBox;
    GroupBox2: TGroupBox;
    cbContrato: TCheckBox;
    cbAcordo: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cfgRelFolhaAlienacao: TcfgRelFolhaAlienacao;

implementation

uses uDiasUteis, uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados;

{$R *.DFM}

procedure TcfgRelFolhaAlienacao.FormCreate(Sender: TObject);
var iDia, iMes, iAno : Word;
begin
  inherited;
  // Zera os Frames
  molAdministradora1.btnLimpaAdministradoraClick( Self );
  molResponsavel1.btnLimpaResponsavelClick( Self );

  // Define Defaults
  DecodeDate(Date, iAno, iMes, iDia);
  cboMesCompetencia.ItemIndex := iMes - 1;
  DBspnAnoCompetencia.Value   := iAno;
end;

procedure TcfgRelFolhaAlienacao.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin
  inherited;
  cmp_Padrao.ParamByName('iMes').AsInteger := cboMesCompetencia.ItemIndex + 1;
  cmp_Padrao.ParamByName('iAno').AsFloat   := DBspnAnoCompetencia.Value;
  cmp_Padrao.ParamByName('iResponsavel').AsInteger    := molResponsavel1.iResponsavel;
  cmp_Padrao.ParamByName('iAdministradora').AsInteger := molAdministradora1.iAdministradora;
  cmp_Padrao.ParamByName('bContrato').AsBoolean := cbContrato.Checked;
  cmp_Padrao.ParamByName('bAcordo').AsBoolean   := cbAcordo.Checked;

  // Carrega variáveis com os parametros de cores de linha e separadores
  iPosCor  := 0;
  CorLinha := cboCorLinha.SelectedColor;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);
  cmp_Padrao.ParamByName('bSeparador').AsBoolean := chkLinhas.Checked;
  cmp_Padrao.ParamByName('bCorLinha').AsBoolean  := chkCorLinha.Checked;
  cmp_Padrao.ParamByName('iCorLinha').AsInteger  := iPosCor;
end;

end.
