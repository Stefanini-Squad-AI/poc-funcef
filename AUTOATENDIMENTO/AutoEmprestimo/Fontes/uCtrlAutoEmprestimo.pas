unit uCtrlAutoEmprestimo;

interface

uses
  SysUtils, HTTPApp, ADODB, Db, Jpeg, extctrls, graphics, JCLStrings, uConstPaginasCampos, uDiasUteis, uSistema,
  uCmFileUtils, DModAutoAtendimento, Classes, uCtrlPadroes, uCmTypes, uVersoes, JCLSysUtils, uMidasUtil,
  uCtrlFuncoesAA, uWebEmpSimulacaoInscricao, uTypesEmptmoAA, uCMClientDataSet,
  uFuncoesEmprestimo, uCtrlEmpSimulacaoInscricao;




Type TCtrlAutoEmprestimo = Class(TObject)

   Private
     FsMsgErroAE: String;
     procedure SetsMsgErroAE(const Value: String);

     function AbreParamEmptmo (var vResult: OLEVariant) : Boolean;
     function AbreDadosSolic  (const sMatric: string; var vResult: OLEVariant) : Boolean;
     function AbreParamContr  (const iIdTipoContrato: Integer; var vResult: OLEVariant) : Boolean;


   Public
      property sMsgErroAE : String read FsMsgErroAE write SetsMsgErroAE;

      function Conecta   (const sLogin, sSenha: string) : boolean;
      function Elegivel  (const sLogin, sSenha, sMatric: string; const iIdTipoContrato:Integer; const sContrAQuitar:string; var vResult, vContrAnteriores : OLEVariant) : Boolean;
      function Simulacao (const fVlrSolicitado: Currency; const sPrazos: string; var vParametros: OLEVariant; var vParcelas: OLEVariant): Boolean;
      function Concessao (const sLogin, sSenha, sMatric: string; const iIdTipoContrato:Integer;
                          const fVlrSolicitado: Currency;
                          const iPrazo, iIdFornecedor, iCodAutoEmp: Extended;
                          const sBanco, sAgencia, sContaCorrente: string;
                          const sContrAQuitar: string;
                          var   vResult: OLEVariant ): Boolean;
      function AssinaContr (const sLogin, sSenha, sMatric: string;
                            const iIdContratoPadrao:Integer;
                            const sNumContrato: string;
                            dDataAssinatura: TDateTime ): Boolean;
      //Pendência 27300 - 28/01/2008
      function RemoveAssinat(const sLogin, sSenha, sMatric: string;
                             const sNumContrato: string): Boolean;
      //FIm Pendência 27300
      function ChecaAutoEmp (const sLogin, sSenha: string; const fCodAutoEmp:Extended): Extended;

      function RemoveTempFile(const vResult: OLEVariant): Boolean;


      function MontaResultElegibilidade( const vResult, vSimula, vContrAnteriores: OLEVariant ) : String;
      function MontaResultSimulacao    ( const fVlrSolicitado : Currency; const sPrazos,sContrAnt: string; const vResult, vSimula: OLEVariant ) : String;
      function MontaResultConcessao    ( const vResult: OLEVariant; const sContrAnt: string ) : String;
      function MontaResultAssinatura   ( const Request : TWebRequest ): String;
      //Pendência 27300 - 28/01/2008
      function MontaResultRemoveAssinat(const Request: TWebRequest): String;
      //Fim Pendência 27300 - 28/01/2008
      function MontaResultChecaAutoEmp ( const Request : TWebRequest; const fIdContratoEmptmo: Extended ): String;        

end;





var CtrlAutoEmprestimo : TCtrlAutoEmprestimo;

    rSolicitante : TSolicitante;
    rParamEmptmo : TParamEmptmo;
    rTipoContratoEmptmo : TTipoContratoEmptmo;


implementation


{ TCtrlAutoEmprestimo }


function TCtrlAutoEmprestimo.Conecta(const sLogin, sSenha: string): boolean;
var  sSenhaAux, sSenhaAutoEmpAux : String;
begin
   try

      WebEmprestimo.bGeraLogProcesso := bGeraLogProcesso;
      WebEmprestimo.bGeraLogQuery    := bGeraLogQuery;
      WebEmprestimo.sNomeArqLog      := sNomeArqLog;

      if bGeraLogProcesso then CMDebugToFile( 'Valida usuário de acesso.. ', sNomeArqLog );

      Result      := True;
      FsMsgErroAE := '';
      sSenhaAux   := sSenha;

      //Se a senha é criptografada
      if bSenhaCripto then
        sSenhaAutoEmpAux := trim( CMCrypto.CMDecryptStr( StrPadRight( trim( sSenhaAutoEmp ), 20, ' ' ),
         '35DE2306861242849BDFCFF974244D615F88B30310CB4168910D2E2CA35F0B88' ) );

      //Se a senha não é case-sensitive...
      if not bSenhaCase then begin
        sSenhaAux := UpperCase( sSenhaAux );
        sSenhaAutoEmpAux := UpperCase( sSenhaAutoEmpAux );
      end;

      if not bFlgAtivoAutoEmp then
         raise Exception.Create( 'Auto-Empréstimo Desativado, conctacte a Fundação.');

      //Testa login AutoEmprestimo
      if trim( sLogin ) <> trim( sLoginAutoEmp ) then
        raise Exception.Create( 'Login incorreto.' );

      //Testa senha AutoEmprestimo
      if trim( sSenhaAux ) <> trim( sSenhaAutoEmpAux ) then
        raise Exception.Create( 'Senha incorreta.' );

      //Cria uma nova sessão.
      sIdSessao := CriaSessao( sLoginAutoEmp );


  except
     On E : Exception do begin
        Result      := False;
        FsMsgErroAE := E.Message;
     end;
  end;

  LimpaVariaveis;
end;


function TCtrlAutoEmprestimo.AbreParamEmptmo(var vResult: OLEVariant): Boolean;
var cdsResult, cdsTemp: TCMClientDataSet;
begin
   try
      try
         if bGeraLogProcesso then CMDebugToFile( 'Busca parâmetros do Empréstimo.. ', sNomeArqLog );

         Result    := True;
         cdsTemp   := TCMClientDataSet.Create( nil );
         cdsResult := TCMClientDataSet.Create( nil );
         cdsResult.Data := vResult;

         //Recupera parâmetros de empréstimos
         cdsTemp.Data := WebEmprestimo.ParametrosEmprestimo( iIdEmpresaProp );

         if cdsResult.IsEmpty then
              cdsResult.Insert
         else cdsResult.Edit;

         cdsResult.FieldByName('emp_sFlgFormaPag').AsString        := trim( cdsTemp.FieldByName('FLGFORMAPAG').AsString );
         cdsResult.FieldByName('emp_sFlgFormaRec').AsString        := trim( cdsTemp.FieldByName('FLGFORMAREC').AsString );
         cdsResult.FieldByName('emp_sCodPortFormaRec').AsString    := trim( cdsTemp.FieldByName('PORTFORMARECTO').AsString );
         cdsResult.FieldByName('emp_sCodPortFormaPag').AsString    := trim( cdsTemp.FieldByName('PORTFORMAPAGTO').AsString );
         cdsResult.FieldByName('emp_sCodFormaPag').AsString        := trim( cdsTemp.FieldByName('CODFORMAPAGTO').AsString );
         cdsResult.FieldByName('emp_sCodEstado').AsString          := trim( cdsTemp.FieldByName('CODESTADO').AsString );
         cdsResult.FieldByName('emp_sHoraEncerra').AsString        := trim( cdsTemp.FieldByName('HORAENCERRA').AsString );
         cdsResult.FieldByName('emp_iFlgTrataAssinat').AsInteger   := StrToIntDef( trim( cdsTemp.FieldByName('FLGTRATAASSINAT').AsString ), 0 );
         cdsResult.FieldByName('emp_iFlgPendConcessao').AsInteger  := StrToIntDef( trim( cdsTemp.FieldByName('FLGPENDCONCESSAO').AsString ), 0 );
         cdsResult.FieldByName('emp_iFlgCalcDia').AsInteger        := StrToIntDef( trim( cdsTemp.FieldByName('FLGCALCDIA').AsString ), 0 );
         cdsResult.FieldByName('emp_iFlgControlaInsc').AsInteger   := StrToIntDef( trim( cdsTemp.FieldByName('FLGCONTROLAINSC').AsString ), 0 );
         cdsResult.FieldByName('emp_iFlgRenPrestab').AsInteger     := StrToIntDef( trim( cdsTemp.FieldByName('FLGRENPRESTAB').AsString ), 0 );
         cdsResult.FieldByName('emp_iFlgConcUltDiaMes').AsInteger  := StrToIntDef( trim( cdsTemp.FieldByName('FLGCONCULTDIAMES').AsString ), 0 );
         cdsResult.FieldByName('emp_iFlgDataAtuSld').AsInteger     := StrToIntDef( trim( cdsTemp.FieldByName('FLGDATAATUSLD').AsString ), 0 );
         cdsResult.FieldByName('emp_iFlgObrigaAvalista').AsInteger := StrToIntDef( trim( cdsTemp.FieldByName('FLGOBRIGAAVALISTA').AsString ), 0 );
         cdsResult.FieldByName('emp_iFlgSaldoDevAnt').AsInteger    := StrToIntDef( trim( cdsTemp.FieldByName('FLGSALDODEVANT').AsString ), 0 );
         cdsResult.FieldByName('emp_iFlgUsaFiario').AsInteger      := StrToIntDef( trim( cdsTemp.FieldByName('FLGUSAFIARIO').AsString ), 0 );
         cdsResult.FieldByName('emp_iFlgEstornoPosQuit').AsInteger := StrToIntDef( trim( cdsTemp.FieldByName('FLGESTORNOPOSQUIT').AsString ), 0 );
         cdsResult.FieldByName('emp_iFlgQuitaParcMorte').AsInteger := StrToIntDef( trim( cdsTemp.FieldByName('FLGQUITAPARCMORTE').AsString ), 0 );
         cdsResult.FieldByName('emp_iIdRegraAval').AsInteger       := StrToIntDef( trim( cdsTemp.FieldByName('IDREGRAAVAL').AsString ), 0 );
         cdsResult.FieldByName('emp_iIdItemDevSegQuit').AsInteger  := StrToIntDef( trim( cdsTemp.FieldByName('IDITEMDEVSEGQUIT').AsString ), 0 );
         cdsResult.FieldByName('emp_iIdItemProvPerda').AsInteger   := StrToIntDef( trim( cdsTemp.FieldByName('IDITEMPROVPERDA').AsString ), 0 );
         cdsResult.FieldByName('emp_iIdPais').AsInteger            := StrToIntDef( trim( cdsTemp.FieldByName('IDPAIS').AsString ), 0 );
         cdsResult.FieldByName('emp_iIdCidades').AsInteger         := StrToIntDef( trim( cdsTemp.FieldByName('IDCIDADES').AsString ), 0 );
         cdsResult.FieldByName('emp_iIdEstado').AsInteger          := StrToIntDef( trim( cdsTemp.FieldByName('IDESTADO').AsString ), 0 );
         cdsResult.FieldByName('emp_iIdItemSegConc').AsInteger     := StrToIntDef( trim( cdsTemp.FieldByName('IDITEMSEGCONC').AsString ), 0 );
         cdsResult.FieldByName('emp_iIdItemSegCompl').AsInteger    := StrToIntDef( trim( cdsTemp.FieldByName('IDITEMSEGCOMPL').AsString ), 0 );
         cdsResult.FieldByName('emp_iFlgAbonoDiverg').AsInteger    := StrToIntDef( trim( cdsTemp.FieldByName('FLGABONODIVERG').AsString ), 0 );
         cdsResult.FieldByName('emp_bFlgExcepcional').AsBoolean    := ( cdsTemp.FieldByName('FLGEXCEPCIONAL').AsInteger = 1 );
         cdsResult.FieldByName('emp_iIdRegraTipoContr').AsInteger  := StrToIntDef( trim( cdsTemp.FieldByName('IDREGRATIPOCONTR').AsString ), 0 );

         cdsResult.Post;
         vResult := cdsResult.Data;
      except
         On E : Exception do begin
            Result     := False;
            sMsgErroAE := E.Message;
         end;
      end;
   finally
      FreeAndNil( cdsResult );
      FreeAndNil( cdsTemp );
   end;
end;


function TCtrlAutoEmprestimo.AbreParamContr(const iIdTipoContrato: Integer; var vResult: OLEVariant): Boolean;
var cdsResult, cdsTemp: TCMClientDataSet;
begin
   try
      try
         if bGeraLogProcesso then CMDebugToFile( 'Abre parâmetros do tipo de contrato.. ', sNomeArqLog );

         Result    := True;
         cdsTemp   := TCMClientDataSet.Create( nil );
         cdsResult := TCMClientDataSet.Create( nil );
         cdsResult.Data := vResult;

         //Recupera dados do tipo de contrato
         cdsTemp.Data := WebEmprestimo.DadosTpContrato( iIdTipoContrato );
         if (cdsTemp.IsEmpty) then
            raise Exception.Create( 'Modalidade de Contrato inexistente' );

         if (cdsTemp.FieldByName('FLGUSOAUTOEMP').AsInteger <> 1) then
            raise Exception.Create( 'Modalidade de Contrato não disponível' );

         if cdsResult.IsEmpty then
              cdsResult.Insert
         else cdsResult.Edit;

         cdsResult.FieldByName('con_iIdTipoContrEmptmo').AsInteger := cdsTemp.FieldByName('IDTIPOCONTREMPTMO').AsInteger;
         cdsResult.FieldByName('con_iIdTipoEmptmo').AsInteger      := cdsTemp.FieldByName('IDTIPOEMPTMO').AsInteger;
         cdsResult.FieldByName('con_iIdRegraEleg').AsInteger       := cdsTemp.FieldByName('IDREGRAELEG').AsInteger;
         cdsResult.FieldByName('con_iTCEMinRenova').AsInteger      := cdsTemp.FieldByName('TCEMINRENOVA').AsInteger;
         cdsResult.FieldByName('con_iTepMaxContrato').AsInteger    := cdsTemp.FieldByName('TEPMAXCONTRATO').AsInteger;
         cdsResult.FieldByName('con_iIdRegraDataCred').AsInteger   := cdsTemp.FieldByName('IDREGRADATACRED').AsInteger;
         cdsResult.FieldByName('con_iIdRegraPrimParc').AsInteger   := cdsTemp.FieldByName('IDREGRAPRIMPARC').AsInteger;
         cdsResult.FieldByName('con_iIdRegraSalBas').AsInteger     := cdsTemp.FieldByName('IDREGRASALBAS').AsInteger;
         cdsResult.FieldByName('con_iIdRegraMargem').AsInteger     := cdsTemp.FieldByName('IDREGRAMARGEM').AsInteger;
         cdsResult.FieldByName('con_iIdRegraReserva').AsInteger    := cdsTemp.FieldByName('IDREGRARESERVA').AsInteger;
         cdsResult.FieldByName('con_iIdRegraJurConc').AsInteger    := cdsTemp.FieldByName('IDREGRAJURCONC').AsInteger;
         cdsResult.FieldByName('con_iIdRegraJurExibe').AsInteger   := cdsTemp.FieldByName('IDREGRAJUREXIBE').AsInteger;
         cdsResult.FieldByName('con_iIdRegraPrazosConc').AsInteger := cdsTemp.FieldByName('IDREGRAPRAZOSCONC').AsInteger;
         cdsResult.FieldByName('con_iIdRegraPrazoMax').AsInteger   := cdsTemp.FieldByName('IDREGRAPRAZOMAX').AsInteger;
         cdsResult.FieldByName('con_iIdRegraLimites').AsInteger    := cdsTemp.FieldByName('IDREGRALIMITES').AsInteger;
         cdsResult.FieldByName('con_iTCEMaxInscr').AsInteger       := cdsTemp.FieldByName('TCEMAXINSCR').AsInteger;
         cdsResult.FieldByName('con_iTCEMaxContrato').AsInteger    := cdsTemp.FieldByName('TCEMAXCONTRATO').AsInteger;
         cdsResult.FieldByName('con_iTCENumParcSim').AsInteger     := cdsTemp.FieldByName('TCENUMPARCSIM').AsInteger;
         cdsResult.FieldByName('con_iNumParcDesconto').AsInteger   := cdsTemp.FieldByName('NUMPARCDESCONTO').AsInteger;
         cdsResult.FieldByName('con_iFlgObrigBenef').AsInteger     := cdsTemp.FieldByName('FLGOBRIGBENEF').AsInteger;
         cdsResult.FieldByName('con_iFlgVerPrazoTipoQuit').AsInteger := cdsTemp.FieldByName('FLGVERPRAZOTIPOQUIT').AsInteger;
         cdsResult.FieldByName('con_iFlgVerificaContrato').AsInteger := cdsTemp.FieldByName('FLGVERIFICACONTRATO').AsInteger;
         cdsResult.FieldByName('con_sTCEDescricao').AsString       := cdsTemp.FieldByName('TCEDESCRICAO').AsString;
         cdsResult.FieldByName('con_sDescTipoEmptmo').AsString     := cdsTemp.FieldByName('DESCTIPOEMPTMO').AsString;
         cdsResult.FieldByName('con_sMoeSigla').AsString           := cdsTemp.FieldByName('MOESIGLA').AsString;
         cdsResult.FieldByName('con_sMoeCodigo').AsString          := cdsTemp.FieldByName('MOECODIGO').AsString;
         cdsResult.FieldByName('con_sFlgFormaRec').AsString        := cdsTemp.FieldByName('FLGFORMAREC').AsString;
         cdsResult.FieldByName('con_sFlgFormaPag').AsString        := cdsTemp.FieldByName('FLGFORMAPAG').AsString;

         cdsResult.Post;
         vResult := cdsResult.Data;
      except
         On E : Exception do begin
            Result     := False;
            sMsgErroAE := E.Message;
         end;
      end;
   finally
      FreeAndNil( cdsResult );
      FreeAndNil( cdsTemp );
   end;
end;

function TCtrlAutoEmprestimo.AbreDadosSolic(const sMatric: string; var vResult: OLEVariant): Boolean;
var cdsResult, cdsTemp: TCMClientDataSet;
begin
   try
      try
         if bGeraLogProcesso then CMDebugToFile( 'Abre dados do solicitante.. ', sNomeArqLog );

         Result    := True;
         cdsTemp   := TCMClientDataSet.Create( nil );
         cdsResult := TCMClientDataSet.Create( nil );
         cdsResult.Data := vResult;

         //Recupera parâmetros do participante
         if cdsResult.FieldByName('emp_bFlgExcepcional').AsBoolean then
              cdsTemp.Data := WebEmprestimo.DadosSolic( -1, cdsResult.FieldByName('emp_bFlgExcepcional').AsBoolean, sMatric )
         else cdsTemp.Data := WebEmprestimo.DadosSolic( StrToInt(sMatric), cdsResult.FieldByName('emp_bFlgExcepcional').AsBoolean );

         if cdsTemp.IsEmpty then
            raise Exception.Create( 'Matrícula não disponível' );

         if cdsTemp.RecordCount > 1 then
            raise Exception.Create( 'Matrícula em duplicidade' );

         if cdsResult.IsEmpty then
              cdsResult.Insert
         else cdsResult.Edit;

         cdsResult.FieldByName('sol_iIdTitular').AsInteger       := cdsTemp.FieldByName('IDTITULAR').AsInteger;
         cdsResult.FieldByName('sol_iIdBenef').AsInteger         := cdsTemp.FieldByName('IDPESSOA').AsInteger;
         cdsResult.FieldByName('sol_iIdInscricaoPrev').AsInteger := cdsTemp.FieldByName('INSCRICAONUMERO').AsInteger;
         if cdsTemp.FindField('IDSITPART') <> nil then
              cdsResult.FieldByName('sol_iIdSitPart').AsInteger  := cdsTemp.FieldByName('IDSITPART').AsInteger
         else cdsResult.FieldByName('sol_iIdSitPart').AsInteger  := 0;
         cdsResult.FieldByName('sol_iIdPessJur').AsInteger       := cdsTemp.FieldByName('IDPESSJUR').AsInteger;
         cdsResult.FieldByName('sol_iIdPlanoPrev').AsInteger     := cdsTemp.FieldByName('IDPLANOPREV').AsInteger;
         cdsResult.FieldByName('sol_sMatricula').AsString        := trim( cdsTemp.FieldByName('MATRICULA').AsString );
         cdsResult.FieldByName('sol_sFlgInterno').AsString       := trim( cdsTemp.FieldByName('FLGINTERNO').AsString );
         cdsResult.FieldByName('sol_sCPF').AsString              := trim( cdsTemp.FieldByName('CPF').AsString );
         cdsResult.FieldByName('sol_sCPF_TIT').AsString          := trim( cdsTemp.FieldByName('CPF_TIT').AsString );
         cdsResult.FieldByName('sol_sMatricula_TIT').AsString    := trim( cdsTemp.FieldByName('MATRICULA_TIT').AsString );

         // Recupera dados bancários do solicitante
         cdsTemp.Close;
         //Pendência 27280 - 24/01/2008
         //cdsTemp.Data := WebEmprestimo.DadosBancariosSolic( cdsResult.FieldByName('sol_iIdTitular').AsInteger );
         cdsTemp.Data := WebEmprestimo.DadosBancariosSolic( cdsResult.FieldByName('sol_iIdBenef').AsInteger );
         //Fim Pendência 27280
         if not cdsTemp.IsEmpty then begin
            cdsResult.FieldByName('sol_sNumBanco').AsString          := cdsTemp.FieldByName('NUMBANCO').AsString;
            cdsResult.FieldByName('sol_sNumAgencia').AsString        := cdsTemp.FieldByName('NUMAGENCIA').AsString;
            cdsResult.FieldByName('sol_sNumContaCorrente').AsString  := cdsTemp.FieldByName('CONTACORRENTE').AsString;
         end;

         cdsResult.Post;
         vResult := cdsResult.Data;
      except
         On E : Exception do begin
            Result     := False;
            sMsgErroAE := E.Message;
         end;
      end;
   finally
      FreeAndNil( cdsResult );
      FreeAndNil( cdsTemp );
   end;
end;



function TCtrlAutoEmprestimo.Elegivel(const sLogin, sSenha, sMatric: string;
                                      const iIdTipoContrato: Integer;
                                      const sContrAQuitar:string;
                                      var   vResult, vContrAnteriores : OLEVariant): Boolean;
var cdsResult      : TCMClientDataSet;
    ctrlEmprestimo : TCtrlEmpSimulacaoInscricao;
begin
   try
      try
         ctrlEmprestimo := TCtrlEmpSimulacaoInscricao.Create;

         Result := True;
         cdsResult := TCMClientDataSet.Create( nil );

         // Testa Conexão
         if not Conecta( sLogin, sSenha ) then
            raise Exception.Create( sMsgErroAE );

         // abre cdsResult
         cdsResult.Data := CtrlEmpSimulacaoInscricao.CriaCdsResult;
         vResult := cdsResult.Data;

         //Recupera parâmetros de empréstimos
         if not AbreParamEmptmo(vResult) then raise Exception.Create( sMsgErroAE );

         //Recupera dados do solicitante
         if not AbreDadosSolic(sMatric, vResult)  then raise Exception.Create( sMsgErroAE );

         //Recupera dados do tipo de contrato
         if not AbreParamContr(iIdTipoContrato, vResult)  then raise Exception.Create( sMsgErroAE );

         if not CtrlEmprestimo.ParamSimulacao ( vResult, vContrAnteriores, sContrAQuitar ) then
            raise Exception.Create( CtrlEmprestimo.sMsgErro );

            

      except
         On E : Exception do begin
            Result     := False;
            sMsgErroAE := E.Message;

         end;
      end;
   finally
      FreeAndNil( cdsResult );
      FreeAndNil( cds );
      FreeAndNil( CtrlEmprestimo );
   end;
end;


function TCtrlAutoEmprestimo.Simulacao (const fVlrSolicitado: Currency; const sPrazos: string;
                                          var vParametros: OLEVariant; var vParcelas: OLEVariant): Boolean;
var  CtrlEmprestimo : TCtrlEmpSimulacaoInscricao;
begin
   try
      try
         Result := True;
         CtrlEmprestimo := TCtrlEmpSimulacaoInscricao.Create;

         if not CtrlEmprestimo.Simulacao(fVlrSolicitado, sPrazos, vParametros, vParcelas ) then
            raise Exception.Create( CtrlEmprestimo.sMsgErro );

      except
         On E : Exception do begin
            Result   := False;
            sMsgErroAE := E.Message;

         end;
      end;
   finally
      FreeAndNil( CtrlEmprestimo )
   end;
end;



function TCtrlAutoEmprestimo.Concessao(const sLogin, sSenha, sMatric: string; const iIdTipoContrato:Integer;
                                       const fVlrSolicitado: Currency;
                                       const iPrazo, iIdFornecedor, iCodAutoEmp: Extended;
                                       const sBanco, sAgencia, sContaCorrente: string;
                                       const sContrAQuitar: string;
                                       var   vResult : OLEVariant ): Boolean;
var vParcelas : OLEVariant;
    vContrAnteriores: OLEVariant;
    ctrlConcessao : TCtrlEmpSimulacaoInscricao;
begin
   try
      try
         Result := True;

         ctrlConcessao := TCtrlEmpSimulacaoInscricao.Create;

         // Verifica Elegibilidade
         if not Elegivel(sLogin, sSenha, sMatric, iIdTipoContrato, sContrAQuitar, vResult, vContrAnteriores ) then
            raise Exception.Create( sMsgErroAE );

         if iIdFornecedor > 0 then begin
            if not WebEmprestimo.VerificaFornecedorCredito(iIdFornecedor) then
               raise Exception.Create( 'Identificador de fornecedor inválido' );
         end;

         // Cria Simulação
         if not Simulacao(fVlrSolicitado, FloatToStr(iPrazo), vResult, vParcelas ) then
            raise Exception.Create( sMsgErroAE );

         // Carrega parâmetros de Concessão
         if not ctrlConcessao.ParamConcessao(vResult, vParcelas,
                                             fVlrSolicitado, iPrazo, iIdFornecedor, iCodAutoEmp,
                                             sBanco, sAgencia, sContaCorrente ) then
            raise Exception.Create( ctrlConcessao.sMsgErro );


         // Efetiva Concessão
         if not CtrlConcessao.InscricaoConcessao(2, vResult, vParcelas, vContrAnteriores ) then
            raise Exception.Create( ctrlConcessao.sMsgErro );

      except
         On E : Exception do begin
            Result   := False;
            sMsgErroAE := E.Message;

         end;
      end;
   finally
      ctrlConcessao.Free;
   end;
end;


function TCtrlAutoEmprestimo.AssinaContr(const sLogin, sSenha, sMatric: string; const iIdContratoPadrao: Integer;
                                         const sNumContrato: string;
                                         dDataAssinatura: TDateTime): Boolean;
var cdsResult      : TCMClientDataSet;
    ctrlEmprestimo : TCtrlEmpSimulacaoInscricao;
    vResult        : OLEVariant;
begin
   try
      try
         ctrlEmprestimo := TCtrlEmpSimulacaoInscricao.Create;

         Result := True;
         cdsResult := TCMClientDataSet.Create( nil );

         // Testa Conexão
         if not Conecta( sLogin, sSenha ) then
            raise Exception.Create( sMsgErroAE );

         // abre cdsResult
         cdsResult.Data := CtrlEmpSimulacaoInscricao.CriaCdsResult;
         vResult := cdsResult.Data;

         //Recupera parâmetros de empréstimos
         if not AbreParamEmptmo(vResult) then raise Exception.Create( sMsgErroAE );

         //Recupera dados do solicitante
         if not AbreDadosSolic(sMatric, vResult)  then raise Exception.Create( sMsgErroAE );
         cdsResult.Data := vResult;

         if not CtrlEmprestimo.InsereAssinaContr( cdsResult.FieldByName('sol_iIdTitular').AsInteger,
                                                  cdsResult.FieldByName('sol_iIdBenef').AsInteger,
                                                  iIdContratoPadrao,
                                                  sNumContrato,
                                                  dDataAssinatura ) then
            raise Exception.Create( CtrlEmprestimo.sMsgErro );

      except
         On E : Exception do begin
            Result     := False;
            sMsgErroAE := E.Message;

         end;
      end;
   finally
      FreeAndNil( cdsResult );
      FreeAndNil( CtrlEmprestimo );
   end;
end;



//Pendência 27300 - 28/01/2008
function TCtrlAutoEmprestimo.RemoveAssinat(const sLogin, sSenha, sMatric: string;
                                         const sNumContrato: string): Boolean;
var cdsResult      : TCMClientDataSet;
    ctrlEmprestimo : TCtrlEmpSimulacaoInscricao;
    vResult        : OLEVariant;
begin
   try
      try
         ctrlEmprestimo := TCtrlEmpSimulacaoInscricao.Create;

         Result := True;
         cdsResult := TCMClientDataSet.Create( nil );

         // Testa Conexão
         if not Conecta( sLogin, sSenha ) then
            raise Exception.Create( sMsgErroAE );

         // abre cdsResult
         cdsResult.Data := CtrlEmpSimulacaoInscricao.CriaCdsResult;
         vResult := cdsResult.Data;

         //Recupera parâmetros de empréstimos
         if not AbreParamEmptmo(vResult) then raise Exception.Create( sMsgErroAE );

         //Recupera dados do solicitante
         if not AbreDadosSolic(sMatric, vResult)  then raise Exception.Create( sMsgErroAE );
         cdsResult.Data := vResult;

         if not CtrlEmprestimo.RemoveAssinaContr( sNumContrato ) then
            raise Exception.Create( CtrlEmprestimo.sMsgErro );

      except
         On E : Exception do begin
            Result     := False;
            sMsgErroAE := E.Message;

         end;
      end;
   finally
      FreeAndNil( cdsResult );
      FreeAndNil( CtrlEmprestimo );
   end;
end;
//



function TCtrlAutoEmprestimo.ChecaAutoEmp(const sLogin, sSenha: string; const fCodAutoEmp: Extended): Extended;
var ctrlEmprestimo : TCtrlEmpSimulacaoInscricao;
begin
   try
      try
         ctrlEmprestimo := TCtrlEmpSimulacaoInscricao.Create;
         Result := -1;

         // Testa Conexão
         if not Conecta( sLogin, sSenha ) then
            raise Exception.Create( sMsgErroAE );

         Result := CtrlEmprestimo.ChecaAutoEmp( fCodAutoEmp );
         if Result <= 0 then
            raise Exception.Create( CtrlEmprestimo.sMsgErro );

      except
         On E : Exception do begin
            Result     := -1;
            sMsgErroAE := E.Message;

         end;
      end;
   finally
      FreeAndNil( CtrlEmprestimo );
   end;
end;


function TCtrlAutoEmprestimo.MontaResultElegibilidade ( const vResult, vSimula, vContrAnteriores: OLEVariant ): String;
var cdsDados, cdsSimula, cdsContrAnt : TCMClientDataSet;
    sPrazos, sItem  : String;
    aPrazos, aItem  : array of string;
    i,j : integer;
    iItParcela,
    iItLiquido,
    iItSolic : Integer;
begin
   try

      cdsDados    := TCMClientDataSet.Create( nil );
      cdsSimula   := TCMClientDataSet.Create( nil );
      cdsContrAnt := TCMClientDataSet.Create( nil );
      cdsDados.Data    := vResult;
      cdsSimula.Data   := vSimula;
      cdsContrAnt.Data := vContrAnteriores;

      sPrazos := cdsDados.FieldByName('par_sParcelas').AsString;

      while sPrazos <> '' do
      begin
        SetLength( aPrazos, length( aPrazos ) + 1 );
        aPrazos[High(aPrazos)] := RetiraPrimeiroElemento( sPrazos, ';' );
      end;

      Result := '<?xml version="1.0" encoding="utf-8" ?> ' + CR +
                '<resultado> ' + CR +
                '   <vLoginMaster>'         + sLoginAutoEmp + '</vLoginMaster> ' + CR +
                '   <vMatricula>'           + cdsDados.FieldByName('sol_sMatricula').AsString + '</vMatricula> ' + CR +
                '   <vIdTipoContrEmptmo>'   + IntToStr(cdsDados.FieldByName('con_iIdTipoContrEmptmo').AsInteger)  + '</vIdTipoContrEmptmo> ' + CR +
                '   <empAutoPatrocinio>'    + iff(cdsDados.FieldByName('sol_sFlgInterno').AsString = 'MA','1','0') + '</empAutoPatrocinio> ' + CR +
                '   <empMargemConsignavel>' + FormatFloat( '###0.00', cdsDados.FieldByName('par_fVlrMargem').AsCurrency )  + '</empMargemConsignavel> ' + CR +
                '   <empDataCredito>'       + FormatDateTime( 'dd/MM/yyyy', cdsDados.FieldByName('par_dDtCredito').AsDateTime)  + '</empDataCredito> ' + CR +
                '   <empSaldoQuitacao>'     + FormatFloat( '###0.00', cdsDados.FieldByName('par_fSaldoaQuitar').AsCurrency )  + '</empSaldoQuitacao> ' + CR +
                '   <empBancoPag>'          + trim(cdsDados.FieldByName('sol_sNumBanco').AsString) + '</empBancoPag> ' + CR +
                '   <empAgenciaPag>'        + trim(cdsDados.FieldByName('sol_sNumAgencia').AsString) + '</empAgenciaPag> ' + CR +
                '   <empContaPag>'          + trim(cdsDados.FieldByName('sol_sNumContaCorrente').AsString) + '</empContaPag> ' + CR +
                '   <empAssinaturaContr>'   + cdsDados.FieldByName('par_iPossuiAssinaturaContr').AsString + '</empAssinaturaContr> ' + CR +
                '   <empQuitacoes> ' + CR;


      i := 0;
      while not cdsContrAnt.Eof do begin
         inc(i);
         Result := Result +
                   '      <empContrAQuitar id=''' + IntToStr(i) + '''> '  + CR +
                   '         <empIdContratoEmptmo>'   + FormatFloat( '###0',cdsContrAnt.FieldByName('IDCONTRATOEMPTMO').AsFloat)  + '</empIdContratoEmptmo> ' + CR +
                   '         <empIdTipoContrEmptmo>'  + IntToStr(cdsContrAnt.FieldByName('IDTIPOCONTREMPTMO').AsInteger)  + '</empIdTipoContrEmptmo> ' + CR +
                   '         <empDescTipoContrato>'   + cdsContrAnt.FieldByName('TCEDESCRICAO').AsString + '</empDescTipoContrato> ' + CR +
                   '         <empObrigaQuitacao>'     + cdsContrAnt.FieldByName('FLGOBRIGATORIO').AsString + '</empObrigaQuitacao> ' + CR +
                   '         <empVlrSolicitado>'      + FormatFloat( '###0.00', cdsContrAnt.FieldByName('VLRCONTRATO').AsCurrency )  + '</empVlrSolicitado> ' + CR +
                   '         <empDataCredito>'        + FormatDateTime( 'dd/mm/yyyy', cdsContrAnt.FieldByName('DATACREDITO').AsDateTime)  + '</empDataCredito> ' + CR +
                   '         <empPrazo>'              + cdsContrAnt.FieldByName('NUMPARCELAS').AsString + '</empPrazo> ' + CR +
                   '         <empPracelasPagas>'      + cdsContrAnt.FieldByName('NUMPARCPAGAS').AsString + '</empPracelasPagas> ' + CR +
                   '         <empVlrParcela>'         + FormatFloat( '###0.00', cdsContrAnt.FieldByName('VLRPARCELA').AsCurrency )  + '</empVlrParcela> ' + CR +
                   '         <empVlrSaldoDev>'        + FormatFloat( '###0.00', cdsContrAnt.FieldByName('HMESALDODEV').AsCurrency )  + '</empVlrSaldoDev> ' + CR +
                   '         <empVlrSaldoAQuitar>'    + FormatFloat( '###0.00', cdsContrAnt.FieldByName('VLRATUAL').AsCurrency )  + '</empVlrSaldoAQuitar> ' + CR +
                   '      </empContrAQuitar> ' + CR;
         cdsContrAnt.Next;
      end;


      Result := Result +
                '   </empQuitacoes> ' + CR +
                '   <empSimulacoes> ' + CR;

      i := 0;
      cdsSimula.First;
      while not cdsSimula.Eof do
      begin
         // pega o nome dos campos
         if cdsSimula.FieldByName('QTDE_PARC').AsInteger = -1 then
         begin
            for j := 0 to cdsSimula.FieldCount -1 do begin
                SetLength( aItem, length( aItem ) + 1 );
                if cdsSimula.FieldDefs.Items[j].Name[1] = 'X' then begin
                   aItem[High(aItem)] := cdsSimula.FieldByName(cdsSimula.FieldDefs.Items[j].Name).AsString;
                end;
            end;
            // pega os itens fixos que náo sáo descontos
            iItParcela := cdsSimula.FieldByName('VL_PARCELA').AsInteger;
            iItLiquido := cdsSimula.FieldByName('VL_LIQUIDO').AsInteger;
            iItSolic   := cdsSimula.FieldByName('VL_SOLIC').AsInteger;
         end else begin
            Inc(i);
            Result := Result +
                   '      <empSimulacao id=''' + IntToStr(i) + '''> '  + CR +
                   '         <empPrazo>'      + cdsSimula.FieldByName('QTDE_PARC').AsString + '</empPrazo> ' + CR +
                   '         <empVlrBruto>'   + FormatFloat( '###0.00', cdsSimula.FieldByName('VL_SOLIC').AsCurrency )   + '</empVlrBruto>    ' + CR +
                   '         <empDescontos>   ' + CR;

            for j := 0 to cdsSimula.FieldCount -1 do begin
                if cdsSimula.FieldDefs.Items[j].Name[1] = 'X' then begin
                   sItem  := Copy(cdsSimula.FieldDefs.Items[j].Name,2,3);
                   if (StrToInt(sItem) <> iItParcela) and
                      (StrToInt(sItem) <> iItLiquido) and
                      (StrToInt(sItem) <> iItSolic)   then
                      Result := Result +
                          '            <empItem id=' + QuotedStr(sItem) + ' Descricao=' + QuotedStr(aItem[j]) +'>' + cdsSimula.FieldByName(cdsSimula.FieldDefs.Items[j].Name).AsString + '</empItem>  ' + CR;
                end;
            end;

            Result := Result +
                   '         </empDescontos>  ' + CR +
                   '         <empVlrLiquido>' + FormatFloat( '###0.00', cdsSimula.FieldByName('VL_LIQUIDO').AsCurrency ) + '</empVlrLiquido>  ' + CR +
                   '         <empVlrParcela>' + FormatFloat( '###0.00', cdsSimula.FieldByName('VL_PARCELA').AsCurrency ) + '</empVlrParcela>  ' + CR +
                   '      </empSimulacao> '  + CR;
         end;
         cdsSimula.Next;
      end;

      Result := Result +
                '   </empSimulacoes> ' + CR +
                '   <empPrazo> '  + CR;

      for i := 0 to High( aPrazos ) do
      begin
         Result := Result + '      <Prazo>' + aPrazos[i] + '</Prazo> ' + CR;
      end;

      Result := Result +
                '   </empPrazo> ' + CR +
                '   <empCodigoErro>0</empCodigoErro> ' + CR +
                '   <empMensagemErro>'        + sMsgErroAE + '</empMensagemErro>  ' + CR +
                '   <empMensagemAviso>'       + cdsDados.FieldByName('par_sMsgRestritiva').AsString + '</empMensagemAviso> ' + CR +
                '</resultado> ';

   finally
      FreeAndNil( cdsDados );
      FreeAndNil( cdsSimula );
      FreeAndNil( cdsContrAnt );
   end;
end;



function TCtrlAutoEmprestimo.MontaResultSimulacao(const fVlrSolicitado : Currency; const sPrazos,sContrAnt: string;
                                                  const vResult, vSimula: OLEVariant): String;
var cdsDados, cdsSimula : TCMClientDataSet;
    sItem  : String;
    aPrazos, aItem  : array of string;
    i,j : integer;
    iItParcela,
    iItLiquido,
    iItSolic : Integer;
begin
   try


      cdsDados  := TCMClientDataSet.Create( nil );
      cdsSimula := TCMClientDataSet.Create( nil );
      cdsDados.Data  := vResult;
      cdsSimula.Data := vSimula;

      cdsSimula.IndexFieldNames := 'QTDE_PARC';
      cdsSimula.First;      

      Result := '<?xml version="1.0" encoding="utf-8" ?> ' + CR +
                '<resultado> ' + CR +
                '   <vLoginMaster>'         + sLoginAutoEmp + '</vLoginMaster> ' + CR +
                '   <vMatricula>'           + cdsDados.FieldByName('sol_sMatricula').AsString + '</vMatricula> ' + CR +
                '   <vIdTipoContrEmptmo>'   + IntToStr(cdsDados.FieldByName('con_iIdTipoContrEmptmo').AsInteger)  + '</vIdTipoContrEmptmo> ' + CR +
                '   <vVlrSolicitado>'       + FormatFloat( '###0.00', fVlrSolicitado )   + '</vVlrSolicitado> ' + CR +
                '   <vPrazos>'              + sPrazos + '</vPrazos> ' + CR +
                '   <vIdContrAQuitar>'      + sContrAnt + '</vIdContrAQuitar> ' + CR +
                '   <empSimulacoes> '  + CR;

      i := 0;
      cdsSimula.First;
      while not cdsSimula.Eof do
      begin
         // pega o nome dos campos
         if cdsSimula.FieldByName('QTDE_PARC').AsInteger = -1 then
         begin
            for j := 0 to cdsSimula.FieldCount -1 do begin
                SetLength( aItem, length( aItem ) + 1 );
                if cdsSimula.FieldDefs.Items[j].Name[1] = 'X' then begin
                   aItem[High(aItem)] := cdsSimula.FieldByName(cdsSimula.FieldDefs.Items[j].Name).AsString;
                end;
            end;
            // pega os itens fixos que náo sáo descontos
            iItParcela := cdsSimula.FieldByName('VL_PARCELA').AsInteger;
            iItLiquido := cdsSimula.FieldByName('VL_LIQUIDO').AsInteger;
            iItSolic   := cdsSimula.FieldByName('VL_SOLIC').AsInteger;

         end else begin
            Inc(i);
            Result := Result +
                   '      <empSimulacao id=''' + IntToStr(i) + '''> '  + CR +
                   '         <empPrazo>'      + cdsSimula.FieldByName('QTDE_PARC').AsString + '</empPrazo> ' + CR +
                   '         <empVlrBruto>'   + FormatFloat( '###0.00', cdsSimula.FieldByName('VL_SOLIC').AsCurrency )   + '</empVlrBruto>    ' + CR +
                   '         <empDescontos>   ' + CR;

            for j := 0 to cdsSimula.FieldCount -1 do begin
                if cdsSimula.FieldDefs.Items[j].Name[1] = 'X' then begin
                   sItem  := Copy(cdsSimula.FieldDefs.Items[j].Name,2,3);
                   if (StrToInt(sItem) <> iItParcela) and
                      (StrToInt(sItem) <> iItLiquido) and
                      (StrToInt(sItem) <> iItSolic)   then
                      Result := Result +
                          '            <empItem id=' + QuotedStr(sItem) + ' Descricao=' + QuotedStr(aItem[j]) +'>' + cdsSimula.FieldByName(cdsSimula.FieldDefs.Items[j].Name).AsString + '</empItem>  ' + CR;
                end;
            end;

            Result := Result +
                   '         </empDescontos>  ' + CR +
                   '         <empVlrLiquido>' + FormatFloat( '###0.00', cdsSimula.FieldByName('VL_LIQUIDO').AsCurrency ) + '</empVlrLiquido>  ' + CR +
                   '         <empVlrParcela>' + FormatFloat( '###0.00', cdsSimula.FieldByName('VL_PARCELA').AsCurrency ) + '</empVlrParcela>  ' + CR +
                   '      </empSimulacao> '  + CR;
         end;
         cdsSimula.Next;
      end;

      Result := Result +
                '   </empSimulacoes> ' + CR +
                '   <empCodigoErro>0</empCodigoErro> ' + CR +
                '   <empMensagemErro>'        + sMsgErroAE + '</empMensagemErro> ' + CR +
                '   <empMensagemAviso>'       + cdsDados.FieldByName('par_sMsgRestritiva').AsString + '</empMensagemAviso> ' + CR +
                '</resultado> ';

   finally
      FreeAndNil( cdsDados );
   end;
end;


function TCtrlAutoEmprestimo.MontaResultConcessao(const vResult: OLEVariant; const sContrAnt: string ): String;
var cdsDados : TCMClientDataSet;
begin
   try


      cdsDados  := TCMClientDataSet.Create( nil );
      cdsDados.Data  := vResult;

      Result := '<?xml version="1.0" encoding="utf-8" ?> ' + CR +
                '<resultado> ' + CR +
                '   <vLoginMaster>'         + sLoginAutoEmp + '</vLoginMaster> ' + CR +
                '   <vMatricula>'           + cdsDados.FieldByName('sol_sMatricula').AsString + '</vMatricula> ' + CR +
                '   <vIdTipoContrEmptmo>'   + IntToStr(cdsDados.FieldByName('con_iIdTipoContrEmptmo').AsInteger)  + '</vIdTipoContrEmptmo> ' + CR +
                '   <vVlrSolicitado>'       + FormatFloat( '###0.00', cdsDados.FieldByName('sim_fVlrSolicitado').AsCurrency )  + '</vVlrSolicitado> ' + CR +
                '   <vPrazo>'               + FormatFloat( '###0', cdsDados.FieldByName('sim_iParcelas').AsFloat )  + '</vPrazo> ' + CR +
                '   <vIdContrAQuitar>'      + sContrAnt + '</vIdContrAQuitar> ' + CR +
                '   <vIdFornecedor>'        + FormatFloat( '###0', cdsDados.FieldByName('sim_iIdFornCred').AsFloat )  + '</vIdFornecedor> ' + CR +
                '   <vCodAutoEmprestimo>'   + FormatFloat( '###0', cdsDados.FieldByName('sim_iCodAutoEmp').AsFloat )  + '</vCodAutoEmprestimo> ' + CR +
                '   <vBancoPag>'            + cdsDados.FieldByName('sim_sBancoPag').AsString + '</vBancoPag> ' + CR +
                '   <vAgenciaPag>'          + cdsDados.FieldByName('sim_sAgenciaPag').AsString + '</vAgenciaPag> ' + CR +
                '   <vContaPag>'            + cdsDados.FieldByName('sim_sContaPag').AsString + '</vContaPag> ' + CR +
                '   <empIdContratoEmptmo>'  + FormatFloat( '###0', cdsDados.FieldByName('sim_iIdContratoEmptmo').AsFloat )  + '</empIdContratoEmptmo> ' + CR +
                '   <empCodigoErro>0</empCodigoErro> ' + CR +
                '   <empMensagemErro>'        + sMsgErroAE + '</empMensagemErro> ' + CR +
                '</resultado> ';


   finally
      FreeAndNil( cdsDados );
   end;
end;


function TCtrlAutoEmprestimo.MontaResultChecaAutoEmp(const Request: TWebRequest; const fIdContratoEmptmo: Extended): String;
var j, i: integer;
begin
   Result := '<?xml version="1.0" encoding="utf-8" ?> ' + CR +
             '<resultado> ' + CR;

   //Inclui os campos do request original
   j := 0;
   for i := 0 to ( Request.ContentFields.Count - 1 ) do
   begin
     if (StrLeft( Request.ContentFields.Names[i], 1 ) = 'v') and
        (StrLeft( Request.ContentFields.Names[i], 6 ) <> 'vSenha') then
        Result := Result +
                  '  <' + Request.ContentFields.Names[i] + '>' +
                  trim( Request.ContentFields.Values[ Request.ContentFields.Names[i] ] ) +
                  '</' + Request.ContentFields.Names[i] + '> ' + CR;
   end;

   if fIdContratoEmptmo > 0 then begin
      Result := Result +
                '  <empIdContratoEmptmo>'  + FormatFloat( '###0', fIdContratoEmptmo )  + '</empIdContratoEmptmo> ' + CR +
                '  <empCodigoErro>0</empCodigoErro> ' + CR +
                '  <empMensagemErro> </empMensagemErro> ' + CR +
                '</resultado> ';
   end else begin
      Result := Result +
                '  <empIdContratoEmptmo> </empIdContratoEmptmo> ' + CR +
                '  <empCodigoErro>1</empCodigoErro> ' + CR +
                '  <empMensagemErro>Contrato Inexistente.</empMensagemErro> ' + CR +
                '</resultado> ';
   end;
end;



function TCtrlAutoEmprestimo.MontaResultAssinatura(const Request: TWebRequest): String;
var j, i: integer;
begin
   Result := '<?xml version="1.0" encoding="utf-8" ?> ' + CR +
             '<resultado> ' + CR;

   //Inclui os campos do request original
   j := 0;
   for i := 0 to ( Request.ContentFields.Count - 1 ) do
   begin
     if (StrLeft( Request.ContentFields.Names[i], 1 ) = 'v') and
        (StrLeft( Request.ContentFields.Names[i], 6 ) <> 'vSenha') then
        Result := Result +
                  '  <' + Request.ContentFields.Names[i] + '>' +
                  trim( Request.ContentFields.Values[ Request.ContentFields.Names[i] ] ) +
                  '</' + Request.ContentFields.Names[i] + '> ' + CR;
   end;

   Result := Result +
             '  <empCodigoErro>0</empCodigoErro> ' + CR +
             '  <empMensagemErro> </empMensagemErro> ' + CR +
             '</resultado> ';
end;


//Pendência 27300 - 28/01/2008
function TCtrlAutoEmprestimo.MontaResultRemoveAssinat(const Request: TWebRequest): String;
var j, i: integer;
begin
   Result := '<?xml version="1.0" encoding="utf-8" ?> ' + CR +
             '<resultado> ' + CR;

   //Inclui os campos do request original
   j := 0;
   for i := 0 to ( Request.ContentFields.Count - 1 ) do
   begin
     if (StrLeft( Request.ContentFields.Names[i], 1 ) = 'v') and
        (StrLeft( Request.ContentFields.Names[i], 6 ) <> 'vSenha') then
        Result := Result +
                  '  <' + Request.ContentFields.Names[i] + '>' +
                  trim( Request.ContentFields.Values[ Request.ContentFields.Names[i] ] ) +
                  '</' + Request.ContentFields.Names[i] + '> ' + CR;
   end;

   Result := Result +
             '  <empCodigoErro>0</empCodigoErro> ' + CR +
             '  <empMensagemErro> </empMensagemErro> ' + CR +
             '</resultado> ';
end;
//Fim Pendência 27300


function TCtrlAutoEmprestimo.RemoveTempFile(const vResult: OLEVariant): Boolean;
var cdsTemp: TCMClientDataSet;
    sDir : String;
begin
   try
      try
         cdsTemp := TCMClientDataSet.Create(nil);
         cdsTemp.Data := vResult;
         if cdsTemp.FieldByName('sim_sArqLista').AsString <> '' then begin
            if FileExists(cdsTemp.FieldByName('sim_sArqLista').AsString) then
               DeleteFile(cdsTemp.FieldByName('sim_sArqLista').AsString);

            sDir := ExtractFileDir(cdsTemp.FieldByName('sim_sArqLista').AsString);
            RemoveDir(sDir);
         end;

         if cdsTemp.FieldByName('par_sArqContratosAnteriores').AsString <> '' then begin
            if FileExists(cdsTemp.FieldByName('par_sArqContratosAnteriores').AsString) then
               DeleteFile(cdsTemp.FieldByName('par_sArqContratosAnteriores').AsString);

            sDir := ExtractFileDir(cdsTemp.FieldByName('par_sArqContratosAnteriores').AsString);
            RemoveDir(sDir);
         end;
      except

      end;
   finally
      cdsTemp.Free;
   end;
end;


procedure TCtrlAutoEmprestimo.SetsMsgErroAE(const Value: String);
begin
  FsMsgErroAE := Value;
end;



end.

