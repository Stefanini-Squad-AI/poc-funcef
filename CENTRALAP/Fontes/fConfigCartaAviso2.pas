unit fConfigCartaAviso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConfigRelatorio, ppClass, ppBands, ppProd, ppReport, ppComm, ppCache,
  ppDB, ppDBBDE, Db, Menus, ppEndUsr, IvDictio, IvMulti, IvEMulti,
  MontaSelect, DBTables, Wwdatsrc, Wwquery, MAHlpBtn, TB97Ctls, TB97Tlbr,
  TB97, StdCtrls, Buttons, Mask, wwdbedit, wwdblook, CMDBLookupCombo,
  ExtCtrls, TREdit, ppRelatv, ppDBPipe, CmEventosCadastro, ImgList, dBaseDados;

type
  TfrmConfigCartaAviso2 = class(TFrmConfigRelatorio)
    QryCadModeloIDCARTACOBRANCA: TFloatField;
    QryCadModeloMODELOCARTA: TStringField;
    QryCadModeloIDREPORTS: TFloatField;
    QryCadModeloORIGEMCM: TFloatField;
    QryCadModeloFLGTIPOCARTA: TStringField;
    GpRubs: TGroupBox;
    EdtRubIni: TRealEdit;
    EdtRubFin: TRealEdit;
    CkbEmAtraso: TCheckBox;
    qryIDCARTACOBRANCA: TFloatField;
    qryMODELOCARTA: TStringField;
    qryIDREPORTS: TFloatField;
    qryORIGEMCM: TFloatField;
    qryFLGTIPOCARTA: TStringField;
    QryDadosIDPARTICIPANTE: TFloatField;
    QryDadosPARTICIPANTE: TStringField;
    QryDadosNOMESOLICITANTE: TStringField;
    QryDadosIDRUB: TFloatField;
    QryDadosMATRICULA: TStringField;
    QryDadosINSCRICAO: TFloatField;
    QryDadosDATAINSCRICAO: TDateTimeField;
    QryDadosADMISSAO: TDateTimeField;
    QryDadosIDPATROCINADORA: TFloatField;
    QryDadosPATROCINADORA: TStringField;
    QryDadosIDPLANO: TFloatField;
    QryDadosPLANO: TStringField;
    QryDadosNOME_DO_PAI: TStringField;
    QryDadosNOME_DA_MAE: TStringField;
    QryDadosDATA_MORTE: TDateTimeField;
    QryDadosDATA_NASCIMENTO: TDateTimeField;
    QryDadosSEXO: TStringField;
    QryDadosTIPO_SANGUINIO: TStringField;
    QryDadosESTADO_CIVIL: TStringField;
    QryDadosNUMERO_DEPENDENTE_IRRF: TFloatField;
    QryDadosNUMERO_DEPENDENTES_SALFAMILIA: TFloatField;
    QryDadosNUMERO_DEPENDENTES: TFloatField;
    QryDadosISENTO_IRRF: TFloatField;
    QryDadosENDERECO: TStringField;
    QryDadosNUMERO: TStringField;
    QryDadosCOMPLEMENTO: TStringField;
    QryDadosESTADO: TStringField;
    QryDadosBAIRRO: TStringField;
    QryDadosCIDADE: TStringField;
    QryDadosCEP: TStringField;
    CkbPendentes: TCheckBox;
    Bevel1: TBevel;
    procedure CkbEmAtrasoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GravaEmissaoCarta(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
    iIdRubs :LongInt;
    iPosFiltro :Integer;
  public
    { Public declarations }
    bAplicaAlteracoesRubs :Boolean;
    procedure InsereQryPrincipal; Override;
    Procedure AbreQueryDados; Override;
    Procedure HabilitaImpressao(bImprime:Boolean); Override;
  end;

var
  frmConfigCartaAviso2: TfrmConfigCartaAviso2;

implementation

Uses uMensErro, uSistema, uDataBase, uRubs, datend;

{$R *.DFM}

Procedure TfrmConfigCartaAviso2.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If MontaSelect.RetornouValor Then
  Begin
      With Qry Do
      Begin
        If Active Then Close;
        If Not Prepared Then Prepare;
        Params[0].AsInteger := StrToIntDef(MontaSelect.ValoresChave[0],0);
        Open;
      End;
  End;
End;

procedure TfrmConfigCartaAviso2.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  If DeRelatorio.CanFocus Then DeRelatorio.SetFocus;
End;

procedure TfrmConfigCartaAviso2.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If DeRelatorio.CanFocus Then DeRelatorio.SetFocus;
End;

procedure TfrmConfigCartaAviso2.InsereQryPrincipal;
Begin
  QryIdCartaCobranca.AsFloat := LeUltRegistro(nil,'CARTACOBRANCA');
  QryIDREPORTS.AsInteger     := LeUltRegistro(nil,'REPORTS');
  QryORIGEMCM.AsInteger      := 0;
  QryFlgTipoCarta.AsString   := 'X';
End;

Procedure TfrmConfigCartaAviso2.AbreQueryDados;
Var
  sFiltro :String;
Begin
  Inherited;
  sFiltro := '';

  With QryDados Do
  Begin
    If Active Then Close;
    If Not Prepared Then Prepare;
    If iIdRubs = 0 Then
    Begin
       If CkbEmAtraso.Checked Then
          sFiltro := ' (R.FLGSTATUS IN (''2'',''4'')) AND '
       Else
       Begin
          If EdtRubIni.Value > 0 Then
             sFiltro := ' (R.IDRUBS >= ' + EdtRubIni.Text + ') AND ';

          If EdtRubFin.Value > 0 Then
             sFiltro := sFiltro + ' (R.IDRUBS <= ' + EdtRubFin.Text + ') AND ';

          If CkbPendentes.Checked Then //Pendentes são as emitidas e reemitidas
             sFiltro := sFiltro + ' (R.FLGSTATUS IN  (''2'',''4'')) AND '
          Else //Todas menos as encerradas e canceladas
             sFiltro := sFiltro + ' (R.FLGSTATUS NOT IN  (''5'',''7'')) AND ';
       End;
    End
    Else
      sFiltro := '(R.IDRUBS = -1) AND ';

    Sql.Delete(iPosFiltro);
    Sql.Insert(iPosFiltro,sFiltro);
    Open;
  End;
End;

Procedure TfrmConfigCartaAviso2.HabilitaImpressao(bImprime:Boolean);
Begin
  Inherited;
  If bImprime Then
  Begin
    Height := 240;
    width := 460;
    iIdRubs := 0;
    CkbEmAtrasoClick(Self);
  End
  Else
  Begin
     Height := 225;
     width := 570;
     iIdRubs := -1;
  End;
End;

procedure TfrmConfigCartaAviso2.CkbEmAtrasoClick(Sender: TObject);
begin
  inherited;
  If CkbEmAtraso.Checked Then
  Begin
     GpRubs.Enabled := False;
     GpRubs.Font.Color := clGray;
  End
  Else
  Begin
     GpRubs.Enabled := True;
     GpRubs.Font.Color := ClBlack;
  End;
end;

procedure TfrmConfigCartaAviso2.FormCreate(Sender: TObject);
begin
  inherited;
  iPosFiltro := QryDados.Sql.IndexOf('--#ADF1');
  bAplicaAlteracoesRubs:= True;
end;

procedure TfrmConfigCartaAviso2.GravaEmissaoCarta(Sender: TObject);
Begin
   If (BtnImprime.Visible) And (Application.MessageBox('As cartas foram impressas corretamente?','Atendimento',Mb_YesNo + Mb_IConQuestion) = Id_Yes) Then
   Begin
      Try
        //*** tavares 02/08/2002
        if not dtmBaseDados.dbBaseDados.InTransaction then
           StartTransacao;
        //***
        QryDados.First;
        While Not QryDados.Eof Do
        Begin
          Rubs.IdRubs := QryDadosIDRUB.AsInteger;
          Rubs.StatusRubs := srCartaEnviada;
          Rubs.Historico.Descricao := 'Modelo de Carta enviado: ' + CmbModelo.Text;
          Rubs.Edit;
          QryDados.Next;
        End;
        CommitTransacao;
      Except
        RollbackTransacao;
        Raise;
      End;
   End;
End;

End.
