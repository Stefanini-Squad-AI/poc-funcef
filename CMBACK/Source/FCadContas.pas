(*******************************************************************************
 18/051999 - 02.08.04
  Correção do falta expressão no retorno da consulta
 26/08/1999 - 02.12.06
  Inclusão da indicação da subconta, atividade e projeto
 03/11/1999 - 2.14.10
  Inclusão do número da agência no combo box de agências
*******************************************************************************)

unit FCadContas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, CMwwQuery, TB97, uCmTypes,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook, ComCtrls, Mask,
  wwdbedit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CMProcuraMask,
  DBCtrls, uCalcDv, CmEventosCadastro, ImgList, Wwquery;

type
  TfrmCadContas = class(TfrmCadastroCS)
    gbIntContab: TGroupBox;
    dbeDescricao: TwwDBEdit;
    dbeContaCorrente: TwwDBEdit;
    dblcBanco: TwwDBLookupCombo;
    lblBanco: TLabel;
    dblcAgencia: TwwDBLookupCombo;
    lblAgencia: TLabel;
    lblConta: TLabel;
    lblDescricao: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    lblMoeda: TLabel;
    qryBanco: TwwQuery;
    qryAgencia: TwwQuery;
    qryMoeda: TwwQuery;
    qryccusto: TwwQuery;
    qryCODPORTADOR: TFloatField;
    qryIDUSUARIOINCLUSAO: TFloatField;
    qryIDAGENCIA: TFloatField;
    qryCODCENTROCUSTO: TStringField;
    qryMOECODIGO: TFloatField;
    qryPLANO: TFloatField;
    qryPLACONTA: TStringField;
    qryIDBANCO: TFloatField;
    qryNOCONTACORR: TStringField;
    qryIDPESSOA: TFloatField;
    qryDESCRICAO: TStringField;
    qryIDEMPRESA: TFloatField;
    CContabil: TCMProcuraMaskContabil;
    qryBancoNOME: TStringField;
    qryBancoIDPESSOA: TFloatField;
    qryBancoNUMBANCO: TStringField;
    qryAgenciaNOME: TStringField;
    qryAgenciaIDPESSOA: TFloatField;
    qryAgenciaNUMAGENCIA: TStringField;
    dbckGeraFluxo: TDBCheckBox;
    qryFLGGRAVAFLUXO: TStringField;
    lblCentroCusto: TLabel;
    dblcCCusto: TwwDBLookupCombo;
    qrySubConta: TwwQuery;
    qrySubContaCODSUBCONTA: TFloatField;
    qrySubContaIDPESSOA: TFloatField;
    qrySubContaNOMESUBCONTA: TStringField;
    Label20: TLabel;
    dblkSubconta: TwwDBLookupCombo;
    qryccustoCODCENTROCUSTO: TStringField;
    qryccustoNOME: TStringField;
    qryUNIDNEGOC: TFloatField;
    qryCODSUBCONTA: TFloatField;
    qryUnidNegocS: TwwQuery;
    qryUnidNegocNOME: TStringField;
    qryUnidNegocUNETIPO: TStringField;
    qryUnidNegocUNECODIGO: TStringField;
    qryUnidNegocUNIDNEGOC: TFloatField;
    lblUnidNegoc: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    qryBancoRAZAOSOCIAL: TStringField;
    qryBancoMASCARACC: TStringField;
    qryBancoMASCARAAGENCIA: TStringField;
    qryBancoFLGVALIDACC: TStringField;
    qryFLGSTATUS: TStringField;
    Bevel1: TBevel;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure dblcAgenciaEnter(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FazerQryCCusto;
    procedure FazerQryAgencia;
    procedure dbeDescricaoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CContabilExit(Sender: TObject);
    procedure dblcBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcAgenciaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcUnidNegocExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    CalculaDvConta :TCalcDv;
  public
    { Public declarations }
  end;

var
  frmCadContas: TfrmCadContas;
  iBanco:Integer;
implementation

{$R *.DFM}

uses uMensErro,uDataBase, DBaseDados,uIntegraBack,uSistema,uFuncaoGeral;

procedure TfrmCadContas.FormActivate(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled:=False;

  MontaSelect.Filtro.Add('PORTADORCONTA.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));

  FazQuery(qryMoeda,'SELECT MOECODIGO,MOEDESC,MOESIGLA FROM '+Sistema.PrefixoServidor+'MOEDA WHERE MOEINATIVO=''A''');
end;

procedure TfrmCadContas.dblcAgenciaEnter(Sender: TObject);
begin
  inherited;
  FazerQryAgencia;
end;

procedure TfrmCadContas.CmeCadastroFind(Sender: TObject);
begin
     if MontaSelect.RetornouValor then
     begin
        qry.Close;
        If Not qry.Prepared Then qry.Prepare;
        qry.ParamByName('CODPORTADOR').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
        qry.OPen;
        FazerQryAgencia;
        FazerQryCCusto;
     end;
end;

procedure TfrmCadContas.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled :=True;
  dblcBanco.SetFocus;
  qry.FieldByName('FLGGRAVAFLUXO').AsString:='S';
  qryFLGSTATUS.AsString := 'A';
  FazerQryCCusto;
end;

procedure TfrmCadContas.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled:=True;
  dblcBanco.SetFocus;
  if qry.FieldByName('FLGGRAVAFLUXO').isNull then
     qry.FieldByName('FLGGRAVAFLUXO').AsString:='S';

  If qryFLGSTATUS.isNull Then
     qryFLGSTATUS.AsString := 'A';
end;

procedure TfrmCadContas.bbtnCancelarClick(Sender: TObject);
begin
  pnlFundo.Enabled:=False;
  inherited;
end;

procedure TfrmCadContas.FazerQryAgencia;
begin

  iBanco:=qry.FieldByName('IDBANCO').AsInteger;

  FazQuery(qryAgencia,'SELECT P.NOME,A.IDPESSOA, A.NUMAGENCIA FROM '+Sistema.PrefixoServidor+'PESSOA P, '+Sistema.PrefixoServidor+'AGENCIABANCARIA A WHERE A.IDBANCO = '+IntToStr(iBanco)+' AND P.IDPESSOA=A.IDPESSOA ORDER BY A.NUMAGENCIA');

end;

procedure TfrmCadContas.FazerQryCCusto;
begin
   If IntegraBack.Contabilidade = 'S' Then
   Begin
     qryCCusto.Close;
     If Not qryCCusto.Prepared Then qryCCusto.Prepare;
     qryCCusto.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
     qryCCusto.ParamByName('PLANO').AsInteger     := IntegraBack.Plano;
     qryCCusto.ParamByName('PLACONTA').AsString  :=  Trim(CContabil.Conta.Numero);
     qryCCusto.Open;
   End;
end;

procedure TfrmCadContas.dbeDescricaoEnter(Sender: TObject);
begin
  inherited;
  if dbeDescricao.Text = '' then
     qry.FieldByName('DESCRICAO').AsString:=dblcBanco.Text+' '+dblcAgencia.Text+' '+dbeContaCorrente.Text;
end;

procedure TfrmCadContas.FormCreate(Sender: TObject);
begin
  inherited;
  CalculaDvConta := TCalcDv.Create;

  qryBanco.Open;
  qry.Open;

  If IntegraBack.Contabilidade = 'S' Then
  Begin
    gbIntContab.Enabled := True;
    CContabil.Plano := IntegraBack.Plano;
    CContabil.Mascara := IntegraBack.MascaraPlano;
    qrySubConta.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
    qrySubConta.Open;
    qryUnidNegocS.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
    qryUnidNegocS.Open;
  End
  Else
    gbIntContab.Enabled := False;

end;

procedure TfrmCadContas.CContabilExit(Sender: TObject);
begin
  inherited;
  FazerQryCCusto;
  If dblcCCusto.CanFocus Then dblcCCusto.SetFocus;
end;


procedure TfrmCadContas.dblcBancoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If qryBancoMASCARACC.IsNull Then
     qryNOCONTACORR.EditMask := ''
  Else
     qryNOCONTACORR.EditMask := qryBancoMASCARACC.AsString + ';1; ';
end;

procedure TfrmCadContas.dblcAgenciaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Modified Then
     dblcAgencia.LookupValue := dblcAgencia.LookupValue;
end;

procedure TfrmCadContas.dblcUnidNegocExit(Sender: TObject);
begin
  inherited;
  If ((ActiveControl = nil) Or (ActiveControl.Tag <> 9999)) And
     (qryUnidNegocUNETIPO.AsString <> 'A') Then
  Begin
     MsgDlg('Atividade\Projeto tem de ser analítico','Atenção',mtWarning,[mbOk],0);
     If dblcUnidNegoc.CanFocus Then dblcUnidNegoc.SetFocus;
  End;
end;

procedure TfrmCadContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FechaQry([QryCCusto],false,true);
  CalculaDvConta.Free;
end;

procedure TfrmCadContas.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

  Accept := False;

  If (Trim(dbeContaCorrente.Text) <> '')  And
     (qryBancoFLGVALIDACC.AsString <> 'N') And
     (Not CalculaDvConta.ValidaConta(qryBanco.FieldByName('NUMBANCO').AsString,
                                    qryAgencia.FieldByName('NUMAGENCIA').AsString,
                                    dbeContaCorrente.Text,True)) Then Exit;

  if trim(dbeDescricao.text) = '' then
     begin
       MsgDlg('Obrigatório preencher a Descrição da Conta','Erro',mtError,[mbOk],0);
       dbeDescricao.SetFocus;
       exit;
     end;

  if IntegraBack.Contabilidade = 'S' then
  Begin
     if CContabil.Valida <> VcOk  then  exit;

     If (dblkSubconta.Text = '') And  CContabil.Conta.ObrigaSubConta Then
     begin
        MsgDlg('Obrigatório a Indicação da subconta','Aviso',mtError,[mbOk],0);
        dblkSubconta.SetFocus;
        Exit;
     end;

     if (trim(dblcCCusto.Text) = '') and (CContabil.Conta.ObrigaCentrodeCusto) then
     begin
       MsgDlg('Obrigatório preencher o Centro de Custo','Erro',mtError,[mbOk],0);
       If dblcCCusto.CanFocus Then dblcCCusto.SetFocus;
       exit;
     end;
  end;

  If CmeCadastro.Operacao In [OpInserir, OpAlterar] Then
  Begin
    qry.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;

    if qry.FieldByName('CODPORTADOR').AsInteger <= 0 then
       qry.FieldByName('CODPORTADOR').AsInteger := LeUltRegistro(nil,'PORTADORCONTA');

    If qryPLACONTA.IsNull Then
      qryPLANO.Clear
    Else
      qryPLANO.AsInteger := IntegraBack.Plano;
  End;

  pnlFundo.Enabled:=False;

  Accept := True;
end;

end.
