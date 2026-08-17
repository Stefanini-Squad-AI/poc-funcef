unit FEfetivCaixaPeq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, wwdblook, CMDBLookupCombo, Wwdatsrc, DBCtrls, 
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker, Mask;

type
  TFrmEfetivCaixaPeq = class(TfrmSairAjuda)
    BtnEfetiva: TBitBtn;
    qryCP: TwwQuery;
    qryDESCCAIXAPEQ: TStringField;
    qryIDFORCLI: TFloatField;
    qryVLRMAXLANC: TFloatField;
    qryIDCAIXAPEQUENO: TFloatField;
    Label1: TLabel;
    dblcCaixaPeq: TCMDBLookupCombo;
    qryLanc: TwwQuery;
    qryLancIDLANCCXPEQ: TFloatField;
    qryLancIDEMPRESA: TFloatField;
    qryLancCODCENTROCUSTO: TStringField;
    qryLancCODSUBCONTA: TFloatField;
    qryLancIDPESSOA2: TFloatField;
    qryLancPLANO: TFloatField;
    qryLancPLACONTA: TStringField;
    qryLancCODCENTRORESPON: TStringField;
    qryLancUNIDNEGOC: TFloatField;
    qryLancRECPAG: TStringField;
    qryLancCODTIPRECDES: TStringField;
    qryLancNODOCUMENTO: TStringField;
    qryLancDATALANC: TDateTimeField;
    qryLancVLRLANC: TFloatField;
    qryLancHISTLANCAMENTO: TStringField;
    dsLanc: TwwDataSource;
    edFavo: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    edValTot: TDBEdit;
    qryTot: TwwQuery;
    qryTotTOTAL: TFloatField;
    qryLancIDBORDEROCXPEQ: TFloatField;
    dsTot: TwwDataSource;
    qryForn: TwwQuery;
    dsForn: TwwDataSource;
    qryFornRAZAOSOCIAL: TStringField;
    qryFornCONTACFORN: TStringField;
    qryFornCODSUBCONTA: TFloatField;
    qryFornCODCENTROCUSTO: TStringField;
    qryFornIDEMPRESA: TFloatField;
    qryDoc: TwwQuery;
    qryCPCODTIPDOC: TFloatField;
    edDataEfet: TCMDateTimePicker;
    lblDataLanc: TLabel;
    barProc: TProgressBar;
    lbProc: TLabel;
    qryRateio: TwwQuery;
    qryRateioVALOR: TFloatField;
    qryRateioVALOROUTRAMOEDA: TFloatField;
    qryRateioIDRATEIODOCUM: TFloatField;
    qryLancIDITEMSOLI: TFloatField;
    qryCPNUMDIASVENC: TFloatField;
    ToolbarSep971: TToolbarSep97;
    qryCPCODFORMA: TFloatField;
    qryEmpresaProp: TwwQuery;
    qryEmpresaPropIDESTADO: TFloatField;
    qryEmpresaPropCODESTADO: TStringField;
    qryEmpresaPropIDCIDADES: TFloatField;
    qryEmpresaPropIDPAIS: TFloatField;
    Label4: TLabel;
    memObs: TMemo;
    edRef: TEdit;
    Label5: TLabel;
    chkEncerra: TCheckBox;
    qryCli: TwwQuery;
    qryCliRAZAOSOCIAL: TStringField;
    qryCliCONTACCLIENTE: TStringField;
    qryCliCONTACRECEITA: TStringField;
    qryCliCODSUBCONTA: TFloatField;
    qryCliCODCENTROCUSTO: TStringField;
    qryCliIDEMPRESA: TFloatField;
    qryCPVLRTOTCAIXAPEQ: TFloatField;
    pgc: TPageControl;
    TabLanc: TTabSheet;
    TabEncerra: TTabSheet;
    Panel1: TPanel;
    Grdlanc: TwwDBGrid;
    Panel4: TPanel;
    Panel3: TPanel;
    memHist: TDBMemo;
    Panel2: TPanel;
    qryTipoDoc: TwwQuery;
    qryTipoDocDESCRICAO: TStringField;
    qryTipoDocCODTIPDOC: TFloatField;
    qryFormaPag: TwwQuery;
    qryFormaPagDESCRICAO: TStringField;
    qryFormaPagCODFORMA: TFloatField;
    qryFormaPagRECPAG: TStringField;
    Label6: TLabel;
    dblcTipoDoc: TCMDBLookupCombo;
    Label7: TLabel;
    dblcForma: TCMDBLookupCombo;
    qryTipoRec: TwwQuery;
    dblcTipRec: TCMDBLookupCombo;
    Label8: TLabel;
    qryCRespon: TwwQuery;
    qryUnidNegoc: TwwQuery;
    Label9: TLabel;
    dblcCentRespon: TwwDBLookupCombo;
    Label10: TLabel;
    dblcAtiv: TwwDBLookupCombo;
    qryCCust: TwwQuery;
    Label11: TLabel;
    dblcCCust: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure dblcCaixaPeqCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BtnEfetivaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure SelLanc( iIdCaixaPeq : LongInt);
    Function  GravaContabLanc( iPlanilha : LongInt ) : Boolean;
    Function  GravaContabForn : LongInt;
    Function  GravaBordero( iPlanilha,iCodDoc : LongInt; IdBordero : LongInt) : Boolean;
    Function  VerifRateio( idCodDoc,iUnidNegoc : LongInt; sCodTipRecDes,sRecPag,sCodCentResp : String ) : Boolean;
    Procedure Efetiva;
    Function  BuscaCliente( n : LongInt ) : Boolean;
    Function  EncerraCaixa : Boolean;
    function GravaContabCar(iPlanilha: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  FrmEfetivCaixaPeq : TFrmEfetivCaixaPeq;
  sHist             : String;
  sHist1            : String;
  sHist2            : String;
  sHist3            : String;
  sHist4            : String;
  sHist5            : String;
  iIdBordero        : LongInt;
  iExercicio        : LongInt;
  iPeriodo          : LongInt;
  iEmpresa          : LongInt;
  sMsg              : String;
implementation

{$R *.DFM}

Uses uSistema, uMensErro, uDatabase, uLancContab,
     uDocumento, uIntegraBack, dBaseDados,
     uFuncaoGeral,uModulo,uDiasUteis ;

procedure TFrmEfetivCaixaPeq.FormCreate(Sender: TObject);
begin
  inherited;
  qryRateio.Close;
  If Not qryRateio.Prepared Then qryRateio.Prepare;
  qryCP.Close;
  qryCP.ParamByName('pIDPESSOA').AsInteger  := Sistema.IdEmpresa;
  qryCP.ParamByName('pIDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryCP.Open;
  //
  qryEmpresaProp.Close;
  qryEmpresaProp.ParamByName('pIDPESSOA').AsFloat := Sistema.idEmpresa;
  qryEmpresaProp.Open;
  //
  SelLanc(-1);
  //
  QryFormaPag.Close;
  QryFormaPag.ParamByName('PRECPAG').AsString    := 'R';
  QryFormaPag.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
  QryFormaPag.Open;
  //
  qryTipoDoc.Open;
  //
  qryTipoRec.Close;
  qryTipoRec.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  qryTipoRec.Open;
  //
  qryCRespon.Close;
  qryCRespon.ParamByName('PIDPESS').asInteger   := Sistema.IdEmpresa;
  qryCRespon.ParamByName('IDUSUARIO').asInteger := Sistema.IdUsuario;
  qryCRespon.Open;
  //
  qryUnidNegoc.Close;
  qryUnidNegoc.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
  qryUnidNegoc.Open;
  //
  qryCCust.Close;
  qryCCust.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
  qryCCust.Open;
  //
  edDataEfet.Date := Date;
  iEmpresa        := Sistema.IdEmpresa;
  lbProc.Visible  := False;
  barProc.Visible := False;
end;

Procedure TFrmEfetivCaixaPeq.SelLanc( iIdCaixaPeq : LongInt);
Begin
  qryLanc.DisableControls;
  qryLanc.Close;
  qryLanc.Params[0].AsInteger := iIdCaixaPeq;
  qryLanc.Open;
  qryLanc.EnableControls;
  //
  qryTot.Close;
  qryTot.Params[0].AsInteger := iIdCaixaPeq;
  qryTot.Open;
  //
  If iIdCaixaPeq > 0 Then
     Begin
        qryForn.Close;
        qryForn.Params[0].AsInteger := qryCP.FieldByName('IDFORCLI').asInteger;
        qryForn.Open;
     End;
End;

procedure TFrmEfetivCaixaPeq.dblcCaixaPeqCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If modified Then
    Begin
        if (dblcCaixaPeq.Text) <> '' Then
           SelLanc( StrToInt(dblcCaixaPeq.LookupValue))
        Else
           SelLanc(-1);
    End;
end;

Function TFrmEfetivCaixaPeq.GravaContabForn : LongInt;
Var
   iPlanilha : LongInt;
   sConta       : String;
   sSubConta    : String;
   sCentroCusto : String;
   rValor       : Double;
Begin
    If Not chkEncerra.Checked then
      Begin
         sConta       := qryForn.FieldByName('CONTACFORN').AsString;
         sSubConta    := qryForn.FieldByName('CODSUBCONTA').AsString;
         sCentroCusto := qryForn.FieldByName('CODCENTROCUSTO').AsString;
         rValor       := qryTot.FieldByName('TOTAL').AsFloat;
      End
    Else
      begin
         sConta       := qryCliCONTACRECEITA.AsString;
         sSubConta    := qryCliCODSUBCONTA.AsString;
         sCentroCusto := qryCliCODCENTROCUSTO.AsString;
         rValor       := qryCPVLRTOTCAIXAPEQ.AsFloat;
      End;
    iPlanilha := 0;
    Result := LancaContab(True,'BASEDADOS', DateToStr(edDataEfet.Date) ,
                          IntToStr(Sistema.idModulo),'1','C','','','','','','','','','',
                          '',IntToStr(iIdBordero),sHist1,sHist2,sHist3,sHist4,sHist5,
                          '03','','',sCentroCusto,
                          sConta,
                          iExercicio,iPeriodo,iEmpresa,Sistema.IdUsuario,
                          IntegraBack.Plano,rValor,
                          0,0,0,0,0,0,0,0,'',False,0,0,
                          '',sSubConta,'','',
                          iPlanilha,sMsg,IntegraBack.MascaraPlano,True,0,
                          Modulo.iidPlanoPrev,Modulo.iIdPatro,Sistema.UsaPlanoPatro);
End;

Function TFrmEfetivCaixaPeq.GravaContabLanc( iPlanilha : LongInt ) : Boolean;
Var
   x : LongInt;
Begin
    FuncaoGeral.ArrumaHistorico(sHist+' - '+qryLanc.FieldByName('HISTLANCAMENTO').asString,sHist1,sHist2,sHist3,sHist4,sHist5);
    //
    x := LancaContab(True,'BASEDADOS',DateToStr(edDataEfet.Date),
                     IntToStr(Sistema.idModulo),'0','D','','','','','','','','','','',
                     qryLanc.FieldByName('NODOCUMENTO').asString,sHist1,sHist2,sHist3,sHist4,sHist5,
                     '03',qryLanc.FieldByName('CODCENTROCUSTO').AsString,
                     qryLanc.FieldByName('PLACONTA').AsString,'','',
                     iExercicio, iPeriodo,iEmpresa,Sistema.IdUsuario,
                     IntegraBack.Plano,qryLanc.FieldByName('VLRLANC').AsFloat,
                     0,0,0,0,0,0,0,0,qryLanc.FieldByName('UNIDNEGOC').AsString,False,0,0,
                     qryLanc.FieldByName('CODSUBCONTA').AsString,'','','',
                     iPlanilha,sMsg,IntegraBack.MascaraPlano,True,0,
                     Modulo.iidPlanoPrev,Modulo.iIdPatro,Sistema.UsaPlanoPatro);
    Result := x > 0;
End;

Function TFrmEfetivCaixaPeq.GravaContabCar( iPlanilha : LongInt ) : Boolean;
Var
   x : LongInt;
   rValCapCar : Double;
   sConta, sSubConta, sCentroCusto : String;
Begin
    FuncaoGeral.ArrumaHistorico(sHist,sHist1,sHist2,sHist3,sHist4,sHist5);
    //
    rValCapCar   := qryCPVLRTOTCAIXAPEQ.AsFloat - qryTot.FieldByName('TOTAL').AsFloat;
    sConta       := qryCliCONTACCLIENTE.AsString;
    sSubConta    := qryCliCODSUBCONTA.AsString;
    sCentroCusto := qryCliCODCENTROCUSTO.AsString;
    //
    x := LancaContab(True,'BASEDADOS',DateToStr(edDataEfet.Date),
                     IntToStr(Sistema.idModulo),'0','D','','','','','','','','','','',
                     IntToStr(iIdBordero),sHist1,sHist2,sHist3,sHist4,sHist5,
                     '03',sCentroCusto,sConta,'','',
                     iExercicio, iPeriodo,iEmpresa,Sistema.IdUsuario,
                     IntegraBack.Plano,rValCapCar,
                     0,0,0,0,0,0,0,0,dblcAtiv.LookUpValue,False,0,0,
                     sSubConta,'','','',
                     iPlanilha,sMsg,IntegraBack.MascaraPlano,True,0,
                     Modulo.iidPlanoPrev,Modulo.iIdPatro,Sistema.UsaPlanoPatro);
    Result := x > 0;
End;

Function TFrmEfetivCaixaPeq.GravaBordero( iPlanilha, iCodDoc : LongInt; IdBordero : LongInt) : Boolean;
Var
  sSql      : String;
  sPlanilha : String;
Begin
    If IntegraBack.Contabilidade = 'S' Then
       sPlanilha := IntToStr(iPlanilha)
    Else
       sPlanilha := ' NULL ';

    sSql   := 'INSERT INTO BORDEROCAIXAPEQ (IDBORDEROCXPEQ,CODDOCUMENTO,PLNCODIGO,DATAEFETBORDERO)'+
              'VALUES ('+IntToStr(IdBordero)+','+IntToStr(iCodDoc)+','+sPlanilha+',TO_DATE('''+DateToStr(edDataEfet.Date)+''',''DD/MM/YYYY''))';
    Result := ExecutarQuery(DtmBaseDados.qry,sSql);
    If  Result Then
        Begin
            sSql   := ' UPDATE LANCCAIXAPEQ SET IDBORDEROCXPEQ = '+IntToStr(IdBordero)+
                      ' WHERE  ( IDBORDEROCXPEQ IS NULL) '+
                      '    AND (IDCAIXAPEQUENO = '+Trim(dblcCaixaPeq.LookupValue)+')';
            Result := ExecutarQuery(DtmBaseDados.qry,sSql);
        End;
End;

Function TFrmEfetivCaixaPeq.VerifRateio( idCodDoc,iUnidNegoc : LongInt; sCodTipRecDes,sRecPag,sCodCentResp : String ) : Boolean;
Begin
   qryRateio.Close;
   qryRateio.ParamByName('pCODDOCUMENTO').AsInteger   := idCodDoc;
   qryRateio.ParamByName('pUNIDNEGOC').AsInteger      := iUnidNegoc;
   qryRateio.ParamByName('pCODTIPRECDES').AsString    := sCodTipRecDes;
   qryRateio.ParamByName('pRECPAG').AsString          := sRecPag;
   qryRateio.ParamByName('pCODCENTRORESPON').AsString := sCodCentResp;
   qryRateio.ParamByName('pIDPESSOA').AsInteger       := Sistema.IdEmpresa;
   qryRateio.Open;
   Result := Not qryRateio.IsEmpty;
End;

Procedure TFrmEfetivCaixaPeq.Efetiva;
Var
   iPlanilha        : LongInt;
   iCodDoc          : LongInt;
   iCodSubConta     : LongInt;
   iPlano           : LongInt;
   iNumLancto       : LongInt;
   rNumDoc          : Real;
   sConta           : String;
   sSubConta        : String;
   sCodControCusto  : String;
   sCentroCusto     : String;
   x                : Byte;
   bDuplicado       : Boolean;
   sCompl           : String;
   rValor           : Double;
   rValorOut        : Double;
   sDataVenc        : String;
   sRecPag          : String;
   rValCapCar       : Double;
   iTipoDoc         : LongInt;
   iCodforma        : LongInt;
   sTipoDoc         : String;
Begin
    sDataVenc := DateToStr(DiasUteis.SomaDiasUteis(edDataEfet.Date ,qryCP.FieldByName('NUMDIASVENC').AsInteger,
                             qryEmpresaProp.FieldByName('IDCIDADES').AsInteger,qryEmpresaProp.FieldByName('IDPAIS').AsInteger,
                             qryEmpresaProp.FieldByName('IDESTADO').AsString,False,True,False) );
    Try
         StartTransacao;
         iIdBordero := LeUltRegistro(nil,'BORDEROCAIXAPEQ');
         sHist := 'Lançamento do caixa pequeno '+dblcCaixaPeq.Text+' bordero Nº'+IntToStr(iIdBordero);
         If IntegraBack.Contabilidade = 'S' Then
            Begin
               FuncaoGeral.ArrumaHistorico(sHist,sHist1,sHist2,sHist3,sHist4,sHist5);
               iPlanilha := GravaContabForn;
               if iPlanilha < 0 then
                  Abort;
            End
         Else
            iPlanilha := 0;
         rNumDoc := StrToFloat(IntToStr( iIdBordero ));
         sCompl  := '';
         bDuplicado := Documento.ValidaNumDoc(qryDoc,sRecPag,qryCP.FieldByName('IDFORCLI').asInteger,
                                       rNumDoc,sCompl,iCodDoc,iCodSubConta,iPlano,sConta,sCodControCusto);
         x := 0;
         While ( bDuplicado ) and ( x <= 250 ) Do
            Begin
                inc( x );
                sCompl := IntToStr( x );
                bDuplicado := Documento.ValidaNumDoc(qryDoc,sRecPag,qryCP.FieldByName('IDFORCLI').asInteger,
                                                     rNumDoc,sCompl,iCodDoc,iCodSubConta,iPlano,sConta,sCodControCusto);
            End;
         if bDuplicado Then
            Begin
               MsgDlg('Nº de Documento Já existe para este Fornecedor.','Erro',mtError,[mbOk],0);
               Abort;
            End;
     //---------------------------------------------------------------------------------------------------------------------------------------------------------
     // Verifica se é encerramento de caixa pequeno
     //---------------------------------------------------------------------------------------------------------------------------------------------------------
         If Not chkEncerra.Checked then
            Begin
               sRecPag      := 'P';
               rValCapCar   := qryTot.FieldByName('TOTAL').AsFloat;
               sConta       := qryForn.FieldByName('CONTACFORN').AsString;
               sSubConta    := qryForn.FieldByName('CODSUBCONTA').AsString;
               sCentroCusto := qryForn.FieldByName('CODCENTROCUSTO').AsString;
               iTipoDoc     := qryCP.FieldByName('CODTIPDOC').AsInteger;
               iCodforma    := qryCP.FieldByName('CODFORMA').AsInteger;
               sTipoDoc     := 'C';
            End
         Else
            Begin
               sRecPag      := 'R';
               rValCapCar   := qryCPVLRTOTCAIXAPEQ.AsFloat - qryTot.FieldByName('TOTAL').AsFloat;
               sConta       := qryCliCONTACCLIENTE.AsString;
               sSubConta    := qryCliCODSUBCONTA.AsString;
               sCentroCusto := qryCliCODCENTROCUSTO.AsString;
               iTipoDoc     := StrToInt(dblcTipoDoc.LookupValue);
               iCodforma    := StrToInt(dblcForma.LookupValue);
               sTipoDoc     := 'D';
            End;
         iCodDoc := Documento.GetCodigo(nil);
         Documento.Referencia := edRef.Text;
         Documento.Obs        := memObs.Text;
         // Criar Documento na Tabela Documento
         Documento.Inserir(qryDoc,iCodDoc,IntToStr(Sistema.idModulo),IntToStr(IntegraBack.Plano),
                           sConta,
                           sCentroCusto,-1,-1,Sistema.idEmpresa,
                           qryCP.FieldByName('IDFORCLI').AsInteger,iTipoDoc,-1,
                           sRecPag,rNumDoc,sCompl,DateToStr(edDataEfet.Date),
                           sDataVenc,sDataVenc,'0',-1,'2',
                           Sistema.IdUsuario,StrToIntDef(sSubConta,0),iCodForma,
                           '','',False,-1,-1,-1);
         // Gerando LanctoDocum
         iNumLancto := Documento.GerarNumLancto(nil,iCodDoc);
         Documento.CriarLanctoDoc(qryDoc, iCodDoc, iNumLancto,-1, iPlanilha, DateToStr(edDataEfet.Date),rValCapCar,
                                  0,-1,sTipoDoc,'2',sHist, Sistema.IdUsuario, False,-1,'');

         If not chkEncerra.Checked Then
            Begin
               qryLanc.First;
               While Not qryLanc.EOF Do
                  Begin
                      BarProc.Position := BarProc.Position + 1;
                      Application.ProcessMessages;
                      If IntegraBack.Contabilidade = 'S' Then
                         if Not GravaContabLanc( iPlanilha ) Then
                            Abort;
                      // Gera Rateio dos Lançamentos para o Documento Gerado acima
                      If Not VerifRateio( iCodDoc,qryLanc.FieldByName('UNIDNEGOC').asInteger,
                                          qryLanc.FieldByName('CODTIPRECDES').AsString,
                                          qryLanc.FieldByName('RECPAG').AsString,
                                          qryLanc.FieldByName('CODCENTRORESPON').AsString)
                      Then
                          Documento.Rateio.Inserir(iCodDoc,qryLanc.FieldByName('CODTIPRECDES').AsString,
                                                   qryLanc.FieldByName('RECPAG').AsString,qryLanc.FieldByName('CODCENTRORESPON').AsString,
                                                   Sistema.IdEmpresa,qryLanc.FieldByName('VLRLANC').AsFloat,
                                                   -1,Sistema.IdUsuario,qryLanc.FieldByName('UNIDNEGOC').asInteger,-1,qryLancCODCENTROCUSTO.AsString,Modulo.iIdPatro,-1,Modulo.iIdPlanoPrev)
                      Else
                         Begin
                            rValor    := qryLanc.FieldByName('VLRLANC').AsFloat + qryRateio.FieldByName('VALOR').AsFloat;
                            rValorOut := qryRateio.FieldByName('VALOROUTRAMOEDA').AsFloat;
                            //
                            Documento.Rateio.Alterar(iCodDoc,qryLanc.FieldByName('CODTIPRECDES').AsString,
                                                     qryLanc.FieldByName('RECPAG').AsString,qryLanc.FieldByName('CODCENTRORESPON').AsString,
                                                     Sistema.IdEmpresa,qryLanc.FieldByName('UNIDNEGOC').AsInteger,rValor,rValorOut,qryLancCODCENTROCUSTO.AsString,qryRateio.FieldByName('IDRATEIODOCUM').AsInteger,
                                                     Sistema.IdUsuario,-1,qryLanc.FieldByName('UNIDNEGOC').AsInteger,Modulo.iIdPatro,-1, Modulo.iidPlanoPrev);
                         End;
                      qryLanc.Next;
                  End;
            End
         Else
            Begin
               qryLanc.First;
               While Not qryLanc.EOF Do
                  Begin
                      BarProc.Position := BarProc.Position + 1;
                      Application.ProcessMessages;
                      If IntegraBack.Contabilidade = 'S' Then
                         if Not GravaContabLanc( iPlanilha ) Then
                            Abort;
                       qryLanc.Next;
                  End;
               if Not GravaContabCar( iPlanilha ) Then
                  Abort;
               Documento.Rateio.Inserir(iCodDoc,dblcTipRec.LookupValue,
                                        sRecPag,dblcCentRespon.LookupValue,
                                        Sistema.IdEmpresa,rValCapCar,
                                        -1,Sistema.IdUsuario,StrToInt(dblcAtiv.LookupValue),-1,dblcCCust.LookupValue,Modulo.iIdPatro,-1,Modulo.iIdPlanoPrev);
            End;
         If Not GravaBordero(iPlanilha, iCodDoc, iIdBordero) Then
            Abort;
         If (chkEncerra.Checked ) And (Not EncerraCaixa) then
            Abort;
        CommitTransacao;
        MsgDlg('Gerado o borderô Nº : '+IntToStr( iIdBordero ),'Informação',mtInformation,[mbOk],0);
   Except
       RollBackTransacao;
       MsgDlg('Erro ao tentar gerar o borderô Nº : '+IntToStr( iIdBordero ),'Erro',mtError,[mbOk],0);
       Raise;
   End;
End;

procedure TFrmEfetivCaixaPeq.BtnEfetivaClick(Sender: TObject);
begin
  inherited;
  If MessageDlg('Confirma a efetivação',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
     Begin
        If MsgDlg('Confirma efetivação do bordero','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes Then
          Begin
             If ((chkEncerra.Checked) And (MessageDlg('Confirma o Encerramento do Caixa pequeno',mtConfirmation,[mbYes,mbNo],0) = mrYes)) or ((not chkEncerra.Checked)) Then
                Begin
                   if Trim(dblcCaixaPeq.Text) ='' Then
                     Begin
                         MsgDlg('Caixa pequeno não selecionado','Erro',mtError,[mbOk],0);
                         dblcCaixaPeq.SetFocus;
                     End
                   Else
                   If Trim(edDataEfet.Text) = '' then
                     Begin
                        MsgDlg('Obrigatório preencher a data de efetivação','Erro',mtError,[mbOk],0);
                        edDataEfet.SetFocus;
                     end
                   Else
                   If edDataEfet.Date > Date then
                      Begin
                         MsgDlg('Data não pode ser maior que hoje','Erro',mtError,[mbOk],0);
                         edDataEfet.SetFocus;
                     end
                   Else
                   If (Integraback.Contabilidade = 'S') And
                      ( TestaPeriodo(False,'BASEDADOS', DateToStr(edDataEfet.Date), IntToStr(Sistema.idModulo),
                                      iExercicio, iPeriodo, iEmpresa ,sMsg ) <> 0 )
                   Then
                      Begin
                         MsgDlg(sMsg,'Erro',mtError,[mbOk],0);
                         edDataEfet.SetFocus;
                       End
                   Else
                   if qryLanc.IsEmpty Then
                     Begin
                        MsgDlg('Não há lançamento para efetivar','Erro',mtError,[mbOk],0);
                        dblcCaixaPeq.SetFocus;
                     End
                   Else
                   If (chkEncerra.Checked) Then
                      Begin
                         if (not BuscaCliente(qryIDFORCLI.AsInteger) ) Then
                           Begin
                              MsgDlg('o Fornecedor Não é um cliente, Para  que se possa encerrar o caixa pequeno','Erro',mtError,[mbOk],0);
                              pgc.ActivePageIndex := 1;
                              dblcCaixaPeq.SetFocus;
                              exit;
                           End;
                         if Trim(dblcTipoDoc.Text) ='' Then
                           Begin
                              MsgDlg('Tipo de Documento não selecionado','Erro',mtError,[mbOk],0);
                              pgc.ActivePageIndex := 1;
                              dblcTipoDoc.SetFocus;
                              exit;
                           End;
                         if Trim(dblcForma.Text) ='' Then
                           Begin
                              MsgDlg('Tipo de Cobrança','Erro',mtError,[mbOk],0);
                              pgc.ActivePageIndex := 1;
                              dblcForma.SetFocus;
                              exit;
                           End;
                         if Trim(dblcTipRec.Text) ='' Then
                           Begin
                              MsgDlg('Tipo de Recebimento não selecionado','Erro',mtError,[mbOk],0);
                              pgc.ActivePageIndex := 1;
                              dblcTipRec.SetFocus;
                              exit;
                           End;
                         if Trim(dblcCentRespon.Text) ='' Then
                           Begin
                              MsgDlg('Centro de Responsabilidade não selecionado','Erro',mtError,[mbOk],0);
                              pgc.ActivePageIndex := 1;
                              dblcCentRespon.SetFocus;
                              exit;
                           End;
                         if Trim(dblcAtiv.Text) ='' Then
                           Begin
                              MsgDlg('Atividade/Projeto não selecionado','Erro',mtError,[mbOk],0);
                              pgc.ActivePageIndex := 1;
                              dblcAtiv.SetFocus;
                              exit;
                           End;
                         if Trim(dblcCCust.Text) ='' Then
                           Begin
                              MsgDlg('Centro de Custo não selecionado','Erro',mtError,[mbOk],0);
                              pgc.ActivePageIndex := 1;
                              dblcCCust.SetFocus;
                              exit;
                           End;
                      End;
                   lbProc.Visible   := True;
                   barProc.Visible  := True;
                   Application.ProcessMessages;
                   BarProc.Min      := 0;
                   BarProc.Position := 0;
                   BarProc.Max      := qryLanc.RecordCount;
                   Efetiva;
                   lbProc.Visible   := False;
                   barProc.Visible  := False;
                   SelLanc(StrToInt(dblcCaixaPeq.LookupValue));
                End;
          End;
     End;
end;

procedure TFrmEfetivCaixaPeq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If qryRateio.Prepared Then
     Begin
        qryRateio.Close;
        qryRateio.UnPrepare;
     end;
  inherited;
end;

function TFrmEfetivCaixaPeq.BuscaCliente(n: Integer): Boolean;
begin
   qryCli.Close;
   qryCli.ParamByName('pIDFORCLI').AsInteger := n;
   qryCli.Open;
   Result:= Not qryCli.IsEmpty;
end;

function TFrmEfetivCaixaPeq.EncerraCaixa: Boolean;
Var
    SQL : String;
begin
   SQL := ' UPDATE CAIXAPEQUENO SET VLRTOTCAIXAPEQ = 0,VLRMAXLANC =0 '+
          ' WHERE (IDCAIXAPEQUENO = '+IntToStr(qryIDCAIXAPEQUENO.AsInteger)+')';
   Result :=  ExecutarQuery(DtmBaseDados.qry,SQL);


end;

end.

