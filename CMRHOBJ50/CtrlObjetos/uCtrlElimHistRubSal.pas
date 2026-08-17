{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÃO -------------------------------------
--------------------------------------------------------------------------------

Nº Solicitação...: WO 4875
Data da Alteração: 24/10/2023
Responsável......: Everson Cunha
Descrição........: Inclusão do ETL no processamento da Folha Estágio
--------------------------------------------------------------------------------
Autor(a)..: Everson Cunha
Data......: 04/06/2020
Nº SIG....: 99768
Descricao.: Colocar opção para desfazer o FLGOCORRIDA quando as férias foram
            geradas apenas na Folha Mensal - FLGADIANTAPAGTOFERIAS
--------------------------------------------------------------------------------
Analista.: William Moreira da Silva
SOL......: 238909/18349
Data.....: 16/02/2017
Descrição: As rubricas de empréstimos enviadas para a folha de pagamento quando
           quando caem em excesso de débito devem refletir na TMPDESC
           no campo SITENVIO como "1".
-------------------------------------------------------------------------------
Analista.: Thiago Melo
SOL......: 236708
PPM......: 501068
Data.....: 05/09/2014
Rotina...: EliminarRubricas
Descrição: O Modfol está desmarcando o flag de Férias Processadas (férias
           lançadas e calculadas).
--------------------------------------------------------------------------------
Analista.: Edilaine Ferraresi
SOL......: 175343
Kintana..: 1786974
Data.....: 03/09/2012
Rotina...: EliminarRubricas
Descrição: alterar flgocorrida para 0 quando da exclusão de folha de ferias
-------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/07/2002                                 }
{                                                       }
{*******************************************************}


unit uCtrlElimHistRubSal;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet, uCtrlCustomRH, Classes;

type
  TCtrlElimHistRubSal = class(TCtrlCustomRH)
  public
    function ContarRubricas(ListaIdRubrica, ListaIdFunc: string; Mes, Ano: integer;
      IdMotivo: double): integer;
    function EliminarRubricas(DesfazerLancamentos: boolean; ListaIdRubrica,
      //ListaIdFunc: string; Mes, Ano: integer; IdMotivo: double; TipoEmpresa: string): boolean; //Everson Cunha - SIG99768
      ListaIdFunc: string; Mes, Ano, IdMotivo: integer; TipoEmpresa: string): boolean;           //Everson Cunha - SIG99768
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlElimHistRubSal }

function TCtrlElimHistRubSal.ContarRubricas(ListaIdRubrica, ListaIdFunc: string;
  Mes, Ano: integer; IdMotivo: double): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  COUNT(*) AS TOTREG'+CR_LF+
      'FROM'+CR_LF+
      '  HISTRUBSAL'+CR_LF+
      'WHERE'+CR_LF+
      IFF(ListaIdRubrica='', '', MontaLinhaSelSQL('(CODPROVDESC',ListaIdRubrica,2)+CR_LF)+
      QuebrarListaFiltro(2,'(IDPESSOA',ListaIdFunc,100)+ ' AND'+CR_LF+
      '  (MES       = ' +QuotedStr(IntToStr(Ano) +'/'+ PoeZero(Mes))+ ') AND'+CR_LF+
      '  (IDMOTIVO  = ' +FloatToStr(IdMotivo)+ ') AND'+CR_LF+
      '  (IDMODULO  = 21)');

    Result := _CdsAux.FieldByName('TOTREG').asInteger;
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlElimHistRubSal.EliminarRubricas(DesfazerLancamentos: boolean; ListaIdRubrica,
  ListaIdFunc: string; Mes, Ano, IdMotivo: integer; TipoEmpresa: string): boolean;           //Everson Cunha - SIG 99768
  //ListaIdFunc: string; Mes, Ano: integer; IdMotivo: double; TipoEmpresa: string): boolean; //Everson Cunha - SIG 99768  
var
  // Thiago Melo SOL 236708 PPM 501068
  _CdsAux: TCMClientDataSet;
  _TotRubricas : Integer;
  // Thiago Melo SOL 236708 PPM 501068
  sSql : TStringList; //Everson Cunha - SIG99768
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.EliminarRubricas(DesfazerLancamentos, ListaIdRubrica,
      ListaIdFunc, Mes, Ano, IdMotivo, TipoEmpresa);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ExecSQL(
        'DELETE HISTRUBSAL'+CR_LF+
        'WHERE'+CR_LF+
        IFF(ListaIdRubrica='', '', MontaLinhaSelSQL('(CODPROVDESC',ListaIdRubrica,2)+CR_LF)+
        QuebrarListaFiltro(2,'(IDPESSOA',ListaIdFunc,100)+ ' AND'+CR_LF+
        '  (MES       = ' +QuotedStr(IntToStr(Ano) +'/'+ PoeZero(Mes))+ ') AND'+CR_LF+
        '  (IDMOTIVO  = ' +FloatToStr(IdMotivo)+ ') AND'+CR_LF+
        '  (IDMODULO  = 21)');
      if not(Result) then
        raise Exception.Create(MessageInfo);

      //William Moreira da Silva - SOL 238909/18349
      if(ListaIdRubrica <> '') then
      begin
        Result := ExecSQL( 'update tmpdesc tm '+CR_LF+
                           '  set tm.sitenvio = 0, '+CR_LF+
                           ' tm.DATARECEBIMENTO = NULL, '+
                           ' tm.VALORRECEBIDO   = NULL, '+
                           ' tm.IDSEQINTERNOFB  = NULL  '+
                           ' where '+CR_LF+
                           QuebrarListaFiltro(2,'(tm.idpessoa',ListaIdFunc,100) +CR_LF+
                           '  and tm.mescobranca = ' +QuotedStr(IntToStr(Ano) +'/'+ PoeZero(Mes)) +CR_LF+

                           '   and (tm.idprovento in (select pr.idprovento '+CR_LF+
                           '             from provdesc pr                  '+CR_LF+
                           '             where pr.idproventoexcessodeb in (select r.idrubrica '+CR_LF+
                           '                                    from rubricaxpess r           '+CR_LF+
                           '                                   where '+CR_LF+
                           MontaLinhaSelSQL(' r.codprovdesc ',ListaIdRubrica,2, False) +
                           ') ' +CR_LF+
                           '     or tm.idprovento in (select r.idrubrica  '+CR_LF+
                           '             from rubricaxpess r              '+CR_LF+
                           '             where '+CR_LF+
                           MontaLinhaSelSQL(' r.codprovdesc ',ListaIdRubrica,2, False) +
                           ') ' );


        {Result := ExecSQL('UPDATE TMPDESC T '+CR_LF+
                        '   SET T.SITENVIO = 0 '+CR_LF+
                        '  WHERE '+CR_LF+
                        QuebrarListaFiltro(2,'(IDPESSOA',ListaIdFunc,100) +CR_LF+
                        '   AND T.MESREFERENCIA = ' +QuotedStr(IntToStr(Ano) +'/'+ PoeZero(Mes)) +CR_LF+
                        '   AND T.CODPROVDESC IN  '+CR_LF+

                        ' (SELECT PP.IDPROVENTO '+CR_LF+
                        ' FROM PROVDESC PP '+CR_LF+
                        ' WHERE PP.IDPROVENTOEXCESSODEB IN '+CR_LF+
                        ' (SELECT P.IDPROVENTO '+CR_LF+
                        ' FROM PROVDESC P, RUBRICAXPESS R '+CR_LF+
                        ' WHERE P.IDPROVENTO = R.IDRUBRICA '+CR_LF+

                        MontaLinhaSelSQL(' AND R.CODPROVDESC ',ListaIdRubrica,2, False) +
                        ') '
                        );}

        if not (Result) then
                raise Exception.Create(MessageInfo);
      end;
      //William Moreira da Silva - SOL 238909/18349

      // Thiago Melo SOL 236708 PPM 501068
      _TotRubricas := 0;
      _CdsAux := TCMClientDataSet.Create(nil);
      try
        _CdsAux.Data := GetDataPacket(
          'SELECT'+CR_LF+
          '  COUNT(*) AS TOTREG'+CR_LF+
          'FROM'+CR_LF+
          '  HISTRUBSAL'+CR_LF+
          'WHERE'+CR_LF+
          QuebrarListaFiltro(2,'(IDPESSOA',ListaIdFunc,100)+ ' AND'+CR_LF+
          '  (MES       = ' +QuotedStr(IntToStr(Ano) +'/'+ PoeZero(Mes))+ ') AND'+CR_LF+
          '  (IDMOTIVO  = ' +FloatToStr(IdMotivo)+ ') AND'+CR_LF+
          '  (IDMODULO  = 21)');

        _TotRubricas := _CdsAux.FieldByName('TOTREG').asInteger;
      finally
        _CdsAux.Free;
      end;
      // Thiago Melo SOL 236708 PPM 501068

      //Everson Cunha - SIG 99768 - Início
      {
      // Edilaine - SOL 175343 / KTN 1786974
      //se o motivo da folha for FOLHA DA ADIANTAMENTO DE FERIAS mudar a flgocorrida para 0
      // Thiago Melo SOL 236708 PPM 501068
      //if IdMotivo = 2 then
      if (IdMotivo = 2) and (_TotRubricas = 0) then
      // Thiago Melo SOL 236708 PPM 501068
      begin
        Result := ExecSQL(
          'UPDATE FERIAS SET FLGOCORRIDA = 0 '+CR_LF+
          'WHERE '+CR_LF+
          QuebrarListaFiltro(2,'(IDPESSOA',ListaIdFunc,100)+ ' '+CR_LF+
          '  AND ( extract(month from inigozoferias) = '+PoeZero(Mes)+' ) '+CR_LF+
          '  AND ( extract( year from inigozoferias) = '+IntToStr(Ano)+' ) '+CR_LF+
          '  AND (FLGOCORRIDA = 1) ' );
        if not(Result) then
          raise Exception.Create(MessageInfo);
      end;
      // Edilaine - SOL 175343 / KTN 1786974 - fim
      }

      //if (IdMotivo in [1, 2]) and (_TotRubricas = 0) then   //WO 4875 - Everson Cunha
      if (IdMotivo in [1, 2, 53]) and (_TotRubricas = 0) then //WO 4875 - Everson Cunha
      begin
        try
          sSql := TStringList.Create;

          sSql.Add('UPDATE FERIAS SET FLGOCORRIDA = 0 ');
          sSql.Add('WHERE ');
          sSql.Add(QuebrarListaFiltro(2,'(IDPESSOA',ListaIdFunc,100) );
          sSql.Add('  AND ( extract(month from inigozoferias) = '+ PoeZero(Mes) + ' )' );
          sSql.Add('  AND ( extract( year from inigozoferias) = '+ IntToStr(Ano) + ' )' );
          sSql.Add('  AND (FLGOCORRIDA = 1) ' );

            if IdMotivo = 1 then
              sSql.Add('  AND FLGADIANTAPAGTOFERIAS = ''0'' ' )
            else
              sSql.Add('  AND FLGADIANTAPAGTOFERIAS = ''1'' ' );

          Result := ExecSQL(sSql.text);

          if not(Result) then
            raise Exception.Create(MessageInfo);

        finally
          FreeAndNil(sSql);
        end;
      end;
      //Everson Cunha - SIG 99768 - Fim

      if (ListaIdRubrica = '') then
      begin
        // Decrementar o Número de Ocorrências
        Result := ExecSQL(
          'UPDATE RUBRICAINDIV'+CR_LF+
          'SET NUMOCORRENCIAS = NUMOCORRENCIAS - 1,'+CR_LF+
          '    IDLOTE         = NULL,'+CR_LF+
          '    ANOMESREF      = NULL'+CR_LF+
          'WHERE'+CR_LF+
          QuebrarListaFiltro(2,'(IDPESSOA ',ListaIdFunc,100)+ ' AND'+CR_LF+
          '  (IDLOTE    = ' +FloatToStr(IdMotivo)+ ') AND'+CR_LF+
          '  (ANOMESREF = ' +QuotedStr(IntToStr(Ano) +'/'+ PoeZero(Mes))+ ')');
        if not(Result) then
          raise Exception.Create(MessageInfo);

        // Voltar os Lançamentos vindos dos sistemas previdênciários
        if (TipoEmpresa = 'P') then
        begin
          Result := ExecSQL(
            'UPDATE TMPDESC'+CR_LF+
            'SET SITENVIO        = ''0'','+CR_LF+
            '    DATARECEBIMENTO = NULL,'+CR_LF+
            '    VALORRECEBIDO   = NULL,'+CR_LF+
            '    IDSEQINTERNOFB  = NULL'+CR_LF+
            'WHERE'+CR_LF+
            QuebrarListaFiltro(2,'(IDPESSOA      ',ListaIdFunc,100)+ ' AND'+CR_LF+

            //William Moreira da Silva - SIG 238909/18349 - Inicio
            '  ((IDSEQINTERNOFB = ' +FloatToStr(IdMotivo)+ ') OR (IDSEQINTERNOFB IS NULL AND SITENVIO = 1)) AND'+CR_LF+
            //'  (IDSEQINTERNOFB = ' +FloatToStr(IdMotivo)+ ' ) AND'+CR_LF+
            //William Moreira da Silva - SIG 238909/18349 - Fim

            '  (MESCOBRANCA    = ' +QuotedStr(IntToStr(Ano) +'/'+ PoeZero(Mes))+ ')');
          if not(Result) then
            raise Exception.Create(MessageInfo);
        end;
      end;  

      Commit;
      MessageInfo := 'Processo executado com sucesso.';
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
