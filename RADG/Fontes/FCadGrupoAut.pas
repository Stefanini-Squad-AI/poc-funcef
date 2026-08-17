unit FCadGrupoAut;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask,
  DBCtrls, wwdblook, CMDBLookupCombo, TREdit, CmEventosCadastro, ImgList;

type
  TFrmCadGrupoAut = class(TfrmCadMestreDetalheCS)
    qryIDGRUPOAUTORIZA: TFloatField;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label1: TLabel;
    edDesc: TDBEdit;
    qryDetIDGRPRESPON: TFloatField;
    qryDetIDGRUPOAUTORIZA: TFloatField;
    qryDetCODCENTRORESPON: TStringField;
    qryDetIDPESSOA: TFloatField;
    qryDetCODGRUPOPROD: TStringField;
    qryDetCODCENTROCUSTO: TStringField;
    qryDetIDEMPRESA: TFloatField;
    qryDetUNIDNEGOC: TFloatField;
    qryDetNUMAUTORIZACAO: TFloatField;
    qryDetNOME: TStringField;
    qryDetDESCGRUPOPROD: TStringField;
    qryDetDESCCENTRESP: TStringField;
    qryDetDESCUNIDNEG: TStringField;
    qryDetDESCGRPRESPON: TStringField;
    qryGrpResp: TwwQuery;
    dblcGrpResp: TCMDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dblcCentCust: TCMDBLookupCombo;
    qryCentCust: TwwQuery;
    edValor: TDBRealEdit;
    Label5: TLabel;
    qryCentResp: TwwQuery;
    Label6: TLabel;
    dblcCentResp: TCMDBLookupCombo;
    qryGrpProd: TwwQuery;
    Label7: TLabel;
    dblcGrpProd: TCMDBLookupCombo;
    qryUnNegoc: TwwQuery;
    Label8: TLabel;
    dblcUnNegoc: TCMDBLookupCombo;
    dbreNumAuto: TDBRealEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBRealEdit1: TDBRealEdit;
    dblcMoeda: TCMDBLookupCombo;
    Label12: TLabel;
    qryMoeda: TwwQuery;
    qryMoedaMOECODIGO: TFloatField;
    qryMoedaMOEDESC: TStringField;
    qryMoedaFATORCONVERSAO: TFloatField;
    qryMoedaMOEDAREFERENCIA: TFloatField;
    qryDetVLRINICIAL: TFloatField;
    qryDetVLRFINAL: TFloatField;
    qryDetMOECODIGO: TFloatField;
    qryNOMEGRUPOAUT: TStringField;
    qryDetSEQAUTORIZACAO: TFloatField;
    edSeqAut: TDBRealEdit;
    Label13: TLabel;
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
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
  
    Procedure SelMestreDet( n : LongInt );
  public
    { Public declarations }
  end;

var
  FrmCadGrupoAut : TFrmCadGrupoAut;
implementation

{$R *.DFM}

Uses uSistema, uMensErro, uDataBase;

Procedure TFrmCadGrupoAut.SelMestreDet( n : LongInt );
Begin
   qry.Close;
   qry.Params[0].AsInteger := n;
   qry.Open;
   
   qryDet.Close;
   qryDet.Params[0].AsInteger := n;
   qryDet.Params[1].AsInteger := Sistema.IdEmpresa;
   qryDet.Open;
End;

procedure TFrmCadGrupoAut.FormCreate(Sender: TObject);
begin
  inherited;
  SelMestreDet(-1);
  
  qryCentCust.Close;
  qryCentCust.Params[0].AsInteger := Sistema.IdEmpresa;
  qryCentCust.Open;
  
  qryCentResp.Close;
  qryCentResp.Params[0].AsInteger := Sistema.IdEmpresa;
  qryCentResp.Open;
  
  qryUnNegoc.Close;
  qryUnNegoc.Params[0].AsInteger := Sistema.IdEmpresa;
  qryUnNegoc.Open;
end;

Procedure TFrmCadGrupoAut.CmeCadastroInsert(Sender: TObject);
Begin
    SelMestreDet(-1);
    inherited;
    qryIDGRUPOAUTORIZA.AsInteger := LeUltRegistro(nil,'RADGRUPOAUTORIZACAO');
    edDesc.SetFocus;
End;

Procedure TFrmCadGrupoAut.CmeCadastroEdit(Sender: TObject);
Begin
    inherited;
    edDesc.SetFocus;
End;

Procedure TFrmCadGrupoAut.CmeCadastroDelete(Sender: TObject);
Begin
   qryDet.First;
   While Not qryDet.Eof Do
      Begin
          qryDet.Delete;
      End;
   Inherited;
End;
Procedure TFrmCadGrupoAut.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
    If MontaSelect.RetornouValor Then
       SelMestreDet(StrToInt(MontaSelect.ValoresChave[0]));
End;

Procedure TFrmCadGrupoAut.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    Accept := True;
    If Trim(edDesc.Text) = '' Then
       Begin
           MsgDlg('Descrição não preenchida','Erro',mtError,[mbOK],0);
           edDesc.SetFocus;
           Accept := False;
       End;
End;

Procedure TFrmCadGrupoAut.CmeCadastroConfirma(Sender: TObject);
Begin
    if qry.State in [dsInsert,dsEdit] Then
        Begin
           AplicaAlteracoes([qry,qrydet]);
        End
    else
        AplicaAlteracoes([qrydet,qry]);
    inherited;
End;

Procedure TFrmCadGrupoAut.CmeDetalheInsert(Sender: TObject);
Begin
   inherited;
   dblcGrpResp.SetFocus;
   dbreNumAuto.Value := 1;
   qryDet.FieldByName('NUMAUTORIZACAO').AsInteger := 1;
End;

Procedure TFrmCadGrupoAut.CmeDetalheEdit(Sender: TObject);
Begin
   inherited;
   dblcGrpResp.SetFocus
End;

Procedure TFrmCadGrupoAut.CmeDetalheDelete(Sender: TObject);
Begin
      If MsgDlg('Confirma a exclusão do Grupo de Responsabilidade','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
         inherited;
End;

Procedure TFrmCadGrupoAut.CmeDetalheConfirma(Sender: TObject);
Begin
 If (qryDet.State in [dsInsert,dsEdit]) Then
   Begin
      If Trim(dblcGrpResp.Text) = '' Then
         Begin
            MsgDlg('Grupo de Responsabilidade não foi preenchido','Erro',mtError,[mbOK],0);
            dblcGrpResp.SetFocus;
            Exit;
         End;
      If dbreNumAuto.Value < 1 Then
         Begin
            MsgDlg('É obrigatório indicar pelo menos uma autorização','Erro',mtError,[mbOK],0);
            dbreNumAuto.SetFocus;
            Exit;
         End;
      qryDetIDGRUPOAUTORIZA.AsInteger := qryIDGRUPOAUTORIZA.AsInteger;
      qryDetIDPESSOA.asInteger        := Sistema.IdEmpresa;
      qryDetIDEMPRESA.asInteger       := Sistema.IdEmpresa;
      qryDetNOME.AsString             := dblcCentCust.Text;
      qryDetDESCGRUPOPROD.AsString    := dblcGrpProd.Text;
      qryDetDESCCENTRESP.AsString     := dblcCentResp.Text;
      qryDetDESCUNIDNEG.AsString      := dblcUnNegoc.Text;
      qryDetDESCGRPRESPON.AsString    := dblcGrpResp.Text;
      Inherited;
   End
 Else
   inherited;
End;



procedure TFrmCadGrupoAut.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  SelMestreDet(-1);
end;

procedure TFrmCadGrupoAut.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Try
     StartTransacao;
     if not Sistema.GravaLogOperacoes('Cadastro de Grupo de Autorização',False) then Abort;
     CommitTransacao;
  Except
     RollBackTransacao;
  End;
end;

end.
