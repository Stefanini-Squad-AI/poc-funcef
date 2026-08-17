unit fMTCadTipoDespAV;
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{ -------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 142550
Nº KINTANA..: 911790
Data........: 24/09/2010
Responsável.: Helen V. Bianchi
Descrição...: Mudar o nome do Form: "Cadastro de Tipos de Despesa para Acréscimo de
  Valor" Para:"Cadastro de Tipos Específicos de Movimentações para:Acréscimos/Decréscimos
  de Valor".Incluir o campo "Movimentação" e add este campo na Busca.
--------------------------------------------------------------------------------------}
//-------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Mask, wwdbedit, MontaSelect, Db, DBClient, IvEMulti,
  uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc, IvDictio,
  IvMulti,   MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uCMTypes,
  uCtrlTipoDespesaAV, uCtrlPadroes, wwdblook,uCtrlTipoMovimentacao;

type
  TfrmMTCadTipoDespAV = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedDescricao: TwwDBEdit;
    cdsMovimento: TCMClientDataSet;
    lblTipoMov: TLabel;
    dblcTipoMovimento: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CdsBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    TipoDespesaAV : TCtrlTipoDespesaAV;
    //Helen - SOL Nº142550 KINTANA Nº 911790
    TipoMovimentacao : TCtrlTipoMovimentacao;
    Procedure SelTipoDespesaAV(fIdTipoDespesa : Extended);
  public
    { Public declarations }
  end;

var
  frmMTCadTipoDespAV: TfrmMTCadTipoDespAV;

implementation

{$R *.DFM}

Uses uMensErro, uSistema;

procedure TfrmMTCadTipoDespAV.FormCreate(Sender: TObject);
begin
   inherited;
   //Helen - SOL Nº142550 KINTANA Nº 911790
   TipoMovimentacao := tCtrlTipoMovimentacao.Create;
   TipoMovimentacao.InitializeAs(Padroes);
   cdsMovimento.Data := TipoMovimentacao.ListaAcrescDecresc( ' IDTIPOMOVIMENTACAO = 9 or IDTIPOMOVIMENTACAO = 95 ' );

   TipoDespesaAV := TCtrlTipoDespesaAV.Create;
   TipoDespesaAV.InitializeAs(Padroes);
   TipoDespesaAV.cds := cds;
   SelTipoDespesaAV(-1);
end;

procedure TFrmMTCadTipoDespAV.SelTipoDespesaAV(fIdTipoDespesa : Extended);
begin
   cds.Data := TipoDespesaAV.Procurar(fIdTipoDespesa);
end;

procedure TfrmMTCadTipoDespAV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   TipoDespesaAV.Free;
end;

procedure TfrmMTCadTipoDespAV.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := TipoDespesaAV.AplicaOperacao;
end;

procedure TfrmMTCadTipoDespAV.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := TipoDespesaAV.AplicaOperacao;
end;

procedure TfrmMTCadTipoDespAV.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   inherited;
   Accept := TipoDespesaAV.AplicaOperacao;
end;

procedure TfrmMTCadTipoDespAV.CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(TipoDespesaAV.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmMTCadTipoDespAV.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
      SelTipoDespesaAV(strtofloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmMTCadTipoDespAV.CmeCadastroAfterConfirma(Sender: TObject);
begin
// inherited;
end;

procedure TfrmMTCadTipoDespAV.CdsBeforeDelete(DataSet: TDataSet);
var
  cdsAux: TClientDataSet;
begin
  inherited;
  //Helen - SOL Nº142550 KINTANA Nº 911790
  cdsAux      := TClientDataSet.Create(nil);
  cdsAux.close;
  cdsAux.Data := TipoDespesaAV.ListaTipoDespesaAVParam(' CT.IDTIPODESPESA = ' + cds.FieldByName('IDTIPODESPESA').AsString ) ;
  if not cdsAux.Eof then
  begin
     MsgDlg('Este registro está sendo utilizado na Parametrização Contábil. Exclusão cancelada. ' + Padroes.MessageInfo,'Aviso',mtError,[mbOk],0);
     Abort;
  end;
  cdsAux.Close;
  FreeAndNil(cdsAux);

end;

end.
