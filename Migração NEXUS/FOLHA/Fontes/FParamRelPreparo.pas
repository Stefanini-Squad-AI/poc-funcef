{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FParamRelPreparo;

interface                    

uses
  Windows    , Messages, SysUtils, Classes , Graphics, Controls, Forms   ,
  FOkCancelar, IvDictio, IvMulti , IvEMulti, MAHlpBtn, StdCtrls, Buttons ,
  TB97Tlbr   , TB97    , ExtCtrls, wwdblook, Spin    , Db      , DBTables,
  Dialogs    , Wwquery, usistema, dbasedados;
type
  TfrmParamRelPreparo = class(TfrmOkCancelar)
    GroupBox1          : TGroupBox;
    dbcmbPatrocinadora : TwwDBLookupCombo;
    GroupBox2          : TGroupBox;
    dbcmbPlano         : TwwDBLookupCombo;
    grpMesRef          : TGroupBox;
    cmbMes             : TComboBox;
    spnedAno           : TSpinEdit;
    qryPatrocinadora   : TwwQuery;
    qryPlano           : TwwQuery;
    chkbxAbono         : TCheckBox;
    GroupBox3          : TGroupBox;
    cmbxOrdem          : TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelPreparo: TfrmParamRelPreparo;

implementation

uses dRelFolhaAtividade, uAdmPrevFB;

{$R *.DFM}

procedure TfrmParamRelPreparo.FormCreate(Sender: TObject);
begin
  inherited;
  // Abre Querys
  QryPatrocinadora.Open;
  QryPlano.Open;
end;

procedure TfrmParamRelPreparo.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  inherited;
  // Fecha Querys
  QryPatrocinadora.Close;
  QryPlano.Close;
  // Destrói Form
  Action := caFree;
end;

procedure TfrmParamRelPreparo.bbtnConfirmarClick(Sender: TObject);
Var bFaz        : Boolean;
    sMes, sMes1 : String;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // Inicializa Variáveis
  bFaz  := True;
  sMes  := '';
  sMes1 := '';
  // Verifica Preenchimentos
  // -----------------------
  // Mês
  If (cmbMes.Text = '') Then
   Begin
     bFaz := False;
     ShowMessage('É obrigatória a escolha de um Mês.');
     cmbMes.SetFocus;
   End;
   // Monta Query
   If bFaz Then
    Begin
      // Monta Mês Referência
      If (cmbMes.ItemIndex < 9) Then sMes := spnedAno.Text + '/0'+ IntToStr(cmbMes.ItemIndex+1)
      Else sMes := spnedAno.Text + '/'+ IntToStr(cmbMes.ItemIndex+1);
      // Abono
      If (chkbxAbono.Checked) Then sMes1 := spnedAno.Text + '/13'
      Else sMes1 := sMes;
      // Query Principal Benefício
      DtmRelFolhaAtividade.qryPreparo.Close;
      DtmRelFolhaAtividade.qryPreparo.SQL.Clear;
      DtmRelFolhaAtividade.qryPreparo.SQL.Add(
'     SELECT  DISTINCT                 '+
'       PT.NOME          AS PATRO    , '+
'       PT.IDPESSOA      AS IDPATRO  , '+
'       PL.NOME          AS PLANO    , '+
'       PL.IDPLANOPREV   AS IDPLANO  , '+
'       BE.NOME          AS BENEFICIO, '+
'       HB.IDTITULAR     , '+
'       HB.NUMEROPROCESSO, '+
'       HB.MES           , '+
'       HB.MESREFERENCIA , '+
'       HB.VALORPREV '+
'/*----------------------------------------*/ '+
' FROM HSTBENEFBFCIARIO HB, PLANPREV  PL, '+
'      PESSOA  PT, BENEFICIO BE '+
'/*----------------------------------------*/ '+
' WHERE (HB.IDPESSJUR     = PT.IDPESSOA) '+
' AND   (HB.IDPLANOPREV   = PL.IDPLANOPREV) '+
' AND   (HB.IDBENEFICIO   = BE.IDBENEFICIO) '+
' AND   (HB.SEQPROPOSTA   = 1) ');
      // Verifica se alguma Patrocinadora foi escolhida
      If (dbcmbPatrocinadora.Text <> '') Then DtmRelFolhaAtividade.qryPreparo.SQL.Add(' AND   (PT.IDPESSOA = '+dbcmbPatrocinadora.LookupValue+')');
      // Verifica se algum Plano foi escolhido
      If (dbcmbPlano.Text <> '') Then DtmRelFolhaAtividade.qryPreparo.SQL.Add('AND   (PL.IDPLANOPREV = '+dbcmbPlano.LookupValue+')');

      DtmRelFolhaAtividade.qryPreparo.SQL.Add(
' AND   (HB.MES           = '+QuotedStr(sMes)+') '+
' AND   (HB.MESREFERENCIA = '+QuotedStr(sMes1)+')');

      // Ordenação
      // ---------
      If (cmbxOrdem.ItemIndex < 1) Then
       Begin
         // por Nome
         DtmRelFolhaAtividade.qryPreparo.SQL.Add(' ORDER BY PT.NOME, PL.NOME, HB.IDTITULAR ');
       End
      Else If (cmbxOrdem.ItemIndex = 1) Then
       Begin
         // por Matrícula
         DtmRelFolhaAtividade.qryPreparo.SQL.Add(' ');
       End
      Else If (cmbxOrdem.ItemIndex = 2) Then
       Begin
         // por Inscrição
         DtmRelFolhaAtividade.qryPreparo.SQL.Add(' ');
       End;

      // Abre Query Fundação
      DtmRelFolhaAtividade.qryFundacao.Close;
      DtmRelFolhaAtividade.qryFundacao.ParamByName('pFundacao').AsInteger := uAdmPrevFB.iIdFundacao;
      DtmRelFolhaAtividade.qryFundacao.Open;
    End
   Else ModalResult := mrNone;
end;

end.
