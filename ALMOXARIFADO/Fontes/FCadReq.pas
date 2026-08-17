unit FCadReq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, DBCtrls, 
  TREdit, IvDictio, IvMulti, IvEMulti, Mask, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TFrmCadReq = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    udpDet: TUpdateSQL;
    qryDetNUMREQUISICAO: TFloatField;
    qryDetCODARTIGO: TStringField;
    qryDetCODMEDIDA: TStringField;
    qryDetVALORUN: TFloatField;
    qryDetQTDEPEDIDA: TFloatField;
    qryDetQTDEPENDENTE: TFloatField;
    lbALmox: TLabel;
    qryDetDESCRICAO: TStringField;
    qryNUMREQUISICAO: TFloatField;
    qryIDUSUARIOINCLUSAO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDEMPRESA: TFloatField;
    qryCODCENTROCUSTO: TStringField;
    qryCODALMOXAORIGEM: TFloatField;
    qryCUSTOTRANSF: TStringField;
    qryDATAEMISSAO: TDateTimeField;
    qryREQATENDIDA: TStringField;
    qryDATANECESSIDADE: TDateTimeField;
    qryIMPRESSO: TStringField;
    qryCODALMOXADESTINO: TFloatField;
    qryAlmox: TwwQuery;
    GrpDatas: TGroupBox;
    edAlmox: TEdit;
    edDataEmi: TCMDateTimePicker;
    edDataNec: TCMDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    RgTipoMov: TDBRadioGroup;
    qryArtigo: TwwQuery;
    dblcItem: TwwDBLookupCombo;
    dblcDesc: TwwDBLookupCombo;
    dblcUN: TwwDBLookupCombo;
    Label9: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    edValb: TRealEdit;
    Label12: TLabel;
    edQtde: TDBRealEdit;
    qryUnidMed: TwwQuery;
    qryUnidMedCODMEDIDA: TStringField;
    qryUnidMedDESCMEDIDA: TStringField;
    qryCusto: TwwQuery;
    qryDetVALOR: TFloatField;
    dbUn: TDBEdit;
    dsArtigo: TwwDataSource;
    Label1: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    Label13: TLabel;
    DBRealEdit1: TDBRealEdit;
    edSaldo: TRealEdit;
    qryIDPROCESSO: TFloatField;
    qryUnidNegoc: TwwQuery;
    Label14: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    qryUNIDNEGOC2: TFloatField;
    qryOBS: TStringField;
    TabObs: TTabSheet;
    DBMemo1: TDBMemo;
    Label15: TLabel;
    DBMemo2: TDBMemo;
    qryDetOBS: TStringField;
    Label3: TLabel;
    edNumReq: TDBEdit;
    Label2: TLabel;
    edValTot: TRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure RgTipoMovClick(Sender: TObject);
    procedure dblcDescCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcItemCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edQtdeExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblcAlmoxExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheDelete(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure edDataEmiExit(Sender: TObject);
  private
    { Private declarations }
    Procedure SelMestreDet( n : LongInt );
    Procedure SelUnid( S : String );
    Procedure SelSaldo( S : String );
    Function  SelCusto( S : String ): Double;
    procedure TrocaCaption;

  public
    { Public declarations }
  end;

var
  FrmCadReq : TFrmCadReq;
  rQtde     : Double;
  rValTot   : Double;
  rAux      : Double;
  iIdTipoProcesso : LongInt;
  sGrupoProd      : String;
  iGrauGrupo      : Integer;

implementation

{$R *.DFM}

Uses uModulo, uSistema, uDataBase, uMensErro, uString, dBaseDados,
     UConversaoMed, uMovNew, uRAD, uFuncaoGeral;


procedure TFrmCadReq.CmeCadastroInsert(Sender: TObject);
Begin
  selMestreDet( -1 );
  inherited;
  rValTot        := 0;
  edValTot.Value := 0;


  sGrupoProd     := '';
  qry.FieldByName('CUSTOTRANSF').asString       := 'C';
  qry.FieldByName('DATAEMISSAO').asDateTime     := Date;
  qry.FieldByName('DATANECESSIDADE').asDateTime := Date;
  TrocaCaption;
  edDataEmi.Date := Date;
  edDataNec.Date := Date;
  dblcAlmox.SetFocus;
End;

Procedure TFrmCadReq.CmeCadastroDelete(Sender: TObject);
Begin
    With qryDet do
       Begin
          First;
          While Not Eof do
            Begin
               Delete;
            End;
       End;
    inherited;
    edValTot.Value := 0;
End;

Procedure TFrmCadReq.CmeCadastroConfirma(Sender: TObject);
Begin
    With qry Do
       Begin
         if State in [dsInsert,dsEdit] Then
           Begin
               If State = dsInsert Then
                  FieldByName('NUMREQUISICAO').asInteger := LeUltRegistro(nil,'REQMAT');
               FieldbyName('CODALMOXADESTINO').asInteger  := Modulo.iCodAlmoxa;
               FieldByName('IDUSUARIOINCLUSAO').asinteger := Sistema.IdUsuario;
               FieldByName('IDPESSOA').asInteger          := Sistema.IdEmpresa;
               FieldByName('IDEMPRESA').asInteger         := Sistema.IdEmpresa;
               FieldByName('REQATENDIDA').asString        := 'F';
               FieldByName('IMPRESSO').asString           := 'F';
               FieldByName('CODCENTROCUSTO').AsString     :=  Modulo.sCodCCusto;
               If Trim(dblcAtiv.Text) = '' Then
                  FieldByName('UNIDNEGOC').asInteger      := Modulo.iUnidadeNegocPadrao;
               If qryDet.State in [dsInsert,dsEdit] Then
                  qryDet.Cancel;
               qryDet.First;
               While Not qryDet.Eof Do
                  Begin
                     qryDet.edit;
                     qryDet.FieldByName('NUMREQUISICAO').asInteger := qry.FieldByName('NUMREQUISICAO').asInteger;
                     qryDet.Next;
                  End;
            Try
               StartTransacao;
               If ( Sistema.UsaRAD ) And (iIdTipoProcesso > 0) and (State in [dsInsert]) Then
                  Begin
                     Rad.TipoProcesso    := iIdTipoProcesso;
                     Rad.IdPessoa        := Sistema.IdEmpresa;
                     if FieldByName('CUSTOTRANSF').AsString = 'T' then
                        Rad.CodCentroCusto  := Modulo.sCCustoAlmoxa
                     else
                        Rad.CodCentroCusto  := Modulo.sCodCCusto;
                     Rad.IdEmpresa       := Sistema.IdEmpresa;
                     Rad.OBS             := 'Requisição Número : '+FieldByName('NUMREQUISICAO').AsString;
                     Rad.Valor           := edValTot.Value;
                     Rad.CodGrupoProd    := sGrupoProd;
                     //
                     FieldByName('IDPROCESSO').AsInteger :=  Rad.IniciarProcesso;
                     if FieldByName('IDPROCESSO').AsInteger < 0 Then
                     Begin
                        MsgDlg('Erro ao tentar instanciar o processo no R.A.D.','Erro',mtError,[mbOK],0);
                        Abort;
                     End
                  End;
               qry.ApplyUpdates;
               qrydet.ApplyUpdates;
               CommitTransacao;
               MsgDlg('Nº da Requisição '+FieldByName('NUMREQUISICAO').AsString,'Informação',mtInformation,[mbOk],0);
            Except
               RollBackTransacao;
               Raise;
            End;
           End
       else
           AplicaAlteracoes([qrydet,qry]);
     End;
    inherited;
End;

Procedure TFrmCadReq.CmeDetalheInsert(Sender: TObject);
Begin
   inherited;
   dblcItem.SetFocus;
   edValb.Value  := 0;
   edSaldo.Value := 0;
   dbUn.Clear;
End;

Procedure TFrmCadReq.CmeDetalheDelete(Sender: TObject);
Begin
  If MsgDlg('Confirma a exclusão do item','Exclusão',mtConfirmation,[mbOk,mbcancel],0) = mrOk Then
     Begin
         rValTot := rValTot - qryDet.FieldByName('VALOR').asFloat;
         edValTot.Value := rValTot;
         inherited;
     End;
End;

Procedure TFrmCadReq.CmeDetalheEdit(Sender: TObject);
Begin
    inherited;
    SelSaldo(dblcItem.LookUpValue);
    SelUnid(dblcItem.LookUpValue );
    edQtdeExit( Self );
    rAux := qryDet.FieldByName('VALOR').asFloat;
    dblcItem.SetFocus;
End;

Procedure TFrmCadReq.CmeDetalheConfirma(Sender: TObject);
Var
  Tam : Integer;
Begin
   If qryDet.State in [dsInsert,dsEdit] Then
       Begin
             If RgTipoMov.ItemIndex = 1 then
                Begin
                   If (Modulo.sIntegraContab = 'S') And (Not Modulo.Verifcc(dblcItem.LookUpValue,Modulo.sCodCCusto,Sistema.IdEmpresa)) Then
                      Begin
                         MsgDlg('Este Centro de Custo não pode requisitar este produto','Erro',mtError,[mbOk],0);
                         dblcItem.SetFocus;
                         Exit;
                      End;
                End
             Else
                Begin
                  If (Modulo.sIntegraContab = 'S') And (Not Modulo.Verifcc(dblcItem.LookUpValue,Modulo.sCCustoAlmoxa,Sistema.IdEmpresa )) Then
                    Begin
                       MsgDlg('Este Almoxarifado não pode requisitar este produto','Erro',mtError,[mbOk],0);
                       dblcItem.SetFocus;
                       Exit;
                    End;
                End;
          If (Modulo.SFlgReqSemSaldo = 'N') And (edSaldo.Value = 0) Then
               Begin
                   MsgDlg('Almoxarifado não possui saldo. Proibído requisitar','Erro',mtError,[mbOK],0);
                   dblcItem.SetFocus;
                   Exit;
               End;
          If trim(dblcItem.text) = '' Then
               Begin
                   MsgDlg('Item não foi preenchida','Erro',mtError,[mbOK],0);
                   dblcItem.SetFocus;
                   Exit;
               End;
          If trim(dblcUN.text) = '' Then
               Begin
                   MsgDlg('Unidade não foi preenchida','Erro',mtError,[mbOK],0);
                   dblcUN.SetFocus;
                   Exit;
               End;
          If edQtde.Value = 0 Then
               Begin
                   MsgDlg('quantidade não foi preenchida','Erro',mtError,[mbOK],0);
                   edQtde.SetFocus;
                   Exit;
               End;
               If ( Sistema.UsaRAD ) and (iIdTipoProcesso > 0) Then
                 Begin
                    If Trim(sGrupoProd) = '' then
                       sGrupoProd := Modulo.LeGrupoProd(dblcItem.LookupValue)
                    Else
                       Begin
                           If iGrauGrupo > 0 Then
                              Begin
                                 Tam := FuncaoGeral.CalcNumEleGrau(Modulo.sMascaraGrupoProd,iGrauGrupo);
                                 If Copy(sGrupoProd,1,Tam) <> Copy(Modulo.LeGrupoProd(dblcItem.LookupValue),1,Tam) Then
                                    Begin
                                       MsgDlg('Este produto é de um grupo diferente dos outros produtos selecionados','Erro',mtError,[mbOK],0);
                                       dblcItem.SetFocus;
                                       Exit;
                                    End;
                              End
                           Else
                              Begin
                                 If sGrupoProd <> Modulo.LeGrupoProd(dblcItem.LookupValue) Then
                                   Begin
                                       MsgDlg('Este produto é de um grupo diferente dos outros produtos selecionados','Erro',mtError,[mbOK],0);
                                       dblcItem.SetFocus;
                                       Exit;
                                   End;
                              End;
                       End;
                 End;
           With qryDet Do
              Begin
                  FieldByName('QTDEPENDENTE').asFloat := edQtde.Value;
                  FieldByName('VALOR').asFloat        := edValb.Value;
                  FieldByName('DESCRICAO').asString   := dblcDesc.Text;
              End;
              If qryDet.State = dsInsert Then
                 rValTot := rValTot + qryDet.FieldByName('VALOR').asFloat
              Else
                Begin
                  rValTot := rValTot - rAux;
                  rValTot := rValTot + qryDet.FieldByName('VALOR').asFloat;
                End;
            edValTot.Value := rValTot;
       End;
    inherited;
End;

Procedure TFrmCadReq.CmeCadastroFind(Sender: TObject);
Begin
    inherited;
    If MontaSelect.RetornouValor Then
       Begin
            rValTot := 0;
            SelMestreDet( StrToInt(MontaSelect.ValoresChave[0]) );
            qryDet.First;
            While Not qryDet.EOF Do
               Begin
                   rValTot := rValTot + qryDet.FieldByName('VALORUN').asFloat * qryDet.FieldByName('QTDEPEDIDA').asFloat;
                   qryDet.Next;
               End;
            edValTot.Value := rValTot;
            TrocaCaption;
       End;
End;

Procedure TFrmCadReq.SelMestreDet( n : LongInt );
Begin
    // Abrindo Mestre
    qry.Close;
    qry.ParamByName('pNUMREQ').asInteger := n;
    qry.Open;
    // Abrindo Detalhe
    qryDet.Close;
    qryDet.ParamByName('pNUM').asInteger := n;
    qryDet.Open;
End;

Procedure TFrmCadReq.SelUnid( S : String );
Begin
    qryUnidMed.Close;
    qryUnidMed.Params[0].asString := Copy(s,1,6);
    qryUnidMed.Open;
End;

Procedure TFrmCadReq.SelSaldo( S : String );
Begin
    edSaldo.Value := MovNew.InfoSaldo( Trim( s ),StrToInt( dblcAlmox.LookUpValue ),edDataEmi.Date );
End;

procedure TFrmCadReq.FormCreate(Sender: TObject);
begin
  inherited;
  edAlmox.Text   := Modulo.sAlmoxaUsuario;
  edDataNec.Date := Date;
  edDataEmi.Date := Date;
  // Usa Grupo de Produto x Usuários -----------------------------------------------------------------------------
  If Modulo.sFlgUsaGrupoReq = 'S' Then
     Begin
        qryArtigo.Close;
        qryArtigo.Sql.Clear;
        qryArtigo.Sql.Add(' SELECT                                                   ');
        qryArtigo.Sql.Add('      U.CODARTIGO,                                        ');
        qryArtigo.Sql.Add('      U.CODMEDCUSTO,                                      ');
        qryArtigo.Sql.Add('      U.DESCRICAO                                         ');
        qryArtigo.Sql.Add(' FROM                                                     ');
        qryArtigo.Sql.Add(' (                                                        ');
        qryArtigo.Sql.Add(' SELECT                                                   ');
        qryArtigo.Sql.Add('        A.CODARTIGO,                                      ');
        qryArtigo.Sql.Add('        P.CODMEDCUSTO,                                    ');
        qryArtigo.Sql.Add('       (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO) AS DESCRICAO');
        qryArtigo.Sql.Add(' FROM                                                     ');
        qryArtigo.Sql.Add('        ARTIGO A,                                         ');
        qryArtigo.Sql.Add('        PRODUTO P                                         ');
        qryArtigo.Sql.Add(' WHERE                                                    ');
        qryArtigo.Sql.Add('        (((A.FLGBLOQUEADO <> ''R'') AND (A.FLGBLOQUEADO <> ''A'')) OR (A.FLGBLOQUEADO IS NULL))');
        qryArtigo.Sql.Add('    AND ( A.CODPRODUTO = P.CODPRODUTO)                    ');
        qryArtigo.Sql.Add('    AND (NOT EXISTS (SELECT 1 FROM USUXGRUPPROD           ');
        qryArtigo.Sql.Add('                     WHERE  (IDUSUARIO = '+IntToStr(Sistema.IdUsuario)+')  ');
        qryArtigo.Sql.Add('                        AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+'))) ');
        qryArtigo.Sql.Add(' UNION ALL               ');
        qryArtigo.Sql.Add('   SELECT                ');
        qryArtigo.Sql.Add('        A.CODARTIGO,     ');
        qryArtigo.Sql.Add('        P.CODMEDCUSTO,   ');
        qryArtigo.Sql.Add('        (P.DESCPROD || '' '' || A.CODTAMANHO || '' '' || A.CODCOR)  AS DESCRICAO ');
        qryArtigo.Sql.Add('   FROM                   ');
        qryArtigo.Sql.Add('       ARTIGO A,          ');
        qryArtigo.Sql.Add('       PRODUTO P,         ');
        qryArtigo.Sql.Add('       USUXGRUPPROD UXG   ');
        qryArtigo.Sql.Add('   WHERE                  ');
        qryArtigo.Sql.Add('           (((A.FLGBLOQUEADO <> ''R'')  AND (A.FLGBLOQUEADO <> ''A'')) OR (A.FLGBLOQUEADO IS NULL))');
        qryArtigo.Sql.Add('       AND (IDUSUARIO = '+IntToStr(Sistema.IdUsuario)+')  ');
        qryArtigo.Sql.Add('       AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')   ');
        qryArtigo.Sql.Add('       AND (P.CODGRUPOPROD = UXG.CODGRUPOPROD)            ');
        qryArtigo.Sql.Add('       AND (A.CODPRODUTO = P.CODPRODUTO )                 ');
        qryArtigo.Sql.Add(' ) U   ');
        qryArtigo.Sql.Add(' ORDER BY U.DESCRICAO ');
     End
  Else
     Begin
        qryArtigo.Close;
        qryArtigo.Sql.Clear;
        qryArtigo.Sql.Add(' SELECT                                                   ');
        qryArtigo.Sql.Add('        A.CODARTIGO,                                      ');
        qryArtigo.Sql.Add('        P.CODMEDCUSTO,                                    ');
        qryArtigo.Sql.Add('       (P.DESCPROD || '' '' || A.CODCOR || '' '' || A.CODTAMANHO) AS DESCRICAO');
        qryArtigo.Sql.Add(' FROM                                                     ');
        qryArtigo.Sql.Add('        ARTIGO A,                                         ');
        qryArtigo.Sql.Add('        PRODUTO P                                         ');
        qryArtigo.Sql.Add(' WHERE                                                    ');
        qryArtigo.Sql.Add('        (((A.FLGBLOQUEADO <> ''R'') AND (A.FLGBLOQUEADO <> ''A'')) OR (A.FLGBLOQUEADO IS NULL))');
        qryArtigo.Sql.Add('    AND ( A.CODPRODUTO = P.CODPRODUTO)                    ');
        qryArtigo.Sql.Add(' ORDER BY DESCRICAO ');
     End;
   qryArtigo.Open;
  //--------------------------------------------------------------------------------------------------------------
  SelMestreDet( -1 );
  MontaSelect.Filtro.Add('REQMAT.IDPESSOA = '+ IntToStr(Sistema.idEmpresa));
  MontaSelect.Filtro.Add('REQMAT.CODALMOXADESTINO = '+ IntToStr(Modulo.iCodAlmoxa));
  MontaSelect.Filtro.Add('RTRIM(REQMAT.CODCENTROCUSTO) = '''+Trim(Modulo.sCodCCusto)+'''');
  //
  qryAlmox.Close;
  qryAlmox.ParamByName('pCODALMOX').asInteger  := Modulo.iCodAlmoxa;
  qryAlmox.ParamByName('pIDUSUARIO').asInteger := Sistema.IdUsuario;
  qryAlmox.ParamByName('pIDPESSOA').asInteger  := Sistema.IdEmpresa;
  qryAlmox.Open;
  //
  qryUnidNegoc.Close;
  qryUnidNegoc.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryUnidNegoc.Open;
  //
  rQtde          := 0;
  rValTot        := 0;
  edValTot.Value := 0;
  rAux           := 0;
  //
  iIdTipoProcesso := -1;
  IGrauGrupo      := -1;
  If Sistema.UsaRAD Then
     Begin
         Rad := TRad.Create;
         If Fazquery(DtmBaseDados.qry,'SELECT IDTIPOPROCESSO,GRAUGRUPPROD FROM RADTIPOPROCESSO WHERE (IDREFERENCIA = 11)') Then
            Begin
                iIdTipoProcesso := DtmBaseDados.qry.FieldByName('IDTIPOPROCESSO').asInteger;
                iGrauGrupo      := DtmBaseDados.qry.FieldByName('GRAUGRUPPROD').asInteger;
            End;
     End;

end;

procedure TFrmCadReq.RgTipoMovClick(Sender: TObject);
begin
  inherited;
  TrocaCaption;
end;

procedure TFrmCadReq.dblcDescCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
     Begin
        dblcItem.LookUpValue := dblcDesc.LookUpValue;
        dblcDesc.LookUpValue := dblcItem.LookUpValue;
        SelSaldo( dblcDesc.LookUpValue );
        SelUnid(dblcDesc.LookUpValue );
     End;
end;

procedure TFrmCadReq.dblcItemCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
    Begin
       dblcDesc.LookUpValue := dblcItem.LookUpValue;
       dblcItem.LookUpValue := dblcDesc.LookUpValue;
       SelSaldo(dblcItem.LookUpValue);
       SelUnid(dblcItem.LookUpValue );
    End;
end;

procedure TFrmCadReq.edQtdeExit(Sender: TObject);
begin
  inherited;
     rQtde := ConversaoMed.ConverteSaldoQtde(dblcItem.LookUpValue,
                                             dblcUn.LookUpValue,
                                             dbUn.Text,
                                             edQtde.Value);
     edValB.Value := SelCusto(dblcItem.LookUpValue);
end;

Function TFrmCadReq.SelCusto( s : String ) : Double;
Begin
  qryCusto.Close;
  qryCusto.ParamByName('pCODART').asString   := S;
  qryCusto.ParamByName('pCODCUST').asInteger := qryAlmox.FieldByName('CODCUSTEIO').AsInteger;
  qryCusto.Open;
  qryDet.FieldByName('VALORUN').AsFloat := qryCusto.FieldByName('CUSTOMEDIO').AsFloat;
  SelCusto := qryCusto.FieldByName('CUSTOMEDIO').AsFloat * rQtde;
End;

procedure TFrmCadReq.bbtnConfirmarClick(Sender: TObject);
begin
   If trim(dblcAlmox.Text) = '' Then
      Begin
         MsgDlg('Almoxarifado origem não foi preenchido','Erro',mtError,[mbOk],0);
         dblcAlmox.SetFocus;
         exit;
       End;
   If qryDet.IsEmpty Then
       Begin
         MsgDlg('Não há itens cadastrado','Erro',mtError,[mbOK],0);
         exit;
       End;
   If edDataNec.Date < edDataEmi.Date Then
      Begin
         MsgDlg('Data de necessidade menor que a data de emissão','Erro',mtError,[mbOK],0);
         edDataNec.SetFocus;
         exit;
       End;
  inherited;
end;

procedure TFrmCadReq.dblcAlmoxExit(Sender: TObject);
begin
  inherited;
  If ActiveControl.Tag <> 999 Then
    Begin
       If Trim(dblcAlmox.Text) = '' Then
         Begin
           MsgDlg('Almoxarifado Origem não preenchido','Erro',mtError,[mbOK],0);
           dblcAlmox.SetFocus;
         End;
    End;
end;

procedure TFrmCadReq.TrocaCaption;
begin
  Case RgTipoMov.ItemIndex Of
       0 : Begin
              lbAlmox.Caption := 'Almoxarifado Destino';
              edAlmox.Text    := Modulo.sAlmoxaUsuario;
              qryAlmox.Close;
              qryAlmox.ParamByName('pCODALMOX').asInteger  := Modulo.iCodAlmoxa;
              qryAlmox.ParamByName('pIDUSUARIO').asInteger := Sistema.IdUsuario;
              qryAlmox.ParamByName('pIDPESSOA').asInteger  := Sistema.IdEmpresa;
              qryAlmox.Open;
           End;
       1 : Begin
              lbAlmox.Caption := 'Centro de Custo Destino';
              edAlmox.Text    :=  Modulo.sDescCCusto;
              qryAlmox.Close;
              qryAlmox.ParamByName('pCODALMOX').asInteger  := -1;
              qryAlmox.ParamByName('pIDUSUARIO').asInteger := Sistema.IdUsuario;
              qryAlmox.ParamByName('pIDPESSOA').asInteger  := Sistema.IdEmpresa;
              qryAlmox.Open;
           End;
    End;
end;

procedure TFrmCadReq.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  If Sistema.UsaRAD Then
     Rad.Free;
end;

procedure TFrmCadReq.edDataEmiExit(Sender: TObject);
begin
  inherited;
  If edDataEmi.Date > Date Then
    Begin
        MsgDlg('Data da requisição não pode ser maior que a data de hoje','Erro',mtError,[mbOk],0);
        edDataEmi.SetFocus;
    End;
end;

end.
