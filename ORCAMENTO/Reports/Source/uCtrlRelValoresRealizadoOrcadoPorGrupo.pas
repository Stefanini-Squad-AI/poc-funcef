// Alterações:
{-------------------------------------------------------------------------------------------------
Autor.........: Wylliam Leite da Silva
Data..........: 19/03/2015
Nº SOL........: 250685
Nº PPM........: 716016
Rotina........: AjustarDadoslayout, InsereRelat, PreencherGrupoorcamenAnaliticoVazio,
                TotalizarGrupos 
Descrição.....: Correção na rotina de geração dos relatório de Orçamento.
                Correção das casas decimais no percentual nos campos de variação.
--------------------------------------------------------------------------------------------------
// Autor.........: Felipe Azevedo dos Santos
// Data..........: 27/05/2013
// Nº SOL........: 190485
// Nº KINTANA....: 1929913
// Rotina........: MontaSQLPorRelatorio
// Descrição.....: inclusão da tabela Alterorcamento relacionando a mesma com a saldoorcado para
                   filtrar a saldoorcado de acordo com o filtro escolhido nos relatórios orcados x
                   grupos 
--------------------------------------------------------------------------------------------------
// Autor.........: Edilaine Ferraresi
// Data..........: 03/08/2012
// Nº SOL........: 189231
// Nº KINTANA....: 1786548
// Rotina........: MontaSQLPorRelatorio
// Descrição.....: ajusta para relatorio nao considerar contas inativas
--------------------------------------------------------------------------------------------------
// Autor.........: Edilaine Ferraresi
// Data..........: 23/08/2012
// Nº SOL........: 188338
// Nº KINTANA....: 1775147
// Rotina........: RetornastrMes, MontaSQLPorRelatorio, MontaPeriodosBDxCDS
// Descrição.....: ajusta para relatorio orcado x realizado atividadeeto proj e o
                   cabeçalho das colunas qdo selecionar um intervalo não iniciando em jan
--------------------------------------------------------------------------------------------------
// Autor.........: Helen V. Bianchi
// Data..........: 16/08/2012
// Nº SOL........: 187759
// Nº KINTANA....: 1768178
// Rotina........: MontaSQLPorRelatorio
// Descrição.....: Não estava passando o Parametro corretamente
--------------------------------------------------------------------------------------------------
// Autor.........: Marcio Sanches Spinosa
// Data..........: 18/04/2012
// Nº SOL........: 172383/9181
// Nº KINTANA....: 1640404
// Rotina........: MontaSQLPorRelatorio
// Descrição.....: Alteração em selects para que apareçam os grupos sinteticos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Autor.........: Edilaine Ferraresi
// Data..........: 17/01/2012
// Nº SOL........: 170798
// Nº KINTANA....: 1546958
// Rotina........: MontaSQLPorRelatorio
// Descrição.....: Implementado sql's reestruturadas para gerar relatório Realizado x Orçado
                   por Grupo
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo Silva
// Data..........: 12/12/2011
// Nº SOL........: 166068
// Nº KINTANA....: 1448134
// Rotina........: AjustarDadoslayout
// Descrição.....: Implementado rotina que reindexa\organiza dados conforme os novos layouts
                   de valores realizadox X Orçados
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: MontaSQL
Nº SOL......: 170461
Nº KINTANA..: 1516952
Data........: 14/12/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Correção do filtro de plano orçamentário
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: Toda control
Nº SOL......: 159242/6041
Nº KINTANA..: 1385831
Data........: 31/06/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: CLASSE CONTROLE DE GERAÇÃO DE RELATÓRIOS DE VALORES REALZIADOS E ORCADOS POR GRUPO

    //Parametros de Relatório
    00 - Plano orçamentário
    01 - Exercício
    02 - Período Inicial
    03 - Período Final
    04 - Período Orçado
    05 - Grupo Inicial
    06 - Grupo Final
    07 - Posição Inicial de Grupo
    08 - Posição Final de Grupo
    09 - Centro de Responsabilidade
    10 - Moeda
    11 - Grau
    12 - Cenário
    13 - Considerar Valores
    14 - Indicar valore negativos por ( 0 - parênteses  1 - hífen)
    15 - Usuário por centro de
    16 - Imprimir Valores Zerados
    17 - Centro de Custa
    18 - Atividade / projeto
    19 - Plano Previdenciário
    20 - Patrocinadora
    21 - Programa
    22 - Tipo de Despesa
    23 - Caminho do Excel
------------------------------------------------------------------------------------------------}

unit uCtrlRelValoresRealizadoOrcadoPorGrupo;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, wwQuery, provider,
  Classes, uDbContasOrcamen,  uCMTypes, uFuncoesOrcamento,Windows, Messages, Graphics,
  Controls, Forms, Dialogs, FileCtrl, ComObj,Gauges,uSistema,uCMClientDataSet, uCtrlPadroes,
  uCtrlCadGrupos,DBaseDados,StdCtrls, uCmSqlParams, uDbDataView, uReccodigo, ComCtrls, Math,
  DBTables,CmParamReport,uData, uFuncaoGeral, uModulo, uMensErro, uString, mPlanoOrcamentarioMT{,fDepuraCDS};


const
   Letras : array[1..52] of string = (
   'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q',
   'R','S','T','U','V','W','X','Y','Z',
   'AA','AB','AC','AD','AE','AF','AG','AH',
   'AI','AJ','AK','AL','AM','AN','AO','AP',
   'AQ','AR','AS','AT','AU','AV','AW','AX',
   'AY','AZ'
   );

type

  //Tipos de Relatório
  TTipoRelValoresRealizadoOrcadoPorGrupo = (trGrupo,trGrupoCentroCusta,trGrupoCentroResponsabilidade,
                                           trGrupoAtividadeProjeto);

  TCtrlRelValoresRealizadoOrcadoPorGrupo = class(TCmControlObject)
  private
    slstInativa, slstAtiva : TStringList;    //Edilaine - SOL 189231 / KTN 1786548
    Periodo_Ini,Periodo_Fim:integer;
    FTipoRelatorio: TTipoRelValoresRealizadoOrcadoPorGrupo;
    FParametros: TCmParamReport;
    FcdsRelatPeriodo: TClientDataSet;
    sSQL: TStringList;
    FcdsCompSaldo: TClientDataSet;
    FcdsRelatGrupo: TClientDataSet;
    Excel,Sheet :Variant;
    FParametrosUtilizados: TStringList;
    FcdsRelatlayout: TClientDataSet;
    FidReport: Integer;
    procedure SetTipoRelatorio(const Value: TTipoRelValoresRealizadoOrcadoPorGrupo);
    procedure SetParametros(const Value: TCmParamReport);
    procedure SetcdsRelatPeriodo(const Value: TClientDataSet);
    procedure SetcdsCompSaldo(const Value: TClientDataSet);
    procedure SetcdsRelatGrupo(const Value: TClientDataSet);
    procedure SetParametrosUtilizados(const Value: TStringList);
    procedure SetcdsRelatlayout(const Value: TClientDataSet);

    //Monta Clientdatset de períodos
    procedure MontaPeriodosBDxCDS;

    //Realiza a Montagem do SQL do relatório
    procedure MontaSQL;
    procedure MontaSQLPorRelatorio;  // Edilaine Ferraresi - SOL 170798 / KTN 1546958

    //Monta clientedataset que irá armazenar a consulta principal
    procedure MontaGrupoCDS;
    //Retorna o Índice do Período do clientDataset de Período
    function  RetornaIndicePeriodoCDS(iPeriodo:integer; var TipoPeriodo:string):integer;
    //Verifica se imprimirMes no EXCEL
    function ImprimirMesXLS(iPeriodo:integer):Boolean;
    //Insere valores com formatação da célula na exportação do Excel
    function  InsereValorXLS(strCelula:string;vlConteudo:currency):boolean;  overload;
    function  InsereValorXLS(strCelula:string;vlConteudo:string):boolean; overload;
    //Insere dados do cliente dataset principal da consulta do relatório
    procedure InsereRelat(strCodigoGrupo,strNomeGrupo,strFlgAnalSint,strParametro:string;
                          iExercicio,Iperiodo:integer;VlrOrcado,VlrRealizado:Currency);

    //Calcula os Totais  de Grupos Orçamentários Sintéticos
    function TotalizarGrupoSintetico():boolean;
    //Insere registro de grupos Analíticos totalizado devido a rotina de agrupamento
    //dos relatório
    function PreencherGrupoorcamenAnaliticoVazio:Boolean;
    //Métod interno de montagem de sumário de filtros utilizados
    function RetornarListaFiltrosUtilizados(strSQL:string): String;
    //Calcula totais de todos os grupos
    function TotalizarGrupos():Boolean;

    //Passa registro de um ClientDataSet para outro
    procedure CadastraCDS(ID:integer;cdsOrigem,cdsDestino:TClientDataSet);


    //Ajustar dados no layout dos relatórios
    function  AjustarDadoslayout():Boolean;

    function  iif(c: boolean; a, b: string): string; // Edilaine - SOL 188338 / KTN 1775147
    procedure SetidReport(const Value: Integer); // Felipe A. Santos SOL 190485 Kintana 1929913

  public
        constructor Create; override;
        destructor  Destroy;  override;

        //Tipo de Relatório
        property  TipoRelatorio:TTipoRelValoresRealizadoOrcadoPorGrupo read FTipoRelatorio write SetTipoRelatorio;
        //Parâmetros do relatório
        property  Parametros: TCmParamReport read FParametros write SetParametros;
        //Clientdataset de Períodos
        property  cdsRelatPeriodo: TClientDataSet read FcdsRelatPeriodo write SetcdsRelatPeriodo;
        //Clientdataset Principal que armazena os dados da Consulta Principal
        property  cdsRelatGrupo:TClientDataSet read FcdsRelatGrupo write SetcdsRelatGrupo;
        //Clientdataset que armazena os dados sa Consulta Prinicpal conforme o layout dos relatórios
        property  cdsRelatlayout:TClientDataSet read FcdsRelatlayout write SetcdsRelatlayout;
        //SQL gerado para realiza a consulta
        property  SQL:TStringList read sSQL;
        //Lista de parâmetros utilziados (para Sumário de Relatórios)
        property  ParametrosUtilizados:TStringList read FParametrosUtilizados write SetParametrosUtilizados;
        // Idreport do relatório
        property idReport : Integer read FidReport write SetidReport; // Felipe A. Santos SOL 190485 KTN 1929913
        
        //Exportação para o Excel
        function  GerarExcel(strCaminho:string):boolean;
        //Monta o Relatório (função principal)
        function MontaRelatorio:OleVariant;
        //Retorna o mês poe extenso (string)
        function  RetornastrMes(iPeriodo:integer; const bAbrevidado : boolean = true):string;    // Edilaine - SOL 188338 / KTN 1775147
        //Monta um sumário dos filtros utilizados
        function MontarFiltrosUtilizadosSumario:Boolean;
        // verifica se o grupo está ativo antes de imprimir
        function  VerificaGrupoAtivo(bAnalitico : boolean; sGrupo, sPlanoOrc : string) : boolean;  //Edilaine - SOL 189231 / KTN 1786548
        procedure LimpaListas;  //Edilaine - SOL 189231 / KTN 1786548

  end;

implementation

{ TCtrlRelValoresRealizadoOrcadoPorGrupo }

function TCtrlRelValoresRealizadoOrcadoPorGrupo.AjustarDadoslayout: Boolean;
var
   tot_grupo_pag:Integer; //total de grupos por página
   codgrupoorc,parametro:string;
   Pass,Id,id_ultimo_gerado,ult_vez:integer;
   total_reg,vezes,periodo,i,c:integer;
   IdGrupoUlt:integer;
   cdsRepositorio,cdsRange:TClientDataSet;
   bCadastraRegistrosVazios:Boolean;
   vlrorcado_total,vlrrealizado_total:Currency;
begin

   Result := false;

   MostraStatusRelatGrupo('Organizando dados conforme layout de relatório.');

   //Acerta CLientDataset
   cdsRelatlayout.EmptyDataSet;
   cdsRange         := TClientDataSet.Create(Application);
   cdsRepositorio := TClientDataSet.Create(Application);

   cdsRange.Data := cdsRelatlayout.Data;
   cdsRange.EmptyDataSet;
   cdsRepositorio.Data := cdsRange.Data;
   cdsRelatGrupo.First;

   codgrupoorc   := '';
   parametro     := '';
   tot_grupo_pag := 29;

   TRY
      //1. Separação de períodos, um registro que contém todos os registros deverá
      //ser quebrado em vários registro, tendo cada registro 4 períodos
      //------------------------------------------------------------------------
      while not cdsRelatGrupo.eof Do
      begin
            MostraStatusRelatGrupo( 'Organizando dados - separação de períodos (' +  intTostr(cdsRelatGrupo.Recno)  + '/' +
                                     intTostr(cdsRelatGrupo.Recordcount)   +  ') ...');

            if (codgrupoorc <> cdsRelatGrupo.fieldbyname('CODGRUPOORC').AsString) or
               (parametro   <> cdsRelatGrupo.fieldbyname('PARAMETRO').AsString)   then
            begin
              c := 1;

              vlrorcado_total      := 0;
              vlrrealizado_total   := 0;

              codgrupoorc := cdsRelatGrupo.fieldbyname('CODGRUPOORC').AsString;
              parametro   := cdsRelatGrupo.fieldbyname('PARAMETRO').AsString;


              while c <= 12 Do
              begin
                   if (cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',c)).AsString <> '') and
                      (cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',c) ).AsInteger > 0) then
                   begin
                        //Insere
                        cdsRelatlayout.Append;
                        cdsRelatlayout.FieldByName('CODGRUPOORC').AsString      := cdsRelatGrupo.FieldByName('CODGRUPOORC').AsString;
                        cdsRelatlayout.FieldByName('NOMEGRUPOORCAMEN').AsString := cdsRelatGrupo.FieldByName('NOMEGRUPOORCAMEN').AsString;
                        cdsRelatlayout.FieldByName('FLGANALSINT').AsString      := cdsRelatGrupo.FieldByName('FLGANALSINT').AsString;
                        cdsRelatlayout.FieldByName('PARAMETRO').AsString        := cdsRelatGrupo.FieldByName('PARAMETRO').AsString;

                        //Preenche meses em 4 períodos por vez
                        for i:= 0 to 4 - 1 Do
                        begin
                             //if (c + i) <= Periodo_Fim then                   //Edilaine - SOL 189231 / KTN 1786548 - comentado
                             if (c + i) <= ((Periodo_Fim-Periodo_Ini)+1) then   //Edilaine - SOL 189231 / KTN 1786548
                             begin
                                cdsRelatlayout.FieldByName('EXE'  + FormatFloat('00',i + 1) ).AsInteger        := cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',c + i) ).AsInteger;
                                cdsRelatlayout.FieldByName('PER'  + FormatFloat('00',i + 1) ).AsInteger        := cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',c + i) ).AsInteger;
                                cdsRelatlayout.FieldByName('ORC'  + FormatFloat('00',i + 1) ).AsCurrency       := cdsRelatGrupo.FieldByName('ORC'  + FormatFloat('00',c + i) ).AsCurrency;
                                cdsRelatlayout.FieldByName('REA'  + FormatFloat('00',i + 1) ).AsCurrency       := cdsRelatGrupo.FieldByName('REA'  + FormatFloat('00',c + i) ).AsCurrency;
                                cdsRelatlayout.FieldByName('VAR'  + FormatFloat('00',i + 1) ).AsString         := cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',c + i) ).AsString;
                                cdsRelatlayout.FieldByName('PERIODO_DESCR' + FormatFloat('00',i + 1)).AsString := cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',c + i)).AsString;

                                //Soma total
                                vlrorcado_total      := vlrorcado_total    + cdsRelatGrupo.FieldByName('ORC'  + FormatFloat('00',c + i) ).AsCurrency;
                                vlrrealizado_total   := vlrrealizado_total + cdsRelatGrupo.FieldByName('REA'  + FormatFloat('00',c + i) ).AsCurrency;
                             end;
                        end;

                        //Totalização
                        cdsRelatlayout.FieldByName('ORC_TOTAL').AsCurrency := vlrorcado_total;
                        cdsRelatlayout.FieldByName('REA_TOTAL').AsCurrency := vlrrealizado_total;
                        if (vlrorcado_total > 0) and (vlrrealizado_total > 0) then
                            cdsRelatlayout.FieldByName('VAR_TOTAL').AsString := formatfloat('###,###,##0.00',((vlrrealizado_total / vlrorcado_total) - 1)*100) + '%' //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
                        else
                            cdsRelatlayout.FieldByName('VAR_TOTAL').AsString := '0,00%';

                        cdsRelatlayout.Post;
                   end;
                   c := c + 4;
              end;
            end;

            cdsRelatGrupo.Next;
      end;
      //------------------------------------------------------------------------

      total_reg := cdsRelatlayout.RecordCount;

      //Se não tiver registros deverá sair da rotina
      if cdsRelatlayout.IsEmpty then Exit;

      //2. Organizar dados atribuindo um ID para ordenção, respeitando o limite de registros
      //por página
      MostraStatusRelatGrupo( 'Organizando dados - atribuição de ID (' +  intTostr(cdsRelatlayout.Recno)  + '/' +
                              intTostr(cdsRelatlayout.Recordcount)   +  ') ...');

      TRY

        Pass:=1;
        id := 0;
        id_ultimo_gerado := 0;
        ult_vez          := 0;
        cdsRelatlayout.IndexFieldNames := 'PER01;CODGRUPOORC;PARAMETRO';
        cdsRelatlayout.First;


        cdsRange.filter := 'PER01 = ' +  cdsRelatlayout.fieldbyname('PER01').AsString;
        cdsRange.Filtered := true;

        while cdsRelatlayout.RecordCount > 0 Do
        begin

             MostraStatusRelatGrupo( 'Indexando (' +  intTostr(total_reg - cdsRelatlayout.RecordCount)  + '/' +
                                intTostr(total_reg)   +  ') ...');

             cdsRelatlayout.IndexFieldNames := 'PER01;CODGRUPOORC;PARAMETRO';
             cdsRelatlayout.First;
             cdsRange.EmptyDataSet;

             //Pega Range de Grupos por página
             For c:= 0 TO tot_grupo_pag - 1 Do
             begin
                 Pass:=2;
                 CadastraCDS(0,cdsRelatlayout,cdsRange);
                 cdsRelatlayout.Next;
                 if cdsRelatlayout.eof then Break;
             end;

             bCadastraRegistrosVazios := (cdsRange.RecordCount <  tot_grupo_pag);

             cdsRange.first;

             while not cdsRange.eof Do
             begin

                  if cdsRelatlayout.IsEmpty then Break;

                  Pass:=3;
                  vezes  := 0;
                  cdsRelatlayout.First;
                  id := Id + 1;
   
                 while cdsRelatlayout.Locate('CODGRUPOORC;PARAMETRO',
                                              varArrayOf([cdsRange.fieldbyname('CODGRUPOORC').AsString,
                                                cdsRange.fieldbyname('PARAMETRO').AsString]),[]) Do
                 begin
                            //Cadastra no Clientdataset de Repositório
                            Pass:=4;
                            CadastraCDS(id  + ( vezes * tot_grupo_pag),cdsRelatlayout,cdsRepositorio);
                            id_ultimo_gerado := id  + ( vezes * tot_grupo_pag);

                            vezes   := vezes + 1;
                            ult_vez := vezes;
                            Pass:=5;
                            cdsRelatlayout.Delete;
                 end;

                cdsRange.Next;
             end;

             //Caso na últiam página, a quantidade de  registros serem  menores
             //que o total de registros por página, deverá inserir registros
             //para ficar de acordo com o layout do relatório;
             if bCadastraRegistrosVazios then
             begin
                  //Cadastras registros vazios
                  cdsRange.Last;

                  codgrupoorc := cdsRange.fieldbyname('CODGRUPOORC').AsString;
                  cdsRepositorio.IndexFieldNames := 'ID';

                  //Peger último ID gerado para Grupo
                  cdsRepositorio.Filter := ' CODGRUPOORC = '   + cdsRange.fieldbyname('CODGRUPOORC').AsString +
                                           ' AND PER01 = '     + cdsRange.fieldbyname('PER01').AsString +
                                           ' AND PARAMETRO = ' + QuotedStr(cdsRange.fieldbyname('PARAMETRO').AsString) ;
                  cdsRepositorio.Filtered := True;
                  cdsRepositorio.Last;
                  id := cdsRepositorio.fieldbyname('ID').AsInteger;
                  cdsRepositorio.Filtered := false;
                  cdsRepositorio.First;
                  id := id + 1;

                  //Preenche registros com espaços vazios devido layout do relatório
                  for c:= cdsRange.RecordCount to tot_grupo_pag  Do
                  begin
                    for vezes:= 0 to ult_vez - 1  Do
                    begin
                         if not cdsRepositorio.Locate('ID', (id) + ( vezes * tot_grupo_pag), []) then
                         begin
                           cdsRepositorio.Insert;
                           cdsRepositorio.FieldByName('ID').AsInteger         := (id) + ( vezes * tot_grupo_pag);
                           cdsRepositorio.FieldByName('CODGRUPOORC').AsString := '';
                           cdsRepositorio.Post;
                           id_ultimo_gerado := (id) + ( vezes * tot_grupo_pag);
                         end;
                    end;

                    id := id + 1;

                  end;

                  bCadastraRegistrosVazios := false;

             end;

             id :=  id_ultimo_gerado;
        end;

      except
        //Exceção para os testes da Fábrica
        on E:Exception do
        begin
             ShowMessage('Erro ao Indexar registros para relatório - Passo: ' +  IntToStr(Pass) + ' - ' +
             cdsRange.fieldbyname('CODGRUPOORC').AsString + ' - ' + 
             cdsRange.fieldbyname('PARAMETRO').AsString + ' => ' +
             E.Message);

        end;
      END;

      //Tudo OK
      cdsRelatlayout.EmptyDataSet;
      cdsRelatlayout.Filtered := false;
      cdsRelatlayout.Data := cdsRepositorio.Data;
      cdsRelatlayout.IndexFieldNames := 'CODGRUPOORC;PARAMETRO;ID';
      cdsRelatlayout.First;

      Result := true;

   FINALLY
      cdsRange.Close;
      FreeAndNil(cdsRange);

      cdsRepositorio.Close;
      FreeAndNil(cdsRepositorio);

      //Indexando clientedataset conforme tipo de relatório
      if TipoRelatorio = trGrupo then
         cdsRelatlayout.IndexFieldNames := 'ID;CODGRUPOORC'
      else
         cdsRelatlayout.IndexFieldNames := 'ID;CODGRUPOORC;PARAMETRO';
   end;
end;

procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.CadastraCDS(ID:integer;
cdsOrigem,cdsDestino: TClientDataSet);
var
  F:integer;
begin
  cdsDestino.Append;
  for F:=0 to cdsOrigem.Fields.Count - 1 do
      cdsDestino.Fields[f].Value := cdsOrigem.Fields[f].Value;

  if ID > 0 then
     cdsDestino.FieldByName('ID').Asinteger := ID;
  cdsDestino.Post;
end;

constructor TCtrlRelValoresRealizadoOrcadoPorGrupo.Create;
begin
  inherited;
  sSQL := TStringList.Create;
  sSQL.Clear;

  slstInativa := TStringList.Create;   //Edilaine - SOL 189231 / KTN 1786548
  slstAtiva := TStringList.Create;     //Edilaine - SOL 189231 / KTN 1786548

  ParametrosUtilizados := TStringList.Create;
  ParametrosUtilizados.Clear;

  Periodo_Ini := 0;
  Periodo_Fim := 0;

  //Instância de ClientDataset
  FcdsRelatPeriodo    := TClientDataSet.Create(Application);
  FcdsCompSaldo       := TClientDataSet.Create(Application);
  FcdsRelatGrupo      := TClientDataSet.Create(Application);
  FcdsRelatlayout     := TClientDataSet.Create(Application);
end;

destructor TCtrlRelValoresRealizadoOrcadoPorGrupo.Destroy;
begin
  inherited;
  FreeAndNil(slstInativa);     //Edilaine - SOL 189231 / KTN 1786548
  FreeAndNil(slstAtiva);       //Edilaine - SOL 189231 / KTN 1786548
  FreeAndNil(sSQL);
  FreeAndNil(FParametrosUtilizados);
  FcdsRelatPeriodo.Close;
  FcdsCompSaldo.Close;
  FcdsRelatGrupo.Close;
  FcdsRelatlayout.Close;
end;

function TCtrlRelValoresRealizadoOrcadoPorGrupo.GerarExcel(
  strCaminho: string): boolean;
var
  strCodGrupo,strCells,Nome:string;
  linha,col,c,ind:integer;
  clTitulo:TColor;
  Inicio,Fim:integer;
begin
  Result := false;

     TRY

        //Indexando clientedataset conforme tipo de relatório
        if TipoRelatorio = trGrupo then
           cdsRelatGrupo.IndexFieldNames := 'CODGRUPOORC'
        else
           cdsRelatGrupo.IndexFieldNames := 'CODGRUPOORC;PARAMETRO';


        cdsRelatGrupo.First;

         //Nome do Arquivo
        StrCaminho := StrCaminho + '\ValoresRealizadoorcadoporGrupo_' + FormatDateTime('dd_mm_yyyy',Now) + '.xls';

        //Definicação e Cores
        clTitulo := clNavy;

        //nome da planílha
        Nome  := 'Grupos Orçamentários';
        //cria o objeto
        Excel := CreateOleObject('Excel.application');

        //Adiciona Sheet
        Excel.Workbooks.Add;
        Excel.Workbooks[1].Sheets.Add;

        //deleta as planilhas que sobraram
        Excel.WorkBooks[1].Sheets[2].Delete;
        Excel.WorkBooks[1].Sheets[2].Delete;

        //Excel.Workbooks[1].Sheets.Add;
        Excel.Workbooks[1].WorkSheets[1].Name := Nome;

        //Repassando variável
        Sheet := Excel.WorkBooks[1].WorkSheets['Grupos Orçamentários'];

        //Determina Largura das COlunas
        //Sheet.Range['A1'].ColumnWidth    := 10.71;
        //Sheet.Range['B1'].ColumnWidth    := 99.70;

        for c:= 1 to high(letras) Do
        begin
            Sheet.Range[letras[c] + '1'].ColumnWidth         := 31.71;
            //Sheet.Range[letras[c] + '1'].EntireColumn.AutoFit();
            Sheet.Range[letras[c] + '1'].HorizontalAlignment := 4; //Alinhamento para direita
        end;

        //Linha 1 e 2
        Sheet.Range['A1'] := '';
        Sheet.Range['B1'].Value := '';
        Sheet.Range['C1'].Value := '';
        Sheet.Range['A2'].Value := 'Código';
        Sheet.Range['A2'].Borders.LineStyle   := 1; //Borda
        Sheet.Range['B2'].Value := 'Grupos';
        Sheet.Range['B2'].Borders.LineStyle   := 1; //Borda

        //Preenche períodos
        cdsRelatPeriodo.First;
        col := 3;

        while not cdsRelatPeriodo.eof Do
        begin
             Sheet.Range[letras[col] + '1'].Value     := cdsRelatPeriodo.Fieldbyname('PERIODO_DESCR').AsString;

             if cdsRelatPeriodo.FieldByName('TIPO').AsString = 'O' then
                Sheet.Range[letras[col] + '1'].Interior.Color      := clRed     //Períodos Orçados
             else
                Sheet.Range[letras[col] + '1'].Interior.Color      := clTitulo; //Períodos Normal

             Sheet.Range[letras[col]     + '2'].HorizontalAlignment := 3;
             Sheet.Range[letras[col]     + '2'].Borders.LineStyle   := 1; //Borda
             Sheet.Range[letras[col]     + '2'].Value := 'ORÇADO';

             Sheet.Range[letras[col + 1] + '2'].HorizontalAlignment := 3; //Centralizado
             Sheet.Range[letras[col + 1] + '2'].Borders.LineStyle   := 1; //Borda
             Sheet.Range[letras[col + 1] + '2'].Value := 'REALIZADO';


             Sheet.Range[letras[col + 2] + '2'].HorizontalAlignment := 3;
             Sheet.Range[letras[col + 2] + '2'].Borders.LineStyle   := 1; //Borda
             Sheet.Range[letras[col + 2] + '2'].Value := 'VAR(%)';

             col := col + 3;
             cdsRelatPeriodo.Next;
        end;

        //Total
        Sheet.Range[letras[col] + '1'].Interior.Color := clTitulo; 
        Sheet.Range[letras[col] + '1'].Value          := 'TOTAL';

        Sheet.Range[letras[col]     + '2'].HorizontalAlignment := 3;
        Sheet.Range[letras[col]     + '2'].Borders.LineStyle   := 1; //Borda
        Sheet.Range[letras[col]     + '2'].Value := 'ORÇADO';

        Sheet.Range[letras[col + 1] + '2'].HorizontalAlignment := 3; //Centralizado
        Sheet.Range[letras[col + 1] + '2'].Borders.LineStyle   := 1; //Borda
        Sheet.Range[letras[col + 1] + '2'].Value := 'REALIZADO';


        Sheet.Range[letras[col + 2] + '2'].HorizontalAlignment := 3;
        Sheet.Range[letras[col + 2] + '2'].Borders.LineStyle   := 1; //Borda
        Sheet.Range[letras[col + 2] + '2'].Value := 'VAR(%)';


        //Realizar Merge das Células
        Excel.Range['C1:D1:E1'].Mergecells := True;
        Excel.Range['C1'].HorizontalAlignment := 3; //Centralizado
        Excel.Range['C1'].Font.Bold           := true; ///negrito
        Excel.Range['C1'].Font.Color          := clwhite; //cor da fonte

        Excel.Range['F1:G1:H1'].Mergecells := True;
        Excel.Range['F1'].HorizontalAlignment := 3; //Centralizado
        Excel.Range['F1'].Font.Bold           := true; ///negrito
        Excel.Range['F1'].Font.Color          := clwhite; //cor da fonte

        Excel.Range['I1:J1:K1'].Mergecells := True;
        Excel.Range['I1'].HorizontalAlignment := 3; //Centralizado
        Excel.Range['I1'].Font.Bold           := true; ///negrito
        Excel.Range['I1'].Font.Color          := clwhite; //cor da fonte

        Excel.Range['L1:M1:N1'].Mergecells := True;
        Excel.Range['L1'].HorizontalAlignment := 3; //Centralizado
        Excel.Range['L1'].Font.Bold           := true; ///negrito
        Excel.Range['L1'].Font.Color          := clwhite; //cor da fonte

        Excel.Range['O1:P1:Q1'].Mergecells := True;
        Excel.Range['O1'].HorizontalAlignment := 3; //Centralizado
        Excel.Range['O1'].Font.Bold           := true; ///negrito
        Excel.Range['O1'].Font.Color          := clwhite; //cor da fonte

        Excel.Range['R1:S1:T1'].Mergecells := True;
        Excel.Range['R1'].HorizontalAlignment := 3; //Centralizado
        Excel.Range['R1'].Font.Bold           := true; ///negrito
        Excel.Range['R1'].Font.Color          := clwhite; //cor da fonte

        Excel.Range['U1:V1:W1'].Mergecells := True;
        Excel.Range['U1'].HorizontalAlignment := 3; //Centralizado
        Excel.Range['U1'].Font.Bold           := true; ///negrito
        Excel.Range['U1'].Font.Color          := clwhite; //cor da fonte

        Excel.Range['X1:Y1:Z1'].Mergecells := True;
        Excel.Range['X1'].HorizontalAlignment := 3; //Centralizado
        Excel.Range['X1'].Font.Bold           := true; ///negrito
        Excel.Range['X1'].Font.Color          := clwhite; //cor da fonte

        Excel.Range['AA1:AB1:AC1'].Mergecells := True;
        Excel.Range['AA1'].HorizontalAlignment := 3; //Centralizado
        Excel.Range['AA1'].Font.Bold           := true; ///negrito
        Excel.Range['AA1'].Font.Color          := clwhite; //cor da fonte

        Excel.Range['AD1:AE1:AF1'].Mergecells := True;
        Excel.Range['AD1'].HorizontalAlignment := 3; //Centralizado
        Excel.Range['AD1'].Font.Bold           := true; ///negrito
        Excel.Range['AD1'].Font.Color          := clwhite; //cor da fonte

        Excel.Range['AG1:AH1:AI1'].Mergecells := True;
        Excel.Range['AG1'].HorizontalAlignment := 3; //Centralizado
        Excel.Range['AG1'].Font.Bold           := true; ///negrito
        Excel.Range['AG1'].Font.Color          := clwhite; //cor da fonte

        Excel.Range['AJ1:AK1:AL1'].Mergecells := True;
        Excel.Range['AJ1'].HorizontalAlignment := 3; //Centralizado
        Excel.Range['AJ1'].Font.Bold           := true; ///negrito
        Excel.Range['AJ1'].Font.Color          := clwhite; //cor da fonte


        Excel.Range['AM1:AN1:AO1'].Mergecells := True;
        Excel.Range['AM1'].HorizontalAlignment := 3; //Centralizado
        Excel.Range['AM1'].Font.Bold           := true; ///negrito
        Excel.Range['AM1'].Font.Color          := clwhite; //cor da fonte

        strCodGrupo := '';

        linha := 2;
        while not cdsRelatGrupo.eof Do
        begin

             //Preenche Grupos
            { if (TipoRelatorio <> trGrupo) and (cdsRelatGrupo.fieldbyname('FLGANALSINT').AsString <> 'S') then
             begin
               if strCodGrupo <> cdsRelatGrupo.fieldbyname('CODGRUPOORC').AsString then
               begin
             
                    //Insere Linha somente para o grupo
                    linha := linha + 1;

                    Sheet.Range['A' + IntToStr(linha)].Borders.LineStyle   := 1; //Borda
                    Sheet.Range['B' + IntToStr(linha)].Borders.LineStyle   := 1; //Borda

                    Sheet.Range['A' + IntToStr(linha)].Font.Bold           := (cdsRelatGrupo.fieldbyname('FLGANALSINT').AsString = 'S');
                    Sheet.Range['B' + IntToStr(linha)].Font.Bold           := (cdsRelatGrupo.fieldbyname('FLGANALSINT').AsString = 'S');
                    Sheet.Range['A' + IntToStr(linha)].Value               := cdsRelatGrupo.FieldByName('CODGRUPOORC').AsString;
                    Sheet.Range['B' + IntToStr(linha)].Value               := cdsRelatGrupo.FieldByName('NOMEGRUPOORCAMEN').AsString;
                    strCodGrupo := cdsRelatGrupo.fieldbyname('CODGRUPOORC').AsString;

                    if cdsRelatGrupo.fieldbyname('FLGANALSINT').AsString = 'S' then
                    begin
                        Sheet.Range['A' + IntToStr(linha)].Interior.Color      := clYellow; //Cors
                        Sheet.Range['B' + IntToStr(linha)].Interior.Color      := clYellow; //Cors
                    end
                    else
                    begin
                        Sheet.Range['A' + IntToStr(linha)].Interior.Color      := clWhite; //Cors
                        Sheet.Range['B' + IntToStr(linha)].Interior.Color      := clWhite; //Cors
                    end;

               end;
             end; }

             MostraStatusRelatGrupo( 'Exportando dados para excel  (' +  intTostr(cdsRelatGrupo.Recno)  + '/' +
                                     intTostr(cdsRelatGrupo.Recordcount)   +  ') ...');
             Application.ProcessMessages;


             if cdsRelatGrupo.fieldbyname('PARAMETRO').AsString = '' then
             begin
                cdsRelatGrupo.Next;
                Continue;
             end;

             linha := linha + 1;

             //Grupo
             Sheet.Range['A' + IntToStr(linha)].Borders.LineStyle   := 1; //Borda
             Sheet.Range['B' + IntToStr(linha)].Borders.LineStyle   := 1; //Borda

             //Preenche Grupo
             Sheet.Range['A' + IntToStr(linha)].Font.Bold           := (cdsRelatGrupo.fieldbyname('FLGANALSINT').AsString = 'S');
             Sheet.Range['B' + IntToStr(linha)].Font.Bold           := (cdsRelatGrupo.fieldbyname('FLGANALSINT').AsString = 'S');



             if (TipoRelatorio = trGrupo) then
             begin
                Sheet.Range['A' + IntToStr(linha)].Value               := cdsRelatGrupo.FieldByName('CODGRUPOORC').AsString;
                Sheet.Range['B' + IntToStr(linha)].Value               := cdsRelatGrupo.FieldByName('NOMEGRUPOORCAMEN').AsString;
             end
             else
             begin
                if cdsRelatGrupo.FieldByName('PARAMETRO').AsString = '0' then
                begin
                     Sheet.Range['A' + IntToStr(linha)].Value               := cdsRelatGrupo.FieldByName('CODGRUPOORC').AsString;
                     Sheet.Range['B' + IntToStr(linha)].Value               := cdsRelatGrupo.FieldByName('NOMEGRUPOORCAMEN').AsString;
                end
                else
                begin
                    Sheet.Range['A' + IntToStr(linha)].Value               := '';
                    Sheet.Range['B' + IntToStr(linha)].Value               := cdsRelatGrupo.FieldByName('PARAMETRO').AsString;
                end;
             end;

             if cdsRelatGrupo.fieldbyname('FLGANALSINT').AsString = 'S' then
             begin
                 Sheet.Range['A' + IntToStr(linha)].Interior.Color      := clYellow; //Cors
                 Sheet.Range['B' + IntToStr(linha)].Interior.Color      := clYellow; //Cors
             end
             else
             begin
                 Sheet.Range['A' + IntToStr(linha)].Interior.Color      := clWhite; //Cors
                 Sheet.Range['B' + IntToStr(linha)].Interior.Color      := clWhite; //Cors
             end;



             ind := 1;
             col := 3;

             //Preenche Valores
             Inicio := StrToInt(Parametros.ParamValues[2].AsString); //período Inicial

             if (Parametros.ParamValues[4].AsString <> '0') and (Parametros.ParamValues[4].AsString <> '') then
                Fim := StrToInt(Parametros.ParamValues[4].AsString) //período orçado
             else
                Fim := StrToInt(Parametros.ParamValues[3].AsString); //período Final

             for c:= Inicio  to  Fim  Do
             begin
                InsereValorXLS(letras[col] + IntToStr(linha),cdsRelatGrupo.FieldByName('ORC' + FormatFloat('00',ind)).AsCurrency);
                col := col + 1;

                InsereValorXLS(letras[col] + IntToStr(linha),cdsRelatGrupo.FieldByName('REA' + FormatFloat('00',ind)).AsCurrency);
                col := col + 1;

                InsereValorXLS(letras[col] + IntToStr(linha),cdsRelatGrupo.FieldByName('VAR' + FormatFloat('00',ind)).AsString);
                col := col + 1;
                ind := ind + 1;
             end;

             //Total
             InsereValorXLS(letras[col] + IntToStr(linha),cdsRelatGrupo.FieldByName('ORC_TOTAL').AsCurrency);
             col := col + 1;
             InsereValorXLS(letras[col] + IntToStr(linha),cdsRelatGrupo.FieldByName('REA_TOTAL').AsCurrency);
             col := col + 1;
             InsereValorXLS(letras[col] + IntToStr(linha),cdsRelatGrupo.FieldByName('VAR_TOTAL').AsString);
             col := col + 1;

             //próximo
             cdsRelatGrupo.Next;
        end;

        //Congela,ento de Células
        {Sheet.PageSetup.PrintTitleRows := '$1:$5';
        Sheet.PageSetup.PrintTitleColumns := '$A:$C';}

     FINALLY
        Excel.workbooks.close;   //fechar excel
     END;

     Result := true;
end;

function TCtrlRelValoresRealizadoOrcadoPorGrupo.iif(c: boolean; a,
  b: string): string;
begin
  if c then
     iif := a
  else
     iif := b;
end;

function TCtrlRelValoresRealizadoOrcadoPorGrupo.ImprimirMesXLS(
  iPeriodo: integer): Boolean;
begin
  //Período Inicial
  Result := (iPeriodo >= StrToInt(Parametros.ParamValues[2].AsString)) //período Inicial
            and (iPeriodo <= StrToInt(Parametros.ParamValues[3].AsString)); //período FInal
end;

procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.InsereRelat(
  strCodigoGrupo, strNomeGrupo, strFlgAnalSint,strParametro: string; iExercicio,
  Iperiodo: integer; VlrOrcado, VlrRealizado: Currency);
var
   IndicePeriodo:integer;
   bLocalizou:Boolean;
   TipoPeriodo:string;
   C:integer;
   iPos:integer;    // Edilaine - SOL 188338 / KTN 1775147
begin
     TRY
       if not cdsRelatGrupo.Active then exit;


       case TipoRelatorio of

         trGrupo:
                 bLocalizou := cdsRelatGrupo.Locate('CODGRUPOORC',strCodigoGrupo,[]);
         trGrupoCentroCusta,trGrupoCentroResponsabilidade,trGrupoAtividadeProjeto:
                 bLocalizou := cdsRelatGrupo.Locate('CODGRUPOORC;PARAMETRO', VarArrayOf([strCodigoGrupo,strParametro]),[]);
       end;

       if not bLocalizou then
       begin
            //Insere
            cdsRelatGrupo.Append;
            cdsRelatGrupo.FieldByName('CODGRUPOORC').AsString      := Trim(strCodigoGrupo);
            cdsRelatGrupo.FieldByName('NOMEGRUPOORCAMEN').AsString := Trim(strNomeGrupo);
            cdsRelatGrupo.FieldByName('FLGANALSINT').AsString      := Trim(strFlgAnalSint);
            cdsRelatGrupo.FieldByName('PARAMETRO').AsString        := Trim(strParametro);

            iPos := 1;    // Edilaine - SOL 188338 / KTN 1775147

            //Preenche todos os meses
            for c:= Periodo_Ini to Periodo_Fim Do
            begin
                 // Edilaine - SOL 188338 / KTN 1775147 - usar iPos em vez de c
                 cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',iPos {c}) ).AsInteger  := iExercicio;
                 cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',iPos {c}) ).AsInteger  := c;
                 cdsRelatGrupo.FieldByName('ORC'  + FormatFloat('00',iPos {c}) ).AsCurrency := 0;
                 cdsRelatGrupo.FieldByName('REA'  + FormatFloat('00',iPos {c}) ).AsCurrency := 0;
                 cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',iPos {c}) ).AsString   := '0,00%';
                 cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00', iPos {c})).AsString := RetornastrMes(c);

              inc(iPos);  // Edilaine - SOL 188338 / KTN 1775147
            end;

            //Preenche Mes que tem valor
            IndicePeriodo := RetornaIndicePeriodoCDS(iPeriodo,TipoPeriodo);

            if (IndicePeriodo > 0) then
            begin
                 cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',IndicePeriodo) ).AsInteger  := iExercicio;
                 cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',IndicePeriodo) ).AsInteger  := iPeriodo;

                 cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',IndicePeriodo)).AsString := RetornastrMes(Iperiodo);
                 cdsRelatGrupo.FieldByName('ORC'  + FormatFloat('00',IndicePeriodo) ).AsCurrency := VlrOrcado;

                 //Tipo de Período
                 if Trim(TipoPeriodo) <> 'O' then
                 begin
                   //Tipo de Período Normal
                   cdsRelatGrupo.FieldByName('REA'  + FormatFloat('00',IndicePeriodo) ).AsCurrency := VlrRealizado;
                   if (VlrOrcado > 0) and (VlrRealizado > 0) then
                      cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',IndicePeriodo) ).AsString := formatfloat('###,###,##0.00',((VlrRealizado / VlrOrcado) - 1)*100) + '%' //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
                   else
                      cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',IndicePeriodo) ).AsString := '0,00%';
                 end
                 else
                 begin
                   //Tipo de Período Orçado
                   //Deverá jogar o valor Orçado no realizado
                   cdsRelatGrupo.FieldByName('REA'  + FormatFloat('00',IndicePeriodo) ).AsCurrency := VlrOrcado;
                   cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',IndicePeriodo) ).AsString := '0,00%';
                 end;
            end;

            cdsRelatGrupo.Post;

       end
       else
       begin
            //Atualiza Saldo
            cdsRelatGrupo.Edit;
            cdsRelatGrupo.FieldByName('CODGRUPOORC').AsString      := Trim(strCodigoGrupo);
            cdsRelatGrupo.FieldByName('NOMEGRUPOORCAMEN').AsString := Trim(strNomeGrupo);
            cdsRelatGrupo.FieldByName('FLGANALSINT').AsString      := Trim(strFlgAnalSint);

            IndicePeriodo := RetornaIndicePeriodoCDS(iPeriodo,TipoPeriodo);

            if (IndicePeriodo > 0) then
            begin
                 cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',IndicePeriodo) ).AsInteger  := iExercicio;
                 cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',IndicePeriodo) ).AsInteger  := iPeriodo;
                 cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',IndicePeriodo)).AsString := RetornastrMes(Iperiodo);
                 cdsRelatGrupo.FieldByName('ORC'  + FormatFloat('00',IndicePeriodo) ).AsCurrency := VlrOrcado;

                 //Tipo de Período
                 if Trim(TipoPeriodo) <> 'O' then
                 begin
                   //Tipo de Período Normal
                   cdsRelatGrupo.FieldByName('REA'  + FormatFloat('00',IndicePeriodo) ).AsCurrency := VlrRealizado;

                   if (VlrOrcado > 0) and (VlrRealizado > 0) then
                      cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',IndicePeriodo) ).AsString := formatfloat('###,###,##0.00',((VlrRealizado / VlrOrcado) - 1)*100) + '%' //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
                   else
                      cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',IndicePeriodo) ).AsString := '0,00%';
                 end
                 else
                 begin
                   //Tipo de Período Orçado
                   //Deverá jogar o valor Orçado no realizado
                   cdsRelatGrupo.FieldByName('REA'  + FormatFloat('00',IndicePeriodo) ).AsCurrency := VlrOrcado;
                   cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',IndicePeriodo) ).AsString   := '0,00%';
                 end;
            end;

            cdsRelatGrupo.Post;
       end;
     except
           on E:Exception do
           begin
                ShowMessage('Grupo: ' + strCodigoGrupo + ' - Mês: ' + IntToStr(IndicePeriodo) + #13 +
                           E.Message);
           end;
     end;
end;

function TCtrlRelValoresRealizadoOrcadoPorGrupo.InsereValorXLS(
  strCelula: string; vlConteudo: currency): boolean;
begin
   Result := false;
   Sheet.Range[strCelula].HorizontalAlignment := 4; //Alinhamento para direita
   Sheet.Range[strCelula].Borders.LineStyle   := 1; //Borda

   if cdsRelatGrupo.fieldbyname('FLGANALSINT').AsString = 'S' then
   begin
      Excel.Range[strCelula].Interior.Color      := clYellow; //Cors
      Sheet.Range[strCelula].Font.Bold      := true
   end
   else
   begin
      Excel.Range[strCelula].Interior.Color      := clWhite;
      Sheet.Range[strCelula].Font.Bold      := false;
   end;
   
   if cdsRelatGrupo.fieldbyname('FLGANALSINT').AsString <> 'S' then
      Sheet.Range[strCelula].Value               :=  FormatFLoat('0.00###,##',vlConteudo)
   else
   begin
      if vlConteudo <> 0 then
         Sheet.Range[strCelula].Value               :=  FormatFLoat('0.00###,##',vlConteudo)
      else
         Sheet.Range[strCelula].Value               :=  '';
   end;
 
   Result := true;
end;

function TCtrlRelValoresRealizadoOrcadoPorGrupo.InsereValorXLS(strCelula,
  vlConteudo: string): boolean;
begin
   Result := false;
   Sheet.Range[strCelula].HorizontalAlignment := 4; //Alinhamento para direita
   Sheet.Range[strCelula].Borders.LineStyle   := 1; //Borda

   if cdsRelatGrupo.fieldbyname('FLGANALSINT').AsString = 'S' then
   begin
      Excel.Range[strCelula].Interior.Color      := clYellow; //Cors
      Sheet.Range[strCelula].Font.Bold      := true
   end
   else
   begin
      Excel.Range[strCelula].Interior.Color      := clWhite;
      Sheet.Range[strCelula].Font.Bold      := false;
   end;
   
   Sheet.Range[strCelula].Value               :=  vlConteudo;

   Result := true;
end;

procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.MontaGrupoCDS;
var
  strSQl:string;
begin
     strSQl :=
          ' select ' +
          ' 0  AS ID,' + 
          ' CAST (' + QuotedStr('X') + ' AS VARCHAR(50)) AS CODGRUPOORC, ' +
          ' CAST (' + QuotedStr('X') + ' AS VARCHAR(100)) AS NOMEGRUPOORCAMEN, ' +
          ' CAST (' + QuotedStr('X') + ' AS VARCHAR(5)) AS FLGANALSINT, ' +
          ' CAST (' + QuotedStr('X') + ' AS VARCHAR(100)) AS PARAMETRO, ' +
          ' 2010 AS EXE01, 12 AS PER01, 1.99 AS ORC01, 1.99 AS REA01, ' + QuotedStr('XXXXXXXXXXXXXXX') +  ' AS VAR01, ' + ' CAST (' + QuotedStr('XXXXXXXXXXXXXXX') + ' AS VARCHAR(50)) AS  PERIODO_DESCR01,' +
          ' 2010 AS EXE02, 12 AS PER02, 1.99 AS ORC02, 1.99 AS REA02, ' + QuotedStr('XXXXXXXXXXXXXXX') +  ' AS VAR02, ' + ' CAST (' + QuotedStr('XXXXXXXXXXXXXXX') + ' AS VARCHAR(50)) AS  PERIODO_DESCR02,' +
          ' 2010 AS EXE03, 12 AS PER03, 1.99 AS ORC03, 1.99 AS REA03, ' + QuotedStr('XXXXXXXXXXXXXXX') +  ' AS VAR03, ' + ' CAST (' + QuotedStr('XXXXXXXXXXXXXXX') + ' AS VARCHAR(50)) AS  PERIODO_DESCR03,' +
          ' 2010 AS EXE04, 12 AS PER04, 1.99 AS ORC04, 1.99 AS REA04, ' + QuotedStr('XXXXXXXXXXXXXXX') +  ' AS VAR04, ' + ' CAST (' + QuotedStr('XXXXXXXXXXXXXXX') + ' AS VARCHAR(50)) AS  PERIODO_DESCR04,' +
          ' 2010 AS EXE05, 12 AS PER05, 1.99 AS ORC05, 1.99 AS REA05, ' + QuotedStr('XXXXXXXXXXXXXXX') +  ' AS VAR05, ' + ' CAST (' + QuotedStr('XXXXXXXXXXXXXXX') + ' AS VARCHAR(50)) AS  PERIODO_DESCR05,' +
          ' 2010 AS EXE06, 12 AS PER06, 1.99 AS ORC06, 1.99 AS REA06, ' + QuotedStr('XXXXXXXXXXXXXXX') +  ' AS VAR06, ' + ' CAST (' + QuotedStr('XXXXXXXXXXXXXXX') + ' AS VARCHAR(50)) AS  PERIODO_DESCR06,' +
          ' 2010 AS EXE07, 12 AS PER07, 1.99 AS ORC07, 1.99 AS REA07, ' + QuotedStr('XXXXXXXXXXXXXXX') +  ' AS VAR07, ' + ' CAST (' + QuotedStr('XXXXXXXXXXXXXXX') + ' AS VARCHAR(50)) AS  PERIODO_DESCR07,' +
          ' 2010 AS EXE08, 12 AS PER08, 1.99 AS ORC08, 1.99 AS REA08, ' + QuotedStr('XXXXXXXXXXXXXXX') +  ' AS VAR08, ' + ' CAST (' + QuotedStr('XXXXXXXXXXXXXXX') + ' AS VARCHAR(50)) AS  PERIODO_DESCR08,' +
          ' 2010 AS EXE09, 12 AS PER09, 1.99 AS ORC09, 1.99 AS REA09, ' + QuotedStr('XXXXXXXXXXXXXXX') +  ' AS VAR09, ' + ' CAST (' + QuotedStr('XXXXXXXXXXXXXXX') + ' AS VARCHAR(50)) AS  PERIODO_DESCR09,' +
          ' 2010 AS EXE10, 12 AS PER10, 1.99 AS ORC10, 1.99 AS REA10, ' + QuotedStr('XXXXXXXXXXXXXXX') +  ' AS VAR10, ' + ' CAST (' + QuotedStr('XXXXXXXXXXXXXXX') + ' AS VARCHAR(50)) AS  PERIODO_DESCR10,' +
          ' 2010 AS EXE11, 12 AS PER11, 1.99 AS ORC11, 1.99 AS REA11, ' + QuotedStr('XXXXXXXXXXXXXXX') +  ' AS VAR11, ' + ' CAST (' + QuotedStr('XXXXXXXXXXXXXXX') + ' AS VARCHAR(50)) AS  PERIODO_DESCR11,' +
          ' 2010 AS EXE12, 12 AS PER12, 1.99 AS ORC12, 1.99 AS REA12, ' + QuotedStr('XXXXXXXXXXXXXXX') +  ' AS VAR12, ' + ' CAST (' + QuotedStr('XXXXXXXXXXXXXXX') + ' AS VARCHAR(50)) AS  PERIODO_DESCR12, ' +
          ' 1.99 AS ORC_TOTAL, 1.99 AS REA_TOTAL,' + QuotedStr('XXXXXXXXXXXXXXX') +  ' AS VAR_TOTAL ' +
          ' FROM DUAL ';

     //CLientDataset de Consulta Principal
     FcdsRelatGrupo.Data := GetDataPacket(strSQl);
     FcdsRelatGrupo.EmptyDataSet;

     //ClientDataset de layout
     FcdsRelatlayout.Data := FcdsRelatGrupo.Data;
     FcdsRelatGrupo.EmptyDataSet;
end;

procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.MontaPeriodosBDxCDS;
var
   i,i2,PeriodoIni,PeriodoFim,Periodoorc,Inicio,Fim:integer;
begin
     //Monta uma relação de períodos vindos da consulta principal com os
     //campos do clientdataset local utilizado para montar o relatório
     PeriodoIni := StrToInt(Parametros.ParamValues[2].AsString);
     PeriodoFim := StrToInt(Parametros.ParamValues[3].AsString);
     Periodoorc := StrToInt(Parametros.ParamValues[4].AsString);

     if Periodoorc = 0 then
     begin
          Inicio := PeriodoIni;
          Fim    := PeriodoFim;
     end
     else
     begin
          //Período Orçado informado
          Inicio := PeriodoIni;
          Fim    := Periodoorc;
     end;

     //Cria ClientDataset
     cdsRelatPeriodo.Data := GetDataPacket('SELECT 0 as PERIODO_BD, 0 as PERIODO_CDS, ' +
                                            QuotedStr('PERIODO') + ' as PERIODO_DESCR, ' +
                                            QuotedStr('N') + ' as TIPO ' +  //Tipo de Período: N-Normal, O - Orçado
                                            ' FROM DUAL ');
     cdsRelatPeriodo.EmptyDataSet;

     i2 := 1;
     for i:= Inicio to Fim Do
     begin
          cdsRelatPeriodo.Append;
          cdsRelatPeriodo.FieldByName('PERIODO_BD').AsInteger   := i;
          cdsRelatPeriodo.FieldByName('PERIODO_CDS').AsInteger  := i2;  
          cdsRelatPeriodo.FieldByName('PERIODO_DESCR').AsString := RetornastrMes(i);

          //Tipo de Período
          if (Periodoorc <> 0 )then
          begin
               if (i > PeriodoIni) and (i > PeriodoFim) and
                  (i <= Periodoorc) then
               begin
                    cdsRelatPeriodo.FieldByName('TIPO').AsString := 'O'; //Orçado
               end
               else
                    cdsRelatPeriodo.FieldByName('TIPO').AsString := 'N'; //Normal
          end
          else
          begin
               cdsRelatPeriodo.FieldByName('TIPO').AsString := 'N'; //Normal
          end;

          i2 := i2 + 1;
          cdsRelatPeriodo.Post;
     end;

     cdsRelatPeriodo.IndexFieldNames := 'PERIODO_BD';
     cdsRelatPeriodo.First;
end;

function TCtrlRelValoresRealizadoOrcadoPorGrupo.MontaRelatorio: OleVariant;
begin
  TRY
    //Monta relação de Períodos
    MostraStatusRelatGrupo('Gerando períodos...');
    MontaPeriodosBDxCDS();

    //Realiza Montagem De SQL
    MostraStatusRelatGrupo('Efetuando consulta...');
    //MontaSQL();            // Edilaine Ferraresi - SOL 170798 / KTN 1546958 - comentei
    MontaSQLPorRelatorio();  // Edilaine Ferraresi - SOL 170798 / KTN 1546958

    //Gravar Lod do SQL Gerado
    sSQL.SavetoFile( Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\RelatorioValoresPorGrupo' + FormatDateTime('yyyy-mm-dd', Date) + '.txt');

    //Monta clientDaset com o retorno da consulta
    MontaGrupoCDS();

    //Realizar Consulta SQL
    FcdsCompSaldo.Data := GetDataPacket(sSQL);

    //Preenche CLientDataset período à período
    FcdsCompSaldo.First;
    FcdsRelatGrupo.First;

    LimpaListas();  //Edilaine - SOL 189231 / KTN 1786548

    While not FcdsCompSaldo.eof Do
    begin
      if VerificaGrupoAtivo(FcdsCompSaldo.Fieldbyname('FLGANALSINT').AsString = 'A',
                            FcdsCompSaldo.Fieldbyname('CODGRUPOORC').AsString,
                            Parametros.ParamValues[0].AsString ) then    //Edilaine - SOL 189231 / KTN 1786548
          InsereRelat(FcdsCompSaldo.Fieldbyname('CODGRUPOORC').AsString,
                      FcdsCompSaldo.Fieldbyname('NOMEGRUPOORCAMEN').AsString,
                      FcdsCompSaldo.Fieldbyname('FLGANALSINT').AsString,
                      FcdsCompSaldo.Fieldbyname('PARAMETRO').AsString,
                      FcdsCompSaldo.Fieldbyname('EXERCICIO').AsInteger,
                      FcdsCompSaldo.Fieldbyname('PERIODO').AsInteger,
                      FcdsCompSaldo.Fieldbyname('VLRORCADO').AsCurrency,
                      FcdsCompSaldo.Fieldbyname('VLRREALIZADO').AsCurrency);

          FcdsCompSaldo.Next;
          MostraStatusRelatGrupo('Armazenando informações (' + IntToStr(FcdsCompSaldo.RecNo) + ' / ' + IntToStr(FcdsCompSaldo.Recordcount) + ')');
    end;

    //Totaliza Grupos Sintéticos
    TotalizarGrupoSintetico();


    //Insere registro de grupos Analíticos em brancos devido a rotina de agrupamento
    //dos relatório
    if (TipoRelatorio <> trGrupo) then
    begin
         PreencherGrupoorcamenAnaliticoVazio();
    end;

    //Totalização de Grupos  (última coluna do relatório)
    TotalizarGrupos();


    //Ajustar dados no layout dos relatórios
    AjustarDadoslayout();


    //Gerar Excel
    if (Trim(Parametros.ParamValues[23].AsString) <> '') then
    begin
         GerarExcel('C:');
    end;

    //Gerar Lista de Parâmetro utilizados
    MontarFiltrosUtilizadosSumario();

    cdsRelatlayout.First;
    cdsRelatlayout.IndexFieldNames := 'ID';
    Result := cdsRelatlayout.Data;
  FINALLY
    MostraStatusRelatGrupo('');
  end;
end;


//Edilaine - SOL 189231 / KTN 1786548
function TCtrlRelValoresRealizadoOrcadoPorGrupo.VerificaGrupoAtivo(bAnalitico : boolean;
                                                                   sGrupo, sPlanoOrc : string) : boolean;
var
  sNumDig : string;
begin
  // verifica se já está na lista de inativos (index <> -1 está... result = false)
  Result := slstInativa.IndexOf(sGrupo) = -1;

  // se não estiver no Inativo, verifica se precisa consultar o grupo
  if Result then
  begin
    // verifica lista de ativos  (index = -1 não está... result = false, precisa checar)
    Result := slstAtiva.IndexOf(sGrupo) <> -1;

    if not Result then   // não está nas listas ainda
    begin
      Result := true;

      if bAnalitico then
      begin
        sSQL.clear;
        sSQL.Add('SELECT COUNT(1) ');
        sSQL.Add('  FROM CONTASORCAMEN C, GRUPOORCAMEN G');
        sSQL.Add(' WHERE TRIM(G.CODGRUPOORC) = '+sGrupo );
        sSQL.Add('   AND G.IDPLANOORCAMEN = '+sPlanoOrc );
        sSQL.Add('   AND G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN ');
        sSQL.Add('   AND NVL(C.FLGATIVA,''A'') = ''I'' ');

        // verifica se há contas inativas
        _Cds.data := GetDataPacket( sSQl.GetText );
        if _Cds.Fields[0].AsInteger > 1 then
        begin
          Result := false;
          slstInativa.Add(sGrupo);
        end
        else
          slstAtiva.Add(sGrupo);
      end
      else
      begin
        sNumDig := InttoStr( Length( Trim(sGrupo) ));

        sSQL.clear;
        sSQL.Add('select SUBSTR(y.CODGRUPOORC, 1, '+sNumDig+'), SUM(decode(y.flgativo,''I'',1,0)) as INATIVO,');
        sSQL.Add('       SUM(decode(y.flgativo,''A'',1,0)) AS ATIVO, COUNT(1) AS TOTAL ');
        sSQL.Add(' from ( ');
        sSQL.Add('SELECT G.CODGRUPOORC, G.IDGRUPOORCAMEN, DECODE(GI.IDGRUPOORCAMEN, NULL,''A'', ''I'') AS FLGATIVO ');
        sSQL.Add('  FROM GRUPOORCAMEN G, ');
        sSQL.Add('       (SELECT DISTINCT IDGRUPOORCAMEN FROM CONTASORCAMEN ');
        sSQL.Add('         WHERE FLGATIVA = ''I'' ');
        sSQL.Add('           AND IDPLANOORCAMEN = '+ sPlanoOrc);
        sSQL.Add('       ) GI ');
        sSQL.Add(' WHERE SUBSTR(G.CODGRUPOORC, 1, '+sNumDig+') = '+sGrupo );
        sSQL.Add('   AND G.FLGANALSINT <> ''S'' ');
        sSQL.Add('   AND G.IDPLANOORCAMEN = '+ sPlanoOrc );
        sSQL.Add('   AND G.IDGRUPOORCAMEN =  GI.IDGRUPOORCAMEN(+) ');
        sSQL.Add(') y ');
        sSQL.Add('group by SUBSTR(y.cODGRUPOORC, 1, '+sNumDig+') ');

        _Cds.data := GetDataPacket( sSQl.GetText );
        if _Cds.Fields[1].AsInteger = _Cds.Fields[3].AsInteger then
        begin
           Result := false;  // no. de inativos = total de grupos
           slstInativa.Add(sGrupo);
        end
        else
           slstAtiva.Add(sGrupo);
      end;
    end;
  end;
  _Cds.close;
end;
//Edilaine - SOL 189231 / KTN 1786548 - fim

function TCtrlRelValoresRealizadoOrcadoPorGrupo.MontarFiltrosUtilizadosSumario: Boolean;
var
   strSQL:string;
begin
     FParametrosUtilizados.Clear;

     //Centro de Responsabilidade
     if (Trim(Parametros.ParamValues[9].AsString) <> '') then
     begin
         strSQL :=  ' select CODCENTRORESPON, ' +
                    ' trim(NOME) || decode(ANALITICOSINTET,''S'','' *'','''') || decode(ATIVO, ''S'', '''', '' (Inativo)'') as NOME '     + #13 +
                    ' from CENTRESPON ' +
                    ' where IDPLANCRESPON = 3 ' +
                    ' AND CODCENTRORESPON IN (' + Parametros.ParamValues[9].AsString + ')' +
                    ' order by NOME,CODCENTRORESPON ';

         FParametrosUtilizados.Add('Centro de Responsabilidade:' + RetornarListaFiltrosUtilizados(strSQL));
     end
     else
         FParametrosUtilizados.Add('Centro de Responsabilidade: <TODOS>');

     //Centro de Custo
     if (Trim(Parametros.ParamValues[17].AsString) <> '') then
     begin
          strSQL :=  ' select CODCENTROCUSTO, ' +
               ' trim(NOME) || decode(STATUSGRUPOCDC,''S'','' *'','''') || decode(ATIVO, ''S'', '''', '' (Inativo)'') as NOME '     + #13 +
               ' from CENTCUST ' +
               ' where IDPLANCENTCUST = 3 ' +
               ' AND CODCENTROCUSTO IN ( ' + Parametros.ParamValues[17].AsString + ')' +
               ' order by NOME,CODCENTROCUSTO ';

          FParametrosUtilizados.Add('Centro de Custo:' + RetornarListaFiltrosUtilizados(strSQL));    
     end
     else
        FParametrosUtilizados.Add('Centro de Custo: ' + '<TODOS>');

     //Atividade de Projeto
     if (Trim(Parametros.ParamValues[18].AsString) <> '') then
     begin
           strSQL :=  ' SELECT ' +
               ' trim(NOME) || decode(UNETIPO,' + QuotedStr('S') + ',' +    QuotedStr('*') +   ',' + QuotedStr('') + ') as NOME' + #13 +
               ', U.UNIDNEGOC ' +
               ' from UNIDNEGOCIO U ' +
               ' WHERE U.UNIDNEGOC IN ( ' + Parametros.ParamValues[18].AsString + ')' +
               ' ORDER BY U.NOME ';

           FParametrosUtilizados.Add('Atividade de Projeto: ' + RetornarListaFiltrosUtilizados(strSQL));
     end
     else
            FParametrosUtilizados.Add('Atividade de Projeto: <TODOS>');

      //Plano previdenciário
      if (Trim(Parametros.ParamValues[19].AsString) <> '') then
      begin
           strSQL := ' select IDPLANOPREV, NOME from PLANPREVCONTABIL ' +
                     ' WHERE IDPLANOPREV IN ( ' + Parametros.ParamValues[19].AsString + ')' +
                     ' order by NOME';
           FParametrosUtilizados.Add('Plano: ' + RetornarListaFiltrosUtilizados(strSQL));
      end
      else
           FParametrosUtilizados.Add('Plano: <TODOS>');

      //Patrocinadora
      if (Trim(Parametros.ParamValues[20].AsString) <> '') then
      begin

            strSQL := ' select P.IDPESSOA, P.NOME from PATRO PT, PESSOA P ' +
              ' where P.IDPESSOA = PT.IDPESSOA ' +
              ' AND PT.IDPESSOA IN ( ' + Parametros.ParamValues[20].AsString + ')' +
              ' order by P.NOME ';

           FParametrosUtilizados.Add('Patrocinadora: ' + RetornarListaFiltrosUtilizados(strSQL));
      end
      else
           FParametrosUtilizados.Add('Patrocinadora: <TODOS>');

      //Programa
      if (Trim(Parametros.ParamValues[21].AsString) <> '') then
      begin
           strSQL := ' select P.IDPROGRAMAORCAMEN, P.DESCRICAO_PROGRAMAORCAMEN AS NOME ' +
                     ' from CM.PROGRAMAORCAMEN P '  +
                     ' WHERE P.IDPROGRAMAORCAMEN IN ( ' + Parametros.ParamValues[21].AsString + ')' +
                     ' order by P.DESCRICAO_PROGRAMAORCAMEN ';
           FParametrosUtilizados.Add('Programa: ' + RetornarListaFiltrosUtilizados(strSQL));
      end
      else
           FParametrosUtilizados.Add('Programa: <TODOS>');

      //Tipo de Despesa
      if (Trim(Parametros.ParamValues[22].AsString) <> '') then
      begin

           strSQL := ' select TD.IDTIPO_DEPESAORCAMEN, TD.DESCRICAO_TIPO_DEPESAOCAMEN AS NOME '   +
                     ' from CM.TIPO_DESPESAORCAMEN TD '   +
                     ' where TD.IDTIPO_DEPESAORCAMEN IN ( ' + Parametros.ParamValues[22].AsString + ')' +
                     ' order by TD.DESCRICAO_TIPO_DEPESAOCAMEN ';
           FParametrosUtilizados.Add('Tipo de Despesa: '+ RetornarListaFiltrosUtilizados(strSQL));
      end
      else
           FParametrosUtilizados.Add('Tipo de Despesa: <TODOS>');

      // Felipe A. Santos SOL 190485 KTN 1929913

      // Nome do parâmetro imprimir valores sem, somente no relatório de Valores por grupo
      if (idReport = 2020) and (Parametros.ParamValues[26].AsString <> '') then
         FParametrosUtilizados.Add('Valores Sem: <' + Parametros.ParamValues[26].AsString + '>');

      // Felipe A. Santos SOL 190485 KTN 1929913 - FIM

end;

procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.MontaSQL;
begin
  //Motagem de SQL
  sSQL.Add('');

  //Totalizador
  sSQL.Add('SELECT ');
  sSQL.Add('         GR.CODGRUPOORC, ');
  sSQL.Add('         REPLACE(GR.NOMEGRUPOORCAMEN,'''''''','''') AS NOMEGRUPOORCAMEN,');
  sSQL.Add('         NVL(GR.FLGANALSINT,' + QuotedStr('A') + ') AS FLGANALSINT, ' );

  sSQL.Add('         TOTAL.EXERCICIO, ');
  sSQL.Add('         TOTAL.PERIODO, ');

  if TipoRelatorio <> trGrupo then
     sSQL.Add('         TOTAL.PARAMETRO, ')
  else
     sSQL.Add('         GR.NOMEGRUPOORCAMEN AS PARAMETRO, ');


  sSQL.Add('         SUM(TOTAL.VLRORCADO) AS VLRORCADO, ');
  sSQL.Add('         SUM(TOTAL.VLRREALIZADO) AS VLRREALIZADO ');
  sSQL.Add('FROM  ');
  sSQL.Add('         (SELECT X.*,RPAD(TRIM(CODGRUPOORC),12, ' + Quotedstr('0') + ') AS CODGRUPOORC_EXTENCO ');
  sSQL.Add('         FROM GRUPOORCAMEN X) GR');


  //Ricardo de Freitas SOL: 166068 KINTANA: 1448134
  if TipoRelatorio = trGrupo then
     sSQL.Add('LEFT JOIN')
  else
     sSQL.Add('JOIN');

  //SubSelect de Saldo----------------------------------------------------------
  sSQL.Add('(SELECT ');
  sSQL.Add('         GRU.IDPLANOORCAMEN,'); //Ricardo de Freitas SOL: 170461 KINTANA: 1516952
  sSQL.Add('         GRU.CODGRUPOORC, ');
  sSQL.Add('         GRU.NOMEGRUPOORCAMEN, ');

  //Parâmetro conforme tipo de Relatório
  if TipoRelatorio = trGrupo then
     sSQL.Add('         REPLACE(GRU.NOMEGRUPOORCAMEN,'''''''','''') AS PARAMETRO,');

  if TipoRelatorio = trGrupoCentroResponsabilidade then
     sSQL.Add('PAR.NOME AS PARAMETRO,  ');

  if TipoRelatorio = trGrupoCentroCusta then
     sSQL.Add('PAR.NOME AS PARAMETRO,  ');

  if TipoRelatorio = trGrupoAtividadeProjeto then
     sSQL.Add('PAR.NOME AS PARAMETRO,  ');

  sSQL.Add('         GRU.FLGANALSINT, ');
  sSQL.Add('         CON.IDCONTAORCAMEN, ');
  sSQL.Add('         SAL.EXERCICIO, ');
  sSQL.Add('         SAL.PERIODO, ');
  sSQL.Add('         SAL.VLRORCADO, ');
  sSQL.Add('         SAL.VLRREALIZADO ');
  sSQL.Add('FROM ');
  //Grupos orcamentários
  sSQL.Add('         (SELECT X.*,RPAD(TRIM(CODGRUPOORC),12, ' + Quotedstr('0') + ') AS CODGRUPOORC_EXTENCO ');
  sSQL.Add('         FROM GRUPOORCAMEN X) GRU');
  sSQL.Add('JOIN ');
  sSQL.Add('         CONTASORCAMEN CON ');
  sSQL.Add('ON ');
  sSQL.Add('         GRU.IDGRUPOORCAMEN = CON.IDGRUPOORCAMEN ');
  sSQL.Add('         AND GRU.IDPLANOORCAMEN = CON.IDPLANOORCAMEN '); //Ricardo de Freitas SOL: 170461 KINTANA: 1516952
  sSQL.Add('JOIN ');

  //Saldo Orcamentario
  sSQL.Add('     (SELECT  IDPESSOA,IDPLANOORCAMEN,EXERCICIO,PERIODO,IDCONTAORCAMEN, ');
  sSQL.Add('      SUM(VLRORCADO) as  VLRORCADO ,SUM(VLRREALIZADO) as VLRREALIZADO ');
  sSQL.Add('      FROM  SALDOORCADO ');
  sSQL.Add('      WHERE IDPLANOORCAMEN = ' + Parametros.ParamValues[0].AsString);  //Ricardo de Freitas SOL: 170461 KINTANA: 1516952
  sSQL.Add('      GROUP BY IDPESSOA,IDPLANOORCAMEN,EXERCICIO,PERIODO,IDCONTAORCAMEN) SAL ');
  sSQL.Add(' ON ');
  sSQL.Add('      CON.IDCONTAORCAMEN = SAL.IDCONTAORCAMEN ');
  sSQL.Add('      AND CON.IDPLANOORCAMEN = SAL.IDPLANOORCAMEN ');  //Ricardo de Freitas SOL: 170461 KINTANA: 1516952
  
  //Tipo de Relatório
  if TipoRelatorio =  trGrupoCentroResponsabilidade then
  begin
       sSQL.Add(' JOIN CENTRESPON PAR ');
       sSQL.Add(' ON  PAR.CODCENTRORESPON = CON.CODCENTRORESPON');
       sSQL.Add(' AND PAR.IDPESSOA = CON.IDPESSOA');
  end;

  if TipoRelatorio =  trGrupoCentroCusta then
  begin
       sSQL.Add(' JOIN CENTCUST PAR ');
       sSQL.Add('ON  PAR.CODCENTROCUSTO = CON.CODCENTROCUSTO ');
  end;

  if TipoRelatorio =  trGrupoAtividadeProjeto then
  begin
       sSQL.Add(' JOIN UNIDNEGOCIO PAR ');
       sSQL.Add(' ON  PAR.UNIDNEGOC = CON.UNIDNEGOC ');
       sSQL.Add(' AND PAR.IDPESSOA = CON.IDPESSOA ');
  end;

//------------------------------------------------------------------------------
//Where Principal---------------------------------------------------------------
//------------------------------------------------------------------------------

  sSQL.Add('WHERE ');
  sSQL.Add('        1 = 1 ');

  //Plano Orçamentário
  sSQL.Add('        AND GRU.IDPLANOORCAMEN = ' + Parametros.ParamValues[0].AsString);
  //Exercício
  sSQL.Add('        AND SAL.EXERCICIO = '   + Parametros.ParamValues[1].AsString);
  //Período Inicial
  sSQL.Add('        AND SAL.PERIODO > = ' + Parametros.ParamValues[2].AsString );
  Periodo_Ini := StrToInt(Parametros.ParamValues[2].AsString);

  //Período Final / Período Orçado
  if  Parametros.ParamValues[4].AsString = '0' then
  begin
      Periodo_Fim := StrToInt(Parametros.ParamValues[3].AsString);
      sSQL.Add('        AND SAL.PERIODO < = ' + Parametros.ParamValues[3].AsString)
  end
  else
  begin
      Periodo_Fim := StrToInt(Parametros.ParamValues[4].AsString);
      sSQL.Add('        AND SAL.PERIODO < = ' + Parametros.ParamValues[4].AsString);
  end;

  //Grupo Inicial e Final
  if (Trim(Parametros.ParamValues[5].AsString) <> '') and (Trim(Parametros.ParamValues[6].AsString) <> '') then
  begin
       sSQL.Add('        AND GRU.CODGRUPOORC_EXTENCO BETWEEN ');
       sSQL.Add('        RPAD(TRIM(' + Quotedstr(Trim(Parametros.ParamValues[5].AsString)) + '),12, ' + Quotedstr('0') + ')');
       sSQL.Add('        AND ');
       sSQL.Add('        RPAD(TRIM('  + Quotedstr(Trim(Parametros.ParamValues[6].AsString)) + '),12, ' + Quotedstr('0') + ')');
  end;

  //Posição Inicial
  if (Trim(Parametros.ParamValues[7].AsString) <> '') and (Trim(Parametros.ParamValues[7].AsString) <> '0') then
  begin
       sSQL.Add('        AND SUBSTR(GRU.CODGRUPOORC,' + '1' + ',' +
       IntToStr(length(Parametros.ParamValues[7].AsString) ) + ') = ' + Parametros.ParamValues[7].AsString);
  end;

  //Númerode Dígitos
  if (Trim(Parametros.ParamValues[8].AsString) <> '') and (Trim(Parametros.ParamValues[8].AsString) <> '0') then
  begin
       sSQL.Add('        AND LENGTH(TRIM(GRU.CODGRUPOORC)) = ' + Parametros.ParamValues[8].AsString);
  end;

  //Centro de Responsabilidade
  if (Trim(Parametros.ParamValues[9].AsString) <> '') then
  begin
       sSQL.Add('        AND CON.CODCENTRORESPON IN (' + Parametros.ParamValues[9].AsString + ')');
  end;

  //Centro de Custo
  if (Trim(Parametros.ParamValues[17].AsString) <> '') then
  begin
       sSQL.Add('        AND CON.CODCENTROCUSTO IN ( ' + Parametros.ParamValues[17].AsString + ')');
  end;

  //Atividade de Projeto
  if (Trim(Parametros.ParamValues[18].AsString) <> '') then
  begin
       sSQL.Add('        AND CON.UNIDNEGOC IN ( ' + Parametros.ParamValues[18].AsString + ')');
  end;

  //Plano previdenciário
  if (Trim(Parametros.ParamValues[19].AsString) <> '') then
  begin
       sSQL.Add('        AND CON.IDPLANOPREV IN ( ' + Parametros.ParamValues[19].AsString + ')');
  end;

  //Patrocinadora
  if (Trim(Parametros.ParamValues[20].AsString) <> '') then
  begin
       sSQL.Add('        AND CON.IDPATRO IN ( ' + Parametros.ParamValues[20].AsString + ')');
  end;

  //Programa
  if (Trim(Parametros.ParamValues[21].AsString) <> '') then
  begin
       sSQL.Add('        AND CON.IDPROGRAMAORCAMEN IN ( ' + Parametros.ParamValues[21].AsString + ')');
  end;

  //Tipo de Despesa
  if (Trim(Parametros.ParamValues[22].AsString) <> '') then
  begin
       sSQL.Add('        AND CON.IDTIPO_DEPESAORCAMEN IN ( ' + Parametros.ParamValues[22].AsString + ')');
  end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

  sSQL.Add(') TOTAL ');
  sSQL.Add('         ON ');
  sSQL.Add('         TOTAL.CODGRUPOORC = GR.CODGRUPOORC ');
  sSQL.Add('         AND TOTAL.IDPLANOORCAMEN = GR.IDPLANOORCAMEN'); //Ricardo de Freitas SOL: 170461 KINTANA: 1516952

//------------------------------------------------------------------------------
//Where Secundário--------------------------------------------------------------
//------------------------------------------------------------------------------

  sSQL.Add('WHERE ');
  sSQL.Add('        1 = 1 ');
  //Grupo Inicial e Final
  if (Trim(Parametros.ParamValues[5].AsString) <> '') and (Trim(Parametros.ParamValues[6].AsString) <> '') then
  begin
       sSQL.Add('        AND GR.CODGRUPOORC_EXTENCO BETWEEN ');
       sSQL.Add('        RPAD(TRIM(' + Quotedstr(Trim(Parametros.ParamValues[5].AsString)) + '),12, ' + Quotedstr('0') + ')');
       sSQL.Add('        AND ');
       sSQL.Add('        RPAD(TRIM('  + Quotedstr(Trim(Parametros.ParamValues[6].AsString)) + '),12, ' + Quotedstr('0') + ')');
  end;

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

  //Group by Totalizador
  sSQL.Add('GROUP  BY ');
  sSQL.Add('         GR.CODGRUPOORC, ');
  sSQL.Add('         GR.NOMEGRUPOORCAMEN, ');
  sSQL.Add('         TOTAL.PARAMETRO, ');
  sSQL.Add('         GR.FLGANALSINT, ');
  sSQL.Add('         TOTAL.EXERCICIO, ');
  sSQL.Add('         TOTAL.PERIODO    ');

  //Order by Totalizador
  sSQL.Add('ORDER BY ');
  sSQL.Add('         GR.CODGRUPOORC,GR.NOMEGRUPOORCAMEN,TOTAL.EXERCICIO,TOTAL.PERIODO ');

end;

// Edilaine Ferraresi - SOL 170798 / KTN 1546958
procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.MontaSQLPorRelatorio;
var
  grupoIni, grupoFim, sAjusteOrc : string;
begin
  grupoIni := Parametros.ParamValues[5].AsString;
  grupoFim := Parametros.ParamValues[6].AsString;
  if (grupoFim = '') and (grupoIni <> '') then
     grupoFim := grupoIni;

  //Período Final / Período Orçado
  Periodo_Ini := StrToInt(Parametros.ParamValues[2].AsString);
  if Parametros.ParamValues[4].AsString = '0' then
     Periodo_Fim := StrToInt(Parametros.ParamValues[3].AsString)
  else
     Periodo_Fim := StrToInt(Parametros.ParamValues[4].AsString);

  // Felipe A. Santos SOL 190485 KTN 1929913 - início
  sAjusteOrc := Parametros.ParamValues[25].AsString;

  if (sAjusteOrc = '') then
      sAjusteOrc := QuotedStr('R') + ',' + QuotedStr('S')
  else if (sAjusteOrc = 'T') then
      sAjusteOrc := QuotedStr('-1');
  // Felipe A. Santos SOL 190485 KTN 1929913 - fim

  //Motagem de SQL
    sSQL.Add('SELECT Y.* FROM (');

  if TipoRelatorio = trGrupo then
  begin
    sSQL.Add('  SELECT ');
    sSQL.Add('         GR.CODGRUPOORC,');
    sSQL.Add('         REPLACE(GR.NOMEGRUPOORCAMEN,'''''''','''') AS NOMEGRUPOORCAMEN,');
    sSQL.Add('         NVL(GR.FLGANALSINT,' + QuotedStr('A') + ') AS FLGANALSINT,');
    sSQL.Add('         TOTAL.EXERCICIO,');
    sSQL.Add('         TOTAL.PERIODO,  ');
    sSQL.Add('         GR.NOMEGRUPOORCAMEN AS PARAMETRO,');
    sSQL.Add('         SUM(TOTAL.VLRORCADO) AS VLRORCADO,');
    sSQL.Add('         SUM(TOTAL.VLRREALIZADO) AS VLRREALIZADO');
    sSQL.Add('FROM');
    sSQL.Add('         (SELECT X.*,RPAD(TRIM(CODGRUPOORC),12, ''0'') AS CODGRUPOORC_EXTENCO');
    sSQL.Add('            FROM GRUPOORCAMEN X ');  //Edilaine - SOL 189231 / KTN 1786548
    sSQL.Add('           WHERE X.IDPLANOORCAMEN = ' + Parametros.ParamValues[0].AsString);  //Edilaine - SOL 189231 / KTN 1786548
    sSQL.Add('         ) GR');                   //Edilaine - SOL 189231 / KTN 1786548
    sSQL.Add('LEFT JOIN');
    sSQL.Add('         (SELECT');
    sSQL.Add('            GRU.IDPLANOORCAMEN,');
    sSQL.Add('            GRU.CODGRUPOORC,');
    sSQL.Add('            GRU.NOMEGRUPOORCAMEN,');
    sSQL.Add('            REPLACE(GRU.NOMEGRUPOORCAMEN,'''''''','''') AS PARAMETRO,');
    sSQL.Add('            GRU.FLGANALSINT,');
    sSQL.Add('            CON.IDCONTAORCAMEN,');
    sSQL.Add('            SAL.EXERCICIO,');
    sSQL.Add('            SAL.PERIODO,');
    sSQL.Add('            SAL.VLRORCADO,');
    sSQL.Add('            SAL.VLRREALIZADO');
    sSQL.Add('         FROM');
    sSQL.Add('           (SELECT X.IDPLANOORCAMEN,');
    sSQL.Add('                   X.NOMEGRUPOORCAMEN,');
    sSQL.Add('                   X.FLGANALSINT,');
    sSQL.Add('                   RPAD(TRIM(CODGRUPOORC),12, ''0'') AS CODGRUPOORC_EXTENCO,');
    sSQL.Add('                   X.IDGRUPOORCAMEN,');
    sSQL.Add('                   X.CODGRUPOORC');
    sSQL.Add('            FROM GRUPOORCAMEN X) GRU,');
    sSQL.Add(' ');
    sSQL.Add('         CONTASORCAMEN CON ,');
    sSQL.Add(' ');
    sSQL.Add('         (SELECT S.IDPESSOA,S.IDPLANOORCAMEN,S.EXERCICIO,S.PERIODO,S.IDCONTAORCAMEN,');

    // Felipe A. Santos SOL 190485 KTN 1929913 - início
    if Parametros.ParamValues[25].AsString = 'R' then
      sSQL.Add('          SUM(S.VLRORCADO + DECODE(A.FLGTIPOALTER, ''S'', A.VLRSOLICITADO, 0)) as VLRORCADO,')
    else if Parametros.ParamValues[25].AsString = 'S' then
      sSQL.Add('          SUM(S.VLRORCADO + DECODE(A.FLGTIPOALTER, ''R'', A.VLRSOLICITADO *-1, 0)) as VLRORCADO,')
    else if Parametros.ParamValues[25].AsString = '' then
      sSQL.Add('          SUM(S.VLRORCADO + DECODE(A.FLGTIPOALTER, ''R'', A.VLRSOLICITADO *-1, 0) ' +
               '                          + DECODE(A.FLGTIPOALTER, ''S'', A.VLRSOLICITADO, 0)) as VLRORCADO,')
    else
      sSQL.Add('          SUM(S.VLRORCADO) as VLRORCADO,');
    // Felipe A. Santos  SOL 190485 KTN 1929913 - fim

    sSQL.Add('          SUM(S.VLRREALIZADO) as VLRREALIZADO');
    sSQL.Add('          FROM SALDOORCADO S, ');

    // Felipe A. Santos SOL 190485 KTN 1929913 - início
    sSQL.Add('               (SELECT A.IDCONTAORIGEM, ');
    sSQL.Add('                       A.PERIODOORIGEM, ');
    sSQL.Add('                       A.VLRSOLICITADO, ');
    sSQL.Add('                       A.FLGTIPOALTER, ');
    sSQL.Add('                       A.IDPLANOORCAMEN, ');
    sSQL.Add('                       NVL(A.IDDESPESAORCORIGEM, -1) IDDESPESAORCORIGEM ');
    sSQL.Add('                       FROM ALTERORCAMENTO A ');
    sSQL.Add('                  WHERE A.FLGTIPOALTER in (' + sAjusteOrc + ')) A');
    // Felipe A. Santos SOL 190485 KTN 1929913 - fim

    sSQL.Add('          WHERE S.IDPLANOORCAMEN = '+Parametros.ParamValues[0].AsString);
    sSQL.Add('            AND S.IDCONTAORCAMEN = A.IDCONTAORIGEM(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('            AND S.PERIODO = A.PERIODOORIGEM(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('            AND S.IDPLANOORCAMEN = A.IDPLANOORCAMEN(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('            AND S.IDDESPESAORC = A.IDDESPESAORCORIGEM(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('          GROUP BY S.IDPESSOA,S.IDPLANOORCAMEN,S.EXERCICIO,S.PERIODO,S.IDCONTAORCAMEN) SAL');
    sSQL.Add(' ');
    sSQL.Add('WHERE ');
    sSQL.Add('            GRU.IDGRUPOORCAMEN = CON.IDGRUPOORCAMEN');
    sSQL.Add('        AND GRU.IDPLANOORCAMEN = CON.IDPLANOORCAMEN');
    sSQL.Add('        AND CON.IDPLANOORCAMEN = SAL.IDPLANOORCAMEN');
    sSQL.Add('        AND CON.IDCONTAORCAMEN = SAL.IDCONTAORCAMEN');
    sSQL.Add('        AND CON.IDPESSOA = SAL.IDPESSOA');
    sSQL.Add('        AND GRU.IDPLANOORCAMEN = '+Parametros.ParamValues[0].AsString);
    sSQL.Add('        AND SAL.EXERCICIO = '+Parametros.ParamValues[1].AsString);
    sSQL.Add('        AND SAL.PERIODO > = '+Parametros.ParamValues[2].AsString);
    //Helen SOL: 187759 KTN: 1768178  - inicio
    //sSQL.Add('        AND SAL.PERIODO < = '+Parametros.ParamValues[3].AsString);
    sSQL.Add('        AND SAL.PERIODO < = '+ IntToStr(Periodo_Fim) );
    //Helen SOL: 187759 KTN: 1768178 - fim
    //Grupos
    if (grupoIni <> '') and (grupoFim <> '') then
    begin
      sSQL.Add('        AND GRU.CODGRUPOORC_EXTENCO >= RPAD(TRIM('+grupoIni+'),12, ''0'')');
      sSQL.Add('        AND GRU.CODGRUPOORC_EXTENCO <= RPAD(TRIM('+grupoFim+'),12, ''0'')');
    end;

    //Posição Inicial
    if (Trim(Parametros.ParamValues[7].AsString) <> '') and (Trim(Parametros.ParamValues[7].AsString) <> '0') then
    begin
      sSQL.Add('        AND SUBSTR(GRU.CODGRUPOORC,' + '1' + ',' +
      IntToStr(length(Parametros.ParamValues[7].AsString) ) + ') = ' + Parametros.ParamValues[7].AsString);
    end;

    //Númerode Dígitos
    if (Trim(Parametros.ParamValues[8].AsString) <> '') and (Trim(Parametros.ParamValues[8].AsString) <> '0') then
    begin
      sSQL.Add('        AND LENGTH(TRIM(GRU.CODGRUPOORC)) = ' + Parametros.ParamValues[8].AsString);
    end;

    //Centro de Responsabilidade
    if (Trim(Parametros.ParamValues[9].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.CODCENTRORESPON IN (' + Parametros.ParamValues[9].AsString + ')');
    end;

    //Centro de Custo
    if (Trim(Parametros.ParamValues[17].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.CODCENTROCUSTO IN ( ' + Parametros.ParamValues[17].AsString + ')');
    end;

    //Atividade de Projeto
    if (Trim(Parametros.ParamValues[18].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.UNIDNEGOC IN ( ' + Parametros.ParamValues[18].AsString + ')');
    end;

    //Plano previdenciário
    if (Trim(Parametros.ParamValues[19].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDPLANOPREV IN ( ' + Parametros.ParamValues[19].AsString + ')');
    end;

    //Patrocinadora
    if (Trim(Parametros.ParamValues[20].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDPATRO IN ( ' + Parametros.ParamValues[20].AsString + ')');
    end;

    //Programa
    if (Trim(Parametros.ParamValues[21].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDPROGRAMAORCAMEN IN ( ' + Parametros.ParamValues[21].AsString + ')');
    end;

    //Tipo de Despesa
    if (Trim(Parametros.ParamValues[22].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDTIPO_DEPESAORCAMEN IN ( ' + Parametros.ParamValues[22].AsString + ')');
    end;

    sSQL.Add(') TOTAL');
    sSQL.Add('         ON  TOTAL.CODGRUPOORC = GR.CODGRUPOORC');
    sSQL.Add('         AND TOTAL.IDPLANOORCAMEN = GR.IDPLANOORCAMEN');
    sSQL.Add('WHERE');
    sSQL.Add('        1 = 1');
    if (grupoIni <> '') and (grupoFim <> '') then
    begin
      sSQL.Add('        AND GR.CODGRUPOORC_EXTENCO >= RPAD(TRIM('+grupoIni+'),12, ''0'')');
      sSQL.Add('        AND GR.CODGRUPOORC_EXTENCO <= RPAD(TRIM('+grupoFim+'),12, ''0'')');
    end;
    sSQL.Add('GROUP  BY');
    sSQL.Add('         GR.CODGRUPOORC,');
    sSQL.Add('         GR.NOMEGRUPOORCAMEN,');
    sSQL.Add('         TOTAL.PARAMETRO,');
    sSQL.Add('         GR.FLGANALSINT,');
    sSQL.Add('         TOTAL.EXERCICIO,');
    sSQL.Add('         TOTAL.PERIODO');
    sSQL.Add('ORDER BY');
    sSQL.Add('         GR.CODGRUPOORC,GR.NOMEGRUPOORCAMEN,TOTAL.EXERCICIO,TOTAL.PERIODO');

  end
  else  if TipoRelatorio = trGrupoCentroResponsabilidade then
  begin

    sSQL.Add('SELECT');
    sSQL.Add('         GR.CODGRUPOORC,');
    sSQL.Add('         REPLACE(GR.NOMEGRUPOORCAMEN,'''''''','''') AS NOMEGRUPOORCAMEN,');
    sSQL.Add('         NVL(GR.FLGANALSINT,' + QuotedStr('A') +') AS FLGANALSINT,');
    sSQL.Add('         TOTAL.EXERCICIO,');
    sSQL.Add('         TOTAL.PERIODO,  ');
    sSQL.Add('         TOTAL.PARAMETRO,');
    sSQL.Add('         SUM(TOTAL.VLRORCADO) AS VLRORCADO,');
    sSQL.Add('         SUM(TOTAL.VLRREALIZADO) AS VLRREALIZADO');
    sSQL.Add('  FROM   (SELECT X.*,RPAD(TRIM(CODGRUPOORC),12, ''0'') AS CODGRUPOORC_EXTENCO');
    sSQL.Add('            FROM GRUPOORCAMEN X ');  //Edilaine - SOL 189231 / KTN 1786548
    sSQL.Add('           WHERE X.IDPLANOORCAMEN = ' + Parametros.ParamValues[0].AsString);  //Edilaine - SOL 189231 / KTN 1786548
    sSQL.Add('         ) GR');                   //Edilaine - SOL 189231 / KTN 1786548
    sSQL.Add(' LEFT JOIN   (SELECT GRU.IDPLANOORCAMEN,');    // Marcio SOL 172383/9181 / KTN : 1640404 - Inicio
    sSQL.Add('                 GRU.CODGRUPOORC,');
    sSQL.Add('                 GRU.NOMEGRUPOORCAMEN,');
    sSQL.Add('                 PAR.NOME AS PARAMETRO,');
    sSQL.Add('                 GRU.FLGANALSINT,');
    sSQL.Add('                 CON.IDCONTAORCAMEN,');
    sSQL.Add('                 SAL.EXERCICIO,');
    sSQL.Add('                 SAL.PERIODO,');
    sSQL.Add('                 SAL.VLRORCADO,');
    sSQL.Add('                 SAL.VLRREALIZADO');
    sSQL.Add('            FROM (SELECT X.IDPLANOORCAMEN,');
    sSQL.Add('                         X.NOMEGRUPOORCAMEN,');
    sSQL.Add('                         X.FLGANALSINT,');
    sSQL.Add('                         RPAD(TRIM(CODGRUPOORC),12, ''0'') AS CODGRUPOORC_EXTENCO,');
    sSQL.Add('                         X.IDGRUPOORCAMEN,');
    sSQL.Add('                         X.CODGRUPOORC');
    sSQL.Add('                    FROM GRUPOORCAMEN X) GRU,');
    sSQL.Add('                 CONTASORCAMEN CON ,');
    sSQL.Add('         (SELECT S.IDPESSOA,S.IDPLANOORCAMEN,S.EXERCICIO,S.PERIODO,S.IDCONTAORCAMEN,');
    // Felipe A. Santos SOL 190485 KTN 1929913 - início
    if Parametros.ParamValues[25].AsString = 'R' then
      sSQL.Add('          SUM(S.VLRORCADO + DECODE(A.FLGTIPOALTER, ''S'', A.VLRSOLICITADO, 0)) as VLRORCADO,')
    else if Parametros.ParamValues[25].AsString = 'S' then
      sSQL.Add('          SUM(S.VLRORCADO + DECODE(A.FLGTIPOALTER, ''R'', A.VLRSOLICITADO *-1, 0)) as VLRORCADO,')
    else if Parametros.ParamValues[25].AsString = '' then
      sSQL.Add('          SUM(S.VLRORCADO + DECODE(A.FLGTIPOALTER, ''R'', A.VLRSOLICITADO *-1, 0) ' +
               '                          + DECODE(A.FLGTIPOALTER, ''S'', A.VLRSOLICITADO, 0)) as VLRORCADO,')
    else
      sSQL.Add('          SUM(S.VLRORCADO) as VLRORCADO,');
    // Felipe A. Santos  SOL 190485 KTN 1929913 - fim

    sSQL.Add('          SUM(S.VLRREALIZADO) as VLRREALIZADO');
    sSQL.Add('          FROM SALDOORCADO S, ');

    // Felipe A. Santos SOL 190485 KTN 1929913 - início
    sSQL.Add('               (SELECT A.IDCONTAORIGEM, ');
    sSQL.Add('                       A.PERIODOORIGEM, ');
    sSQL.Add('                       A.VLRSOLICITADO, ');
    sSQL.Add('                       A.FLGTIPOALTER, ');
    sSQL.Add('                       A.IDPLANOORCAMEN, ');
    sSQL.Add('                       NVL(A.IDDESPESAORCORIGEM, -1) IDDESPESAORCORIGEM ');
    sSQL.Add('                       FROM ALTERORCAMENTO A ');
    sSQL.Add('                  WHERE A.FLGTIPOALTER in (' + sAjusteOrc + ')) A');
    // Felipe A. Santos SOL 190485 KTN 1929913 - fim

    sSQL.Add('          WHERE S.IDPLANOORCAMEN = '+Parametros.ParamValues[0].AsString);
    sSQL.Add('            AND S.IDCONTAORCAMEN = A.IDCONTAORIGEM(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('            AND S.PERIODO = A.PERIODOORIGEM(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('            AND S.IDPLANOORCAMEN = A.IDPLANOORCAMEN(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('            AND S.IDDESPESAORC = A.IDDESPESAORCORIGEM(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('          GROUP BY S.IDPESSOA,S.IDPLANOORCAMEN,S.EXERCICIO,S.PERIODO,S.IDCONTAORCAMEN) SAL,');
    sSQL.Add('                 CENTRESPON PAR');
    sSQL.Add('           WHERE GRU.IDGRUPOORCAMEN = CON.IDGRUPOORCAMEN');
    sSQL.Add('             AND GRU.IDPLANOORCAMEN = CON.IDPLANOORCAMEN');
    sSQL.Add('             AND CON.IDPLANOORCAMEN = SAL.IDPLANOORCAMEN');
    sSQL.Add('             AND CON.IDCONTAORCAMEN = SAL.IDCONTAORCAMEN');
    sSQL.Add('             AND CON.IDPESSOA = SAL.IDPESSOA');
    sSQL.Add('             AND CON.CODCENTRORESPON = PAR.CODCENTRORESPON');
    sSQL.Add('             AND CON.IDPESSOA = PAR.IDPESSOA');
    sSQL.Add('             AND GRU.IDPLANOORCAMEN = '+Parametros.ParamValues[0].AsString);
    sSQL.Add('             AND SAL.EXERCICIO = '+Parametros.ParamValues[1].AsString);
    sSQL.Add('             AND SAL.PERIODO > = '+Parametros.ParamValues[2].AsString);
    sSQL.Add('             AND SAL.PERIODO < = '+Parametros.ParamValues[3].AsString);

    //Grupos
    if (grupoIni <> '') and (grupoFim <> '') then
    begin
      sSQL.Add('             AND GRU.CODGRUPOORC_EXTENCO >= RPAD(TRIM('+grupoIni+'),12, ''0'')');
      sSQL.Add('             AND GRU.CODGRUPOORC_EXTENCO <= RPAD(TRIM('+grupoFim+'),12, ''0'')');
    end;

    //Posição Inicial
    if (Trim(Parametros.ParamValues[7].AsString) <> '') and (Trim(Parametros.ParamValues[7].AsString) <> '0') then
    begin
      sSQL.Add('        AND SUBSTR(GRU.CODGRUPOORC,' + '1' + ',' +
      IntToStr(length(Parametros.ParamValues[7].AsString) ) + ') = ' + Parametros.ParamValues[7].AsString);
    end;

    //Númerode Dígitos
    if (Trim(Parametros.ParamValues[8].AsString) <> '') and (Trim(Parametros.ParamValues[8].AsString) <> '0') then
    begin
      sSQL.Add('        AND LENGTH(TRIM(GRU.CODGRUPOORC)) = ' + Parametros.ParamValues[8].AsString);
    end;

    //Centro de Responsabilidade
    if (Trim(Parametros.ParamValues[9].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.CODCENTRORESPON IN (' + Parametros.ParamValues[9].AsString + ')');
    end;

    //Centro de Custo
    if (Trim(Parametros.ParamValues[17].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.CODCENTROCUSTO IN ( ' + Parametros.ParamValues[17].AsString + ')');
    end;

    //Atividade de Projeto
    if (Trim(Parametros.ParamValues[18].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.UNIDNEGOC IN ( ' + Parametros.ParamValues[18].AsString + ')');
    end;

    //Plano previdenciário
    if (Trim(Parametros.ParamValues[19].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDPLANOPREV IN ( ' + Parametros.ParamValues[19].AsString + ')');
    end;

    //Patrocinadora
    if (Trim(Parametros.ParamValues[20].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDPATRO IN ( ' + Parametros.ParamValues[20].AsString + ')');
    end;

    //Programa
    if (Trim(Parametros.ParamValues[21].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDPROGRAMAORCAMEN IN ( ' + Parametros.ParamValues[21].AsString + ')');
    end;

    //Tipo de Despesa
    if (Trim(Parametros.ParamValues[22].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDTIPO_DEPESAORCAMEN IN ( ' + Parametros.ParamValues[22].AsString + ')');
    end;

    sSQL.Add(') TOTAL');
    sSQL.Add('    ON   TOTAL.CODGRUPOORC = GR.CODGRUPOORC');
    sSQL.Add('         AND TOTAL.IDPLANOORCAMEN = GR.IDPLANOORCAMEN');
    sSQL.Add( 'WHERE  1 = 1');
    if (grupoIni <> '') and (grupoFim <> '') then
    begin
      sSQL.Add('        AND GR.CODGRUPOORC_EXTENCO BETWEEN');
      sSQL.Add('        RPAD(TRIM('+grupoIni+'),12, ''0'')');
      sSQL.Add('        AND');
      sSQL.Add('        RPAD(TRIM('+grupoFim+'),12, ''0'')');
    end;
   // Marcio SOL 172383/9181 / KTN : 1640404 - Inicio
    sSQL.Add('          AND (NOT(GR.FLGANALSINT = ''A'' AND TOTAL.EXERCICIO IS NULL AND TOTAL.PERIODO IS NULL)) ');
   // Marcio SOL 172383/9181 / KTN : 1640404 - fim
    sSQL.Add('GROUP BY ');
    sSQL.Add('         GR.CODGRUPOORC,');
    sSQL.Add('         GR.NOMEGRUPOORCAMEN,');
    sSQL.Add('         TOTAL.PARAMETRO,');
    sSQL.Add('         GR.FLGANALSINT,');
    sSQL.Add('         TOTAL.EXERCICIO,');
    sSQL.Add('         TOTAL.PERIODO');
    sSQL.Add('ORDER BY');
    sSQL.Add('         GR.CODGRUPOORC,GR.NOMEGRUPOORCAMEN,TOTAL.EXERCICIO,TOTAL.PERIODO');

  end
  else if TipoRelatorio = trGrupoCentroCusta then
  begin

    sSQL.Add('SELECT  GR.CODGRUPOORC,');
    sSQL.Add('       REPLACE(GR.NOMEGRUPOORCAMEN,'''''''','''') AS NOMEGRUPOORCAMEN,');
    sSQL.Add('       NVL(GR.FLGANALSINT, '+ QuotedStr('A') +') AS FLGANALSINT,');
    sSQL.Add('       TOTAL.EXERCICIO,');
    sSQL.Add('       TOTAL.PERIODO,');
    sSQL.Add('       TOTAL.PARAMETRO,');
    sSQL.Add('       SUM(TOTAL.VLRORCADO) AS VLRORCADO,');
    sSQL.Add('       SUM(TOTAL.VLRREALIZADO) AS VLRREALIZADO ');
    sSQL.Add('  FROM (SELECT X.*, RPAD(TRIM(CODGRUPOORC), 12, ''0'') AS CODGRUPOORC_EXTENCO');
    sSQL.Add('          FROM GRUPOORCAMEN X ');  //Edilaine - SOL 189231 / KTN 1786548
    sSQL.Add('         WHERE X.IDPLANOORCAMEN = ' + Parametros.ParamValues[0].AsString);  //Edilaine - SOL 189231 / KTN 1786548
    sSQL.Add('       ) GR');                   //Edilaine - SOL 189231 / KTN 1786548
    sSQL.Add('  LEFT JOIN (SELECT GRU.IDPLANOORCAMEN,'); // Marcio SOL 172383/9181 / KTN : 1640404
    sSQL.Add('               GRU.CODGRUPOORC,');
    sSQL.Add('               GRU.NOMEGRUPOORCAMEN,');
    sSQL.Add('               PAR.NOME AS PARAMETRO,');
    sSQL.Add('               GRU.FLGANALSINT,');
    sSQL.Add('               CON.IDCONTAORCAMEN,');
    sSQL.Add('               SAL.EXERCICIO,');
    sSQL.Add('               SAL.PERIODO,');
    sSQL.Add('               SAL.VLRORCADO,');
    sSQL.Add('               SAL.VLRREALIZADO');
    sSQL.Add('          FROM CONTASORCAMEN CON,');
    sSQL.Add('               CENTCUST PAR,');
    sSQL.Add('               (SELECT X.IDPLANOORCAMEN,');
    sSQL.Add('                       X.CODGRUPOORC,');
    sSQL.Add('                       X.NOMEGRUPOORCAMEN,');
    sSQL.Add('                       X.FLGANALSINT,');
    sSQL.Add('                       X.IDGRUPOORCAMEN,');
    sSQL.Add('                       RPAD(TRIM(CODGRUPOORC), 12, ''0'') AS CODGRUPOORC_EXTENCO');
    sSQL.Add('                  FROM GRUPOORCAMEN X) GRU,');
    sSQL.Add('         (SELECT S.IDPESSOA,S.IDPLANOORCAMEN,S.EXERCICIO,S.PERIODO,S.IDCONTAORCAMEN,');
    // Felipe A. Santos SOL 190485 KTN 1929913 - início
    if Parametros.ParamValues[25].AsString = 'R' then
      sSQL.Add('          SUM(S.VLRORCADO + DECODE(A.FLGTIPOALTER, ''S'', A.VLRSOLICITADO, 0)) as VLRORCADO,')
    else if Parametros.ParamValues[25].AsString = 'S' then
      sSQL.Add('          SUM(S.VLRORCADO + DECODE(A.FLGTIPOALTER, ''R'', A.VLRSOLICITADO*-1, 0)) as VLRORCADO,')
    else if Parametros.ParamValues[25].AsString = '' then
      sSQL.Add('          SUM(S.VLRORCADO + DECODE(A.FLGTIPOALTER, ''R'', A.VLRSOLICITADO *-1, 0) ' +
               '                          + DECODE(A.FLGTIPOALTER, ''S'', A.VLRSOLICITADO, 0)) as VLRORCADO,')
    else
      sSQL.Add('          SUM(S.VLRORCADO) as VLRORCADO,');
    // Felipe A. Santos  SOL 190485 KTN 1929913 - fim

    sSQL.Add('          SUM(S.VLRREALIZADO) as VLRREALIZADO');
    sSQL.Add('          FROM SALDOORCADO S, ');

    // Felipe A. Santos SOL 190485 KTN 1929913 - início
    sSQL.Add('               (SELECT A.IDCONTAORIGEM, ');
    sSQL.Add('                       A.PERIODOORIGEM, ');
    sSQL.Add('                       A.VLRSOLICITADO, ');
    sSQL.Add('                       A.FLGTIPOALTER, ');
    sSQL.Add('                       A.IDPLANOORCAMEN, ');
    sSQL.Add('                       NVL(A.IDDESPESAORCORIGEM, -1) IDDESPESAORCORIGEM ');
    sSQL.Add('                       FROM ALTERORCAMENTO A ');
    sSQL.Add('                  WHERE A.FLGTIPOALTER in (' + sAjusteOrc + ')) A');
    // Felipe A. Santos SOL 190485 KTN 1929913 - fim

    sSQL.Add('          WHERE S.IDPLANOORCAMEN = '+Parametros.ParamValues[0].AsString);
    sSQL.Add('            AND S.IDCONTAORCAMEN = A.IDCONTAORIGEM(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('            AND S.PERIODO = A.PERIODOORIGEM(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('            AND S.IDPLANOORCAMEN = A.IDPLANOORCAMEN(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('            AND S.IDDESPESAORC = A.IDDESPESAORCORIGEM(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('          GROUP BY S.IDPESSOA,S.IDPLANOORCAMEN,S.EXERCICIO,S.PERIODO,S.IDCONTAORCAMEN) SAL');
    sSQL.Add('         WHERE GRU.IDGRUPOORCAMEN = CON.IDGRUPOORCAMEN');
    sSQL.Add('           AND GRU.IDPLANOORCAMEN = CON.IDPLANOORCAMEN');
    sSQL.Add('           AND CON.IDCONTAORCAMEN = SAL.IDCONTAORCAMEN');
    sSQL.Add('           AND CON.IDPLANOORCAMEN = SAL.IDPLANOORCAMEN');
    sSQL.Add('           AND PAR.CODCENTROCUSTO = CON.CODCENTROCUSTO');
    sSQL.Add('           AND GRU.IDPLANOORCAMEN = '+Parametros.ParamValues[0].AsString);
    sSQL.Add('           AND SAL.EXERCICIO = '+Parametros.ParamValues[1].AsString);
    sSQL.Add('           AND SAL.PERIODO >= '+Parametros.ParamValues[2].AsString);
    //Helen SOL: 187759 KTN: 1768178  - inicio
    //sSQL.Add('           AND SAL.PERIODO <= '+Parametros.ParamValues[3].AsString);
    sSQL.Add('           AND SAL.PERIODO <= '+ IntToStr(Periodo_Fim));
    //Helen SOL: 187759 KTN: 1768178  - fim

    //Grupos
    if (grupoIni <> '') and (grupoFim <> '') then
    begin
      sSQL.Add('           AND GRU.CODGRUPOORC_EXTENCO >= RPAD(TRIM('+grupoIni+'), 12, ''0'')');
      sSQL.Add('           AND GRU.CODGRUPOORC_EXTENCO <= RPAD(TRIM('+grupoFim+'), 12, ''0'')');
    end;

    //Posição Inicial
    if (Trim(Parametros.ParamValues[7].AsString) <> '') and (Trim(Parametros.ParamValues[7].AsString) <> '0') then
    begin
      sSQL.Add('        AND SUBSTR(GRU.CODGRUPOORC,' + '1' + ',' +
      IntToStr(length(Parametros.ParamValues[7].AsString) ) + ') = ' + Parametros.ParamValues[7].AsString);
    end;

    //Númerode Dígitos
    if (Trim(Parametros.ParamValues[8].AsString) <> '') and (Trim(Parametros.ParamValues[8].AsString) <> '0') then
    begin
      sSQL.Add('        AND LENGTH(TRIM(GRU.CODGRUPOORC)) = ' + Parametros.ParamValues[8].AsString);
    end;

    //Centro de Responsabilidade
    if (Trim(Parametros.ParamValues[9].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.CODCENTRORESPON IN (' + Parametros.ParamValues[9].AsString + ')');
    end;

    //Centro de Custo
    if (Trim(Parametros.ParamValues[17].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.CODCENTROCUSTO IN ( ' + Parametros.ParamValues[17].AsString + ')');
    end;

    //Atividade de Projeto
    if (Trim(Parametros.ParamValues[18].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.UNIDNEGOC IN ( ' + Parametros.ParamValues[18].AsString + ')');
    end;

    //Plano previdenciário
    if (Trim(Parametros.ParamValues[19].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDPLANOPREV IN ( ' + Parametros.ParamValues[19].AsString + ')');
    end;

    //Patrocinadora
    if (Trim(Parametros.ParamValues[20].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDPATRO IN ( ' + Parametros.ParamValues[20].AsString + ')');
    end;

    //Programa
    if (Trim(Parametros.ParamValues[21].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDPROGRAMAORCAMEN IN ( ' + Parametros.ParamValues[21].AsString + ')');
    end;

    //Tipo de Despesa
    if (Trim(Parametros.ParamValues[22].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDTIPO_DEPESAORCAMEN IN ( ' + Parametros.ParamValues[22].AsString + ')');
    end;

    sSQL.Add(') TOTAL');
    sSQL.Add('    ON TOTAL.CODGRUPOORC = GR.CODGRUPOORC');
    sSQL.Add('   AND TOTAL.IDPLANOORCAMEN = GR.IDPLANOORCAMEN');
    sSQL.Add('WHERE');
    sSQL.Add('        1 = 1');
    if (grupoIni <> '') and (grupoFim <> '') then
    begin
      sSQL.Add('   AND GR.CODGRUPOORC_EXTENCO >= RPAD(TRIM('+grupoIni+'), 12, ''0'')');
      sSQL.Add('   AND GR.CODGRUPOORC_EXTENCO <= RPAD(TRIM('+grupoFim+'), 12, ''0'')');
    end;
   // Marcio SOL 172383/9181 / KTN : 1640404 - Inicio
    sSQL.Add('          AND (NOT(GR.FLGANALSINT = ''A'' AND TOTAL.EXERCICIO IS NULL AND TOTAL.PERIODO IS NULL)) ');
   // Marcio SOL 172383/9181 / KTN : 1640404 - fim

    sSQL.Add(' GROUP BY GR.CODGRUPOORC,');
    sSQL.Add('          GR.NOMEGRUPOORCAMEN,');
    sSQL.Add('          TOTAL.PARAMETRO,');
    sSQL.Add('          GR.FLGANALSINT,');
    sSQL.Add('          TOTAL.EXERCICIO,');
    sSQL.Add('          TOTAL.PERIODO');
    sSQL.Add(' ORDER BY GR.CODGRUPOORC,');
    sSQL.Add('          GR.NOMEGRUPOORCAMEN,');
    sSQL.Add('          TOTAL.EXERCICIO,');
    sSQL.Add('          TOTAL.PERIODO');

  end
  else if TipoRelatorio = trGrupoAtividadeProjeto then
  begin

    sSQL.Add('SELECT');
    sSQL.Add('         GR.CODGRUPOORC,');
    sSQL.Add('         REPLACE(GR.NOMEGRUPOORCAMEN,'''''''','''') AS NOMEGRUPOORCAMEN,');
    sSQL.Add('         NVL(GR.FLGANALSINT,'+ QuotedStr('A') +') AS FLGANALSINT,');
    sSQL.Add('         TOTAL.EXERCICIO,');
    sSQL.Add('         TOTAL.PERIODO,  ');
    sSQL.Add('         TOTAL.PARAMETRO,');
    sSQL.Add('         SUM(TOTAL.VLRORCADO) AS VLRORCADO,');
    sSQL.Add('         SUM(TOTAL.VLRREALIZADO) AS VLRREALIZADO');
    sSQL.Add('FROM');
    sSQL.Add('         (SELECT X.*,RPAD(TRIM(CODGRUPOORC),12, ''0'') AS CODGRUPOORC_EXTENCO');
    sSQL.Add('            FROM GRUPOORCAMEN X ');  //Edilaine - SOL 189231 / KTN 1786548
    sSQL.Add('           WHERE X.IDPLANOORCAMEN = ' + Parametros.ParamValues[0].AsString);  //Edilaine - SOL 189231 / KTN 1786548
    sSQL.Add('         ) GR');                   //Edilaine - SOL 189231 / KTN 1786548
    sSQL.Add('LEFT JOIN ');// Marcio SOL 172383/9181 / KTN : 1640404
    sSQL.Add('(SELECT');
    sSQL.Add('         GRU.IDPLANOORCAMEN,');
    sSQL.Add('         GRU.CODGRUPOORC,   ');
    sSQL.Add('         GRU.NOMEGRUPOORCAMEN,'); 
    sSQL.Add('         PAR.NOME AS PARAMETRO,');  
    sSQL.Add('         GRU.FLGANALSINT,'); 
    sSQL.Add('         CON.IDCONTAORCAMEN,'); 
    sSQL.Add('         SAL.EXERCICIO,'); 
    sSQL.Add('         SAL.PERIODO,');
    sSQL.Add('         SAL.VLRORCADO,');
    sSQL.Add('         SAL.VLRREALIZADO'); 
    sSQL.Add('FROM'); 
    sSQL.Add('         (SELECT X.IDPLANOORCAMEN,'); 
    sSQL.Add('                 X.NOMEGRUPOORCAMEN,');
    sSQL.Add('                 X.FLGANALSINT,'); 
    sSQL.Add('                 RPAD(TRIM(CODGRUPOORC),12, ''0'') AS CODGRUPOORC_EXTENCO,');
    sSQL.Add('                 X.IDGRUPOORCAMEN,');
    sSQL.Add('                 X.CODGRUPOORC');
    sSQL.Add('            FROM GRUPOORCAMEN X) GRU,');
    sSQL.Add('         CONTASORCAMEN CON ,');
    sSQL.Add('         (SELECT S.IDPESSOA,S.IDPLANOORCAMEN,S.EXERCICIO,S.PERIODO,S.IDCONTAORCAMEN,');

    // Felipe A. Santos SOL 190485 KTN 1929913 - início
    if Parametros.ParamValues[25].AsString = 'R' then
      sSQL.Add('          SUM(S.VLRORCADO + DECODE(A.FLGTIPOALTER, ''S'', A.VLRSOLICITADO, 0)) as VLRORCADO,')
    else if Parametros.ParamValues[25].AsString = 'S' then
      sSQL.Add('          SUM(S.VLRORCADO + DECODE(A.FLGTIPOALTER, ''R'', A.VLRSOLICITADO *-1, 0)) as VLRORCADO,')
    else if Parametros.ParamValues[25].AsString = '' then
      sSQL.Add('          SUM(S.VLRORCADO + DECODE(A.FLGTIPOALTER, ''R'', A.VLRSOLICITADO *-1, 0) ' +
               '                          + DECODE(A.FLGTIPOALTER, ''S'', A.VLRSOLICITADO, 0)) as VLRORCADO,')
    else
      sSQL.Add('          SUM(S.VLRORCADO) as VLRORCADO,');
    // Felipe A. Santos  SOL 190485 KTN 1929913 - fim

    sSQL.Add('          SUM(S.VLRREALIZADO) as VLRREALIZADO');
    sSQL.Add('          FROM SALDOORCADO S, ');

    // Felipe A. Santos SOL 190485 KTN 1929913 - início
    sSQL.Add('               (SELECT A.IDCONTAORIGEM, ');
    sSQL.Add('                       A.PERIODOORIGEM, ');
    sSQL.Add('                       A.VLRSOLICITADO, ');
    sSQL.Add('                       A.FLGTIPOALTER, ');
    sSQL.Add('                       A.IDPLANOORCAMEN, ');
    sSQL.Add('                       NVL(A.IDDESPESAORCORIGEM, -1) IDDESPESAORCORIGEM ');
    sSQL.Add('                       FROM ALTERORCAMENTO A ');
    sSQL.Add('                  WHERE A.FLGTIPOALTER in (' + sAjusteOrc + ')) A');
    // Felipe A. Santos SOL 190485 KTN 1929913 - fim

    sSQL.Add('          WHERE S.IDPLANOORCAMEN = '+Parametros.ParamValues[0].AsString);
    sSQL.Add('            AND S.IDCONTAORCAMEN = A.IDCONTAORIGEM(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('            AND S.PERIODO = A.PERIODOORIGEM(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('            AND S.IDPLANOORCAMEN = A.IDPLANOORCAMEN(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('            AND S.IDDESPESAORC = A.IDDESPESAORCORIGEM(+)'); // Felipe A. Santos SOL 190485 KTN 1929913
    sSQL.Add('          GROUP BY S.IDPESSOA,S.IDPLANOORCAMEN,S.EXERCICIO,S.PERIODO,S.IDCONTAORCAMEN) SAL,');
    sSQL.Add('      UNIDNEGOCIO PAR');
    sSQL.Add('WHERE'); 
    sSQL.Add('            GRU.IDGRUPOORCAMEN = CON.IDGRUPOORCAMEN'); 
    sSQL.Add('        AND GRU.IDPLANOORCAMEN = CON.IDPLANOORCAMEN'); 
    sSQL.Add('        AND CON.IDPLANOORCAMEN = SAL.IDPLANOORCAMEN');
    sSQL.Add('        AND CON.IDCONTAORCAMEN = SAL.IDCONTAORCAMEN');
    sSQL.Add('        AND CON.IDPESSOA = SAL.IDPESSOA');
    sSQL.Add('        AND CON.UNIDNEGOC = PAR.UNIDNEGOC');
    sSQL.Add('        AND CON.IDPESSOA = PAR.IDPESSOA');
    sSQL.Add('        AND GRU.IDPLANOORCAMEN = '+Parametros.ParamValues[0].AsString);
    sSQL.Add('        AND SAL.EXERCICIO = '+Parametros.ParamValues[1].AsString);
    sSQL.Add('        AND SAL.PERIODO > = '+Parametros.ParamValues[2].AsString);
    //sSQL.Add('        AND SAL.PERIODO < = '+Parametros.ParamValues[3].AsString);   // Edilaine - SOL 188338 / KTN 1775147 - comentado
    sSQL.Add('        AND SAL.PERIODO < = '+ IntToStr(Periodo_Fim) );                // Edilaine - SOL 188338 / KTN 1775147

    //Grupos
    if (grupoIni <> '') and (grupoFim <> '') then
    begin
      sSQL.Add('        AND GRu.CODGRUPOORC_EXTENCO >= RPAD(TRIM('+grupoIni+'),12, ''0'')');
      sSQL.Add('        AND GRu.CODGRUPOORC_EXTENCO <= RPAD(TRIM('+grupoFim+'),12, ''0'')');
    end;

    //Posição Inicial
    if (Trim(Parametros.ParamValues[7].AsString) <> '') and (Trim(Parametros.ParamValues[7].AsString) <> '0') then
    begin
      sSQL.Add('        AND SUBSTR(GRU.CODGRUPOORC,' + '1' + ',' +
      IntToStr(length(Parametros.ParamValues[7].AsString) ) + ') = ' + Parametros.ParamValues[7].AsString);
    end;

    //Númerode Dígitos
    if (Trim(Parametros.ParamValues[8].AsString) <> '') and (Trim(Parametros.ParamValues[8].AsString) <> '0') then
    begin
      sSQL.Add('        AND LENGTH(TRIM(GRU.CODGRUPOORC)) = ' + Parametros.ParamValues[8].AsString);
    end;

    //Centro de Responsabilidade
    if (Trim(Parametros.ParamValues[9].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.CODCENTRORESPON IN (' + Parametros.ParamValues[9].AsString + ')');
    end;

    //Centro de Custo
    if (Trim(Parametros.ParamValues[17].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.CODCENTROCUSTO IN ( ' + Parametros.ParamValues[17].AsString + ')');
    end;

    //Atividade de Projeto
    if (Trim(Parametros.ParamValues[18].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.UNIDNEGOC IN ( ' + Parametros.ParamValues[18].AsString + ')');
    end;

    //Plano previdenciário
    if (Trim(Parametros.ParamValues[19].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDPLANOPREV IN ( ' + Parametros.ParamValues[19].AsString + ')');
    end;

    //Patrocinadora
    if (Trim(Parametros.ParamValues[20].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDPATRO IN ( ' + Parametros.ParamValues[20].AsString + ')');
    end;

    //Programa
    if (Trim(Parametros.ParamValues[21].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDPROGRAMAORCAMEN IN ( ' + Parametros.ParamValues[21].AsString + ')');
    end;

    //Tipo de Despesa
    if (Trim(Parametros.ParamValues[22].AsString) <> '') then
    begin
      sSQL.Add('        AND CON.IDTIPO_DEPESAORCAMEN IN ( ' + Parametros.ParamValues[22].AsString + ')');
    end;

    sSQL.Add(') TOTAL');
    sSQL.Add('         ON'); 
    sSQL.Add('         TOTAL.CODGRUPOORC = GR.CODGRUPOORC'); 
    sSQL.Add('         AND TOTAL.IDPLANOORCAMEN = GR.IDPLANOORCAMEN');
    sSQL.Add('WHERE');
    sSQL.Add('        1 = 1');
    if (grupoIni <> '') and (grupoFim <> '') then
    begin
      sSQL.Add('        AND GR.CODGRUPOORC_EXTENCO BETWEEN');
      sSQL.Add('        RPAD(TRIM('+grupoIni+'),12, ''0'')');
      sSQL.Add('        AND');
      sSQL.Add('        RPAD(TRIM('+grupoFim+'),12, ''0'')');
    end;
   // Marcio SOL 172383/9181 / KTN : 1640404 - Inicio
    sSQL.Add('          AND (NOT(GR.FLGANALSINT = ''A'' AND TOTAL.EXERCICIO IS NULL AND TOTAL.PERIODO IS NULL)) ');
   // Marcio SOL 172383/9181 / KTN : 1640404 - fim
    sSQL.Add('GROUP  BY');
    sSQL.Add('         GR.CODGRUPOORC,');
    sSQL.Add('         GR.NOMEGRUPOORCAMEN,');
    sSQL.Add('         TOTAL.PARAMETRO,');
    sSQL.Add('         GR.FLGANALSINT,');
    sSQL.Add('         TOTAL.EXERCICIO,');
    sSQL.Add('         TOTAL.PERIODO');
    sSQL.Add('ORDER BY');
    sSQL.Add('         GR.CODGRUPOORC,GR.NOMEGRUPOORCAMEN,TOTAL.EXERCICIO,TOTAL.PERIODO');

  end;
  sSQL.Add(') Y');
  //sSQL.Add('where y.exercicio is not NULL');  // Marcio SOL 172383/9181 / KTN : 1640404 - linha comentada

end;
// Edilaine Ferraresi - SOL 170798 / KTN 1546958 - fim


function TCtrlRelValoresRealizadoOrcadoPorGrupo.PreencherGrupoorcamenAnaliticoVazio: Boolean;
var
   c,vezes:integer;
   strCodGrupo:string;
   bCadastra:Boolean;
   cdsAux:TClientDataset;
   cdsAux2:TClientDataset;
   vlorcado1,vlorcado2,vlorcado3,vlorcado4,vlorcado5,vlorcado6,vlorcado7,vlorcado8,vlorcado9,
   vlorcado10,vlorcado11,vlorcado12,

   vlrealizado1,vlrealizado2,vlrealizado3,vlrealizado4,vlrealizado5,vlrealizado6,vlrealizado7,
   vlrealizado8,vlrealizado9,vlrealizado10,vlrealizado11,vlrealizado12,

   variacao:real;
begin
   TRY
      MostraStatusRelatGrupo('Totalizando grupos analíticos.');

      cdsAux  := TClientDataset.Create(Application);
      cdsAux2 := TClientDataset.Create(Application);

       // Marcio SOL 172383/9181 / KTN : 1640404 - Inicio
      //Armazena os Grupos Analíticos
      //cdsRelatGrupo.Filtered := false;
      //cdsRelatGrupo.Filter   := 'FLGANALSINT = ' + QuotedStr('A');
      //cdsRelatGrupo.Filtered := true;

      //cdsAux
      cdsAux.Data := cdsRelatGrupo.Data;
      cdsAux.Filtered := False;
      cdsAux.Filter := 'FLGANALSINT = ' + QuotedStr('A');
      cdsAux.Filtered := True;
      cdsAux.IndexFieldNames := 'CODGRUPOORC';
      cdsAux.First;

      //cdsAux2
      cdsAux2.Data := cdsRelatGrupo.Data;
      cdsAux2.Filtered := False;
      cdsAux2.Filter := 'FLGANALSINT = ' + QuotedStr('A');
      cdsAux2.Filtered := True;
      cdsAux2.IndexFieldNames := 'CODGRUPOORC';
      cdsAux2.First;
       // Marcio SOL 172383/9181 / KTN : 1640404 - Fim
      while not cdsAux2.Eof do
      begin

           //Verifca se já não foi cadastrado anteriormente
           //Edilaine - SOL 189231 / KTN 1786548
           case TipoRelatorio of
             trGrupo:
                 bCadastra := cdsRelatGrupo.Locate('CODGRUPOORC',cdsAux2.fieldbyname('CODGRUPOORC').AsString,[]);

             trGrupoCentroCusta,trGrupoCentroResponsabilidade,trGrupoAtividadeProjeto:
                 bCadastra := cdsRelatGrupo.Locate('CODGRUPOORC;PARAMETRO', VarArrayOf([cdsAux2.fieldbyname('CODGRUPOORC').AsString,'0']),[]);
           end;

           //if cdsRelatGrupo.Locate('CODGRUPOORC;PARAMETRO',VarArrayOf([cdsAux2.fieldbyname('CODGRUPOORC').AsString,'0']),[]) then
           if bCadastra then
           begin
             cdsAux2.Next;
             continue;
           end;
           //Edilaine - SOL 189231 / KTN 1786548 - fim

           
           //Zera Variáveis
           vlorcado1  := 0;  vlorcado2  := 0; vlorcado3  := 0; vlorcado4 := 0;
           vlorcado5  := 0;  vlorcado6  := 0; vlorcado7  := 0; vlorcado8 := 0; vlorcado9 := 0;
           vlorcado10 := 0;  vlorcado11 := 0; vlorcado12 := 0;

           vlrealizado1 := 0; vlrealizado2 := 0; vlrealizado3 := 0; vlrealizado4 := 0; vlrealizado5 := 0;   vlrealizado6 := 0;
           vlrealizado7 := 0; vlrealizado8 := 0; vlrealizado9 := 0; vlrealizado10 := 0; vlrealizado11 := 0; vlrealizado12 := 0;
           vezes       := 1;

           MostraStatusRelatGrupo( 'Totalizando grupos analíticos. (' +  intTostr(cdsAux2.Recno)  + '/' +
                                     intTostr(cdsAux2.Recordcount)   +  ') ...');

           cdsAux.Filtered := false;
           cdsAux.Filter   := 'CODGRUPOORC = ' + cdsAux2.fieldbyname('CODGRUPOORC').AsString;
           cdsAux.Filtered := true;

           cdsAux.First;

           while not cdsAux.Eof Do
           begin
                //Carrega Vairáveis
                vlorcado1  := vlorcado1 + cdsAux.FieldByName('ORC' + FormatFloat('00',1)).AsCurrency;
                vlorcado2  := vlorcado2 + cdsAux.FieldByName('ORC' + FormatFloat('00',2)).AsCurrency;
                vlorcado3  := vlorcado3 + cdsAux.FieldByName('ORC' + FormatFloat('00',3)).AsCurrency;
                vlorcado4  := vlorcado4 + cdsAux.FieldByName('ORC' + FormatFloat('00',4)).AsCurrency;
                vlorcado5  := vlorcado5 + cdsAux.FieldByName('ORC' + FormatFloat('00',5)).AsCurrency;
                vlorcado6  := vlorcado6 + cdsAux.FieldByName('ORC' + FormatFloat('00',6)).AsCurrency;
                vlorcado7  := vlorcado7 + cdsAux.FieldByName('ORC' + FormatFloat('00',7)).AsCurrency;
                vlorcado8  := vlorcado8 + cdsAux.FieldByName('ORC' + FormatFloat('00',8)).AsCurrency;
                vlorcado9  := vlorcado9 + cdsAux.FieldByName('ORC' + FormatFloat('00',9)).AsCurrency;
                vlorcado10 := vlorcado10 + cdsAux.FieldByName('ORC' + FormatFloat('00',10)).AsCurrency;
                vlorcado11 := vlorcado11 + cdsAux.FieldByName('ORC' + FormatFloat('00',11)).AsCurrency;
                vlorcado12 := vlorcado12 + cdsAux.FieldByName('ORC' + FormatFloat('00',12)).AsCurrency;

                vlrealizado1  := vlrealizado1 + cdsAux.FieldByName('REA' + FormatFloat('00',1)).AsCurrency;
                vlrealizado2  := vlrealizado2 + cdsAux.FieldByName('REA' + FormatFloat('00',2)).AsCurrency;
                vlrealizado3  := vlrealizado3 + cdsAux.FieldByName('REA' + FormatFloat('00',3)).AsCurrency;
                vlrealizado4  := vlrealizado4 + cdsAux.FieldByName('REA' + FormatFloat('00',4)).AsCurrency;
                vlrealizado5  := vlrealizado5 + cdsAux.FieldByName('REA' + FormatFloat('00',5)).AsCurrency;
                vlrealizado6  := vlrealizado6 + cdsAux.FieldByName('REA' + FormatFloat('00',6)).AsCurrency;
                vlrealizado7  := vlrealizado7 + cdsAux.FieldByName('REA' + FormatFloat('00',7)).AsCurrency;
                vlrealizado8  := vlrealizado8 + cdsAux.FieldByName('REA' + FormatFloat('00',8)).AsCurrency;
                vlrealizado9  := vlrealizado9 + cdsAux.FieldByName('REA' + FormatFloat('00',9)).AsCurrency;
                vlrealizado10 := vlrealizado10 + cdsAux.FieldByName('REA' + FormatFloat('00',10)).AsCurrency;
                vlrealizado11 := vlrealizado11 + cdsAux.FieldByName('REA' + FormatFloat('00',11)).AsCurrency;
                vlrealizado12 := vlrealizado12 + cdsAux.FieldByName('REA' + FormatFloat('00',12)).AsCurrency;

                cdsAux.Next;
           end;

           //Cadastra Grupo Analítico Totalizado
           cdsRelatGrupo.Append;
           cdsRelatGrupo.fieldbyname('CODGRUPOORC').AsString       := cdsAux2.fieldbyname('CODGRUPOORC').AsString;
           cdsRelatGrupo.fieldbyname('FLGANALSINT').AsString       := cdsAux2.fieldbyname('FLGANALSINT').AsString;
           cdsRelatGrupo.FieldByName('NOMEGRUPOORCAMEN').AsString  := cdsAux2.fieldbyname('NOMEGRUPOORCAMEN').AsString;
           cdsRelatGrupo.FieldByName('PARAMETRO').AsString         := '0';


           if (Periodo_Fim >= 1) then
           begin
             cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',1) ).AsInteger        := cdsAux2.FieldByName('EXE'  + FormatFloat('00',1) ).AsInteger;
             cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',1) ).AsInteger        := cdsAux2.FieldByName('PER'  + FormatFloat('00',1) ).AsInteger;
             cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',1)).AsString := cdsAux2.FieldByName('PERIODO_DESCR' + FormatFloat('00',1)).AsString;
             cdsRelatGrupo.FieldByName('ORC' + FormatFloat('00',1)).AsCurrency := vlorcado1;
             cdsRelatGrupo.FieldByName('REA' + FormatFloat('00',1)).AsCurrency := vlrealizado1;
             cdsRelatGrupo.FieldByName('VAR' + FormatFloat('00',1)).AsString   := '0,00%';
             if (VlOrcado1 > 0) and (VlRealizado1 > 0) then cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',1) ).AsString := formatfloat('###,###,##0.00',((VlRealizado1 / VlOrcado1) - 1)*100) + '%'; //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
           end;

           if (Periodo_Fim >= 2) then
           begin
             cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',2) ).AsInteger        := cdsAux2.FieldByName('EXE'  + FormatFloat('00',2) ).AsInteger;
             cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',2) ).AsInteger        := cdsAux2.FieldByName('PER'  + FormatFloat('00',2) ).AsInteger;
             cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',2)).AsString := cdsAux2.FieldByName('PERIODO_DESCR' + FormatFloat('00',2)).AsString;
             cdsRelatGrupo.FieldByName('ORC' + FormatFloat('00',2)).AsCurrency := vlorcado2;
             cdsRelatGrupo.FieldByName('REA' + FormatFloat('00',2)).AsCurrency := vlrealizado2;
             cdsRelatGrupo.FieldByName('VAR' + FormatFloat('00',2)).AsString   := '0,00%';
             if (VlOrcado2 > 0) and (VlRealizado2 > 0) then cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',2) ).AsString := formatfloat('###,###,##0.00',((VlRealizado2 / VlOrcado2) - 1)*100) + '%'; //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
           end;

           if (Periodo_Fim >= 3) then
           begin
             cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',3) ).AsInteger        := cdsAux2.FieldByName('EXE'  + FormatFloat('00',3) ).AsInteger;
             cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',3) ).AsInteger        := cdsAux2.FieldByName('PER'  + FormatFloat('00',3) ).AsInteger;
             cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',3)).AsString := cdsAux2.FieldByName('PERIODO_DESCR' + FormatFloat('00',3)).AsString;
             cdsRelatGrupo.FieldByName('ORC' + FormatFloat('00',3)).AsCurrency := vlorcado3;
             cdsRelatGrupo.FieldByName('REA' + FormatFloat('00',3)).AsCurrency := vlrealizado3;
             cdsRelatGrupo.FieldByName('VAR' + FormatFloat('00',3)).AsString   := '0,00%';
             if (VlOrcado3 > 0) and (VlRealizado3 > 0) then cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',3) ).AsString := formatfloat('###,###,##0.00',((VlRealizado3 / VlOrcado3) - 1)*100) + '%';  //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
           end;

           if (Periodo_Fim >= 4) then
           begin
             cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',4) ).AsInteger        := cdsAux2.FieldByName('EXE'  + FormatFloat('00',4) ).AsInteger;
             cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',4) ).AsInteger        := cdsAux2.FieldByName('PER'  + FormatFloat('00',4) ).AsInteger;
             cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',4)).AsString := cdsAux2.FieldByName('PERIODO_DESCR' + FormatFloat('00',4)).AsString;
             cdsRelatGrupo.FieldByName('ORC' + FormatFloat('00',4)).AsCurrency := vlorcado4;
             cdsRelatGrupo.FieldByName('REA' + FormatFloat('00',4)).AsCurrency := vlrealizado4;
             cdsRelatGrupo.FieldByName('VAR' + FormatFloat('00',4)).AsString   := '0,00%';
             if (VlOrcado4 > 0) and (VlRealizado4 > 0) then cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',4) ).AsString := formatfloat('###,###,##0.00',((VlRealizado4 / VlOrcado4) - 1)*100) + '%'; //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
           end;

           if (Periodo_Fim >= 5) then
           begin
             cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',5) ).AsInteger        := cdsAux2.FieldByName('EXE'  + FormatFloat('00',5) ).AsInteger;
             cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',5) ).AsInteger        := cdsAux2.FieldByName('PER'  + FormatFloat('00',5) ).AsInteger;
             cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',5)).AsString := cdsAux2.FieldByName('PERIODO_DESCR' + FormatFloat('00',5)).AsString;
             cdsRelatGrupo.FieldByName('ORC' + FormatFloat('00',5)).AsCurrency := vlorcado5;
             cdsRelatGrupo.FieldByName('REA' + FormatFloat('00',5)).AsCurrency := vlrealizado5;
             cdsRelatGrupo.FieldByName('VAR' + FormatFloat('00',5)).AsString   := '0,00%';
             if (VlOrcado5 > 0) and (VlRealizado5 > 0) then cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',5) ).AsString := formatfloat('###,###,##0.00',((VlRealizado5 / VlOrcado5) - 1)*100) + '%'; //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
           end;

           if (Periodo_Fim >= 6) then
           begin
             cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',6) ).AsInteger        := cdsAux2.FieldByName('EXE'  + FormatFloat('00',6) ).AsInteger;
             cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',6) ).AsInteger        := cdsAux2.FieldByName('PER'  + FormatFloat('00',6) ).AsInteger;
             cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',6)).AsString := cdsAux2.FieldByName('PERIODO_DESCR' + FormatFloat('00',6)).AsString;
             cdsRelatGrupo.FieldByName('ORC' + FormatFloat('00',6)).AsCurrency := vlorcado6;
             cdsRelatGrupo.FieldByName('REA' + FormatFloat('00',6)).AsCurrency := vlrealizado6;
             cdsRelatGrupo.FieldByName('VAR' + FormatFloat('00',6)).AsString   := '0,00%';
             if (VlOrcado6 > 0) and (VlRealizado6 > 0) then cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',6) ).AsString := formatfloat('###,###,##0.00',((VlRealizado6 / VlOrcado6) - 1)*100) + '%'; //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
           end;

           if (Periodo_Fim >= 7) then
           begin
              cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',7) ).AsInteger        := cdsAux2.FieldByName('EXE'  + FormatFloat('00',7) ).AsInteger;
             cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',7) ).AsInteger         := cdsAux2.FieldByName('PER'  + FormatFloat('00',7) ).AsInteger;
             cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',7)).AsString  := cdsAux2.FieldByName('PERIODO_DESCR' + FormatFloat('00',7)).AsString;
             cdsRelatGrupo.FieldByName('ORC' + FormatFloat('00',7)).AsCurrency := vlorcado7;
             cdsRelatGrupo.FieldByName('REA' + FormatFloat('00',7)).AsCurrency := vlrealizado7;
             cdsRelatGrupo.FieldByName('VAR' + FormatFloat('00',7)).AsString   := '0,00%';
             if (VlOrcado7 > 0) and (VlRealizado7 > 0) then cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',7) ).AsString := formatfloat('###,###,##0.00',((VlRealizado7 / VlOrcado7) - 1)*100) + '%'; //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
           end;

           if (Periodo_Fim >= 8) then
           begin
             cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',8) ).AsInteger        := cdsAux2.FieldByName('EXE'  + FormatFloat('00',8) ).AsInteger;
             cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',8) ).AsInteger        := cdsAux2.FieldByName('PER'  + FormatFloat('00',8) ).AsInteger;
             cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',8)).AsString := cdsAux2.FieldByName('PERIODO_DESCR' + FormatFloat('00',8)).AsString;
             cdsRelatGrupo.FieldByName('ORC' + FormatFloat('00',8)).AsCurrency := vlorcado8;
             cdsRelatGrupo.FieldByName('REA' + FormatFloat('00',8)).AsCurrency := vlrealizado8;
             cdsRelatGrupo.FieldByName('VAR' + FormatFloat('00',8)).AsString   := '0,00%';
             if (VlOrcado8 > 0) and (VlRealizado8 > 0) then cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',8) ).AsString := formatfloat('###,###,##0.00',((VlRealizado8 / VlOrcado8) - 1)*100) + '%'; //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
           end;

           if (Periodo_Fim >= 9) then
           begin
              cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',9) ).AsInteger        := cdsAux2.FieldByName('EXE'  + FormatFloat('00',9) ).AsInteger;
             cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',9) ).AsInteger        := cdsAux2.FieldByName('PER'  + FormatFloat('00',9) ).AsInteger;
             cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',9)).AsString := cdsAux2.FieldByName('PERIODO_DESCR' + FormatFloat('00',9)).AsString;
             cdsRelatGrupo.FieldByName('ORC' + FormatFloat('00',9)).AsCurrency := vlorcado9;
             cdsRelatGrupo.FieldByName('REA' + FormatFloat('00',9)).AsCurrency := vlrealizado9;
             cdsRelatGrupo.FieldByName('VAR' + FormatFloat('00',9)).AsString   := '0,00%';
             if (VlOrcado9 > 0) and (VlRealizado9 > 0) then cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',9) ).AsString := formatfloat('###,###,##0.00',((VlRealizado9 / VlOrcado9) - 1)*100) + '%'; //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
           end;

           if (Periodo_Fim >= 10) then
           begin
             cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',10) ).AsInteger        := cdsAux2.FieldByName('EXE'  + FormatFloat('00',10) ).AsInteger;
             cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',10) ).AsInteger        := cdsAux2.FieldByName('PER'  + FormatFloat('00',10) ).AsInteger;
             cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',10)).AsString := cdsAux2.FieldByName('PERIODO_DESCR' + FormatFloat('00',10)).AsString;
             cdsRelatGrupo.FieldByName('ORC' + FormatFloat('00',10)).AsCurrency:= vlorcado10;
             cdsRelatGrupo.FieldByName('REA' + FormatFloat('00',10)).AsCurrency := vlrealizado10;
             cdsRelatGrupo.FieldByName('VAR' + FormatFloat('00',10)).AsString   := '0,00%';
             if (VlOrcado10 > 0) and (VlRealizado10 > 0) then cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',10) ).AsString := formatfloat('###,###,##0.00', ((VlRealizado10 / VlOrcado10) - 1)*100) + '%'; //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
           end;

           if (Periodo_Fim >= 11) then
           begin
             cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',11) ).AsInteger        := cdsAux2.FieldByName('EXE'  + FormatFloat('00',11) ).AsInteger;
             cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',11) ).AsInteger        := cdsAux2.FieldByName('PER'  + FormatFloat('00',11) ).AsInteger;
             cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',11)).AsString := cdsAux2.FieldByName('PERIODO_DESCR' + FormatFloat('00',11)).AsString;
             cdsRelatGrupo.FieldByName('ORC' + FormatFloat('00',11)).AsCurrency:= vlorcado11;
             cdsRelatGrupo.FieldByName('REA' + FormatFloat('00',11)).AsCurrency := vlrealizado11;
             cdsRelatGrupo.FieldByName('VAR' + FormatFloat('00',11)).AsString   := '0,00%';
             if (VlOrcado11 > 0) and (VlRealizado11 > 0) then cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',11) ).AsString := formatfloat('###,###,##0.00',((VlRealizado11 / VlOrcado11) - 1)*100) + '%'; //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
           end;

           if (Periodo_Fim >= 12) then
           begin
             cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',12) ).AsInteger        := cdsAux2.FieldByName('EXE'  + FormatFloat('00',12) ).AsInteger;
             cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',12) ).AsInteger        := cdsAux2.FieldByName('PER'  + FormatFloat('00',12) ).AsInteger;
             cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',12)).AsString := cdsAux2.FieldByName('PERIODO_DESCR' + FormatFloat('00',12)).AsString;
             cdsRelatGrupo.FieldByName('ORC' + FormatFloat('00',12)).AsCurrency:= vlorcado12;
             cdsRelatGrupo.FieldByName('REA' + FormatFloat('00',12)).AsCurrency := vlrealizado12;
             cdsRelatGrupo.FieldByName('VAR' + FormatFloat('00',12)).AsString   := '0,00%';
             if (VlOrcado12 > 0) and (VlRealizado12 > 0) then cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',12) ).AsString := formatfloat('###,###,##0.00',((VlRealizado12 / VlOrcado12) - 1)*100) + '%'; //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
           end;

           cdsRelatGrupo.Post;

        cdsAux2.Next;
      end;

   FINALLY

      cdsAux.Close;
      cdsAux2.Close;

      FreeAndNil(cdsAux);
      FreeAndNil(cdsAux2);

      cdsRelatGrupo.Filtered := false;
      cdsRelatGrupo.First;

      //Indexando clientedataset conforme tipo de relatório
      if TipoRelatorio = trGrupo then                        //Edilaine - SOL 189231 / KTN 1786548
         cdsRelatGrupo.IndexFieldNames := 'CODGRUPOORC'      //Edilaine - SOL 189231 / KTN 1786548
      else
         cdsRelatGrupo.IndexFieldNames := 'CODGRUPOORC;PARAMETRO';
   END;
end;

function TCtrlRelValoresRealizadoOrcadoPorGrupo.RetornaIndicePeriodoCDS(
  iPeriodo: integer; var TipoPeriodo:string): integer;
begin
     if not cdsRelatPeriodo.Active then exit;

     Result := 0;

     if cdsRelatPeriodo.Locate('PERIODO_BD',iPeriodo,[]) then
     begin
        Result := cdsRelatPeriodo.fieldbyname('PERIODO_CDS').AsInteger;
        TipoPeriodo := cdsRelatPeriodo.fieldbyname('TIPO').AsString;
     end
     else
     begin
        TipoPeriodo := 'N';
        {raise Exception.Create('RetornaIndicePeriodoCDS - período ' + IntToStr(iPeriodo) + ' não localizado na rotina interna.');
        Result := 0;}
     end;
end;

function TCtrlRelValoresRealizadoOrcadoPorGrupo.RetornarListaFiltrosUtilizados(
  strSQL: string): String;
var
  strLinha:string;
  vezes:integer;
  cdsAux:TClientDataset;
  lista:TStringList;
begin

  TRY
    cdsAux := TCMClientDataSet.Create(application);
    lista  := TStringList.Create;
    lista.Clear;
    cdsAux.Data := GetDataPacket(strSQL);
    strLinha := '';

    while not cdsAux.eof do
    begin
         strLinha := strLinha + cdsAux.FieldByName('NOME').AsString + ',';
         cdsAux.Next;
    end;

    Lista.Add(strLinha);

    result := lista.Text;


  FINALLY
    cdsAux.Close;
    FreeAndNil(Lista);
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlRelValoresRealizadoOrcadoPorGrupo.RetornastrMes(
  iPeriodo: integer; const bAbrevidado : boolean ): string;
begin
     Result :='';
     // Edilaine - SOL 188338 / KTN 1775147
     case iPeriodo of
           1: Result := iif(bAbrevidado, 'JAN', 'Janeiro');
           2: Result := iif(bAbrevidado, 'FEV', 'Fevereiro');
           3: Result := iif(bAbrevidado, 'MAR', 'Março');
           4: Result := iif(bAbrevidado, 'ABR', 'Abril');
           5: Result := iif(bAbrevidado, 'MAI', 'Maio');
           6: Result := iif(bAbrevidado, 'JUN', 'Junho');
           7: Result := iif(bAbrevidado, 'JUL', 'Julho');
           8: Result := iif(bAbrevidado, 'AGO', 'Agosto');
           9: Result := iif(bAbrevidado, 'SET', 'Setembro');
          10: Result := iif(bAbrevidado, 'OUT', 'Outubro');
          11: Result := iif(bAbrevidado, 'NOV', 'Novembro');
          12: Result := iif(bAbrevidado, 'DEZ', 'Dezembro');
     end;
     // Edilaine - SOL 188338 / KTN 1775147 - fim
end;


procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.SetcdsCompSaldo(
  const Value: TClientDataSet);
begin
  FcdsCompSaldo := Value;
end;

procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.SetcdsRelatGrupo(
  const Value: TClientDataSet);
begin
  FcdsRelatGrupo := Value;
end;

procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.SetcdsRelatlayout(
  const Value: TClientDataSet);
begin
  FcdsRelatlayout := Value;
end;

procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.SetcdsRelatPeriodo(
  const Value: TClientDataSet);
begin
  FcdsRelatPeriodo := Value;
end;

procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.SetParametros(
  const Value: TCmParamReport);
begin
  FParametros := Value;
end;

procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.SetParametrosUtilizados(
  const Value: TStringList);
begin
  FParametrosUtilizados := Value;
end;

procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.SetTipoRelatorio(
  const Value: TTipoRelValoresRealizadoOrcadoPorGrupo);
begin
  FTipoRelatorio := Value;
end;

function TCtrlRelValoresRealizadoOrcadoPorGrupo.TotalizarGrupos: Boolean;
var
   c:integer;
   vlorcado,vlrealizado,variacao:real;
   cdsAux:TClientDataset;
begin
   TRY
      MostraStatusRelatGrupo('Calculando totais de grupos .');
      cdsRelatGrupo.First;

      while not cdsRelatGrupo.eof Do
      begin
            MostraStatusRelatGrupo( 'Calculando totais de grupos (' +  intTostr(cdsRelatGrupo.Recno)  + '/' +
                                     intTostr(cdsRelatGrupo.Recordcount)   +  ') ...');
   
            vlorcado       := 0;
            vlrealizado    := 0;
            variacao       := 0;

            for c:= 1  to  12  Do
            begin
                vlorcado    := vlorcado    + cdsRelatGrupo.FieldByName('ORC' + FormatFloat('00',c)).AsCurrency;
                vlrealizado := vlrealizado + cdsRelatGrupo.FieldByName('REA' + FormatFloat('00',c)).AsCurrency;
            end;

            cdsRelatGrupo.Edit;
            cdsRelatGrupo.FieldByName('ORC_TOTAL').AsFloat := vlorcado;
            cdsRelatGrupo.FieldByName('REA_TOTAL').AsFloat := vlrealizado;

            if (vlorcado > 0) and (vlrealizado > 0) then
               cdsRelatGrupo.FieldByName('VAR_TOTAL').AsString := formatfloat('###,###,##0.00',((vlrealizado / vlorcado) - 1)*100) + '%' //Wylliam Silva - SOL:250685 PPM: 716016 - Add o "* 100" para concertar a porcentagem
            else
               cdsRelatGrupo.FieldByName('VAR_TOTAL').AsString := '0,00%';

            cdsRelatGrupo.Next;
      end;
   FINALLY
      //Indexando clientedataset conforme tipo de relatório
      if TipoRelatorio = trGrupo then
         cdsRelatGrupo.IndexFieldNames := 'CODGRUPOORC'
      else
         cdsRelatGrupo.IndexFieldNames := 'CODGRUPOORC;PARAMETRO';

   END;
end;

function TCtrlRelValoresRealizadoOrcadoPorGrupo.TotalizarGrupoSintetico: boolean;
var
   PeriIni,PeriFim,c,iPos:integer;    //Edilaine - SOL 189231 / KTN 1786548
   cdsAux:TClientDataset;
begin
   TRY
      MostraStatusRelatGrupo('Calculando totais de grupos sintéticos.');
      cdsAux := TClientDataset.Create(Application);

      //Período Inicial
      PeriIni := StrToInt(Parametros.ParamValues[2].AsString);

      //Período Final / Período Orçado
      if  Parametros.ParamValues[4].AsString = '0' then
          PeriFim := StrToInt(Parametros.ParamValues[3].AsString)
      else
          PeriFim := StrToInt(Parametros.ParamValues[4].AsString);


      //Armazena os Grupos Analíticos
      // Marcio SOL 172383/9181 / KTN : 1640404 - Inicio
      //cdsRelatGrupo.Filtered := false;
      //cdsRelatGrupo.Filter   := 'FLGANALSINT = ' + QuotedStr('A');
      //cdsRelatGrupo.Filtered := true;

      cdsAux.Data := cdsRelatGrupo.Data;
      cdsAux.Filtered := false;
      cdsAux.Filter   := 'FLGANALSINT = ' + QuotedStr('A');
      cdsAux.Filtered := true;
      
     // Marcio SOL 172383/9181 / KTN : 1640404 - Fim
      cdsAux.IndexFieldNames := 'CODGRUPOORC';
      cdsAux.First;

      //Filtra por Grupos Analíticos
      cdsRelatGrupo.Filtered := false;
      cdsRelatGrupo.Filter   := 'FLGANALSINT = ' + QuotedStr('S');
      cdsRelatGrupo.Filtered := true;
      cdsRelatGrupo.First;

      while not cdsRelatGrupo.eof Do
      begin
            MostraStatusRelatGrupo( 'Calculando totais de grupos sintéticos  (' +  intTostr(cdsRelatGrupo.Recno)  + '/' +
                                     intTostr(cdsRelatGrupo.Recordcount)   +  ') ...');

            cdsAux.First;

            while not cdsAux.eof Do
            begin
                //Verifica códigos dos grupos orçamentários
                if (Copy( Trim(cdsAux.fieldbyname('CODGRUPOORC').AsString),
                          1,Length(Trim(cdsRelatGrupo.fieldbyname('CODGRUPOORC').AsString))) =
                          Trim(cdsRelatGrupo.fieldbyname('CODGRUPOORC').AsString))  then
                begin
                    cdsRelatGrupo.Edit;

                    c := 1;    //Edilaine - SOL 189231 / KTN 1786548

                    for iPos := PeriIni to PeriFim Do   //Edilaine - SOL 189231 / KTN 1786548
                    begin

                         cdsRelatGrupo.FieldByName('EXE'  + FormatFloat('00',c) ).AsInteger  :=
                         cdsAux.FieldByName('EXE'  + FormatFloat('00',c) ).AsInteger;

                         cdsRelatGrupo.FieldByName('PER'  + FormatFloat('00',c) ).AsInteger  :=
                         cdsAux.FieldByName('PER'  + FormatFloat('00',c) ).AsInteger;

                         cdsRelatGrupo.FieldByName('PERIODO_DESCR' + FormatFloat('00',c)).AsString :=
                         cdsAux.FieldByName('PERIODO_DESCR' + FormatFloat('00',c)).AsString ;

                         //Valor orçado (somar)
                         cdsRelatGrupo.FieldByName('ORC'  + FormatFloat('00',c) ).AsCurrency :=
                         cdsRelatGrupo.FieldByName('ORC'  + FormatFloat('00',c) ).AsCurrency +
                         cdsAux.FieldByName('ORC'  + FormatFloat('00',c) ).AsCurrency;

                         //Valor realizado (somar)
                         cdsRelatGrupo.FieldByName('REA'  + FormatFloat('00',c) ).AsCurrency :=
                         cdsRelatGrupo.FieldByName('REA'  + FormatFloat('00',c) ).AsCurrency +
                         cdsAux.FieldByName('REA'  + FormatFloat('00',c) ).AsCurrency;

                         //Variação
                         if (cdsRelatGrupo.FieldByName('ORC'  + FormatFloat('00',c) ).AsCurrency > 0) and
                            (cdsRelatGrupo.FieldByName('REA'  + FormatFloat('00',c) ).AsCurrency > 0) then
                         begin

                            cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',c)).AsString :=
                            formatfloat('###,###,##0.00',((cdsRelatGrupo.FieldByName('REA'  + FormatFloat('00',c) ).AsCurrency
                            /cdsRelatGrupo.FieldByName('ORC'  + FormatFloat('00',c) ).AsCurrency) - 1)
                            ) + '%';
                         end
                         else
                            cdsRelatGrupo.FieldByName('VAR'  + FormatFloat('00',c) ).AsString := '0,00%';

                         inc(c);  //Edilaine - SOL 189231 / KTN 1786548
                    end;

                    cdsRelatGrupo.FieldByName('PARAMETRO').AsString := cdsRelatGrupo.FieldByName('NOMEGRUPOORCAMEN').AsString;
                    cdsRelatGrupo.Post;
                end
                else
                begin
                    //Evitar Loops Desnecessários
                    if   (
                         //Código do Grupo Sintético
                         StrToInt(Trim(cdsRelatGrupo.fieldbyname('CODGRUPOORC').AsString))
                         <
                         //Código do Grupo Analítico
                         StrToInt((Copy(Trim(cdsAux.fieldbyname('CODGRUPOORC').AsString),
                         1,Length(Trim(cdsRelatGrupo.fieldbyname('CODGRUPOORC').AsString)))))
                         ) then
                    begin
                         Break;
                    end;
                end;
                
                cdsAux.Next;
            end;

            cdsRelatGrupo.Next;
      end;
   FINALLY

      cdsAux.Close;
      FreeAndNil(cdsAux);

      cdsRelatGrupo.Filtered := false;
      cdsRelatGrupo.First;

      //Indexando clientedataset conforme tipo de relatório
      if TipoRelatorio = trGrupo then
         cdsRelatGrupo.IndexFieldNames := 'CODGRUPOORC'
      else
         cdsRelatGrupo.IndexFieldNames := 'CODGRUPOORC;PARAMETRO';

   END;
end;

//Edilaine - SOL 189231 / KTN 1786548
procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.LimpaListas;
begin
    slstInativa.clear;
    slstAtiva.clear;
end;

// Felipe A. Santos SOL 190485 KTN 1929913
procedure TCtrlRelValoresRealizadoOrcadoPorGrupo.SetidReport(
  const Value: Integer);
begin
  FidReport := Value;
end;
// Felipe A. Santos SOL 190485 KTN 1929913 - FIM
end.
