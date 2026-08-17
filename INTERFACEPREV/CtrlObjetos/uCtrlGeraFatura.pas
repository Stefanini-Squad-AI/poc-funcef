// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 21/08/2007
// Pendência   : 22108
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------

unit uCtrlGeraFatura;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils,uSistema, provider, uDiasUteis,
     uCtrlLancamento, uCtrlDocumento, uCtrlParamFatHotel,
     uCtrlContaContabil, CmEventosCadastro,
     uMidasUtil,uCMSqlParams, Classes, uCtrlPeriodo,
     uCMTypes,uDbComissaoFront,uFuncaoGeral,uCtrlListCAPCAR;

Type
  { upSoPool => Somente as UHs do Pool
    upSoCond => Somente as UHs do Condominio
    upTodas => Todas as UHs
  }
  //TUHPool       = (upSoPool, upSoCond, upTodas);
  TCtrlGeraFatura = class(TCmControlObject)

  Protected
      procedure AfterInitialize; Override;
      procedure OnCreateAppServer;override;
      procedure DoChangeDataBase; override;
  private
    _DbComissaoFront: TDbComissaoFront;
    _Progresso : Integer;
    _MaxProgresso : Integer;
    Lancamento        : TCtrlLancamento;
    Documento         : TCtrlDocumento;
    ParamFatHotel     : TCtrlParamFatHotel;
    ListCAPCAR        : TCtrlListCAPCAR;
    ContaContabil     : TCtrlContaContabil;
    Periodo           : TCtrlPeriodo;
    FCdsNotasaFatTela : TClientDataSet;
    FCdsNotasaFat     : TClientDataSet;
    procedure SetCdsNotasaFatTela(const Value: TClientDataSet);
    procedure SetCdsNotasaFat(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;
      Property CdsNotasaFatTela: TClientDataSet read FCdsNotasaFatTela write SetCdsNotasaFatTela;
      Property CdsNotasaFat: TClientDataSet read FCdsNotasaFat write SetCdsNotasaFat;
      function ListaNotasaFat(iEmpresa, iHotel, iCliente : Double; sDataFaturamento : String): OleVariant;
      function ListaNotasaFatTela(iEmpresa, iHotel, iCliente : Double; sDataFaturamento : String): OleVariant;
      function TestaNotas(iEmpresa : Double;sBilhete :String): Boolean;
      function GeraFatura(sBilhete,sDataFaturamento : String;liEspAcesso,idEmpresa,idModulo,idUsuario,iHotel,iCliente : Double; bUsaPlanoPatro,bIntegraContab : Boolean) : Boolean;
      function ListaFaturaEmite(iEmpresa, iFatIni,iFatFim, iForCli: Double; sCompl : String; bFiltraCompl : Boolean): OleVariant;
  end;

implementation


constructor TCtrlGeraFatura.Create;
begin
  inherited;
  Lancamento    := TCtrlLancamento.Create;
  Documento     := TCtrlDocumento.Create;
  ParamFatHotel := TCtrlParamFatHotel.Create;
  ListCAPCAR    := TCtrlListCAPCAR.Create;
  ContaContabil := TCtrlContaContabil.Create;
  Periodo       := TCtrlPeriodo.Create;
  //
  FCdsNotasaFat := TClientDataSet.Create(nil);
  //
  _DbComissaoFront := TDbComissaoFront.Create(Self);
end;


function TCtrlGeraFatura.GeraFatura(sBilhete,sDataFaturamento : String;liEspAcesso,idEmpresa,idModulo,idUsuario,iHotel,iCliente : Double; bUsaPlanoPatro,bIntegraContab : Boolean) : Boolean;
Var liRetFuncao,iCodLancCAPCAR,iMoeCodigo,iPlano,iCodPortForma,iNumFatura,iPlnCodigo,iNumFat,iCodLanc : Double;
    idHotel,idCliente,iAtivProjLanc,iAtivProjCliFor,iNumNotaIni,iNumLin,iNumRef,iGrupoSepara:Double;
    sDataFatura,sDataLancto,sDataVencimento,sDataEmis,sCompl,sComplAux,sComplIni,sMens,sCCustoRef :String;
    sOperacao,sEmissBloq,sDataVenc,sDataVenc1,sSql,sTexto,sPlaContaRef:String;
    sHistorico,sContaCliFor,sCCustoCliFor,sContaReceita : String;
    rValorCusto,rValIRRF,rValor,rValOut,rTotalFatura,rTotalComiss,rValorCot,rTotalOutraMoeda,rValComiss, rValComissT,rValBaseCom : Double;
    bInclui,bGerou, bDuplicado:Boolean;
    iCompl,iContrato  : Integer;
    FCdsParamFatHotel : TClientDataSet;
    FCdsOutrosCustos  : TClientDataSet;
    FCdsParcelas      : TClientDataSet;
    FCdsDadosCliente  : TClientDataSet;
    FCdsDadosContrato : TClientDataSet;
    FCdsNotasporDC    : TClientDataSet;
    FCdsPorTipoDC     : TClientDataSet;
    FCdsTipoDC        : TClientDataSet;
    FCdsRateio        : TClientDataSet;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.GeraFatura(sBilhete,sDataFaturamento,idEmpresa,idModulo,idUsuario,iHotel,iCliente,bUsaPlanoPatro,bIntegraContab,CdsNotasaFatTela.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      FCdsParamFatHotel := TClientDataSet.Create(nil);
      FCdsOutrosCustos  := TClientDataSet.Create(nil);
      FCdsParcelas      := TClientDataSet.Create(nil);
      FCdsDadosCliente  := TClientDataSet.Create(nil);
      FCdsDadosContrato := TClientDataSet.Create(nil);
      FCdsNotasporDC    := TClientDataSet.Create(nil);
      FCdsPorTipoDC     := TClientDataSet.Create(nil);
      FCdsTipoDC        := TClientDataSet.Create(nil);
      FCdsRateio        := TClientDataSet.Create(nil);
      Try
         Result      := true;
         bGerou      := False;
         MessageInfo := '';
         sMens       := '';
         _MaxProgresso := FCdsNotasaFatTela.RecordCount;
         _Progresso    := 0;
         DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Marcando os Detalhes das Notas','']);
         FCdsNotasaFat.Data := ListaNotasaFat(idEmpresa, iHotel,iCliente,sDataFaturamento);
         FCdsNotasaFat.First;
         FCdsNotasaFatTela.First;
         while not FCdsNotasaFatTela.Eof do begin
            while (not FCdsNotasaFat.Eof) and
                  (FCdsNotasaFatTela.FieldByName('IDCODLANCAMENTO').AsFloat = FCdsNotasaFat.FieldByName('IDCODLANCAMENTO').AsFloat) do begin
               FCdsNotasaFat.Edit;
               FCdsNotasaFat.FieldByName('FCHECK').AsString:=FCdsNotasaFatTela.FieldByName('FCHECK').AsString;
               FCdsNotasaFat.Post;
               FCdsNotasaFat.Next;
            end;
            _Progresso    := _Progresso+1;
            DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Marcando os Detalhes das Notas','']);
            FCdsNotasaFatTela.Next;
         end;
         if bIntegraContab then begin
            if not TestaNotas(idEmpresa,sBilhete) then begin
               MessageInfo := 'Acerte os problemas antes de emitir a fatura.';
               Result := False;
               exit;
            end;
         end;
         _MaxProgresso := FCdsNotasaFat.RecordCount;
         _Progresso    := 0;
         DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Gerando as Faturas','']);
         //
         FCdsParamFatHotel.Data := ParamFatHotel.Procurar(idEmpresa);
         iNumFat:=FCdsParamFatHotel.FieldByName('NUMULTFATURA').AsInteger;
         //
         try
            StartTransaction;
            FCdsNotasaFat.First;
            While not FCdsNotasaFat.Eof do begin
               if (FCdsNotasaFat.FieldByName('FCheck').AsString = 'S') then begin
                  bGerou      := True;
                  //
                  iGrupoSepara:=FCdsNotasaFat.FieldByName('IDGRUPOSEPARAFAT').AsInteger;
                  idCliente   :=FCdsNotasaFat.FieldByName('IDFORCLI').AsInteger;
                  iContrato   :=FCdsNotasaFat.FieldByName('CODCONTRATO').AsInteger;
                  idHotel     :=FCdsNotasaFat.FieldByName('IDHOTEL').AsInteger;
                  sDataFatura :=FCdsNotasaFat.FieldByName('DATAFATURAMENTO').AsString;
                  if FCdsNotasaFat.FieldByName('DATAVENCIMENTO').IsNull then begin
                     sDataVenc   :='';
                     sDataVenc1  :='';
                  end else begin
                     sDataVenc   :=FCdsNotasaFat.FieldByName('DATAVENCIMENTO').AsString;
                     sDataVenc1  :=FCdsNotasaFat.FieldByName('DATAVENCIMENTO').AsString;
                  end;

                  if FCdsParamFatHotel.FieldByName('DTEMISSAO').AsString = 'S' then
                     sDataEmis   := FormatDateTime('dd/mm/yyyy', Now) 
                  else
                     sDataEmis   := sDataFatura;

                  liRetFuncao := 0;
                  
                  if bIntegraContab then begin
                     if not Periodo.RetornaPeriodoExercicioData(idEmpresa,sDataEmis) then begin
                        liRetFuncao := -1;
                        sMens:=Periodo.MessageInfo+' em '+sDataEmis;
                        Abort;
                     end;
                     if Periodo.TestaPeriodoBloqueado(idEmpresa,tbBloqOuInt,Periodo.Periodo,Periodo.Exercicio,False) then begin
                        liRetFuncao := -1;
                        sMens:=Periodo.MessageInfo+' em '+IntToStr(Periodo.Periodo)+'/'+IntToStr(Periodo.Exercicio);
                        Abort;
                     end;
                  end;
                  if liRetFuncao  = 0 then begin
                     //
                     sSql := 'SELECT T.ACRESDECRES,O.PERCCUSTO,O.VALORCUSTO,O.CODALTERADOR '+
                             'FROM OUTCUSTOCON O, TIPOALTERADOR T '+
                             'WHERE (O.IDFORCLI = '+FCdsNotasaFat.FieldByName('IDFORCLI').AsString+')'+
                             '  AND (O.CODCONTRATO = '+FCdsNotasaFat.FieldByName('CODCONTRATO').AsString+')'+
                             '  AND (O.IDHOTEL = '+FCdsNotasaFat.FieldByName('IDHOTEL').AsString+')'+
                             '  AND (O.CODALTERADOR = T.CODALTERADOR)';
                     OpenDataSet(sSql);
                     //
                     sSql := 'SELECT PRAZO,NUMPARCELA      '+
                             'FROM PARCELAS_CONTRATO_HOTEL '+
                             'WHERE (IDFORCLI = '+FCdsNotasaFat.FieldByName('IDFORCLI').AsString+')'+
                             '  AND (CODCONTRATO = '+FCdsNotasaFat.FieldByName('CODCONTRATO').AsString+')'+
                             '  AND (IDHOTEL = '+FCdsNotasaFat.FieldByName('IDHOTEL').AsString+')'+
                             'ORDER BY NUMPARCELA';
                     FCdsParcelas.Data := GetDataPacket(sSql);
                     //
                     FCdsDadosCliente.Data := ListCAPCAR.ListaDadosCliente(idEmpresa,idCliente);
                     //
                     if (bIntegraContab) and ((FCdsDadosCliente.FieldByName('CONTACCLIENTE').AsString = '') or (FCdsDadosCliente.FieldByName('CONTACRECEITA').AsString = '')) then begin
                        sMens := 'Obrigatório preencher as Contas Contábeis do Cliente '+FCdsDadosCliente.FieldByName('RAZAOSOCIAL').AsString;
                        Abort;
                     end;
                     //
                     sSql :='SELECT IDCODLANCAMENTO,IDTIPODEBCRED,IDHOTEL, '+
                            '       VALORSEMTXSERV,VALORTXSERV             '+
                            'FROM NFAFATPORTIPODC                          '+
                            'WHERE (IDCODLANCAMENTO = 0)                   ';
                     FCdsNotasporDC.Data := GetDataPacket(sSql);
                     //
                     sSql :='SELECT INVOICEFATURA,JUNTANOTA,DEDUZCOMISS,  '+
                            '       DESCDE,ATEDATA,CODPORTFORMA,MOECODIGO '+
                            'FROM CONTRCLIHOTEL                           '+
                            'WHERE (IDFORCLI = '+FCdsNotasaFat.FieldByName('IDFORCLI').AsString+')'+
                            '  AND (CODCONTRATO = '+FCdsNotasaFat.FieldByName('CODCONTRATO').AsString+')'+
                            '  AND (IDHOTEL = '+FCdsNotasaFat.FieldByName('IDHOTEL').AsString+')';
                     FCdsDadosContrato.Data := GetDataPacket(sSql);

                     if FCdsNotasaFat.FieldByName('DATAVENCIMENTO').IsNull then
                        sDataVencimento   := FormatDateTime('dd/mm/yyyy', (StrToDate(sDataFatura)+FCdsParcelas.FieldByName('PRAZO').AsInteger)) 
                     else
                        sDataVencimento   := FCdsNotasaFat.FieldByName('DATAVENCIMENTO').AsString;

                     iNumLin:=0;
                     if (FCdsDadosContrato.FieldByName('JUNTANOTA').AsString = 'U') or (FCdsParamFatHotel.FieldByName('FLGMESMONUM').AsString = 'S') then
                        iNumRef:=1
                     else
                        iNumRef:=100;
                     rTotalFatura    :=0;
                     rTotalComiss    :=0;
                     rValIRRF        :=0;
                     iNumNotaIni     :=FCdsNotasaFat.FieldByName('NOTAINICIAL').AsInteger;
                     sComplIni       :=FCdsNotasaFat.FieldByName('COMPLEMENTONOTA').AsString;
                     //
                     While (not FCdsNotasaFat.Eof) and
                           (iGrupoSepara =FCdsNotasaFat.FieldByName('IDGRUPOSEPARAFAT').AsInteger) and
                           (idCliente    =FCdsNotasaFat.FieldByName('IDFORCLI').AsInteger) and
                           (iContrato    =FCdsNotasaFat.FieldByName('CODCONTRATO').AsInteger) and
                           (idHotel      =FCdsNotasaFat.FieldByName('IDHOTEL').AsInteger) and
                           (sDataFatura  =FCdsNotasaFat.FieldByName('DATAFATURAMENTO').AsString) and
                           (sDataVenc    =sDataVenc1) do begin
                        if (FCdsNotasaFat.FieldByName('FCheck').AsString = 'S') then begin
                           sSql := 'SELECT IDPRINCIPAL,DESCRICAO '+
                                   'FROM TIPODEBCREDHOTEL        '+
                                   'WHERE (IDHOTEL = '+FloatToStr(idHotel)+')'+
                                   '  AND (IDTIPODEBCRED = '+FCdsNotasaFat.FieldByName('IDTIPODEBCRED').AsString+')';
                           FCdsTipoDC.Data := GetDataPacket(sSql);
                           //
                           sSql := 'SELECT PERCOMISSAO,COMISTXSERV        '+
                                   'FROM COMTIPODEBCRED                   '+
                                   'WHERE (IDHOTEL = '+FloatToStr(idHotel)+')'+
                                   '  AND (IDFORCLI = '+FloatToStr(idCliente)+')'+
                                   '  AND (CODCONTRATO = '+IntToStr(iContrato)+')'+
                                   '  AND (IDTIPODEBCRED = '+FCdsNotasaFat.FieldByName('IDTIPODEBCRED').AsString+')';
                           FCdsPorTipoDC.Data := GetDataPacket(sSql);
                           if FCdsPorTipoDC.IsEmpty then begin
                              //
                              sSql := 'SELECT PERCOMISSAO,COMISTXSERV               '+
                                      'FROM COMTIPODEBCRED                          '+
                                      'WHERE (IDHOTEL = '+FloatToStr(idHotel)+')       '+
                                      '  AND (IDFORCLI = '+FloatToStr(idCliente)+')    '+
                                      '  AND (CODCONTRATO = '+IntToStr(iContrato)+')'+
                                      '  AND (IDTIPODEBCRED = '+FCdsTipoDC.FieldByName('IDPRINCIPAL').AsString+')';
                              FCdsPorTipoDC.Data := GetDataPacket(sSql);
                           end;
                           //
                           iNumLin:=iNumLin+1;
                           //
                           sTexto:=sTexto+' - '+FCdsTipoDC.FieldByName('DESCRICAO').AsString;
                           rValComiss :=0;
                           rValComissT:=0;
                           rValBaseCom:=0;
                           if not FCdsPorTipoDC.IsEmpty then begin
                              if FCdsPorTipoDC.FieldByName('PERCOMISSAO').AsFloat <> 0 then begin
                                 rValComiss :=(FCdsNotasaFat.FieldByName('TOTVALS').AsFloat*(FCdsPorTipoDC.FieldByName('PERCOMISSAO').AsFloat/100));
                                 rValBaseCom:=FCdsNotasaFat.FieldByName('TOTVALS').AsFloat;
                              end;
                              rTotalComiss:=rTotalComiss+rValComiss;
                              rValComissT :=rValComiss;
                              rValComiss  :=0;
                              if FCdsPorTipoDC.FieldByName('COMISTXSERV').AsFloat <> 0 then begin
                                 rValComiss :=(FCdsNotasaFat.FieldByName('TOTVALX').AsFloat*(FCdsPorTipoDC.FieldByName('COMISTXSERV').AsFloat/100));
                                 rValBaseCom:=rValBaseCom+FCdsNotasaFat.FieldByName('TOTVALX').AsFloat;
                              end;
                              rTotalComiss:=rTotalComiss+rValComiss;
                              rValComissT :=rValComissT +rValComiss;
                           end;
                           if (FCdsDadosContrato.FieldByName('DEDUZCOMISS').AsString <> 'S') and (rValComissT <> 0) then begin
                              //Gravar comissão front
                              sSql := 'SELECT C.IDRESERVASFRONT          '+
                                      'FROM CONTASFRONT C, NOTAFRONT N   '+
                                      'WHERE (N.IDCONTA = C.IDCONTA)     '+
                                      '  AND (N.IDHOTEL = '+FloatToStr(idHotel)+')'+
                                      '  AND (N.NUMERONOTA = '+IntToStr(FCdsNotasaFat.FieldByName('NOTAINICIAL').AsInteger)+')';
                              _Cds.Data := GetDataPacket(sSql);
                              _DbComissaoFront.Idhotel.AsFloat          := idHotel;
                              _DbComissaoFront.IdPessoa.AsFloat         := idCliente;
                              _DbComissaoFront.Vlrcomissao.AsFloat      := rValComissT;
                              _DbComissaoFront.Idtipodebcred.AsFloat    := FCdsNotasaFat.FieldByName('IDTIPODEBCRED').AsFloat;
                              _DbComissaoFront.Vlrbasecomiss.AsFloat    := rValBaseCom;
                              _DbComissaoFront.Flgafaturar.AsString     := 'S';
                              _DbComissaoFront.Flgtipocomissao.AsString := 'N';
                              _DbComissaoFront.Nomehospede.AsString := FCdsNotasaFat.FieldByName('NOMEHOSPEDE').AsString;
                              _DbComissaoFront.Datacomissao.AsString := FCdsNotasaFat.FieldByName('DATAFATURAMENTO').AsString;
                              if _Cds.FieldByName('IDRESERVASFRONT').IsNull then
                                 _DbComissaoFront.Idreservasfront.asFloat := 0
                              else
                                 _DbComissaoFront.Idreservasfront.asFloat := _Cds.FieldByName('IDRESERVASFRONT').AsFloat;
                              _DbComissaoFront.SSqlSelect
                              if not _DbComissaoFront.Insert then begin
                                 sMens := _DbComissaoFront.MessageInfo;
                                 Abort;
                              end;
                           end;
                           rTotalFatura:=rTotalFatura+(FCdsNotasaFat.FieldByName('TOTVALS').AsFloat+FCdsNotasaFat.FieldByName('TOTVALX').AsFloat);
                           //
                           FCdsNotasporDC.Insert;
                           FCdsNotasporDC.FieldByName('IDCODLANCAMENTO').AsInteger:=FCdsNotasaFat.FieldByName('IDCODLANCAMENTO').AsInteger;
                           FCdsNotasporDC.FieldByName('IDTIPODEBCRED').AsInteger:=FCdsNotasaFat.FieldByName('IDTIPODEBCRED').AsInteger;
                           FCdsNotasporDC.FieldByName('IDHOTEL').AsInteger:=FCdsNotasaFat.FieldByName('IDHOTEL').AsInteger;
                           FCdsNotasporDC.FieldByName('VALORSEMTXSERV').AsFloat:=FCdsNotasaFat.FieldByName('TOTVALS').AsFloat;
                           FCdsNotasporDC.FieldByName('VALORTXSERV').AsFloat:=FCdsNotasaFat.FieldByName('TOTVALX').AsFloat;
                           FCdsNotasporDC.Post;
                           _Progresso := _Progresso + 1;
                           DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Gerando as Faturas','']);
                           FCdsNotasaFat.Next;
                           if ((iNumNotaIni <> FCdsNotasaFat.FieldByName('NOTAINICIAL').AsInteger) or
                              (sComplIni   <> FCdsNotasaFat.FieldByName('COMPLEMENTONOTA').AsString)) and
                              (iNumLin     >=iNumRef) then
                              Break;
                           iNumNotaIni :=FCdsNotasaFat.FieldByName('NOTAINICIAL').AsInteger;
                           sComplIni   :=FCdsNotasaFat.FieldByName('COMPLEMENTONOTA').AsString;
                           if FCdsNotasaFat.FieldByName('DATAVENCIMENTO').IsNull then
                              sDataVenc1  :=''
                           else
                              sDataVenc1  :=FCdsNotasaFat.FieldByName('DATAVENCIMENTO').AsString;
                        end else begin
                           _Progresso := _Progresso + 1;
                           DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Gerando as Faturas','']);
                           FCdsNotasaFat.Next;
                           if ((iNumNotaIni <> FCdsNotasaFat.FieldByName('NOTAINICIAL').AsInteger) or
                              (sComplIni   <> FCdsNotasaFat.FieldByName('COMPLEMENTONOTA').AsString)) and
                              (iNumLin     >=iNumRef) then
                              Break;
                           iNumNotaIni :=FCdsNotasaFat.FieldByName('NOTAINICIAL').AsInteger;
                           sComplIni   :=FCdsNotasaFat.FieldByName('COMPLEMENTONOTA').AsString;
                           if FCdsNotasaFat.FieldByName('DATAVENCIMENTO').IsNull then
                              sDataVenc1  :=''
                           else
                              sDataVenc1  :=FCdsNotasaFat.FieldByName('DATAVENCIMENTO').AsString;
                        end;
                     end;
                     //
                     rValIRRF:=rTotalComiss*(FCdsParamFatHotel.FieldByName('PERCIRRF').AsFloat/100);
                     if (rValIRRF < FCdsParamFatHotel.FieldByName('VALORLIMITEIRRF').AsFloat) or
                        (FCdsDadosContrato.FieldByName('INVOICEFATURA').AsString = 'I') then
                        rValIRRF:=0;
                     //
                     if (FCdsParamFatHotel.FieldByName('FLGMESMONUM').AsString = 'S') then begin
                        iNumFat   :=iNumNotaIni;
                        sCompl    :=sComplIni;
                        sComplAux :=sComplIni;
                     end;
                     iCompl := 0;
                     bDuplicado := true;
                     while bDuplicado do begin
                        if (FCdsParamFatHotel.FieldByName('FLGMESMONUM').AsString <> 'S') or (FCdsParamFatHotel.FieldByName('FLGMESMONUM').isNull) then begin
                           iNumFat:=iNumFat+1;
                           sCompl :='';
                        end;
                        bDuplicado := Documento.ExisteNumDoc('R', idCliente,idEmpresa,
                                                              iNumFat,sCompl);
                        if bDuplicado then begin
                           if (FCdsParamFatHotel.FieldByName('FLGMESMONUM').AsString = 'S') then begin
                              iCompl := iCompl + 1;
                              sCompl := sComplAux + IntToStr(iCompl);
                           end;
                        end;
                     end;
                     sSql :='UPDATE PARAMFATHOTEL SET NUMULTFATURA = '+FloatToStr(iNumFat)+' WHERE IDPESSOA = '+FloatToStr(IdEmpresa);
                     if not ExecSql(sSql) then begin
                        sMens := MessageInfo;
                        Abort;
                     end;
                     //Faz o lançamento no contas a receber e na contabilidade
                     rValorCot := 0;
                     rTotalOutraMoeda := 0;
                     if not FCdsDadosContrato.FieldByName('MOECODIGO').isNull then begin
                        iMoeCodigo:=FCdsDadosContrato.FieldByName('MOECODIGO').AsFloat;
                        rValorCot := FuncaoGeral.TestaCotacaoMoeda(trunc(iMoeCodigo),sDataEmis,'S');
                        if rValorCot <> 0 then begin
                           rTotalOutraMoeda := rTotalFatura / rValorCot;
                        end else begin
                           Abort;
                        end;
                     end else begin
                        iMoeCodigo       :=-1;
                        rTotalOutraMoeda := 0;
                     end;
                     //
                     sSql := 'SELECT * FROM RATEIODOCUM WHERE (1 = 2)';
                     FCdsRateio.Data := GetDataPacket(sSql);
                     FCdsNotasporDC.First;
                     While not FCdsNotasporDC.Eof do begin
                        rValor :=(FCdsNotasporDC.FieldByName('VALORSEMTXSERV').AsFloat+FCdsNotasporDC.FieldByName('VALORTXSERV').AsFloat);
                        rValOut:=0;
                        if rValorCot <> 0 then
                           rValOut := rValor / rValorCot;
                        //
                        sSql := 'SELECT CODTIPRECDES,RECPAG,CODCENTRORESPON,  '+
                                '       DECODE(DEBITOCREDITO,''D'',CENTROCUSTOCREDIT,CENTROCUSTODEBITO) AS CODCENTROCUSTO '+
                                'FROM TIPODEBCREDHOTEL        '+
                                'WHERE (IDHOTEL = '+FloatToStr(idHotel)+')'+
                                '  AND (IDTIPODEBCRED = '+FCdsNotasporDC.FieldByName('IDTIPODEBCRED').AsString+')';
                        FCdsTipoDC.Data := GetDataPacket(sSql);
                        bInclui := True;
                        FCdsRateio.First;
                        while not FCdsRateio.Eof do begin
                           if (FCdsRateio.FieldByName('CODTIPRECDES').AsString = FCdsTipoDC.FieldByName('CODTIPRECDES').AsString) and
                              (FCdsRateio.FieldByName('CODCENTRORESPON').AsString = FCdsTipoDC.FieldByName('CODCENTRORESPON').AsString) and
                              (FCdsRateio.FieldByName('CODCENTROCUSTO').AsString = FCdsTipoDC.FieldByName('CODCENTROCUSTO').AsString) then begin
                               bInclui := False;
                               FCdsRateio.Edit;
                               FCdsRateio.FieldByName('VALOR').AsFloat           := FCdsRateio.FieldByName('VALOR').AsFloat+rValor;
                               FCdsRateio.FieldByName('VALOROUTRAMOEDA').AsFloat := FCdsRateio.FieldByName('VALOROUTRAMOEDA').AsFloat+rValOut;
                               FCdsRateio.Post;
                               Break;
                           end;
                           FCdsRateio.Next;
                        end;
                        if bInclui then begin
                           FCdsRateio.Insert;
                           FCdsRateio.FieldByName('CODTIPRECDES').AsString    := FCdsTipoDC.FieldByName('CODTIPRECDES').AsString;
                           FCdsRateio.FieldByName('CODCENTRORESPON').AsString := FCdsTipoDC.FieldByName('CODCENTRORESPON').AsString;
                           FCdsRateio.FieldByName('CODCENTROCUSTO').AsString  := FCdsTipoDC.FieldByName('CODCENTROCUSTO').AsString;
                           FCdsRateio.FieldByName('VALOR').AsFloat            := rValor;
                           FCdsRateio.FieldByName('VALOROUTRAMOEDA').AsFloat  := rValOut;
                           FCdsRateio.Post;
                        end;
                        FCdsNotasporDC.Next;
                     end;
                     //
                     iPlnCodigo     :=0;
                     sContaCliFor   :='';
                     sCCustoCliFor  :='';
                     sContaReceita  :='';
                     iPlano         :=0;
                     iAtivProjCliFor:=0;
                     iAtivProjLanc  :=FCdsParamFatHotel.FieldByName('UNIDNEGOC').AsFloat;
                     if bIntegraContab then begin
                        if not FCdsDadosCliente.FieldByName('PLANO').isNull then begin
                           iPlano:=FCdsDadosCliente.FieldByName('PLANO').AsFloat;
                        end else begin
                           sMens:='Plano de Contas no cadastro do Cliente '+FCdsDadosCliente.FieldByName('RAZAOSOCIAL').AsString+' não Informado';
                           Abort;
                        end;
                        sContaCliFor   :=FCdsDadosCliente.FieldByName('CONTACCLIENTE').AsString;
                        sCCustoCliFor  :=FCdsDadosCliente.FieldByName('CODCENTROCUSTO').AsString;
                        iAtivProjCliFor:=FCdsDadosCliente.FieldByName('UNIDNEGOC').AsFloat;
                     end;
                     if (bIntegraContab) and
                        (FCdsDadosCliente.FieldByName('CONTACCLIENTE').AsString <> FCdsDadosCliente.FieldByName('CONTACRECEITA').AsString) then begin
                        if not FCdsRateio.IsEmpty then begin
                           FCdsRateio.First;
                           sContaReceita:=Lancamento.BuscaContaContabil(trunc(idEmpresa),0,FCdsRateio.FieldByName('CODTIPRECDES').AsString,
                                                                        FCdsRateio.FieldByName('CODCENTROCUSTO').AsString,'R');
                        end;
                        if sContaReceita = '' then
                           sContaReceita:=FCdsDadosCliente.FieldByName('CONTACRECEITA').AsString;
                        sHistorico  :='Lançamento Fatura No. '+FloatToStr(iNumFat)+' '+FCdsDadosCliente.FieldByName('RAZAOSOCIAL').AsString;
                        if iAtivProjCliFor = 0 then
                           iAtivProjLanc :=FCdsParamFatHotel.FieldByName('UNIDNEGOC').AsFloat
                        else
                           iAtivProjLanc :=iAtivProjCliFor;
                        if not Lancamento.InsereLancaContab('0',idEmpresa,idModulo,idUsuario, iPlano,
                                               iAtivProjLanc,
                                               FCdsDadosCliente.FieldByName('CODSUBCONTA').AsFloat,0,0,0,
                                               iPlnCodigo,0,sDataEmis,FloatToStr(iNumFat),sHistorico,'',
                                               '','','','03',sCCustoCliFor, sContaCliFor,'','','',rTotalFatura,
                                               False, bUsaPlanoPatro) then begin
                            sMens:=Lancamento.MessageInfo;
                            Abort;
                        end;
                        iPlnCodigo := Lancamento.RetornoPlnCodigo;
                        //Lançamento a Crédito
                        iAtivProjLanc :=FCdsParamFatHotel.FieldByName('UNIDNEGOC').AsFloat;
                        if not Lancamento.InsereLancaContab('1',idEmpresa,idModulo,idUsuario, iPlano,
                                               iAtivProjLanc,0,
                                               FCdsDadosCliente.FieldByName('CODSUBCONTA').AsFloat,0,0,
                                               iPlnCodigo,0,sDataEmis,FloatToStr(iNumFat),sHistorico,'',
                                               '','','','03','','',sCCustoCliFor, sContaReceita,'',rTotalFatura,
                                               False, bUsaPlanoPatro) then begin
                            sMens:=Lancamento.MessageInfo;
                            Abort;
                        end;
                        iPlnCodigo := Lancamento.RetornoPlnCodigo;
                     end;
                     //
                     if FCdsParcelas.RecordCount > 1 then
                        sOperacao := '1 '
                     else
                        sOperacao := '2 ';
                     //
                     if FCdsDadosContrato.FieldByName('CODPORTFORMA').AsInteger <> 0 then begin
                        iCodPortForma:=FCdsDadosContrato.FieldByName('CODPORTFORMA').AsInteger;
                        sEmissBloq   := 'N';
                     end else begin
                        iCodPortForma:=0;
                        sEmissBloq   := '';
                     end;
                     //
                     Documento.Prepare(OpDocumento,odlEfetivo,sdocAberto);
                     Documento.IdEspAcesso := liEspAcesso;
                     Documento.IdUsuario   := idUsuario;
                     Documento.SetValues(0,iNumFat,sCompl,'','R',sOperacao,'','',sContaCliFor,
                          sCCustoCliFor,'','','','','',sEmissBloq,'','',
                          StrToDate(sDataVencimento),StrToDate(sDataEmis),
                          StrToDate(sDataVencimento),0,0,0,0,0,0,0,
                          0, FCdsParamFatHotel.FieldByName('CODTIPDOC').AsInteger,
                          trunc(idEmpresa),trunc(idModulo),trunc(idCliente),
                          0,0,trunc(iAtivProjCliFor), trunc(iPlano),0,
                          0,trunc(iMoeCodigo),0,0,trunc(idUsuario),trunc(idEmpresa),
                          0,0,FCdsDadosCliente.FieldByName('CODSUBCONTA').AsInteger,
                          trunc(iCodPortForma),0,0,0);
                     Documento.Lanctodocum.SetValues(StrToDate(sDataEmis),0,0,
                                             rTotalFatura,rTotalOutraMoeda,
                                             rTotalFatura,trunc(iAtivProjCliFor),
                                              trunc(iPlnCodigo),0,trunc(idUsuario),
                                              trunc(idEmpresa),0,0,0,0,0,sOperacao,
                                              '','','','',
                                              '','','','D', trunc(IdModulo), trunc(iPlano), bUsaPlanoPatro);
                     FCdsRateio.First;
                     while not FCdsRateio.Eof do begin
                        Documento.Rateiodocum.SetValues(FCdsRateio.FieldByName('VALOR').AsFloat,
                                                        FCdsRateio.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                        0,0,trunc(idEmpresa),0,
                                                        trunc(iAtivProjLanc),trunc(iMoeCodigo), trunc(idUsuario),0,0,0,0,0,0,
                                                        trunc(idEmpresa),FCdsRateio.FieldByName('CODTIPRECDES').AsString,
                                                        'R',FCdsRateio.FieldByName('CODCENTRORESPON').AsString,
                                                        FCdsRateio.FieldByName('CODCENTROCUSTO').AsString,'');
                        FCdsRateio.Next;
                     end;
                     If Not Documento.Insert Then begin
                        sMens := Documento.MessageInfo;
                        Abort;
                     end;
                     iCodLancCAPCAR := Documento.Coddocumento;
                     //
                     if FCdsParamFatHotel.FieldByName('FLGCONTABCOMISFAT').AsString = 'R' then
                        sDataLancto := sDataVencimento
                     else
                        sDataLancto := sDataEmis;
                     if (FCdsDadosContrato.FieldByName('DEDUZCOMISS').AsString = 'S') and (rTotalComiss <> 0) then begin
                        rTotalOutraMoeda := 0;
                        if rValorCot <> 0 then
                           rTotalOutraMoeda := rTotalComiss / rValorCot;
                        iPlnCodigo   :=0;
                        Documento.Prepare(OpLanctoDocum,odlAlterador,sdocAberto);
                        Documento.Lanctodocum.SetValues(StrToDate(sDataLancto),trunc(iCodLancCAPCAR),0,
                                                rTotalComiss,rTotalOutraMoeda,rTotalComiss,
                                                trunc(iAtivProjCliFor),trunc(iPlnCodigo),
                                                0,trunc(idUsuario),trunc(idEmpresa),
                                                0,0,0,0,FCdsParamFatHotel.FieldByName('CODALTCOMISSAO').AsInteger,
                                                '4 ','','','','',
                                                '','','','C', trunc(IdModulo), trunc(iPlano), bUsaPlanoPatro,True);
                        If Not Documento.Insert Then begin
                           sMens := Documento.MessageInfo;
                           Abort;
                        end;
                     end;
                     if (FCdsDadosContrato.FieldByName('DEDUZCOMISS').AsString = 'S') and (rValIRRF <> 0) then begin
                        rTotalOutraMoeda := 0;
                        if rValorCot <> 0 then
                           rTotalOutraMoeda := rValIRRF / rValorCot;
                        iPlnCodigo   :=0;
                        Documento.Prepare(OpLanctoDocum,odlAlterador,sdocAberto);
                        Documento.Lanctodocum.SetValues(StrToDate(sDataLancto),trunc(iCodLancCAPCAR),0,
                                                rValIRRF,rTotalOutraMoeda,rValIRRF,
                                                trunc(iAtivProjCliFor),trunc(iPlnCodigo),
                                                0,trunc(idUsuario),trunc(idEmpresa),
                                                0,0,0,0,FCdsParamFatHotel.FieldByName('CODALTIRRF').AsInteger,
                                                '4 ','','','','',
                                                '','','','D', trunc(IdModulo), trunc(iPlano), bUsaPlanoPatro,True);
                        If Not Documento.Insert Then begin
                           sMens := Documento.MessageInfo;
                           Abort;
                        end;
                     end;
                     //
                     _lDataSet.First;
                     While not _lDataSet.Eof do begin
                        rValorCusto      :=StrToFloat(FormatFloat('0.00',(_lDataSet.FieldByName('VALORCUSTO').AsFloat+((_lDataSet.FieldByName('PERCCUSTO').AsFloat/100)*rTotalFatura))));
                        rTotalOutraMoeda := 0;
                        if rValorCot <> 0 then
                           rTotalOutraMoeda := rValorCusto / rValorCot;
                        iPlnCodigo   :=0;
                        Documento.Prepare(OpLanctoDocum,odlAlterador,sdocAberto);
                        Documento.Lanctodocum.SetValues(StrToDate(sDataEmis),trunc(iCodLancCAPCAR),0,
                                                rValorCusto,rTotalOutraMoeda,rValorCusto,
                                                trunc(iAtivProjCliFor),trunc(iPlnCodigo),
                                                0,trunc(idUsuario),trunc(idEmpresa),
                                                0,0,0,0,_lDataSet.FieldByName('CODALTERADOR').AsInteger,
                                                '4 ','','','','',
                                                '','','',_lDataSet.FieldByName('ACRESDECRES').AsString,
                                                trunc(IdModulo), trunc(iPlano), bUsaPlanoPatro,True);
                        If Not Documento.Insert Then begin
                           sMens := Documento.MessageInfo;
                           Abort;
                        end;
                        _lDataSet.Next;
                     end;
                     //Implementar as parcelas
                     if sOperacao = '1 ' then begin
                     end;
                     //
                     FCdsNotasporDC.First;
                     While not FCdsNotasporDC.Eof do begin
                        sSql :='UPDATE NFAFATURARHOTEL SET DATAFATURA = TO_DATE('''+sDataEmis+''',''DD/MM/YYYY'')'+
                               ' WHERE IDCODLANCAMENTO = '+FCdsNotasporDC.FieldByName('IDCODLANCAMENTO').AsString;
                        if not ExecSql(sSql) then begin
                           sMens := MessageInfo;
                           Abort;
                        end;
                        //
                        sSql :='UPDATE NFAFATPORTIPODC SET NUMFATURA = '+FloatToStr(iNumFat)+', CODDOCUMENTO = '+FloatToStr(iCodLancCAPCAR)+
                               ' WHERE IDHOTEL = '+FCdsNotasporDC.FieldByName('IDHOTEL').AsString+
                               ' AND IDCODLANCAMENTO = '+FCdsNotasporDC.FieldByName('IDCODLANCAMENTO').AsString+
                               ' AND IDTIPODEBCRED = '+FCdsNotasporDC.FieldByName('IDTIPODEBCRED').AsString;
                        if not ExecSql(sSql) then begin
                           sMens := MessageInfo;
                           Abort;
                        end;
                        FCdsNotasporDC.Next;
                     end;
                  end else begin
                     _Progresso := _Progresso + 1;
                     DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Gerando as Faturas','']);
                     FCdsNotasaFat.Next;
                  end;
               end else begin
                  _Progresso := _Progresso + 1;
                  DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Gerando as Faturas','']);
                  FCdsNotasaFat.Next;
               end;
            end;
            Commit;
         except
            On  E:Exception Do Begin
               Result := False;
               Rollback;
               MessageInfo := sMens +'. '+E.Message;
               DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Gerando as Faturas',MessageInfo]);
            End;
         end;
         if not bGerou then begin
            Result := False;
            MessageInfo := 'Não existia nenhuma fatura marcada para ser cancelada';
            DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Gerando as Faturas',MessageInfo]);
         end;
      Finally
        FreeCds([FCdsParamFatHotel,FCdsOutrosCustos,FCdsParcelas,FCdsDadosCliente,FCdsDadosContrato,FCdsNotasporDC,FCdsPorTipoDC,FCdsTipoDC,FCdsRateio]);
      end;
   end;
end;


destructor TCtrlGeraFatura.Destroy;
begin
  inherited;
  Lancamento.Free;
  Documento.Free;
  ParamFatHotel.Free;
  ListCAPCAR.Free;
  ContaContabil.Free;
  Periodo.Free;
  _DbComissaoFront.Free;
  FreeCds([FCdsNotasaFat]);
  if isAppServer then
     FreeCds([FCdsNotasaFatTela]);
end;


procedure TCtrlGeraFatura.OnCreateAppServer;
begin
  inherited;
  FCdsNotasaFatTela := TClientDataSet.Create(nil);
end;


function TCtrlGeraFatura.ListaNotasaFat(iEmpresa, iHotel, iCliente : Double; sDataFaturamento : String): OleVariant;
var _sql : TCMSqlParams;
begin
   _sql := TCMSqlParams.Create(nil);
   _sql.ControlObject := Self;
   Try
      with _sql do begin
         SQL.Clear;
         SQL.Add('SELECT SUM(T.VALORSEMTXSERV) AS TOTVALS,');
         SQL.Add('       SUM(T.VALORTXSERV) AS TOTVALX,   ');
         SQL.Add('       N.IDHOTEL,                       ');
         SQL.Add('       C.IDGRUPOSEPARAFAT,              ');
         SQL.Add('       N.IDCODLANCAMENTO,               ');
         SQL.Add('       T.IDTIPODEBCRED,                 ');
         SQL.Add('       N.NOTAINICIAL,                   ');
         SQL.Add('       N.COMPLEMENTONOTA,               ');
         SQL.Add('       N.IDFORCLI,                      ');
         SQL.Add('       N.CODCONTRATO,                   ');
         SQL.Add('       N.DATAFATURAMENTO,               ');
         SQL.Add('       N.FLGADIANTAMENTO,               ');
         SQL.Add('       N.DATAVENCIMENTO,                ');
         SQL.Add('       TDC.DESCRICAO,                   ');
         SQL.Add('       N.DESCRICAO AS NOMEHOSPEDE,      ');
         SQL.Add('       T.VALORSEMTXSERV,                ');
         SQL.Add('       T.VALORTXSERV,                   ');
         SQL.Add('       ''S'' AS FCHECK,                 ');
         SQL.Add('       P.RAZAOSOCIAL                    ');
         SQL.Add('FROM NFAFATPORTIPODC T,                 ');
         SQL.Add('     NFAFATURARHOTEL N,                 ');
         SQL.Add('     COMTIPODEBCRED C,                  ');
         SQL.Add('     TIPODEBCREDHOTEL TDC,              ');
         SQL.Add('     PESSOA P, HOTEL H                  ');
         SQL.Add('WHERE (T.CODDOCUMENTO IS NULL)          ');

         if trim(sDataFaturamento) <> '' then
            SQL.Add('  AND (N.DATAFATURAMENTO <= TO_DATE('''+sDataFaturamento+''',''dd/mm/yyyy''))  ');
         if iHotel <> 0 then
            SQL.Add('  AND (N.IDHOTEL = '+FloatToStr(iHotel)+')              ');
         if iCliente <> 0 then
            SQL.Add('  AND (N.IDFORCLI = '+FloatToStr(iCliente)+')           ');
         SQL.Add('  AND (N.IDHOTEL = H.IDHOTEL)                              ');
         SQL.Add('  AND (H.IDPESSOA = '+FloatToStr(iEmpresa)+')              ');
         SQL.Add('  AND (T.IDHOTEL = C.IDHOTEL(+))                           ');
         SQL.Add('  AND (T.IDFORCLI = C.IDFORCLI(+))                         ');
         SQL.Add('  AND (T.CODCONTRATO = C.CODCONTRATO(+))                   ');
         SQL.Add('  AND (T.IDTIPODEBCRED = C.IDTIPODEBCRED(+))               ');
         SQL.Add('  AND (N.IDCODLANCAMENTO = T.IDCODLANCAMENTO)              ');
         SQL.Add('  AND (TDC.IDHOTEL(+)=T.IDHOTEL)                           ');
         SQL.Add('  AND (TDC.IDTIPODEBCRED(+)=T.IDTIPODEBCRED)               ');
         SQL.Add('  AND (N.IDFORCLI=P.IDPESSOA)                              ');
         SQL.Add('GROUP BY N.IDHOTEL,C.IDGRUPOSEPARAFAT, N.IDFORCLI,         ');
         SQL.Add('         N.DESCRICAO, N.CODCONTRATO,N.DATAFATURAMENTO,     ');
         SQL.Add('         N.IDCODLANCAMENTO,T.IDTIPODEBCRED,N.NOTAINICIAL,  ');
         SQL.Add('         N.FLGADIANTAMENTO,N.DATAVENCIMENTO,               ');
         SQL.Add('         N.COMPLEMENTONOTA,TDC.DESCRICAO,                  ');
         SQL.Add('         T.VALORSEMTXSERV,T.VALORTXSERV,P.RAZAOSOCIAL      ');
         SQL.Add('ORDER BY N.IDHOTEL,N.DATAFATURAMENTO,C.IDGRUPOSEPARAFAT,   ');
         SQL.Add('         N.IDFORCLI,N.CODCONTRATO,N.DATAVENCIMENTO,        ');
         SQL.Add('         N.NOTAINICIAL,N.COMPLEMENTONOTA, N.IDCODLANCAMENTO');
      end;
      Result := _sql.Data;
   Finally
      _sql.Free;
   end;
end;

function TCtrlGeraFatura.ListaNotasaFatTela(iEmpresa, iHotel, iCliente : Double; sDataFaturamento : String): OleVariant;
var _sql : TCMSqlParams;
begin
   _sql := TCMSqlParams.Create(nil);
   _sql.ControlObject := Self;
   Try
      with _sql do begin
         SQL.Clear;
         SQL.Add('SELECT SUM(T.VALORSEMTXSERV) AS TOTVALS,');
         SQL.Add('       SUM(T.VALORTXSERV) AS TOTVALX,   ');
         SQL.Add('       N.IDHOTEL,                       ');
         SQL.Add('       C.IDGRUPOSEPARAFAT,              ');
         SQL.Add('       N.IDCODLANCAMENTO,               ');
         SQL.Add('       N.NOTAINICIAL,                   ');
         SQL.Add('       N.COMPLEMENTONOTA,               ');
         SQL.Add('       N.IDFORCLI,                      ');
         SQL.Add('       N.CODCONTRATO,                   ');
         SQL.Add('       N.DATAFATURAMENTO,               ');
         SQL.Add('       N.FLGADIANTAMENTO,               ');
         SQL.Add('       N.DATAVENCIMENTO,                ');
         SQL.Add('       ''S'' AS FCHECK,                 ');
         SQL.Add('       P.RAZAOSOCIAL                    ');
         SQL.Add('FROM NFAFATPORTIPODC T,                 ');
         SQL.Add('     NFAFATURARHOTEL N,                 ');
         SQL.Add('     COMTIPODEBCRED C,                  ');
         SQL.Add('     TIPODEBCREDHOTEL TDC,              ');
         SQL.Add('     PESSOA P, HOTEL H                  ');
         SQL.Add('WHERE (T.CODDOCUMENTO IS NULL)          ');
         if trim(sDataFaturamento) <> '' then
            SQL.Add('  AND (N.DATAFATURAMENTO <= TO_DATE('''+sDataFaturamento+''',''dd/mm/yyyy''))  ');
         if iHotel <> 0 then
            SQL.Add('  AND (N.IDHOTEL = '+FloatToStr(iHotel)+')            ');
         if iCliente <> 0 then
            SQL.Add('  AND (N.IDFORCLI = '+FloatToStr(iCliente)+')           ');
         SQL.Add('  AND (N.IDHOTEL = H.IDHOTEL)                              ');
         SQL.Add('  AND (H.IDPESSOA = '+FloatToStr(iEmpresa)+')              ');
         SQL.Add('  AND (T.IDHOTEL = C.IDHOTEL(+))                           ');
         SQL.Add('  AND (T.IDFORCLI = C.IDFORCLI(+))                         ');
         SQL.Add('  AND (T.CODCONTRATO = C.CODCONTRATO(+))                   ');
         SQL.Add('  AND (T.IDTIPODEBCRED = C.IDTIPODEBCRED(+))               ');
         SQL.Add('  AND (N.IDCODLANCAMENTO = T.IDCODLANCAMENTO)              ');
         SQL.Add('  AND (TDC.IDHOTEL(+)=T.IDHOTEL)                           ');
         SQL.Add('  AND (TDC.IDTIPODEBCRED(+)=T.IDTIPODEBCRED)               ');
         SQL.Add('  AND (N.IDFORCLI=P.IDPESSOA)                              ');
         SQL.Add('GROUP BY N.IDHOTEL,C.IDGRUPOSEPARAFAT,N.IDCODLANCAMENTO,   ');
         SQL.Add('         N.NOTAINICIAL,N.COMPLEMENTONOTA,N.IDFORCLI,       ');
         SQL.Add('         N.CODCONTRATO,N.DATAFATURAMENTO,N.FLGADIANTAMENTO,');
         SQL.Add('         N.DATAVENCIMENTO,P.RAZAOSOCIAL                    ');
         SQL.Add('ORDER BY N.IDHOTEL,N.DATAFATURAMENTO,C.IDGRUPOSEPARAFAT,   ');
         SQL.Add('         N.IDFORCLI,N.CODCONTRATO,N.DATAVENCIMENTO,        ');
         SQL.Add('         N.NOTAINICIAL,N.COMPLEMENTONOTA, N.IDCODLANCAMENTO');
      end;
      Result := _sql.Data;
   Finally
      _sql.Free;
   end;
end;

procedure TCtrlGeraFatura.SetCdsNotasaFatTela(
  const Value: TClientDataSet);
begin
  FCdsNotasaFatTela := Value;
end;

procedure TCtrlGeraFatura.AfterInitialize;
begin
  inherited;
  Lancamento.InitializeAs(self);
  Documento.InitializeAs(self);
  ParamFatHotel.InitializeAs(self);
  ListCAPCAR.InitializeAs(self);
  ContaContabil.InitializeAs(self);
  Periodo.InitializeAs(self);
end;

Function TCtrlGeraFatura.TestaNotas(iEmpresa : Double;sBilhete :String): Boolean;
var sSql:String;
    idCliente : Double;
begin
   Result := True;
   _MaxProgresso := FCdsNotasaFat.RecordCount;
   _Progresso    := 0;
   DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Verificando os Dados para Emissão das Faturas','']);
   FCdsNotasaFat.First;
   While not FCdsNotasaFat.EOF do begin
      if FCdsNotasaFat.FieldByName('FCHECK').AsString = 'S' then begin
         idCliente :=FCdsNotasaFat.FieldByName('IDFORCLI').AsFloat;
         sSql := 'SELECT E.CODSUBCONTA,E.CONTACCLIENTE,E.CONTACRECEITA,E.CODCENTROCUSTO,    '+
                 '       P.RAZAOSOCIAL,P.NUMDOCUMENTO,P.IDDOCUMENTO,D.NOMEDOCUMENTO,E.PLANO '+
                 'FROM PESSOA P, TIPODOCPESSOA D, EMPRESACLIENTE E '+
                 'WHERE (P.IDPESSOA = '+FloatToStr(idCliente)+')      '+
                 '  AND (P.IDDOCUMENTO = D.IDDOCUMENTO(+))         '+
                 '  AND (P.IDPESSOA = E.IDFORCLI)                  '+
                 '  AND (E.IDPESSOA = '+FloatToStr(iEmpresa)+')    ';
         _Cds.Data := GetDataPacket(sSql);
         //
         if (_Cds.FieldByName('CONTACCLIENTE').AsString <> _Cds.FieldByName('CONTACRECEITA').AsString) then begin
            if ((_Cds.FieldByName('CONTACCLIENTE').isNull) or (_Cds.FieldByName('CONTACRECEITA').isNull)) then begin
               MessageInfo := 'Obrigatório preencher as Contas Contábeis do Cliente '+_Cds.FieldByName('RAZAOSOCIAL').AsString;
               DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Verificando os Dados para Emissão das Faturas',MessageInfo]);
               Result := False;
            end;
            if not ContaContabil.TestaContaContabil(_Cds.FieldByName('PLANO').AsFloat,
                   _Cds.FieldByName('CONTACCLIENTE').AsString, False,False) then begin
               MessageInfo :=ContaContabil.MessageInfo+' do Cliente '+_Cds.FieldByName('RAZAOSOCIAL').AsString;
               DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Verificando os Dados para Emissão das Faturas',MessageInfo]);
               Result := False;
            end else begin
               if ContaContabil.ObrigaCentroCusto = 'S' then begin
                  if _Cds.FieldByName('CODCENTROCUSTO').isNull then begin
                     MessageInfo :='Centro de Custo do Cliente '+_Cds.FieldByName('RAZAOSOCIAL').AsString+' Não Cadastrado';
                     DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Verificando os Dados para Emissão das Faturas',MessageInfo]);
                     Result := False;
                  end else begin
                     if ContaContabil.TestaContaxCC(_Cds.FieldByName('PLANO').AsFloat,iEmpresa,
                                         _Cds.FieldByName('CONTACCLIENTE').AsString, _Cds.FieldByName('CODCENTROCUSTO').AsString) then begin
                        MessageInfo :='Centro de Custo do Cliente '+_Cds.FieldByName('RAZAOSOCIAL').AsString+' Incompatível';
                        DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Verificando os Dados para Emissão das Faturas',MessageInfo]);
                        Result := False;
                     end;
                  end;
               end;
               if ContaContabil.ObrigaSubConta = 'S' then begin
                  if _Cds.FieldByName('CODSUBCONTA').isNull then begin
                     MessageInfo :='Subconta do Cliente '+_Cds.FieldByName('RAZAOSOCIAL').AsString+' Não Cadastrada';
                     DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Verificando os Dados para Emissão das Faturas',MessageInfo]);
                     Result := False;
                  end else begin
                     if ContaContabil.TestaContaxSC(_Cds.FieldByName('PLANO').AsFloat, iEmpresa,
                               _Cds.FieldByName('CODSUBCONTA').AsFloat,_Cds.FieldByName('CONTACCLIENTE').AsString) then begin
                        MessageInfo :='Subconta do Cliente '+_Cds.FieldByName('RAZAOSOCIAL').AsString+' Incompatível';
                        DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Verificando os Dados para Emissão das Faturas',MessageInfo]);
                        Result := False;
                     end;
                  end;
               end;
            end;
         end;
      end;
      _Progresso    := _Progresso+1;
      DoProgresso([sBilhete,IntToStr(_MaxProgresso),IntToStr(_Progresso),'Verificando os Dados para Emissão das Faturas','']);
      FCdsNotasaFat.Next;
   end;
end;


procedure TCtrlGeraFatura.SetCdsNotasaFat(const Value: TClientDataSet);
begin
  FCdsNotasaFat := Value;
end;

procedure TCtrlGeraFatura.DoChangeDataBase;
begin
  inherited;
  _DbComissaoFront.DatabaseName := DataBaseName;
end;

function TCtrlGeraFatura.ListaFaturaEmite(iEmpresa, iFatIni,
  iFatFim, iForCli: Double; sCompl : String; bFiltraCompl : Boolean): OleVariant;
var _sql : TCMSqlParams;
begin
   _sql := TCMSqlParams.Create(nil);
   _sql.ControlObject := Self;
   Try
      with _sql do begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT P.RAZAOSOCIAL,D.NODOCUMENTO, D.CODDOCUMENTO,D.DATAPROGRAMADA,');
         SQL.Add('                L.VALOR,L.DATALANCTO, D.DATAVENCTO, ''N'' AS FLGMARCA,       ');
         SQL.Add('                D.NODOCUMENTO ||'' ''|| D.COMPLDOCUMENTO as DOCUM, S.SALDO   ');
         SQL.Add('FROM DOCUMENTO D, LANCTODOCUM L,              ');
         SQL.Add('     NFAFATPORTIPODC N, PESSOA P,             ');
         SQL.Add('     (SELECT D.CODDOCUMENTO,                  ');
         SQL.Add('             SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDO    ');
         SQL.Add('      FROM DOCUMENTO D, LANCTODOCUM L         ');
         SQL.Add('      WHERE (D.IDPESSOA = '+FloatToStr(iEmpresa)+') ');
         SQL.Add('        AND (D.RECPAG = ''R'')                      ');
         SQL.Add('        AND (D.STATUS <> ''2'')                     ');
         SQL.Add('        AND (L.ESTORNO IS NULL)                     ');
         SQL.Add('        AND (D.NODOCUMENTO BETWEEN '+FloatToStr(iFatIni)+' AND '+FloatToStr(iFatFim)+')');
         if bFiltraCompl then begin
            if sCompl <> '' then begin
               SQL.Add('        AND (D.COMPLDOCUMENTO = '''+sCompl+''')');
            end else begin
               SQL.Add('        AND (D.COMPLDOCUMENTO IS NULL)');
            end;
         end;
         if iForCli <> 0 then begin
            SQL.Add('        AND (D.IDFORCLI = '+FloatToStr(iForCli)+')');
         end;
         SQL.Add('        AND (L.CODDOCUMENTO = D.CODDOCUMENTO) ');
         SQL.Add('      GROUP BY D.CODDOCUMENTO) S              ');
         SQL.Add('WHERE (D.IDPESSOA = '+FloatToStr(iEmpresa)+') ');
         SQL.Add('  AND (D.RECPAG = ''R'')                      ');
         SQL.Add('  AND (D.STATUS <> ''2'')                     ');
         SQL.Add('  AND (L.ESTORNO IS NULL)                     ');
         SQL.Add('  AND (D.NODOCUMENTO BETWEEN '+FloatToStr(iFatIni)+' AND '+FloatToStr(iFatFim)+')');
         if bFiltraCompl then begin
            if sCompl <> '' then begin
               SQL.Add('  AND (D.COMPLDOCUMENTO = '''+sCompl+''')');
            end else begin
               SQL.Add('  AND (D.COMPLDOCUMENTO IS NULL)');
            end;
         end;
         if iForCli <> 0 then begin
            SQL.Add('  AND (D.IDFORCLI = '+FloatToStr(iForCli)+')');
         end;
         SQL.Add('  AND ((D.OPERACAO = ''2 '') OR (D.OPERACAO = ''1 '')) ');
         SQL.Add('  AND (L.CODDOCUMENTO = D.CODDOCUMENTO)                ');
         SQL.Add('  AND (L.OPERACAO = D.OPERACAO)                        ');
         SQL.Add('  AND (N.CODDOCUMENTO = D.CODDOCUMENTO)                ');
         SQL.Add('  AND (S.CODDOCUMENTO = D.CODDOCUMENTO)                ');
         SQL.Add('  AND (P.IDPESSOA = D.IDFORCLI)                        ');
         SQL.Add('ORDER BY D.NODOCUMENTO                                 ');
      end;
      Result := _sql.Data;
   Finally
      _sql.Free;
   end;
end;

end.


