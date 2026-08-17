unit FIntEntNotaCont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  ComCtrls, DBTables, Db, Wwquery, Wwdatsrc, IvDictio, IvMulti, IvEMulti;

type
  TfrmIntEntNotaCont = class(TfrmSairAjuda)
    bbtnIntegra: TBitBtn;
    prgBarIntegracao: TProgressBar;
    Panel1: TPanel;
    Memo1: TMemo;
    dsContab: TwwDataSource;
    qryContab: TwwQuery;
    qryContabLACNUMLAN: TFloatField;
    qryContabLACDEBCRE: TStringField;
    qryContabPLACONTA: TStringField;
    qryContabCODSUBCONTA: TFloatField;
    qryContabLACVALOR: TFloatField;
    qryContabLACNUMDOC: TStringField;
    qryContabLACHIST1: TStringField;
    qryContabLACHIST2: TStringField;
    qryContabUNIDNEGOC: TFloatField;
    qryContabCODCENTROCUSTO: TStringField;
    qryContabPLNCODIGO: TFloatField;
    qryContabIDELEMDEMONSTRAT: TFloatField;
    qryContabHITCODHIST: TStringField;
    qryContabIDPESSOA: TFloatField;
    qryContabIDEMPRESA: TFloatField;
    qryContabIDMODULO: TFloatField;
    qryContabIDUSUARIOINCLUSAO: TFloatField;
    qryContabPLANO: TFloatField;
    qryContabLACTIPO: TStringField;
    qryContabLACHIST3: TStringField;
    qryContabLACHIST4: TStringField;
    qryContabLACHIST5: TStringField;
    qryContabLACTIPCONVOFICIAL: TStringField;
    qryContabLACVALOFICIAL: TFloatField;
    qryContabLACTIPCONVGER: TStringField;
    qryContabLACVALGERENCIAL: TFloatField;
    qryContabLACTIPCONVGEREN1: TStringField;
    qryContabLACVALGEREN1: TFloatField;
    qryContabLACTIPCONVGEREN2: TStringField;
    qryContabLACVALGEREN2: TFloatField;
    qryContabLACATOUTMOEDA: TStringField;
    qryContabLACORIGEMAPLIC: TStringField;
    qryContabTIPCODIGO: TStringField;
    qryContabLACVALHIST: TFloatField;
    qryContabLOTETRANSMISSAO: TFloatField;
    qryContabTRGDTINCLUSAO: TDateTimeField;
    qryContabTRGUSERINCLUSAO: TStringField;
    updContab: TUpdateSQL;
    qry: TwwQuery;
    qryDet: TwwQuery;
    qryAgregItemDef: TwwQuery;
    qryAgregNota: TwwQuery;
    qryAgregNotaALIQUOTA: TFloatField;
    qryAgregNotaBASECALCULO: TFloatField;
    qryAgregNotaVLRAGREGADO: TFloatField;
    qryAgregNotaCODTIPOCUSTAGREG: TFloatField;
    qryAgregNotaCODTRATFISCE: TStringField;
    qryAgregNotaPERCVALOR: TStringField;
    qryAgregNotaIDNFRECEBDEVOL: TFloatField;
    qryAgregNotaIDNFCOMPLEMENTAR: TFloatField;
    qryAgregNotaIDAGRNFRECDEV: TFloatField;
    qryAgregNotaVLRRECUPERADO: TFloatField;
    qryAgregNFCompl: TwwQuery;
    qryAgregNFComplALIQUOTA: TFloatField;
    qryAgregNFComplBASECALCULO: TFloatField;
    qryAgregNFComplVLRAGREGADO: TFloatField;
    qryAgregNFComplCODTIPOCUSTAGREG: TFloatField;
    qryAgregNFComplCODTRATFISCE: TStringField;
    qryAgregNFComplPERCVALOR: TStringField;
    qryAgregNFComplIDNFRECEBDEVOL: TFloatField;
    qryAgregNFComplIDNFCOMPLEMENTAR: TFloatField;
    qryAgregNFComplIDAGRNFRECDEV: TFloatField;
    qryAgregNFComplVLRRECUPERADO: TFloatField;
    qryNFAgreg: TwwQuery;
    qryNFAgregIDNFRECEBDEVOL: TFloatField;
    qryNFAgregNUMNF: TFloatField;
    qryNFAgregCOMPLNF: TStringField;
    qryNFAgregDATAEMISNF: TDateTimeField;
    qryNFAgregDATAVENCTO: TDateTimeField;
    qryNFAgregCODFISCAL: TStringField;
    qryNFAgregIDFORCLI: TFloatField;
    qryNFAgregDATAENTDEVOL: TDateTimeField;
    qryNFAgregVLRNOTAFISCAL: TFloatField;
    qryNFAgregPLNCODIGO: TFloatField;
    qryNFAgregIDPESSOA: TFloatField;
    qryNFAgregCODDOCUMENTO: TFloatField;
    qryNFAgregFLGTIPONOTA: TStringField;
    qryNFAgregIDNFREFERENCIA: TFloatField;
    qryAux: TwwQuery;
    qryFornecedor: TwwQuery;
    qryAuxFuncao: TwwQuery;
    qryNFAgregVALOR: TFloatField;
    qryAgregNFComplDESCCUSTAGREG: TStringField;
    qryAgregNotaDESCCUSTAGREG: TStringField;
    procedure bbtnIntegraClick(Sender: TObject);
  private
    procedure FazerInserirContab(sContaContabil,sCentroCusto,sDebCre,sTipoDC,sHistorico,sNumDoc:String;
                                                iUnidNegoc,iSubConta:LongInt;rValorCorrente,rValorMoeda:Real);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIntEntNotaCont: TfrmIntEntNotaCont;

implementation

Uses uSistema,uModulo,uMensErro,dBaseDados,
     uDataBase,uIntegraBack, uLancContab, uFuncaoGeral;
{$R *.DFM}

procedure TfrmIntEntNotaCont.bbtnIntegraClick(Sender: TObject);
var rValorZero,rValRecup,rValRef,rTotRefCalculo:Double;
    liRetFuncao,liExercicio,liPeriodo,liEmpresa,iSubContaForne,iPlnCodigo:LongInt;
    sPlano,sCCustoForne,sContaForne,sCCustoPadrao,
    sMens,sCCustoGrava,sHistorico,sSql,sNumDoc:String;
begin
  inherited;
  rValorZero:=0;
  //
  sCCustoPadrao:= Modulo.sCodCCusto;
  liEmpresa    := Sistema.IdEmpresa;
  //
  qry.Close;
  qry.ParamByName('IDPESSOA').Value:=Sistema.IdEmpresa;
  qry.Open;
  //
  qry.First;
  While not qry.EOF do
  Begin
     //
     qryFornecedor.Close;
     qryFornecedor.ParamByName('iEmpresa').Value:=Sistema.idEmpresa;
     qryFornecedor.ParamByName('iForCli').Value :=qry.FieldByName('IDFORCLI').AsInteger;
     qryFornecedor.Open;
     //
     sContaForne   :=qryFornecedor.FieldByName('CONTACFORN').AsString;
     sCCustoForne  :=qryFornecedor.FieldByName('CODCENTROCUSTO').AsString;
     iSubContaForne:=qryFornecedor.FieldByName('CODSUBCONTA').AsInteger;
     //
     qryContab.Close;
     qryContab.Open;
     //
     qryDet.Close;
     qryDet.ParamByName('pNUMIDNF').Value:=qry.FieldByName('IDNFRECEBDEVOL').AsInteger;
     qryDet.Open;
     //
     qryAgregItemDef.Close;
     qryAgregItemDef.ParamByName('iAgregItem').Value:=qry.FieldByName('IDNFRECEBDEVOL').AsInteger;
     qryAgregItemDef.Open;
     //
     qryAgregNota.Close;
     qryAgregNota.ParamByName('iAgregNota').Value:=qry.FieldByName('IDNFRECEBDEVOL').AsInteger;
     qryAgregNota.Open;
     //
     rTotRefCalculo:=0;
     qryDet.First;
     While not qryDet.EOF do
     Begin
        rTotRefCalculo:=rTotRefCalculo + (qryDet.FieldByName('QTDERECEBDEVOL').AsFloat*qryDet.FieldByName('VLRUNITARIO').AsFloat);
        qryDet.Next;
     end;
     //
     qryAgregNota.First;
     While not qryAgregNota.EOF do
     Begin
        //
        qryAux.Close;
        qryAux.SQL.Text:='SELECT T.DESCCUSTAGREG,C.CODCENTROCUSTO,C.CODSUBCONTA,C.PLACONTA,C.UNIDNEGOC FROM '+
                         ' TIPOAGRE T,TIPCUSTAGREGCONTA C WHERE (C.CODTIPOCUSTAGREG = '+qryAgregNota.FieldByName('CODTIPOCUSTAGREG').AsString+')'+
                         ' AND (C.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+') AND (C.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)';
        qryAux.Open;
        //
        sNumDoc   :=trim(qry.FieldByName('NUMNF').AsString)+'/'+qry.FieldByName('COMPLNF').AsString;
        sHistorico:=trim(qryAux.FieldByName('DESCCUSTAGREG').AsString)+' s/ NF. '+trim(qry.FieldByName('NUMNF').AsString)+
                 '/'+qry.FieldByName('COMPLNF').AsString+' '+
                 trim(qryFornecedor.FieldByName('RAZAOSOCIAL').AsString);
        //
        if (qryAgregNota.FieldByName('CODTRATFISCE').AsString = '5') then
        Begin
           //
           qryNFAgreg.Close;
           qryNFAgreg.ParamByName('pIDNFCompl').Value :=qryAgregNota.FieldByName('IDNFCOMPLEMENTAR').AsInteger;
           qryNFAgreg.Open;
           //
           qryAgregNFCompl.Close;
           qryAgregNFCompl.ParamByName('iAgregNF').Value :=qryAgregNota.FieldByName('IDNFCOMPLEMENTAR').AsInteger;
           qryAgregNFCompl.Open;
           //
           qryNFAgreg.First;
           While not qryNFAgreg.EOF do
           Begin
              qryAux.Close;
              qryAux.SQL.Text:='SELECT P.RAZAOSOCIAL,E.CODCENTROCUSTO,E.CONTACFORN,E.CODSUBCONTA FROM '+
                               ' EMPRESAFORN E,PESSOA P WHERE (E.IDFORCLI = '+qryNFAgreg.FieldByName('IDFORCLI').AsString+')'+
                               ' AND (E.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+') AND (P.IDPESSOA = E.IDFORCLI)';
              qryAux.Open;
              //
              sCCustoGrava:=qryAux.FieldByName('CODCENTROCUSTO').AsString;
              if sCCustoGrava = '' then
                 sCCustoGrava:=sCCustoPadrao;
              sNumDoc   :=trim(qry.FieldByName('NUMNF').AsString)+'/'+qry.FieldByName('COMPLNF').AsString;
              sHistorico:='Lançamento NF. '+trim(qryNFAgreg.FieldByName('NUMNF').AsString)+'/'+qryNFAgreg.FieldByName('COMPLNF').AsString+' '+trim(qryAux.FieldByName('RAZAOSOCIAL').AsString);
              FazerInserirContab(qryAux.FieldByName('CONTACFORN').AsString,sCCustoGrava,'C','1',sHistorico,sNumDoc,
              Modulo.iUnidadeNegocPadrao,qryAux.FieldByName('CODSUBCONTA').AsInteger,qryNFAgreg.FieldByName('VALOR').AsFloat,0);
              qryNFAgreg.Next;
           end;
           //
           qryAgregNFCompl.First;
           While not qryAgregNFCompl.EOF do
           Begin
              //
              qryAux.Close;
              qryAux.SQL.Text:='SELECT T.DESCCUSTAGREG,C.CODCENTROCUSTO,C.CODSUBCONTA,C.PLACONTA,C.UNIDNEGOC FROM '+
                               ' TIPOAGRE T,TIPCUSTAGREGCONTA C WHERE (C.CODTIPOCUSTAGREG = '+qryAgregNFCompl.FieldByName('CODTIPOCUSTAGREG').AsString+')'+
                               ' AND (C.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+') AND (C.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)';
              qryAux.Open;
              //
              sNumDoc   :=trim(qry.FieldByName('NUMNF').AsString)+'/'+qry.FieldByName('COMPLNF').AsString;
              sHistorico:=trim(qryAux.FieldByName('DESCCUSTAGREG').AsString)+' s/ NF. '+trim(qry.FieldByName('NUMNF').AsString)+
                 '/'+qry.FieldByName('COMPLNF').AsString+' '+
                 trim(qryFornecedor.FieldByName('RAZAOSOCIAL').AsString);
              //
              if (qryAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '1') or
                 (qryAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '7') then
              Begin
                  FazerInserirContab(qryAux.FieldByName('PLACONTA').AsString,qryAux.FieldByName('CODCENTROCUSTO').AsString,'C','1',sHistorico,sNumDoc,
                  qryAux.FieldByName('UNIDNEGOC').AsInteger,qryAux.FieldByName('CODSUBCONTA').AsInteger,qryAgregNFCompl.FieldByName('VLRAGREGADO').AsFloat,0);
              end;
              //
              if (qryAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '2') or
                 (qryAgregNFCompl.FieldByName('CODTRATFISCE').AsString = '3') then
              Begin
                 //Contabilização dos Agregados da Nota que Recuperam Imposto
                 qryDet.First;
                 While not qryDet.EOF do
                 Begin
                    rValRef:=(qryDet.FieldByName('QTDERECEBDEVOL').AsFloat*qryDet.FieldByName('VLRUNITARIO').AsFloat);
                    if qryDet.FieldByName('CONSUMOREVENDA').AsString = 'R' then
                    Begin
                       rValRecup:=0;
                       if rTotRefCalculo <> 0 then
                          rValRecup:=(qryAgregNFCompl.FieldByName('VLRAGREGADO').AsFloat*rValRef/rTotRefCalculo);
                       FazerInserirContab(qryAux.FieldByName('PLACONTA').AsString,qryAux.FieldByName('CODCENTROCUSTO').AsString,'D','0',sHistorico,sNumDoc,
                       qryAux.FieldByName('UNIDNEGOC').AsInteger,qryAux.FieldByName('CODSUBCONTA').AsInteger,rValRecup,0);
                    end;
                    qryDet.Next;
                 end;
              end;
              qryAgregNFCompl.Next;
           end;
        end;
        if (qryAgregNota.FieldByName('CODTRATFISCE').AsString = '1') or
           (qryAgregNota.FieldByName('CODTRATFISCE').AsString = '7') then
        Begin
           FazerInserirContab(qryAux.FieldByName('PLACONTA').AsString,qryAux.FieldByName('CODCENTROCUSTO').AsString,'C','1',sHistorico,sNumDoc,
           qryAux.FieldByName('UNIDNEGOC').AsInteger,qryAux.FieldByName('CODSUBCONTA').AsInteger,qryAgregNota.FieldByName('VLRAGREGADO').AsFloat,0);
        end;
        //
        if (qryAgregNota.FieldByName('CODTRATFISCE').AsString = '2') or
           (qryAgregNota.FieldByName('CODTRATFISCE').AsString = '3') then
        Begin
           //Contabilização dos Agregados da Nota que Recuperam Imposto
           qryDet.First;
           While not qryDet.EOF do
           Begin
              rValRef:=(qryDet.FieldByName('QTDERECEBDEVOL').AsFloat*qryDet.FieldByName('VLRUNITARIO').AsFloat);
              if qryDet.FieldByName('CONSUMOREVENDA').AsString = 'R' then
              Begin
                 rValRecup:=0;
                 if rTotRefCalculo <> 0 then
                    rValRecup:=(qryAgregNota.FieldByName('VLRAGREGADO').AsFloat*rValRef/rTotRefCalculo);
                 //
                 FazerInserirContab(qryAux.FieldByName('PLACONTA').AsString,qryAux.FieldByName('CODCENTROCUSTO').AsString,'D','0',sHistorico,sNumDoc,
                 qryAux.FieldByName('UNIDNEGOC').AsInteger,qryAux.FieldByName('CODSUBCONTA').AsInteger,rValRecup,0);
              end;
              qryDet.Next;
           end;
        end;
        qryAgregNota.Next;
     end;
     //
     //
     sCCustoGrava:=sCCustoForne;
     if sCCustoGrava = '' then
        sCCustoGrava:=sCCustoPadrao;
     //
     //Inserindo na Contabilidade o Valor a pagar da Nota
     sNumDoc   :=trim(qry.FieldByName('NUMNF').AsString)+'/'+qry.FieldByName('COMPLNF').AsString;
     sHistorico:='Lançamento NF. '+trim(qry.FieldByName('NUMNF').AsString)+
                 '/'+qry.FieldByName('COMPLNF').AsString+' '+
                 trim(qryFornecedor.FieldByName('RAZAOSOCIAL').AsString);
     FazerInserirContab(sContaForne,sCCustoGrava,'C','1',sHistorico,sNumDoc,
     Modulo.iUnidadeNegocPadrao,iSubContaForne,qry.FieldByName('VALOR').AsFloat,0);
     //
     qryDet.First;
     While not qryDet.EOF do
     Begin
        //
        qryAgregItemDef.First;
        While not qryAgregItemDef.EOF do
        Begin
           if qryAgregItemDef.FieldByName('IDITENSRECDEV').AsInteger = qryDet.FieldByName('IDITENSRECDEV').AsInteger then
           Begin
              if (qryAgregItemDef.FieldByName('CODTRATFISCE').AsString = '1') or
                 (qryAgregItemDef.FieldByName('CODTRATFISCE').AsString = '7') then
              Begin
                 qryAux.Close;
                 qryAux.SQL.Text:='SELECT T.DESCCUSTAGREG,C.CODCENTROCUSTO,C.CODSUBCONTA,C.PLACONTA,C.UNIDNEGOC FROM '+
                                  ' TIPOAGRE T,TIPCUSTAGREGCONTA C WHERE (C.CODTIPOCUSTAGREG = '+qryAgregItemDef.FieldByName('CODTIPOCUSTAGREG').AsString+')'+
                                  ' AND (C.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+') AND (C.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)';
                 qryAux.Open;
                 //
                 sNumDoc   :=trim(qry.FieldByName('NUMNF').AsString)+'/'+qry.FieldByName('COMPLNF').AsString;
                 sHistorico:=trim(qryAux.FieldByName('DESCCUSTAGREG').AsString)+' s/ NF. '+trim(qry.FieldByName('NUMNF').AsString)+
                 '/'+qry.FieldByName('COMPLNF').AsString+' '+
                 trim(qryFornecedor.FieldByName('RAZAOSOCIAL').AsString);
                 //
                 FazerInserirContab(qryAux.FieldByName('PLACONTA').AsString,qryAux.FieldByName('CODCENTROCUSTO').AsString,'C','1',sHistorico,sNumDoc,
                 qryAux.FieldByName('UNIDNEGOC').AsInteger,qryAux.FieldByName('CODSUBCONTA').AsInteger,qryAgregItemDef.FieldByName('VLRAGREGADO').AsFloat,0);
              end;
              if qryDet.FieldByName('CONSUMOREVENDA').AsString = 'R' then
              Begin
                 if (qryAgregItemDef.FieldByName('CODTRATFISCE').AsString = '2') or
                    (qryAgregItemDef.FieldByName('CODTRATFISCE').AsString = '3') then
                 Begin
                    qryAux.Close;
                    qryAux.SQL.Text:='SELECT T.DESCCUSTAGREG,C.CODCENTROCUSTO,C.CODSUBCONTA,C.PLACONTA,C.UNIDNEGOC FROM '+
                                     ' TIPOAGRE T,TIPCUSTAGREGCONTA C WHERE (C.CODTIPOCUSTAGREG = '+qryAgregItemDef.FieldByName('CODTIPOCUSTAGREG').AsString+')'+
                                     ' AND (C.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+') AND (C.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG)';
                    qryAux.Open;
                    //
                    sNumDoc   :=trim(qry.FieldByName('NUMNF').AsString)+'/'+qry.FieldByName('COMPLNF').AsString;
                    sHistorico:=trim(qryAux.FieldByName('DESCCUSTAGREG').AsString)+' s/ NF. '+trim(qry.FieldByName('NUMNF').AsString)+
                                '/'+qry.FieldByName('COMPLNF').AsString+' '+
                                trim(qryFornecedor.FieldByName('RAZAOSOCIAL').AsString);
                    //
                    FazerInserirContab(qryAux.FieldByName('PLACONTA').AsString,qryAux.FieldByName('CODCENTROCUSTO').AsString,'D','0',sHistorico,sNumDoc,
                    qryAux.FieldByName('UNIDNEGOC').AsInteger,qryAux.FieldByName('CODSUBCONTA').AsInteger,qryAgregItemDef.FieldByName('VLRAGREGADO').AsFloat,0);
                 end;
              end;
           end;
           qryAgregItemDef.Next;
        end;
        //Contabilizando o valor do estoque
        qryAux.Close;
        if qryDet.FieldByName('FLGDESTINO').AsString = 'C' then
           qryAux.SQL.Text:='SELECT CONTASAIDA AS CONTAENTRADA,SUBCONTASAIDA AS SUBCONTAENTRADA FROM ARTXCONTAXCC WHERE '+
                            '(CODARTIGO = '''+qryDet.fieldByName('CODARTIGO').AsString+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'
        else
           qryAux.SQL.Text:='SELECT CONTAENTRADA,SUBCONTAENTRADA FROM ARTXCONTAXCC WHERE '+
                            '(CODARTIGO = '''+qryDet.fieldByName('CODARTIGO').AsString+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')';
        qryAux.Open;
        //
        if qryAux.IsEmpty then
        Begin
           qryAuxFuncao.Close;
           qryAuxFuncao.SQL.Text:=' SELECT CODGRUPOPROD FROM PRODUTO WHERE '+
                                  ' (RTRIM(CODPRODUTO) = RTRIM('''+copy(qryDet.fieldByName('CODARTIGO').AsString,1,6)+'''))';
           qryAuxFuncao.Open;
           //
           qryAux.Close;
           if qryDet.FieldByName('FLGDESTINO').AsString = 'C' then
              qryAux.SQL.Text:='SELECT CONTASAIDA AS CONTAENTRADA,SUBCONTASAIDA AS SUBCONTAENTRADA FROM ARTXCONTAXCC WHERE '+
                               '(CODGRUPOPROD = '''+qryAuxFuncao.fieldByName('CODGRUPOPROD').AsString+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')'
           else
              qryAux.SQL.Text:=' SELECT CONTAENTRADA,SUBCONTAENTRADA FROM ARTXCONTAXCC WHERE '+
                               ' (CODGRUPOPROD = '''+qryAuxFuncao.fieldByName('CODGRUPOPROD').AsString+''') AND (IDPESSOA = '+IntToStr(Sistema.IdEmpresa)+')';
           qryAux.Open;
        end;
        sNumDoc   :=trim(qry.FieldByName('NUMNF').AsString)+'/'+qry.FieldByName('COMPLNF').AsString;
        sHistorico:='Lançamento NF. '+trim(qry.FieldByName('NUMNF').AsString)+
                 '/'+qry.FieldByName('COMPLNF').AsString+' '+
                 trim(qryFornecedor.FieldByName('RAZAOSOCIAL').AsString);
        sCCustoGrava:=qryDet.FieldByName('CODCENTROCUSTO').AsString;
        if (sCCustoGrava = '') or (qryDet.FieldByName('FLGDESTINO').AsString <> 'C') Then
           sCCustoGrava:=sCCustoPadrao;
        FazerInserirContab(qryAux.FieldByName('CONTAENTRADA').AsString,sCCustoGrava,'D','0',sHistorico,sNumDoc,
        qryDet.FieldByName('UNIDNEGOC').AsInteger,qryAux.FieldByName('SUBCONTAENTRADA').AsInteger,
        qryDet.FieldByName('VLRESTOQUE').AsFloat,0);
        //
        qryDet.Next;
     end;
     //
{     qryContab.First;
     While not qryContab.EOF do
     Begin
        if qryContab.FieldByName('LACDEBCRE').AsString = 'D' then
           rTotContaDeb:=rTotContaDeb+qryContab.FieldByName('LACVALOR').AsFloat
        else
           rTotContaCre:=rTotContaCre+qryContab.FieldByName('LACVALOR').AsFloat;
        qryContab.Next;
     end;}
     //
     try
        StartTransacao;
        sPlano:='';
        iPlnCodigo:=0;
        if IntegraBack.Contabilidade= 'S' then
        Begin
           liRetFuncao:=  TestaPeriodo(true,'BASEDADOS',qry.FieldByName('DATAENTDEVOL').AsString,IntToStr(Sistema.IdModulo),liExercicio,
                                      liPeriodo,liEmpresa,sMens);
           if liRetFuncao <> 0 then
              Abort;
           sPlano:=IntToStr(IntegraBack.Plano);
           qryContab.First;
           While not qryContab.EOF do
           Begin
              if Format('%17.2f',[qryContab.FieldByName('LACVALOR').AsFloat]) <> Format('%17.2f',[rValorZero]) then
              Begin
                 if qryContab.FieldByName('CODCENTROCUSTO').AsString <> '' then
                 Begin
                    sSQL:='INSERT INTO CONTASXCC(PLANO,PLACONTA,CODCENTROCUSTO,IDEMPRESA,IDUSUARIOINCLUSAO) VALUES('+
                          IntToStr(IntegraBack.Plano)+','''+qryContab.FieldByName('PLACONTA').AsString+''','+
                          ''''+qryContab.FieldByName('CODCENTROCUSTO').AsString+''','+IntToStr(Sistema.idEmpresa)+','+
                          IntToStr(Sistema.idUsuario)+')';
                    ExecutarQuery(qryAux,sSQL);
                 end;
                 //
                 if qryContab.FieldByName('LACDEBCRE').AsString = 'D' then
                    iPlnCodigo:=LANCACONTAB(True,'BASEDADOS',qry.FieldByName('DATAENTDEVOL').AsString,InttoStr(Sistema.IdModulo),qryContab.FieldByName('LACTIPO').AsString,
                                qryContab.FieldByName('LACDEBCRE').AsString,'','','','','','','','','','',
                                qryContab.FieldByName('LACNUMDOC').AsString,qryContab.FieldByName('LACHIST1').AsString,
                                qryContab.FieldByName('LACHIST2').AsString,qryContab.FieldByName('LACHIST3').AsString,
                                qryContab.FieldByName('LACHIST4').AsString,qryContab.FieldByName('LACHIST5').AsString,
                                '03', qryContab.FieldByName('CODCENTROCUSTO').AsString, qryContab.FieldByName('PLACONTA').AsString,
                                '','', liExercicio, liPeriodo,liEmpresa,Sistema.IdUsuario,
                                IntegraBack.Plano,qryContab.FieldByName('LACVALOR').AsFloat,
                                0,0,0,0,0,0,0,0,qryContab.FieldByName('UNIDNEGOC').AsString,False,0,0,
                                qryContab.FieldByName('CODSUBCONTA').AsString,'','','', iPlnCodigo,sMens,IntegraBack.MascaraPlano,True,0,
                                Modulo.iIdPlanoPrev,Modulo.iIdPatro,Sistema.UsaPlanoPatro)
                 else
                    iPlnCodigo:=LANCACONTAB(True,'BASEDADOS',qry.FieldByName('DATAENTDEVOL').AsString,InttoStr(Sistema.IdModulo),qryContab.FieldByName('LACTIPO').AsString,
                                qryContab.FieldByName('LACDEBCRE').AsString,'','','','','','','','','','',
                                qryContab.FieldByName('LACNUMDOC').AsString,qryContab.FieldByName('LACHIST1').AsString,
                                qryContab.FieldByName('LACHIST2').AsString,qryContab.FieldByName('LACHIST3').AsString,
                                qryContab.FieldByName('LACHIST4').AsString,qryContab.FieldByName('LACHIST5').AsString,
                                '03', '','',qryContab.FieldByName('CODCENTROCUSTO').AsString, qryContab.FieldByName('PLACONTA').AsString,
                                liExercicio, liPeriodo,liEmpresa,Sistema.IdUsuario,
                                IntegraBack.Plano,qryContab.FieldByName('LACVALOR').AsFloat,
                                0,0,0,0,0,0,0,0,qryContab.FieldByName('UNIDNEGOC').AsString,False,0,0,
                                '',qryContab.FieldByName('CODSUBCONTA').AsString,'','', iPlnCodigo,sMens,IntegraBack.MascaraPlano,True,0,
                                Modulo.iIdPlanoPrev,Modulo.iIdPatro,Sistema.UsaPlanoPatro);
                 if iPlnCodigo <= 0 then
                    Abort;
              end;
              qryContab.Next;
           end;
           if iPlnCodigo > 0 then
           Begin
              sSql:='UPDATE NFRECEBDEVOL SET PLNCODIGO = '+IntToStr(iPlncodigo)+
                    ' WHERE IDNFRECEBDEVOL = '+qry.FieldByName('IDNFRECEBDEVOL').AsString;
              if not ExecutarQuery(qryAux,sSQL) then
                 Abort;
              //
              sSql:='UPDATE LANCTODOCUM SET PLNCODIGO = '+IntToStr(iPlncodigo)+
                    ' WHERE CODDOCUMENTO = '+qry.FieldByName('CODDOCUMENTO').AsString+
                    ' AND NUMLANCTO = '+qry.FieldByName('NUMLANCTO').AsString;
              if not ExecutarQuery(qryAux,sSQL) then
                 Abort;
              //
           end;
        end;
        CommitTransacao;
     except
        RollBackTransacao;
        MsgDlg('Contabilização da Nota '+trim(qry.FieldByName('NUMNF').AsString)+
               '/'+qry.FieldByName('COMPLNF').AsString+' '+
               trim(qryFornecedor.FieldByName('RAZAOSOCIAL').AsString)+' não Efetuada','Erro',mtError,[mbOk],0);
        FuncaoGeral.TiraIcone;
//        Raise;
     end;
     qry.Next;
  end;
  //
end;

procedure TfrmIntEntNotaCont.FazerInserirContab(sContaContabil,sCentroCusto,sDebCre,
                                                sTipoDC,sHistorico,sNumDoc:String;
                                                iUnidNegoc,iSubConta:LongInt;
                                                rValorCorrente,rValorMoeda:Real);
var sHist1,sHist2,sHist3,sHist4,sHist5,sObrigaCC,sNome,sSubConta:String;
Begin
  if sContaContabil = '' then
     exit;
  FuncaoGeral.TestaContaCC(False,IntegraBack.Plano,sContaContabil,sObrigaCC,sNome,sSubConta);
  if sObrigaCC = 'N' then
     sCentroCusto:='';
  if sSubConta = 'N' then
     iSubConta:=0;
  qryContab.First;
  While (not qryContab.Eof) do
  Begin
     if (qryContab.FieldByName('PLACONTA').AsString=sContaContabil) AND
        (qryContab.FieldByName('CODCENTROCUSTO').AsString=sCentroCusto) AND
        (qryContab.FieldByName('UNIDNEGOC').AsInteger=iUnidNegoc) AND
        (qryContab.FieldByName('CODSUBCONTA').AsInteger=iSubConta) AND
        (qryContab.FieldByName('LACDEBCRE').AsString=sDebCre) AND
        (qryContab.FieldByName('LACTIPO').AsString=sTipoDC) THEN
     Begin
        dsContab.DataSet.Edit;
        qryContab.FieldByName('LACVALOR').AsFloat:=qryContab.FieldByName('LACVALOR').AsFloat+rValorCorrente;
        qryContab.FieldByName('LACVALHIST').AsFloat:=qryContab.FieldByName('LACVALHIST').AsFloat+rValorMoeda;
        dsContab.DataSet.Post;
        exit;
     End;
     qryContab.Next
  end;
  sHist1:='';
  sHist2:='';
  sHist3:='';
  sHist4:='';
  sHist5:='';
  FuncaoGeral.ArrumaHistorico(sHistorico,sHist1,sHist2,sHist3,sHist4,sHist5);
  qryContab.Insert;
  qryContab.FieldByName('PLACONTA').AsString:=sContaContabil;
  qryContab.FieldByName('PLANO').AsInteger:=IntegraBack.Plano;
  qryContab.FieldByName('CODCENTROCUSTO').AsString:=sCentroCusto;
  qryContab.FieldByName('UNIDNEGOC').AsInteger:=iUnidNegoc;
  qryContab.FieldByName('LACVALOR').AsFloat:=rValorCorrente;
  qryContab.FieldByName('LACVALHIST').AsFloat:=rValorMoeda;
  qryContab.FieldByName('LACHIST1').AsString:=sHist1;
  qryContab.FieldByName('LACHIST2').AsString:=sHist2;
  qryContab.FieldByName('LACHIST3').AsString:=sHist3;
  qryContab.FieldByName('LACHIST4').AsString:=sHist4;
  qryContab.FieldByName('LACHIST5').AsString:=sHist5;
  qryContab.FieldByName('LACNUMDOC').AsString:=sNumDoc;
  qryContab.FieldByName('LACDEBCRE').AsString:=sDebCre;
  qryContab.FieldByName('LACTIPO').AsString:=sTipoDC;
  If iSubConta <> 0 then
     qryContab.FieldByName('CODSUBCONTA').AsInteger:=iSubConta;
  qryContab.Post;
end;


end.
