unit UCalculoAtuarial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Wwdotdot, Wwdbcomb, Mask, wwdbedit, checklst,
  Buttons, DBCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97,
  ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, uExpresBuilder, uExpresCalc, uVarCalc,
  uCalculaTabuaServico, uFuncGerais, uglobal, math, ComCtrls, FTelaAut,
  CMProcura, MontaSelect, wwidlg, Wwlocate, uRegraMT, DBClient, provider,
  uCMClientDataSet;

type TTipo_Tabua = (ttbMasculino, ttbFeminino, ttbPensao);

type
  TfrmCalculoAtuarial = class(TfrmOkCancelar)
    GroupBoxHipotese: TGroupBox;
    DBLkpCmbBxHipotese: TDBLookupComboBox;
    GrpBxGrupos: TGroupBox;
    SpdBttnGrupoPart: TSpeedButton;
    ChckLstBxGrupoPart: TCheckListBox;
    wwQryHipotese: TwwQuery;
    wwDtSrcHipotese: TwwDataSource;
    wwQryGrupoPartic: TwwQuery;
    wwQryPartic: TwwQuery;
    wwQryCalcBenef: TwwQuery;
    wwQryCompHipotese: TwwQuery;
    wwQryInsOcorCalculo: TwwQuery;
    wwQryOpcaoGrupo: TwwQuery;
    wwQryInsReferCalculo: TwwQuery;
    wwQryVariavelFormula: TwwQuery;
    wwQryVariavelHipotese: TwwQuery;
    wwQryCalcFormula: TwwQuery;
    wwQryOcorrTabua: TwwQuery;
    wwQryHipoteseCD_HIPOTESE: TFloatField;
    wwQryHipoteseDS_HIPOTESE: TStringField;
    wwQryHipoteseDT_GERACAO: TDateTimeField;
    wwQryHipoteseNR_IDADE_MIN_TB_SERV: TFloatField;
    wwQryHipoteseNR_IDADE_MAX_TB_SERV: TFloatField;
    wwQryParticCD_VERSAO: TFloatField;
    wwQryParticCD_PARTIC: TFloatField;
    wwQryParticCD_PESSOA_PATROC: TFloatField;
    wwQryParticCD_PESSOA_ENTID: TFloatField;
    wwQryParticCD_PLANO: TFloatField;
    wwQryParticCD_TIPO_CAT_PROF_ESP: TFloatField;
    wwQryParticNR_MATRICULA: TStringField;
    wwQryParticNO_PESSOA: TStringField;
    wwQryParticIR_SEXO: TStringField;
    wwQryParticIR_CONDICAO_TRABALHO: TStringField;
    wwQryParticCD_GRUPO_CALCULO: TFloatField;
    wwQryParticTP_PARTICIPANTE: TStringField;
    wwQryParticCD_TIPO_BENEF: TFloatField;
    wwQryCalcFormulaCD_FORMULA: TFloatField;
    wwQryCalcFormulaNO_FORMULA: TStringField;
    wwQryCalcFormulaDS_FORMULA: TMemoField;
    wwQryCalcFormulaNO_VARIAVEL_RESULT: TStringField;
    wwQryCalcFormulaNO_VARIAVEL_INICIAL: TStringField;
    wwQryCalcFormulaNO_VARIAVEL_FINAL: TStringField;
    wwQryCalcFormulaIR_OCOR_CALC_ATUARIAL: TStringField;
    wwQryGrupoParticCD_GRUPO_PARTIC: TFloatField;
    wwQryGrupoParticNO_GRUPO_PARTIC: TStringField;
    RadioGroupTipoCalculo: TRadioGroup;
    wwQryProcura: TwwQuery;
    wwQryRotinaAtivos: TwwQuery;
    wwQryRotinaBenef: TwwQuery;
    wwQryVariavelHipoteseCD_HIPOTESE: TFloatField;
    wwQryVariavelHipoteseCD_ITEM_HIPOTESE: TFloatField;
    wwQryVariavelHipoteseVL_HIPOTESE: TFloatField;
    wwQryVariavelHipoteseIR_GERA_TAB_SERVICO: TStringField;
    wwQryVariavelHipoteseCD_ITEM_HIPOTESE_1: TFloatField;
    wwQryVariavelHipoteseCD_TIPO_TABUA: TFloatField;
    wwQryVariavelHipoteseDS_ITEM_HIPOTESE: TStringField;
    wwQryVariavelHipoteseIR_ITEM_HIPOTESE: TStringField;
    wwQryVariavelHipoteseNO_VARIAVEL: TStringField;
    wwQryVariavelFormulaNO_VARIAVEL: TStringField;
    wwQryVariavelFormulaDS_VARIAVEL: TStringField;
    wwQryVariavelFormulaIM_VARIAVEL: TStringField;
    wwQryVariavelFormulaVL_DEFAULT: TFloatField;
    wwQryVariavelFormulaDS_SQL_CAMPO_BANCO: TMemoField;
    wwQryVariavelFormulaNO_CAMPO_BANCO: TStringField;
    wwQryVariavelFormulaNO_FUNCAO: TStringField;
    wwQryVariavelFormulaIR_OCOR_CALC_ATUARIAL: TStringField;
    wwQryVariavelFormulaIR_TABUA: TStringField;
    wwQryVariavelFormulaIR_DOMINIO_SISTEMA: TStringField;
    wwQryCompHipoteseCD_HIPOTESE: TFloatField;
    wwQryCompHipoteseCD_ITEM_HIPOTESE: TFloatField;
    wwQryCompHipoteseVL_HIPOTESE: TFloatField;
    wwQryCompHipoteseIR_GERA_TAB_SERVICO: TStringField;
    wwQryCompHipoteseCD_TIPO_TABUA: TFloatField;
    wwQryCompHipoteseDS_ITEM_HIPOTESE: TStringField;
    wwQryCompHipoteseIR_ITEM_HIPOTESE: TStringField;
    wwQryCompHipoteseNO_VARIAVEL: TStringField;
    wwQryCompHipoteseIR_DOMINIO_SISTEMA: TStringField;
    wwQryOcorrTabuaCD_TABUA: TFloatField;
    wwQryOcorrTabuaSG_TABUA: TStringField;
    wwQryOcorrTabuaDS_TABUA: TStringField;
    wwQryOcorrTabuaDT_REF_TABUA: TDateTimeField;
    wwQryOcorrTabuaCD_TIPO_TABUA: TFloatField;
    wwQryOcorrTabuaNR_IDADE: TFloatField;
    wwQryOcorrTabuaNR_L_X: TFloatField;
    wwQryOcorrTabuaNR_P_X: TFloatField;
    wwQryOcorrTabuaNR_D_X: TFloatField;
    wwQryOcorrTabuaNR_Q_X: TFloatField;
    wwQryOcorrTabuaNR_I_X: TFloatField;

    procedure FormCreate(Sender: TObject);
    procedure InicializaOpcao;
    procedure SpdBttnGrupoPartClick(Sender: TObject);
    procedure DBLkpCmbBxHipoteseCloseUp(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure Inicializa_Variaveis;
    function  valor_funcao(w_cd_pessoa   : integer;
                           w_nome_funcao : string) : extended;
    procedure Executa_Formula;
    function  Calcula_Expressao_Recursiva (Cadeia : String) : Extended;
    {Inicializa variável associada à Hipótese}
    function  variavel_item_hipotese     : extended;
    {Recupera valor da variavel na tabela de comutação}
    function  valor_comutacao(w_nome_variavel : string;
                              w_idade : integer): extended;
    {Recupera valor da variável do item de hipótese associada a uma
     determinada tábua}
    function  valor_tabua    (w_nome_variavel : string;
                              w_idade : integer): extended;
    {Rotina para executar SQL associado a VARIÁVEL}
    function ExecSQL_Variavel (w_campo, w_SQL : string) : variant;
    {Ler o proximo Participante}
    procedure Proximo_Partic;
    {Monta tábua de comutação}
    procedure MontaTabuaComutacao;
    {Gravar Mov. Calculado}
    procedure IncluiMovCalculado
     (w_cd_formula : integer; w_nome_variavel : string; w_valor_variavel : extended);
   {Rotina para Atualizar Referencia de Calculo do Movimento}
    procedure GeraReferCalculo;
    procedure TerminaAnimacao;
    procedure IniciaAnimacao;
    procedure RadioGroupTipoCalculoClick(Sender: TObject);
    procedure CMProcuraMatriculaApertouBotao(Sender: TObject);
    procedure spbMemoriaClick(Sender: TObject);

    function CalculaExpressaoRecursiva(sCADEIA: String): Extended;

    procedure Executa_Regra(Sender: TObject);
    procedure ssbReCalcHipoteClick(Sender: TObject);

    Function PegaGrupo(vGrupo:Integer):Integer;
    //---
  private
     { Private declarations }

     function valorComutacao(sNOME_VARIAVEL: String; iIDADE: Integer; iIDADE_PENSAO: Integer = -1): Extended;
     function executaFormula: Extended;

     { --------------------------------------------------------------- }
     {  Procedures e Funções para o novo cálculo atuarial com o regra  }
     { --------------------------------------------------------------- }

     Procedure OnGetResultLocal( Sender : TObject );

     procedure setQueryTabuas(qry: TQuery);
     Procedure setValor(iIDADE, iPENSAO: Integer; sVARIAVEL: String;
                                  fVL_VARIAVEL: Extended; ttTabua:TTipo_Tabua );

     Procedure Grava_Matriz(Versao:Integer; ttTabua:TTipo_Tabua);
     Procedure InicializaTabuas;

     Function getIDADE_MAXIMA: Integer;
     Function getIDADE_MINIMA: Integer;

     Procedure Inicializa_Campos_CDS;
     Procedure Popular_CDS_Calculo;

     Procedure ReCalculo_Atuarial;
  public
     { Public declarations }
     w_cd_partic : integer;
  end;

var frmCalculoAtuarial: TfrmCalculoAtuarial;

    Wg_Variavel   : TVarCalc;
    Fquery        : TQuery;  //-- Query para executar SQL assoc. a VARIÁVEL
    w_GeraReferCalculo : boolean; //-- Indica se já gerou ocor de cálculo

    w_nome_variavel: string;
    w_seq_calculo : integer;

    w_dt_geracao, w_dt_refer  : tdatetime;
    Tabua_Servs : TList; {Tabela com valores calculados}
    reg_tabua_Servico : treg_tabua_Servico;
    w_nome_par, w_valor_par : tstringlist; // libera parâmetros SQL

    w_tp_benef     : array [1..20] of integer; // guarda tipos de benefício
    w_ocor_benef   : integer;

    w_tp_grupo     : array [1..50] of integer; // guarda tipos de grupo de participante
    w_ocor_grupo   : integer;

    w_val_hipotese : extended; // Valor proveniente do item da hipótese
    w_juros        : real;
    w_gerou_comutacao : boolean;

    w_VarItemHipotese : TStringList; // Guarda variável associada a tábua
    w_TabItemHipotese : TStringList; // Guarda nome da tábua associada
    w_IndItemHipotese : Integer;

    qtempo : tlist;
    rtempo : ttempo;

    w_inicio_tabserv : integer;
    w_linhas, w_linha_atual : word;

    w_todos_grupos : boolean;
    w_ds_grupo : string;

    cd_grupo_formula , cd_formula : integer;

    { --------------------- }

    conta:Integer;
    iIDADE_MINIMA, iIDADE_MAXIMA :Integer;
    iVersao_M, iVersao_F, iVersao_P:Integer;

implementation

uses FAnimacao, uDtMdlSat, DBaseDados, uVersaoBase, uProcura, FVerHipoteses,
     uMemoriaCalculo, dInterfaceAtuarial, uCalculoTabuaServicoPensao;

{$R *.DFM}

{---------------------}

function TfrmCalculoAtuarial.getIDADE_MINIMA: Integer;
var qry: TQuery;
begin
   Try
      qry := TQuery.Create(Nil);
      qry.DatabaseName := 'BaseDados';
      qry.SQL.Add('SELECT  MIN(NR_IDADE) AS MIN_IDADE FROM FI_OCOR_TABUA_COMUTACAO');
      qry.SQL.Add('WHERE SQ_VERSAO_COMUTACAO IN (' + IntToStr(iVersao_M) + ', '
                                                   + IntToStr(iVersao_F) + ', '
                                                   + IntToStr(iVersao_P) + ')' );
      qry.Open;

      Result := qry.FieldByName('MIN_IDADE').asInteger;
   Finally
      qry.Close;
      FreeAndNil(qry);
   End;
end;

function TfrmCalculoAtuarial.getIDADE_MAXIMA: Integer;
var qry: TQuery;
begin
   Try
      qry := TQuery.Create(Nil);
      qry.DatabaseName := 'BaseDados';
      qry.SQL.Add('SELECT  MAX(NR_IDADE) AS MAX_IDADE FROM FI_OCOR_TABUA_COMUTACAO');
      qry.SQL.Add('WHERE SQ_VERSAO_COMUTACAO IN (' + IntToStr(iVersao_M) + ', '
                                                   + IntToStr(iVersao_F) + ', '
                                                   + IntToStr(iVersao_P) + ')' );
      qry.Open;

      Result := qry.FieldByName('MAX_IDADE').asInteger;
   Finally
      qry.Close;
      FreeAndNil(qry);
   End;
end;

Procedure TfrmCalculoAtuarial.setValor(iIDADE, iPENSAO: Integer; sVARIAVEL: String;
                                            fVL_VARIAVEL: Extended; ttTabua:TTipo_Tabua );
begin
end;

procedure TfrmCalculoAtuarial.setQueryTabuas(qry: TQuery);
Var Tipo:String;
begin
   With qry.SQL do
   Begin
      Add('SELECT SQ_VERSAO_COMUTACAO, NR_IDADE, NR_IDADE_PENSAO, NO_VARIAVEL, VL_FATOR_COMUTACAO, VL_FATOR_PENSAO');
      Add('FROM FI_OCOR_TABUA_COMUTACAO');
      Add('WHERE SQ_VERSAO_COMUTACAO = :SQ_VERSAO_COMUTACAO');
   End;
end;

Procedure TfrmCalculoAtuarial.Grava_Matriz(Versao:Integer; ttTabua:TTipo_Tabua);
Var qry:TQuery;
    Conta:Integer;
    Temp:String;
Begin
   Try
      Conta := 0;

      qry := TQuery.Create(Nil);
      setQueryTabuas(qry);    { Passa o SQL que retornará a tábua escolhida}

      With qry do
      Begin
         DatabaseName := 'BaseDados';
         Close;
         ParamByName('SQ_VERSAO_COMUTACAO').asInteger := Versao;
         Open;

         While not Eof do
         Begin
            setValor(FieldByName('NR_IDADE').asInteger,
                     FieldByName('NR_IDADE_PENSAO').asInteger,
                     FieldByName('NO_VARIAVEL').asString,
                     FieldByName('VL_FATOR_COMUTACAO').asFloat,
                     ttTabua);
            Next;

            Inc(Conta);
            Case ttTabua Of
               ttbMasculino:Caption := 'Masc - ' + IntToStr(Conta);
               ttbFeminino :Caption := 'Femi - ' + IntToStr(Conta);
               ttbPensao   :Caption := 'Pens - ' + IntToStr(Conta);
            End;

            Application.ProcessMessages;
         End;
      End;
   Finally
      qry.Close;
      FreeAndNil(qry);
   End;
End;

Procedure TfrmCalculoAtuarial.InicializaTabuas;
var iIdade, j ,iPENSAO:Integer;
    Inicio, Fim:Integer;
Begin
   { Grava Tabua Masculina e Feminina na matriz }
   If iVersao_M <> 0 Then Grava_Matriz(iVersao_M, ttbMasculino);
   If iVersao_F <> 0 Then Grava_Matriz(iVersao_F, ttbFeminino);

   { Grava Tabua de pensao na matriz }
   If iVersao_P <> 0 Then Grava_Matriz(iVersao_P, ttbPensao);
end;

Procedure TfrmCalculoAtuarial.Inicializa_Campos_CDS;
Var N:Integer;
Begin
end;

Procedure TfrmCalculoAtuarial.Popular_CDS_Calculo;
Var N:Integer;
Begin
   iVersao_M := 0;
   iVersao_F := 0;
   iVersao_P := 0;
End;

Procedure TfrmCalculoAtuarial.OnGetResultLocal( Sender : TObject );
begin
   inc(conta);
   Caption := IntToStr(Conta);
   Application.ProcessMessages;
end;

Procedure TfrmCalculoAtuarial.Executa_Regra(Sender: TObject);
begin
//
end;

procedure TfrmCalculoAtuarial.ReCalculo_Atuarial;
begin
///
end;

Function TfrmCalculoAtuarial.PegaGrupo(vGrupo:Integer):Integer;
Var N:Integer;
Begin
   For N:=0 to 50 do
     If w_tp_grupo[N] = vGrupo Then
        Result := N-1;
End;


procedure TfrmCalculoAtuarial.FormCreate(Sender: TObject);
begin
   InicializaOpcao;
end;

{ ----------------------------------------------- }
{ Inicializa opções de grupo e tipo de benefícios }
procedure TfrmCalculoAtuarial.InicializaOpcao;
begin
end;

procedure TfrmCalculoAtuarial.SpdBttnGrupoPartClick(Sender: TObject);
var w_i : integer;

begin
   If w_todos_grupos  then
   Begin
      w_todos_grupos := false;
      For w_i := 1 to w_ocor_grupo do
         ChckLstBxGrupoPart.checked[w_i-1] := false;
   End
   Else
   Begin
      w_todos_grupos := true;
      For w_i := 1 to w_ocor_grupo do
         ChckLstBxGrupoPart.checked[w_i-1] := true;
   End;
end;

procedure TfrmCalculoAtuarial.DBLkpCmbBxHipoteseCloseUp(Sender: TObject);
begin
   bbtnConfirmar.Enabled := true;
end;

{-----------------------------------}
{Rotina principal - Cálculo Atuarial}

procedure TfrmCalculoAtuarial.bbtnConfirmarClick(Sender: TObject);
var w_i : integer;
    w_opcao : boolean;
    w_grupo_sql : string;
begin
   //-- Verifica Calculo Individual

   If  RadioGroupTipoCalculo.ItemIndex = 0 then
   Begin
      frmProcura := TfrmProcura.create(application);
      frmProcura.DataSet := wwQryProcura;
      frmProcura.Form := 'Calculo';
      frmProcura.CD_VERSAO := inttostr(WG_CD_VERSAO);
      w_cd_partic := 0;
      frmProcura.ShowModal;

      If w_cd_partic = 0 then
      Begin
         frmProcura.free;
         Raise Exception.Create ('Selecione um Participante para realizar o cálculo');
      End;

      frmProcura.free;

   End;

   //-- Verifique se houve opção para grupo
   If  RadioGroupTipoCalculo.ItemIndex = 0 then
   Else
   Begin
      w_opcao := false;

      w_grupo_sql := ' ';

      For w_i := 1 to w_ocor_grupo do
         If ChckLstBxGrupoPart.checked[w_i-1]   then
         Begin
            w_grupo_sql := w_grupo_sql + inttostr(w_tp_grupo[w_i]) + ', ';
            w_opcao := true;
         End;

      If not w_opcao then
         Raise Exception.Create ('Selecione pelo menos um grupo de Participantes');

      wwQryPartic.SQL[10] := 'and PARTICIPANTE.CD_GRUPO_CALCULO in (' + copy(w_grupo_sql, 1, length(w_grupo_sql) - 2) + ')';
   End;

   {Inicializa / Cria variáveis}
   Wg_Variavel := TVarCalc.Create(Self); // Cria rotina p/ cálculo da fórmula
   Fquery      := TQuery.create(Owner);  // Cria query p/ exexutar SQL da  VARIÁVEL
   w_GeraReferCalculo := true;

   IniciaAnimacao;

   w_VarItemHipotese := tstringlist.create; // Guarda variável associada a tábua
   w_TabItemHipotese := tstringlist.create; // Guarda nome da tábua
   w_nome_par  := tstringlist.create;
   w_valor_par := tstringlist.create;

   qtempo := tlist.create;
   qtempo.capacity := 1;
   qtempo.add(ttempo.create);
   uFuncGerais.rtempo.criatempo;

   w_dt_refer  := refer_base;

   {Recupera formulas }
   wwQryCalcFormula.close;
   wwQryCalcFormula.open;

   {Recupera composição de formulas para ativos }
   wwQryRotinaAtivos.Close;
   wwQryRotinaAtivos.ParamByName('cd_pessoa_patroc').asinteger  := WG_CD_PESSOA_PATROC;
   wwQryRotinaAtivos.ParamByName('cd_pessoa_entid').asinteger := WG_CD_PESSOA_ENTID;
   wwQryRotinaAtivos.ParamByName('cd_plano').asinteger  := WG_CD_PLANO;

   If  RadioGroupTipoCalculo.ItemIndex = 0 then
       wwQryRotinaAtivos.SQL[14] := ' '
   Else
       wwQryRotinaAtivos.SQL[14] := '  and  a.cd_grupo_partic in (' + copy(w_grupo_sql, 1, length(w_grupo_sql) - 2) + ')';

   wwQryRotinaAtivos.open;


   {Recupera composição de formulas para benefícios }
   wwQryRotinaBenef.Close;
   wwQryRotinaBenef.ParamByName('cd_pessoa_patroc').asinteger  := WG_CD_PESSOA_PATROC;
   wwQryRotinaBenef.ParamByName('cd_pessoa_entid').asinteger := WG_CD_PESSOA_ENTID;
   wwQryRotinaBenef.ParamByName('cd_plano').asinteger  := WG_CD_PLANO;

   If  RadioGroupTipoCalculo.ItemIndex = 0 then
       wwQryRotinaBenef.SQL[14] := ' '
   Else
       wwQryRotinaBenef.SQL[14] := '  and  a.cd_grupo_partic in (' + copy(w_grupo_sql, 1, length(w_grupo_sql) - 2) + ')';

   wwQryRotinaBenef.open;


   frmAnimacao.SetAnimacao('Realizando cálculo atuarial ...',0,True,True,aviCopyFiles);

   w_seq_calculo := 0;

   {Recuperar participantes }
   wwQryPartic.Close;
   If  RadioGroupTipoCalculo.ItemIndex = 0 then
       wwQryPartic.SQL[11] := ' and PARTICIPANTE.CD_PARTIC = ' + inttostr(w_cd_partic)
   Else
       wwQryPartic.SQL[11] := ' ';

   wwQryPartic.ParamByName('CD_VERSAO').asinteger := WG_CD_VERSAO;
   wwQryPartic.open;

   If wwQryPartic.recordcount = 0 then
   Begin
      TerminaAnimacao;
      Raise Exception.Create ('Falta cadastrar Participantes para o cálculo desejado');
   End;

   w_linhas := wwQryPartic.recordcount;
   w_linha_Atual := 1;

   frmAnimacao.SetAnimacao ('Realizando cálculo atuarial ...',w_linhas,True,True,aviCopyFiles);

   While not wwQryPartic.eof do
   Begin
      frmAnimacao.SetProgressBar( w_linha_atual);
      If frmAnimacao.Cancel Then
      Begin
         frmAnimacao.Close;
         frmAnimacao.Free;
         ShowMessage('Processamento cancelado por intervenção do usuário');
         Exit;
      End;

      {Recupera Composição de formulas para o cálculo}
      If (wwQryParticCD_TIPO_BENEF.asInteger = 0) then
      Begin
         //-- Loop para rotinas de ativos
         If not wwQryRotinaAtivos.Locate
               ('cd_grupo_partic', wwQryParticCD_GRUPO_CALCULO.asinteger, []) then
         Begin
            TerminaAnimacao;
            Raise Exception.Create ('Falta associar em composição de fórmulas o grupo. ');
         End;

         {Rotina para inicializar variaveis a serem utilizadas no cálculo}
         cd_grupo_formula := wwQryRotinaAtivos.FieldByName('cd_grupo_formula').asinteger;

         Inicializa_Variaveis;

         While not wwQryRotinaAtivos.eof and
              (wwQryRotinaAtivos.FieldByName('cd_grupo_partic').asinteger =
               wwQryParticCD_GRUPO_CALCULO.asinteger)  do
         Begin
            {Rotina para calcular formula}
            cd_formula       := wwQryRotinaAtivos.FieldByName('cd_formula').asinteger;

            executaFormula;
            //---

            wwQryRotinaAtivos.next;
         End;

      End

      Else
      Begin

         //-- Loop para rotinas de benefícios
         If not wwQryRotinaBenef.Locate
               ('cd_grupo_partic;cd_tipo_benef',
                VarArrayOf([wwQryParticCD_GRUPO_CALCULO.asinteger,
                            wwQryParticCD_TIPO_BENEF.asinteger]), []) then
         Begin
            TerminaAnimacao;
            Raise Exception.Create ('Falta associar em composição de fórmulas o grupo. ');
         End;

         {Rotina para inicializar variaveis a serem utilizadas no cálculo}

         cd_grupo_formula := wwQryRotinaBenef.FieldByName('cd_grupo_formula').asinteger;

         Inicializa_Variaveis;

         While not wwQryRotinaBenef.eof and
               (wwQryRotinaBenef.FieldByName('cd_grupo_partic').asinteger = wwQryParticCD_GRUPO_CALCULO.asinteger) and
               (wwQryRotinaBenef.FieldByName('cd_tipo_benef').asinteger = wwQryParticCD_TIPO_BENEF.asinteger) do
         Begin
            {Rotina para calcular formula}
            cd_formula       := wwQryRotinaBenef.FieldByName('cd_formula').asinteger;

            executaFormula;

            wwQryRotinaBenef.next;
         End;
      End;

      {Rotina para gravar cálculo atuarial por Participante}
      dtmBaseDados.dbBaseDados.commit;

      Proximo_Partic;

   End;

   // liberar variáveis de cálculo
   wg_variavel.Destroy;
   Fquery.free;
   w_VarItemHipotese.free;
   w_TabItemHipotese.free;
   w_nome_par.free;         // libera parâmetros SQL
   w_valor_par.free;
   qtempo.free;

   frmAnimacao.Close;
   frmAnimacao.Free;

   If w_GeraReferCalculo then
     ShowMessage('Não foi gerada ocorrência de cálculo para a seleção de parâmetros solicitada')
   Else
     ShowMessage('Cálculo realizado com sucesso');
end;

{--------------------------------------------------------------------}
{Rotina de leitura do Participante}
procedure TfrmCalculoAtuarial.Proximo_Partic;
begin
   wwQryPartic.next;
   w_linha_atual := w_linha_atual + 1;
end;

{--------------------------------------------------------------------}
{Monta tábua de comutação}
procedure TfrmCalculoAtuarial.MontaTabuaComutacao;
begin
end;


{--------------------------------------------------------------------}
{Rotina para Atualizar Referencia de Calculo do Movimento}
procedure TfrmCalculoAtuarial.GeraReferCalculo;
var w_i : integer;

begin
   With dtmBaseDados.dbBaseDados do
   Begin
      If not InTransaction then
         StartTransaction;

      Try
         //-- Grava referência do cálculo
         wwQryInsReferCalculo.Close;
         wwQryInsReferCalculo.ParamByName('DT_GERACAO').asdatetime := w_dt_geracao;
         wwQryInsReferCalculo.ParamByName('CD_VERSAO').asinteger   := WG_CD_VERSAO;
         wwQryInsReferCalculo.ParamByName('CD_PESSOA_ENTID').asinteger   := WG_CD_PESSOA_ENTID;
         wwQryInsReferCalculo.ParamByName('CD_PESSOA_PATROC').asinteger    := WG_CD_PESSOA_PATROC;
         wwQryInsReferCalculo.ParamByName('CD_PLANO').asinteger    := WG_CD_PLANO;
         wwQryInsReferCalculo.ParamByName('CD_HIPOTESE').asinteger       := wwQryHipotesecd_hipotese.asinteger;
         wwQryInsReferCalculo.ParamByName('DT_REFER_CALCULO').asdatetime := w_dt_refer;
         wwQryInsReferCalculo.ParamByName('IR_CALCULO_EFETIVADO').asstring := 'N';
         wwQryInsReferCalculo.ExecSql;

         //-- Grava opção de grupos de participante

         For w_i := 1 to w_ocor_grupo do
            If ChckLstBxGrupoPart.checked[w_i-1]   then
            Begin
               wwQryOpcaoGrupo.Close;
               wwQryOpcaoGrupo.ParamByName('DT_GERACAO').asdatetime := w_dt_geracao;
               wwQryOpcaoGrupo.ParamByName('CD_PESSOA_ENTID').asinteger   := WG_CD_PESSOA_ENTID;
               wwQryOpcaoGrupo.ParamByName('CD_VERSAO').asinteger   := WG_CD_VERSAO;
               wwQryOpcaoGrupo.ParamByName('CD_PESSOA_PATROC').asinteger    := WG_CD_PESSOA_PATROC;
               wwQryOpcaoGrupo.ParamByName('CD_PLANO').asinteger    := WG_CD_PLANO;
               wwQryOpcaoGrupo.ParamByName('CD_GRUPO_PARTIC').asinteger := w_tp_grupo[w_i];

               wwQryOpcaoGrupo.execsql;

            End;

            //-- Atualiza na base
            Commit;

      Except
         on EDatabaseError do
         Begin
            TerminaAnimacao;
            Raise Exception.Create ('Erro na atualização da referência do cálculo atuarial');
            rollback;
            exit;
         End;
      End;
   End;
end;

{--------------------------------------------------------------------}
{Rotina para gravar movimento calculado }
procedure TfrmCalculoAtuarial.IncluiMovCalculado
         (w_cd_formula : integer; w_nome_variavel : string; w_valor_variavel : extended);
begin
   {Gera referencia de cálculo}
   If w_GeraReferCalculo then
   Begin
      GeraReferCalculo;
      w_GeraReferCalculo := false;
   End;

   {Gera ocorrências de cálculo}
   With dtmBaseDados.dbBaseDados do
   Begin
      If not InTransaction then
         StartTransaction;

      Try
         w_seq_calculo := w_seq_calculo + 1;

         wwQryInsOcorCalculo.Close;
         wwQryInsOcorCalculo.ParamByName('DT_GERACAO').asdatetime       := w_dt_geracao;
         wwQryInsOcorCalculo.ParamByName('CD_VERSAO').asinteger         := wwQryPartic.fieldbyname('CD_VERSAO').asinteger;
         wwQryInsOcorCalculo.ParamByName('CD_PESSOA_ENTID').asinteger   := wwQryParticCD_PESSOA_ENTID.asinteger;
         wwQryInsOcorCalculo.ParamByName('CD_PESSOA_PATROC').asinteger  := wwQryParticCD_PESSOA_PATROC.asinteger;
         wwQryInsOcorCalculo.ParamByName('CD_PLANO').asinteger          := wwQryParticCD_PLANO.asInteger;
         wwQryInsOcorCalculo.ParamByName('SQ_OCOR_CALCULO').asinteger   := w_seq_calculo;
         wwQryInsOcorCalculo.ParamByName('CD_PARTIC').asinteger         := wwQryParticCD_PARTIC.asInteger;

         If wwQryPartic.FieldByName('CD_TIPO_BENEF').IsNull then
            wwQryInsOcorCalculo.ParamByName('CD_TIPO_BENEF').clear
         Else
            wwQryInsOcorCalculo.ParamByName('CD_TIPO_BENEF').asinteger  := wwQryPartic.FieldByName('CD_TIPO_BENEF').asinteger;

         If w_cd_formula = 0 then
            wwQryInsOcorCalculo.ParamByName('CD_FORMULA').clear
         Else
            wwQryInsOcorCalculo.ParamByName('CD_FORMULA').asinteger     := w_cd_formula;

         wwQryInsOcorCalculo.ParamByName('NO_VARIAVEL').asstring        := w_nome_variavel;
         wwQryInsOcorCalculo.ParamByName('CD_GRUPO_PARTIC').asinteger   := wwQryParticCD_GRUPO_CALCULO.asinteger;
         wwQryInsOcorCalculo.ParamByName('VL_CALCULO_ATUARIAL').asfloat := w_valor_variavel;

         If w_valor_variavel <> 0 then
         //---
            wwQryInsOcorCalculo.execsql;

      except
         on EDatabaseError do
         Begin
            TerminaAnimacao;
            Raise Exception.Create ('Erro na inclusão do movimento calculado');
            rollback;
            exit;
         End;
      End;
   End;
end;

{--------------------------------------------------------------------}
{Rotina para inicializar variaveis a serem utilizadas no cálculo}
procedure TfrmCalculoAtuarial.Inicializa_Variaveis;

begin
   wg_variavel.SetDefaultValue;
   w_VarItemHipotese.clear; // limpa variável associada a tábua
   w_TabItemHipotese.clear; // limpa no da tabua associada

   {Recupera variáveis da formula}
   wwQryVariavelFormula.close;
   wwQryVariavelFormula.ParamByName('cd_grupo_formula').asinteger := cd_grupo_formula;
   wwQryVariavelFormula.open;

   If wwQryVariavelFormula.eof then
   Begin
      TerminaAnimacao;
      Raise Exception.Create ('Relacionamento de Variáveis X Fórmula não gerado');
   End;

   {Inicialíza variáveis}
   While not wwQryVariavelFormula.eof do
   Begin
      { valor a partir de uma query}
      If wwQryVariavelFormulano_campo_banco.asstring <> '' then
         Wg_variavel.SetVarValue(wwQryVariavelFormulano_variavel.asstring,
                                 ExecSQL_Variavel(wwQryVariavelFormulano_campo_banco.AsString,
                                 wwQryVariavelFormulads_sql_campo_banco.asstring))
      ELse
      { valor a partir de uma função}
         If wwQryVariavelFormulano_funcao.asstring <> '' then
            Wg_variavel.SetVarValue(wwQryVariavelFormulano_variavel.asstring,
                                    valor_funcao(wwQryParticCD_PARTIC.asinteger,
                                                 wwQryVariavelFormulano_funcao.asstring))
         Else
            { valor a partir do item da hipótese}
            If variavel_item_hipotese > 0.00 then
               Wg_variavel.SetVarValue(wwQryVariavelFormulano_variavel.asstring,
                                       w_val_hipotese);

      {Grava variável Incicalizada}
      If  wwQryVariavelFormulaIR_OCOR_CALC_ATUARIAL.asstring = 'S' then
          IncluiMovCalculado (0,
                              wwQryVariavelFormulano_variavel.asstring,
                              Wg_variavel.GetVarValue(wwQryVariavelFormulano_variavel.asstring));

      wwQryVariavelFormula.next;

   End;
end;

{--------------------------------------------------------------------}
{Executa funções definidas na variável}
function TfrmCalculoAtuarial.valor_funcao(
                             w_cd_pessoa   : integer;
                             w_nome_funcao : string): extended;
begin
   { cálculo da idade do participante}
   If w_nome_funcao = 'x' then
   Begin
      qtempo := x(w_cd_pessoa, w_dt_refer);
      rtempo := qtempo.items[0];
      result := rtempo.anos;
      exit;
   End;

   { Idade do dependente mais velho - cabeça do casal}
   If w_nome_funcao = 'y' then
   Begin
      qtempo := y(w_cd_pessoa, w_dt_refer);
      rtempo := qtempo.items[0];
      result := rtempo.anos;
      exit;
   End;

   { Tempo de empresa anterior}
   If w_nome_funcao = 'e' then
   Begin
      qtempo := e(w_cd_pessoa);
      rtempo := qtempo.items[0];
      result := rtempo.anos;
      exit;
   End;

   { cálculo da idade de aposentadoria}
   If w_nome_funcao = 'x_IdadeAposent' then
   Begin
      result := x_IdadeAposent(w_cd_pessoa, w_dt_refer);
      exit;
   End;

   { cálculo da idade do participante na admissão - emprego atual}
   If w_nome_funcao = 'x_IdadeAdm' then
   Begin
      qtempo := x_IdadeAdm(w_cd_pessoa, w_dt_refer);
      rtempo := qtempo.items[0];
      result := rtempo.anos;
      exit;
   End;

   // função não definida
   TerminaAnimacao;
   Raise Exception.Create ('Função ' + w_nome_funcao + ' não definida no sistema');
end;

{--------------------------------------------------------------------}
{Rotina recuperar valor de variáveis a partir do item de hipótese}
function TfrmCalculoAtuarial.variavel_item_hipotese : extended;
begin
   { IR_ITEM_HIPOTESE :   T -> tábua
                          P -> percentual
                          F -> fator
                          J -> Juros  }

   wwQryVariavelHipotese.close;
   wwQryVariavelHipotese.SQL[3] := 'a.cd_hipotese = ' + wwQryHipotesecd_hipotese.AsString + ' and ';
   wwQryVariavelHipotese.SQL[4] := 'b.no_variavel = ' + QuotedStr(wwQryVariavelFormulano_variavel.asstring);
   wwQryVariavelHipotese.open;

   If wwQryVariavelHipotese.recordcount = 0 then
   Begin
      result := 0.00;
      exit;
   End;

   If wwQryVariavelHipoteseIR_ITEM_HIPOTESE.asString <> 'T' then
   Begin
      w_val_hipotese :=  wwQryVariavelHipoteseVL_HIPOTESE.asFloat;
      result := wwQryVariavelHipoteseVL_HIPOTESE.asFloat;
   End
   Else
   Begin
      w_VarItemHipotese.add(wwQryVariavelHipoteseno_variavel.asstring);
      w_val_hipotese :=  0.00;
      result := 0.00;
   End;
end;

{--------------------------------------------------------------------}
{Rotina para executar o calculo da formula}
procedure TfrmCalculoAtuarial.Executa_Formula;
var w_valor_final, w_valor_inicial, w_i : integer;
    w_somatorio  : extended;
begin
   If not wwQryCalcFormula.Locate
      ('cd_formula', cd_formula, []) then
   Begin
      TerminaAnimacao;
      Raise Exception.Create ('Formula Inexistente para executar cálculo: ' +
                              inttostr (cd_formula) );
   End;
end;

{--------------------------------------------------------------------}
{Rotina para executar SQL associado a VARIÁVEL}
function TfrmCalculoAtuarial.ExecSQL_Variavel (w_campo, w_SQL : string) : variant;
var sql : string;
begin
   Fquery.DataBaseName := 'BaseDados';

   Fquery.close;
   Fquery.SQL.Clear;
   sql := AtualizaParametros (wwQryPartic.fieldbyname('CD_VERSAO').asinteger,
                              wwQryPartic.fieldbyname('CD_PARTIC').asinteger, w_SQL);

   Fquery.SQL.Add (sql);

   Fquery.open;

   If Fquery.recordcount > 0 then
     ExecSQL_Variavel := Fquery.Fields[0].asfloat
   Else
     ExecSQL_Variavel := 0.00;
end;

{--------------------------------------------------------------------}
{ Rotina recursiva para cálculo das expressões
  utilizando variáveis indexadas de várias dimensões  }
Function  TfrmCalculoAtuarial.Calcula_Expressao_Recursiva (Cadeia : String) : Extended;
Begin
End;

{--------------------------------------------------------------------}
{Recupera valor da tabela de comutação}
function TfrmCalculoAtuarial.valor_comutacao (w_nome_variavel : string;
                                              w_idade : integer): extended;
begin
end;
{--------------------------------------------------------------------}
{Recupera valor da variável do item de hipótese associada a uma
 determinada tábua}
function TfrmCalculoAtuarial.valor_tabua (w_nome_variavel : string;
                                          w_idade : integer): extended;
begin

   valor_tabua := 0.00;

   { Verifica se variavel esta associada a tábua  }
   If not w_VarItemHipotese.find (w_nome_variavel, w_IndItemHipotese) then
      exit;

   wwQryOcorrTabua.close;
   wwQryOcorrTabua.ParamByName('cd_tabua').asinteger := strtoint(w_TabItemHipotese[w_IndItemHipotese]);
   wwQryOcorrTabua.ParamByName('nr_idade').asinteger := w_idade;
   wwQryOcorrTabua.open;

   If wwQryOcorrTabua.recordcount = 0 then
   Begin
      TerminaAnimacao;
      Raise Exception.create ('Hipotese: falta idade ' + inttostr(w_idade) +  '/' + w_nome_variavel +
                              ' na tabua do item : ' + wwQryVariavelHipoteseds_item_hipotese.asstring);
   End;

   If w_nome_variavel = 'l_x' then result := wwQryOcorrTabuanr_l_x.asfloat;
   If w_nome_variavel = 'p_x' then result := wwQryOcorrTabuanr_p_x.asfloat;
   If w_nome_variavel = 'd_x' then result := wwQryOcorrTabuanr_d_x.asfloat;
   If w_nome_variavel = 'q_x' then result := wwQryOcorrTabuanr_q_x.asfloat;
   If w_nome_variavel = 'i_x' then result := wwQryOcorrTabuanr_i_x.asfloat;
end;

//---------------------------------------------------------------
//-- Instancia frmAnimacao de Importação
//---------------------------------------------------------------
procedure TfrmCalculoAtuarial.IniciaAnimacao;
Begin
   //-- Animação de Exclusão
   Application.CreateForm(TfrmAnimacao, frmAnimacao);
End;
//---------------------------------------------------------------
//-- Destroy frmAnimação
//---------------------------------------------------------------
procedure TfrmCalculoAtuarial.TerminaAnimacao;
Begin
   frmAnimacao.Close;
   frmAnimacao.Free;
End;

procedure TfrmCalculoAtuarial.RadioGroupTipoCalculoClick(Sender: TObject);
begin
   If RadioGroupTipoCalculo.ItemIndex = 0 then
      GrpBxGrupos.Enabled := false
   Else
      GrpBxGrupos.Enabled := true;
end;

procedure TfrmCalculoAtuarial.CMProcuraMatriculaApertouBotao(
  Sender: TObject);
begin
end;

procedure TfrmCalculoAtuarial.spbMemoriaClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMemoriaCalculo,TfrmMemoriaCalculo,False );
end;

function TfrmCalculoAtuarial.calculaExpressaoRecursiva(sCADEIA: String): Extended;
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
      Expressao.FVarCalcList := @Wg_Variavel;

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
            // W_VarIndexada = null, caso não existe variável indexada na fórmula
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

                  //Grava variável calculada
                  If wwQryVariavelFormulaIR_OCOR_CALC_ATUARIAL.asstring = 'S' then
                     IncluiMovCalculado(wwQryCalcFormulaCD_FORMULA.asinteger, sNOME_VARIAVEL, fValor);

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

                  //Grava variável calculada
                  If wwQryVariavelFormulaIR_OCOR_CALC_ATUARIAL.asstring = 'S' then
                     IncluiMovCalculado(wwQryCalcFormulaCD_FORMULA.asinteger, sNOME_VARIAVEL, fValor);

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

function TfrmCalculoAtuarial.valorComutacao(sNOME_VARIAVEL: String; iIDADE: Integer; iIDADE_PENSAO: Integer = -1): Extended;
begin
end;

function TfrmCalculoAtuarial.executaFormula: Extended;
var i, iValorInicial, iValorFinal, iVALOR_INICIAL1, iVALOR_INICIAL2: Integer;
    bINDEXADA: Boolean;
begin
end;

procedure TfrmCalculoAtuarial.ssbReCalcHipoteClick(Sender: TObject);
begin
   inherited; 
   AbrirFormModal( FrmVerHipoteses, TFrmVerHipoteses);
end;

end.
