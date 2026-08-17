// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Paulo Ramos
// Data        : 01/02/2006
// Rotina      : executaCalculoTabuaServico
// Pendência   : 21452
// Descricao   : Ajuste na rotina de geração das tábuas de serviço (comutação)
//               normal e recalculada.
//------------------------------------------------------------------------------
unit FOkCalculoTabuaServico;

interface        

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDBLookupCombo, Db, DBClient,
  DBTables, Wwquery, uVarCalc, uFuncGerais, Math, uGlobal, ComCtrls,
  Grids, DBGrids;

Type
  TRegraAjuste = Record
    iCD_FORMULA_AJUSTE,
    iNR_IDADE: Integer;
    sIR_CONDICAO: String;
    sVAR_INICIAL,
    sVAR_INICIAL2,
    sVAR_FINAL,
    sVAR_RESULT,
    sFORMULA: String;
  end;

Type
  TfrmOkCalculoTabuaServico = class(TfrmOkCancelar)
    Label3: TLabel;
    CMDBLkpCmbTabuaServico: TCMDBLookupCombo;
    Label1: TLabel;
    CMDBLkpCmbRotinaCalculoTabua: TCMDBLookupCombo;
    Label2: TLabel;
    CMDBLkpCmbTabuaMortalidade: TCMDBLookupCombo;
    Label4: TLabel;
    CMDBLkpCmbTabuaInvalidez: TCMDBLookupCombo;
    Label5: TLabel;
    CMDBLkpCmbTabuaEntradaInvalidez: TCMDBLookupCombo;
    Label6: TLabel;
    CMDBLkpCmbTabuaRotatividade: TCMDBLookupCombo;
    Label7: TLabel;
    EdtDescricao: TEdit;
    ClntDtStTabuaServico: TClientDataSet;
    ClntDtStTabuaServicoIR_TIPO_TABUA_SERVICO: TStringField;
    ClntDtStTabuaServicoDS_TIPO_TABUA_SERVICO: TStringField;
    qryLkpRotinaCalculoTabua: TwwQuery;
    qryLkpTabuaMortalidade: TwwQuery;
    qryLkpTabuaInvalidez: TwwQuery;
    qryLkpTabuaEntradaInvalidez: TwwQuery;
    qryLkpTabelaRotatividade: TwwQuery;
    qryLkpTabuaMortalidadeCD_TABUA: TFloatField;
    qryLkpTabuaMortalidadeDS_TABUA: TStringField;
    qryLkpTabuaMortalidadeIR_DOMINIO_SISTEMA: TStringField;
    qryLkpTabuaInvalidezCD_TABUA: TFloatField;
    qryLkpTabuaInvalidezDS_TABUA: TStringField;
    qryLkpTabuaInvalidezIR_DOMINIO_SISTEMA: TStringField;
    qryLkpTabuaEntradaInvalidezCD_TABUA: TFloatField;
    qryLkpTabuaEntradaInvalidezDS_TABUA: TStringField;
    qryLkpTabuaEntradaInvalidezIR_DOMINIO_SISTEMA: TStringField;
    qryLkpTabelaRotatividadeCD_TABUA: TFloatField;
    qryLkpTabelaRotatividadeDS_TABUA: TStringField;
    qryLkpTabelaRotatividadeIR_DOMINIO_SISTEMA: TStringField;
    qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA: TFloatField;
    qryLkpRotinaCalculoTabuaDS_GRUPO_FORMULA: TStringField;
    qryLkpRotinaCalculoTabuaIR_GRUPO_CALCULO: TStringField;
    QryVariaveisRotina: TwwQuery;
    QryVariaveisRotinaNO_VARIAVEL: TStringField;
    QryVariaveisRotinaVL_DEFAULT: TFloatField;
    QryInsOcorTabuaComutacao: TwwQuery;
    QryInsTabuaComutacao: TwwQuery;
    QryMaxVersao: TwwQuery;
    QryMaxVersaoMAX_COD: TFloatField;
    QryRegraAjusteVersao: TwwQuery;
    QryDelOcorTabuaComutacao: TwwQuery;
    QryRegraAjusteVersaoSQ_VERSAO_COMUTACAO: TFloatField;
    QryRegraAjusteVersaoCD_GRUPO_FORMULA: TFloatField;
    QryRegraAjusteVersaoCD_FORMULA: TFloatField;
    QryRegraAjusteVersaoNR_ORDEM_FORMULA: TFloatField;
    QryRegraAjusteVersaoCD_FORMULA_AJUSTE: TFloatField;
    QryRegraAjusteVersaoIR_CONDICAO_AJUSTE: TStringField;
    QryRegraAjusteVersaoNO_VARIAVEL_INICIAL: TStringField;
    QryRegraAjusteVersaoNO_VARIAVEL_INICIAL2: TStringField;
    QryRegraAjusteVersaoNO_VARIAVEL_FINAL: TStringField;
    QryRegraAjusteVersaoNO_VARIAVEL_RESULT: TStringField;
    QryRegraAjusteVersaoDS_FORMULA: TMemoField;
    QryRegraAjusteVersaoNR_IDADE: TFloatField;
    pbrTabServico2: TProgressBar;
    pbrTabServico1: TProgressBar;
    qryLkpRotinaCalculoTabuaDS_OBSERV_FORMULA: TMemoField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    bCancelado: Boolean;
    variavelCalculo: TVarCalc;
    lstTabuas, lstAdvertencias: TStringList;
    function ExecutaFormula(sVAR_INICIAL, sVAR_INICIAL2, sVAR_FINAL, sVAR_RESULT, sFORMULA: String): Extended;
    function CalculaExpressaoRecursiva(sCADEIA: String): Extended;
    function valorComutacao(sNOME_VARIAVEL: String; iIDADE: Integer; iIDADE_PENSAO: Integer = -1): Extended;
    function existemCriticas: Boolean;
    function setTabuaComutacao: Integer;
    function getRegraAjuste(iSQ_VERSAO_TABUA, iCD_ROTINA, iCD_FORMULA, iNR_IDADE: Integer): TRegraAjuste;
    function getValorOcorrenciaTabua(iSQ_VERSAO_TABUA, iNR_IDADE: Integer; sNO_VARIAVEL: String): Extended;
    procedure inicializaValorPadraoVariaveis;
    procedure setOcorrenciasTabua(iCD_VERSAO_TABUA: Integer);
    procedure setValoresArquivo;
    procedure executaCalculoTabuaServico;
    procedure calculaTabuaServico;
    procedure calculaTabuaPensao;
    procedure executaCalculoTabuaPensao;
    procedure setValoresArquivoPensao;
    procedure setOcorrenciasTabua_Pensao(iCD_VERSAO_TABUA: Integer);

  public
    { Public declarations }

  end;

var
  lstVariavelReajuste: TStringList;
  frmOkCalculoTabuaServico: TfrmOkCalculoTabuaServico;
  iSQ_VERSAO_RECALCULO, iSQ_VERSAO_PENSAO, iCD_TABUA_MORTALIDADE, iCD_TABUA_INVALIDEZ, iCD_TABUA_ENTRADA_INVALIDEZ,
     iCD_TABUA_ROTATIVIDADE, iCD_ROTINA_CALCULO_TABUA: Integer;
  sIR_TIPO_TABUA, sDS_VERSAO: String;

  LogString:TStringList;
  HoraIni, HoraFim:String;

implementation

uses dBaseDados, uCalculoTabuaServico, uExpresCalc,
  FOkListaAdvertencias;

{$R *.DFM}

procedure TfrmOkCalculoTabuaServico.FormCreate(Sender: TObject);
begin
   ClntDtStTabuaServico.CreateDataSet;
   ClntDtStTabuaServico.AppendRecord(['Comutação Normal (Padrão)', 'N']);
   ClntDtStTabuaServico.AppendRecord(['Comutação Ajustada', 'A']);
   ClntDtStTabuaServico.AppendRecord(['Tábua de Pensão', 'P']);

   qryLkpRotinaCalculoTabua.Open;
   qryLkpTabuaMortalidade.Open;
   qryLkpTabuaInvalidez.Open;
   qryLkpTabuaEntradaInvalidez.Open;
   qryLkpTabelaRotatividade.Open;

   iSQ_VERSAO_RECALCULO := -1;
   iSQ_VERSAO_PENSAO := -1;
   iCD_TABUA_MORTALIDADE := -1;
   iCD_TABUA_INVALIDEZ := -1;
   iCD_TABUA_ENTRADA_INVALIDEZ := -1;
   iCD_TABUA_ROTATIVIDADE := -1;
   iCD_ROTINA_CALCULO_TABUA := -1;
   sIR_TIPO_TABUA := '';
   sDS_VERSAO := '';

   inherited;
end;

procedure TfrmOkCalculoTabuaServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   ClntDtStTabuaServico.Close;
   qryLkpRotinaCalculoTabua.Close;
   qryLkpTabuaMortalidade.Close;
   qryLkpTabuaInvalidez.Close;
   qryLkpTabuaEntradaInvalidez.Close;
   qryLkpTabelaRotatividade.Close;

   inherited;
end;

function TfrmOkCalculoTabuaServico.ExecutaFormula(sVAR_INICIAL, sVAR_INICIAL2, sVAR_FINAL, sVAR_RESULT, sFORMULA: String): Extended;
var i, iValorInicial, iValorFinal, iVALOR_INICIAL1, iVALOR_INICIAL2: Integer;
    bINDEXADA: Boolean;
begin
   Result := 0;

   bINDEXADA := (Trim(sVAR_INICIAL) <> '') and (Trim(sVAR_INICIAL2) <> '');
   If bINDEXADA then
   Begin
      iVALOR_INICIAL1 := variavelCalculo.GetVarValue(sVAR_INICIAL);
      iVALOR_INICIAL2 := variavelCalculo.GetVarValue(sVAR_INICIAL2);

      If iVALOR_INICIAL2 > iVALOR_INICIAL1 then
         iValorInicial := iVALOR_INICIAL2
      Else
         iValorInicial := iVALOR_INICIAL1;
   End
   //Verifica Parâmetros do Somatório.
   Else If sVAR_INICIAL = '' then
           iValorInicial := 0
        Else
        Begin
           iValorInicial := variavelCalculo.GetVarValue(sVAR_INICIAL);
        End;

   If sVAR_FINAL = '' then
      iValorFinal := 0
   Else
      iValorFinal := variavelCalculo.GetVarValue(sVAR_FINAL);


   //Executa Somatório da Fórmula.
   If iValorInicial <= iValorFinal then
      For i := iValorInicial to iValorFinal do
      Begin
         //Atualiza Variável Indexada do Somatório.
         If sVAR_INICIAL <> '' then
         Begin
            If bINDEXADA then
            Begin
               variavelCalculo.SetVarValue(sVAR_INICIAL, iVALOR_INICIAL1);
               variavelCalculo.SetVarValue(sVAR_INICIAL2, iVALOR_INICIAL2);

               Inc(iVALOR_INICIAL1);
               Inc(iVALOR_INICIAL2);
            End
            Else
            Begin
               variavelCalculo.SetVarValue(sVAR_INICIAL, i);
            End;

            variavelCalculo.SetVarValue(sVAR_RESULT, Result);
         End;

         //Executa Fórmula.
         Result := Result + CalculaExpressaoRecursiva(sFORMULA);
   End
   Else
      For i := iValorFinal to iValorInicial do
      Begin
         //Atualiza Variável Indexada do Somatório.
         If sVAR_INICIAL <> '' then
         Begin
            If bINDEXADA then
            Begin
               variavelCalculo.SetVarValue(sVAR_INICIAL, iVALOR_INICIAL1);
               variavelCalculo.SetVarValue(sVAR_INICIAL2, iVALOR_INICIAL2);

               Dec(iVALOR_INICIAL1);
               Dec(iVALOR_INICIAL2);
            End
         Else
         Begin
            variavelCalculo.SetVarValue(sVAR_INICIAL, i);
         End;

         variavelCalculo.SetVarValue(sVAR_RESULT, Result);
      End;

      //Executa Fórmula.
      Result := Result + CalculaExpressaoRecursiva(sFORMULA);
   End;

   //Atualiza Somatório na Variável de Resultado.
   variavelCalculo.SetVarValue(sVAR_RESULT, Result);
end;


function TfrmOkCalculoTabuaServico.CalculaExpressaoRecursiva(sCADEIA: String): Extended;
var Expressao: TExpresCalc;
    variavelIndexada: Variant;       // Variável Alias correspondente à Var. Original Ex: Var1;
    sVariavelIndexadaOrigem: String; // Variável indexada - Texto original ex: N_x[1+2];
    sIndice, sNOME_VARIAVEL: String;
    fValor, fResultadoIndice: Extended;
    lstINDICE: TStringList;
    fINDICE, fINDICE_PENSAO: Extended;
begin
   Try
      lstINDICE := TStringList.Create;

      Expressao := TExpresCalc.Create; // Cria instância de TExpressao
      Expressao.FVarCalcList := @variavelCalculo;

      If sCADEIA = '' Then
      Begin
         MessageDlg('Fórmula não informada. Verifique o cadastro de Fórmulas.', mtWarning, [mbOk], 0);
         Exit;
      End
      Else
      Begin
         // Estrutura e valida expressao - Primeira chamada
         If Expressao.Expressao_Valida(sCADEIA) Then
         Begin
            Expressao.Prepara_Expressao(sCADEIA);

            variavelIndexada := Expressao.Variavel_Indexada;

            While variavelIndexada <> Null Do
            Begin
               // Recuperar a variável indexada original -> GetIndexedVar
               sVariavelIndexadaOrigem := Expressao.GetIndexedVar(variavelIndexada);

               // Recupera apenas o índice da variável indexada
               sIndice := copy(sVariavelIndexadaOrigem, pos('[', sVariavelIndexadaOrigem) + 1,
                               Length(sVariavelIndexadaOrigem) - (pos('[', sVariavelIndexadaOrigem) + 1));

               If pos(':', sIndice) > 0 then
               Begin
                  ExtractStrings([':'], [' '], PChar(sIndice), lstINDICE);

                  // Calcula expressão da variável indexada recursivamente
                  fINDICE := CalculaExpressaoRecursiva(lstINDICE[0]);
                  fINDICE_PENSAO := CalculaExpressaoRecursiva(lstINDICE[1]);

                  // Recupera nome da variavel indexada
                  sNOME_VARIAVEL := copy(sVariavelIndexadaOrigem, 1, pos('[', sVariavelIndexadaOrigem) - 1);

                  // Recupera Valor na tabela de comutação
                  fValor := valorComutacao(sNOME_VARIAVEL, Floor(fINDICE), Floor(fINDICE_PENSAO));

                  Expressao.SetIndexedVarValue(variavelIndexada, fValor);

                  // Verifica se existe outra variável indexada
                  variavelIndexada := Expressao.Variavel_Indexada;
               End
               Else
               Begin
               //---
                  // Calcula expressão da variável indexada recursivamente
                  fResultadoIndice := CalculaExpressaoRecursiva(sIndice);

                  // Recupera nome da variavel indexada
                  sNOME_VARIAVEL := copy(sVariavelIndexadaOrigem, 1, pos('[', sVariavelIndexadaOrigem) - 1);

                  // Recupera Valor na tabela de comutação
                  fValor := valorComutacao(sNOME_VARIAVEL, Floor(fResultadoIndice));

                  Expressao.SetIndexedVarValue(variavelIndexada, fValor);

                  // Verifica se existe outra variável indexada
                  variavelIndexada := Expressao.Variavel_Indexada;
               End;
            End; //while

            // Calcula expressão final
            Result := Expressao.Calcula_Expressao;
         End //if
         Else
         Begin
            MessageDlg('Erro Fatal - Expressão com erro de sintaxe', mtError, [mbOk], 0);
            Exit;
         End; //else
      End; //else
   Finally
     FreeAndNil(lstINDICE);
     Expressao.Destroy;
   End;
end;

procedure TfrmOkCalculoTabuaServico.bbtnConfirmarClick(Sender: TObject);
begin
   bCancelado := False;
   If existemCriticas then
      Exit;

   Try
      lstAdvertencias := TStringList.Create;
      lstFormulasComSomatorio := TStringList.Create;
      lstFormulasComSomatorio.Sorted := True;
      lstFormulasComSomatorio.Duplicates := dupIgnore;

      If iSQ_VERSAO_PENSAO <= 0 then
         calculaTabuaServico
      Else
         calculaTabuaPensao;

      If lstAdvertencias.Count > 0 then
         Try
            frmOkListaAdvertencias := TfrmOkListaAdvertencias.Create(nil);
            frmOkListaAdvertencias.lstAdvertencias := Self.lstAdvertencias;
            frmOkListaAdvertencias.ShowModal;
         Finally
            frmOkListaAdvertencias.Release;
            frmOkListaAdvertencias := nil;
         End;
   Finally
      FreeAndNil(lstFormulasComSomatorio);
   End;
end;

function TfrmOkCalculoTabuaServico.existemCriticas: Boolean;
begin
   Result := False;

   If Trim(CMDBLkpCmbTabuaServico.Text) = '' then
   Begin
      MessageDlg('Favor informar o Tipo de Tábua de Serviço.', mtWarning, [mbOk], 0);
      CMDBLkpCmbTabuaServico.SetFocus;
      Result := True;
      Exit;
   End;

   If Trim(CMDBLkpCmbRotinaCalculoTabua.Text) = '' then
   Begin
      MessageDlg('Favor informar a Rotina de Cálculo da Tábua.', mtWarning, [mbOk], 0);
      CMDBLkpCmbRotinaCalculoTabua.SetFocus;
      Result := True;
      Exit;
   End;

   If Trim(CMDBLkpCmbTabuaMortalidade.Text) = '' then
   Begin
      MessageDlg('Favor informar a Tábua de Mortalidade.', mtWarning, [mbOk], 0);
      CMDBLkpCmbTabuaMortalidade.SetFocus;
      Result := True;
      Exit;
   End;

   If (Trim(CMDBLkpCmbTabuaInvalidez.Text) <> '') and
      (Trim(CMDBLkpCmbTabuaEntradaInvalidez.Text) = '') then
   Begin
      MessageDlg('As Tábuas de Invalidez e Entrada em Invalidez devem ser informadas simultaneamente.', mtWarning, [mbOk], 0);
      Result := True;
      Exit;
   End
end;

function TfrmOkCalculoTabuaServico.valorComutacao(sNOME_VARIAVEL: String; iIDADE: Integer; iIDADE_PENSAO: Integer = -1): Extended;
begin
   If iIDADE_PENSAO = -1 then
   Begin
      If iIDADE < iIDADE_MINIMA then
         Result := getValorIdade(iIDADE_MINIMA, sNOME_VARIAVEL)
      Else If iIDADE > iIDADE_MAXIMA then
              Result := getValorIdade(iIDADE_MAXIMA, sNOME_VARIAVEL)
           Else
              Result := getValorIdade(iIDADE, sNOME_VARIAVEL);
   End
   Else
   Begin
      If iIDADE < iIDADE_MINIMA then
         iIDADE := iIDADE_MINIMA
      Else If iIDADE > iIDADE_MAXIMA then
              iIDADE := iIDADE_MAXIMA;

      If iIDADE_PENSAO < iIDADE_MINIMA then
         iIDADE_PENSAO := iIDADE_MINIMA
      Else If iIDADE_PENSAO > iIDADE_MAXIMA then
              iIDADE_PENSAO := iIDADE_MAXIMA;

     Result := getValorIdadePensao(iIDADE, iIDADE_PENSAO, sNOME_VARIAVEL);
   End;
end;

procedure TfrmOkCalculoTabuaServico.inicializaValorPadraoVariaveis;
begin
   Try
      QryVariaveisRotina.Close;
      QryVariaveisRotina.ParamByName('CD_GRUPO_FORMULA').asInteger := qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger;
      QryVariaveisRotina.Open;

      While not QryVariaveisRotina.Eof do
      Begin
         variavelCalculo.SetVarValue(QryVariaveisRotinaNO_VARIAVEL.asString, QryVariaveisRotinaVL_DEFAULT.asFloat);
         QryVariaveisRotina.Next;
      End; //while
   Finally
      QryVariaveisRotina.Close;
   End;
end;

function TfrmOkCalculoTabuaServico.setTabuaComutacao: Integer;
begin
   With QryInsTabuaComutacao do
   Begin
      QryMaxVersao.Open;
      ParamByName('SQ_VERSAO_COMUTACAO').asInteger := QryMaxVersaoMAX_COD.asInteger + 1;
      QryMaxVersao.Close;

      If Trim(CMDBLkpCmbTabuaRotatividade.Text) <> '' then
         ParamByName('CD_TABUA_ROTATIV').asInteger := qryLkpTabelaRotatividadeCD_TABUA.asInteger
      Else
         ParamByName('CD_TABUA_ROTATIV').Clear;

      If Trim(CMDBLkpCmbTabuaEntradaInvalidez.Text) <> '' then
         ParamByName('CD_TABUA_ENTRADA_INVALID').asInteger := qryLkpTabuaEntradaInvalidezCD_TABUA.asInteger
      Else
         ParamByName('CD_TABUA_ENTRADA_INVALID').Clear;

      If Trim(CMDBLkpCmbTabuaInvalidez.Text) <> '' then
         ParamByName('CD_TABUA_INVALID').asInteger := qryLkpTabuaInvalidezCD_TABUA.asInteger
      Else
         ParamByName('CD_TABUA_INVALID').Clear;

      If Trim(CMDBLkpCmbTabuaMortalidade.Text) <> '' then
         ParamByName('CD_TABUA_MORTAL').asInteger := qryLkpTabuaMortalidadeCD_TABUA.asInteger
      Else
         ParamByName('CD_TABUA_MORTAL').Clear;

      If Trim(CMDBLkpCmbRotinaCalculoTabua.Text) <> '' then
         ParamByName('CD_GRUPO_FORMULA').asInteger := qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger
      Else
         ParamByName('CD_GRUPO_FORMULA').Clear;

      ParamByName('IR_VERSAO_COMUTACAO').asString := ClntDtStTabuaServicoIR_TIPO_TABUA_SERVICO.asString;
      ParamByName('DS_VERSAO_COMUTACAO').asString := EdtDescricao.Text;
      ParamByName('DT_GERACAO').asDateTime := Now;
      Try
         Result := ParamByName('SQ_VERSAO_COMUTACAO').asInteger;
         ExecSQL;
      Except
         Result := -1;
      End;
   End; //with
end;

procedure TfrmOkCalculoTabuaServico.setOcorrenciasTabua(iCD_VERSAO_TABUA: Integer);
var i, j: Integer;
begin
   With QryInsOcorTabuaComutacao do
   Begin
      For i := iIDADE_MINIMA to iIDADE_MAXIMA do
      Begin
         ParamByName('NR_IDADE').asInteger := i;
         ParamByName('SQ_VERSAO_COMUTACAO').asInteger := iCD_VERSAO_TABUA;

         For j := 1 to High(Tabua_Servico[i][0].sNO_VARIAVEL) do
         Begin
            ParamByName('NO_VARIAVEL').asString := Tabua_Servico[i][0].sNO_VARIAVEL[j];
            ParamByName('VL_FATOR_COMUTACAO').asFloat := Tabua_Servico[i][0].fVL_CALCULO[j];
            ParamByName('NR_IDADE_PENSAO').asInteger := 0;
            Try
               If Trim(ParamByName('NO_VARIAVEL').asString) <> '' then
                  ExecSQL;
            Except End;
         End; //for
      End; //for
   End; //with
end;

procedure TfrmOkCalculoTabuaServico.executaCalculoTabuaServico;
var i, j, iFORMULA: Integer;
    bCalculoReajuste: Boolean;
    fResultado: Extended;
    regraAjuste: TRegraAjuste;
begin
   //Inicializa fórmulas na memória para otimizar o processo.
   setListaFormulas;

   //Executa Fórmulas que não possuem variável de Somatório.
   lstVariavelReajuste.Clear;
   For i := iIDADE_MINIMA to iIDADE_MAXIMA do
   Begin
      variavelCalculo.SetVarValue('w', iIDADE_MAXIMA);

      //Loop das Fórmulas da Rotina selecionada.
      iFormula:=1;
      While iFormula <= High(formulas) do
      Begin
         If formulas[iFORMULA].iCD_FORMULA <= 0 then
            Break;

         If i = iIDADE_MINIMA then
         Begin
            If (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
               (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
               (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
            Begin
               variavelCalculo.SetVarValue('l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));
               setValorIdade(iIDADE_MINIMA, 'l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));

               variavelCalculo.SetVarValue('l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));
               setValorIdade(iIDADE_MINIMA, 'l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));

               variavelCalculo.SetVarValue('l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
               setValorIdade(iIDADE_MINIMA, 'l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
            End;

            If (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x') or
               (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
               (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
               (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
            Begin
               inc(iFormula); 
               Continue;
            End;
         End; //if


         variavelCalculo.SetVarValue('x', i);

         //-- Verifica se existe regra de ajuste   FI_REGRA_AJUSTE_COMUTACAO.SQ_VERSAO_COMUTACAO = :iSQ_VERSAO_RECALCULO
         //-- Se existir regra de ajuste , acessar para esta idade / variavel de resultado a tabela de serviço
         //-- que foi selecionada para recalculo
         //FI_OCOR_TABUA_COMUTACAO.[SQ_VERSAO_COMUTACAO, NO_VARIAVEL, NR_IDADE].VL_FATOR_COMUTACAO
         //-- Se o valor calculado for igual a condição da regra de afuste substituir formula padrão pela
         //-- fórmula de ajsuste
         //IR_CONDICAO_AJUSTE('Z', 'N')

         regraAjuste := getRegraAjuste(iSQ_VERSAO_RECALCULO,
                        qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger, formulas[iFORMULA].iCD_FORMULA, i);

         If iSQ_VERSAO_RECALCULO > 0 then
         Begin
            If (regraAjuste.iNR_IDADE >= 0) and (i >= regraAjuste.iNR_IDADE) then
            Begin
               bCalculoReajuste := False;

               If regraAjuste.sIR_CONDICAO = 'Z' then
               Begin
                  If (lstVariavelReajuste.IndexOf(formulas[iFORMULA].sNO_VARIAVEL_RESULT) >= 0) or
                     (getValorOcorrenciaTabua(iSQ_VERSAO_RECALCULO, i, formulas[iFORMULA].sNO_VARIAVEL_RESULT) = 0) then
                  Begin
                     bCalculoReajuste := True;
                     If lstVariavelReajuste.IndexOf(formulas[iFORMULA].sNO_VARIAVEL_RESULT) = -1 then
                        lstVariavelReajuste.Add(formulas[iFORMULA].sNO_VARIAVEL_RESULT);

                     fResultado := ExecutaFormula(regraAjuste.sVAR_INICIAL, regraAjuste.sVAR_INICIAL2, regraAjuste.sVAR_FINAL,
                                                  regraAjuste.sVAR_RESULT, regraAjuste.sFORMULA);
                  End;
               End
               Else If regraAjuste.sIR_CONDICAO = 'N' then
                    Begin
                       If (lstVariavelReajuste.IndexOf(formulas[iFORMULA].sNO_VARIAVEL_RESULT) >= 0) or
                          (getValorOcorrenciaTabua(iSQ_VERSAO_RECALCULO, i, formulas[iFORMULA].sNO_VARIAVEL_RESULT) < 0) then
                       Begin
                          bCalculoReajuste := True;
                          If lstVariavelReajuste.IndexOf(formulas[iFORMULA].sNO_VARIAVEL_RESULT) = -1 then
                             lstVariavelReajuste.Add(formulas[iFORMULA].sNO_VARIAVEL_RESULT);

                          fResultado := ExecutaFormula(regraAjuste.sVAR_INICIAL, regraAjuste.sVAR_INICIAL2, regraAjuste.sVAR_FINAL,
                          regraAjuste.sVAR_RESULT, regraAjuste.sFORMULA);
                       End;
                    End
                    Else If regraAjuste.sIR_CONDICAO = 'I' then
                         Begin
                            bCalculoReajuste := True;
                            If lstVariavelReajuste.IndexOf(formulas[iFORMULA].sNO_VARIAVEL_RESULT) = -1 then
                               lstVariavelReajuste.Add(formulas[iFORMULA].sNO_VARIAVEL_RESULT);

                            fResultado := ExecutaFormula(regraAjuste.sVAR_INICIAL, regraAjuste.sVAR_INICIAL2, regraAjuste.sVAR_FINAL,
                            regraAjuste.sVAR_RESULT, regraAjuste.sFORMULA);
                         End;

               If not bCalculoReajuste then
                  fResultado := ExecutaFormula(formulas[iFORMULA].sNO_VARIAVEL_INICIAL,
                                formulas[iFORMULA].sNO_VARIAVEL_INICIAL2, formulas[iFORMULA].sNO_VARIAVEL_FINAL,
                                formulas[iFORMULA].sNO_VARIAVEL_RESULT, formulas[iFORMULA].sDS_FORMULA);
            End
            Else
               fResultado := ExecutaFormula(formulas[iFORMULA].sNO_VARIAVEL_INICIAL,
                             formulas[iFORMULA].sNO_VARIAVEL_INICIAL2, formulas[iFORMULA].sNO_VARIAVEL_FINAL,
                             formulas[iFORMULA].sNO_VARIAVEL_RESULT, formulas[iFORMULA].sDS_FORMULA);
         End
         Else
            fResultado := ExecutaFormula(formulas[iFORMULA].sNO_VARIAVEL_INICIAL,
                          formulas[iFORMULA].sNO_VARIAVEL_INICIAL2, formulas[iFORMULA].sNO_VARIAVEL_FINAL,
                          formulas[iFORMULA].sNO_VARIAVEL_RESULT, formulas[iFORMULA].sDS_FORMULA);

         If formulas[iFORMULA].sIR_TABUA = 'S' then
            setValorIdade(i, formulas[iFORMULA].sNO_VARIAVEL_RESULT, fResultado);

         If fResultado < 0 then
         Begin
            If regraAjuste.iCD_FORMULA_AJUSTE > 0 then
               lstAdvertencias.Add(Format('Valor Negativo: %s, idade: %s, valor: %s',
                                   [QuotedStr(regraAjuste.sVAR_RESULT),
                                   IntToStr(i), FormatFloaT('#,###,###,##0.000000000', fResultado)]))
            Else
               lstAdvertencias.Add(Format('Valor Negativo: %s, idade: %s, valor: %s',
                                   [QuotedStr(formulas[iFORMULA].sNO_VARIAVEL_RESULT),
                                   IntToStr(i), FormatFloaT('#,###,###,##0.000000000', fResultado)]));
         End;
         //---

         Application.ProcessMessages;

         inc(iFormula); 
      End; //for
   End; //for

   //Executa Fórmulas com variável de Somatório.
   //Loop das Fórmulas da Rotina selecionada.
   lstVariavelReajuste.Clear;

   //Inicializa fórmulas na memória para otimizar o processo.
   setListaformulasComSomatorio(qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger);
   iFormula:=1;
   While iFormula <= High(formulasComSomatorio) do
   Begin
      If formulasComSomatorio[iFORMULA].iCD_FORMULA <= 0 then
         Break;

      For i := iIDADE_MINIMA to iIDADE_MAXIMA do
      Begin
         variavelCalculo.SetVarValue('w', iIDADE_MAXIMA);

         If i = iIDADE_MINIMA then
         Begin
            If (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
               (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
               (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
            Begin
               variavelCalculo.SetVarValue('l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));
               setValorIdade(iIDADE_MINIMA, 'l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));

               variavelCalculo.SetVarValue('l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));
               setValorIdade(iIDADE_MINIMA, 'l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));

               variavelCalculo.SetVarValue('l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
               setValorIdade(iIDADE_MINIMA, 'l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
            End;


            If (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x') or
               (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
               (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
               (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
            Begin
               inc(iFormula); 
               Continue;
            End;
         End; //if


         variavelCalculo.SetVarValue('x', i);

         //-- Verifica se existe regra de ajuste   FI_REGRA_AJUSTE_COMUTACAO SQ_VERSAO_COMUTACAO = :iSQ_VERSAO_RECALCULO
         //-- Se existir regra de ajuste , acessar para esta idade / variavel de resultado a tabela de serviço
         //-- que foi selecionada para recalculo
         //FI_OCOR_TABUA_COMUTACAO.[SQ_VERSAO_COMUTACAO, NO_VARIAVEL, NR_IDADE].VL_FATOR_COMUTACAO
         //-- Se o valor calculado for igual a condição da regra de afuste substituir formula padrão pela
         //-- fórmula de ajsuste
         //IR_CONDICAO_AJUSTE('Z', 'N')

         regraAjuste := getRegraAjuste(iSQ_VERSAO_RECALCULO,
                        qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger, formulasComSomatorio[iFORMULA].iCD_FORMULA, i);

         If iSQ_VERSAO_RECALCULO > 0 then
         Begin
            If (regraAjuste.iNR_IDADE >= 0) and (i >= regraAjuste.iNR_IDADE) then
            Begin
               bCalculoReajuste := False;

               If regraAjuste.sIR_CONDICAO = 'Z' then
               Begin
                  If (lstVariavelReajuste.IndexOf(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT) >= 0) or
                    (getValorOcorrenciaTabua(iSQ_VERSAO_RECALCULO, i, formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT) = 0) then
                  Begin
                    bCalculoReajuste := True;
                    If lstVariavelReajuste.IndexOf(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT) = -1 then
                       lstVariavelReajuste.Add(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT);

                    fResultado := ExecutaFormula(regraAjuste.sVAR_INICIAL, regraAjuste.sVAR_INICIAL2, regraAjuste.sVAR_FINAL,
                                  regraAjuste.sVAR_RESULT, regraAjuste.sFORMULA);
                  End;
               End
               Else If regraAjuste.sIR_CONDICAO = 'N' then
                    begin
                       If (lstVariavelReajuste.IndexOf(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT) >= 0) or
                          (getValorOcorrenciaTabua(iSQ_VERSAO_RECALCULO, i, formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT) < 0) then
                       Begin
                          bCalculoReajuste := True;
                          If lstVariavelReajuste.IndexOf(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT) = -1 then
                             lstVariavelReajuste.Add(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT);

                          fResultado := ExecutaFormula(regraAjuste.sVAR_INICIAL, regraAjuste.sVAR_INICIAL2, regraAjuste.sVAR_FINAL,
                          regraAjuste.sVAR_RESULT, regraAjuste.sFORMULA);
                       End;
                    End
                    Else If regraAjuste.sIR_CONDICAO = 'I' then
                         Begin
                            bCalculoReajuste := True;
                            If lstVariavelReajuste.IndexOf(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT) = -1 then
                               lstVariavelReajuste.Add(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT);

                            fResultado := ExecutaFormula(regraAjuste.sVAR_INICIAL, regraAjuste.sVAR_INICIAL2, regraAjuste.sVAR_FINAL,
                            regraAjuste.sVAR_RESULT, regraAjuste.sFORMULA);
                         End;

                    If not bCalculoReajuste then
                           fResultado := ExecutaFormula(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_INICIAL,
                                         formulasComSomatorio[iFORMULA].sNO_VARIAVEL_INICIAL2, formulasComSomatorio[iFORMULA].sNO_VARIAVEL_FINAL,
                                         formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT, formulasComSomatorio[iFORMULA].sDS_FORMULA);
            End
            Else
               fResultado := ExecutaFormula(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_INICIAL,
                             formulasComSomatorio[iFORMULA].sNO_VARIAVEL_INICIAL2, formulasComSomatorio[iFORMULA].sNO_VARIAVEL_FINAL,
                             formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT, formulasComSomatorio[iFORMULA].sDS_FORMULA);
         End
         Else
            fResultado := ExecutaFormula(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_INICIAL,
                          formulasComSomatorio[iFORMULA].sNO_VARIAVEL_INICIAL2, formulasComSomatorio[iFORMULA].sNO_VARIAVEL_FINAL,
                          formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT, formulasComSomatorio[iFORMULA].sDS_FORMULA);

         If formulasComSomatorio[iFORMULA].sIR_TABUA = 'S' then
            setValorIdade(i, formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT, fResultado);

         
         If fResultado < 0 then
         Begin
            If regraAjuste.iCD_FORMULA_AJUSTE > 0 then
               lstAdvertencias.Add(Format('Valor Negativo: %s, idade: %s, valor: %s',
                                   [QuotedStr(regraAjuste.sVAR_RESULT),
                                   IntToStr(i), FormatFloaT('#,###,###,##0.000000000', fResultado)]))
            Else
               lstAdvertencias.Add(Format('Valor Negativo: %s, idade: %s, valor: %s',
                                   [QuotedStr(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT),
                                   IntToStr(i), FormatFloaT('#,###,###,##0.000000000', fResultado)]));
         End;
        //---
      End; //for

      inc(iFormula); 
      Application.ProcessMessages;
   End; //for
end;

procedure TfrmOkCalculoTabuaServico.setValoresArquivo;
begin
end;

procedure TfrmOkCalculoTabuaServico.FormShow(Sender: TObject);
begin
   inherited;

   If ClntDtStTabuaServico.Locate('IR_TIPO_TABUA_SERVICO', sIR_TIPO_TABUA, []) then
      CMDBLkpCmbTabuaServico.Text := ClntDtStTabuaServicoDS_TIPO_TABUA_SERVICO.asString;

   EdtDescricao.Text := sDS_VERSAO;

   If qryLkpTabuaMortalidade.Locate('CD_TABUA', iCD_TABUA_MORTALIDADE, []) then
      CMDBLkpCmbTabuaMortalidade.Text := qryLkpTabuaMortalidadeDS_TABUA.asString;

   If qryLkpTabuaInvalidez.Locate('CD_TABUA', iCD_TABUA_INVALIDEZ, []) then
      CMDBLkpCmbTabuaInvalidez.Text := qryLkpTabuaInvalidezDS_TABUA.asString;

   If qryLkpTabuaEntradaInvalidez.Locate('CD_TABUA', iCD_TABUA_ENTRADA_INVALIDEZ, []) then
      CMDBLkpCmbTabuaEntradaInvalidez.Text := qryLkpTabuaEntradaInvalidezDS_TABUA.asString;

   If qryLkpTabelaRotatividade.Locate('CD_TABUA', iCD_TABUA_ROTATIVIDADE, []) then
      CMDBLkpCmbTabuaRotatividade.Text := qryLkpTabelaRotatividadeDS_TABUA.asString;

   If qryLkpRotinaCalculoTabua.Locate('CD_GRUPO_FORMULA', iCD_ROTINA_CALCULO_TABUA, []) then
      CMDBLkpCmbRotinaCalculoTabua.Text := qryLkpRotinaCalculoTabuaDS_GRUPO_FORMULA.asString;
end;

function TfrmOkCalculoTabuaServico.getRegraAjuste(iSQ_VERSAO_TABUA, iCD_ROTINA, iCD_FORMULA, iNR_IDADE: Integer): TRegraAjuste;
begin
   Try
      QryRegraAjusteVersao.Close;
      QryRegraAjusteVersao.ParamByName('SQ_VERSAO_COMUTACAO').asInteger := iSQ_VERSAO_TABUA;
      QryRegraAjusteVersao.ParamByName('CD_GRUPO_FORMULA').asInteger := iCD_ROTINA;
      QryRegraAjusteVersao.ParamByName('CD_FORMULA').asInteger := iCD_FORMULA;
      QryRegraAjusteVersao.ParamByName('NR_IDADE').asInteger := iNR_IDADE;
      QryRegraAjusteVersao.Open;

      If QryRegraAjusteVersao.isEmpty then
      Begin
         Result.iCD_FORMULA_AJUSTE := -1;
         Result.iNR_IDADE := -1;
         Result.sIR_CONDICAO := '';
         Result.sVAR_INICIAL := '';
         Result.sVAR_INICIAL2 := '';
         Result.sVAR_FINAL := '';
         Result.sVAR_RESULT := '';
         Result.sFORMULA := '';
      End
      Else
      Begin
         Result.iCD_FORMULA_AJUSTE := QryRegraAjusteVersaoCD_FORMULA_AJUSTE.asInteger;

         If QryRegraAjusteVersaoNR_IDADE.IsNull then
            Result.iNR_IDADE := -1
         Else
            Result.iNR_IDADE := QryRegraAjusteVersaoNR_IDADE.asInteger;

         Result.sIR_CONDICAO := QryRegraAjusteVersaoIR_CONDICAO_AJUSTE.asString;
         Result.sVAR_INICIAL := QryRegraAjusteVersaoNO_VARIAVEL_INICIAL.asString;
         Result.sVAR_INICIAL2 := QryRegraAjusteVersaoNO_VARIAVEL_INICIAL2.asString;
         Result.sVAR_FINAL := QryRegraAjusteVersaoNO_VARIAVEL_FINAL.asString;
         Result.sVAR_RESULT := QryRegraAjusteVersaoNO_VARIAVEL_RESULT.asString;
         Result.sFORMULA := QryRegraAjusteVersaoDS_FORMULA.asString;
      End;
   Finally
      QryRegraAjusteVersao.Close;
   End;
end;

function TfrmOkCalculoTabuaServico.getValorOcorrenciaTabua(iSQ_VERSAO_TABUA, iNR_IDADE: Integer; sNO_VARIAVEL: String): Extended;
var qry: TQuery;
begin
   Try
      qry := TQuery.Create(Nil);
      qry.DataBaseName := 'BaseDados';

      qry.SQL.Add('SELECT NR_IDADE, VL_FATOR_COMUTACAO');
      qry.SQL.Add('FROM FI_OCOR_TABUA_COMUTACAO');
      qry.SQL.Add('WHERE SQ_VERSAO_COMUTACAO = ' + IntToStr(iSQ_VERSAO_TABUA));
      qry.SQL.Add('  AND NO_VARIAVEL = ' + QuotedStr(sNO_VARIAVEL));
      qry.SQL.Add('  AND NR_IDADE = ' + IntToStr(iNR_IDADE));
      qry.Open;

      Result := qry.FieldByName('VL_FATOR_COMUTACAO').asFloat;
   Finally
      qry.Close;
      FreeAndNil(qry);
   End;
end;

procedure TfrmOkCalculoTabuaServico.calculaTabuaServico;
var iCD_VERSAO: Integer;
begin
   Try
      Screen.Cursor := crHourGlass;
      bbtnConfirmar.Enabled := False;
      
      //-- Inicializa Lista com Código das Tábuas selecionadas.
      lstTabuas := TStringList.Create;

      If Trim(CMDBLkpCmbTabuaMortalidade.Text) <> '' then
         lstTabuas.Add(qryLkpTabuaMortalidadeCD_TABUA.asString);
      If Trim(CMDBLkpCmbTabuaInvalidez.Text) <> '' then
         lstTabuas.Add(qryLkpTabuaInvalidezCD_TABUA.asString);
      If Trim(CMDBLkpCmbTabuaEntradaInvalidez.Text) <> '' then
         lstTabuas.Add(qryLkpTabuaEntradaInvalidezCD_TABUA.asString);
      If Trim(CMDBLkpCmbTabuaRotatividade.Text) <> '' then
         lstTabuas.Add(qryLkpTabelaRotatividadeCD_TABUA.asString);

      //-- Inicializa Matriz.
      inicializaTabuaServico(lstTabuas);

      //-- Inicializa valores das Tábuas na Matriz.
      setTabuaServico(qryLkpTabuaMortalidadeCD_TABUA.asInteger);
      setTabuaServico(qryLkpTabuaInvalidezCD_TABUA.asInteger);
      setTabuaServico(qryLkpTabuaEntradaInvalidezCD_TABUA.asInteger);
      setTabuaServico(qryLkpTabelaRotatividadeCD_TABUA.asInteger);
      //---


      //Inicializa e cria Variáveis.
      variavelCalculo := TVarCalc.Create(Nil); // Cria rotina p/ cálculo da Fórmula.

      setConsultaFormulasRotina;
      QryFormulasRotina.Close;
      QryFormulasRotina.ParamByName('CD_GRUPO_FORMULA').asInteger := qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger;
      QryFormulasRotina.Open;

      setConsultaFormulasComSomatorio;
      QryFormulasComSomatorio.Close;
      QryFormulasComSomatorio.ParamByName('CD_GRUPO_FORMULA').asInteger := qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger;
      QryFormulasComSomatorio.Open;

      If (QryFormulasRotina.isEmpty) and (QryFormulasComSomatorio.isEmpty) then
      Begin
         MessageDlg('Favor cadastrar Fórmulas na Rotina.', mtWarning, [mbOk], 0);
         Exit;
      End;

      
      inicializaValorPadraoVariaveis;

      lstVariavelReajuste := TStringList.Create;
      executaCalculoTabuaServico;

      setValoresArquivo;

      iCD_VERSAO := setTabuaComutacao;
      If iCD_VERSAO > 0 then
         setOcorrenciasTabua(iCD_VERSAO);
      //---

      MessageDlg('Cálculo realizado com Sucesso.', mtInformation, [mbOk], 0);
      ModalResult := mrOk;
   Finally
      FreeAndNil(lstVariavelReajuste);
      Screen.Cursor := crDefault;
      bbtnConfirmar.Enabled := True;
      QryFormulasRotina.Close;
      QryFormulasComSomatorio.Close;

      // liberar variáveis de cálculo
      variavelCalculo.Destroy;
      FreeAndNil(lstTabuas);
   End; //Try
end;

procedure TfrmOkCalculoTabuaServico.calculaTabuaPensao;
var iCD_VERSAO: Integer;
begin
   Try
      Try

         LogString := TStringList.Create;
         LogString.Clear;
         pbrTabServico1.Max := 7;
         pbrTabServico1.Position := 0;
         //---

         Screen.Cursor := crHourGlass;
         bbtnConfirmar.Enabled := False;
         lstTabuas := TStringList.Create;

         setConsultaFormulasRotina;
         QryFormulasRotina.Close;
         QryFormulasRotina.ParamByName('CD_GRUPO_FORMULA').asInteger := qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger;
         QryFormulasRotina.Open;

         setConsultaFormulasComSomatorio;
         QryFormulasComSomatorio.Close;
         QryFormulasComSomatorio.ParamByName('CD_GRUPO_FORMULA').asInteger := qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger;
         QryFormulasComSomatorio.Open;

         If (QryFormulasRotina.isEmpty) and (QryFormulasComSomatorio.isEmpty) then
         Begin
            MessageDlg('Favor cadastrar Fórmulas na Rotina.', mtWarning, [mbOk], 0);
            Exit;
         End;

         pbrTabServico1.StepBy(1);
         HoraIni := TimeToStr(Time);
         Application.ProcessMessages;

         
         //Inicializa e cria Variáveis.
         variavelCalculo := TVarCalc.Create(Nil); // Cria rotina p/ cálculo da Fórmula.

         HoraFim := TimeToStr(Time);
         LogString.Add(HoraIni + ' - ' + HoraFim + ' - ' + Caption);
         LogString.SaveToFile('c:\log_de_hora.txt');

         //temporario
         pbrTabServico1.StepBy(1);
         HoraIni := TimeToStr(Time);
         Application.ProcessMessages;

         
         //-- Inicializa Matriz.
         inicializaTabuaPensao(iSQ_VERSAO_PENSAO);

         HoraFim := TimeToStr(Time);
         LogString.Add(HoraIni + ' - ' + HoraFim + ' - ' + Caption);
         LogString.SaveToFile('c:\log_de_hora.txt');

         
         pbrTabServico1.StepBy(1);
         HoraIni := TimeToStr(Time);
         Application.ProcessMessages;

         inicializaValorPadraoVariaveis;

         HoraFim := TimeToStr(Time);
         LogString.Add(HoraIni + ' - ' + HoraFim + ' - ' + Caption);
         LogString.SaveToFile('c:\log_de_hora.txt');

         
         pbrTabServico1.StepBy(1);
         Application.ProcessMessages;
         //---

         executaCalculoTabuaPensao;

         
         pbrTabServico1.StepBy(1);
         Application.ProcessMessages;
         //---

         setValoresArquivoPensao;

         
         pbrTabServico1.StepBy(1);
         Application.ProcessMessages;
         //---

         
         HoraIni := TimeToStr(Time);
         Application.ProcessMessages;

         iCD_VERSAO := setTabuaComutacao;
         If iCD_VERSAO > 0 then
            setOcorrenciasTabua_Pensao(iCD_VERSAO);

         
         pbrTabServico1.StepBy(1);
         Application.ProcessMessages;
         //---

         HoraFim := TimeToStr(Time);
         LogString.Add(HoraIni + ' - ' + HoraFim + ' - ' + Caption);
         LogString.SaveToFile('c:\log_de_hora.txt');

         MessageDlg('Cálculo realizado com Sucesso.', mtInformation, [mbOk], 0);
         ModalResult := mrOk;
      Except on E: Exception do
         MessageDlg('Houve erro ao calcular a Tábua de Pensão: ' + #13#10 + E.Message, mtError, [mbOk], 0);
      End;
   Finally
      Screen.Cursor := crDefault;
      bbtnConfirmar.Enabled := True;
      QryFormulasRotina.Close;
      QryFormulasComSomatorio.Close;

      LogString.SaveToFile('c:\logstring');

      // liberar variáveis de cálculo
      variavelCalculo.Destroy;
      FreeAndNil(lstTabuas);
   End; //Try
end;

procedure TfrmOkCalculoTabuaServico.executaCalculoTabuaPensao;
var i, iPENSAO, j, iFORMULA, N: Integer;
    fResultado, fResultado2: Extended;
begin
   //Inicializa fórmulas na memória para otimizar o processo.
   setListaFormulas;

   
   HoraIni := TimeToStr(Time);
   pbrTabServico2.Position := 0;
   pbrTabServico2.Max := iIDADE_MAXIMA * iIDADE_MAXIMA;

   Application.ProcessMessages;

   //Executa Fórmulas que não possuem variável de Somatório.
   For i := iIDADE_MINIMA to iIDADE_MAXIMA do
   Begin
      For iPENSAO := iIDADE_MINIMA to iIDADE_MAXIMA do
      Begin
         variavelCalculo.SetVarValue('w', iIDADE_MAXIMA);

         //Loop das Fórmulas da Rotina selecionada.
         For iFORMULA := 1 to High(formulas) do
         Begin
            If formulas[iFORMULA].iCD_FORMULA <= 0 then
               Break;

            If i = iIDADE_MINIMA then
            Begin
               If (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
                  (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
                  (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
               Begin
                  variavelCalculo.SetVarValue('l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));

                  variavelCalculo.SetVarValue('l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));

                  variavelCalculo.SetVarValue('l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
               End;

               If (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x') or
                  (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
                  (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
                  (formulas[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
               Begin
                  Continue;
               End;
            End; //if

            variavelCalculo.SetVarValue('x', i);
            variavelCalculo.SetVarValue('jx', iPENSAO);

            fResultado := ExecutaFormula(formulas[iFORMULA].sNO_VARIAVEL_INICIAL,
                          formulas[iFORMULA].sNO_VARIAVEL_INICIAL2, formulas[iFORMULA].sNO_VARIAVEL_FINAL,
                          formulas[iFORMULA].sNO_VARIAVEL_RESULT, formulas[iFORMULA].sDS_FORMULA);

            If formulas[iFORMULA].sIR_TABUA = 'S' then
               setValorIdadePensao(i, iPENSAO, formulas[iFORMULA].sNO_VARIAVEL_RESULT, fResultado);

            
            If fResultado < 0 then
            Begin
               lstAdvertencias.Add(Format('Valor Negativo: %s, idade: %s, idade pensão: %s, valor: %s',
                                   [QuotedStr(formulas[iFORMULA].sNO_VARIAVEL_RESULT),
                                   IntToStr(i), IntToStr(iPENSAO),
                                   FormatFloaT('#,###,###,##0.000000000', fResultado)]));
            End;
            //---

            Application.ProcessMessages;
         End; //for
      End; //for

      
      pbrTabServico2.StepBy(1);
      Application.ProcessMessages;
      

   End; //for

   HoraFim := TimeToStr(Time);
   LogString.Add(HoraIni + ' - ' + HoraFim + ' - ' + Caption);
   LogString.SaveToFile('c:\log_de_hora.txt');

   
   HoraIni := TimeToStr(Time);
   Application.ProcessMessages;

   //Executa Fórmulas com variável de Somatório.
   //Loop das Fórmulas da Rotina selecionada.

   //Inicializa fórmulas na memória para otimizar o processo.
   setListaformulasComSomatorio(qryLkpRotinaCalculoTabuaCD_GRUPO_FORMULA.asInteger);
   For iFORMULA := 1 to High(formulasComSomatorio) do
   Begin
      If formulasComSomatorio[iFORMULA].iCD_FORMULA <= 0 then
         Break;

      For i := iIDADE_MINIMA to iIDADE_MAXIMA do
      Begin
         For iPENSAO := iIDADE_MINIMA to iIDADE_MAXIMA do
         Begin
            variavelCalculo.SetVarValue('w', iIDADE_MAXIMA);

            If i = iIDADE_MINIMA then
            Begin
               If (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
               Begin
                  variavelCalculo.SetVarValue('l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_ii', getValorIdade(iIDADE_MINIMA, 'l_x'));

                  variavelCalculo.SetVarValue('l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_aa', getValorIdade(iIDADE_MINIMA, 'l_x'));

                  variavelCalculo.SetVarValue('l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
                  setValorIdade(iIDADE_MINIMA, 'l_x_s', getValorIdade(iIDADE_MINIMA, 'l_x'));
               End;

               If (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_aa') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_ii') or
                  (formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT = 'l_x_s') then
               Begin
                  Continue;
               End;
            End; //if


            variavelCalculo.SetVarValue('x', i);
            variavelCalculo.SetVarValue('jx', iPENSAO);

            fResultado := ExecutaFormula(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_INICIAL,
                                         formulasComSomatorio[iFORMULA].sNO_VARIAVEL_INICIAL2, formulasComSomatorio[iFORMULA].sNO_VARIAVEL_FINAL,
                                         formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT, formulasComSomatorio[iFORMULA].sDS_FORMULA);

            If formulasComSomatorio[iFORMULA].sIR_TABUA = 'S' then
               setValorIdadePensao(i, iPENSAO, formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT, fResultado);

            
            If fResultado < 0 then
            Begin
               lstAdvertencias.Add(Format('Valor Negativo: %s, idade: %s, idade pensão: %s, valor: %s',
                                   [QuotedStr(formulasComSomatorio[iFORMULA].sNO_VARIAVEL_RESULT),
                                   IntToStr(i), IntToStr(iPENSAO),
                                   FormatFloaT('#,###,###,##0.000000000', fResultado)]));
             End;
             //---

          End; //for

          
          pbrTabServico2.StepBy(1);
          Application.ProcessMessages;
          


       End; //for
       Application.ProcessMessages;
    End; //for

    HoraFim := TimeToStr(Time);
    LogString.Add(HoraIni + ' - ' + HoraFim + ' - ' + Caption);
    LogString.SaveToFile('c:\log_de_hora.txt');
end;

procedure TfrmOkCalculoTabuaServico.setValoresArquivoPensao;
begin
end;

procedure TfrmOkCalculoTabuaServico.setOcorrenciasTabua_Pensao(iCD_VERSAO_TABUA: Integer);
var i, iPENSAO, j: Integer;

Begin
   With QryInsOcorTabuaComutacao do
   Begin

      
      HoraIni := TimeToStr(Time);
      pbrTabServico2.Position := 0;
      pbrTabServico2.Max := iIDADE_MAXIMA * iIDADE_MAXIMA;

      For i := iIDADE_MINIMA to iIDADE_MAXIMA do
      Begin
         For iPENSAO := iIDADE_MINIMA to High(Tabua_Servico[i]) do
         Begin
            For j := 1 to High(Tabua_Servico[i][iPENSAO].sNO_VARIAVEL) do
            Begin

               ParamByName('NR_IDADE').asInteger := i;
               ParamByName('SQ_VERSAO_COMUTACAO').asInteger := iCD_VERSAO_TABUA;

               ParamByName('NO_VARIAVEL').asString := Tabua_Servico[i][iPENSAO].sNO_VARIAVEL[j];
               ParamByName('VL_FATOR_COMUTACAO').asFloat := Tabua_Servico[i][iPENSAO].fVL_CALCULO[j];
               ParamByName('NR_IDADE_PENSAO').asInteger := iPENSAO;
               Try
                  If ParamByName('VL_FATOR_COMUTACAO').asFloat <> 0 Then   
                     If Trim(ParamByName('NO_VARIAVEL').asString) <> '' then
                        ExecSQL;
               Except End;

               Application.ProcessMessages;
            End; //for

            
            pbrTabServico2.StepBy(1);
            Application.ProcessMessages;
            

         End; //for
      End; //for
   End; //with
End;

procedure TfrmOkCalculoTabuaServico.bbtnCancelarClick(Sender: TObject);
begin
   If Application.MessageBox('Deseja cancelar o processamento?', 'Cálculo Atuarial', MB_ICONQUESTION +
       MB_YESNO) = IDYES then
      bCancelado := True;
end;

end.
