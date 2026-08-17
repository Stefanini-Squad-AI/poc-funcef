unit FCadRegHon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  Wwtable, DBCtrls, Mask, TREdit, wwdbedit,
  wwdblook, CMProcuraSubTipo, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TfrmCadRegHon = class(TfrmCadMestreDetalheCS)
    qryHonor: TwwQuery;
    UpdHonor: TUpdateSQL;
    qryAdvog: TwwQuery;
    Label5: TLabel;
    dbedDataPgto: TCMDateTimePicker;
    Label7: TLabel;
    dblcFavor: TwwDBLookupCombo;
    Label8: TLabel;
    qryHonorNUMPROCTRAB: TFloatField;
    qryHonorDATAPAGTOHONOR: TDateTimeField;
    qryHonorIDFORNSERV: TFloatField;
    qryHonorVALORHONOR: TFloatField;
    qryHonorNOME: TStringField;
    qryTipoDesemb: TwwQuery;
    qryTipoDoc: TwwQuery;
    qryDocumentos: TwwQuery;
    qryDocumentosCODTIPRECDES: TStringField;
    qryDocumentosCODDOCUMENTO: TFloatField;
    qryDocumentosPLANO: TFloatField;
    qryDocumentosPLACONTA: TStringField;
    qryDocumentosPLNCODIGO: TFloatField;
    qryDocumentosNUMLANCTO: TFloatField;
    qryDocumentosUNIDNEGOC: TFloatField;
    qryDocumentosCODCENTRORESPON: TStringField;
    qryDocumentosVALOR: TFloatField;
    qryDocumentosCODPORTFORMA: TFloatField;
    qryDocumentosDEBCRE: TStringField;
    qryDocumentosPORTFORMAPARTICIP: TFloatField;
    qryDocumentosCODCENTROCUSTO: TStringField;
    updDocumentos: TUpdateSQL;
    qryAux2: TwwQuery;
    tblParam: TwwTable;
    tbshCAP: TTabSheet;
    gbxCAP: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    dblcTipoDoc: TwwDBLookupCombo;
    dblcTipoDesemb: TwwDBLookupCombo;
    dbedValHon: TDBRealEdit;
    qryTipoOper: TwwQuery;
    gbxContabilizacao: TGroupBox;
    dblcTipOper: TwwDBLookupCombo;
    Label1: TLabel;
    Label30: TLabel;
    Label2: TLabel;
    Label19: TLabel;
    dbedNumero: TDBEdit;
    rgSituacao: TDBRadioGroup;
    dbedNumJCJ: TDBEdit;
    dbrgMateria: TDBRadioGroup;
    dbedDataAju: TCMDateTimePicker;
    dbedDataNot: TCMDateTimePicker;
    rgAtivo: TDBRadioGroup;
    CMProcuraRequerente: TCMProcuraSubTipo;
    qryDocumentosRECPAG: TStringField;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    procedure qryHonorBeforeEdit(DataSet: TDataSet);
    procedure qryHonorBeforePost(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure qryHonorAfterInsert(DataSet: TDataSet);
    procedure IniciaValoresContabeis;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    iCodDocumento, iUltIdBanco, iPortadorFormaDefault: integer;
  public
    { Public declarations }
  end;

var
  frmCadRegHon: TfrmCadRegHon;
  ValAntes, ValorTotalAntes, ValorDepois, dTotal : Double;
  ProxSeq, Tam, Ind, liExercicio, liPeriodo, iEmpresa  : Integer;
  ValorAntes, CodFavor, DataHonor : Variant;
  AlterouValores, FazCAP, FazContab : Boolean;
  sMensagem, sMascara, sMesRef : String;
  iIDPatro, iIDPlanoPrev, iPlano : Integer;


implementation

uses UMensErro, uDataBase, uDocumento, FPrincipal, UValorAtual,
  uFuncoesUteisRH, ULancContab, USistema;

{$R *.DFM}

procedure TfrmCadRegHon.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
  begin
     qry.Close;
     qry.ParamByName('NumProcTrab').Value := StrToFloat(MontaSelect.ValoresChave[0]);
     qry.Open;
     qryHonor.Close;
     qryHonor.ParamByName('NumProc').Value := StrToFloat(MontaSelect.ValoresChave[0]);
     qryHonor.Open;
     qryAdvog.Close;
     qryAdvog.ParamByName('NumProc').Value := StrToFloat(MontaSelect.ValoresChave[0]);
     qryAdvog.Open;
     IniciaValoresContabeis;
     //qryAfterScroll(ds.Dataset);
  end;
end;

procedure TfrmCadRegHon.CmeCadastroConfirma(Sender: TObject);
var
  sCONTADEBITO, sCONTACREDITO, sCODSUBCONTA, sSql : String;
  Planilha, pln : Integer;
begin
   inherited;
   try
      AplicaAlteracoes([qryHonor]);
   except
      raise;
   end;

   if (FazCAP) or (FazContab) then
   begin // Contas a Pagar e/ou Contabilidade
      with (qryAux2) do
      begin
        iPortadorFormaDefault:=0; iUltIdBanco:=0;
        Close;
        SQL.Clear;
        SQL.Add('SELECT CODPORTFORMA FROM BANCOPORTFOLHA WHERE (IDBANCO IS NULL)');
        Open;

        if not(IsEmpty) then
          iPortadorFormaDefault := FieldByName('CODPORTFORMA').asInteger;

        Close;


      end;
      qryDocumentos.ParamByName('CODDOCUMENTO').asInteger := -1;
      qryDocumentos.Prepare;
      qryDocumentos.Open;
      pln := 0;
      frmPrincipal.prmCodTipDoc := dblcTipoDoc.LookupValue;

      qryHonor.First;
      while not qryHonor.EOF do
      begin
         ValorDepois := qryHonor.FieldByName('VALORHONOR').AsFloat;

         if ValorTotalAntes > 0  then
           for Ind := 1 to Tam do
             if (qryHonor.FieldByName('IDFORNSERV').AsInteger = CodFavor[Ind]) and
                (qryHonor.FieldByName('DATAPAGTOHONOR').AsDateTime = DataHonor[Ind]) then
                ValorDepois := ValorDepois - ValorAntes[Ind];

         // Rotina de Lançamento Contas a Pagar e/ou Contabilidade
         sCODSUBCONTA := '';
         if (ValorDepois <> 0) and (FazContab) then  // Rotina de Lançamento Contabil
         begin
           sSql:='SELECT CONTACDESPESA, CONTACFORN, PLANO, CODSUBCONTA '+
                 ' FROM EMPRESAFORN'+
                 ' WHERE (IDFORCLI = '+
                  qry.FieldByName('IDADVOGRECDA').asString +')'+
                 ' AND (IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')';

           qryAux2.Close;
           qryAux2.SQL.Text := sSql;
           qryAux2.Open;
           if qryAux2.FieldByName('CONTACDESPESA').asString = '' then
           begin
              sCONTADEBITO := qryTipoDesemb.FieldByName('PLACONTA').asString;
              iPlano       := qryTipoDesemb.FieldByName('PLANO').asInteger;
           end
           else
           begin
              sCONTADEBITO := qryAux2.FieldByName('CONTACDESPESA').asString;
              iPlano       := qryAux2.FieldByName('PLANO').asInteger;
              sCODSUBCONTA := qryAux2.FieldByName('CODSUBCONTA').asString;
           end;

           sCONTACREDITO := qryTipoDesemb.FieldByName('PLACONTACREDITO').asString;
           if  sCONTACREDITO = '' then
               sCONTACREDITO := qryAux2.FieldByName('CONTACFORN').asString;

           if (sCONTADEBITO <> '') and (sCONTACREDITO <> '') then
           begin
             try
               Planilha:=LANCACONTAB(True,'BASEDADOS',DateToStr(Date),
                         InttoStr(Sistema.IdModulo),'0',
                         'D','','','','','','','','','','',sMesRef,
                         copy('Honorários Relativos ao Processo '+
                              qry.FieldByName('PROCJCJNUM').AsString,1,40),
                         '',
                         sMesRef, '', '',
                         qryTipoOper.FieldByName('TIPCODIGO').AsString,
                         '',
                         sCONTADEBITO,
                         '',
                         '',
                         liExercicio, liPeriodo,Sistema.IdEmpresa,
                         Sistema.IdUsuario,
                         iPlano,
                         ValorDepois,
                         0,0,0,0,0,0,0,0,'',
                         False,0,0,
                         sCODSUBCONTA,
                         '','','',Pln, sMensagem,sMascara,True,0,
                         iIDPlanoPrev, iIDPatro, Sistema.UsaPlanoPatro);
               pln := planilha;
             except
               on E:EDBEngineError do
               begin
                 MostrarErro(E);
                 pln := planilha;
                 if pln < 0 then break;
               end;
             end;//try

             try
               Planilha:=LANCACONTAB(True,'BASEDADOS',DateToStr(Date),
                         InttoStr(Sistema.IdModulo),'1',
                         'C','','','','','','','','','','',sMesRef,
                         copy('Honorários Relativos ao Processo '+
                              qry.FieldByName('PROCJCJNUM').AsString,1,40),
                         '',
                         sMesRef, '', '',
                         qryTipoOper.FieldByName('TIPCODIGO').AsString,
                         '',
                         '',
                         '',
                         sCONTACREDITO,
                         liExercicio, liPeriodo,Sistema.IdEmpresa,
                         Sistema.IdUsuario,
                         iPlano,
                         ValorDepois,
                         0,0,0,0,0,0,0,0,'',
                         False,0,0,
                         sCODSUBCONTA,
                         '','','',Pln, sMensagem,sMascara,True,0,
                         iIDPlanoPrev, iIDPatro, Sistema.UsaPlanoPatro);
               pln := planilha;
             except
               on E:EDBEngineError do
               begin
                 MostrarErro(E);
                 pln := planilha;
                 if pln < 0 then break;
               end;
             end;//try

           end; // do (sCONTADEBITO <> '') and (sCONTACREDITO <> '')

         end; // Fim Valor <> 0 and FazContab (Rotina de Lançamento Contabil)





         if (ValorDepois > 0) and (AlimentaQryDocumentos(qryDocumentos,
             -1,
             -1,
             -1,
             IFF(frmPrincipal.prmUnidNegoc <> 0, frmPrincipal.prmUnidNegoc, -1),
             iPortadorFormaDefault,
             '',
             IFF(frmPrincipal.prmCodCentroRespon <> '',
                 frmPrincipal.prmCodCentroRespon,'9999999999'),
             qryTipoDesemb.FieldByName('CODTIPRECDES').asString,
             'P',
             'D',
             ValorDepois,
             sMensagem,
             0,
             ''))  then
         begin
             qryDocumentos.First;
             dTotal:=0;
             while not(qryDocumentos.EOF) do
             begin
               if (qryDocumentos.FieldByName('DEBCRE').asString = 'D') then
                  dTotal := dTotal + qryDocumentos.FieldByName('VALOR').asFloat
               else
                  dTotal := dTotal - qryDocumentos.FieldByName('VALOR').asFloat;

               qryDocumentos.Next;
             end;
             iUltIdBanco :=  qryHonor.FieldByName('IDFORNSERV').asInteger;
             qryDocumentos.First;
             iCodDocumento := DescarregaQryDocumentos(qryDocumentos, iUltIdBanco, pln,
                           IntToStr(iPortadorFormaDefault),
                           Copy(qryHonor.FieldByName('DATAPAGTOHONOR').AsString,4,2),
                           Copy(qryHonor.FieldByName('DATAPAGTOHONOR').AsString,7,4),
                           dTotal, qryHonor.FieldByName('DATAPAGTOHONOR').AsDateTime,
                           Documento, False);
             qryDocumentos.CancelUpdates;

             //dtmBaseDados.dbBaseDados.Commit;
             MsgDlg('Contas a Pagar do Honorário efetuada: AP Num. ' + IntToStr(iCodDocumento),
                    'Informação',mtInformation,[mbOk,mbHelp],0);
         end;
         // Fim da Rotina de Lançamento Contas a Pagar


         qryHonor.Next;
      end;  // Fim do Loop de qryHonor
      qryHonor.First;
      qryDocumentos.Close;
      IniciaValoresContabeis; // a nova situação passa a ser a "anterior", caso
                              // o usuário faça nova atualização

   end;  // Fim do Contas a Pagar e/ou Contab.
   if (FazContab) and (pln > 0) then
   begin
       qryAux2.Close;
       qryAux2.SQL.Clear;
       qryAux2.SQL.Add('SELECT PLNPLANIL FROM PLANILHA WHERE PLNCODIGO = ' + IntToStr(pln));
       qryAux2.Open;
       pln := qryAux2.FieldByName('PLNPLANIL').asInteger;
       MsgDlg('Contabilização do Honorário efetuada: Planilha Num. ' + IntToStr(pln),
              'Informação',mtInformation,[mbOk,mbHelp],0);
   end;
   if (FazContab) and (pln <= 0) then
      MsgDlg('Contabilização do Honorário Não Efetuada: Parâmetros Insuficientes',
              'Informação',mtInformation,[mbOk,mbHelp],0);



end; // CmeCadastro.Confirma(Self)

procedure TfrmCadRegHon.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
// A ver
end;

procedure TfrmCadRegHon.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
// A ver
end;

procedure TfrmCadRegHon.CmeDetalheConfirma(Sender: TObject);
begin
   inherited;

end; // CmeDetalhe.Confirma(Self)


procedure TfrmCadRegHon.qryHonorBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  ValAntes := qryHonorVALORHONOR.Value;
end;

procedure TfrmCadRegHon.qryHonorBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qryHonor.State = dsInsert) then
  begin
    qryHonor.FieldByName('NumProcTrab').Value := qry.FieldByName('NumProcTrab').Value;
  end;
  qryHonor.FieldByName('Nome').AsString := qryAdvog.FieldByName('Nome').AsString;

  // Deposito e Despesa entram no campo DESPESAPROC
  //qry.Edit;

  qry.FieldByName('DESPESAPROC').AsFloat :=
              qry.FieldByName('DESPESAPROC').AsFloat +
              qryHonor.FieldByName('VALORHONOR').AsFloat - ValAntes;

  //qry.Post;

end;

procedure TfrmCadRegHon.bbtnOkDetClick(Sender: TObject);
begin
  if  dbedDataPgto.Text = ''       then begin
      MsgDlg('Preencha a Data','Aviso',mtInformation,[mbOk,mbHelp],0);
      dbedDataPgto.SetFocus;
      Exit;
  end;

  if  dblcFavor.Text = ''       then begin
      MsgDlg('Indique o Favorecido','Aviso',mtInformation,[mbOk,mbHelp],0);
      dblcFavor.SetFocus;
      Exit;
  end;

  if  dbedValHon.Value = 0       then begin
      MsgDlg('Preencha o Valor','Aviso',mtInformation,[mbOk,mbHelp],0);
      dbedValHon.SetFocus;
      Exit;
  end;

  inherited;
  if (pgctrlDetalhe.ActivePage = tbsDet) then AlterouValores := True;
  //qryHonor.Close;
  //qryHonor.Open;
end;

procedure TfrmCadRegHon.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  //sbtnAlterarClick(Self);
  sbtnInserir.Visible := False;
  //sbtnAlterar.Visible := False;
  sbtnApagar.Visible  := False;
end;

procedure TfrmCadRegHon.FormShow(Sender: TObject);
begin
  inherited;
  qryHonor.Close;
  qryHonor.ParamByName('NumProc').Value := 0;
  qryHonor.Open;
  qry.Close;
  qry.ParamByName('NumProcTrab').Value := 0;
  qry.Open;
  qryAdvog.Close;
  qryAdvog.ParamByName('NumProc').Value := 0;
  qryAdvog.Open;
  sbtnProcurarClick(Self);

end;

procedure TfrmCadRegHon.qryHonorAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryHonor.FieldByName('DATAPAGTOHONOR').Value := Date;
end;

procedure TfrmCadRegHon.IniciaValoresContabeis;
begin
   AlterouValores := False;

   if (FazContab) or (FazCAP) then
   begin
      qryHonor.First;
      Tam := qryHonor.RecordCount;
      CodFavor   := VarArrayCreate([1, Tam], varInteger);
      ValorAntes := VarArrayCreate([1, Tam], varDouble);
      DataHonor  := VarArrayCreate([1, Tam], varDate);
      ValorTotalAntes := 0;
      Ind := 0;
      while not qryHonor.EOF do
      begin
         inc(Ind);
         CodFavor[Ind]   := qryHonor.FieldByName('IDFORNSERV').AsInteger;
         DataHonor[Ind]  := qryHonor.FieldByName('DATAPAGTOHONOR').AsDateTime;
         ValorAntes[Ind] := qryHonor.FieldByName('VALORHONOR').AsFloat;;
         ValorTotalAntes := ValorTotalAntes + ValorAntes[Ind];
         qryHonor.Next;
      end;
      qryHonor.First;
   end;
end;

procedure TfrmCadRegHon.FormCreate(Sender: TObject);
begin
  inherited;
  sMesRef  := copy(DateToStr(Date),7,4) + copy(DateToStr(Date),3,2);
  iEmpresa := Sistema.idEmpresa;
  tblParam.Open;
  gbxCAP.Visible := (tblParam.FieldByName('FLGINTEGRACAP').AsInteger = 1);
  FazCAP         := (tblParam.FieldByName('FLGINTEGRACAP').AsInteger = 1);
  FazContab      := (tblParam.FieldByName('FLGINTEGRACONT').AsInteger = 1) and
                    (TESTAPERIODO(True,'BaseDados',DateToStr(Date),
                     IntToStr(Sistema.idModulo),liExercicio,liPeriodo,iEmpresa, sMensagem) = 0);

  if (FazCAP) then
  begin
     qryTipoDoc.Open;
     qryTipoDesemb.Open;
  end;

  // Pega Máscara do Plano de Contas
  if (FazContab) then
  begin
     qryAux2.Close;
     qryAux2.SQL.Clear;
     qryAux2.SQL.Add('SELECT PL.MASCARA, PR.PLANO FROM PLANO PL, PARAMCONTAB PR ');
     qryAux2.SQL.Add('WHERE PR.PLANO = PL.PLANO AND PR.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
     qryAux2.Open;
     sMascara  := qryAux2.Fields[0].AsString;
     qryAux2.Close;

     qryAux2.SQL.Clear;
     qryAux2.SQL.Add ('SELECT IDPATRO, IDPLANOPREV FROM PARALMOX');
     qryAux2.Open;
     iIDPatro     := IFF(Sistema.UsaPlanoPatro, qryAux2.FieldByName('IDPATRO').asInteger, -1);
     iIDPlanoPrev := IFF(Sistema.UsaPlanoPatro, qryAux2.FieldByName('IDPLANOPREV').asInteger, -1);
     qryAux2.Close;

     qryTipoOper.Open;

  end;
  gbxContabilizacao.Visible := FazContab;

end;

procedure TfrmCadRegHon.bbtnConfirmarClick(Sender: TObject);
begin

   if (AlterouValores)  and
      (((FazCAP) and
       ((dblcTipoDoc.Text = '') or (dblcTipoDesemb.Text = ''))) or
      ((FazContab) and (dblcTipOper.Text = '')))  then
   begin
      pgctrlDetalhe.ActivePage     := tbshCAP;
      tbcDetalhe.TabIndex          := tbshCAP.PageIndex;
      tbcDetalhe.Repaint;
      MsgDlg('Complemente os dados requeridos para a integração Contábil e/ou do Contas a Pagar',
             'Informação',mtInformation,[mbOk,mbHelp],0);
      exit;
   end;


  inherited;

end;

end.
