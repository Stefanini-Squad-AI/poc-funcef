// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit fParamRelGerencial03;

interface

uses
  Windows    , Messages, SysUtils, Classes , Graphics, Controls, Forms   ,
  FOkCancelar, IvDictio, IvMulti , IvEMulti, MAHlpBtn, StdCtrls, Buttons ,
  TB97Tlbr   , TB97    , ExtCtrls, Db      , DBTables, Wwquery , Wwdatsrc,
  checklst   , Spin    , Dialogs , wwdblook;

type
  TfrmParamRelGerencial03 = class(TfrmOkCancelar)
    GroupBox1        : TGroupBox;
    cmbPatrocinadora : TwwDBLookupCombo;
    dsPatrocinadora  : TwwDataSource;
    qryPatrocinadora : TwwQuery;
    GroupBox2        : TGroupBox;
    chklstbxRegional : TCheckListBox;
    QryRegional      : TwwQuery;
    GroupBox3        : TGroupBox;
    cmbMes01         : TComboBox;
    spnAno01         : TSpinEdit;
    GroupBox4        : TGroupBox;
    cmbPlano         : TwwDBLookupCombo;
    dsPlano          : TwwDataSource;
    qryPlano         : TwwQuery;
    qryTmp           : TwwQuery;
    GroupBox5        : TGroupBox;
    Memo1            : TMemo;
    chkbcTempo       : TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbPatrocinadoraChange(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnInverterClick(Sender: TObject);
    procedure chklstbxRegionalClickCheck(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Var frmParamRelGerencial03 : TfrmParamRelGerencial03;
    oRegional              : TStringList;

implementation

uses dRelatGerencial, UAdmPrev, fAguarde;

{$R *.DFM}

procedure TfrmParamRelGerencial03.FormCreate(Sender: TObject);
begin
  inherited;
  // Abre Querys
  QryPatrocinadora.Close;
  QryPatrocinadora.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; // CAMILLE - 07.07.2003
  QryPatrocinadora.Open;

  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; // CAMILLE - 07.07.2003
  qryPlano.Open;
  // Cria Objetos
  oRegional := TStringList.Create;
end;

procedure TfrmParamRelGerencial03.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  inherited;
  // Fecha Querys
  QryPatrocinadora.Close;
  QryPlano.Close;
  QryRegional.Close;  
  QryTmp.Close;
  dtmRelatorioGerencial.QryRegional.Close;
  // Destrói Objetos
  oRegional.Free;
  // Libera o Form
  Action := caFree;
end;

procedure TfrmParamRelGerencial03.cmbPatrocinadoraChange(Sender: TObject);
begin
  inherited;
  // Preenche o CheckListBox de Regionais segundo a Patrocinadora
  // -------------------------------------------------------------
  // Query Regional
  QryRegional.Close;
  QryRegional.ParamByName('IDPESSJUR').AsInteger := StrtoInt(cmbPatrocinadora.LookUpValue);
  QryRegional.Open;
  // CheckListBox Regional
  chklstbxRegional.Items.Clear;
  // Loop de Preenchimento do ChekcListBox
  While Not QryRegional.Eof Do
   Begin
     chklstbxRegional.Items.Add(QryRegional.FieldByName('PATRO').AsString);
     oRegional.Add(QryRegional.FieldByName('IDPESSOA').AsString);
     QryRegional.Next;
   End;
end;

procedure TfrmParamRelGerencial03.btnTodosClick(Sender: TObject);
Var n : Integer;
begin
  inherited;
  // Marca todas as Regionais
  For n := 0 To (chklstbxRegional.Items.Count-1) Do
     If Not (chklstbxRegional.Checked[n]) Then chklstbxRegional.Checked[n] := True;
end;

procedure TfrmParamRelGerencial03.btnInverterClick(Sender: TObject);
Var n : Integer;
begin
  inherited;
  // Marca todas as Regionais
  For n := 0 To (chklstbxRegional.Items.Count-1) Do
     chklstbxRegional.Checked[n] := Not chklstbxRegional.Checked[n];
end;

procedure TfrmParamRelGerencial03.chklstbxRegionalClickCheck(Sender: TObject);
Var iConta, n : Integer;
    bFaz      : Boolean;
begin
  inherited;
  // Inicializa Variável
  iConta  := 0;
  bFaz    := True;
  // Verifica se existem mais de 6 regionais marcadas
  For n := 0 To (chklstbxRegional.Items.Count-1) Do
   Begin
     If (chklstbxRegional.Checked[n]) Then iConta := iConta + 1;
     If (iConta > 5) Then
      Begin
        // Limita para aparecer somente uma vez
        If bFaz Then
	 Begin
           ShowMessage('A quantidade máxima de Regionais permitidas neste Relatório: 5 (cinco).');
           bFaz := False;
         End;
        // Desmarca o item corrente
        chklstbxRegional.Checked[chklstbxRegional.ItemIndex] := False;
      End;
   End;
end;

procedure TfrmParamRelGerencial03.bbtnConfirmarClick(Sender: TObject);
Var bFaz                : Boolean;
    n       , iConta    : Integer;
    iLabel              : Integer;
    sMes    , sMes1     : String;
    sRegional           : String;
    sPagador, sContrib  : String;
    aux			: Real;
begin
  inherited;
  // Inicializa Variáveis
  bFaz      := True;
  sMes      := '';
  sRegional := '';
  sPagador  := '';
  sContrib  := '';
  iConta    := 0;
  // Verifica se opções da tela de filtro foram escolhidas
  // -----------------------------------------------------
  // 1.0 - Patrocinadora
  If (cmbPatrocinadora.Text = '') Then
   Begin
     bFaz := False;
     ShowMessage('É obrigatória a escolha de uma Patrocinadora.');
     cmbPatrocinadora.SetFocus;
   End;
  // 2.0 - Regionais
{  If (chklstbxRegional.SelCount < 1) Then
   Begin
     bFaz := False;
     ShowMessage('É obrigatória a escolha de no mínimo uma Regional.');
     chklstbxRegional.SetFocus;
   End;}
  // 3.0 - Plano
  If (cmbPlano.Text = '') Then
   Begin
     bFaz := False;
     ShowMessage('É obrigatória a escolha de um Plano.');
     cmbPlano.SetFocus;
   End;
  // Monta Data
  If (cmbMes01.ItemIndex < 9) Then
   Begin
     If (cmbMes01.ItemIndex > -1) Then sMes := IntToStr(spnAno01.Value)+'/0'+IntToStr(cmbMes01.ItemIndex+1)
     Else sMes := IntToStr(spnAno01.Value)+'/01';
   End
  Else sMes := IntToStr(spnAno01.Value)+'/'+IntToStr(cmbMes01.ItemIndex+1);
  // Adiciona ''
  // Carlos Eduardo - Alteração: A variável sMes deveria conter o primeiro mês do ano
  //                  de exercício para calcular o acumulado do ano.
  // Definição      : sMes  => 1º mês do ano em exercício.
  //                  sMes1 => mês referente (selecionado).
  sMes1 := sMes;
  sMes := IntToStr(spnAno01.Value)+'/01';

//  sMes1 := SAnoMesAnterior(sMes); Verificar...
  // Monta Querys
  If bFaz Then
   Begin
     frmAguarde.Mostra('Aguarde... Montando Relatório.');
     // Verifica Tempo de Processamento
     If chkbcTempo.Checked Then
      Begin
	dRelatGerencial.bTempo := True;
	dRelatGerencial.dTempo := Time;
      End
     Else dRelatGerencial.bTempo := False;
     // ************************************************************************
     // *                                                                      *
     // * Relatório 07                                                         *
     // *                                                                      *
     // ************************************************************************
     qryTmp.Close;
     qryTmp.SQL.Clear;
     qryTmp.SQL.Add(
'SELECT '+
'       PAT.NOME                                                         AS PATROCINADORA, '+
'       DECODE(REG.PATRO, NULL,''Não Identificada'',REG.PATRO)           AS REGIONAL     , '+
'       DECODE(CP.FLGPAGADOR, ''C'', ''Participante'',''Patrocinadora'') AS PAGADOR      , '+
'       C.NOME                                                           AS CONTRIBUICAO , '+
'       SUM(HST.VALORRECEBIDO)                                           AS ACUMULADO '+
'/*-----------------------------------------------------------------*/ '+
'FROM CONTRIBUICAO C, CONTPREV       CP , '+
'     ELEGPATRO   EL, HSTCONTRIBPREV HST, PESSOA PAT, '+
'/*-----------------------------------------------------------------*/ '+
'     (SELECT DISTINCT REG.IDPESSOA, REG.NOME AS PATRO '+
'        FROM PESSOA REG, ELEGPATRO EP '+
'        WHERE (EP.IDESTAB = REG.IDPESSOA) '+
'          AND (EP.IDPESSJUR = '+cmbPatrocinadora.LookupValue+ ')) REG ');
     // Preenche com as Regionais Escolhidas
     For n := chklstbxRegional.Items.Count-1 DownTo 0 Do
      Begin
	If (chklstbxRegional.Checked[n]) Then sRegional := sRegional + oRegional.Strings[n]+', ';
      End;
     // Retira a "," (vírgula) do final da string
     sRegional := Copy(sRegional,1,(Length(sRegional)-2));
     // Continua ...
     QryTmp.SQL.Add(
'/*-----------------------------------------------------------------*/ '+
'WHERE (HST.MESREFERENCIA  = '+QuotedStr(sMes1)+') '+
'AND   (HST.IDPLANOPREV    = '+cmbPlano.LookupValue+') '+
'AND   (HST.FLGDEVOLUCAO   = 0) '+
'AND   (PAT.IDPESSOA       = '+cmbPatrocinadora.LookupValue+') '+
'AND   (HST.IDPESSJUR      = EL.IDPESSJUR) '+
'AND   (HST.IDPESSOA       = EL.IDPESSOA) '+
'AND   (EL.IDPESSJUR       = PAT.IDPESSOA) '+
'AND   (HST.IDPLANOPREV    = CP.IDPLANOPREV) '+
'AND   (HST.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '+
'AND   (CP.IDCONTRIBUICAO  = C.IDCONTRIBUICAO) '+
'AND   (EL.IDESTAB         = REG.IDPESSOA) '+
'AND   (REG.IDPESSOA	  IN ('+sRegional+' ))'+
'GROUP BY PAT.NOME      , CP.FLGPAGADOR  , C.NOME, REG.PATRO '+
'ORDER BY PAT.NOME, CP.FLGPAGADOR, C.NOME, REG.PATRO');
     qryTmp.Open;

     // Prepara Query do Relatório "na mão"
     // -----------------------------------
     dtmRelatorioGerencial.QryGerencial03.Close;
     dtmRelatorioGerencial.QryGerencial03.SQL.Clear;
     dtmRelatorioGerencial.QryGerencial03.SQL.Add(
'SELECT ''                                                                      '' AS CONTRIBUICAO, '+
'       ''                     '' AS PAGADOR     , '+
'       0     AS COL01       , '+
'       0     AS COL02       , '+
'       0     AS COL03       , '+
'       0     AS COL04       , '+
'       0     AS COL05       , '+
'       0     AS COL06       , '+
'	0     AS TOTAL         '+
'FROM PARAMAPREV');
     dtmRelatorioGerencial.QryGerencial03.Open;

     // Query Regional
     dtmRelatorioGerencial.QryRegional.Close;
     dtmRelatorioGerencial.QryRegional.SQL.Clear;
     dtmRelatorioGerencial.QryRegional.SQL.Add(
'SELECT IDPESSOA, NOME, (ROWNUM+1) AS LINHA '+
'FROM PESSOA '+
'WHERE (IDPESSOA IN ('+sRegional+')) ');
//'ORDER BY NOME');
     dtmRelatorioGerencial.QryRegional.Open;
     // Inicializa Variáveis
     sPagador := QryTmp.FieldByName('PAGADOR').AsString;
     sContrib := QryTmp.FieldByName('CONTRIBUICAO').AsString;
     // Relatório 07
     // ------------
     // Loop para o preenchimento da Query Virtual

     While Not QryTmp.Eof Do
      Begin
	// Se não for o registro default insere
	If (Trim(dtmRelatorioGerencial.QryGerencial03.FieldByName('CONTRIBUICAO').AsString) <> '') Then
	   dtmRelatorioGerencial.QryGerencial03.Insert
	Else dtmRelatorioGerencial.QryGerencial03.Edit;
	// Joga Contribuiçao
	dtmRelatorioGerencial.QryGerencial03.FieldByName('CONTRIBUICAO').AsString := QryTmp.FieldByName('CONTRIBUICAO').AsString;
	dtmRelatorioGerencial.QryGerencial03.FieldByName('PAGADOR').AsString      := QryTmp.FieldByName('PAGADOR').AsString;
	// Loop por Pagador e Contribuição
	aux := 0;
	While (sPagador = QryTmp.FieldByName('PAGADOR').AsString)      And
	      (sContrib = QryTmp.FieldByName('CONTRIBUICAO').AsString) And
	      (Not QryTmp.Eof) Do
	 Begin
	   // Verifica em qual coluna será colocada a informação: "ACUMULADO"
	   // ---------------------------------------------------------------
	   // 1ª Coluna
	   If (QryTmp.FieldByName('REGIONAL').AsString = 'Não Identificada') Then
	      dtmRelatorioGerencial.QryGerencial03.FieldByName('COL01').AsFloat        := QryTmp.FieldByName('ACUMULADO').AsFloat;
	   // 2ª Coluna
	   If (QryTmp.FieldByName('REGIONAL').AsString = dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString) And
	      (dtmRelatorioGerencial.QryRegional.FieldByName('LINHA').AsInteger  = 2) Then
	      dtmRelatorioGerencial.QryGerencial03.FieldByName('COL02').AsFloat        := QryTmp.FieldByName('ACUMULADO').AsFloat;
	   // 3ª Coluna
	   If (QryTmp.FieldByName('REGIONAL').AsString = dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString) And
	      (dtmRelatorioGerencial.QryRegional.FieldByName('LINHA').AsInteger  = 3) Then
	      dtmRelatorioGerencial.QryGerencial03.FieldByName('COL03').AsFloat        := QryTmp.FieldByName('ACUMULADO').AsFloat;
	   // 4ª Coluna
	   If (QryTmp.FieldByName('REGIONAL').AsString = dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString) And
	      (dtmRelatorioGerencial.QryRegional.FieldByName('LINHA').AsInteger  = 4) Then
	      dtmRelatorioGerencial.QryGerencial03.FieldByName('COL04').AsFloat        := QryTmp.FieldByName('ACUMULADO').AsFloat;
	   // 5ª Coluna
	   If (QryTmp.FieldByName('REGIONAL').AsString = dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString) And
	      (dtmRelatorioGerencial.QryRegional.FieldByName('LINHA').AsInteger  = 5) Then
	      dtmRelatorioGerencial.QryGerencial03.FieldByName('COL05').AsFloat        := QryTmp.FieldByName('ACUMULADO').AsFloat;
	   // 6ª Coluna
	   If (QryTmp.FieldByName('REGIONAL').AsString = dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString) And
	      (dtmRelatorioGerencial.QryRegional.FieldByName('LINHA').AsInteger  = 6) Then
	      dtmRelatorioGerencial.QryGerencial03.FieldByName('COL06').AsFloat        := QryTmp.FieldByName('ACUMULADO').AsFloat;
	   // Movimentação dos ponteiros da Query

	   QryTmp.Next;
	   dtmRelatorioGerencial.QryRegional.Next;
	 End;
	 // acumular valores da linha.
	  aux := dtmRelatorioGerencial.QryGerencial03.Fieldbyname('COL02').AsFloat +
		 dtmRelatorioGerencial.QryGerencial03.Fieldbyname('COL03').AsFloat +
		 dtmRelatorioGerencial.QryGerencial03.Fieldbyname('COL04').AsFloat +
		 dtmRelatorioGerencial.QryGerencial03.Fieldbyname('COL05').AsFloat +
		 dtmRelatorioGerencial.QryGerencial03.Fieldbyname('COL06').AsFloat;
	  dtmRelatorioGerencial.QryGerencial03.FieldByName('TOTAL').AsFloat := aux;

	 // Grava Virtualmente
	 dtmRelatorioGerencial.QryGerencial03.Post;

	 If (Not QryTmp.Eof) Then
	  Begin
	    // Posiciona Querys
	    dtmRelatorioGerencial.QryRegional.First;
	    // Atualiza Variáveis
	    sPagador := QryTmp.FieldByName('PAGADOR').AsString;
	    sContrib := QryTmp.FieldByName('CONTRIBUICAO').AsString;
	  End;
      End;
     dtmRelatorioGerencial.QryGerencial03.First;

     // ************************************************************************
     // *                                                                      *
     // * Relatório 08                                                         *
     // *                                                                      *
     // ************************************************************************
     qryTmp.Close;
     qryTmp.SQL.Clear;
     qryTmp.SQL.Add(
'SELECT PAT.NOME                                                       AS PATRO   , '+
'       DECODE(CP.FLGPAGADOR,''C'',''Participante'',''Patrocinadora'') AS PAGADOR , '+
'       C.NOME                                                         AS CONTRIBUICAO, '+
'       DECODE(REG.NOME, NULL,''Não Identificada'', REG.NOME)          AS REGIONAL, '+
'       NVL(SUM(HST.VALORRECEBIDO),0)                                  AS ACUMULADO '+
'/*----------------------------------------------------------------------------*/ '+
'FROM CONTRIBUICAO C , CONTPREV       CP , '+
'     ELEGPATRO    EL, HSTCONTRIBPREV HST, PESSOA PAT, '+
'/*----------------------------------------------------------------------------*/ '+
'     (SELECT DISTINCT REG.IDPESSOA, REG.NOME '+
'        FROM PESSOA REG, ELEGPATRO EP '+
'        WHERE  (EP.IDESTAB = REG.IDPESSOA) '+
'	   AND  (EP.IDPESSJUR = '+cmbPatrocinadora.LookupValue+')) REG '+
'/*-----------------------------------------------------------------*/ '+
'WHERE (HST.MESREFERENCIA >= '+QuotedStr(sMes)+') '+
'AND   (HST.MESREFERENCIA <= '+QuotedStr(sMes1)+') '+
'AND   (HST.FLGDEVOLUCAO   = 0) '+
'AND   (PAT.IDPESSOA       = '+cmbPatrocinadora.LookupValue+') '+
'AND   (HST.IDPLANOPREV    = '+cmbPlano.LookupValue+') '+
'AND   (HST.IDPESSJUR      = EL.IDPESSJUR) '+
'AND   (HST.IDPESSOA       = EL.IDPESSOA) '+
'AND   (EL.IDPESSJUR       = PAT.IDPESSOA) '+
'AND   (HST.IDPLANOPREV    = CP.IDPLANOPREV) '+
'AND   (HST.IDCONTRIBUICAO = CP.IDCONTRIBUICAO) '+
'AND   (CP.IDCONTRIBUICAO  = C.IDCONTRIBUICAO) '+
'AND   (EL.IDESTAB         = REG.IDPESSOA) '+
'AND   (REG.IDPESSOA	  IN ('+sRegional+' ))'+
'/*----------------------------------------------------------------------------*/ '+
'GROUP BY PAT.NOME, CP.FLGPAGADOR, C.NOME, REG.NOME '+
'ORDER BY PAT.NOME, CP.FLGPAGADOR, C.NOME, REG.NOME');
     qryTmp.Open;
//     qryTotalContrib.Open;
     qryTmp.First;
     // Prepara Query do Relatório "na mão"
     // -----------------------------------
     dtmRelatorioGerencial.qryGer03Sub01.Close;
     dtmRelatorioGerencial.qryGer03Sub01.SQL.Clear;
     dtmRelatorioGerencial.qryGer03Sub01.SQL.Add(
'SELECT ''                                                                      '' AS CONTRIBUICAO, '+
'       ''                     '' AS PAGADOR     , '+
'       0     AS COL01       , '+
'       0     AS COL02       , '+
'       0     AS COL03       , '+
'       0     AS COL04       , '+
'       0     AS COL05       , '+
'       0     AS COL06       , '+
'       0     AS TOTAL         '+

'FROM PARAMAPREV');
     dtmRelatorioGerencial.qryGer03Sub01.Open;
     // Inicializa Variáveis
     sPagador := qryTmp.FieldByName('PAGADOR').AsString;
     sContrib := qryTmp.FieldByName('CONTRIBUICAO').AsString;
     // Relatório 08
     // ------------
     // Loop para o preenchimento da Query Virtual
     aux := 0;
     While Not qryTmp.Eof Do
      Begin
	// Se não for o registro default insere
	If (Trim(dtmRelatorioGerencial.qryGer03Sub01.FieldByName('CONTRIBUICAO').AsString) <> '') Then
	   dtmRelatorioGerencial.qryGer03Sub01.Insert
	Else dtmRelatorioGerencial.qryGer03Sub01.Edit;
	// Joga Contribuiçao
	dtmRelatorioGerencial.qryGer03Sub01.FieldByName('CONTRIBUICAO').AsString := sContrib;
	dtmRelatorioGerencial.qryGer03Sub01.FieldByName('PAGADOR').AsString      := sPagador;
	// Loop por Pagador e Contribuição
	While (sPagador = qryTmp.FieldByName('PAGADOR').AsString)      And
	      (sContrib = qryTmp.FieldByName('CONTRIBUICAO').AsString) And
	      (Not qryTmp.Eof) Do
	 Begin
	   // Verifica em qual coluna será colocada a informação: "ACUMULADO"
	   // ---------------------------------------------------------------
	   // 1ª Coluna
	   If (qryTmp.FieldByName('REGIONAL').AsString = 'Não Identificada') Then
	      dtmRelatorioGerencial.qryGer03Sub01.FieldByName('COL01').AsFloat        := qryTmp.FieldByName('ACUMULADO').AsFloat;
	   // 2ª Coluna
	   If (qryTmp.FieldByName('REGIONAL').AsString = dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString) And
	      (dtmRelatorioGerencial.QryRegional.FieldByName('LINHA').AsInteger  = 2) Then
	      dtmRelatorioGerencial.qryGer03Sub01.FieldByName('COL02').AsFloat        := qryTmp.FieldByName('ACUMULADO').AsFloat;
	   // 3ª Coluna
	   If (qryTmp.FieldByName('REGIONAL').AsString = dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString) And
	      (dtmRelatorioGerencial.QryRegional.FieldByName('LINHA').AsInteger  = 3) Then
	      dtmRelatorioGerencial.qryGer03Sub01.FieldByName('COL03').AsFloat        := qryTmp.FieldByName('ACUMULADO').AsFloat;
	   // 4ª Coluna
	   If (qryTmp.FieldByName('REGIONAL').AsString = dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString) And
	      (dtmRelatorioGerencial.QryRegional.FieldByName('LINHA').AsInteger  = 4) Then
	      dtmRelatorioGerencial.qryGer03Sub01.FieldByName('COL04').AsFloat        := qryTmp.FieldByName('ACUMULADO').AsFloat;
	   // 5ª Coluna
	   If (qryTmp.FieldByName('REGIONAL').AsString = dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString) And
	      (dtmRelatorioGerencial.QryRegional.FieldByName('LINHA').AsInteger  = 5) Then
	      dtmRelatorioGerencial.qryGer03Sub01.FieldByName('COL05').AsFloat        := qryTmp.FieldByName('ACUMULADO').AsFloat;
	   // 6ª Coluna
	   If (qryTmp.FieldByName('REGIONAL').AsString = dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString) And
	      (dtmRelatorioGerencial.QryRegional.FieldByName('LINHA').AsInteger  = 6) Then
	      dtmRelatorioGerencial.qryGer03Sub01.FieldByName('COL06').AsFloat        := qryTmp.FieldByName('ACUMULADO').AsFloat;

	   // Movimentação dos ponteiros da Query
	   qryTmp.Next;
	   dtmRelatorioGerencial.QryRegional.Next;
	 End;
	  aux := dtmRelatorioGerencial.qryGer03Sub01.Fieldbyname('COL02').AsFloat +
		 dtmRelatorioGerencial.qryGer03Sub01.Fieldbyname('COL03').AsFloat +
		 dtmRelatorioGerencial.qryGer03Sub01.Fieldbyname('COL04').AsFloat +
		 dtmRelatorioGerencial.qryGer03Sub01.Fieldbyname('COL05').AsFloat +
		 dtmRelatorioGerencial.qryGer03Sub01.Fieldbyname('COL06').AsFloat;
	  dtmRelatorioGerencial.qryGer03Sub01.FieldByName('TOTAL').AsFloat := aux;

	 // Grava Virtualmente
	 dtmRelatorioGerencial.qryGer03Sub01.Post;

	 If (Not qryTmp.Eof) Then
	  Begin
	    // Posiciona Querys
	    dtmRelatorioGerencial.QryRegional.First;
	    // Atualiza Variáveis
	    sPagador := qryTmp.FieldByName('PAGADOR').AsString;
	    sContrib := qryTmp.FieldByName('CONTRIBUICAO').AsString;
	  End;
      End;
     //
     dtmRelatorioGerencial.qryGer03Sub01.First;
//******************************************************************************
     // Abre Query Fundação
     dtmRelatorioGerencial.qryFundacao.Close;
     dtmRelatorioGerencial.qryFundacao.ParamByName('pFundacao').AsInteger := UAdmPrev.iIdFundacao;
     dtmRelatorioGerencial.qryFundacao.Open;
     // Labels
     dtmRelatorioGerencial.lbRel08.Caption        :=
       '8 - Receita de Contribuição Previdenciária por Regional (Acumulado no exercício até '+sMes1+')';

     dtmRelatorioGerencial.lbRel07.Caption        :=
       '7 - Receita de Contribuição Previdenciária por Regional ('+sMes1+')';//dtmRelatorioGerencial.lbRel07.Caption+sMes+').';
     dtmRelatorioGerencial.lbPatro01.Caption      := cmbPatrocinadora.Value;
     dtmRelatorioGerencial.lbPatro02.Caption      := cmbPatrocinadora.Value;
     dtmRelatorioGerencial.lbGer03Plano01.Caption := cmbPlano.Value;
     dtmRelatorioGerencial.lGer03Plano02.Caption  := cmbPlano.Value;
     // Labels das Regionais
     iLabel := 2;
     // Imprime Regionais nos Label's do cabeçalho
     dtmRelatorioGerencial.QryRegional.First;

     // Limpa labels das regionais.
     dtmRelatorioGerencial.lbReg02.Caption      := '';
     dtmRelatorioGerencial.lbGer03Reg02.Caption := '';

     dtmRelatorioGerencial.lbReg03.Caption      := '';
     dtmRelatorioGerencial.lbGer03Reg03.Caption := '';

     dtmRelatorioGerencial.lbReg04.Caption      := '';
     dtmRelatorioGerencial.lbGer03Reg04.Caption := '';

     dtmRelatorioGerencial.lbReg05.Caption      := '';
     dtmRelatorioGerencial.lbGer03Reg05.Caption := '';

     dtmRelatorioGerencial.lbReg06.Caption      := '';
     dtmRelatorioGerencial.lbGer03Reg06.Caption := '';

     While Not dtmRelatorioGerencial.QryRegional.Eof Do
      Begin
	If (iLabel = 2) Then
//        If (iLabel = 6) Then
	 Begin
	   dtmRelatorioGerencial.lbReg02.Caption      := dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString;
	   dtmRelatorioGerencial.lbGer03Reg02.Caption := dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString;
	 End
	Else If (iLabel = 3) Then
//        Else If (iLabel = 5) Then
	 Begin
	   dtmRelatorioGerencial.lbReg03.Caption      := dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString;
	   dtmRelatorioGerencial.lbGer03Reg03.Caption := dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString;
	 End
	Else If (iLabel = 4) Then
	 Begin
	   dtmRelatorioGerencial.lbReg04.Caption      := dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString;
	   dtmRelatorioGerencial.lbGer03Reg04.Caption := dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString;
	 End
	Else If (iLabel = 5) Then
//        Else If (iLabel = 3) Then
	 Begin
	   dtmRelatorioGerencial.lbReg05.Caption      := dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString;
	   dtmRelatorioGerencial.lbGer03Reg05.Caption := dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString;
	 End
	Else If (iLabel = 6) Then
//        Else If (iLabel = 2) Then
	 Begin
	   dtmRelatorioGerencial.lbReg06.Caption      := dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString;
	   dtmRelatorioGerencial.lbGer03Reg06.Caption := dtmRelatorioGerencial.QryRegional.FieldByName('NOME').AsString;
	 End;
	// Próximo e Incrementa
	dtmRelatorioGerencial.QryRegional.Next;
	iLabel := dtmRelatorioGerencial.QryRegional.FieldByName('LINHA').AsInteger;
      End;
   End
  Else ModalResult := mrNone;
   frmAguarde.Apaga; // CAMILLE - 08.07.2003
end;

end.

// -----------------------------------------------------------------------------
//   OBSERVAÇÕES:
//   ------------
//
//   1.0 - A query QryRegional é necessária para saber quais  são  as  Regionais
//         que o Usuário escolheu na tela de  filtro  e  a  ordem  em  que  elas
//         vieram; esta última define a ordem em que as Regionais aparecerão  na
//         lina destinada a elas. O ICONT define a coluna que está no "foco".
//
// -----------------------------------------------------------------------------
