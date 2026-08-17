// Alterações
{ --------------------------------------------------------------------------------------------------
Data      : 07.03.2018
Autor     : Everson Luiz Pereira da Cunha
Pendência : SIG TIBERO
Descrição : Melhoria TIBERO.
            Inserir Alias nas tabelas e campos.
            Retirar INDEX, +rule etc
----------------------------------------------------------------------------------------------------
Rotina    : GetPlanosPrevidDocumento
Data      : 27.02.2007
Autor     : Antonio Marcos Fernandes de Souza (amf)
Pendência : 24527
Descrição : Retorna os planos previdênciários para o documento.
----------------------------------------------------------------------------------------------------
Rotina    : ProcessaBaixaDocumento
Data      : 25/02/2005
Autor     : Rodolpho da Silva
Pendência : 18641
Descrição : Comentar a crítica da mensagem: MessageInfo := 'Data de Pagamento não pode ser maior do que a de hoje';
----------------------------------------------------------------------------------------------------
Rotina    : ProcessaBaixaDocumento
Data      : 30/05/2003
Autor     : André Pontes
Descrição : Corrigido: FieldByName('PLACONTA').AsInteger para FieldByName('PLACONTA').AsString
-----------------------------------------------------------------------------------------------------
Rotina    : ProcessaBaixaDocumento(
Data      : 30/05/2003
Autor     : Fábio Fagundes
Descrição : Passada, na ProcessaBaixaManual, a data de disponibilidade
----------------------------------------------------------------------------------------------------}

unit uCtrlBaixaRecXPag;

interface

Uses SysUtils, Controls, Classes, DbClient, uCmControlObject,
     uCtrlBaixaDocumentos, uCtrlFinanc, uCtrlPadroes, uDiasUteis, uCtrlDocumento;

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
    _CdsFinanc,
    _CdsContabFinanc: TClientDataSet;

    _Financeiro: TCtrlFinanc;
    _BaixaDocumentos: TCtrlBaixaDocumentos;
    _Padroes: TCtrlPadroes;

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
             rValTotCap, rValTotCar: Double): Boolean;

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
  _CdsFinanc := TClientDataSet.Create(nil);
  _CdsContabFinanc := TClientDataSet.Create(nil);

  _BaixaDocumentos := TCtrlBaixaDocumentos.Create;
  _Financeiro := TCtrlFinanc.Create(0,0,0,false);
  _Padroes := TCtrlPadroes.Create;


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
  _CdsFinanc.Free;
  _CdsContabFinanc.Free;

  _BaixaDocumentos.Free;
  _Financeiro.Free;
  _Padroes.Free;


  FreeAndNil(_DiasUteis);


  inherited;
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
//    'WHERE IDPLANOPREVPREV IS NULL AND ' +  //Everson TIBERO
    'WHERE PC.IDPLANOPREVPREV IS NULL AND ' + //Everson TIBERO
    'PC.IDPLANOPREV = R.IDPLANOPREV AND ' +
    'R.CODDOCUMENTO = ' + FloatToStr(rcodDoc);
  Result := GetDataPacket(sSQL);
end;

function TCtrlBaixaRecXPag.ProcessaBaixaDocumento(ovDocCap, ovDocCar, ovLancFinanc: OleVariant;
  iIdEmpresa, iIdUsuario, iIdEspAcesso, iIdModulo, iCodPortFormaPag, iCodPortFormaRec, iPlano:
  Integer; dDataBaixa: TDateTime; bUsaPlanoPatro, bPartidaDobrada: Boolean;
  rValTotCap, rValTotCar: Double): Boolean;
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

           PrepareCdsBaixa(_CdsDocCap, spCap, (rValTotCap > rValTotCar), rValTotCar);
           PrepareCdsBaixa(_CdsDocCar, spCar, (rValTotCar > rValTotCap), rValTotCap);
           PrepareCdsBaixa(_CdsFinanc, spCFinan, false);

           StartTransaction;

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

           if not _BaixaDocumentos.ProcessaBaixaManual(false, iCodPortFormaPag, GetSequence('NUMCHQBORD'),
              _CdsDocCap.Data, dDataBaixa, slCap, false, iIdUsuario, iIdEmpresa, iIdEspAcesso, iPlano, bUsaPlanoPatro,
              LANCACONTAB And (_CdsParamCap.FieldByName('INTEGRACONTAB').AsString= 'S'), bPartidaDobrada, false, iNumBaixaRecXPagto,

              Trunc(rPlnCodigo), iCodLancFinancCap, LANCAFINANCBAIXA, 0, 0, dDataBaixa) then

              Raise Exception.Create(_BaixaDocumentos.MessageInfo);

           rPlnCodigo := _BaixaDocumentos.PlnCodigoBaixa;
           iCodLancFinancCap := Trunc(_BaixaDocumentos.CodLancFinancBaixa);

           if not _BaixaDocumentos.ProcessaBaixaManual(false, iCodPortFormaRec, GetSequence('NUMCHQBORD'), 
              _CdsDocCar.Data, dDataBaixa, slCar, false, iIdUsuario, iIdEmpresa, iIdEspAcesso, iPlano, bUsaPlanoPatro,
              LANCACONTAB And (_CdsParamRec.FieldByName('INTEGRACONTAB').AsString= 'S'), bPartidaDobrada, false, iNumBaixaRecXPagto,

              Trunc(rPlnCodigo), iCodLancFinancCar, LANCAFINANCBAIXA, 0, 0, dDataBaixa) then

              Raise Exception.Create(_BaixaDocumentos.MessageInfo);

           iCodLancFinancCar := Trunc(_BaixaDocumentos.CodLancFinancBaixa);

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

           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
  end;
end;

end.

