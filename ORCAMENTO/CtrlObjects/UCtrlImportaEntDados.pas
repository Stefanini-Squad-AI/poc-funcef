// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina......: ValidaDados, GravarOrcamento
Nº SOL......: 190498
Nº KINTANA..: 1969004
Data........: 22/11/2013
Responsável.: Felipe A. Santos
Descrição...: inclusão dos campos Atividade/projeto e Fornecedor/SubDespesa na importação dos dados,
              o campo PLANO DE TRABALHO foi retirado.
{ --------------------------------------------------------------------------------------------------
Rotina......: GravarOrcamento
Nº SOL......: 185723
Nº KINTANA..: 1742408
Data........: 25/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: melhor performance da rotina de importação
{ --------------------------------------------------------------------------------------------------
Rotina......: GravarOrcamento
Nº SOL......: 185145
Nº KINTANA..: 1736433
Data........: 16/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: alterar parâmetros passados na ListaContasEntDados
{--------------------------------------------------------------------------------------------------
Rotina......: GravarOrcamento
Nº SOL......: 184789
Nº KINTANA..: 1731029
Data........: 11/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: alterar parâmetros passados na ListaContasEntDados
{--------------------------------------------------------------------------------------------------
Rotina......: GravarOrcamento
Nº SOL......: 172383-7763
Nº KINTANA..: 1557030
Data........: 01/03/2012
Responsável.: Edilaine Ferraresi
Descrição...: inclusão de novos parâmetros na ListaContasEntDados: Centro de Custo e
              Fornecedor/Sub-Despesa
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ListaPlanoOrcamento, ImportarDados, GravarOrcamento
Nº SOL......: 172383-7765
Nº KINTANA..: 1556948
Data........: 26/03/2012
Responsável.: Edilaine Ferraresi
Descrição...: seleção do parametro Plano Orçamentário na tela de importação
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: GravarOrcamento
Nº SOL......: 166995
Nº KINTANA..: 1462348
Data........: 20/10/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Permitir informar valores negativos.
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ValidarDados
Nº SOL......: 166064
Nº KINTANA..: 1444100
Data........: 10/10/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: Permitir informar valores negativos.
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: Retornar_IdCriterio_porGrupoPeriodo
Nº SOL......: 159250
Nº KINTANA..: 1337824
Data........: 23/08/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: implementação do parãmetros de Programa e Tipo de Despesa
----------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: Retornar_IdCriterio_porGrupoPeriodo
Nº SOL......: 122291
Nº KINTANA..: 597829
Data........: 23/03/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: CLASSE DE CONTROLE DE IMPORTAÇÃO DE ENTRADA DE DADOS ESPECIAS - P.O.
----------------------------------------------------------------------------------------------------}
unit UCtrlImportaEntDados;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, wwQuery, provider,
  Classes, uDbContasOrcamen,  uCMTypes, uFuncoesOrcamento,Windows, Messages,
  Graphics, Controls, Forms, Dialogs, FileCtrl, ComObj,Gauges,
  uCtrlTransacoesPorGrupo,uCtrlPlanPrevContabPatro,uCtrlBlqEntdados,uSistema,
  uCMClientDataSet,uCtrlPadroes,UModulo;

Type
  TCtrlImportaEntDados = class(TCmControlObject)
  private
    sSQL:string;
    FbInterrompe:boolean;
    CtrlTransacoesPorGrupo  : TCtrlTransacoesPorGrupo;
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlBlqEntDados         : TCtrlBlqEntDados;
    FLog: TStringList;
    FHr_Inicial: TDateTime;
    FTotal_Importado:integer;
    FTotal_Importar:integer;
    FcdsExcel: TClientDataSet;
    FCdsPlano: TClientDataSet;
    FCdsPatro: TClientDataSet;
    FCdsPlanoTrab: TClientDataSet;
    FCdsRatCriter: TClientDataSet;
    FcdsGrupoOrcamen: TClientDataSet;
    FcdsContasOrcamen: TClientDataSet;
    FcdsCentroCusto: TClientDataSet;

    //Ricardo de Freitas SOL 159250 KTN 1337824
    FcdsPrograma: TClientDataSet;
    FcdsTipoDespesa : TClientDataSet;
    //Ricardo de Freitas SOL 159250 KTN 1337824 - fim

    // Felipe A. Santos SOL 190498 KTN 1969004
    FcdsSubDespesa : TClientDataSet;
    // Felipe A. Santos SOL 190498 KTN 1969004 - fim

    FbProgresso: TGauge;
    FTotal_Erros:integer;
    procedure SetcdsExcel(const Value: TClientDataSet);
    procedure SetbProgresso(const Value: TGauge);

  private
        //Valida Dados originados do excel
        function ValidarDados:Boolean;
        //Carregar client Dataset de Plano,Patrocinador, Critério de Rateio e etc.
        function CarregarClientDataset:Boolean;
        //Gravar o orçamneto no bando de dados
        function GravarOrcamento( iIdPlanoOrc : integer ):Boolean;  // Edilaine - SOL 172383-7765 / KTN 1556948 - parametro Plano Orçamentário

        // Felipe A. Santos SOL 190498 KTN 1969004
        function RetornaUnidNegoc(CodOrcamen : string) : integer; // Pega o UnidNegoc
        function ListaSubDespesa(pIdDespesaOrc : string): OleVariant; // busca a subdespesa na base de dados
        // Felipe A. Santos SOL 190498 KTN 1969004 - fim
  public
        //Constutor da Classe
        constructor Create(); override;
        //Destrutor da Classe
        destructor  Destory;
        //Realizar Importação para o Banco de Dados
        function ImportarDados( iIdPlanoOrc : integer):Boolean;  // Edilaine - SOL 172383-7765 / KTN 1556948 - parametro Plano Orçamentário
        //Retornar dados de uma planilha EXCEL em data no CLienteDataset
        function ImportarPlanilhaEXCEL(StrCaminho, sAno :string):Boolean;
        //Interromper Importação
        function InterromperImportacao:boolean;
        //ClientDataset que armazena Dados do Excel
        property cdsExcel:TClientDataSet read FcdsExcel write SetcdsExcel;
        //Total de registros a serem importados
        property Total_Importar:integer read FTotal_Importar;
        //Total de registros importados no banco
        property Total_Importado:integer read FTotal_Importado;
        //Barra de Progresso da Tela Principal
        property bProgresso:TGauge read FbProgresso write SetbProgresso;
        //Log da Importação
        property Log: TStringList read FLog;
        //Total de Erros Ocorridos
        property Total_Erros:integer read FTotal_Erros;

        // Edilaine - SOL 172383-7765 / KTN 1556948
        function ListaPlanoOrcamento : OleVariant;

  end;

implementation

{ TCtrlImportaEntDados }

function TCtrlImportaEntDados.CarregarClientDataset: Boolean;
begin
     Result               := false;
     FCdsPlano.Data       := CtrlTransacoesPorGrupo.ListaPlano;
     FCdsPatro.Data       := CtrlTransacoesPorGrupo.ListaPatro;
     FCdsRatCriter.Data   := CtrlTransacoesPorGrupo.ListaReservaRatCriter(Sistema.IdEmpresa);
     FcdsCentroCusto.Data := GetDataPacket('SELECT *  FROM CENTCUST');

     //Ricardo de Freitas SOL 159250 KTN 1337824
     FcdsPrograma.Data    := GetDataPacket(' SELECT IDPROGRAMAORCAMEN,DESCRICAO_PROGRAMAORCAMEN AS PROGRAMA ' +
                                           ' FROM CM.PROGRAMAORCAMEN ORDER BY IDPROGRAMAORCAMEN');

     FcdsTipoDespesa.Data := GetDataPacket(' SELECT IDTIPO_DEPESAORCAMEN,DESCRICAO_TIPO_DEPESAOCAMEN AS TIPODESPESA ' +
                                           ' FROM CM.TIPO_DESPESAORCAMEN ORDER BY IDTIPO_DEPESAORCAMEN');
     //Ricardo de Freitas SOL 159250 KTN 1337824 - fim

     Result               := true;
end;

constructor TCtrlImportaEntDados.create();
begin
     inherited;

     //Instancia Controles
     CtrlTransacoesPorGrupo  := TCtrlTransacoesPorGrupo.Create;
     CtrlTransacoesPorGrupo.InitializeAs(Padroes);

     CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
     CtrlPlanPrevContabPatro.InitializeAs(Padroes);

     CtrlBlqEntDados := TCtrlBlqEntDados.Create;
     CtrlBlqEntDados.InitializeAs(Padroes);

     //Instancia Objetos
     FLog                    := TStringList.Create;
     FCdsPlano               := TClientDataSet.Create(Application);
     FCdsPatro               := TClientDataSet.Create(Application);
     FCdsPlanoTrab           := TClientDataSet.Create(Application);
     FCdsRatCriter           := TClientDataSet.Create(Application);
     FcdsGrupoOrcamen        := TClientDataSet.Create(Application);
     FcdsContasOrcamen       := TClientDataSet.Create(Application);
     FcdsCentroCusto         := TClientDataSet.Create(Application);

     //Ricardo de Freitas SOL 159250 KTN 1337824
     FcdsPrograma            := TClientDataSet.Create(Application);
     FcdsTipoDespesa         := TClientDataSet.Create(Application);
     //Ricardo de Freitas SOL 159250 KTN 1337824 - fim

     // Felipe A. Santos SOL 190498 KTN 1969004
     FcdsSubDespesa          := TClientDataSet.Create(Application);
     // Felipe A. Santos SOL 190498 KTN 1969004 - fim
end;

destructor TCtrlImportaEntDados.Destory;
begin

     //Destroi Objetos
     FreeAndNil(CtrlPlanPrevContabPatro);
     FreeAndNil(CtrlTransacoesPorGrupo);
     FreeAndNil(CtrlBlqEntDados);
     
     FreeAndNil(FLog);

     FCdsPlano.Close;
     FCdsPatro.Close;
     FCdsPlanoTrab.Close;
     FCdsRatCriter.Close;
     FcdsGrupoOrcamen.Close;
     FcdsContasOrcamen.Close;

     FreeAndNil(FCdsPlano);
     FreeAndNil(FCdsPatro);
     FreeAndNil(FCdsPlanoTrab);
     FreeAndNil(FCdsRatCriter);
     FreeAndNil(FcdsGrupoOrcamen);
     FreeAndNil(FcdsContasOrcamen);
     FreeAndNil(FcdsCentroCusto);

     //Ricardo de Freitas SOL 159250 KTN 1337824
     FreeAndNil(FcdsPrograma);
     FreeAndNil(FcdsTipoDespesa);
     //Ricardo de Freitas SOL 159250 KTN 1337824 - fim

     // Felipe A. Santos SOL 190498 KTN 1969004
     FreeAndNil(FcdsSubDespesa);
     // Felipe A. Santos SOL 190498 KTN 1969004 - fim
end;

function TCtrlImportaEntDados.GravarOrcamento(iIdPlanoOrc : integer): Boolean;
var
    iIdPlano,iIdPatro,iUnidNegoc,
    iIdDespesaOrc { Felipe A. Santos SOL 190498 KTN 1969004 } : integer;
    sCodCentRespon:string;

    //Ricardo de Freitas SOL 159250 KTN 1337824
    iIdPrograma,iIdTipoDespesa:integer;
begin
     try
         try
             Result := false;

             //1-)Busca grupo orçamentário
             //-----------------------------------------------------------------
             //-----------------------------------------------------------------
             sSQL := ' SELECT ' +
                     '    DISTINCT ' +
                     '       G.IDGRUPOORCAMEN ' +
                     ' FROM ' +
                     '    GRUPOORCAMEN G, ' +
                     '    CONTASORCAMEN C ' +
                     ' WHERE ' +
                     '     ( G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN ) AND ' +
                     '     ( C.FLGATIVA = ' + QuotedStr('A') + ' ) AND ' +
                     // Edilaine Ferraresi - SOL 172383-7765 / KTN 1556948 - comentada a linha abaixo
                     //'     ( C.IDPLANOORCAMEN = '  +  IntToStr(Modulo.iPlanoOrc)  +  ' ) AND ' + //Ricardo Freitas - SOL 166995
                     '     ( C.IDPLANOORCAMEN = '  +  IntToStr(iIdPlanoOrc) +  ' ) AND ' +  // Edilaine Ferraresi - SOL 172383-7765 / KTN 1556948
                     '     ( G.CODGRUPOORC = ' + QuotedStr(cdsExcel.fieldbyname('CODIGO_GRUPO').AsString) + ')';

             FcdsGrupoOrcamen.Close;
             FcdsGrupoOrcamen.Data := GetDataPacket(sSQL);

             if FcdsGrupoOrcamen.IsEmpty then
             begin
                 Log.Add('Não foi localizado um grupo orçamentário com código: "' + cdsExcel.fieldbyname('CODIGO_GRUPO').AsString + '"');
                 Log.Add('ou grupo não possuí contas orçamnetárias relacionadas(verificar cadastro e parâmetros que estão na planilha excel ).');
                 Exit;
             end;

             //2-)Selecionar as contas orçamentárias conforme exercício\período definido.
             //-----------------------------------------------------------------
             //-----------------------------------------------------------------
             if not CtrlBlqEntDados.TestaEntDadosBlq(Sistema.IdUsuario,Sistema.IdEmpresa,
                                                     cdsExcel.fieldbyname('PERIODO').AsInteger,
                                                     cdsExcel.fieldbyname('EXERCICIO').AsInteger) then
             begin
                  Log.Add(CtrlBlqEntDados.MessageInfo);
                  Exit;
             end;

             // Felipe A. Santos SOL 190498 KTN 1969004

             iIdDespesaOrc  := cdsExcel.FieldByName('IDDESPESAORC').AsInteger;
             iUnidNegoc     := RetornaUnidNegoc(cdsExcel.FieldByName('ATIVIDADEPROJETO').AsString);
             sCodCentRespon := '';

             {

             //Verifica Plano de Trabalho
             if cdsExcel.FieldByName('PLANO_TRABALHO').AsString <> '' then
             begin
                   if not CtrlTransacoesPorGrupo.ValidaPlanoTrab(cdsExcel.FieldByName('PLANO_TRABALHO').AsInteger,
                                                                 Trunc(cdsExcel.FieldByName('EXERCICIO').AsInteger)) then
                   begin
                       Log.Add('Validação Plano Trabalho - '+ CtrlTransacoesPorGrupo.MessageInfo);
                       Exit;
                   end;
             end;

             //Unidade de Negócio e Código de Centro de Custa
             if cdsExcel.FieldByName('PLANO_TRABALHO').AsString <> '' then
             begin
                  if FCdsPlanoTrab.Locate('IDPLANOTRABALHO',cdsExcel.FieldByName('PLANO_TRABALHO').AsString,[]) then
                  begin
                        UnidNegoc     := FCdsPlanoTrab.FieldByName('UNIDNEGOC').AsInteger; 
                       sCodCentRespon := FCdsPlanoTrab.FieldByName('CODCENTRORESPON').AsString;
                  end;
             end;
             }

             // Felipe A. Santos SOL 190498 KTN 1969004 - fim

             iIdPlano := -1;
             iIdPatro := -1;

             if cdsExcel.FieldByName('PLANO_PREVIDENCIARIO').AsString <> '' then
                iIdPlano := cdsExcel.FieldByName('PLANO_PREVIDENCIARIO').AsInteger;
             if cdsExcel.FieldByName('PATROCIONADORA').AsString <> '' then
                iIdPatro := cdsExcel.FieldByName('PATROCIONADORA').AsInteger;


             //Ricardo de Freitas SOL 159250 KTN 1337824
             iIdPrograma    := -1;
             iIdTipoDespesa := -1;

             if cdsExcel.FieldByName('PROGRAMA').AsString <> '' then
                iIdPrograma   := cdsExcel.FieldByName('PROGRAMA').AsInteger;
             if cdsExcel.FieldByName('TIPODESPESA').AsString <> '' then
                iIdTipoDespesa:= cdsExcel.FieldByName('TIPODESPESA').AsInteger;
             //Ricardo de Freitas SOL 159250 KTN 1337824 - fim

             //Validar Planos x Patrocinador
             if (iIdPlano <> -1) and (iIdPatro <> -1) then
             begin
                  if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(iIdPatro, iIdPlano) then
                  begin
                       Log.Add('Relacionamento Inválido de Plano x Patricionadora - ' + CtrlPlanPrevContabPatro.MessageInfo);
                       Exit;
                  end;
             end;

             //Lista contas Orçamentárias do Grupo
             FcdsContasOrcamen.Filter   := '';
             FcdsContasOrcamen.Filtered := False;
             FcdsContasOrcamen.Close;
             FcdsContasOrcamen.Data := CtrlTransacoesPorGrupo.ListaContasEntDados(cdsExcel.Fieldbyname('PERIODO').ASInteger,
                                                                                  cdsExcel.Fieldbyname('EXERCICIO').ASInteger,
                                                                                  Sistema.IdEmpresa,
                                                                                  { Modulo.iPlanoOrc,} //Ricardo Freitas - SOL 166995  // Edilaine Ferraresi - SOL 172383-7765 / KTN 1556948 - comentada
                                                                                  iIdPlanoOrc, // Edilaine Ferraresi - SOL 172383-7765 / KTN 1556948
                                                                                  FcdsGrupoOrcamen.FieldByName('IDGRUPOORCAMEN').AsInteger,
                                                                                  Sistema.IdUsuario,
                                                                                  iUnidNegoc,
                                                                                  sCodCentRespon,
                                                                                  iIdPlano,
                                                                                  iIdPatro,
                                                                                  //Ricardo SOL 159248 KTN 1337823
                                                                                  iIdPrograma,
                                                                                  iIdTipoDespesa,
                                                                                  //Ricardo SOL 159248 KTN 1337823 - fim
                                                                                  // Edilaine - SOL 172383-7763 / KTN 1557030
                                                                                  iIdDespesaOrc, // iIdSubDespesa {Alterado por Felipe A. Santos SOL 190498 KTN 1969004}
                                                                                  Trim(cdsExcel.FieldByName('CENTRO_CUSTO').AsString),   // sCodCentroCusto  // Edilaine - SOL 185723 / KTN 1742408 - passar o centro de custo na query
                                                                                  opInserir,   // Edilaine - SOL 184789 - KTN 1731029 - alterado o opIdle
                                                                                  // Edilaine - SOL 172383-7763 / KTN 1557030 - fim
                                                                                  false,       // Edilaine - SOL 185145 / KTN 1736433 - alterado o false
                                                                                  True);

             // Edilaine - SOL 185723 / KTN 1742408 - comentar o trecho
             // passar o centro de custo na qry de entrada assim os dados vêem filtrados
             {
             //Filtrar as contas orçamentárias por Centro de Custa
             //Não utilizar comando Filter pois a função CalcularRateio usa internamente
             if Trim(cdsExcel.FieldByName('CENTRO_CUSTO').AsString) <> '' then
             begin
                  FcdsContasOrcamen.First;
                  while not FcdsContasOrcamen.Eof Do
                  begin
                      if Trim(FcdsContasOrcamen.FieldByName('CODCENTROCUSTO').AsString) <> Trim(cdsExcel.FieldByName('CENTRO_CUSTO').AsString) then
                      begin
                           FcdsContasOrcamen.Delete;
                      end
                      else
                          FcdsContasOrcamen.Next;
                  end;
             end;

             FcdsContasOrcamen.First;
             }
             // Edilaine - SOL 185723 / KTN 1742408 - fim

             if FcdsContasOrcamen.IsEmpty then
             begin
                  Log.Add('Não há contas orçamentárias para grupo  ' + cdsExcel.fieldbyname('CODIGO_GRUPO').AsString +
                           ' no exercício de ' + cdsExcel.fieldbyname('EXERCICIO').AsString + ' no período: ' +
                           cdsExcel.fieldbyname('PERIODO').AsString);
                  Exit;
             end;


              //3-)Aplicar Critério de Rateio
              //----------------------------------------------------------------
              //----------------------------------------------------------------
              if not CtrlTransacoesPorGrupo.CalcularRateio(
                                              FcdsContasOrcamen,
                                              StrToIntDef(cdsExcel.FieldByName('CRITERIO_RATEIO').AsString,-1),
                                              Sistema.IdEmpresa,
                                              cdsExcel.FieldByName('VALOR_RATEIO').AsCurrency,
                                              'CRITERIO NOME',  //cboRatCriter.Text,
                                              iIdPlano,
                                              iIdPatro,
                                              IntToStr(iUnidNegoc),
                                              sCodCentRespon,

                                              //Ricardo SOL 159248 KTN 1337823
                                              IntToStr(iIdPrograma),
                                              IntToStr(iIdTipoDespesa),
                                              //Ricardo SOL 159248 KTN 1337823 - fim
                    
                                              True,
                                              cdsExcel.FieldByName('PERIODO').AsInteger,
                                              cdsExcel.FieldByName('EXERCICIO').AsInteger) then
              begin
                     Log.Add('Não foi possível efetuar o rateio. ');
                     Log.Add(CtrlTransacoesPorGrupo.MessageInfo);
                     Exit;
              end;

              //4-)Gravar orçamento no banco de Dados
              //----------------------------------------------------------------
              //----------------------------------------------------------------
              if not CtrlTransacoesPorGrupo.CriaSaldoContas(FcdsContasOrcamen.Data,
                                                     cdsExcel.FieldByName('PERIODO').AsInteger,
                                                     Sistema.IdEmpresa,
                                                     (cdsExcel.fieldbyname('SOBREESCREVER').AsString = 'S'),
                                                     iIdDespesaOrc, // Felipe A. Santos SOL 190498 KTN 1969004
                                                     True // Felipe A. Santos SOL 190498 KTN 1969004
                                                     ) then
              begin
                 Log.Add('ERRO ao gravar - ' + CtrlTransacoesPorGrupo.MessageInfo );
                 Exit;
              end; 

              Result := True;

         except
             on E:Exception Do
             begin
                 Log.Add('ERRO ao gravar - ' + E.Message);
                 FTotal_Erros := FTotal_Erros + 1;
             end;
         end;
     finally
         FcdsContasOrcamen.Filter   := '';
         FcdsContasOrcamen.Filtered := false;
         FcdsGrupoOrcamen.Close;
         FcdsContasOrcamen.Close;
     end;   
end;

function TCtrlImportaEntDados.ImportarDados(iIdPlanoOrc : integer): Boolean;
begin
     try
        Result := false;
        try
           //Consistências
           if not cdsExcel.Active then
              raise Exception.Create('Não há dados para serem importados');

           if not cdsExcel.RecordCount = 0 then
              raise Exception.Create('Não há dados para serem importados');

           //Carregar client Dataset de Plano,Patrocinador, Critério de Rateio e etc.
           CarregarClientDataset();

           //Totalizadores
           FTotal_Erros      := 0;
           FTotal_Importado  := 0;
           FHr_Inicial       := Now;
           FbInterrompe      := false;

           //LOG
           Log.Clear;
           Log.Add('============================================================');
           Log.Add('IMPORTAÇÃO DE ORÇAMENTO VIA PLANILHA EXCEL');
           Log.Add('Total de dados a serem importados: ' +  IntToStr(Total_Importar));
           Log.Add('Data: ' + FormatDateTime('dd/mm/yyyy',Now));
           Log.Add('============================================================');
           Log.Add('');

           //Progresso
           bProgresso.MinValue := 0;
           bProgresso.Progress := 0;
           bProgresso.MaxValue := FTotal_Importar;
           Application.ProcessMessages;

           //Loop
           cdsExcel.First;
           cdsExcel.IndexFieldNames := 'LINHA_EXCEL';

           while not cdsExcel.Eof Do
           begin

                //Interrromper Importação
                if (FbInterrompe) then
                begin
                   Break;
                end;

                Log.Add('XLS LINHA - ' + cdsExcel.fieldbyname('LINHA_EXCEL').AsString + '----------------------------------------------');

                //Validar Dados
                if ValidarDados then
                begin
                     //Importar no Banco
                     if GravarOrcamento( iIdPlanoOrc ) then
                     begin
                        FTotal_Importado := FTotal_Importado + 1;
                        Log.Add('Registro importado com sucesso.')
                     end
                     else
                     begin
                        FTotal_Erros := FTotal_Erros + 1;
                        Log.Add('Registro NÃO importado (ERRO).');
                     end;   
                end
                else
                begin
                    //Erro na Validação dos Dados
                    Log.Add('Registro NÃO importado (DADOS INVÁLIDOS).');
                end;

                //Próximo
                cdsExcel.Next;
                bProgresso.Progress := bProgresso.Progress + 1;
                Application.ProcessMessages;

                //Interrromper Importação
                if (FbInterrompe) then
                begin
                   Break;
                end;
           end;

           //Log
           Log.Add('');
           Log.Add('');
           Log.Add('============================================================');
           Log.Add('TOTALIZAÇÃO');
           Log.Add('');
           Log.Add('Duração........................................: ' + FormatDateTime('hh:nn:ss',Now - FHr_Inicial));
           Log.Add('Total de registros do excel...........: ' + IntToStr(Total_Importar));
           Log.Add('Total de registros importados.......: ' + IntToStr(Total_Importado));
           Log.Add('Total de erros...............................: ' + IntToStr(Total_Erros));
           Log.Add('============================================================');
           
           Result := true;
        except
        end;
     finally
        FbInterrompe := false;
        Application.ProcessMessages;
     end;
end;

function TCtrlImportaEntDados.ImportarPlanilhaEXCEL(StrCaminho, sAno : string): Boolean;
var
  Excel:Variant;
  aux:string;
  bFinalizouExcel:boolean;
  linha:integer;
begin
     Result := False;

     if not FileExists(Trim(StrCaminho)) then
        raise Exception.Create('O arquivo não existe com caminho informado.');

     if not cdsExcel.Active then
        raise Exception.Create('Clientdataset de excel não está pronto.');

     try
        cdsExcel.EmptyDataSet;

        Excel := CreateOleObject('Excel.application'); //cria o objeto
        Excel.WorkBooks.Open(StrCaminho);  //abre o arquivo
        bFinalizouExcel := false;
        linha := 2; {1;} // Edilaine Ferraresi - SOL 172383-7765 / KTN 1556948 - desconsidera a linha do cabeçalho
        
        //Total a importar
        FTotal_Importar := 1;
        aux := 'XXX';
        while Trim(aux) <> '' DO
        begin
             // Edilaine Ferraresi - SOL 172383-7765 / KTN 1556948 - desconsidera a linha do cabeçalho
             //aux := Trim(Excel.workbooks[1].sheets[1].cells[FTotal_Importar,'A'].Value);
             aux := Trim(Excel.workbooks[1].sheets[1].cells[FTotal_Importar+1,'A'].Value);
             FTotal_Importar := FTotal_Importar + 1;
        end;

        //Progresso
        bProgresso.Progress := 0;
        bProgresso.MinValue := 0;
        bProgresso.MaxValue := FTotal_Importar;
        Application.ProcessMessages;


        while not bFinalizouExcel Do
        begin
             aux := Trim(Excel.workbooks[1].sheets[1].cells[linha,'A'].Value);

             aux := StringReplace(aux,'.','',[rfReplaceAll]);

             if Trim(aux) <> '' then
             begin
               //Preenche ClientDataset
               cdsExcel.Append;
               cdsExcel.FieldByName('CODIGO_GRUPO').AsString          := aux;//Código do grupo orçamentário
               cdsExcel.FieldByName('PERIODO').AsString               := Excel.workbooks[1].sheets[1].cells[linha,'B'].Value;//Período

               // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974 - comentada linha e alterada posição das demais colunas
               //cdsExcel.FieldByName('EXERCICIO').AsString           := Excel.workbooks[1].sheets[1].cells[linha,'C'].Value;//Exercício
               cdsExcel.FieldByName('EXERCICIO').AsString             := sAno;

               cdsExcel.FieldByName('PLANO_PREVIDENCIARIO').AsString  := Excel.workbooks[1].sheets[1].cells[linha,'C'{'D'}].Value;//Plano previdenciário
               cdsExcel.FieldByName('PATROCIONADORA').AsString        := Excel.workbooks[1].sheets[1].cells[linha,'D'{'E'}].Value;//Patrocinadora
               cdsExcel.FieldByName('ATIVIDADEPROJETO').AsString      := Excel.workbooks[1].sheets[1].cells[linha,'E'{'F'}].Value;//Atividade projeto {Alterado por Felipe A. Santos SOL 190498 KTN 1969004}
               cdsExcel.FieldByName('SOBREESCREVER').AsString         := UpperCase(Excel.workbooks[1].sheets[1].cells[linha,'F'{'G'}].Value);//Sobrescrever
               cdsExcel.FieldByName('CRITERIO_RATEIO').AsString       := Excel.workbooks[1].sheets[1].cells[linha,'G'{'H'}].Value;//Critério para rateio

               if Trim(cdsExcel.FieldByName('CRITERIO_RATEIO').AsString) = '' then
                  cdsExcel.FieldByName('CRITERIO_RATEIO').AsString       := '-1';

               cdsExcel.FieldByName('VALOR_RATEIO').AsString          := Excel.workbooks[1].sheets[1].cells[linha,'H'{'I'}].Value;//Valor total para rateio
               cdsExcel.FieldByName('CENTRO_CUSTO').AsString          := StringReplace(Excel.workbooks[1].sheets[1].cells[linha,'I'{'J'}].Value,'.','',[rfReplaceAll]);//Centro de custo
               cdsExcel.FieldByName('LINHA_EXCEL').AsInteger          := linha;

               //Ricardo de Freitas SOL 159250 KTN 1337824
               cdsExcel.FieldByName('PROGRAMA').AsString         := UpperCase(Excel.workbooks[1].sheets[1].cells[linha,'J'{'K'}].Value);//Sobrescrever

               if Trim(cdsExcel.FieldByName('PROGRAMA').AsString) = '' then
                  cdsExcel.FieldByName('PROGRAMA').AsString       := '0';

               cdsExcel.FieldByName('TIPODESPESA').AsString       := Excel.workbooks[1].sheets[1].cells[linha,'K'{'L'}].Value;//Critério para rateio

               if Trim(cdsExcel.FieldByName('TIPODESPESA').AsString) = '' then
                  cdsExcel.FieldByName('TIPODESPESA').AsString       := '0';
               //Ricardo de Freitas SOL 159250 KTN 1337824 - fim

               // Felipe A. Santos SOL 190498 KTN 1969004
               cdsExcel.FieldByName('IDDESPESAORC').AsString     := Excel.workbooks[1].sheets[1].cells[linha,'L'].Value; // id da subdepesa

               if Trim(cdsExcel.FieldByName('IDDESPESAORC').AsString) = '' then
                  cdsExcel.FieldByName('IDDESPESAORC').AsString := '-1';
               // Felipe A. Santos SOL 190498 KTN 1969004 - fim


               // Edilaine Ferraresi - SOL 172383-7762 / KTN 1556974 - fim

               cdsExcel.Post;
               Inc(linha);

               //Progresso
               bProgresso.Progress := bProgresso.Progress + 1;
               Application.ProcessMessages;
             end
             else
             begin
               bProgresso.Progress := bProgresso.MaxValue;
               cdsExcel.First;
               bFinalizouExcel := True;
             end;
        end;
        Result := True;
     finally
         if cdsExcel.Active then
            FTotal_Importar := cdsExcel.RecordCount
         else
            FTotal_Importar := 0;
         Excel.workbooks.close;   //fechas
     end;
end;

function TCtrlImportaEntDados.InterromperImportacao: boolean;
begin
     Log.Add('');
     Log.Add('ATENÇÃO: Importação Interrompida.');
     Log.Add('');
     FbInterrompe := true;
end;

function TCtrlImportaEntDados.ListaPlanoOrcamento: OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT P.IDPLANOORCAMEN, '+
          '       P.NOMEPLANOORC, '+
          '       P.ANO, P.MASCARAGRUPO '+
          '  FROM PLANOORCAMENTARIO P '+
          'order by P.NOMEPLANOORC';

  result := GetDataPacket( sSQL );
end;

function TCtrlImportaEntDados.RetornaUnidNegoc(
  CodOrcamen: string): integer;
begin
  Result := 0;

  if CodOrcamen <> EmptyStr then
  begin
       _Cds.Data := GetDataPacket('SELECT UNIDNEGOC FROM UNIDNEGOCIO ' +
                                  ' WHERE CODORCAMEN = ' + CodOrcamen +
                                  '   AND UNETIPO = ' + QuotedStr('A'));

       if not(_Cds.IsEmpty) then
          Result := _Cds.Fields[0].AsInteger;
  end;
end;

procedure TCtrlImportaEntDados.SetbProgresso(const Value: TGauge);
begin
  FbProgresso := Value;
end;

procedure TCtrlImportaEntDados.SetcdsExcel(const Value: TClientDataSet);
begin
  FcdsExcel := Value;
end;

function TCtrlImportaEntDados.ValidarDados: Boolean;
var
    aux:string;
    tot_log:integer;
    vl_Rateio: Real;
    Dt:TDateTime;
begin
     TRY
         Result    := false;
         tot_log   := Log.Count;
         vl_Rateio := - 1;

         //Código do grupo orçamentário-----------------------------------------
         aux := Trim(cdsExcel.FieldByName('CODIGO_GRUPO').AsString);

         if aux = '' then
         begin
              Log.Add('Código de grupo não informado.');
         end;

         //Período--------------------------------------------------------------
         aux := Trim(cdsExcel.FieldByName('PERIODO').AsString);

         if aux = '' then Log.Add('Perído não informado.');
         if StrToIntDef(aux,99) = 99 then
              Log.Add('Período deverá ser numérico.')
         else
              if (StrToInt(aux) > 12) or (StrToInt(aux) < 0) then Log.Add('Perído deverá ser compreendido entre 0 à 12.');

         //Exercício------------------------------------------------------------
         aux := Trim(cdsExcel.FieldByName('EXERCICIO').AsString);

         if aux = '' then Log.Add('Exercicío não informado.');
         if StrToIntDef(aux,0) = 0 then Log.Add('Exercicio deverá ser numérico.');
         if Length(aux) <> 4 then Log.Add('Exercicio deverá ter quatro(4) caracteres.');

         //SobreEscrever--------------------------------------------------------
         aux := Trim(cdsExcel.FieldByName('SOBREESCREVER').AsString);

         if aux = '' then Log.Add('Campo Sobrescrever não informado.');
         if ((aux <> 'N') and (aux <> 'S')) then Log.Add('Campo Sobrescrever deverá ser compreendido entre as letras ' +
         QuotedStr('S') + ' e ' + QuotedStr('N') + '.' );

         //Plano previdenciário-------------------------------------------------
         aux := Trim(cdsExcel.FieldByName('PLANO_PREVIDENCIARIO').AsString);

         if aux <> '' then
             if StrToIntDef(aux,0) = 0 then
                Log.Add('Plano previdenciário deverá ser numérico e maior que zero ou nulo.')
             else
             if not FCdsPlano.Locate('IDPLANOPREV',aux,[loPartialKey]) then Log.Add('Não foi localizado um plano previdenciário com o ID = ' + aux);

         //Patrocinadora--------------------------------------------------------
         aux := Trim(cdsExcel.FieldByName('PATROCIONADORA').AsString);

         if aux <> '' then
             if StrToIntDef(aux,0) = 0 then
                Log.Add('Patrocinadora deverá ser numérico e maior que zero ou nulo.')
             else
                 if not FCdsPatro.Locate('IDPATRO',aux,[]) then Log.Add('Não foi localizado um patrocinador com o ID = ' + aux);

         //Plano de trabalho----------------------------------------------------

         //Consulta Plano de Trabalho por Data
         if cdsExcel.FieldByName('PERIODO').AsInteger > 0 then
         begin
              //Mensal
              Dt := StrToDateTime(
                      '01/' +
                      Trim(cdsExcel.FieldByName('PERIODO').AsString) + '/' +
                      Trim(cdsExcel.FieldByName('EXERCICIO').AsString));

              FCdsPlanoTrab.Data   := CtrlTransacoesPorGrupo.ListaPlanoTrab(Sistema.IdUsuario, Sistema.IdEmpresa,Dt);
         end
         else
         begin
              //Anual
              Dt := StrToDateTime(
                      '01/01/' +
                      Trim(cdsExcel.FieldByName('EXERCICIO').AsString));
              FCdsPlanoTrab.Data   := CtrlTransacoesPorGrupo.ListaPlanoTrab(Sistema.IdUsuario, Sistema.IdEmpresa,Dt,True);
         end;

         { // Felipe A. Santos SOL 190498 KTN 1969004
         aux := Trim(cdsExcel.FieldByName('PLANO_TRABALHO').AsString);

         if aux <> '' then
             if StrToIntDef(aux,0) = 0 then
                Log.Add('Plano trabalho deverá ser numérico e maior que zero ou nulo.')
             else
                 if not FCdsPlanoTrab.Locate('IDPLANOTRABALHO',aux,[]) then Log.Add('Não foi localizado um plano de trabalho com o ID = ' + aux);
          } // Felipe A. Santos SOL 190498 KTN 1969004 - fim

         //Valor total para rateio----------------------------------------------
         aux := Trim(cdsExcel.FieldByName('VALOR_RATEIO').AsString);

         //Permitir informar valor "0" para os casos de sobrescrever = 'S' e sem informar
         //critério de rateio pois nestes casos o usuário deseja o saldo das contas
         //orçamentárias do grupo
         if (aux <> '') then
         begin
             TRY
                 vl_Rateio := StrToFloat(aux);
             except
                 vl_Rateio := -1;
                 Log.Add('Valor de rateio informado: "' + aux + '" é um valor inválido.');
             end;
         end
         else
         begin
             Log.Add('Valor de rateio não foi informado');
         end;

         //Critério para rateio-----------------------------------------------------
         aux := Trim(cdsExcel.FieldByName('CRITERIO_RATEIO').AsString);

         if ((aux <> '') and (aux <> '-1')) then
         begin
             if StrToIntDef(aux,0) = 0 then
                Log.Add('Critério de Rateio deverá ser numérico e maior que zero ou nulo.')
             else
             begin
                 if not FCdsRatCriter.Locate('IDCRITERIORATORC',aux,[]) then
                 begin
                      Log.Add('Não foi localizado um critério de rateio com o ID = ' + aux);
                 end
                 else
                 begin
                      if vl_Rateio = - 1 then
                        Log.Add('Foi informado um critério de rateio, o valor de rateio deverá ser informado também.');
                 end;
             end;
         end;

         //Centro de custo----------------------------------------------------------
         aux := Trim(cdsExcel.FieldByName('CENTRO_CUSTO').AsString);

         if aux <> '' then
         begin
               if not FcdsCentroCusto.Locate('CODCENTROCUSTO',aux,[]) then Log.Add('Não foi localizado um centro de custo com o CODIGO = ' + aux);
         end;

         //Ricardo de Freitas SOL 159250 KTN 1337824

         //Programa-------------------------------------------------------------
         aux := Trim(cdsExcel.FieldByName('PROGRAMA').AsString);

         if ((aux <> '') and (aux <> '0') and (aux <> '-1')) then
             if StrToIntDef(aux,0) = 0 then
                Log.Add('Programa deverá ser numérico e maior que zero ou nulo.')
             else
                 if not FCdsprograma.Locate('IDPROGRAMAORCAMEN',aux,[loPartialKey]) then Log.Add('Não foi localizado um programa com o ID = ' + aux);

         //Tipo de Despesa------------------------------------------------------
         aux := Trim(cdsExcel.FieldByName('TIPODESPESA').AsString);

         if ((aux <> '') and (aux <> '0') and (aux <> '-1')) then
             if StrToIntDef(aux,0) = 0 then
                Log.Add('Tipo de Despesa deverá ser numérico e maior que zero ou nulo.')
             else
                 if not FcdsTipoDespesa.Locate('IDTIPO_DEPESAORCAMEN',aux,[loPartialKey]) then Log.Add('Não foi localizado um tipo com o ID = ' + aux);

         //Ricardo de Freitas SOL 159250 KTN 1337824 - fim

         // Felipe A. Santos SOL 190498 KTN 1969004

         //Fornecedor / Sub-despesas--------------------------------------------
         aux := Trim(cdsExcel.FieldByName('IDDESPESAORC').AsString);

         if aux <> '-1' then
         begin
           FcdsSubDespesa.Data := ListaSubDespesa(aux);

           // valida se a subdespesa informada no arquivo está cadastrada bo banco
           if FcdsSubDespesa.IsEmpty then
              Log.Add('Não foi localizado um Fornecedor/Sub-despesas com o ID = ' + aux)
           else
             // verifica se a subdespesa está cadastrada para o grupo que foi informado no arquivo
             if FcdsSubDespesa.FieldByName('CODGRUPOORC').AsString <>
                cdsExcel.FieldByName('CODIGO_GRUPO').AsString then
                Log.Add('O grupo orçamentário não está associado ao Fornecedor/Sub-despesas com o ID = ' + aux);
          end;
         // Felipe A. Santos SOL 190498 KTN 1969004 - fim

         Result := (tot_log = Log.Count);
     EXCEPT
         on E:Exception Do
         begin
             ShowMessage('Erro ao validar dados - ' + E.Message);
         end;
     end;
end;

function TCtrlImportaEntDados.ListaSubDespesa(pIdDespesaOrc : string): OleVariant;
var
   sSQL : string;
begin
   sSQL := 'SELECT D.IDDESPESAORC, ' +
           '       G.CODGRUPOORC ' +
           '  FROM DESPESAORCAMENTARIA D, GRUPOORCAMEN G' +
           ' WHERE D.IDDESPESAORC = ' + pIdDespesaOrc +
           '   AND D.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN';

   Result := GetDataPacket(sSQL);
end;

end.
