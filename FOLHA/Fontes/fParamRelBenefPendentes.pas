{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit fParamRelBenefPendentes;

interface

uses
  Windows    , Messages, SysUtils, Classes , Graphics, Controls, Forms  , Dialogs,
  FOkCancelar, IvDictio, IvMulti , IvEMulti, MAHlpBtn, StdCtrls, Buttons, Spin   ,
  TB97Tlbr   , TB97    , ExtCtrls, Db      , DBTables, Wwquery , DBCtrls,
  checklst, usistema, dbasedados;

type
  TfrmParamRelBenefPendentes = class(TfrmOkCancelar)
    qryPatrocinadora : TwwQuery;
    GroupBox1        : TGroupBox;
    grpMesRef        : TGroupBox;
    cmbMes           : TComboBox;
    spedAno          : TSpinEdit;
    dsPatrocinadora  : TDataSource;
    chkbxReajuste    : TCheckBox;
    GroupBox2: TGroupBox;
    dsBeneficio: TDataSource;
    qryBeneficio: TwwQuery;
    chklstbxPatrocinadora: TCheckListBox;
    bbtnPatroTodas: TBitBtn;
    bbtnPatroInverte: TBitBtn;
    chklstbxBeneficio: TCheckListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnPatroTodasClick(Sender: TObject);
    procedure bbtnPatroInverteClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelBenefPendentes : TfrmParamRelBenefPendentes;
  oStrPatrocinadora         : TStringList;
  oStrBeneficio             : TStringList;  
implementation

uses dRelFolha,  UMensErro, uAdmPrevFB;

{$R *.DFM}

procedure TfrmParamRelBenefPendentes.FormCreate(Sender: TObject);
Var n : Integer;
begin
  inherited;
  // Abre Querys
  QryPatrocinadora.Open;
  QryBeneficio.Open;
  // Inicializa Variáveis
  dRelFolha.sAnoMes  := '';
  dRelFolha.iIdPlano := 0;
  oStrPatrocinadora  := TStringList.Create;
  oStrBeneficio      := TStringList.Create;  
  // Mês e Ano
  cmbMes.ItemIndex   := StrToInt(Copy(DateToStr(Date),4,2))-1;
  spedAno.Text       := Copy(DateToStr(Date),7,4);
  // Preenche CheckListBox Patrocinadora
  For n := 0 To (QryPatrocinadora.RecordCount-1) Do
   Begin
     // Inclui no CheckListBox
     chklstbxPatrocinadora.Items.Add(QryPatrocinadora.FieldByName('NOME').AsString);
     // Inclui no TStringList
     oStrPatrocinadora.Add(QryPatrocinadora.FieldByName('IDPESSOA').AsString);
     QryPatrocinadora.Next;
   End;
  // Preenche CheckListBox Benefício
  For n := 0 To (qryBeneficio.RecordCount-1) Do
   Begin
     // Inclui no CheckListBox
     chklstbxBeneficio.Items.Add(qryBeneficio.FieldByName('NOME').AsString);
     // Inclui no TStringList
     oStrBeneficio.Add(qryBeneficio.FieldByName('IDBENEFICIO').AsString);
     qryBeneficio.Next;
   End;
end;

procedure TfrmParamRelBenefPendentes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  // Fecha Querys
  QryPatrocinadora.Close;
  QryBeneficio.Close;
  oStrPatrocinadora.Destroy;
  Action := caFree;
end;

procedure TfrmParamRelBenefPendentes.bbtnConfirmarClick(Sender: TObject);
Var sPatro, sAnoMes, sAnoMes2, sBenef : String;
    bFaz                              : Boolean;
    n                                 : Integer;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // Inicializa variáveis
  bFaz     := True;
  sPatro   := '';
  sBenef   := '';
  sAnoMes  := '';
  sAnoMes2 := '';
  // Verifica se foi escolhida alguma Patrocinadora
  For n := 0 To (chklstbxPatrocinadora.Items.Count-1) Do
   Begin
     If chklstbxPatrocinadora.Checked[n] Then
      Begin
        If sPatro = '' Then sPatro := oStrPatrocinadora.Strings[n]
        Else sPatro := sPatro+','+oStrPatrocinadora.Strings[n];
      End;
   End;
  If sPatro = '' Then
   Begin
     bFaz := False;
     ShowMessage('É obrigatória a escolha de pelo menos uma Patrocinadora');
   End;
  // Verifica se foi escolhido algum Benefício
  For n := 0 To (chklstbxBeneficio.Items.Count-1) Do
   Begin
     If chklstbxBeneficio.Checked[n] Then
      Begin
        If sBenef = '' Then sBenef := oStrBeneficio.Strings[n]
        Else sBenef := sBenef+','+oStrBeneficio.Strings[n];
      End;
   End;
  // Verifica se Mes Início estão de acordo
  If (cmbMes.Text = '') And bFaz Then
   Begin
     MsgDlg('O Mês início é obrigatório !','Aviso', mtInformation,[mbOk,mbHelp],0);
     bFaz := False;
   End;
  // Verifica se Ano Início estão de acordo
  If (spedAno.Value < 1930) And bFaz Then
   Begin
     MsgDlg('O Ano início deve ser maior que 1930 !','Aviso', mtInformation,[mbOk,mbHelp],0);
     bFaz := False;
   End;
  // Passagem de Parâmetros.
  If bFaz Then
   Begin
      // Pega Parâmetros
     If cmbMes.ItemIndex < 9 Then
      Begin
        sAnoMes  := QuotedStr(IntToStr(spedAno.Value)+'/0'+IntToStr((cmbMes.ItemIndex+1)));
        sAnoMes2 := IntToStr(spedAno.Value)+'/0'+IntToStr(cmbMes.ItemIndex+1);
      End
     Else
      Begin
        sAnoMes  := QuotedStr(IntToStr(spedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1));
        sAnoMes2 := IntToStr(spedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1);
      End;
     // Monta Query
     DtmRelFolha.QryBenefPendentes.Close;
     DtmRelFolha.QryBenefPendentes.SQL.Clear;
     DtmRelFolha.QryBenefPendentes.SQL.Add(
'SELECT DISTINCT '+
'       PJ.NOME                AS PATRO     , BE.NOME                AS BENEF         , '+
'       PE.NOME                             , SUM(HB.VALORCALCULADO) AS VALORCALCULADO, '+
'       BF.DATAREQUERIMENTO    AS DATAREQ   , BF.DATAINICIO          AS DATAINI       , '+
'       BF.IDPLANOPREV         AS IDPLANO   , BE.IDBENEFICIO                          , '+
'       SUM(HB.VALORCALCULADO) AS VALORATUAL, BF.DATAINICIO     AS DATAINICIO           '+
'FROM PESSOA PE, BENEFICIO        BE, BENEFBFCIARIO BF, '+
'     PESSOA PJ, HSTBENEFBFCIARIO HB '+
'WHERE (BF.IDSITBENEFICIO = 4)              AND '+
'      (HB.IDPESSJUR      IN ('+sPatro+') ) AND '+
'      (HB.MES            = '+sAnoMes+')    AND ');
     // Se for escolhido algum Benefício
     If sBenef <> '' Then
        DtmRelFolha.QryBenefPendentes.SQL.Add('(BE.IDBENEFICIO IN( '+sBenef+')) AND ');

     DtmRelFolha.QryBenefPendentes.SQL.Add(
'      (HB.IDTITULAR      = PE.IDPESSOA)    AND '+
'      (HB.IDPESSJUR      = PJ.IDPESSOA)    AND '+
'      (HB.IDBENEFICIO    = BE.IDBENEFICIO) AND '+
'      (BE.IDBENEFICIO    = BF.IDBENEFICIO) '+
'GROUP BY PJ.NOME, BE.NOME, PE.NOME, BF.DATAREQUERIMENTO, BF.DATAINICIO, '+
'         BF.IDPLANOPREV  , BE.IDBENEFICIO '+
'ORDER BY PJ.NOME, BE.NOME, PE.NOME');
     // Abre QryFundação
     DtmRelFolha.qryFundacao.Close;
     DtmRelFolha.qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
     DtmRelFolha.qryFundacao.Open;
     // Passa Variáveis
     If chkbxReajuste.Checked Then dRelFolha.sAnoMes  := sAnoMes2;
   End
  Else
   Begin
     ModalResult := mrNone;
   End;
end;

procedure TfrmParamRelBenefPendentes.bbtnPatroTodasClick(Sender: TObject);
Var n : Integer;
begin
  inherited;
  // Seleciona Todas
  For n := 0 To (chklstbxPatrocinadora.Items.Count-1) Do
   Begin
     If Not chklstbxPatrocinadora.Checked[n] Then chklstbxPatrocinadora.Checked[n] := True;
   End;
end;

procedure TfrmParamRelBenefPendentes.bbtnPatroInverteClick(Sender: TObject);
Var n : Integer;
begin
  inherited;
  // Inverte Selecao
  For n := 0 To (chklstbxPatrocinadora.Items.Count-1) Do
   Begin
     chklstbxPatrocinadora.Checked[n] := Not chklstbxPatrocinadora.Checked[n];
   End;
end;

procedure TfrmParamRelBenefPendentes.BitBtn1Click(Sender: TObject);
Var n : Integer;
begin
  inherited;
  // Seleciona Todas
  For n := 0 To (chklstbxBeneficio.Items.Count-1) Do
   Begin
     If Not chklstbxBeneficio.Checked[n] Then chklstbxBeneficio.Checked[n] := True;
   End;
end;

procedure TfrmParamRelBenefPendentes.BitBtn2Click(Sender: TObject);
Var n : Integer;
begin
  inherited;
  // Inverte Selecao
  For n := 0 To (chklstbxBeneficio.Items.Count-1) Do
   Begin
     chklstbxBeneficio.Checked[n] := Not chklstbxBeneficio.Checked[n];
   End;
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

