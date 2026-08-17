unit FCadTipoAgre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, wwdblook, CMProcuraMask, uCMTypes, CmEventosCadastro, ImgList;

type
  TFrmCadTipoAgre = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryDetIDTIPCUSTAGREGCON: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetCODTIPOCUSTAGREG: TFloatField;
    qryDetUNIDNEGOC: TFloatField;
    qryDetCODSUBCONTA: TFloatField;
    qryDetIDEMPRESA: TFloatField;
    qryDetCODCENTROCUSTO: TStringField;
    qryDetPLANO: TFloatField;
    qryDetPLACONTA: TStringField;
    Label1: TLabel;
    edDesc: TDBEdit;
    dbrgrpPercValor: TDBRadioGroup;
    GrpIncide: TGroupBox;
    chkBase: TDBCheckBox;
    dbchkReceb: TDBCheckBox;
    dbchkCompra: TDBCheckBox;
    dbchkNFCompl: TDBCheckBox;
    DBCHKTOTAL: TDBCheckBox;
    qryTratFiscE: TwwQuery;
    LbSubConta: TLabel;
    DblkSubConta: TwwDBLookupCombo;
    LbUn: TLabel;
    dblcUN: TwwDBLookupCombo;
    LbCCusto: TLabel;
    dblcCCusto: TwwDBLookupCombo;
    cmpConta: TCMProcuraMaskContabil;
    qryCCust: TwwQuery;
    qryUnidNegoc: TwwQuery;
    qrySubConta: TwwQuery;
    qryDetCENTCUST: TStringField;
    qryDetDESUNIDNEGOC: TStringField;
    Label2: TLabel;
    dblkpcmbTratFiscE: TwwDBLookupCombo;
    dbrgrpTotalItem: TDBRadioGroup;
    qryCODTIPOCUSTAGREG: TFloatField;
    qryDESCCUSTAGREG: TStringField;
    qryCODTRATFISCE: TStringField;
    qryTOTALITEM: TStringField;
    qryPERCVALOR: TStringField;
    qryCODTRATFISCD: TStringField;
    qryFLGINCIDERECEB: TStringField;
    qryFLGINCIDECOMPRA: TStringField;
    qryFLGINCIDENFCOMPL: TStringField;
    qryFLGCHECATOTAL: TStringField;
    qryFLGBASE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
    Procedure SelMestreDet( n : Integer );
  public
    { Public declarations }
  end;

var
  FrmCadTipoAgre : TFrmCadTipoAgre;
  bInsert        : Boolean;
implementation

{$R *.DFM}
Uses uIntegraBack, uMensErro,uSistema, uDataBase ;

Procedure TFrmCadTipoAgre.SelMestreDet( n : LongInt );
Begin
    qry.Close;
    qry.Params[0].asInteger := n;
    qry.Open;
    //
    qryDet.Close;
    qryDet.Params[0].asInteger := n;
    qryDet.Params[1].asInteger := Sistema.IdEmpresa;
    qryDet.Open;
End;

procedure TFrmCadTipoAgre.FormCreate(Sender: TObject);
begin
  inherited;
  if (IntegraBack.Contabilidade = 'S') then
  Begin
     cmpConta.Mascara := Trim(IntegraBack.MascaraPlano);
     cmpConta.Plano   := IntegraBack.Plano;
  End;
  qryCCust.Close;
  qryCCust.Params[0].Value := Sistema.IdEmpresa;
  qryCCust.Open;
  //
  qryUnidNegoc.Close;
  qryUnidNegoc.Params[0].Value := Sistema.idempresa;
  qryUnidNegoc.Open;
  //
  qrySubConta.Close;
  qrySubConta.Params[0].Value := Sistema.idempresa;
  qrySubConta.Open;
  //
  SelMestreDet(-1);
end;

procedure TFrmCadTipoAgre.CmeCadastroInsert(Sender: TObject);
Begin
   bInsert := True;
   SelMestreDet(-1);
  inherited;
  qry.FieldByName('IDPESSOA ').AsInteger       := Sistema.IdEmpresa;
  qry.FieldByName('TOTALITEM').AsString        := 'T';
  qry.FieldByName('PERCVALOR').AsString        := 'P';
  qry.FieldByName('FLGINCIDERECEB').AsString   := 'S';
  qry.FieldByName('FLGINCIDECOMPRA').AsString  := 'S';
  qry.FieldByName('FLGINCIDENFCOMPL').AsString := 'N';
  qry.FieldByName('FLGCHECATOTAL').AsString    := 'N';
  qry.FieldByName('FLGBASE').AsString          := 'N';
  edDesc.SetFocus;
End;

procedure TFrmCadTipoAgre.CmeCadastroEdit(Sender: TObject);
Begin
   bInsert := False;
  inherited;
  edDesc.SetFocus;
End;

Procedure TFrmCadTipoAgre.CmeCadastroDelete(Sender: TObject);
Begin
   qryDet.First;

   While Not qryDet.Eof Do
      Begin
          qryDet.Delete;
      End;
   Inherited;
End;

Procedure TFrmCadTipoAgre.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   If MontaSelect.RetornouValor Then
      Begin
          SelMestreDet(StrToInt(MontaSelect.ValoresChave[0]));
      End;
End;

Procedure TFrmCadTipoAgre.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    Accept := True;
    If Trim(edDesc.Text) = '' Then
       Begin
           MsgDlg('Descrição não foi preenchido','Erro',mtError,[mbOK],0);
           edDesc.SetFocus;
           Accept := False;
       End
   Else
   If Trim(dblkpcmbTratFiscE.Text) = '' Then
       Begin
           MsgDlg('Tratamento fiscal não foi preenchido','Erro',mtError,[mbOK],0);
           dblkpcmbTratFiscE.SetFocus;
           Accept := False;
       End;
End;

Procedure TFrmCadTipoAgre.CmeCadastroConfirma(Sender: TObject);
Begin
    if qry.State in [dsInsert,dsEdit] Then
       Begin
           If qry.State = dsInsert Then
              qry.FieldByName('CODTIPOCUSTAGREG').asInteger := LeUltRegistro(nil,'TIPOAGRE');
           qry.FieldByName('CODTRATFISCD').asString         :=  qry.FieldByName('CODTRATFISCE').asString;
           qryDet.First;
           While Not qryDet.Eof Do
             Begin
                qryDet.Edit;
                If qryDet.FieldByName('IDTIPCUSTAGREGCON').IsNull then
                   qryDet.FieldByName('IDTIPCUSTAGREGCON').asInteger := LeUltRegistro(nil,'TIPCUSTAGREGCONTA');
                qryDet.FieldByName('CODTIPOCUSTAGREG').asInteger := qry.FieldByName('CODTIPOCUSTAGREG').asInteger;
                qryDet.Next;
             End;
          AplicaAlteracoes([qry,qrydet]);
          if bInsert Then
            SelMestreDet(-1);
       End
   else
       AplicaAlteracoes([qrydet,qry]);
  inherited;
End;

Procedure TFrmCadTipoAgre.CmeDetalheInsert(Sender: TObject);
Begin
   inherited;
   cmpConta.SetFocus
End;

Procedure TFrmCadTipoAgre.CmeDetalheEdit(Sender: TObject);
Begin
   inherited;
   cmpConta.SetFocus
End;

Procedure TFrmCadTipoAgre.CmeDetalheDelete(Sender: TObject);
Begin
 If MsgDlg('Confirma a exclusão','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
    inherited;
End;
Procedure TFrmCadTipoAgre.CmeDetalheConfirma(Sender: TObject);
Begin
 If (qryDet.State in [dsInsert,dsEdit]) Then
   Begin
      If cmpConta.Valida <> VcOK then
        Begin
          cmpConta.SetFocus;
        End
     Else
     If (cmpConta.Conta.ObrigaSubConta) And (trim(DblkSubConta.Text) = '') then
        Begin
           MsgDlg('Obrigatório preencher a Sub Conta','Erro',mtError,[mbOk],0);
           DblkSubConta.SetFocus;
        End
     Else
     If trim(dblcUN.Text) = '' then
        Begin
           MsgDlg('Obrigatório preencher a Atividade/Projeto','Erro',mtError,[mbOk],0);
           dblcUN.SetFocus;
        End
     Else
     If (cmpConta.Conta.ObrigaCentrodeCusto) And (trim(dblcCCusto.Text) = '') then
        Begin
           MsgDlg('Obrigatório preencher o Centro de Custo ','Erro',mtError,[mbOk],0);
           dblcCCusto.SetFocus;
        End
      Else
         Begin
            qryDet.FieldByName('IDPESSOA').AsInteger     := Sistema.IdEmpresa;
            qryDet.FieldByName('PLANO').AsInteger        := IntegraBack.Plano;;
            qryDet.FieldByName('DESUNIDNEGOC').asString  := dblcUN.Text;
            qryDet.FieldByName('CENTCUST').asString      := dblcCCusto.Text;
            Inherited;
         End;
   End
 Else
   inherited;
End;

procedure TFrmCadTipoAgre.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  SelMestreDet(-1);
end;

end.
