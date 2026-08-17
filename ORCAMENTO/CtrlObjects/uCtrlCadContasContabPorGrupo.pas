{ --------------------------------------------------------------------------------------------------
Rotina......: ListarContabPlano, ListarContabPatro
Nº SOL......: 190626
Nº KINTANA..: 1803612
Data........: 03/10/2012
Responsável.: Edilaine Ferraresi
Descrição...: quando grupo for PGA usar filtro para centro de custo evitando trazer dados
              adicionais desnecessários
{--------------------------------------------------------------------------------------------------
Rotina......: ListarContabPlano
Nº SOL......: 184789
Nº KINTANA..: 1731029
Data........: 11/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: pegar contas contábeis com valor zerado ao listar de Plano
{--------------------------------------------------------------------------------------------------
Rotina......: CarregarParametros, CdsCentrodeCusto
Nº SOL......: 172384/10142
Nº KINTANA..: 1696873
Data........: 18/06/2012
Responsável.: Higor Nayde
Descrição...: client publico para passagem dos centros de custos
{--------------------------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
// Autor.........: Edilaine Ferraresi
// Data..........: 23/03/2012
// Nº SOL........: 172383-7764
// Nº KINTANA....: 1556975
// Rotina........: ExcluirComContasorcamen
// Descrição.....: troca de Modulo.iPlanoOrc por IdPlanoOrcamen
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListarContabPlano
Nº SOL......: 175387
Nº KINTANA..: 1595736
Data........: 29/02/2012
Responsável.: Edilaine Ferraresi
Descrição...: Correção da rotina de vinculação das contas orçamentarias (COMPCONTASORCAMEN)
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: PreencherContasDesvinculadas
Nº SOL......: 168202
Nº KINTANA..: 1480546
Data........: 08/11/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Correção da rotina de verificaçã da exclusão da COMPCONTASORCAMEN
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ExcluirComContasorcamen
Nº SOL......: 166287
Nº KINTANA..: 1446684
Data........: 07/10/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Correção da rotina de exclusão da COMPCONTASORCAMEN
----------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina......: Toda a Control
Nº SOL......: 159242/6041
Nº KINTANA..: 1385831
Data........: 31/06/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Control responsável de vínculo de contas contábeis para um grupo orçamentário.
              Insere\Altera\Exclui somente na tabela COMCONTASORCAMEN
----------------------------------------------------------------------------------------------------}

unit uCtrlCadContasContabPorGrupo;

interface

uses
   DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider,
   uMidasUtil, uCMTypes, Classes, StdCtrls, uCmSqlParams, uDbDataView, uReccodigo,
   ComCtrls, Math, dialogs, Forms,FAnaliseGeracaoContasOrcamen,uSistema,
   uCtrlPlanPrevContabPatro, uCtrlPadroes,DBTables,uFuncoesOrcamento,uModulo;

type
   TCtrlCadContasContabilPorGrupo = class(TCmControlObject)

   private


    strSQL:string;

    //ClientDataset de Parâmetros
    FcdscCusto,FcdsPlano,FcdsPatro,FcdsAtividadeProjeto,FcdsPrograma,
    FcdsTipoDespesa,FcdsParamOrc,FCdsCodigo,FcdsAux: TClientDataSet;
    LogContab:TStringList;

    FTotVinculacao:integer;
    FTotNaoVinculacao:integer;
    FlstContas: TStringList;
    FlstContas_Desvinculadas: TStringList;
    FIdGrupoOrcamen: integer;
    FCodGrupoOrcamen: string;
    FidPlanoContas: string;
    FidPlanoOrcamento: string;
    FidAnoOrcamento: string;
    FDescrGrupoOrcamen: string;
    FLogInclusao: TStringList;
    FCdsCentroDeCusto: TClientDataSet;

    function CarregarParametros:boolean;
    function VerificarContaOrcamen(strContaorcamen:string):boolean;

    //Monta lista de contas contábeis que foram desvinculadas
    procedure PreencherContasDesvinculadas;
    //Cadastra vínculo de conta contábeis que não tenha paramêtros na PlanoSaldo,
    //isto é necessário, pois o usuário poderá querer vincular uma conta contábil
    //que não tenha parâmetros(Plano, patro,CCusto,Atividade de proj e etc.)
    //assim consequentemente não gerando o código da conta orçamentária corrspondente.
    procedure VincularContaContabilVazia();

    procedure SetlstContas(const Value: TStringList);
    procedure SetCodGrupoOrcamen(const Value: string);
    procedure SetIdGrupoOrcamen(const Value: integer);
    procedure SetidPlanoContas(const Value: string);
    procedure SetidPlanoOrcamento(const Value: string);
    procedure SetidAnoOrcamento(const Value: string);

    procedure Erro(Descr:string;E:Exception);
    procedure SetDescrGrupoOrcamen(const Value: string);
    function log: TStringList;
    procedure SetCdsCentroDeCusto(const Value: TClientDataSet);

   public

   constructor Create; override;
   Destructor  Destroy; override;

   function Vincular:boolean;
   function MontarCodigoOrcamentario:boolean;
   function ExcluirComContasorcamen:boolean;
   function CriarCompContaEspelho(Criar:boolean):boolean;
   function InserirCompContas():boolean;

   function ListarContabCentroCusto():olevariant;
   function ListarContabPlano():olevariant;
   function ListarContabPatro():olevariant;
   function ListarContabAtividadeProjeto():olevariant;
   function ListarContabPrograma():olevariant;
   function ListarContabTipoDespesa():olevariant;

   property IdGrupoOrcamen:integer read FIdGrupoOrcamen write SetIdGrupoOrcamen;
   property CodGrupoOrcamen:string read FCodGrupoOrcamen write SetCodGrupoOrcamen;
   property DescrGrupoOrcamen:string read FDescrGrupoOrcamen write SetDescrGrupoOrcamen;
   property idPlanoOrcamento:string read FidPlanoOrcamento write SetidPlanoOrcamento;
   property idAnoOrcamento:string read FidAnoOrcamento write SetidAnoOrcamento;
   property idPlanoContas:string read FidPlanoContas write SetidPlanoContas;
   property lstContas:TStringList read FlstContas write SetlstContas;
   property LogInclusao:TStringList read FLogInclusao;
   property TotVinculacao:integer     read FTotVinculacao;
   property TotNaoVinculacao:integer  read FTotNaoVinculacao;
   property CdsCentroDeCusto : TClientDataSet read FCdsCentroDeCusto write SetCdsCentroDeCusto;  //Higor Nayde  SOL - 172384/10142 KTN - 1696873
end;

implementation

{ TCtrlCadContasContabilPorGrupo }

function TCtrlCadContasContabilPorGrupo.CarregarParametros:boolean;
begin

         result := false;

         //Centro de Custo
         if FCdsCentroDeCusto.IsEmpty then //Higor Nayde  SOL - 172384/10142 KTN - 1696873
            FcdscCusto.Data           := ListarContabCentroCusto()
         else
            FcdscCusto := FCdsCentroDeCusto;

         if FcdscCusto.IsEmpty then
         begin
              FcdscCusto.Append;
              FcdscCusto.FieldByName('NOME').AsString              := 'Conta Generica';
              FcdscCusto.FieldByName('CODEXTERNO').AsString        := 'X';
              FcdscCusto.FieldByName('CODCENTROCUSTO').AsString    := 'X';
              FcdscCusto.Post;
         end;

         //Plano Previdenciário
         FcdsPlano.Data            := ListarContabPlano();

         if FcdsPlano.IsEmpty then
         begin
               FcdsPlano.Append;
               FcdsPlano.FieldByName('NOME').AsString           := 'Conta Generica';
               FcdsPlano.FieldByName('CODORCAMENTO').AsString   := 'X';
               FcdsPlano.FieldByName('IDPLANOPREV').AsString    := '0';
               FcdsPlano.Post;
         end;

         //Patrocinador
         FcdsPatro.Data            := ListarContabPatro();

         if FcdsPatro.IsEmpty then
         begin
               FcdsPatro.Append;
               FcdsPatro.FieldByName('NOME').AsString           := 'Conta Generica';
               FcdsPatro.FieldByName('CODORCAMENTO').AsString   := 'X';
               FcdsPatro.FieldByName('IDPESSOA').AsString       := '0';
               FcdsPatro.Post;
         end;

         //Ativida de Projeto
         FcdsAtividadeProjeto.Data := ListarContabAtividadeProjeto();

         if FcdsAtividadeProjeto.IsEmpty then
         begin
               FcdsAtividadeProjeto.Append;
               FcdsAtividadeProjeto.FieldByName('NOME').AsString        := 'Conta Generica';
               FcdsAtividadeProjeto.FieldByName('UNECODIGO').AsString   := '';
               FcdsAtividadeProjeto.FieldByName('UNIDNEGOC').AsString   := '';
               FcdsAtividadeProjeto.Post;
         end;

         //Programa
         FcdsPrograma.Data         :=  ListarContabPrograma();

         if FcdsPrograma.IsEmpty then
         begin
               FcdsPrograma.Append;
               FcdsPrograma.FieldByName('NOME').AsString                := 'Conta Generica';
               FcdsPrograma.FieldByName('IDPROGRAMAORCAMEN').AsInteger  := 0;
               FcdsPrograma.Post;
         end;

         //Tipo Despesa
         FcdsTipoDespesa.Data      :=  ListarContabTipoDespesa();

         if FcdsTipoDespesa.IsEmpty then
         begin
              FcdsTipoDespesa.Append;
              FcdsTipoDespesa.FieldByName('NOME').AsString                  := 'Conta Generica';
              FcdsTipoDespesa.FieldByName('IDTIPO_DEPESAORCAMEN').AsInteger := 0;
              FcdsTipoDespesa.Post;
         end;


         result := true; 
end;

constructor TCtrlCadContasContabilPorGrupo.Create;
begin
    inherited;

    FcdscCusto           := TClientDataSet.Create(Application);
    FcdsPlano            := TClientDataSet.Create(Application);
    FcdsPatro            := TClientDataSet.Create(Application);
    FcdsAtividadeProjeto := TClientDataSet.Create(Application);
    FcdsPrograma         := TClientDataSet.Create(Application);
    FcdsTipoDespesa      := TClientDataSet.Create(Application);
    FcdsParamOrc         := TClientDataSet.Create(Application);
    FcdsCodigo           := TClientDataSet.Create(Application);
    FcdsAux              := TClientDataSet.Create(Application);

    FLogInclusao         := TStringList.Create;
    FLogInclusao.Clear;

    FTotVinculacao := 0;
    FTotNaoVinculacao := 0;

    FCdsCentroDeCusto    := TClientDataSet.Create(Application); //Higor Nayde  SOL - 172384/10142 KTN - 1696873

end;

function TCtrlCadContasContabilPorGrupo.CriarCompContaEspelho(
  Criar: boolean): boolean;
var
   i:integer;
begin

     result := false;

     TRY

     if Criar then
     begin

          //Excluir
          strSQL := ' DELETE FROM COMPCONTASORCAMEN WHERE IDCONTAORCAMEN = ' + QuotedStr('-1');
          ExecSQL(strSQL);

          strSQL := ' DELETE FROM CONTASORCAMEN WHERE IDCONTAORCAMEN = ' + QuotedStr('-1');
          ExecSQL(strSQL);

          //Criar
          strSQL :=  'INSERT INTO CONTASORCAMEN (   ' +
                                  ' IDCONTAORCAMEN,    ' +
                                  ' IDGRUPOORCAMEN,    ' +
                                  ' IDPLANOORCAMEN,    ' +
                                  ' IDPESSOA,          ' +
                                  ' NOMECONTAORCAMEN,  ' +
                                  ' FLGSINALCONTA,     ' +
                                  ' FLGATIVA           ' +
                        ' )  ' +
                        '(' +
                             ' SELECT ' +
                                      QuotedStr('-1') + ' AS IDCONTAORCAMEN, ' +
                                      ' IDGRUPOORCAMEN, ' +
                                      ' IDPLANOORCAMEN, ' +
                                      IntToStr(Sistema.IdEmpresa) + ',' +
                                      ' NOMEGRUPOORCAMEN AS NOMECONTAORCAMEN, ' +
                                      ' FLGSINALGRUPO AS FLGSINALCONTA, ' + //Sinal da Conta
                                      QuotedStr('A') + ' AS FLGATIVA ' + //Ativo
                                      ' FROM GRUPOORCAMEN ' +
                                      ' WHERE IDGRUPOORCAMEN = ' + IntToStr(IdGrupoOrcamen) +
                        ')';
          ExecSQL(strSQL);

          //Insere Contas Espelho de Contas orcamentárias
          for i:= 0 to lstContas.Count - 1 Do
          begin
               strSQL := ' INSERT INTO COMPCONTASORCAMEN  ' +
                         '        (IDCOMPCONTASORC,IDCONTAORCAMEN,IDPLANOORCAMEN,PLANO,PLACONTA,IDPESSOA ' +
                         ' ) ' +
                         ' VALUES(' +
                                      QuotedStr('-' + IntToStr(i + 1)) + ',' +
                                      QuotedStr('-1') + ',' +
                                      idPlanoOrcamento + ',' +
                                      idPlanoContas + ',' +
                                      QuotedStr( lstContas[i] ) + ',' +
                                      IntToStr(Sistema.IdEmpresa) +

                         ')';
                         ExecSQL(strSQL);
          end;
     end
     else
     begin
          //Excluir
          strSQL := ' DELETE FROM COMPCONTASORCAMEN WHERE IDCONTAORCAMEN = ' + QuotedStr('-1');
          ExecSQL(strSQL);

          strSQL := ' DELETE FROM CONTASORCAMEN WHERE IDCONTAORCAMEN = ' + QuotedStr('-1');
          ExecSQL(strSQL);
     end;

     result := true;

     EXCEPT
      on E:exception do
      begin
           Erro('Erro ao criar contas de espelho',E);
      end;
     End;

end;

destructor TCtrlCadContasContabilPorGrupo.Destroy;
begin
    inherited;

    FcdscCusto.Close;
    FcdsPlano.Close;
    FcdsPatro.Close;
    FcdsAtividadeProjeto.Close;
    FcdsPrograma.Close;
    FcdsTipoDespesa.Close;
    FcdsParamOrc.Close;
    FcdsCodigo.Close;
    FcdsAux.Close;

    FCdsCentroDeCusto.Close; //Higor Nayde  SOL - 172384/10142 KTN - 1696873

    if FlstContas_Desvinculadas <> nil then
       FreeAndNil(FlstContas_Desvinculadas);

    FreeAndNil(FLogInclusao);
end;

procedure TCtrlCadContasContabilPorGrupo.Erro(Descr: string; E: Exception);
begin
     Application.MessageBox(pchar(Descr + #13 + 'Tipo: ' + E.ClassName + #13 + E.Message),'Erro',48);
end;

function TCtrlCadContasContabilPorGrupo.ExcluirComContasorcamen: boolean;
var
  strcontas:string;
  c:integer;
begin
     TRY

       Result    := false;
       strcontas := '';

       //Ricardo SOL: 166287 KTN: 1446684
       //Excluir as contas contábeis que foram desvinculadas propositalmente
       PreencherContasDesvinculadas();

       if FlstContas_Desvinculadas.Count > 0 then
       begin
             for c:= 0 to FlstContas_Desvinculadas.Count - 1 do
             begin
                  strcontas := strcontas + FlstContas_Desvinculadas.Strings[c] + ',';
                  FLogInclusao.Add(   FormatDateTime('hh:nn:ss', Now) + ' - ContaID: ' + CompletaFIM(FlstContas_Desvinculadas.Strings[c] , ' ', 40) + ' - ' + 'Conta contábil desvinculada do grupo.');
             end;

             strcontas := strcontas + QuotedStr('');

             strSQL :=  ' DELETE FROM COMPCONTASORCAMEN WHERE  IDCONTAORCAMEN IN ' + #13 +
                        ' (SELECT DISTINCT IDCONTAORCAMEN FROM CONTASORCAMEN WHERE IDGRUPOORCAMEN = ' +
                        IntToStr(IdGrupoOrcamen) + ') AND PLACONTA IN (' +  strcontas  + ')' + 
                        //Ricardo de Freitas SOL: 168202 KINTANA: 1480546
                        ' AND IDPLANOORCAMEN = ' + idPlanoOrcamento {IntToStr(Modulo.iPlanoOrc)}  // Edilaine - SOL 172383-7764 / KTN 1556975

                        ;

             ExecSQL(strSQL);

       end;

       //Ricardo SOL: 166287 KTN: 1446684 - fim

       Result := true;

     FINALLY
     END;
end;

function TCtrlCadContasContabilPorGrupo.InserirCompContas: boolean;
begin

     Result := false;

     FCdsCodigo.First;

     while not FCdsCodigo.Eof Do
     begin

          DoProgresso([ CodGrupoOrcamen + ' - ' + DescrGrupoOrcamen , 0, 0, FcdsCodigo.RecordCount, FcdsCodigo.RecNo, ' Vinculando com a contabilidade...']);
          DoProgresso([ CodGrupoOrcamen + ' - ' + DescrGrupoOrcamen , 1, 0, FcdsCodigo.RecordCount, FcdsCodigo.RecNo, ' Vinculando com a contabilidade...']);

          //Verifica se Exite a conta orçamentária.
          if not VerificarContaOrcamen(FCdsCodigo.FIeldbyname('CODIGO').ASString) then
          begin
             FCdsCodigo.Next;
             FTotNaoVinculacao := FTotNaoVinculacao + 1;
             FLogInclusao.Add(FormatDateTime('hh:nn:ss', Now) + ' - ContaID: ' + CompletaFIM(FcdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' + 'Conta não localizada no grupo.');
             Continue;
          end;
          
          //Composição de Contas orçamentárias (Contabilidade)
          strSQL :=  'INSERT INTO COMPCONTASORCAMEN '                                        +
                             ' ( '                                                           +
                             ' IDCOMPCONTASORC, IDCONTAORCAMEN, '                            +
                             ' IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '             +
                             ' IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '           +
                             ' IDPESSOA, CODTIPRECDES, CODCENTRORESPON, IDEMPRESA, '         +
                             ' CODCENTROCUSTO, '                                             +
                             ' IDPROGRAMAORCAMEN,IDTIPO_DEPESAORCAMEN, '                     +
                             ' UNIDNEGOC, IDPLANOPREV, IDPATRO, '                            +
                             ' PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '  +
                             ' CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, ' +
                             ' CODTIPDOC, IDGRUPOCONDINI, IDGRUPOCONDFIM, IDGRUPOCONDRES '   +
                             ' ) '                                                           +
                     '( '                                                               +
                     'SELECT '                                                                  +
                     '   SEQCOMPCONTASORCAMEN.NEXTVAL, '                                        +
                     '   ' + QuotedStr( FCdsCodigo.FIeldbyname('CODIGO').ASString ) + ', '      +
                     '   IDCONTACONDRES, IDCONTACONDFIM, IDCONTACONDINI, '                      +
                     '   IDCONTAREFREAL, IDPLANOORCAMEN, IDCONTAREFORCADO, '                    +
                     '   IDPESSOA, CODTIPRECDES, CODCENTRORESPON,';
            // ----------------------------------------------------------------------------------

            // C.Custo
            //Ricardo Freitas SOL: 159242/6041  KINTANA: 1385831
            if (Trim(FCdsCodigo.fieldbyname('CODCENTROCUSTO').Asstring) <> '') and
               (Trim(FCdsCodigo.fieldbyname('CODCENTROCUSTO').Asstring) <> 'X') then
            begin
                    strSQL := strSQL + '   ' + IntToStr(Sistema.IdEmpresa) + ', ' +
                                       '   ' + QuotedStr(FCdsCodigo.fieldbyname('CODCENTROCUSTO').Asstring)   + ', ';
            end
            else
                    strSQL := strSQL + '  IDEMPRESA,   CODCENTROCUSTO, ';

            //Programa
            //Ricardo de Freitas SOL: 168202 KINTANA: 1480546
            if (Trim(FcdsCodigo.FieldByName('IDPROGRAMAORCAMEN').AsString) <> '') and
               (Trim(FcdsCodigo.FieldByName('IDPROGRAMAORCAMEN').AsString) <> '0') then
            begin
                    strSQL :=  strSQL + '   ' + QuotedStr(FcdsCodigo.FieldByName('IDPROGRAMAORCAMEN').AsString) + ', '
            end
            else
                   strSQL :=  strSQL + '   Null, ';
            //Ricardo de Freitas SOL: 168202 KINTANA: 1480546 - fim
            
            //Tipo de Despesa
            if (Trim(FcdsCodigo.FieldByName('IDTIPO_DEPESAORCAMEN').AsString) <> '') and
               (Trim(FcdsCodigo.FieldByName('IDTIPO_DEPESAORCAMEN').AsString) <> '0') then
            begin
                    strSQL :=  strSQL + '   ' + FcdsCodigo.FieldByName('IDTIPO_DEPESAORCAMEN').AsString + ', '
            end
            else
                   strSQL :=  strSQL + '   Null, ';

            // Ativ.Projeto
            if Trim(FcdsCodigo.FieldByName('UNIDNEGOC').AsString) <> '' then
               strSQL := strSQL + '   ' + FcdsCodigo.FieldByName('UNIDNEGOC').AsString + ', '
            else
               strSQL := strSQL + '   UNIDNEGOC, ';

            //Plano
            //Ricardo de Freitas SOL: 168202 KINTANA: 1480546
            if Trim(FcdsCodigo.FieldByName('IDPLANOPREV').AsString) <> '' then
               strSQL := strSQL + '   ' + FcdsCodigo.FieldByName('IDPLANOPREV').AsString + ', '
            else
               strSQL := strSQL + '   IDPLANOPREV, ';
            //Ricardo de Freitas SOL: 168202 KINTANA: 1480546 - fim

            // Patro
            if Trim(FcdsCodigo.FieldByName('IDPATRO').AsString) <> '' then
               strSQL := strSQL + '   ' + FcdsCodigo.FieldByName('IDPATRO').AsString + ', '
            else
               strSQL := strSQL + '   IDPATRO, ';

            strSQL := strSQL +
            'PLANO, PLACONTA, RECPAG, PERCCONTAREFORC, PERCCONTAREFREA, '              +
            'CONDICAO, TIPOCONDINI, TIPOCONDRES, VLRCONDINI, VLRCONDRES, '             +
            'CODTIPDOC, IDGRUPOCONDINI, IDGRUPOCONDFIM, IDGRUPOCONDRES '               +
            'FROM '                                                                    +
            '   COMPCONTASORCAMEN '                                                    +
            'WHERE ' +
            '   IDCONTAORCAMEN = ''-1'' )';

          TRY
             Result := ExecSQL(strSQL);
             FTotVinculacao := FTotVinculacao + 1;
             FLogInclusao.Add(FormatDateTime('hh:nn:ss', Now) + ' - ContaID: ' + CompletaFIM(FcdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' + 'Vinculação contábil realizada.');
          EXCEPT
                on E:Exception Do
                begin
                   FTotNaoVinculacao := FTotNaoVinculacao + 1;
                   FLogInclusao.Add(FormatDateTime('hh:nn:ss', Now) + ' - ContaID: ' + CompletaFIM(FcdsCodigo.FieldByName('CODIGO').AsString, ' ', 40) + ' - ' + 'Erro: ' + E.Message);
                end;
          END;

          FCdsCodigo.Next;
     end;

     //Ricardo SOL: 166287 KTN: 1446684
     VincularContaContabilVazia();

     Result := true;

end;

function TCtrlCadContasContabilPorGrupo.ListarContabAtividadeProjeto: olevariant;
var i:integer;
begin
     strSQL :=

     ' SELECT DISTINCT ' +
     '   UN.NOME AS NOME, UN.UNIDNEGOC, UN.UNETIPO, UN.CODORCAMEN AS UNECODIGO '  + #13 +
     ' FROM '                                                                     + #13 +
     '   UNIDNEGOCIO UN '                                                         + #13 +

     ' JOIN ' +
     '      (SELECT DISTINCT ' +
     '              UNIDNEGOC,IDPESSOA ' +
     '       FROM PLANOSALDO ' +
     '      WHERE PEREXERCICIO = ' + idAnoOrcamento +
     '      AND PLANO = '          + idPlanoContas +
     '      AND PLACONTA IN ( ' ;


     //Loop de Contas Contábeis
     for i := 0  to lstContas.Count - 1 Do
     begin
          strSQL := strSQL + QuotedStr(lstContas[i]) + ',';
     End;

     strSQL := strSQL +
     QuotedStr(' ') +  ')' +
     '     ) PL ' +
     ' ON ' +
     '     PL.UNIDNEGOC = UN.UNIDNEGOC AND ' +
     '     PL.IDPESSOA  = UN.IDPESSOA ';

     Result := GetDataPacket(strSQL);
end;

function TCtrlCadContasContabilPorGrupo.ListarContabCentroCusto: olevariant;
var
   i:integer;
begin
     strSQL :=
     ' SELECT DISTINCT ' +
              ' NVL(CU.CODCENTROCUSTO,' + QuotedStr('X') + ') as CODCENTROCUSTO, '+
              ' trim(NVL(CU.NOME, ' +  QuotedStr('(sem vinculacao)') + ')) || ' +
              ' decode(CU.STATUSGRUPOCDC,' + QuotedStr('S') + ',' +  QuotedStr('*') + ',' + QuotedStr(' ') + ') || ' +
              ' decode(CU.ATIVO, ' + QuotedStr('S')  + ',' +  QuotedStr(' ')  + ', ' +   QuotedStr('(Inativo)') + ') as NOME, ' +
              ' NVL(CU.CODEXTERNO,' + QuotedStr('X') + ') as CODEXTERNO ' +
     ' FROM ' +
     '      (SELECT DISTINCT ' +
     '              CODCENTROCUSTO ' +
     '      FROM PLANOSALDO ' +
     '      WHERE PEREXERCICIO = ' + idAnoOrcamento +
     '      AND PLANO = '          + idPlanoContas +
     '      AND PLACONTA IN ( ' ;

     //Loop de Contas Contábeis
     for i := 0  to FlstContas.Count - 1 Do
     begin
          strSQL := strSQL + QuotedStr(FlstContas[i]) + ',';
     End;

     strSQL := strSQL +
     QuotedStr(' ') +  ')' +
     '     ) PL ' +
     ' LEFT JOIN ' +
     '      CENTCUST CU ' +
     ' ON ' +
     '     PL.CODCENTROCUSTO = CU.CODCENTROCUSTO ' +
     ' WHERE ' +
     '    (CU.CODCENTROCUSTO IS NULL) OR  (CU.ATIVO = ' + QuotedStr('S')  + ')';
     Result := GetDataPacket(strSQL);
end;

function TCtrlCadContasContabilPorGrupo.ListarContabPatro: olevariant;
var i:integer;
begin
     strSQL :=

     ' SELECT DISTINCT ' +
     '   PR.NOME AS NOME, PR.IDPESSOA, PR.CODORCAMENTO '       + #13 +
     ' FROM '                                                  + #13 +


     '   (SELECT P.NOME AS NOME, PT.IDPESSOA, PT.CODORCAMENTO ' + #13 +
     '   FROM PESSOA P,PATRO  PT ' + #13 +
     '   WHERE P.IDPESSOA   = PT.IDPESSOA) PR '                  + #13 +


     ' JOIN ' +
     '      (SELECT DISTINCT ' +
     '              IDPATRO ' +
     '       FROM PLANOSALDO ' +
     '      WHERE PEREXERCICIO = ' + idAnoOrcamento +
     '      AND PLANO = '          + idPlanoContas +
     '      AND PLACONTA IN ( ';


     //Loop de Contas Contábeis
     for i := 0  to lstContas.Count - 1 Do
     begin
          strSQL := strSQL + QuotedStr(lstContas[i]) + ',';
     End;

     strSQL := strSQL +
     QuotedStr(' ') +  ')' +

     // Edilaine - SOL 190626 / KTN 1803612
     ' AND (PLSDEBITOCORRENTE > 0 OR PLSCREDITOCOR >= 0) ';

     if Copy(FCodGrupoOrcamen,1,1) = '4' then
        strSQL := strSQL +
        '   AND PERNUMERO IS NOT NULL AND CODCENTROCUSTO IS NOT NULL ';
     strSQL := strSQL +
     // Edilaine - SOL 190626 / KTN 1803612 - fim

     '     ) PL ' +
     ' ON ' +
     '     PR.IDPESSOA = PL.IDPATRO ';
 
     Result := GetDataPacket(strSQL);
end;

function TCtrlCadContasContabilPorGrupo.ListarContabPlano: olevariant;
var i:integer;
begin
     strSQL :=

     ' SELECT DISTINCT ' +
     '   PT.NOME AS NOME, PT.IDPLANOPREV, PT.CODORCAMENTO '       + #13 +
     ' FROM '                                                     + #13 +
     '   PLANPREVCONTABIL PT '                                    + #13 +

     ' JOIN ' +
     '      (SELECT DISTINCT ' +
     '              IDPLANOPREV ' +
     '       FROM PLANOSALDO ' +
     '      WHERE PEREXERCICIO = ' + idAnoOrcamento +
     '      AND PLANO = '          + idPlanoContas +
     '      AND PLACONTA IN ( ';


     //Loop de Contas Contábeis
     for i := 0  to lstContas.Count - 1 Do
     begin
          strSQL := strSQL + QuotedStr(lstContas[i]) + ',';
     End;

     strSQL := strSQL +
     QuotedStr(' ') +  ')' +

     //' AND (PLSDEBITOCORRENTE > 0 OR PLSCREDITOCOR >= 0) ' +  // Edilaine - SOL 175387 / KTN 1595736
     ' AND (PLSDEBITOCORRENTE > 0 OR PLSCREDITOCOR >= 0) ';    // Edilaine - SOL 184789 - KTN 1731029 - comentada a linha acima e condição >=

     // Edilaine - SOL 190626 / KTN 1803612
     if Copy(FCodGrupoOrcamen,1,1) = '4' then
        strSQL := strSQL +
        '   AND PERNUMERO IS NOT NULL AND CODCENTROCUSTO IS NOT NULL ';
     strSQL := strSQL +
     // Edilaine - SOL 190626 / KTN 1803612 - fim

     '     ) PL ' +
     ' ON ' +
     '     PT.IDPLANOPREV = PL.IDPLANOPREV ';

     Result := GetDataPacket(strSQL);
end;

function TCtrlCadContasContabilPorGrupo.ListarContabPrograma: olevariant;
var i:integer;
begin
 strSQL :=
 ' SELECT PR.IDPROGRAMAORCAMEN,PR.DESCRICAO_PROGRAMAORCAMEN AS NOME ' +
 ' FROM CM.PROGRAMAORCAMEN PR ' +

 ' WHERE IDPROGRAMAORCAMEN IN ( ' +

 ' SELECT DISTINCT ' +
 '       CASE WHEN SUBSTR(TRIM(PLACONTA),1,1) = ' + QuotedStr('4') + ' THEN ' +
 '          SUBSTR(TRIM(PLACONTA),3,1) ' +
 '       ELSE   NULL END AS IDPROGRAMA_ORCAMEN ' +
 ' FROM PLANOSALDO ' +
 '      WHERE PEREXERCICIO = ' + idAnoOrcamento +
 '      AND PLANO = '          + idPlanoContas +
 '      AND PLACONTA IN ( ';

 //Loop de Contas Contábeis
 for i := 0  to lstContas.Count - 1 Do
 begin
      strSQL := strSQL + QuotedStr(lstContas[i]) + ',';
 End;

 strSQL := strSQL + QuotedStr(' ') + '))'; 

 Result := GetDataPacket(strSQL);
end;

function TCtrlCadContasContabilPorGrupo.ListarContabTipoDespesa: olevariant;
var i:integer;
begin
 strSQL := ' SELECT TD.IDTIPO_DEPESAORCAMEN, TD.DESCRICAO_TIPO_DEPESAOCAMEN  AS NOME' +
           ' FROM CM.TIPO_DESPESAORCAMEN TD ' +

 ' WHERE IDTIPO_DEPESAORCAMEN IN ( ' +

 ' SELECT DISTINCT ' +
 '       CASE WHEN SUBSTR(TRIM(PLACONTA),1,1) = ' + QuotedStr('4') + ' THEN ' +
 '          SUBSTR(TRIM(PLACONTA),4,1) ' +
 '       ELSE   NULL END AS IDTIPO_DEPESAORCAMEN ' +
 ' FROM PLANOSALDO ' +
 '      WHERE PEREXERCICIO = ' + idAnoOrcamento +
 '      AND PLANO = '          + idPlanoContas +
 '      AND PLACONTA IN ( ';

 //Loop de Contas Contábeis
 for i := 0  to lstContas.Count - 1 Do
 begin
      strSQL := strSQL + QuotedStr(lstContas[i]) + ',';
 End;

 strSQL := strSQL + QuotedStr(' ') + '))';

 Result := GetDataPacket(strSQL);
end;

function TCtrlCadContasContabilPorGrupo.log: TStringList;
begin

end;

function TCtrlCadContasContabilPorGrupo.MontarCodigoOrcamentario: boolean;
var
   sCampo1,sCampo2,sCampo3,sCampo4,sCampo5,sCampo7,sCampo8 : String;
   sCodigoConta: String;
   iPos,iPosCC,iQuant: Integer;
   iTamCod,iTamCod1,iTamCod2,iTamCod3,iTamCod4,iTamCod5,iTamCod7,iTamCod8: Integer;
   iTipoCod1,iTipoCod2,iTipoCod3,iTipoCod4,iTipoCod5,iTipoCod7,iTipoCod8: Integer;
begin

   // --------------------------------------------------------------------------
   // 1) Monta o cds que conterá os registros dos códigos
   // --------------------------------------------------------------------------

   DoProgresso([ CodGrupoOrcamen + ' - ' + DescrGrupoOrcamen , 0, 0, 0, 0, 'Montando códigos de contas orçamentárias...']);

   Result := false;

       iTipoCod1   := FCdsParamOrc.FieldByName('FLGTIPOCOD1').AsInteger;
       iTipoCod2   := FCdsParamOrc.FieldByName('FLGTIPOCOD2').AsInteger;
       iTipoCod3   := FCdsParamOrc.FieldByName('FLGTIPOCOD3').AsInteger;
       iTipoCod4   := FCdsParamOrc.FieldByName('FLGTIPOCOD4').AsInteger;
       iTipoCod5   := FCdsParamOrc.FieldByName('FLGTIPOCOD5').AsInteger;
       iTipoCod7   := FCdsParamOrc.FieldByName('FLGTIPOCOD7').AsInteger;
       iTipoCod8   := FCdsParamOrc.FieldByName('FLGTIPOCOD8').AsInteger;

       iTamCod1    := FCdsParamOrc.FieldByName('TAMCOD1').AsInteger;
       iTamCod2    := FCdsParamOrc.FieldByName('TAMCOD2').AsInteger;
       iTamCod3    := FCdsParamOrc.FieldByName('TAMCOD3').AsInteger;
       iTamCod4    := FCdsParamOrc.FieldByName('TAMCOD4').AsInteger;
       iTamCod5    := FCdsParamOrc.FieldByName('TAMCOD5').AsInteger;
       iTamCod7    := FCdsParamOrc.FieldByName('TAMCOD7').AsInteger;
       iTamCod8    := FCdsParamOrc.FieldByName('TAMCOD8').AsInteger;

       iTamCod     := iTamCod1 + iTamCod2 + iTamCod3 + iTamCod4 + iTamCod5 + iTamCod7 + iTamCod8;

       strSQL :=
       'SELECT '                                                                + #13 +
       '   ' + QuotedStr(StringOfChar(' ', iTamCod)) + ' AS CODIGO, '           + #13 +
       '   ' + QuotedStr(StringOfChar(' ', 12)) + ' AS CODGRUPOORCAMEN, '       + #13 +
       '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS CODCENTROCUSTO, '        + #13 +
       '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS CODEXTERNOCC, '          + #13 +
       '   ' + QuotedStr(StringOfChar(' ', 10)) + ' AS UNECODIGO, '             + #13 +
       '   ' + QuotedStr(StringOfChar(' ',  2)) + ' AS CODPLANO, '              + #13 +
       '   ' + QuotedStr(StringOfChar(' ',  2)) + ' AS CODPATRO, '              + #13 +
       '   ' + QuotedStr(StringOfChar(' ',  2)) + ' AS IDPROGRAMAORCAMEN, '     + #13 +
       '   ' + QuotedStr(StringOfChar(' ',  2)) + ' AS IDTIPO_DEPESAORCAMEN, '  + #13 +
       '0.00 AS IDGRUPOORCAMEN, '                                               + #13 +
       '0.00 AS UNIDNEGOC, '                                                    + #13 +
       '0.00 AS IDPLANOPREV, '                                                  + #13 +
       '0.00 AS IDPATRO '                                                       + #13 +
       'FROM '                                                                  + #13 +
       '   DUAL '                                                               + #13 +
       'WHERE '                                                                 + #13 +
       '   1 = 2 ';

       FcdsCodigo.Data := GetDataPacket(strSQL);
       //-----------------------------------------------------------------------

       // ----------------------------------------------------------------------
       // 2) 6 loops aninhados, por Centro de Custo, Ativ/Projeto, Plano e Patro
       //    Cada iteração vai produzir um código único, e os parâmetros da
       //    conta seguirão o código
       // ----------------------------------------------------------------------

       iQuant := FcdscCusto.RecordCount   * FcdsPlano.RecordCount *
                 FcdsPatro.RecordCount    * FcdsAtividadeProjeto.RecordCount *
                 FcdsPrograma.RecordCount * FcdsTipoDespesa.RecordCount;
       iPos   := 0;

       //Centro de Custa
       FcdscCusto.First;
       while not(FcdscCusto.EOF) do
       begin
          //Atividade de Projeto
          FcdsAtividadeProjeto.First;
          while not(FcdsAtividadeProjeto.EOF) do
          begin

             //Plano Previdenciário
             FcdsPlano.First;
             while not(FcdsPlano.EOF) do
             begin

                //Patrocinador
                FcdsPatro.First;
                while not(FcdsPatro.EOF) do
                begin
                     //Programa
                     FcdsPrograma.First;
                     while not(FcdsPrograma.EOF) do
                     begin
                          //Tipo de Despesa
                          FcdsTipoDespesa.First;
                          while not(FcdsTipoDespesa.EOF) do
                          begin

                               inc(iPos);

                               FcdsCodigo.Append;
                               FcdsCodigo.FieldByName('CODGRUPOORCAMEN').AsString        := CodGrupoOrcamen;
                               FcdsCodigo.FieldByName('CODEXTERNOCC').AsString           := FcdscCusto.FieldByName('CODEXTERNO').AsString;
                               FcdsCodigo.FieldByName('UNECODIGO').AsString              := FcdsAtividadeProjeto.FieldByName('UNECODIGO').AsString;
                               FcdsCodigo.FieldByName('CODPLANO').AsString               := FcdsPlano.FieldByName('CODORCAMENTO').AsString;
                               FcdsCodigo.FieldByName('CODPATRO').AsString               := FcdsPatro.FieldByName('CODORCAMENTO').AsString;
                               FcdsCodigo.FieldByName('IDGRUPOORCAMEN').AsFloat          := IDGrupoOrcamen;
                               FcdsCodigo.FieldByName('CODCENTROCUSTO').AsString         := FcdscCusto.FieldByName('CODCENTROCUSTO').AsString;
                               FcdsCodigo.FieldByName('UNIDNEGOC').AsFloat               := FcdsAtividadeProjeto.FieldByName('UNIDNEGOC').AsFloat;
                               FcdsCodigo.FieldByName('IDPLANOPREV').AsFloat             := FcdsPlano.FieldByName('IDPLANOPREV').AsFloat;
                               FcdsCodigo.FieldByName('IDPATRO').AsFloat                 := FcdsPatro.FieldByName('IDPESSOA').AsFloat;
                               FcdsCodigo.FieldByName('IDPROGRAMAORCAMEN').AsString      := FcdsPrograma.FieldByName('IDPROGRAMAORCAMEN').AsString;
                               FcdsCodigo.FieldByName('IDTIPO_DEPESAORCAMEN').AsString   := FcdsTipoDespesa.FieldByName('IDTIPO_DEPESAORCAMEN').AsString;
                               FcdsCodigo.Post;

                               FcdsTipoDespesa.Next;
                          end;// while not(CdsTipoDespesaSel.EOF)
                          FcdsPrograma.Next;
                     end; // while not(CdsProgramaSel.EOF)
                     FcdsPatro.Next;
                end;  // while not(CdsPTSel.EOF)
                FcdsPlano.Next;
             end;  // while not(CdsPPSel.EOF)
             FcdsAtividadeProjeto.Next;
          end;  // while not(CdsAPSel.EOF)
          FcdscCusto.Next;
       end;  // while not(CdsCCSel.EOF)

       //-----------------------------------------------------------------------

       // ----------------------------------------------------------------------
       // 3) Define a composição do código
       // ----------------------------------------------------------------------

       // Alterado por Arnaldo V. Scarin em 08/09/2009
       // Sol: 123436 Kintana: 616983
       // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
       // informar as contas de centro de custos quando o flag de centro de custos estiver
       // desmarcado.
       case iTipoCod1 of
          1: sCampo1 := 'CODGRUPOORCAMEN';
          2: begin
               sCampo1 := 'CODEXTERNOCC';
               iPosCC  := 1;
             end;
          3: sCampo1 := 'UNECODIGO';
          4: sCampo1 := 'CODPLANO';
          5: sCampo1 := 'CODPATRO';
          7: sCampo1 := 'IDPROGRAMAORCAMEN';
          8: sCampo1 := 'IDTIPO_DEPESAORCAMEN';
       end;

       // Alterado por Arnaldo V. Scarin em 08/09/2009
       // Sol: 123436 Kintana: 616983
       // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
       // informar as contas de centro de custos quando o flag de centro de custos estiver
       // desmarcado.
       case iTipoCod2 of
          1: sCampo2 := 'CODGRUPOORCAMEN';
          2: begin
               sCampo2 := 'CODEXTERNOCC';
               iPosCC  := 2;
             end;
          3: sCampo2 := 'UNECODIGO';
          4: sCampo2 := 'CODPLANO';
          5: sCampo2 := 'CODPATRO';
          7: sCampo2 := 'IDPROGRAMAORCAMEN';
          8: sCampo2 := 'IDTIPO_DEPESAORCAMEN';
       end;

       // Alterado por Arnaldo V. Scarin em 08/09/2009
       // Sol: 123436 Kintana: 616983
       // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
       // informar as contas de centro de custos quando o flag de centro de custos estiver
       // desmarcado.
       case iTipoCod3 of
          1: sCampo3 := 'CODGRUPOORCAMEN';
          2: begin
               sCampo3 := 'CODEXTERNOCC';
               iPosCC  := 3;
             end;
          3: sCampo3 := 'UNECODIGO';
          4: sCampo3 := 'CODPLANO';
          5: sCampo3 := 'CODPATRO';
          7: sCampo3 := 'IDPROGRAMAORCAMEN';
          8: sCampo3 := 'IDTIPO_DEPESAORCAMEN';
       end;

       // Alterado por Arnaldo V. Scarin em 08/09/2009
       // Sol: 123436 Kintana: 616983
       // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
       // informar as contas de centro de custos quando o flag de centro de custos estiver
       // desmarcado.
       case iTipoCod4 of
          1: sCampo4 := 'CODGRUPOORCAMEN';
          2: begin
               sCampo4 := 'CODEXTERNOCC';
               iPosCC  := 4;
             end;
          3: sCampo4 := 'UNECODIGO';
          4: sCampo4 := 'CODPLANO';
          5: sCampo4 := 'CODPATRO';
          7: sCampo4 := 'IDPROGRAMAORCAMEN';
          8: sCampo4 := 'IDTIPO_DEPESAORCAMEN';
       end;

       // Alterado por Arnaldo V. Scarin em 08/09/2009
       // Sol: 123436 Kintana: 616983
       // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
       // informar as contas de centro de custos quando o flag de centro de custos estiver
       // desmarcado.
       case iTipoCod5 of
          1: sCampo5 := 'CODGRUPOORCAMEN';
          2: begin
               sCampo5 := 'CODEXTERNOCC';
               iPosCC  := 5;
             end;
          3: sCampo5 := 'UNECODIGO';
          4: sCampo5 := 'CODPLANO';
          5: sCampo5 := 'CODPATRO';
          7: sCampo5 := 'IDPROGRAMAORCAMEN';
          8: sCampo5 := 'IDTIPO_DEPESAORCAMEN';
       end;

       case iTipoCod7 of
          1: sCampo7 := 'CODGRUPOORCAMEN';
          2: begin
               sCampo7 := 'CODEXTERNOCC';
               iPosCC  := 7;
             end;
          3: sCampo7 := 'UNECODIGO';
          4: sCampo7 := 'CODPLANO';
          5: sCampo7 := 'CODPATRO';
          7: sCampo7 := 'IDPROGRAMAORCAMEN';
          8: sCampo7 := 'IDTIPO_DEPESAORCAMEN';
       end;

       //Campo 8
       case iTipoCod8 of
          1: sCampo8 := 'CODGRUPOORCAMEN';
          2: begin
               sCampo8 := 'CODEXTERNOCC';
               iPosCC  := 8;
             end;
          3: sCampo8 := 'UNECODIGO';
          4: sCampo8 := 'CODPLANO';
          5: sCampo8 := 'CODPATRO';
          7: sCampo8 := 'IDPROGRAMAORCAMEN';
          8: sCampo8 := 'IDTIPO_DEPESAORCAMEN';
       end;
       
       //Verifica se a regra da formação da conta orçamentária
       If (sCampo1 = '') or (sCampo2 = '') or (sCampo3 = '') or
          (sCampo4 = '') or (sCampo5 = '') or (sCampo7 = '') or
          (sCampo8 = '') then
       begin
         Beep;
         Raise Exception.Create('O sistema não pode gerar as contas orçamentárias pois ' + #13 +
                                'a regra de formação de contas orçamentárias está incompleta.' + #13 +
                                'Favor completar a regra de formação da contas orçamentária em: ' + #13 + #13 +
                                'Principal -> Parâmetros do Sistema -> Aba Contas Orçamentárias');
         Exit;                             
       end;
       //-----------------------------------------------------------------------

       //-----------------------------------------------------------------------
       // 4) Itera pelo FcdsCodigo, compondo o código final
       //-----------------------------------------------------------------------

       iPos := 0;
       FcdsCodigo.First;

       while not(FcdsCodigo.EOF) do
       begin
             inc(iPos);

             FcdsCodigo.Edit;

             //Determina se no código da conta orçamentária terá o código
             //do centro de custo de "XXXX"
             if (Trim(FcdsCodigo.FieldByName('CODCENTROCUSTO').AsString) <> 'X') then
               sCodigoConta := CompletaInicio(FcdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                               CompletaInicio(FcdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                               CompletaInicio(FcdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                               CompletaInicio(FcdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                               CompletaInicio(FcdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                               CompletaInicio(FcdsCodigo.FieldByName(sCampo7).AsString, '0', iTamCod7) +
                               CompletaInicio(FcdsCodigo.FieldByName(sCampo8).AsString, '0', iTamCod8)
             else
             begin
               //Preenchando Código e Centro de Custos
               Case iPosCC of
                 1: sCodigoConta := StringOfChar('X', iTamCod1) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo7).AsString, '0', iTamCod7) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo8).AsString, '0', iTamCod8);

                 2: sCodigoConta := CompletaInicio(FcdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                    StringOfChar('X',iTamCod2) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo7).AsString, '0', iTamCod7) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo8).AsString, '0', iTamCod8);

                 3: sCodigoConta := CompletaInicio(FcdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                    StringOfChar('X',iTamCod3) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo7).AsString, '0', iTamCod7) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo8).AsString, '0', iTamCod8);

                 4: sCodigoConta := CompletaInicio(FcdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                    StringOfChar('X',iTamCod4) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo7).AsString, '0', iTamCod7) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo8).AsString, '0', iTamCod8);

                 5: sCodigoConta := CompletaInicio(FcdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                    StringOfChar('X', iTamCod5) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo7).AsString, '0', iTamCod7) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo8).AsString, '0', iTamCod8);

                 7: sCodigoConta := CompletaInicio(FcdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                                    StringOfChar('X',iTamCod7) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo8).AsString, '0', iTamCod8);


                 8: sCodigoConta := CompletaInicio(FcdsCodigo.FieldByName(sCampo1).AsString, '0', iTamCod1) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo2).AsString, '0', iTamCod2) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo3).AsString, '0', iTamCod3) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo4).AsString, '0', iTamCod4) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo5).AsString, '0', iTamCod5) +
                                    CompletaInicio(FcdsCodigo.FieldByName(sCampo7).AsString, '0', iTamCod7) +
                                    StringOfChar('X',iTamCod8);
               end;
             end;

             FcdsCodigo.FieldByName('CODIGO').AsString  := sCodigoConta;

             FcdsCodigo.Post;
             FcdsCodigo.Next;
          end;

          //Tudo OK
          Result := true;
end;

procedure TCtrlCadContasContabilPorGrupo.PreencherContasDesvinculadas;
var
  cds:TClientDataSet;
begin
  TRY

     cds                      := TClientDataSet.Create(Application); 
     FlstContas_Desvinculadas := TStringList.Create;

     //Seleciona as contas contábeis do grupo
     strSQL := 'SELECT  DISTINCT ' +
               '       PL.DESCPLANO,PC.PLANO,PC.PLACONTA,PC.PLANOME,PC.PLATIPO ' +
               ' FROM CONTASORCAMEN CO ' +
               'JOIN ' +
               '        COMPCONTASORCAMEN  CC ' +
               'ON ' +
               '        CO.IDCONTAORCAMEN = CC.IDCONTAORCAMEN ' +
               'JOIN ' +
               '        PLANOCONTA PC ' +
               'ON ' +
               '        PC.PLANO = CC.PLANO ' +
               '        AND PC.PLACONTA = CC.PLACONTA ' +
               'JOIN ' +
               '        PLANO PL ' +
               'ON ' +
               '        PL.PLANO = PC.PLANO ' +
               'WHERE ' +
               '        CO.IDGRUPOORCAMEN = ' + IntToStr(FIdGrupoOrcamen);
     cds.Data := GetDataPacket(strSQL);

     if cds.IsEmpty then Exit;
     cds.First;

     while not cds.eof Do
     begin
          //Ricardo de Freitas SOL: 168202 KINTANA: 1480546 - comentado
          //if lstContas.IndexOf(cds.fieldbyname('PLACONTA').asString) > -1  then
          FlstContas_Desvinculadas.Add(cds.fieldbyname('PLACONTA').asString);

          cds.next;
     end;

     cds.CLose;

  FINALLY
    if cds.Active then cds.Close;
    FreeAndNil(cds);
  end;
end;

procedure TCtrlCadContasContabilPorGrupo.SetCdsCentroDeCusto(
  const Value: TClientDataSet);
begin
  FCdsCentroDeCusto := Value;
end;

procedure TCtrlCadContasContabilPorGrupo.SetCodGrupoOrcamen(
  const Value: string);
begin
  FCodGrupoOrcamen := Value;
end;

procedure TCtrlCadContasContabilPorGrupo.SetDescrGrupoOrcamen(
  const Value: string);
begin
  FDescrGrupoOrcamen := Value;
end;

procedure TCtrlCadContasContabilPorGrupo.SetidAnoOrcamento(
  const Value: string);
begin
  FidAnoOrcamento := Value;
end;

procedure TCtrlCadContasContabilPorGrupo.SetIdGrupoOrcamen(
  const Value: integer);
begin
  FIdGrupoOrcamen := Value;
end;

procedure TCtrlCadContasContabilPorGrupo.SetidPlanoContas(
  const Value: string);
begin
  FidPlanoContas := Value;
end;

procedure TCtrlCadContasContabilPorGrupo.SetidPlanoOrcamento(
  const Value: string);
begin
  FidPlanoOrcamento := Value;
end;

procedure TCtrlCadContasContabilPorGrupo.SetlstContas(
  const Value: TStringList);
begin
  FlstContas := Value;
end;

function TCtrlCadContasContabilPorGrupo.VerificarContaOrcamen(
  strContaorcamen: string): boolean;
begin

     FcdsAux.Close;
     
     strSQL := '';
     strSQL := ' SELECT NVL(COUNT(*),0) AS TOTAL FROM CONTASORCAMEN ' +
               ' WHERE ' +
               ' IDGRUPOORCAMEN = '     + IntToStr(IdGrupoOrcamen) +
               ' AND IDPLANOORCAMEN = ' + idPlanoOrcamento +
               ' AND IDCONTAORCAMEN = ' + QuotedStr(strContaorcamen);
     FcdsAux.Data := GetDataPacket(strSQL);

     if FcdsAux.IsEmpty then
        Result := false
     else
        Result := (FcdsAux.fieldbyname('TOTAL').AsInteger > 0);
end;

function TCtrlCadContasContabilPorGrupo.Vincular: boolean;
begin
     Result := false;

     TRY
        //Parâmetro de orcamento
        FcdsParamOrc.Data         :=  GetDataPacket('SELECT * FROM PARAMORCAMENTO');

        //Carregar parâmetros
        if not CarregarParametros() then raise Exception.Create('Não foi possível carregar os parâmetros.');

        //Realizar Montagem de contas orçamentárias,
        //conforme parâmetro de orçamento
        if not MontarCodigoOrcamentario() then raise Exception.Create('Não foi montar os códigos das contas orçamentárias.');

        //Excluir Todas as Composições de Contas do Grupo orçamentário
        if not ExcluirComContasorcamen() then raise Exception.Create('Não foi possível excluir os vínculo com a contabilidade existente.');

        //Criar composição de conta espelho
        if not CriarCompContaEspelho(true) then raise Exception.Create('Não foi criar a conta espelho.');

        //Inserir as composições de contas
        if not InserirCompContas() then raise Exception.Create('Ocorreu erro ao vincular grupo orçamentário na cotnabilidade.');

        //Destrouir composição de conta espelho
        CriarCompContaEspelho(false);

        Result := true;

     FINALLY
        //Anda o form progresso
        DoProgresso(['',2,0,0,0]);
     end;

end;

procedure TCtrlCadContasContabilPorGrupo.VincularContaContabilVazia;
var
  c:integer;
  cds:TClientDataSet;
begin
  TRY
     cds := TClientDataSet.Create(Application);
     strSQL := 'SELECT DISTINCT PLANO,PLACONTA FROM COMPCONTASORCAMEN ' +
               'WHERE IDCONTAORCAMEN IN ( ' +
               'SELECT DISTINCT IDCONTAORCAMEN FROM CONTASORCAMEN WHERE IDGRUPOORCAMEN = ' +
               IntToStr(FIdGrupoOrcamen) + ') AND IDCONTAORCAMEN <> ' +  QuotedStr('-1') ;
     cds.Data := GetDataPacket(strSQL);

     if cds.IsEmpty then Exit;

     for c:= 0 to FlstContas.Count - 1 Do
     begin

        if not cds.Locate('PLACONTA',FlstContas[c],[]) then
        begin
            //Vincula conta contábil vazia (que nã possu planosaldo)
            strSQL := ' INSERT INTO COMPCONTASORCAMEN ' +
                      ' (IDPLANOORCAMEN, ' +
                      ' IDCOMPCONTASORC, ' +
                      ' PLANO, ' +
                      ' PLACONTA, ' +
                      ' IDCONTAORCAMEN) ' +
                      ' ( ' +
                      ' SELECT ' +
                      ' IDPLANOORCAMEN , ' +
                      ' SEQCOMPCONTASORCAMEN.NEXTVAL AS IDCOMPCONTASORC, ' +
                      FidPlanoContas +  ' AS PLANO, '  +
                      FlstContas[c] +  ' AS PLACONTA, ' +
                      ' IDCONTAORCAMEN ' +
                      ' FROM CONTASORCAMEN WHERE IDGRUPOORCAMEN = ' + IntToStr(FIdGrupoOrcamen) +
                      ' ) ';

            ExecSQL(strSQL);
            FLogInclusao.Add(FormatDateTime('hh:nn:ss', Now) + ' - ContaID: ' + CompletaFIM(FlstContas[c], ' ', 40) + ' - ' + 'Vinculação contábil(vazia) realizada.');
        end;
     end;

  finally
     if cds.Active then cds.Close;
     FreeAndNil(cds);
  end;
end;

end.
