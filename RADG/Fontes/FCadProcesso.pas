unit FCadProcesso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  DBCtrls, Mask, wwdblook, CMDBLookupCombo, Spin, TREdit,
  CmEventosCadastro, ImgList;

type
  TFrmCadProcesso = class(TfrmCadMestreDetalheCS)
    qryIDTIPOPROCESSO: TFloatField;
    qryIDREFERENCIA: TFloatField;
    qryDESCRICAO: TStringField;
    Label1: TLabel;
    edNome: TDBEdit;
    memDesc: TDBMemo;
    Label2: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label4: TLabel;
    dblcModulo: TCMDBLookupCombo;
    chkInicial: TDBCheckBox;
    Label3: TLabel;
    dblcEtapa: TCMDBLookupCombo;
    qryEtapa: TwwQuery;
    qryModulo: TwwQuery;
    qryWkFlow: TwwQuery;
    qryDetIDTIPOPROCESSO: TFloatField;
    qryDetIDTIPOETAPA: TFloatField;
    qryDetIDMODULO: TFloatField;
    qryDetFLGINICIAL: TStringField;
    qryDetNOMEMODULO: TStringField;
    chkFinal: TDBCheckBox;
    qryDetFLGFINAL: TStringField;
    spNDias: TSpinEdit;
    Label6: TLabel;
    qryGrpResp: TwwQuery;
    qryGrpAut: TwwQuery;
    qryGrpAutIDGRUPOAUTORIZA: TFloatField;
    qryIDGRPGESTOR: TFloatField;
    qryIDGRPCONSULTA: TFloatField;
    qryNUMDIASPREVISTO: TFloatField;
    Label9: TLabel;
    spNdiaEtapa: TSpinEdit;
    qryDetNUMDIASPREVISTO: TFloatField;
    qryNOME: TStringField;
    qryDetDESCETAPA: TStringField;
    TbsOBS: TTabSheet;
    memOBS: TDBMemo;
    qryOBSPROC: TStringField;
    qryGrpInst: TwwQuery;
    qryIDGRPCRIAPROCESSO: TFloatField;
    qryReferencia: TwwQuery;
    tabRestricao: TTabSheet;
    Label11: TLabel;
    qryGRAUGRUPPROD: TFloatField;
    edGaruGrp: TDBRealEdit;
    qryGrpAutNOMEGRUPOAUT: TStringField;
    qryIDGRUPOPROCESSO: TFloatField;
    TabGer: TTabSheet;
    Label7: TLabel;
    dblcGrpResp: TCMDBLookupCombo;
    Label8: TLabel;
    dblcGrpConsulta: TCMDBLookupCombo;
    Label5: TLabel;
    dblcGrpInst: TCMDBLookupCombo;
    Label10: TLabel;
    dblcReferencia: TCMDBLookupCombo;
    dblcGrpProc: TCMDBLookupCombo;
    Label12: TLabel;
    qryGrpProc: TwwQuery;
    qryGrpProcIDGRUPOPROCESSO: TFloatField;
    qryGrpProcDESCGRUPOPROCESSO: TStringField;
    GroupBox1: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    qryFLGCENTCUST: TStringField;
    qryFLGCENTRESPON: TStringField;
    qryFLGGRUPPROD: TStringField;
    qryFLGUNIDNEGOC: TStringField;
    qryFLGVALOR: TStringField;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblcModuloCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure edGaruGrpExit(Sender: TObject);
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
    procedure CmeDetalheAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    sMascGrupo : String;
    
    
    Procedure SelMestreDet( n : LongInt );
    Function VerifNome( s : String ) : Boolean;
  public
    { Public declarations }
  end;

var
  FrmCadProcesso : TFrmCadProcesso;
  bInsert        : Boolean;
implementation

{$R *.DFM}
Uses uSistema, uMensErro, uDataBase, DBaseDados ;


Procedure TFrmCadProcesso.SelMestreDet( n : LongInt );
Begin
   qry.Close;
   qry.Params[0].AsInteger := n;
   qry.Open;
   
   qryDet.Close;
   qryDet.Params[0].AsInteger := n;
   qryDet.Open;
   
   If Not qry.FieldByName('NUMDIASPREVISTO').IsNull Then
      spNDias.Value := qry.FieldByName('NUMDIASPREVISTO').AsInteger
   Else
      spNDias.Value := 1;


End;

Procedure TFrmCadProcesso.CmeCadastroInsert(Sender: TObject);
Begin
    bInsert := True;
    SelMestreDet(-1);
    inherited;
    spNDias.Value := 1;
    qryIDTIPOPROCESSO.AsInteger := LeUltRegistro(nil,'RADTIPOPROCESSO');
    edNome.SetFocus;
End;

Procedure TFrmCadProcesso.CmeCadastroEdit(Sender: TObject);
Begin
    bInsert := False;
    inherited;
    edNome.SetFocus;
End;

Procedure TFrmCadProcesso.CmeCadastroDelete(Sender: TObject);
Begin
   qryDet.First;
   While Not qryDet.Eof Do
      Begin
          qryDet.Delete;
      End;
   Inherited;
End;
Procedure TFrmCadProcesso.CmeCadastroFind(Sender: TObject);
Begin
    Inherited;
    If MontaSelect.RetornouValor Then
       SelMestreDet(StrToInt(MontaSelect.ValoresChave[0]));
End;

Procedure TFrmCadProcesso.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
    Accept := True;
    If Trim(edNome.Text) = '' Then
       Begin
           MsgDlg('Nome do Processo não preenchido','Erro',mtError,[mbOK],0);
           edNome.SetFocus;
           Accept := False;
       End
    Else
    If Trim(dblcGrpProc.Text) = '' Then
       Begin
           MsgDlg('Grupo de Processo não preenchido','Erro',mtError,[mbOK],0);
           dblcGrpProc.SetFocus;
           Accept := False;
       End
    Else
    If (qry.State = dsInsert ) And ( VerifNome(edNome.Text) )  Then
       Begin
           MsgDlg('Nome do Processo :'+edNome.Text+' já Exite','Erro',mtError,[mbOK],0);
           edNome.SetFocus;
           Accept := False;
       End
    Else
    If Trim(dblcGrpInst.Text) = '' Then
       Begin
           MsgDlg('Grupo para criar processo não preenchido','Erro',mtError,[mbOK],0);
           dblcGrpInst.SetFocus;
           Accept := False;
       End
    Else
    If Trim(dblcGrpResp.Text) = '' Then
       Begin
           MsgDlg('Gestor de processo não preenchido','Erro',mtError,[mbOK],0);
           dblcGrpResp.SetFocus;
           Accept := False;
       End
    Else
    If Trim(dblcGrpConsulta.Text) = '' Then
       Begin
           MsgDlg('Grupo Autorizado disponível para consulta não preenchido','Erro',mtError,[mbOK],0);
           dblcGrpConsulta.SetFocus;
           Accept := False;
       End;
End;

Procedure TFrmCadProcesso.CmeCadastroConfirma(Sender: TObject);
Begin
    if qry.State in [dsInsert,dsEdit] Then
        Begin
           qry.FieldByName('NUMDIASPREVISTO').AsInteger := spNDias.Value;
           AplicaAlteracoes([qry,qrydet]);
           if bInsert Then
             SelMestreDet(-1);
        End
    else
        AplicaAlteracoes([qrydet,qry]);
    inherited;
End;

Procedure TFrmCadProcesso.CmeDetalheInsert(Sender: TObject);
Begin
   inherited;
    qryDetFLGINICIAL.AsString := 'N';
    qryDetFLGFINAL.AsString   := 'N';
    spNdiaEtapa.Value := 1;
    dblcEtapa.SetFocus;
End;

Procedure TFrmCadProcesso.CmeDetalheEdit(Sender: TObject);
Begin
   inherited;
   spNDiaEtapa.Value := qryDetNUMDIASPREVISTO.AsInteger; 
   dblcEtapa.SetFocus;
End;

Procedure TFrmCadProcesso.CmeDetalheDelete(Sender: TObject);
Begin
  If MsgDlg('Confirma a exclusão do Processo','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
    inherited;
End;

Procedure TFrmCadProcesso.CmeDetalheConfirma(Sender: TObject);
Begin
 If (qryDet.State in [dsInsert,dsEdit]) Then
   Begin
      If Trim(dblcEtapa.Text) = '' Then
         Begin
            MsgDlg('Etapa não foi preenchido','Erro',mtError,[mbOK],0);
            dblcEtapa.SetFocus;
         End
      Else
    If Trim(dblcModulo.Text) = '' Then
       Begin
           MsgDlg('Sistema não preenchido','Erro',mtError,[mbOK],0);
           dblcModulo.SetFocus;
       End
      Else
         Begin
            qryDetNUMDIASPREVISTO.AsInteger := spNDiaEtapa.Value;
            qryDetIDTIPOPROCESSO.AsInteger  := qryIDTIPOPROCESSO.AsInteger;
            qryDetDESCETAPA.AsString        := dblcEtapa.Text;
            qryDetNOMEMODULO.AsString       := dblcModulo.Text;
            Inherited;
         End;
   End
 Else
   inherited;
End;

procedure TFrmCadProcesso.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  If bInsert Then
    SelMestreDet(-1);
end;

procedure TFrmCadProcesso.dblcModuloCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if (Trim(dblcModulo.Text) <> '') And ( modified ) Then
    Begin
        qryWkFlow.Close;
        qryWkFlow.Params[0].AsInteger := StrToInt(dblcModulo.LookUpValue);
        qryWkFlow.Open;
    End;
end;

procedure TFrmCadProcesso.FormCreate(Sender: TObject);
begin
  inherited;
  SelMestreDet(-1);
  If FazQuery(DtmBaseDados.qry,'SELECT MASCGRUPOPROD FROM PARALMOX WHERE (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')')
  Then
    sMascGrupo := DtmBaseDados.qry.FieldByName('MASCGRUPOPROD').asString
  Else
    sMascGrupo := '';

end;

Function TFrmCadProcesso.VerifNome( s : String ) : Boolean;
Begin
    Result := FazQuery(DtmBaseDados.qry,'SELECT NOME FROM RADTIPOPROCESSO WHERE ( UPPER(NOME) = '''+Trim( AnsiUpperCase( S ) )+''')');
End;

procedure TFrmCadProcesso.edGaruGrpExit(Sender: TObject);
begin
  inherited;
end;

procedure TFrmCadProcesso.CmeDetalheAfterConfirma(Sender: TObject);
begin
  inherited;
  Try
     StartTransacao;
     if not Sistema.GravaLogOperacoes('Cadastro de Tipo de Processos',False) then Abort;
     CommitTransacao;
  Except
     RollBackTransacao;
  End;
end;

end.
