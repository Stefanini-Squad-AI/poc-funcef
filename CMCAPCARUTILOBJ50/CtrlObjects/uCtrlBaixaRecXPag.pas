// Alterações
//***************************************************************************************
//Rotina                : ProcessaBaixaManual
//N. Sol..........      : 214738_15892
//N. Kintana......      : 2057238
//Data da Alteração:    : 17/03/2014
//Alteração Form:       : FBaixaIntBancoMT
//Responsável:          : Paulo Nobre
//Descrição.......      : Inclusão do campo FLGMARCADO
//                        Alteração na ProcessaBaixaManual p/ incluir o valor zero na datalancamento
{ --------------------------------------------------------------------------------------------------
Rotina......: PrepareCdsBaixa
Nº SOL......: 221352
Nº KINTANA..: 2053933
Data........: 26/11/2013
Responsável.: Edilaine Ferraresi
Descrição...: flag para baixa total
{ --------------------------------------------------------------------------------------------------
Pendência   : 126261/1121  Kintana 760963
Responsável : Helen V. Bianchi
Data        : 10/01/2012
Descrição.......: Add InTransaction no : if (bComita) and (not InTransaction) ,  dDataDisp_Filho 
--------------------------------------------------------------------------------------------------
Pendência   : SOL 107221/5802 KINTANA 1365701
Responsável : BRUNO AZEVEDO
Data        : 07/12/2011
Descrição   : Criação da Funcionalidade "Recebimento de Contribuições via Empréstimo".
--------------------------------------------------------------------------------------------------
Rotina    : GetPlanosPrevidDocumento
Data      : 27.02.2007
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 24527
Descrição : Retorna os planos previdênciários para o documento.
---------------------------------------------------------------------------------------------------
Rotina    : ProcessaBaixaDocumento
Data      : 25/02/2005
Autor     : Rodolpho da Silva
Pendência : 18641
Descrição : Comentar a crítica da mensagem: MessageInfo := 'Data de Pagamento não pode ser maior do que a de hoje';
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ProcessaBaixaDocumento
Data      : 30/05/2003
Autor     : André Pontes
Descrição : Corrigido: FieldByName('PLACONTA').AsInteger para FieldByName('PLACONTA').AsString
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ProcessaBaixaDocumento(
Data      : 30/05/2003
Autor     : Fábio Fagundes
Descrição : Passada, na ProcessaBaixaManual, a data de disponibilidade
---------------------------------------------------------------------------------------------------}

unit uCtrlBaixaRecXPag;

interface

Uses SysUtils, Controls, Classes, DbClient, uCmControlObject,
     uCtrlBaixaDocumentos,
     uCtrlPortadorforma, uCtrlParamIntegra, uSistema,//Bruno Bastos - Sol 126261
     uCtrlFinanc, uCtrlPadroes, uDiasUteis, uCtrlDocumento;

CONST
  LANCACONTAB = TRUE;
  LANCAFINANCBAIXA = TRUE; (* Gustavo 02/04/2003 - Inicio *)

Type
  TSistemaaProcessar = (spCap, spCar, spCFinan);

  TCtrlBaixaRecXPag = Class(TCmControlObject)
  private
    _CdsParamCap,
    _CdsParamRec,
    _CdsParamGlobal,
    _CdsDocCap,
    _CdsDocCar,

    //Bruno Bastos - 23/12/2009 - Início
    _CdsDocFilhoCap,
    _CdsDocFilhoCar,
    _cdsFilhoFinanc,    
    //Bruno Bastos - 23/12/2009 - Fim

    _CdsFinanc,
    _CdsContabFinanc: TClientDataSet;

    _Financeiro: TCtrlFinanc;
    _BaixaDocumentos: TCtrlBaixaDocumentos;
    _Padroes: TCtrlPadroes;

    //Bruno Bastos - Sol 126261 - Início
    _CtrlPortadorforma : TCtrlPortadorforma;
    //Bruno Bastos - Sol 126261 - Fim

    // Rodolpho da Silva - P: 18641 - 25/02/2005
    _DiasUteis: TDiasUteis;



  protected
    procedure AfterInitialize; Override;

  public
    constructor Create;  Override;
    Destructor  Destroy; Override;

    function ProcessaBaixaDocumento(ovDocCap, ovDocCar, ovLancFinanc: OleVariant;
             iIdEmpresa, iIdUsuario, iIdEspAcesso, iIdModulo, iCodPortFormaPag, iCodPortFormaRec,
             iPlano: Integer; dDataBaixa: TDateTime; bUsaPlanoPatro, bPartidaDobrada: Boolean;
             rValTotCap, rValTotCar: Double; bComita: Boolean = True;
             dDataDisp_Filho: TDateTime = 0): Boolean; //Helen - SOL: 126261/1121 KTN: 658230 Add dDataDisp_Filho


    //Bruno Bastos - Sol 126261 - Início
    function FazRecxPagto(pdData: TDateTime; ovDocsFilhoPag, ovDocsFilhoRec: OleVariant;dDataDisp_Filho: TDateTime = 0) : Boolean;
             //Helen - SOL: 126261/1121 KTN: 658230 Add dDataDisp_Filho 
    //Bruno Bastos - Sol 126261 - Fim


    //amf 26.02.2007 - Retorna os planos previdenciários para o documento.
    function GetPlanosPrevidDocumento(rcodDoc: extended): Olevariant;
  end;

implementation

Uses uCMTypes;

{ TCtrlBaixaRecXPag }

procedure TCtrlBaixaRecXPag.AfterInitialize;
begin
  inherited;
  _BaixaDocumentos.InitializeAs(Self);
  _BaixaDocumentos.OpenTransaction := False;

  _Financeiro.InitializeAs(Self);
  _Financeiro.OpenTransaction := False;

  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := False;


  //  Rodolpho da Silva - P: 18641 - 25/02/2005
  _DiasUteis.InitializeAs(self);
  _DiasUteis.OpenTransaction := False;
  //  Rodolpho da Silva - P: 18641 - 25/02/2005



end;



constructor TCtrlBaixaRecXPag.Create;
begin
  inherited;
  _CdsParamCap := TClientDataSet.Create(nil);
  _CdsParamRec := TClientDataSet.Create(nil);
  _CdsParamGlobal := TClientDataSet.Create(nil);
  _CdsDocCap := TClientDataSet.Create(nil);
  _CdsDocCar := TClientDataSet.Create(nil);

  //Bruno Bastos - 23/12/2009 - Início
  _CdsDocFilhoCap := TClientDataSet.Create(nil);
  _CdsDocFilhoCar := TClientDataSet.Create(nil);
  _cdsFilhoFinanc      := TClientDataSet.Create(nil);
  //Bruno Bastos - 23/12/2009 - Fim

  _CdsFinanc := TClientDataSet.Create(nil);
  _CdsContabFinanc := TClientDataSet.Create(nil);

  _BaixaDocumentos := TCtrlBaixaDocumentos.Create;
  _Financeiro := TCtrlFinanc.Create(0,0,0,false);
  _Padroes := TCtrlPadroes.Create;

  //Bruno Bastos - Sol 126261 - Início
  _CtrlPortadorforma := TCtrlPortadorforma.Create;
  _CtrlPortadorforma.InitiAlizeAs(ParamIntegra);
  //Bruno Bastos - Sol 126261 - Fim

  //  Rodolpho da Silva - P: 18641 - 25/02/2005
  _DiasUteis  := TDiasUteis.Create;

end;



destructor TCtrlBaixaRecXPag.Destroy;
begin
  _CdsParamCap.Free;
  _CdsParamRec.Free;
  _CdsParamGlobal.Free;
  _CdsDocCap.Free;
  _CdsDocCar.Free;

  //Bruno Bastos - 23/12/2009 - Início
  _CdsDocFilhoCap.Free;
  _CdsDocFilhoCar.Free;
  _cdsFilhoFinanc.Free;
  //Bruno Bastos - 23/12/2009 - Fim

  _CdsFinanc.Free;
  _CdsContabFinanc.Free;

  _BaixaDocumentos.Free;
  _Financeiro.Free;
  _Padroes.Free;

  //Bruno Bastos - Sol 126261 - Início
  _CtrlPortadorforma.Free;
  //Bruno Bastos - Sol 126261 - Fim

  FreeAndNil(_DiasUteis);
  inherited;
end;

function TCtrlBaixaRecXPag.FazRecxPagto(pdData: TDateTime; ovDocsFilhoPag,
                                 ovDocsFilhoRec: OleVariant;dDataDisp_Filho: TDateTime = 0 ): Boolean;
                                  //Helen - SOL: 126261/1121 KTN: 658230 Add dDataDisp_Filho
var
  _bValidParam,
  _bCancelouSaiu: boolean;

  rTotPag,
  rTotRec : double;

begin
  result         := false;
  _bValidParam   := false;
  _bCancelouSaiu := false;

  _cdsDocFilhoCap.data := ovDocsFilhoPag;
  _cdsDocFilhoCar.data := ovDocsFilhoRec;

  while (not _bValidParam) or (not _bCancelouSaiu) do //andre tavares - pendência 22486 - 17/11/2006
  begin
     //início - andre tavares - pendência 22486 - 17/11/2006 - verifica se os portadorForma tem a mesma conta corrente associada
     if (DateToStr(pdData) = '') then
     begin
       MessageInfo  := 'A Data Programada é Obrigatória';
       _bValidParam := false;
     end
     else begin
       _bCancelouSaiu := true;
       _bValidParam   := true;
     end;

     if  (_bCancelouSaiu) and (_bValidParam) and ((190 {colocar o codportforma de pagamento que será criado pela Funcef} = 0) or (191 {colocar o codportforma de recebimento que será criado pela Funcef} = 0)) then
     begin
       MessageInfo  := 'As Contas Caixa X Forma de Pagamento/Recebimento são Obrigatórias';
       _bValidParam := false;
     end
     else begin
       _bCancelouSaiu := true;
       _bValidParam   := true;
     end;

     if (_bCancelouSaiu) and (_bValidParam) and (190 {colocar o codportforma de pagamento que será criado pela Funcef} > 0 ) and (191 {colocar o codportforma de recebimento que será criado pela Funcef} > 0) and
        (not _CtrlPortadorforma.MesmaContaCorrente(190 {colocar o codportforma de pagamento que será criado pela Funcef}, 191 {colocar o codportforma de recebimento que será criado pela Funcef})) then
     begin
       MessageInfo    := 'As Contas Caixa X Forma de Pagamento/Recebimento Devem Ter a Mesma Conta Bancária Associada';
       _bValidParam   := false;
     end
     else begin
       _bCancelouSaiu := true;
       _bValidParam   := true;
     end;
     //fim - andre tavares - pendência 22486 - 17/11/2006


     if _bValidParam then
     begin
       if not _Financeiro.TestaDispFinanc(Sistema.IdEmpresa,Sistema.IdUsuario,
                                          pdData) then
       begin
          // Rodolpho da Silva - P: 19904 - 07/03/2006
          MessageInfo := _Financeiro.MessageInfo;
          Exit;
       end;

       _cdsDocFilhoCap.first;
       rTotPag := 0;
       while not _cdsDocFilhoCap.eof do
       begin
         rTotPag := rTotPag + _cdsDocFilhoCap.FieldByName('SALDO').AsFloat;
         _cdsDocFilhoCap.Next;
       end;

       _cdsDocFilhoCar.first;
       rTotRec := 0;
       while not _cdsDocFilhoCar.eof do
       begin
         rTotRec := rTotRec + _cdsDocFilhoCar.FieldByName('SALDO').AsFloat;
         _cdsDocFilhoCar.Next;
       end;

       _cdsDocFilhoCap.first;
       _cdsDocFilhoCar.first;
       _cdsFilhoFinanc.Data := GetDataPacket(' SELECT '+
                                             ' ''N'' AS SELECIONA, '+
                                             '  CODLANCFINANC, '+
                                             '  STATUSCONCILIA, '+
                                             '  VALORLANCFINAN, '+
                                             '  VALOROUTRAMOEDA, '+
                                             '  NUMCHQBORDERO, '+
                                             '  DATALANCFINAN, '+
                                             '  ENTRADASAIDA, '+
                                             '  HISTORICO '+
                                             'FROM '+
                                             '  MOVIMFINANC '+
                                             'WHERE '+
                                             '  IDPESSOA = 1 AND '+
                                             '  STATUSCONCILIA = ''I'' AND '+
                                             '  1 = 2 ');
       //Helen - Sol: 126261/1121 - Kintana: 760963 - add dDataDisp_Filho
       if dDataDisp_Filho > 0 then
       begin
          if ProcessaBaixaDocumento(_cdsDocFilhoCap.Data, _cdsDocFilhoCar.Data, _cdsFilhoFinanc.Data,
              Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdEspAcesso,
              Sistema.IdModulo, 191 {colocar o codportforma de recebimento que será criado pela Funcef}, 190{colocar o codportforma de pagamento que será criado pela Funcef},
              ParamIntegra.Plano, pdData, Sistema.UsaPlanoPatro,
              ParamIntegra.PartidaDobrada, rTotPag, rTotRec,true,dDataDisp_Filho) then
           begin
              MessageInfo := 'Documentos baixados com sucesso.';
              result      := true;
           end
           else
           begin
             //_bValidParam := false;
             MessageInfo := 'Erro no processamento das Baixas:' + MessageInfo;
           end;
       end
       else
       begin
           if ProcessaBaixaDocumento(_cdsDocFilhoCap.Data, _cdsDocFilhoCar.Data, _cdsFilhoFinanc.Data,
              Sistema.IdEmpresa, Sistema.IdUsuario, Sistema.IdEspAcesso,
              Sistema.IdModulo, 191 {colocar o codportforma de recebimento que será criado pela Funcef}, 190{colocar o codportforma de pagamento que será criado pela Funcef},
              ParamIntegra.Plano, pdData, Sistema.UsaPlanoPatro,
              ParamIntegra.PartidaDobrada, rTotPag, rTotRec) then
           begin
              MessageInfo := 'Documentos baixados com sucesso.';
              result      := true;
           end
           else
           begin
             //_bValidParam := false;
             MessageInfo := 'Erro no processamento das Baixas:' + MessageInfo;
           end;
       end;
     end;
  end;//while
end;

function TCtrlBaixaRecXPag.GetPlanosPrevidDocumento(rcodDoc: extended): Olevariant;
var
  sSQL: string;
begin
  sSQL :=
    'SELECT DISTINCT PC.NOME ' +
    'FROM PLANPREV PP, PLANPREVCONTABIL PC, RATEIODOCUM R ' +
    'WHERE PP.IDPLANOPREV = PC.IDPLANOPREVPREV AND ' +
    '  PC.IDPLANOPREV = R.IDPLANOPREV AND ' +
    '  R.CODDOCUMENTO =  ' + FloatToStr(rcodDoc)  +
    'UNION ' +
    'SELECT DISTINCT PC.NOME ' +
    'FROM PLANPREVCONTABIL PC, RATEIODOCUM R ' +
    'WHERE IDPLANOPREVPREV IS NULL AND ' +
    'PC.IDPLANOPREV = R.IDPLANOPREV AND ' +
    'R.CODDOCUMENTO = ' + FloatToStr(rcodDoc);
  Result := GetDataPacket(sSQL);
end;

function TCtrlBaixaRecXPag.ProcessaBaixaDocumento(ovDocCap, ovDocCar, ovLancFinanc: OleVariant;
  iIdEmpresa, iIdUsuario, iIdEspAcesso, iIdModulo, iCodPortFormaPag, iCodPortFormaRec, iPlano:
  Integer; dDataBaixa: TDateTime; bUsaPlanoPatro, bPartidaDobrada: Boolean;
  rValTotCap, rValTotCar: Double; bComita: Boolean = True; dDataDisp_Filho: TDateTime = 0): Boolean;
  //Helen - SOL: 126261/1121 KTN: 658230 Add dDataDisp_Filho
Var
  sHistoricoLanc, sHistorico: String;
  rPlnCodigo: Double;
  iCodLancFinancCap, iCodLancFinancCar: Integer; (* Gustavo 02/04/2003 - Inicio *)
  iNumBaixaRecXPagto: Integer;

  procedure PrepareCdsBaixa(oCds: TclientDataSet; SistemaaProcessar: TSistemaaProcessar; bBaixaParcial: Boolean = false; rValorBaixaParcial: Double = 0);
  Var
    rSaldoValorParcial: Double;
  begin
   oCds.First;
   while not oCds.Eof do
     if (oCds.FieldByName('SELECIONA').AsString = 'S') then
        oCds.Next
     else
        oCds.Delete;
   oCds.First;

   if SistemaaProcessar <> spCFinan then
   begin
      rSaldoValorParcial := rValorBaixaParcial;

      _Cds.Data := _BaixaDocumentos.GetEmptyCdsBaixa;

      while not oCds.Eof do
      begin
         _Cds.Append;
         _Cds.FieldByName('IDFORCLI').AsInteger := oCds.FieldByName('IDFORCLI').AsInteger;
         _Cds.FieldByName('OPERACAO').AsString := oCds.FieldByName('OPERACAO').AsString;
         _Cds.FieldByName('CODTIPDOC').AsInteger := oCds.FieldByName('CODTIPDOC').AsInteger;
         // Alex 13/12/05
         _Cds.FieldByName('IDMODULO').AsInteger := oCds.FieldByName('IDMODULO').AsInteger;
         _Cds.FieldByName('IDPESSOA').AsInteger := iidEmpresa;
         _Cds.FieldByName('CODDOCUMENTO').AsInteger := oCds.FieldByName('CODDOCUMENTO').AsInteger;
         _Cds.FieldByName('NODOCUMENTO').AsInteger := oCds.FieldByName('NODOCUMENTO').AsInteger;
         _Cds.FieldByName('COMPLDOCUMENTO').AsString := oCds.FieldByName('COMPLDOCUMENTO').AsString;
         _Cds.FieldByName('DATAPROGRAMADA').AsDateTime := oCds.FieldByName('DATAPROGRAMADA').AsDateTime;
         _Cds.FieldByName('DATAVENCTO').AsDateTime := oCds.FieldByName('DATAVENCTO').AsDateTime;
         _Cds.FieldByName('RECPAG').AsString := oCds.FieldByName('RECPAG').AsString;
         _Cds.FieldByName('NOME').AsString := oCds.FieldByName('NOME').AsString;
         _Cds.FieldByName('STATUS').AsString := oCds.FieldByName('STATUS').AsString;
         _Cds.FieldByName('MOECODIGO').AsInteger := oCds.FieldByName('MOECODIGO').AsInteger;
         _Cds.FieldByName('PLANO').AsInteger := oCds.FieldByName('PLANO').AsInteger;
         _Cds.FieldByName('PLACONTA').AsString := oCds.FieldByName('PLACONTA').AsString;
         _Cds.FieldByName('CODSUBCONTA').AsInteger := oCds.FieldByName('CODSUBCONTA').AsInteger;
         _Cds.FieldByName('CODCENTROCUSTO').AsString := oCds.FieldByName('CODCENTROCUSTO').AsString;
         _Cds.FieldByName('CODGRUPOCNAB').AsInteger := oCds.FieldByName('CODGRUPOCNAB').AsInteger;
         _Cds.FieldByName('NOSSONUMERO').AsString := oCds.FieldByName('NOSSONUMERO').AsString;
         _Cds.FieldByName('NUMLANCTO').AsInteger := oCds.FieldByName('NUMLANCTO').AsInteger;
         _Cds.FieldByName('VALOROUTRAMOEDA').AsFloat := 0;
         _Cds.FieldByName('DEBCRE').AsString := oCds.FieldByName('DEBCRE').AsString;

         _Cds.FieldByName('FLGBAIXATOTAL').AsString := oCds.FieldByName('FLGBAIXATOTAL').AsString;  // Edilaine Ferraresi - SOL 221352 / KTN 2053933

         if not bBaixaParcial then
         begin
           _Cds.FieldByName('VLRLIQUIDO').AsFloat := oCds.FieldByName('SALDO').AsFloat;
           _Cds.FieldByName('VALOR').AsFloat := oCds.FieldByName('SALDO').AsFloat;
         end
         else
         begin
           if oCds.FieldByName('SALDO').AsFloat < rSaldoValorParcial then
           begin
              _Cds.FieldByName('VLRLIQUIDO').AsFloat := oCds.FieldByName('SALDO').AsFloat;
              _Cds.FieldByName('VALOR').AsFloat := oCds.FieldByName('SALDO').AsFloat;
              rSaldoValorParcial := rSaldoValorParcial - oCds.FieldByName('SALDO').AsFloat;
           end
           else
           begin
              _Cds.FieldByName('VLRLIQUIDO').AsFloat := rSaldoValorParcial;
              _Cds.FieldByName('VALOR').AsFloat := rSaldoValorParcial;
              _Cds.Post;
              break;
           end;
         end;

         _Cds.Post;

         oCds.Next;
      end;

      oCds.Data := _Cds.Data;
      _Cds.Close;
   end;
  end;

  function VerificaParametros: boolean;
  Var
    bLancFinancCap, bLancFinancRec: Boolean;

  begin
     bLancFinancCap := LANCAFINANCBAIXA;
     bLancFinancRec := LANCAFINANCBAIXA;

     Result := _DiasUteis.DiaUtil(iIdEmpresa,dDataBaixa,True,False,False);


     if result then
     begin
       _CdsParamCap.Data := GetDataPacket('SELECT INTEGRACONTAB, HISTPADFINAN FROM PARAMCAP ' +
                                          ' WHERE IDPESSOA = '+ IntToStr(iIdEmpresa) +
                                          ' AND RECPAG = ''P''');
       result := Not _CdsParamCap.IsEmpty;

       if result then
       begin
          result := Not (bLancFinancCap  And
                         (_CdsParamCap.FieldByName('HISTPADFINAN').Asinteger = 0));

          if result then
          begin
             _CdsParamRec.Data := GetDataPacket('SELECT INTEGRACONTAB,HISTPADFINAN FROM PARAMCAP ' +
                                                ' WHERE IDPESSOA = '+ InttoStr(iIdEmpresa) +
                                                ' AND RECPAG = ''R''');
             result := Not _CdsParamRec.IsEmpty;

             if result then
             begin
                result := Not (bLancFinancRec  And
                               (_CdsParamRec.FieldByName('HISTPADFINAN').Asinteger = 0));

                if result then
                begin
                   if (_CdsParamCap.FieldByName('INTEGRACONTAB').AsString= 'S') or
                      (_CdsParamRec.FieldByName('INTEGRACONTAB').AsString= 'S')Then
                   begin
                      _CdsParamGlobal.Data := GetDataPacket('SELECT UNIDNEGOC, IDPATRO, IDPLANOPREV, USAABC  FROM PARAMGLOBAL WHERE IDPESSOA = ' + IntToStr(iIdEmpresa));

                      result := Not _CdsParamGlobal.IsEmpty;

                      if result then
                      begin
                          result := Not ((_CdsParamGlobal.FieldByName('UNIDNEGOC').Asinteger = 0) And
                                         ( _CdsParamGlobal.FieldByName('USAABC').AsString = 'S'));

                          if not result then
                             MessageInfo := 'Falta a indicação da Atividade\Projeto nos parâmentros do Sistema Global';
                      end
                      else
                        MessageInfo := 'Falta definição de parâmetros do Sistema Global';
                   end;
                end
                else
                   MessageInfo := 'Falta definir histórico do lançamento no Controle Financeiro nos parâmetros do Sistema  Contas a Receber';
             end
             else
                MessageInfo := 'Falta definição de parâmetros do Sistema Contas a receber';
          end
          else
             MessageInfo := 'Falta definir histórico do lançamento no Controle Financeiro nos parâmetros do Sistema Contas a Pagar';
       end
       else
         MessageInfo := 'Falta definição de Parâmetros para do Sistema Contas a Pagar';
     end



     //  Rodolpho da Silva - P: 18641 - 25/02/2005
     else
        MessageInfo := 'A data informada para o pagamento não é um dia útil';

  end;

  procedure RegLancFinanc;
  begin
     _Cds.Data := GetDataPacket('SELECT CCUSTOLANCNAOID, PLANO, CONTALANCNAOIDENT, INTEGRACONTAB, SUBCONTANAOIDENT ' +
                                ' FROM PARAMFINANC WHERE IDPESSOA=' + InttoStr(iIdEmpresa));

     if _Cds.IsEmpty And ( Not _CdsFinanc.IsEmpty ) then
        raise Exception.Create('Não é possívei regularizar os lançamentos no financeiro pois não existem parâmetros do Sistema Financeiro cadastrados para a empresa logada');

     _CdsFinanc.First;
     while not _CdsFinanc.eof do
     begin
       if not _Financeiro.MudaStatusConcilia('X', dDataBaixa, _CdsFinanc.fieldbyname('CODLANCFINANC').asinteger) then
          raise Exception.Create(_Financeiro.MessageInfo);

       _CdsContabFinanc.EmptyDataSet;

       if ( _Cds.fieldbyname('INTEGRACONTAB').AsString = 'S' ) then
          with _CdsContabFinanc do
          begin
             _CdsContabFinanc.Append;

             if _CdsFinanc.fieldbyname('ENTRADASAIDA').Asstring = 'E' then
             begin
               Fieldbyname('LACDEBCRE').Asstring := 'D';
               Fieldbyname('LACTIPO').Asstring := '0' ;
             end
             else
             begin
               Fieldbyname('LACDEBCRE').Asstring := 'C';
               Fieldbyname('LACTIPO').Asstring := '1' ;
             end;

             Fieldbyname('CODCENTROCUSTO').Asstring := _Cds.fieldbyname('CCUSTOLANCNAOID').Asstring;
             Fieldbyname('PLACONTA').Asstring := _Cds.fieldbyname('CONTALANCNAOIDENT').Asstring;
             Fieldbyname('LACVALHIST').AsFloat := _CdsFinanc.fieldbyname('VALOROUTRAMOEDA').AsFloat;
             Fieldbyname('CODSUBCONTA').Asstring := _Cds.fieldbyname('SUBCONTANAOIDENT').Asstring;
             Fieldbyname('LACNUMDOC').Asstring := _CdsFinanc.fieldbyname('CODLANCFINANC').Asstring;
             sHistorico := _CdsFinanc.fieldbyname('HISTORICO').asstring + ' ' + sHistoricoLanc;

             if Trim(sHistorico) = '' then sHistorico:='Depósito Identificado ';

             Fieldbyname('LACHIST1').AsString := sHistorico;
             Fieldbyname('LACVALOR').AsFloat := _CdsFinanc.fieldbyname('VALORLANCFINAN').asfloat;
             Fieldbyname('IDPLANOPREV').AsInteger := _CdsParamGlobal.FieldByName('IDPLANOPREV').AsInteger;
             Fieldbyname('IDPATRO').AsInteger := _CdsParamGlobal.FieldByName('IDPATRO').AsInteger;
             post;

             First;

             if not _Financeiro.IncluiContabilidade( _CdsContabFinanc.Data, dDataBaixa, iIdModulo, iIdEmpresa, iIdUsuario, rPlnCodigo, _CdsParamGlobal.FieldByName('IDPLANOPREV').AsInteger, True) then
                raise Exception.Create(_Financeiro.MessageInfo);
          end;

        _CdsFinanc.next;
     end;
  end;
begin
  if ConnectionSide = cnsClient then
  begin
     Result := Connection.AppServer.ProcessaBaixaDocumento;

     if not Result then
       MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     Result := VerificaParametros;

     if result then
        Try
           _Financeiro.IDPessoa        := iIdEmpresa;
           _Financeiro.IDModulo        := iIdModulo;
           _Financeiro.IDUsuario       := iIdUsuario;
           _Financeiro.UsaPlanoPatro   := bUsaPlanoPatro;

           _CdsDocCap.IndexFieldNames  := '';
           _CdsDocCar.IndexFieldNames  := '';

           _CdsDocCap.Data             := ovDocCap;
           _CdsDocCar.Data             := ovDocCar;
           _CdsFinanc.Data             := ovLancFinanc;

           {**
             Ordena os ClientDataSets por data programada de forma que as baixas
             efetuadas com saldo a receber ou a pagar sejam feitas dos documentos
             com vencimento "menor" primeiro.
           **}
           _CdsDocCap.IndexFieldNames := 'DATAPROGRAMADA';
           _CdsDocCar.IndexFieldNames := 'DATAPROGRAMADA';

           {**
             Exclui dos ClientDataSets os registros que não serão processados
             pois os mesmos vem para o processamento com todos os registros da
             tela.
             No caso do contas a pagar e receber o ClientDataSet é reprocessado
             para ficar no formato da CtrlBaixaDocumnentos.
             Verifica também para os valores a serem baixados quais serão baixados
             com valor parcial de acordo com os valores passados como parâmetros
             Se o valor a pagar é maior que o valor a receber a baixa parcial tem de
             ser efetuada no contas a pagar, caso contrário o valor parcial tem
             de ser efetuado no contas a receber.
           **}

           //Bruno Bastos - 23/12/2009 - Início
           //if not inTransaction then
           //  StartTransaction;
           //Bruno Bastos - 23/12/2009 - Fim

           PrepareCdsBaixa(_CdsDocCap, spCap, (rValTotCap > rValTotCar), rValTotCar);
           PrepareCdsBaixa(_CdsDocCar, spCar, (rValTotCar > rValTotCap), rValTotCap);
           PrepareCdsBaixa(_CdsFinanc, spCFinan, false);

           //BRUNO AZEVEDO SOL 107221/5802 KINTANA 1365701
           if (bComita) and (not InTransaction) then begin //Helen - SOL 126261/1121 Kintana : 760963 Add Intrasaction
             StartTransaction;
           end else begin //Helen - SOL 126261/1121 Kintana : 760963 Add bComita := false;
              bComita := false;
           end;
           //BRUNO AZEVEDO SOL 107221/5802 KINTANA 1365701



           {**
             Abre o ClientDataSet para contabilização do lançamento do financeiro
           **}
           _CdsContabFinanc.Data := GetDataPacket('SELECT * ' +
                                                  ' FROM LANCAMENTO WHERE 1=2 ');

           iNumBaixaRecXPagto := GetSequence('SEQBAIXA');

           rPlnCodigo := 0;

           (* Gustavo 02/04/2003 - Inicio *)

           iCodLancFinancCar := -1;
           iCodLancFinancCap := -1;
           //Helen - Sol: 126261/1121 - Kintana: 760963 - Add dDataDisp_Filho
           if dDataDisp_Filho > 0 then
           begin
               if not _BaixaDocumentos.ProcessaBaixaManual(false, iCodPortFormaPag, GetSequence('NUMCHQBORD'),
                  _CdsDocCap.Data, 0,{Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014} dDataBaixa, slCap, false, iIdUsuario, iIdEmpresa, iIdEspAcesso, iPlano, bUsaPlanoPatro,
                  LANCACONTAB And (_CdsParamCap.FieldByName('INTEGRACONTAB').AsString= 'S'), bPartidaDobrada, false, iNumBaixaRecXPagto,

                  Trunc(rPlnCodigo), iCodLancFinancCap, LANCAFINANCBAIXA, 0, 0, dDataDisp_Filho) then

                  Raise Exception.Create(_BaixaDocumentos.MessageInfo);

               rPlnCodigo := _BaixaDocumentos.PlnCodigoBaixa;
               iCodLancFinancCap := Trunc(_BaixaDocumentos.CodLancFinancBaixa);

               if not _BaixaDocumentos.ProcessaBaixaManual(false, iCodPortFormaRec, GetSequence('NUMCHQBORD'),
                  _CdsDocCar.Data, 0, {Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014} dDataBaixa, slCar, false, iIdUsuario, iIdEmpresa, iIdEspAcesso, iPlano, bUsaPlanoPatro,
                  LANCACONTAB And (_CdsParamRec.FieldByName('INTEGRACONTAB').AsString= 'S'), bPartidaDobrada, false, iNumBaixaRecXPagto,

                  Trunc(rPlnCodigo), iCodLancFinancCar, LANCAFINANCBAIXA, 0, 0, dDataDisp_Filho) then

                  Raise Exception.Create(_BaixaDocumentos.MessageInfo);

               iCodLancFinancCar := Trunc(_BaixaDocumentos.CodLancFinancBaixa);
           end
           else
           begin
               if not _BaixaDocumentos.ProcessaBaixaManual(false, iCodPortFormaPag, GetSequence('NUMCHQBORD'),
                  _CdsDocCap.Data, 0, {Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014} dDataBaixa, slCap, false, iIdUsuario, iIdEmpresa, iIdEspAcesso, iPlano, bUsaPlanoPatro,
                  LANCACONTAB And (_CdsParamCap.FieldByName('INTEGRACONTAB').AsString= 'S'), bPartidaDobrada, false, iNumBaixaRecXPagto,

                  Trunc(rPlnCodigo), iCodLancFinancCap, LANCAFINANCBAIXA, 0, 0, dDataBaixa) then

                  Raise Exception.Create(_BaixaDocumentos.MessageInfo);

               rPlnCodigo := _BaixaDocumentos.PlnCodigoBaixa;
               iCodLancFinancCap := Trunc(_BaixaDocumentos.CodLancFinancBaixa);

               if not _BaixaDocumentos.ProcessaBaixaManual(false, iCodPortFormaRec, GetSequence('NUMCHQBORD'),
                  _CdsDocCar.Data, 0, {Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014} dDataBaixa, slCar, false, iIdUsuario, iIdEmpresa, iIdEspAcesso, iPlano, bUsaPlanoPatro,
                  LANCACONTAB And (_CdsParamRec.FieldByName('INTEGRACONTAB').AsString= 'S'), bPartidaDobrada, false, iNumBaixaRecXPagto,

                  Trunc(rPlnCodigo), iCodLancFinancCar, LANCAFINANCBAIXA, 0, 0, dDataBaixa) then

                  Raise Exception.Create(_BaixaDocumentos.MessageInfo);

               iCodLancFinancCar := Trunc(_BaixaDocumentos.CodLancFinancBaixa);
           end;
           (*
             Se o lançamento for efetuado a partido do contas a pagar o rateio financ
             do contas a receber é atualizado para o movim financ do contas a pagar
             e o movimfinanc do contas a receber é atualizado e vice versa
           *)

           if iIdModulo = 3 then
           begin
              if not ExecSQL('UPDATE RATEIOFINANC SET CODLANCFINANC = ' + IntToStr(iCodLancFinancCap) + ' WHERE CODLANCFINANC = ' + IntToStr(iCodLancFinancCar)) then
                 raise Exception.Create(MessageInfo);

              if not ExecSQL('UPDATE RECBTOPAGTO SET CODLANCFINANC = ' + IntToStr(iCodLancFinancCap) + ' WHERE CODLANCFINANC = ' + IntToStr(iCodLancFinancCar)) then
                 raise Exception.Create(MessageInfo);

              if not ExecSQL('DELETE FROM MOVIMFINANC WHERE CODLANCFINANC = ' + IntToStr(iCodLancFinancCar)) then
                 raise Exception.Create(MessageInfo);

              if not ExecSQL('UPDATE MOVIMFINANC SET VALORLANCFINAN = 0, VALOROUTRAMOEDA = 0 WHERE CODLANCFINANC = ' + IntToStr(iCodLancFinancCap)) then
                 raise Exception.Create(MessageInfo);
           end
           else
           begin
              if not ExecSQL('UPDATE RATEIOFINANC SET CODLANCFINANC = ' + IntToStr(iCodLancFinancCar) + ' WHERE CODLANCFINANC = ' + IntToStr(iCodLancFinancCap)) then
                 raise Exception.Create(MessageInfo);

              if not ExecSQL('UPDATE RECBTOPAGTO SET CODLANCFINANC = ' + IntToStr(iCodLancFinancCar) + ' WHERE CODLANCFINANC = ' + IntToStr(iCodLancFinancCap)) then
                 raise Exception.Create(MessageInfo);

              if not ExecSQL('DELETE FROM MOVIMFINANC WHERE CODLANCFINANC = ' + IntToStr(iCodLancFinancCap)) then
                 raise Exception.Create(MessageInfo);

              if not ExecSQL('UPDATE MOVIMFINANC SET VALORLANCFINAN = 0, VALOROUTRAMOEDA = 0 WHERE CODLANCFINANC = ' + IntToStr(iCodLancFinancCar)) then
                 raise Exception.Create(MessageInfo);
           end;


           (* Gustavo 02/04/2003 - Fim *)

           if not _CdsFinanc.IsEmpty Then RegLancFinanc;

           If Not _Padroes.GravaLogOperacoes(iIdEmpresa, iIdModulo, iIdUsuario, 'Pagamentos x Recebimentos', false) Then
              Raise Exception.Create(_Padroes.MessageInfo);

           //BRUNO AZEVEDO SOL 107221/5802 KINTANA 1365701
           if (bComita) then begin
             Commit;
           end;
           //BRUNO AZEVEDO SOL 107221/5802 KINTANA 1365701
        except
           On E:Exception Do
            Begin
               //BRUNO AZEVEDO SOL 107221/5802 KINTANA 1365701
               if (bComita) then begin
                 Rollback;
               end;
               //BRUNO AZEVEDO SOL 107221/5802 KINTANA 1365701
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
  end;
end;

end.

