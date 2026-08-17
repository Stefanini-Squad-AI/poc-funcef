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

unit cRelEstoqueFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, wwdbdatetimepicker, CMDateTimePicker, StdCtrls,
  wwdblook, Db, DBClient, uCMClientDataSet, uCmSqlParams, mProposta,
  fcCombo, fcColorCombo, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TcfgRelEstoqueFinanceiro = class(TfrmParamReports_Padrao)
    chkLinhas: TCheckBox;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    molProposta1: TmolProposta;
    sqlTipoImovel: TCMSqlParams;
    cdsTipoImovel: TCMClientDataSet;
    dbcboTipoImovel: TwwDBLookupCombo;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    cmdtFim: TCMDateTimePicker;
    rdgTipoRelatorio: TRadioGroup;
    rgTipo: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cfgRelEstoqueFinanceiro: TcfgRelEstoqueFinanceiro;

implementation

uses uComunsImobiliario, uVerificaPreenchimento, uMensErro, uSistema, dBaseDados;

{$R *.DFM}



procedure TcfgRelEstoqueFinanceiro.FormCreate(Sender: TObject);
begin
   inherited;
   sqlTipoImovel.Open;
end;



procedure TcfgRelEstoqueFinanceiro.bbtnConfirmarClick(Sender: TObject);
var CorLinha : TColor;
    iPosCor  : Integer;
begin

  if Length(Trim(cmdtFim.Text)) = 0 then
  begin
     MsgDlg('Favor informar a data final',Sistema.NomeModulo,mtWarning,[mbOK],0);
     Exit;
  end;

  inherited;

  cmp_Padrao.ParamByName('Segmento').AsString    := dbcboTipoImovel.LookupValue;
  cmp_Padrao.ParamByName('Contrato').AsInteger   := molProposta1.iProposta;
  cmp_Padrao.ParamByName('Data').AsDateTime      := cmdtFim.Date;
  cmp_Padrao.ParamByName('iTipo').AsInteger      := rdgTipoRelatorio.ItemIndex;
  cmp_Padrao.ParamByName('iTipoRelat').AsInteger := rgTipo.ItemIndex;

  // Carrega variáveis com os parametros de cores de linha e separadores
  iPosCor  := 0;
  CorLinha := cboCorLinha.SelectedColor;
  ComunsImobiliario.BuscaCorLinha(iPosCor, CorLinha);

  cmp_Padrao.ParamByName('bSeparador').AsBoolean := chkLinhas.Checked;
  cmp_Padrao.ParamByName('bCorLinha').AsBoolean  := chkCorLinha.Checked;
  cmp_Padrao.ParamByName('iPosCor').AsInteger    := iPosCor;

end;



procedure TcfgRelEstoqueFinanceiro.molProposta1btnBuscaPropClick(Sender: TObject);
begin
   inherited;
   molProposta1.btnBuscaPropClick(2,False,Sender);
end;



end.
