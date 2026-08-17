{
--------------------------------------------------------------------------------------------
N. Chamado....: SIG130578
Dt Alteração..: 07/05/2024
Responsável...: Arnaldo Vicente Scarin
Descrição.....: Foi criado no Objeto CtrlDocumento uma nova propriedade
                que contem os planos previdenciarios que serão escolhidos
                na tela de Lançamento de Alteradores, para que possam
                ser utilizados no Rateio dos dados.
                Essa propriedade conterá somente os planos escolhidos para
                o Rateio dos Alteradores, e esses lançamentos serão
                armazenados na tabela RateioDocum com o Campo Valor Zerado
                Tambem será criada uma nova tabela, para que haja o
                relacionamento entre a Linha do Alterador que está na
                tabela LanctoDocum e as linhas que estão na Tabela RateioDocum
                para que haja rastreabilidade e em caso de exclusão do
                alterador, possam ser excluidos os rateios
--------------------------------------------------------------------------------------------------
Alteracao   : ProcessaLancAlteradores
Pendência   : 136150
Responsável : leandro
Data        : 27/07/2023
Descrição   : alterar a conta contábil no momento de gerar/baixar os boletos emitidos
--------------------------------------------------------------------------------------
Rotina......: ProcessaLancAlteradores
Nº SIG......: 115585
Data........: 18/05/2021 
Responsável.: Cássio Florencio Rovaroto
Descrição...: Inclusão do tratamento de tipo de serviço e valor base para alteradores de tributo.
----------------------------------------------------------------------------------------------------
Rotina......: ValidaBloqueio
Nº SIG......: 100840
Data........: 31/07/2020
Responsável.: Edilaine
Descrição...: verificar período de bloqueio no módulo de origem do documento
----------------------------------------------------------------------------------------------------
Nº SIG......: 86376
Data........: 28/05/2019
Responsável.: Taffarel Sevaybriker
Descrição...: Alteração para considerar a data de lançamento ao inserir novo alterador.
----------------------------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
----------------------------------------------------------------------------------------------------
}
{---------------------------------------------------------------------------------------------------
Rotina      : RetornaSaldoDocumento
SOl_Kintana : 158675_1290124
Data        : 20/05/2011
Autor       : Ricardo de Freitas Araújo
Descrição   : Retorna Saldo de um Documento levando em conta os alteradores.

Rotina      : ProcessaLancAlteradores
Descrição   : Verifica o saldo do documento, caso estiver zerado deverá alterar o status
              do documento para baixado e já conciliado (FLGNAOCONCILIADO = null) para este documento
              não entrar mais na rotina de ajusta provisão do administração imobiliário assim
              não gerando lancamentos (LANCTODOCUM) desnecessários.
{---------------------------------------------------------------------------------------------------
Rotina    : VerificaStatusDoc
Data      : 12/11/2007
Autor     : André Tavares
pendência : 22825
Descrição : permitir a exclusão de alteradores que zeram o saldo doc documento
{---------------------------------------------------------------------------------------------------
{---------------------------------------------------------------------------------------------------
Rotina    : ProcessaLancAlteradores
Data      : 16/08/2007
Autor     : André Tavares
Descrição : dá erro de constraint ao tentar excluir um alterador de imposto acumulado.
{---------------------------------------------------------------------------------------------------
{---------------------------------------------------------------------------------------------------
Rotina    : ProcessaLancAlteradores
Data      : 08/03/2006
Autor     : André Tavares
Descrição : resolução da pendência 21647 - não permitir que se lance um alterador para documentos enviados para cobrança ou baixados.
{---------------------------------------------------------------------------------------------------
{---------------------------------------------------------------------------------------------------
Rotina    : VerificaStatusDoc
Data      : 14/02/2006
Autor     : Cátia Azevedo
Descrição : resolução da pendência 21558
{---------------------------------------------------------------------------------------------------
Rotina    : bbtnConfirmarclick
Data      : 01/07/2003
Autor     : André Tavares
Descrição : resolução da pendência 13471
----------------------------------------------------------------------------------------------------}
unit uCtrlLancAlteradores;

interface

Uses SysUtils, Classes, DbClient, uCmControlObject, Db, uCMTypes,
     uCtrlDocumento, uCtrlPadroes, uCtrlFinanc, Dialogs;

Type
  TCtrlLancAlteradores = Class(TCmControlObject)

  private
    _CtrlDocumento: TCtrlDocumento;
    _Padroes : TCtrlPadroes;

    FCdsLancAlteradores: TClientDataSet;
    // SIG - 130578 - Contas a Pagar - Lançamentos de Alteradores
    // Alterado por Arnaldo V. Scarin em 08/05/2024
    FListaPlanosPrevidenciarios: TStringList;
    procedure SetCdsLancAlteradores(const Value: TClientDataSet);

    //Cátia Azevedo - 21558 - 14/02/06
    Function VerificaStatusDoc(CodDocumento : extended):Boolean;
  protected
    procedure DoChangeDataBase; Override;
    procedure OnCreateAppServer; Override;
    procedure AfterInitialize; Override;
  public
    Constructor Create; Override;
    Destructor Destroy; Override;
    function ProcessaLancAlteradores(Operacao: TOperacao;
             iIdUsuario, iIdPessoa, iIdModulo, liPlanoConta: Integer;
             bUsaPlanoPatro, bContabiliza, bPartidaDobrada: Boolean;
             //inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
             bIntegraOrcamento : Boolean = False;
             cdsRateio : TClientDataSet = nil
             //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

             ): Boolean;

    function ValidaTesteDispFinanc(iCodDocumento: integer): boolean;

    function ValidaBloqueio(idEmpresa,idModulo: Double; sData: String): Boolean;    //edilaine SIG100840

    Property CdsLancAlteradores: TClientDataSet read FCdsLancAlteradores write SetCdsLancAlteradores;
    // SIG - 130578 - Contas a Pagar - Lançamentos de Alteradores
    // Alterado por Arnaldo V. Scarin em 08/05/2024
    property ListaPlanosPrevidenciarios : TStringList read FListaPlanosPrevidenciarios;

    //Ricardo Freitas - SOL: 158675 - KINTANA: 1290124
    //Retorna Saldo de um Documento levando em conta os alteradores
    function RetornaSaldoDocumento(CodDocumento:string; var DebCre:string):Real;


  end;


implementation

{ TCtrlLancAlteradores }

procedure TCtrlLancAlteradores.AfterInitialize;
begin
  inherited;
  _CtrlDocumento.InitializeAs(Self);
  _CtrlDocumento.OpenTransaction := false;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
end;

constructor TCtrlLancAlteradores.Create;
begin
  inherited;
  _CtrlDocumento := TCtrlDocumento.Create;
  _Padroes := TCtrlPadroes.Create;
  // SIG - 130578 - Contas a Pagar - Lançamentos de Alteradores
  // Alterado por Arnaldo V. Scarin em 08/05/2024
  FListaPlanosPrevidenciarios := TStringList.Create;
end;

destructor TCtrlLancAlteradores.Destroy;
begin
  // SIG - 130578 - Contas a Pagar - Lançamentos de Alteradores
  // Alterado por Arnaldo V. Scarin em 08/05/2024
  FListaPlanosPrevidenciarios.Clear;
  FreeAndNil(FListaPlanosPrevidenciarios);
  _Padroes.Free;
  _CtrlDocumento.Free;
  If isAppServer Then FCdsLancAlteradores.Free;
  inherited;
end;

procedure TCtrlLancAlteradores.DoChangeDataBase;
begin
  inherited;

end;

procedure TCtrlLancAlteradores.OnCreateAppServer;
begin
  inherited;
  FCdsLancAlteradores := TClientDataSet.Create(nil);
end;

function TCtrlLancAlteradores.ProcessaLancAlteradores( Operacao: TOperacao;
         iIdUsuario, iIdPessoa, iIdModulo, liPlanoConta: Integer;
         bUsaPlanoPatro, bContabiliza, bPartidaDobrada: Boolean;
         //
         bIntegraOrcamento : Boolean;
         cdsRateio : TClientDataSet
         //
         ): Boolean;

var
  sDscLog : String;

  //David - Pendência 25536
  CtrlFinanc: TCtrlFinanc;
  cdsData : TClientDataset;

  //Ricardo Freitas - SOL: 158675 - KINTANA: 1290124
  DebCre:string;

  iIdProcesso, iIdTipoServico: Integer; //Cássio Rovaroto - SIG nº 115585
  dValorRetencao: double;  //Cássio Rovaroto - SIG nº 115585


  //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  Procedure IntegraOrcamento;
  Var
    TempAlteradores : TClientDataSet;//Utlizado pois os dados do CDS ainda estão na cache e não existe commit
  Begin
     If bIntegraOrcamento Then
        Try
          TempAlteradores := TClientDataSet.Create(nil);
          Try
             TempAlteradores.Data := FCdsLancAlteradores.Data;
             _CtrlDocumento.Orcamento.FDO(cdsRateio, TempAlteradores);
          Finally
            FreeAndNil(TempAlteradores);
          End;
        Except
          RAISE;
        End;

  End;
  
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ProcessaLancAlteradores(Integer(Operacao),
               iIdUsuario, iIdPessoa, iIdModulo, liPlanoConta, bUsaPlanoPatro, bContabiliza);

     If Not Result Then
       MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
     Result := False;
     Try

        If not InTransaction Then StartTransaction;  //Leandro SIG136150

        //David - Pendência 25536
        CtrlFinanc := TCtrlFinanc.Create( iIdPessoa, iIdModulo, iIdUsuario, bUsaPlanoPatro );
        cdsData := TClientDataset.Create( nil );
        try
           // Rodolpho da Silva - P: 25536 - 09/08/2007
           if ValidaTesteDispFinanc(FCdsLancAlteradores.FieldByName('CODDOCUMENTO').AsInteger) then
           begin
              //Consulto as datas porque não há garantia de que estejam no dataset de alteradores
              //cdsData.Data := GetDataPacket( ' select nvl( DATADISPONIB, DATAPROGRAMADA ) as DATADOC ' + //Taffarel - SIG86376
              //                               ' from DOCUMENTO where CODDOCUMENTO = ' + FCdsLancAlteradores.FieldByName('CODDOCUMENTO').AsString); //Taffarel - SIG86376

              CtrlFinanc.InitializeAs( Self );
              if not CtrlFinanc.TestaDispFinanc( iIdPessoa, iIdUsuario, trunc( FCdsLancAlteradores.FieldByName('DATALANCTO').AsDateTime ) ) then //Taffarel - SIG86376
              begin
                MessageInfo := ' Não se pode lançar, alterar ou excluir alteradores neste documento, pois a data do mesmo encontra-se bloqueada.';
                raise Exception.Create( MessageInfo );
              end;
           end;

        finally
          CtrlFinanc.Free;
          cdsData.Free;
        end;


        // início - andre tavares pendência 21647 - esta função deve ser chamada para todas as operações de alteradores do documento
        if  not VerificaStatusDoc(FCdsLancAlteradores.FieldByName('CODDOCUMENTO').AsFloat) then
        begin
          MessageInfo := ' Não se pode lançar, alterar ou excluir alteradores para este documento, pois o mesmo já baixado ou emitido para cobrança.';
          raise Exception.Create(MessageInfo);
        end;
        // fim - andre tavares pendência 21647

        sDscLog := '';

        //Cássio Rovaroto - SIG nº 115585 - Início
        if FCdsLancAlteradores.FieldByName('IDPROCESSO').IsNull then
          iIdProcesso := -1
        else
          iIdProcesso := FCdsLancAlteradores.FieldByName('IDPROCESSO').AsInteger;

        if FCdsLancAlteradores.FieldByName('IDTIPOSERVICO').IsNull then
          iIdTipoServico := -1
        else
          iIdTipoServico := FCdsLancAlteradores.FieldByName('IDTIPOSERVICO').AsInteger;

        if (FCdsLancAlteradores.FieldByName('VALORBASERETENCAO').IsNull) then
          dValorRetencao := 0
        else
          dValorRetencao := FCdsLancAlteradores.FieldByName('VALORBASERETENCAO').AsFloat;
        //Cássio Rovaroto - SIG nº 115585 - Fim

        _CtrlDocumento.lstPlanosPrevidenciarios.Assign(ListaPlanosPrevidenciarios);
        Case Operacao of
          opInserir:
          Begin
              sDscLog := 'Inclusao ';
             _CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
             _CtrlDocumento.PartidaDobrada := bPartidaDobrada;
             _CtrlDocumento.Lanctodocum.SetValues(FCdsLancAlteradores.FieldByName('DATALANCTO').AsDateTime,
                                                  FCdsLancAlteradores.FieldByName('CODDOCUMENTO').AsInteger,
                                                  0,
                                                  FCdsLancAlteradores.FieldByName('VLRLIQUIDO').AsFloat,
                                                  FCdsLancAlteradores.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                  FCdsLancAlteradores.FieldByName('VALOR').AsFloat,
                                                  FCdsLancAlteradores.FieldByName('UNIDNEGOC').AsInteger,
                                                  FCdsLancAlteradores.FieldByName('PLNCODIGO').AsInteger,
                                                  0,
                                                  iIdUsuario,
                                                  iIdPessoa,
                                                  0,
                                                  FCdsLancAlteradores.FieldByName('ESTORNO').AsInteger,
                                                  0,
                                                  0,
                                                  FCdsLancAlteradores.FieldByName('CODALTERADOR').AsInteger,
                                                  '4',
                                                  '',
                                                  '',
                                                  '',
                                                  FCdsLancAlteradores.FieldByName('HISTORICOCOMPL').AsString,
                                                  '',
                                                  '',
                                                  '',
                                                  FCdsLancAlteradores.FieldByName('DEBCRE').AsString,
                                                  iIdModulo,
                                                  liPlanoConta,
                                                  bUsaPlanoPatro,
                                                  bContabiliza,
                                                  //inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                                                  0,
                                                  0,  // iDiasFloat      : Integer
                                                  '',  // sContaBaixa     : String
                                                  0,  // liSubContaBaixa : Integer
                                                  FCdsLancAlteradores.FieldByName( 'IDDespesaOrc'  ).AsFloat,
                                                  FCdsLancAlteradores.FieldByName( 'IDRateioDocum' ).AsFloat
                                                  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                                                  iIdTipoServico, iIdProcesso, dValorRetencao //Cássio Rovaroto - SIG nº 115585
                                                  );

             //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
             IntegraOrcamento;

             Result := _CtrlDocumento.Insert;
          End;
          opAlterar:
          Begin
             sDscLog := 'Alteracao';
             _CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
             _CtrlDocumento.PartidaDobrada := bPartidaDobrada;
             _CtrlDocumento.Lanctodocum.SetValues(FCdsLancAlteradores.FieldByName('DATALANCTO').AsDateTime,
                                                  FCdsLancAlteradores.FieldByName('CODDOCUMENTO').AsInteger,
                                                  FCdsLancAlteradores.FieldByName('NUMLANCTO').AsInteger,
                                                  FCdsLancAlteradores.FieldByName('VLRLIQUIDO').AsFloat,
                                                  FCdsLancAlteradores.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                  FCdsLancAlteradores.FieldByName('VALOR').AsFloat,
                                                  FCdsLancAlteradores.FieldByName('UNIDNEGOC').AsInteger,
                                                  FCdsLancAlteradores.FieldByName('PLNCODIGO').AsInteger,
                                                  0,
                                                  iIdUsuario,
                                                  iIdPessoa,
                                                  0,
                                                  FCdsLancAlteradores.FieldByName('ESTORNO').AsInteger,
                                                  0,
                                                  0,
                                                  FCdsLancAlteradores.FieldByName('CODALTERADOR').AsInteger,
                                                  '4',
                                                  '',
                                                  '',
                                                  '',
                                                  FCdsLancAlteradores.FieldByName('HISTORICOCOMPL').AsString,
                                                  '',
                                                  '',
                                                  '',
                                                  FCdsLancAlteradores.FieldByName('DEBCRE').AsString,
                                                  iIdModulo,
                                                  liPlanoConta,
                                                  bUsaPlanoPatro,
                                                  bContabiliza,
                                                  //Inicio - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                                                  0,
                                                  0,  // iDiasFloat      : Integer
                                                  '', // sContaBaixa     : String
                                                  0,  // liSubContaBaixa : Integer
                                                  FCdsLancAlteradores.FieldByName( 'IDDespesaOrc'  ).AsFloat,
                                                  FCdsLancAlteradores.FieldByName( 'IDRateioDocum' ).AsFloat
                                                  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
                                                  iIdTipoServico, iIdProcesso, dValorRetencao //Cássio Rovaroto - SIG nº 115585
                                                  );

             //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
             IntegraOrcamento;
             //
             Result := _CtrlDocumento.Update;
          End;
          opApagar:
          Begin
             sDscLog := 'Exclusao';
             _CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
             _CtrlDocumento.PartidaDobrada := bPartidaDobrada;
             _CtrlDocumento.CodDocumento := FCdsLancAlteradores.FieldByName('CODDOCUMENTO').AsInteger;
             _CtrlDocumento.IdModulo := iIdModulo;
             _CtrlDocumento.UsaPlanoPatro := bUsaPlanoPatro;
             _CtrlDocumento.Lanctodocum.CodDocumento := FCdsLancAlteradores.FieldByName('CODDOCUMENTO').AsInteger;
             _CtrlDocumento.Lanctodocum.NumLancto := FCdsLancAlteradores.FieldByName('NUMLANCTO').AsInteger;
             _CtrlDocumento.Lanctodocum.IdModulo := iIdModulo;

             //início - andré tavares - pendência 26113 - 16/08/2007 - tem que excluir desta tabela também
             if not ExecSql('DELETE FROM DOCXIMPOSTOACUM WHERE IDIMPOSTORETIDO = (SELECT IDIMPOSTORETIDO FROM IMPOSTORETIDO WHERE NUMLANCTO = ' + FCdsLancAlteradores.FieldByName('NUMLANCTO').AsString + ')') then
               raise Exception.Create(MessageInfo);
             //fim - andré tavares - pendência 26113 - 16/08/2007 - tem que excluir desta tabela também

             if not ExecSql('DELETE FROM IMPOSTORETIDO WHERE NUMLANCTO = '+ FCdsLancAlteradores.FieldByName('NUMLANCTO').AsString) then
               raise Exception.Create(MessageInfo);

             Result := _CtrlDocumento.Delete;
          End;
        End;

        //Comentado por Ricardo Freitas - SOL: 158675 - KINTANA: 1290124
        {// início André Tavares 30/06/2003 pendência 13471
        if not ExecSql(' UPDATE DOCUMENTO SET FLGNAOCONCILIADO = 1 WHERE CODDOCUMENTO = '+ FCdsLancAlteradores.FieldByName('CODDOCUMENTO').asString) then
          raise Exception.Create(MessageInfo);
        // fim André Tavares 30/06/2003 pendência 13471}

        //Ricardo Freitas - SOL: 158675 - KINTANA: 1290124
        //Verifica o saldo do documento, caso estiver zerado deverá alterar o status
        //do documento para baixado e já conciliado (FLGNAOCONCILIADO = null) para este documento
        //não entrar mais na rotina de ajusta provisão do administração imobiliário assim
        //não gerando lancamentos (LANCTODOCUM) desnecessários.
        if RetornaSaldoDocumento(CdsLancAlteradores.FieldByName('CODDOCUMENTO').asString,DebCre) = 0 then
        begin
             //Retirar
             if not ExecSql(' UPDATE DOCUMENTO SET FLGNAOCONCILIADO = NULL,STATUS = 2 WHERE CODDOCUMENTO = '+ FCdsLancAlteradores.FieldByName('CODDOCUMENTO').asString) then
              raise Exception.Create(MessageInfo);
        end
        else
        begin
           // início André Tavares 30/06/2003 pendência 13471
           if not ExecSql(' UPDATE DOCUMENTO SET FLGNAOCONCILIADO = 1 WHERE CODDOCUMENTO = '+ FCdsLancAlteradores.FieldByName('CODDOCUMENTO').asString) then
              raise Exception.Create(MessageInfo);
           // fim André Tavares 30/06/2003 pendência 13471
        end;
        //Ricardo de Freitas - Fim

        If Not Result Then raise Exception.Create(_CtrlDocumento.MessageInfo);
         If Not _Padroes.GravaLogOperacoes(iIdPessoa,iIdModulo,iIdUsuario,sDscLog+' Lanc Alteradores',False) Then
                Raise Exception.Create(_Padroes.MessageInfo);
        If InTransaction Then Commit;  //Leandro SIG136150
     except
        On E:Exception Do
         Begin
            If InTransaction then Rollback;   //Leandro SIG136150
            Result := False;
            MessageInfo := E.Message;
         End;
     End;
  End;
end;

function TCtrlLancAlteradores.RetornaSaldoDocumento(CodDocumento: string;
var DebCre: string): Real;var
   sSQl:String ;
   cdsSaldo: TClientDataset;
begin
        TRY
           cdsSaldo := TClientDataset.Create( nil );
           DebCre   := '';
           Result   := 0;

           sSQL := '';
           sSQL := ' SELECT ' +
             ' TIP.DEBCRE, ' +
             ' SUM(DECODE(LANC.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LANC.VALOR,LANC.VALOR * -1),DECODE(DOC.RECPAG,''R'',LANC.VALOR * -1,LANC.VALOR))) AS VALOR ' +
             //' SUM(DECODE(LANC.DEBCRE,'D',DECODE(DOC.RECPAG,'R',LANC.VALOROUTRAMOEDA,LANC.VALOROUTRAMOEDA * -1),DECODE(DOC.RECPAG,'R',LANC.VALOROUTRAMOEDA * -1,LANC.VALOROUTRAMOEDA))) AS VALOROUTRAMOEDA --' +
             ' FROM ' +
             ' LANCTODOCUM LANC, DOCUMENTO DOC, TIPODOCRECPAG TIP ' +
             ' WHERE ' +
             ' DOC.CODDOCUMENTO = ' + Trim(COdDocumento) +
             ' AND DOC.CODDOCUMENTO = LANC.CODDOCUMENTO ' +
             ' AND DOC.CODTIPDOC  = TIP.CODTIPDOC ' +
             ' GROUP BY TIP.DEBCRE ';        

           cdsSaldo.Data := GetDataPacket(sSQl);

           if not cdsSaldo.IsEmpty then
           begin
                DebCre   := Trim(cdsSaldo.fieldbyname('DEBCRE').AsString);
                Result   := cdsSaldo.fieldbyname('VALOR').AsFLoat;
           end;

        FINALLY
           if cdsSaldo <> nil then
           begin
                cdsSaldo.Close;
                FreeAndNil(cdsSaldo);
           end;
        end;
end;

procedure TCtrlLancAlteradores.SetCdsLancAlteradores(
  const Value: TClientDataSet);
begin
  FCdsLancAlteradores := Value;
end;


function TCtrlLancAlteradores.ValidaTesteDispFinanc(
  iCodDocumento: integer): boolean;
begin
   _Cds.Data := GetDataPacket('SELECT RECPAG FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(iCodDocumento));
   Result    := not (_Cds.FieldByName('RECPAG').AsString = 'R');
end;




function TCtrlLancAlteradores.VerificaStatusDoc(CodDocumento: extended): Boolean;
begin
 with TclientDataset.Create (nil) do begin
   try
      data := getdatapacket('SELECT STATUS,EMISBLOQ FROM DOCUMENTO WHERE CODDOCUMENTO = '+
                          floattostr(CodDocumento));

      result := (fieldbyname('status').asstring <> '2') and (fieldbyname('emisbloq').asstring <> 'S') ;

      //verifica se o documento foi baixado normalmente
      data := getDataPacket('SELECT NUMLANCTO FROM LANCTODOCUM WHERE (OPERACAO = ''5'') AND (ESTORNO IS NULL) AND CODDOCUMENTO = ' + floattostr(CodDocumento) );
      result := (result) or (isEmpty);

   finally
     free;
     
   end;

 end
end;

//edilaine SIG100840 : inicio
function TCtrlLancAlteradores.ValidaBloqueio(idEmpresa, idModulo: Double; sData: String): Boolean;
begin
  Result := True;

  _Cds.Data := GetDataPacket('SELECT PACDATABLOQ                             ' +
                             '  FROM PARAMCONTAB                             ' +
                             ' WHERE (IDPESSOA = '+FloatToStr(IdEmpresa)+')  ' +
                             '   AND (PACDATABLOQ IS NOT NULL)               ' +
                             '   AND (PACDATABLOQ >= TO_DATE('''+sData+''',''DD/MM/YYYY'')) ');

  if not _lDataSet.IsEmpty then
  begin
    Result := False;
    MessageInfo := 'Contabilidade Bloqueada até '+_lDataSet.FieldByName('PACDATABLOQ').AsString;
  end
  else
  begin
    _Cds.Data := GetDataPacket('SELECT DECODE(NUMDIAS,0,DATABLOQUEIO,TRUNC(SYSDATE) - NUMDIAS) as DATALIM, ' +
                               '       M.NOMEMODULO      AS MODULO_ORIGEM '     +
                               '  FROM DIASBLOQMOD D '                          +
                               '  JOIN CM.MODULO M ON D.IDMODULO = M.IDMODULO ' +
                               ' WHERE (D.IDPESSOA = '+FloatToStr(IdEmpresa)+') ' +
                               '   AND (D.IDMODULO = '+FloatToStr(IdModulo)+')');

    if (not _Cds.isEmpty) and (StrToDate(sdata) <= _Cds.FieldByName('DATALIM').AsDateTime) then
    begin
       Result := False;
       MessageInfo := 'Contabilidade Bloqueada até '+ FormatDateTime('dd/mm/yyyy',_Cds.FieldByName('DATALIM').AsDateTime)+
                      ' no módulo de origem.'+char(10)+char(13)+
                      _Cds.FieldByName('MODULO_ORIGEM').AsString;
    end;
  end;
end;
//edilaine SIG100840 : fim

end.
