//******************************************************************************
// Data     : 16/08/2005
// Código   : AL_2
// Motivo   : Passa a query do relatório definitivamente para o componente no DTM
//            e utiliza parametros corretamente
//******************************************************************************
// Data     : 07/12/2004
// Motivo   : Acerto na qryCarteira para filtrar TipoInvest = 2
//            Acerto na qryOperações para filtrar os TipoOper corretos
//******************************************************************************
// Data     : 11/11/2004
// Alteracao: AL_1
// Motivo   : Acerto no Cartesiano da qry qdo a acao possui alterações de Lote Padrao
//******************************************************************************

unit FParamTotTipoOper;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, OleCtrls,
  vcf1, Wwdatsrc, DBCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker;

type
  TFrmParamTotTipoOper = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    edDataIni: TCMDateTimePicker;
    edDataFim: TCMDateTimePicker;
    Label4: TLabel;
    qryCarteira: TwwQuery;
    Label3: TLabel;
    DbLkcTipoOperacao: TwwDBLookupCombo;
    QryOperacoes: TwwQuery;
    chkDivporLote: TCheckBox;
    qryAux: TwwQuery;
    qryAuxQTDELOTE: TFloatField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDTIPOINVEST: TFloatField;
    QryOperacoesIDTIPOOPERACAO: TFloatField;
    QryOperacoesDESCTIPOOPERACAO: TStringField;
    QryOperacoesIDTIPOINVEST: TFloatField;
    DbLkcCarteira: TwwDBLookupCombo;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataIniExit(Sender: TObject);
    procedure edDataFimExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure FazQry;
  public
    { Public declarations }
  end;

var
  FrmParamTotTipoOper: TFrmParamTotTipoOper;

implementation

{$R *.DFM}

Uses USistema, uMensErro, DmRelatoriosClaudio, UBibliotecaInvest, dOperacaoInvest, UOperacaoInvest,
     UOperComum, dOperComum;

Procedure TFrmParamTotTipoOper.FazQry;
Var
  LinhaSQL : String;
  CpLotePadrao: String;
  TbLotePadrao: String;
Begin
   // AL_2 - Query definitiva no datamodule e identação de código
   with DtmRelatoriosClaudio, DtmRelatoriosClaudio.QryTotTipoOper do
   begin
      // Acerta Labels de Data no Relatorio
      DtmRelatoriosClaudio.LbdataIni.Caption := 'Data Inicial: ' + EdDataIni.Text;
      DtmRelatoriosClaudio.LbdataFim.Caption := 'Data Final  : ' + EdDataFim.Text;

      if chkDivporLote.Checked then
         DtmRelatoriosClaudio.wImp := 'S'
      else DtmRelatoriosClaudio.wImp := 'N';

      OperComum.LimpaParametros(QryTotTipoOper);
      ParamByName('DATAINI').AsString := EdDataIni.Text;
      ParamByName('DATAFIM').AsString := edDataFim.Text;
      if Trim(DbLkcCarteira.Text) <> '' Then
         ParamByName('IDCARTEIRAINVEST').AsInteger := qryCarteiraIDCARTEIRAINVEST.AsInteger;
      if Trim(DbLkcTipoOperacao.Text) <> '' Then
         ParamByName('IDTIPOOPERACAO').AsInteger := QryOperacoesIDTIPOOPERACAO.AsInteger;
      Open;
   end;
   // AL_2 - Fim
End;

procedure TFrmParamTotTipoOper.FormCreate(Sender: TObject);
begin
  inherited;
  edDataIni.Date := Date;
  edDataFim.Date := Date;
end;

procedure TFrmParamTotTipoOper.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TFrmParamTotTipoOper.edDataIniExit(Sender: TObject);
begin
  inherited;
  If Trim(edDataIni.Text) = '' Then Begin
     MsgDlg('Data Inicial não foi preenchida','Erro',mtError,[mbOK],0);
     edDataIni.SetFocus;
  End;
end;

procedure TFrmParamTotTipoOper.edDataFimExit(Sender: TObject);
begin
  inherited;
  If trim(edDataFim.Text) = '' Then Begin
     MsgDlg('Data Final não foi preenchida','Erro',mtError,[mbOK],0);
     edDataFim.SetFocus;
  End;

end;

procedure TFrmParamTotTipoOper.FormShow(Sender: TObject);
begin
  inherited;
   QryCarteira.Open;
   QryOperacoes.Open;
end;

procedure TFrmParamTotTipoOper.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  inherited;
  QryCarteira.Close;
  QryOperacoes.Close;
end;

end.

