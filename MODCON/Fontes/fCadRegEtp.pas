unit FCadRegEtp;

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
  TfrmCadRegEtp = class(TfrmCadMestreDetalheCS)
    qryImagem: TwwQuery;
    qryImagemIDIMAGEM: TFloatField;
    qryImagemIMAGEM: TBlobField;
    qryImagemDESCRIMAGEM: TStringField;
    updImagem: TUpdateSQL;
    dsImagem: TwwDataSource;
    tblHonor: TwwTable;
    Label7: TLabel;
    dblcTipoEtp: TwwDBLookupCombo;
    Label4: TLabel;
    dtedDataReal: TCMDateTimePicker;
    mskedHora: TMaskEdit;
    Label3: TLabel;
    dbedAssunto: TDBEdit;
    Label5: TLabel;
    lblHonor: TLabel;
    redHonor: TRealEdit;
    Label6: TLabel;
    dbmObserv: TDBMemo;
    qryNumSeq: TwwQuery;
    qryTipoEtapa: TwwQuery;
    dbedValRec: TDBRealEdit;
    tbshCAP: TTabSheet;
    gbxCAP: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    dblcTipoDoc: TwwDBLookupCombo;
    dblcTipoDesemb: TwwDBLookupCombo;
    Label46: TLabel;
    dtPagamento: TCMDateTimePicker;
    cmprocFonecedor: TCMProcuraForCli;
    updDocumentos: TUpdateSQL;
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
    qryTipoDoc: TwwQuery;
    qryTipoDesemb: TwwQuery;
    qryAux2: TwwQuery;
    tblParam: TwwTable;
    qryTipoOper: TwwQuery;
    gbxContabilizacao: TGroupBox;
    dblcTipOper: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label19: TLabel;
    dbedDataAju: TCMDateTimePicker;
    dbedDataNot: TCMDateTimePicker;
    rgSituacao: TDBRadioGroup;
    CMProcuraRequerente: TCMProcuraSubTipo;
    dbedNumero: TDBEdit;
    Label30: TLabel;
    Label13: TLabel;
    Label20: TLabel;
    dbedNumJCJ: TDBEdit;
    dbedJCJ: TDBEdit;
    dblcVara: TwwDBLookupCombo;
    qryVara: TwwQuery;
    ToolbarSep972: TToolbarSep97;
    sbtnImagem: TToolbarButton97;
    dbrgAbate: TDBRadioGroup;
    qryEtapa: TwwQuery;
    qryEtapaNUMSEQ: TFloatField;
    qryEtapaETAPA: TStringField;
    qryEtapaDATAREALOCOR: TDateTimeField;
    qryEtapaASSUNTO: TStringField;
    qryEtapaVALORHONOR: TFloatField;
    qryEtapaNUMPROCTRAB: TFloatField;
    qryEtapaCODTIPORECURSO: TFloatField;
    qryEtapaVALORREC: TFloatField;
    qryEtapaOBSERVETAPA: TMemoField;
    qryEtapaIDIMAGEM: TFloatField;
    qryEtapaFLGVALORABATE: TFloatField;
    UpdEtapa: TUpdateSQL;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    procedure qryEtapaBeforeEdit(DataSet: TDataSet);
    procedure dblcTipoEtpCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnImagemClick(Sender: TObject);
    procedure qryEtapaAfterScroll(DataSet: TDataSet);
    procedure qryEtapaBeforePost(DataSet: TDataSet);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure qryEtapaBeforeInsert(DataSet: TDataSet);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure qryEtapaAfterInsert(DataSet: TDataSet);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure IniciaValoresContabeis;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbedValRecChange(Sender: TObject);
    procedure redHonorChange(Sender: TObject);
  private
    { Private declarations }
    procedure AssociaImagem(dsImg : TwwDataSource; pImagem : TBlobField; Campo : TFloatField; Descricao : string);
  public
    { Public declarations }
  end;

var
  frmCadRegEtp: TfrmCadRegEtp;
  ValAntes, ValorTotalAntes, ValorDepois1, ValorDepois2, dTotal : Double;
  ProxSeq, Tam, Ind : Integer;
  ValorAntes1, ValorAntes2, NumSeq : Variant;
  AlterouValores, FazCAP, FazContab : Boolean;
  sMensagem, sMascara, sMesRef : String;
  iCodDocumento, iUltIdBanco, iPortadorFormaDefault,
  liExercicio, liPeriodo, iEmpresa : integer;
  iIDPatro, iIDPlanoPrev, iPlano : Integer;

implementation

uses UMensErro, fImagemDoc, uDataBase, uDocumento, FPrincipal, UValorAtual,
     uFuncoesUteisRH, ULancContab, USistema, UsoGeralRH;

{$R *.DFM}

procedure TfrmCadRegEtp.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
  begin
     qry.Close;
     qry.ParamByName('NumProcTrab').Value := StrToFloat(MontaSelect.ValoresChave[0]);
     qry.Open;
     qryEtapa.Close;
     qryEtapa.ParamByName('NumProc').Value := StrToFloat(MontaSelect.ValoresChave[0]);
     qryEtapa.Open;
     qryNumSeq.Close;
     qryNumSeq.ParamByName('NumProc').Value := StrToFloat(MontaSelect.ValoresChave[0]);
     qryNumSeq.Open;
     ProxSeq := qryNumSeq.FieldByName('ULTSEQ').AsInteger;
     IniciaValoresContabeis;
     //qryAfterScroll(ds.Dataset);
  end;
end;

procedure TfrmCadRegEtp.CmeCadastroConfirma(Sender: TObject);
var
  sCONTADEBITO, sCONTACREDITO, sCODSUBCONTA, sSql : String;
  Planilha, pln : Integer;
begin
   inherited;
   try
      AplicaAlteracoes([qryEtapa]);
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

      qryEtapa.First;
      while not qryEtapa.EOF do
      begin
         ValorDepois1 := qryEtapa.FieldByName('VALORHONOR').AsFloat;
         ValorDepois2 := qryEtapa.FieldByName('VALORREC').AsFloat;

         if ValorTotalAntes > 0  then
           for Ind := 1 to Tam do
             if (qryEtapa.FieldByName('NUMSEQ').AsInteger = NumSeq[Ind]) then
             begin
                ValorDepois1 := ValorDepois1 - ValorAntes1[Ind];
                ValorDepois2 := ValorDepois2 - ValorAntes2[Ind];
             end;

         // Rotina de Lançamento Contas a Pagar e/ou Contabilidade
         for Ind := 1 to 2 do
         begin

            sCODSUBCONTA := '';
            if  (((ValorDepois1 <> 0) and (Ind = 1)) or
                 ((ValorDepois2 <> 0) and (Ind = 2))) and
                 (FazContab) then  // Rotina de Lançamento Contabil
            begin
              sSql:='SELECT CONTACDESPESA, CONTACFORN, PLANO, CODSUBCONTA '+
                    ' FROM EMPRESAFORN'+
                    ' WHERE (IDFORCLI = '+
                    IFF(Ind = 1,
                        qry.FieldByName('IDADVOGRECDA').asString,
                        IntToStr(cmprocFonecedor.ForCliReg.Id))+')'+
                    ' AND (IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')';

              qryAux2.Close;
              qryAux2.SQL.Text := sSql;
              qryAux2.Open;
              if (qryAux2.FieldByName('CONTACDESPESA').asString = '') then
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
                            IFF(Ind = 1,
                              copy('Honorários Relativos ao Processo '+
                              qry.FieldByName('PROCJCJNUM').AsString,1,40),
                              copy(dblcTipoEtp.Text,1,40)),
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
                            IFF(Ind = 1, ValorDepois1, ValorDepois2),
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
                            IFF(Ind = 1,
                              copy('Honorários Relativos ao Processo '+
                              qry.FieldByName('PROCJCJNUM').AsString,1,40),
                              copy(dblcTipoEtp.Text,1,40)),
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
                            IFF(Ind = 1, ValorDepois1, ValorDepois2),
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

            if (((ValorDepois1 > 0) and (Ind = 1)) or
                ((ValorDepois2 > 0) and (Ind = 2))) and
               (AlimentaQryDocumentos(qryDocumentos,
                -1,
                -1,
                -1,
                IFF(frmPrincipal.prmUnidNegoc <> 0, frmPrincipal.prmUnidNegoc, -1),
                iPortadorFormaDefault,
                '',
                IFF(frmPrincipal.prmCodCentroRespon <> '',
                    frmPrincipal.prmCodCentroRespon,'9999999999'),
                qryTipoDesemb.FieldByName('CODTIPRECDES').asString,
                'D',
                IFF(Ind = 1, ValorDepois1, ValorDepois2),
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

                iUltIdBanco :=  IFF(Ind = 1,
                                qry.FieldByName('IDADVOGRECDA').asInteger,
                                cmprocFonecedor.ForCliReg.Id);
                if  iUltIdBanco <= 0 then continue;
                qryDocumentos.First;
                iCodDocumento := DescarregaQryDocumentos(qryDocumentos, iUltIdBanco, pln,
                              IntToStr(iPortadorFormaDefault),
                              Copy(dtPagamento.Text,4,2),
                              Copy(dtPagamento.Text,7,4),
                              dTotal, dtPagamento.Date,
                              Documento, False);
                qryDocumentos.CancelUpdates;

                //dtmBaseDados.dbBaseDados.Commit;
                if (Ind = 1) then
                   MsgDlg('Contas a Pagar do Honorário efetuada: AP Num. ' + IntToStr(iCodDocumento),
                       'Informação',mtInformation,[mbOk,mbHelp],0)
                else
                   MsgDlg('Contas a Pagar do Depósito ou Despesa efetuada: AP Num. ' + IntToStr(iCodDocumento),
                       'Informação',mtInformation,[mbOk,mbHelp],0);
            end;
            // Fim da Rotina de Lançamento Contas a Pagar

         end; // For Ind = 1 to 2
         qryEtapa.Next;
      end;  // Fim do Loop de qryEtapa
      qryEtapa.First;
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
       MsgDlg('Contabilização do Honorário e/ou Depósito e/ou Despesa efetuada: Planilha Num. ' + IntToStr(pln),
              'Informação',mtInformation,[mbOk,mbHelp],0);
   end;
   if (FazContab) and (pln <= 0) then
      MsgDlg('Contabilização do Honorário e/ou Depósito e/ou Despesa Não Efetuada: Parâmetros Insuficientes',
              'Informação',mtInformation,[mbOk,mbHelp],0);


end; // CmeCadastro.Confirma(Self)

procedure TfrmCadRegEtp.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
// A ver
end;

procedure TfrmCadRegEtp.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
// A ver
end;

procedure TfrmCadRegEtp.CmeDetalheConfirma(Sender: TObject);
begin
   inherited;

end; // CmeDetalhe.Confirma(Self)


procedure TfrmCadRegEtp.qryEtapaBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  ValAntes := qryEtapa.FieldByName('VALORREC').AsFloat *
    (1 - qryEtapa.FieldByName('FLGVALORABATE').asInteger);
end;

procedure TfrmCadRegEtp.dblcTipoEtpCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if  (sbtnInsDet.Down) and (qryEtapa.FieldByName('ValorHonor').AsFloat <> 0)  then
  begin
     lblHonor.Visible := True;
     redHonor.Visible := True;
     redHonor.Value  := qryEtapa.FieldByName('ValorHonor').AsFloat;
  end;
end;

procedure TfrmCadRegEtp.sbtnImagemClick(Sender: TObject);
begin
  inherited;
  AssociaImagem(dsImagem, TBlobField(qryImagem.FieldByName('IMAGEM')),
          TFloatField(qryEtapa.FieldByName('IDIMAGEM')), 'Documento');
end;

procedure TfrmCadRegEtp.AssociaImagem(dsImg : TwwDataSource; pImagem : TBlobField; Campo : TFloatField; Descricao : string);
var frmImgDoc : TfrmImagemDoc;
begin
     try
        Application.CreateForm(tfrmImagemDoc, frmImgDoc);
        with frmImgDoc do
        begin
             dsImagem := dsImg;
             Imagem   := pImagem;
             CampoPai := Campo;

             bbtnAssociar.Enabled := (dsDet.Dataset.State = dsInsert) or (dsDet.Dataset.State = dsEdit);
             bbtnLimpar.Enabled := (dsDet.Dataset.State = dsInsert) or (dsDet.Dataset.State = dsEdit);
             Caption := Descricao;
             ShowModal;
        end;
     finally
          frmImgDoc.free;
     end;
end;

procedure TfrmCadRegEtp.qryEtapaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryImagem.Close;
  qryImagem.ParamByName('NumProc').AsFloat  := qryEtapa.FieldByName('NUMPROCTRAB').AsFloat;
  qryImagem.ParamByName('NumSeq').AsInteger := qryEtapa.FieldByName('NUMSEQ').AsInteger;
  qryImagem.Open;
  sbtnImagem.Visible    := not(qryEtapa.EOF);
  ToolbarSep972.Visible := not(qryEtapa.EOF);
  dtedDataReal.Text := '';
  mskedHora.Text    := '';
  if not(qryEtapa.FieldByName('DATAREALOCOR').IsNull) then
  begin
    dtedDataReal.Date  := StrToDate(DateToStr(qryEtapa.FieldByName('DATAREALOCOR').AsDateTime));
    //mskedHora.Text     := TimeToStr(qryEtapa.FieldByName('DATAREALOCOR').AsDateTime);
    mskedHora.Text     := copy(qryEtapa.FieldByName('DATAREALOCOR').AsString,12,5);
  end;
end;

procedure TfrmCadRegEtp.qryEtapaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qryEtapa.State = dsInsert) then
  begin
    qryEtapa.FieldByName('NumProcTrab').Value := qry.FieldByName('NumProcTrab').Value;
  end;
  qryEtapa.FieldByName('Etapa').AsString := qryTipoEtapa.FieldByName('Descricao').AsString;

  // Deposito e Despesa entram no campo DESPESAPROC
  //qry.Edit;

  qry.FieldByName('DESPESAPROC').AsFloat :=
              qry.FieldByName('DESPESAPROC').AsFloat +
              qryEtapa.FieldByName('VALORREC').AsFloat *
              (1 - qryEtapa.FieldByName('FLGVALORABATE').asInteger) - ValAntes;

  //qry.Post;

  if  (redHonor.Value  <> 0) and (redHonor.Visible) and
      (qry.FieldByName('IDADVOGRECDA').Value <> Null) then
  begin
      if  not  tblHonor.Active  then  tblHonor.Open;
      tblHonor.Insert;
      tblHonor.FieldByName('NUMPROCTRAB').Value := qry.FieldByName('NUMPROCTRAB').Value;
      tblHonor.FieldByName('DATAPAGTOHONOR').Value := Date;
      tblHonor.FieldByName('IDFORNSERV').Value :=  qry.FieldByName('IDADVOGRECDA').Value;
      tblHonor.FieldByName('VALORHONOR').AsFloat :=  redHonor.Value;
      tblHonor.Post;
  end;
  lblHonor.Visible := False;
  redHonor.Visible := False;
  redHonor.Value  := 0;

  if mskedHora.Text = '  :  ' then
     qryEtapa.FieldByName('DATAREALOCOR').Value := dtedDataReal.Date
  else
     qryEtapa.FieldByName('DATAREALOCOR').AsDateTime := dtedDataReal.Date +
                                                        StrToTime(mskedHora.Text);
  AplicaAlteracoes([qryImagem]);
end;

procedure TfrmCadRegEtp.bbtnOkDetClick(Sender: TObject);
begin
  if  dtedDataReal.Text = ''       then begin
      MsgDlg('Preencha a Data (Prevista ou Real)','Aviso',mtInformation,[mbOk,mbHelp],0);
      dtedDataReal.SetFocus;
      Exit;
  end;

  if  dblcTipoEtp.Text = ''       then begin
      MsgDlg('Preencha o Tipo de Etapa','Aviso',mtInformation,[mbOk,mbHelp],0);
      dblcTipoEtp.SetFocus;
      Exit;
  end;
{
  if  dbedAssunto.Text = ''       then begin
      MsgDlg('Preencha o Assunto','Aviso',mtInformation,[mbOk,mbHelp],0);
      dbedAssunto.SetFocus;
      Exit;
  end;
}
  inherited;
  //if (pgctrlDetalhe.ActivePage = tbsDet) and
  //   ((dbedValRec.Value > 0) or (redHonor.Value > 0)) then AlterouValores := True;
  //qryEtapa.Close;
  //qryEtapa.Open;
end;

procedure TfrmCadRegEtp.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  //sbtnAlterarClick(Self);
  sbtnInserir.Visible := False;
  //sbtnAlterar.Visible := False;
  sbtnApagar.Visible  := False;
  FazCAP         := (tblParam.FieldByName('FLGINTEGRACAP').AsInteger = 1);
  FazContab      := (tblParam.FieldByName('FLGINTEGRACONT').AsInteger = 1) and
                    (TESTAPERIODO(True,'BaseDados',DateToStr(Date),
                     IntToStr(Sistema.idModulo),liExercicio,liPeriodo,iEmpresa, sMensagem) = 0);
  
end;

procedure TfrmCadRegEtp.qryEtapaBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  ProxSeq := ProxSeq + 1;
end;

procedure TfrmCadRegEtp.bbtnCancelarDetClick(Sender: TObject);
begin
  if (dsDet.Dataset.State = dsInsert) then
     ProxSeq := ProxSeq - 1;
  inherited;
{  qryEtapa.Close;
  qryEtapa.ParamByName('NumProc').Value := StrToFloat(MontaSelect.ValoresChave[0]);
  qryEtapa.Open;
}
end;

procedure TfrmCadRegEtp.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
     //qryEtapa.Close;
     //qryEtapa.Open;
     qryNumSeq.Close;
     qryNumSeq.ParamByName('NumProc').AsString := qry.FieldByName('NUMPROCTRAB').AsString;
     qryNumSeq.Open;
     ProxSeq := qryNumSeq.FieldByName('ULTSEQ').AsInteger;
end;

procedure TfrmCadRegEtp.qryEtapaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryEtapa.FieldByName('NUMSEQ').Value := ProxSeq;
end;

procedure TfrmCadRegEtp.bbtnVoltarDetClick(Sender: TObject);
begin
  if (dsDet.Dataset.State = dsInsert) then
     ProxSeq := ProxSeq - 1;
  inherited;
{  qryEtapa.Close;
  qryEtapa.ParamByName('NumProc').Value := StrToFloat(MontaSelect.ValoresChave[0]);
  qryEtapa.Open;
}
end;

procedure TfrmCadRegEtp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryImagem.Close;
  qryImagem.Unprepare;
end;

procedure TfrmCadRegEtp.FormShow(Sender: TObject);
begin
  inherited;
  qryVara.Open;
  qryImagem.Prepare;
  //qry.Prepare;
  //tblTipRec.Open;
  qryEtapa.Close;
  qryEtapa.ParamByName('NumProc').Value := 0;
  qryEtapa.Open;
  qry.Close;
  qry.ParamByName('NumProcTrab').Value := 0;
  qry.Open;
  if not qryTipoEtapa.Active then qryTipoEtapa.Open;
  sbtnProcurarClick(Self);

end;

procedure TfrmCadRegEtp.IniciaValoresContabeis;
begin
   AlterouValores := False;

   if (FazContab) or (FazCAP) then
   begin
      qryEtapa.First;
      Tam := qryEtapa.RecordCount;
      NumSeq      := VarArrayCreate([1, Tam], varInteger);
      ValorAntes1 := VarArrayCreate([1, Tam], varDouble);
      ValorAntes2 := VarArrayCreate([1, Tam], varDouble);
      ValorTotalAntes := 0;
      Ind := 0;
      while not qryEtapa.EOF do
      begin
         inc(Ind);
         NumSeq[Ind]      := qryEtapa.FieldByName('NUMSEQ').AsInteger;
         ValorAntes2[Ind] := qryEtapa.FieldByName('VALORREC').AsFloat;
         ValorAntes1[Ind] := qryEtapa.FieldByName('VALORHONOR').AsFloat;
         ValorTotalAntes  := ValorTotalAntes + ValorAntes1[Ind] + ValorAntes2[Ind];
         qryEtapa.Next;
      end;
      qryEtapa.First;
   end;
end;


procedure TfrmCadRegEtp.FormCreate(Sender: TObject);
begin
  inherited;
  if (sUsuXccusto <> '') or (sUsuXfilial <> '') then begin
     MontaSelect.Tabelas.Add('FUNCIONARIO');
     MontaSelect.Filtro.Add('PESSOA.IDPESSOA = FUNCIONARIO.IDPESSOA');
  end;

  if sUsuXccusto <> '' then
     MontaSelect.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' + sUsuXccusto);

  if sUsuXfilial <> '' then
     MontaSelect.Filtro.Add('FUNCIONARIO.IDESTAB IN ' + sUsuXfilial);

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

procedure TfrmCadRegEtp.bbtnConfirmarClick(Sender: TObject);
begin
   if (AlterouValores)  and
      (((FazCAP) and
       ((dblcTipoDoc.Text = '') or (dblcTipoDesemb.Text = '') or
       (dtPagamento.Text = ''))) or
      ((FazContab) and (dblcTipOper.Text = '')))  then
   begin
      pgctrlDetalhe.ActivePage     := tbshCAP;
      tbcDetalhe.TabIndex          := tbshCAP.PageIndex;
      tbcDetalhe.Repaint;
      MsgDlg('Complemente os dados requeridos para a integração Contábil e/ou do Contas a Pagar',
             'Informação',mtInformation,[mbOk,mbHelp],0);
      exit;
   end;

   FazContab := (FazContab) and (AlterouValores);
   FazCap    := (FazCap   ) and (AlterouValores);

  inherited;

end;

procedure TfrmCadRegEtp.dbedValRecChange(Sender: TObject);
begin
  inherited;
  AlterouValores := True;
end;

procedure TfrmCadRegEtp.redHonorChange(Sender: TObject);
begin
  inherited;
  AlterouValores := True;
end;

end.
