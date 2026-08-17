{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FParamBenefSituacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, checklst, Db, DBTables, Wwquery, wwdblook, usistema, dbasedados;

type
  TfrmParamRelBenefSituacao = class(TfrmOkCancelar)
    GroupBox2            : TGroupBox;
    chklstbxBeneficio    : TCheckListBox;
    grpMesRef            : TGroupBox;
    cmbMes               : TComboBox;
    spedAno              : TSpinEdit;
    chkbxReajuste        : TCheckBox;
    rdgpSituacao         : TRadioGroup;
    BitBtn1              : TBitBtn;
    BitBtn2              : TBitBtn;
    qryBeneficio         : TwwQuery;
    qryPatrocinadora     : TwwQuery;
    GroupBox1: TGroupBox;
    cmbPatro: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelBenefSituacao         : TfrmParamRelBenefSituacao;
  oStrBeneficio : TStringList;
implementation

uses dRelFolha, uAdmPrevFB;

{$R *.DFM}

procedure TfrmParamRelBenefSituacao.FormCreate(Sender: TObject);
Var n: Integer;
begin
  inherited;
  // Abre Querys
  QryPatrocinadora.Open;
  QryBeneficio.Open;
  // Cria os TStringList para saber qual é o ID escolhido
  oStrBeneficio     := TStringList.Create;
  // Preenche os CheckListBox
  // ------------------------
  // Beneficio
  For n := 0 To QryBeneficio.RecordCount -1 Do
   Begin
    chklstbxBeneficio.Items.Add(QryBeneficio.FieldByName('BENEFICIO').AsString);
    oStrBeneficio.Add(QryBeneficio.FieldByName('IDBENEFICIO').AsString);
    QryBeneficio.Next;
   End;
  // Mês e Ano
  cmbMes.ItemIndex   := StrToInt(Copy(DateToStr(Date),4,2))-1;
  spedAno.Text       := Copy(DateToStr(Date),7,4);
end;

procedure TfrmParamRelBenefSituacao.BitBtn1Click(Sender: TObject);
Var iTot, n : Integer;
begin
  inherited;
  // Seleciona TODOS
  iTot  := chklstbxBeneficio.Items.Count;
  For n := 0 To (iTot-1) Do chklstbxBeneficio.Checked[n] := True;
end;

procedure TfrmParamRelBenefSituacao.BitBtn2Click(Sender: TObject);
Var iTot, n : Integer;
begin
  inherited;
  // INVERTE Seleção
  iTot  := chklstbxBeneficio.Items.Count;
  For n := 0 To (iTot-1) Do chklstbxBeneficio.Checked[n] := Not chklstbxBeneficio.Checked[n];
end;

procedure TfrmParamRelBenefSituacao.bbtnConfirmarClick(Sender: TObject);
Var bFaz                               : Boolean;
    n                                  : Integer;
    sIdPatro, sIdBenef, sTipo, sAnoMes : String;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // Inicializa Variáveis de Uso Geral
  bFaz     := False;
  sIdPatro := '';
  sIdbenef := '';
  sTipo    := '';
  sAnoMes  := '';


  If bFaz Then
   Begin
     // Verifica se o Mês e o Ano foram escolhidos
     If (cmbMes.Text = '') And (spedAno.Value < 1930) Then
      Begin
        ShowMessage('Um Mês deve ser escolhido e o Ano deve ser maior que 1930.');
        bFaz   := False;
      End
     Else
      Begin
        If cmbMes.ItemIndex < 9 Then sAnoMes := QuotedStr(IntToStr(spedAno.Value)+'/0'+IntToStr(cmbMes.ItemIndex+1))
        Else sAnoMes := QuotedStr(IntToStr(spedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1));
      End;
   End;

  // Faz Críticas e Monta Query
  If bFaz Then
   Begin
     // Verifica se Algum Beneficio foi escolhido
     For n := 0 To chklstbxBeneficio.Items.Count-1 Do
      Begin
       If chklstbxBeneficio.Checked[n] Then
        Begin
          bFaz := True;
          If sIdBenef = '' Then sIdBenef := oStrBeneficio.Strings[n]
          Else sIdBenef := sIdBenef+', '+oStrBeneficio.Strings[n];
        End;
      End;
     // Verifica se o Usuário quer Correção Monetária e Juros
     If chkbxReajuste.Checked Then dRelFolha.bFaz := True
     Else dRelFolha.bFaz := False;
     // Verifica Qual das situações serão utilizadas
     If rdgpSituacao.ItemIndex      = 0 Then
      Begin
        dtmRelFolha.lbTituloSituacao.Caption := 'RELATÓRIO DE BENEFÍCIOS CONCEDIDOS';
        sTipo                                :=  '1';
      End
     Else If rdgpSituacao.ItemIndex = 1 Then
      Begin
        dtmRelFolha.lbTituloSituacao.Caption := 'RELATÓRIO DE BENEFÍCIOS ENCERRADOS';
        sTipo                                := '3';
      End
     Else If rdgpSituacao.ItemIndex = 2 Then
      Begin
        dtmRelFolha.lbTituloSituacao.Caption := 'RELATÓRIO DE BENEFÍCIOS PENDENTES';
        sTipo                                := '4';
      End
     Else If rdgpSituacao.ItemIndex = 3 Then
      Begin
        dtmRelFolha.lbTituloSituacao.Caption := 'RELATÓRIO DE BENEFÍCIOS RETIDOS';
        sTipo                                := '2';
      End;

     // Monta Query
     // -----------
     If rdgpSituacao.ItemIndex > 1 Then // Pendentes ou Retidos
      Begin
        DtmRelFolha.QryBenefSituacao.Close;
        DtmRelFolha.QryBenefSituacao.SQL.Clear;
        DtmRelFolha.QryBenefSituacao.SQL.Add(
'SELECT DISTINCT '+
'       PJ.NOME                AS PATRO     , BE.NOME                AS BENEF         , '+
'       PE.NOME                             , SUM(HB.VALORCALCULADO) AS VALORCALCULADO, '+
'       BF.DATAREQUERIMENTO    AS DATAREQ   , BF.DATAINICIO          AS DATAINI       , '+
'       BF.IDPLANOPREV         AS PLANO     , BE.IDBENEFICIO                          , '+
'       SUM(HB.VALORCALCULADO) AS VALORATUAL                                            '+
'FROM PESSOA PE, BENEFICIO        BE, BENEFBFCIARIO BF, '+
'     PESSOA PJ, HSTBENEFBFCIARIO HB '+
'WHERE (BF.IDSITBENEFICIO = '+sTipo+')       AND '+
'      (HB.IDPESSJUR      = '+qryPatrocinadora.FieldByName('IDPESSOA').AsString+') AND '+
'      (HB.MES            = '+sAnoMes+')     AND ');
        // Se for escolhido algum Benefício
        If sIdBenef <> '' Then
           DtmRelFolha.QryBenefSituacao.SQL.Add('(BE.IDBENEFICIO IN ('+sIdBenef+')) AND ');

        DtmRelFolha.QryBenefSituacao.SQL.Add(
'      (HB.IDTITULAR      = PE.IDPESSOA)     AND '+
'      (HB.IDPESSJUR      = PJ.IDPESSOA)     AND '+
'      (HB.IDBENEFICIO    = BE.IDBENEFICIO)  AND '+
'      (BE.IDBENEFICIO    = BF.IDBENEFICIO)      '+
'GROUP BY PJ.NOME, BE.NOME, PE.NOME, BF.DATAREQUERIMENTO, BF.DATAINICIO, '+
'         BF.IDPLANOPREV  , BE.IDBENEFICIO '+
'ORDER BY PJ.NOME, BE.NOME, PE.NOME');
        // Troca dos Labels de Data
        DtmRelFolha.lbDataReq.Caption := 'Requerido Em';
        DtmRelFolha.lbDataIni.Caption := 'DIB';
      End
     Else If rdgpSituacao.ItemIndex = 0 Then // Concedidos
      Begin
        DtmRelFolha.QryBenefSituacao.Close;
        DtmRelFolha.QryBenefSituacao.SQL.Clear;
        DtmRelFolha.QryBenefSituacao.SQL.Add(
'SELECT DISTINCT PJ.NOME       AS PATRO, B.NOME           AS BENEF         , '+
'                P.NOME                , H1.VALORPROVENTO AS VALORCALCULADO, '+
'                BFB.VALORATUAL        , H1.IDRUBRICA     AS IDBENEFICIO   , '+
'                PLANPREV.NOME AS PLANO, BFB.DATAINICIO   AS DATAINI       , '+
'                ''''          AS DATAREQ '+
'FROM PREVIA H1, PESSOA PJ, PESSOA     P   , PARTPREVPLAN  PP , BENEFICIO B  , BENEFPLANPREV BPP, '+
'     PLANPREV , PATRO    , PARAMAPREV BACA, BENEFBFCIARIO BFB, ELEGPATRO ELG, HSTFOLHABENEF HSB, '+
'     HSTBENEFBFCIARIO HBF, HISTRUBSAL HRS '+
'WHERE (HBF.MES = '+sAnoMes+') AND');
        // Se algum Beneficio foi escolhido
        If sIdBenef <> '' Then DtmRelFolha.QryBenefSituacao.SQL.Add(' ( B.IDBENEFICIO IN ('+sIdBenef+')) AND ');
        // Se alguma Patrocinadora foi escolhida
        If sIdPatro <> '' Then DtmRelFolha.QryBenefSituacao.SQL.Add(' ( PJ.IDPESSOA IN('+sIdPatro+')) AND ');

        DtmRelFolha.QryBenefSituacao.SQL.Add(
'      (HSB.IDHSTFOLHABENEF  = HRS.IDHSTFOLHABENEF)AND '+
'      (HRS.IDPESSOA         = P.IDPESSOA)         AND '+
'      (P.IDPESSOA           = PP.IDPESSOA)        AND '+
'      (H1.IDPESSOA          = PP.IDPESSOA)        AND '+
'      (B.IDBENEFICIO        = BPP.IDBENEFICIO)    AND '+
'      (BPP.IDBENEFICIO      = H1.IDBENEFICIO)     AND '+
'      (PLANPREV.IDPLANOPREV = H1.IDPLANOPREV)     AND '+
'      (H1.IDPATRO           = PJ.IDPESSOA)        AND '+
'      (B.IDBENEFICIO        = BFB.IDBENEFICIO)    AND '+
'      (PP.IDPESSOA          = BFB.IDPESSOA)       AND '+
'      (ELG.IDPESSJUR        = H1.IDPATRO)         AND '+
'      (ELG.IDPESSOA         = PP.IDPESSOA)        AND '+
'      (BFB.IDPESSOA         = HBF.IDPESSOA)       AND '+
'      (BFB.IDBENEFICIO      = HBF.IDBENEFICIO)    AND '+
'      (H1.IDRUBRICA NOT IN  BACA.IDRUBIRRF)       AND '+
'      H1.IDBENEFICIO NOT  IN '+
'/*--------------------------------------------------------*/ '+
'      (SELECT H2.IDBENEFICIO '+
'         FROM PREVIA H2 '+
'         WHERE (HBF.MES = '+sAnoMes+') AND '+
'               (HSB.IDHSTFOLHABENEF  = HRS.IDHSTFOLHABENEF)AND '+
'               (HRS.IDPESSOA         = P.IDPESSOA)         AND '+
'               (P.IDPESSOA           = PP.IDPESSOA)        AND '+
'               (H2.IDPESSOA          = PP.IDPESSOA)        AND '+
'               (B.IDBENEFICIO        = BPP.IDBENEFICIO)    AND '+
'               (BPP.IDBENEFICIO      = H2.IDBENEFICIO)     AND '+
'               (PLANPREV.IDPLANOPREV = H2.IDPLANOPREV)) '+
'/*--------------------------------------------------------*/ '+
'ORDER BY PJ.NOME, B.NOME, P.NOME');
        // Troca dos Labels de Data
        DtmRelFolha.lbDataReq.Caption := '';
        DtmRelFolha.lbDataIni.Caption := 'Cancelamento';
      End
     Else If rdgpSituacao.ItemIndex = 1 Then // Encerrados
      Begin
        DtmRelFolha.QryBenefSituacao.Close;
        DtmRelFolha.QryBenefSituacao.SQL.Clear;
        DtmRelFolha.QryBenefSituacao.SQL.Add(
'SELECT DISTINCT '+
'       PEJ.NOME             AS PATRO         , '+
'       B.NOME               AS BENEF         , '+
'       PES.NOME                              , '+
'       ''0''                AS VALORCALCULADO, '+
'       BFB.DATAENCERRAMENTO AS DATAREQ       , '+
'       PP.DATACANCELAMENTO  AS DATAINI       , '+
'       ''''                 AS PLANO         , '+
'       ''''                 AS IDBENEFICIO   , '+
'       BFB.VALORATUAL                          '+
'FROM PESSOA           PEJ, PARTPREVPLAN  PP , PLANPREVPATRO    PLA, EVENTOXSITPART EVS, '+
'     ELEGPATRO        ELG, PESSOA        PES, BENEFBFCIARIO    BFB, BENEFICIO      B  , '+
'     HSTBENEFBFCIARIO HSB, HSTFOLHABENEF HSF, TPPAGTOBENEFICIO TP                       '+
'WHERE (HSF.MESREFERENCIA   = '+sAnoMes+')          '+
'AND   (TP.FLGFREQUENCIA   <> ''U'')                '+
'AND   (PLA.IDPESSJUR       = PEJ.IDPESSOA)         '+
'AND   (PP.IDPESSJUR        = PLA.IDPESSJUR)        '+
'AND   (PP.IDPLANOPREV      = PLA.IDPLANOPREV)      '+
'AND   (PES.IDPESSOA        = PP.IDPESSOA)          '+
'AND   (BFB.IDPLANOPREV     = PP.IDPLANOPREV)       '+
'AND   (BFB.IDPESSOA        = PP.IDPESSOA)          '+
'AND   (BFB.IDPESSJUR       = PP.IDPESSJUR)         '+
'AND   (B.IDBENEFICIO       = BFB.IDBENEFICIO)      '+
'AND   (HSB.IDPESSJUR       = BFB.IDPESSJUR)        '+
'AND   (HSB.IDTITULAR       = BFB.IDTITULAR)        '+
'AND   (HSB.IDPLANOPREV     = BFB.IDPLANOPREV)      '+
'AND   (HSB.IDBENEFICIO     = BFB.IDBENEFICIO)      '+
'AND   (HSB.IDPESSOA        = BFB.IDPESSOA)         '+
'AND   (HSB.SEQPROPOSTA     = BFB.SEQPROPOSTA)      '+
'AND   (HSF.DATAEFETIVACAO  > PP.DATACANCELAMENTO)  '+
'AND   (ELG.IDPESSJUR       = HSB.IDPESSJUR)        '+
'AND   (ELG.IDPESSOA        = HSB.IDPESSOA)         '+
'AND   (EVS.IDSITPART       = PP.IDSITPART)         '+
'AND   (TP.IDTPPAGTOBENEFIC = BFB.IDTPPAGTOBENEFIC) '+
'AND    EVS.IDEVENTOGERADOR IN (SELECT IDEVENTOGERADOR FROM EVENTOGERADOR WHERE FLGENCERRABENEFI=1) '+
'ORDER BY PEJ.NOME, B.NOME, PES.NOME');
        // Troca dos Labels de Data
        DtmRelFolha.lbDataReq.Caption := 'Encerramento';
        DtmRelFolha.lbDataIni.Caption := 'Cancelamento';
      End;
     // Abre QryFundação
     DtmRelFolha.qryFundacao.Close;
     DtmRelFolha.qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
     DtmRelFolha.qryFundacao.Open;
   End
  Else ModalResult := mrNone;
end;

procedure TfrmParamRelBenefSituacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  // Fecha Querys
  QryPatrocinadora.Open;
  QryBeneficio.Open;
  // Destroi Objetos
  oStrBeneficio.Destroy;
  // Destroi Form
  Action := caFree;
end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

