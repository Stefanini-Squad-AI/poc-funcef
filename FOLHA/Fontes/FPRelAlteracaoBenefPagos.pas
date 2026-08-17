unit FPRelAlteracaoBenefPagos;

interface

uses
  Windows    , Messages, SysUtils, Classes, Graphics, Controls, Forms   , Dialogs ,
  FOkCancelar, Db      , DBTables, Wwquery, StdCtrls, wwdblook, IvDictio, Spin    ,
  IvMulti    , IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97    , ExtCtrls, checklst,
  Wwdatsrc, usistema, dbasedados;

type
  TFrmPRelAlteracaoBenefPagos = class(TfrmOkCancelar)
    grpMesRef        : TGroupBox;
    cmbPatrocinadora : TwwDBLookupCombo;
    GroupBox1        : TGroupBox;
    cmbPlano         : TwwDBLookupCombo;
    GroupBox2        : TGroupBox;
    cmbBeneficio     : TwwDBLookupCombo;
    GroupBox3        : TGroupBox;
    cmbMesAtual: TComboBox;
    spnedAnoAtual: TSpinEdit;
    GroupBox4        : TGroupBox;
    cmbMesAnterior: TComboBox;
    spnedAnoAnterior: TSpinEdit;
    dsPatrocinadora  : TwwDataSource;
    QryPatrocinadora : TwwQuery;
    dsPlano          : TwwDataSource;
    qryPlano         : TwwQuery;
    dsBeneficio      : TwwDataSource;
    QryBeneficio     : TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GroupBox1Enter(Sender: TObject);
    procedure GroupBox2Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPRelAlteracaoBenefPagos: TFrmPRelAlteracaoBenefPagos;

implementation

uses dRelAlteracaoBenefPagos;

{$R *.DFM}

procedure TFrmPRelAlteracaoBenefPagos.FormCreate(Sender: TObject);
begin
  inherited;
  QryPatrocinadora.Open;
end;

procedure TFrmPRelAlteracaoBenefPagos.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  inherited;
  QryPatrocinadora.Close;
  QryPlano.Close;
  QryBeneficio.Close;
  Action := caFree;
end;

procedure TFrmPRelAlteracaoBenefPagos.GroupBox1Enter(Sender: TObject);
begin
  inherited;
  // Verifica se alguma Patrocinadora foi escolhida
  If (cmbPatrocinadora.Text <> '') Then
   Begin
     QryPlano.Close;
     QryPlano.SQL.Clear;
     QryPlano.SQL.Add('SELECT PL.IDPLANOPREV, PL.NOME FROM PLANPREV PL, PLANPREVPATRO PP '+
                      'WHERE PP.IDPLANOPREV = PL.IDPLANOPREV AND PP.IDPESSJUR = '+cmbPatrocinadora.LookupValue+' '+
                      'ORDER BY PL.NOME');
     QryPlano.Open;
   End
  Else
   Begin
     QryPlano.Close;
     QryPlano.SQL.Clear;
     QryPlano.SQL.Add('SELECT IDPLANOPREV, NOME FROM PLANPREV ORDER BY NOME');
     QryPlano.Open;
   End; 
end;

procedure TFrmPRelAlteracaoBenefPagos.GroupBox2Enter(Sender: TObject);
Var sSql : String;
begin
  inherited;
  // Incializa Variável
  sSql := 'SELECT BE.IDBENEFICIO, BE.NOME FROM BENEFICIO BE, BENEFPLANPATRO BP WHERE BE.IDBENEFICIO = BP.IDBENEFICIO ';
  // Verifica se alguma Patrocinadora foi escolhida
  If (cmbPatrocinadora.Text <> '') Then sSQL := SSql +'AND BP.IDPESSJUR = '+cmbPatrocinadora.LookupValue+' ';
  //Verifica se algum Plano foi escolhido
  If (cmbPlano.Text <> '') Then sSQL := SSql +'AND BP.IDPLANOPREV = '+cmbPlano.LookupValue+' ';

   sSql := sSql + 'ORDER BY BE.NOME';

   QryBeneficio.Close;
   QryBeneficio.SQL.Clear;
   QryBeneficio.SQL.Add(sSql);
   QryBeneficio.Open;
end;

procedure TFrmPRelAlteracaoBenefPagos.bbtnConfirmarClick(Sender: TObject);
Var sMesAnt, sMesAtu : String;
    bFaz             : Boolean;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // Inicaliza Variáveis
  bFaz := True;
  // Verifica se Mês Atual foi escolhido
  If (cmbMesAtual.Text <> '') Then
   Begin
     If (cmbMesAtual.ItemIndex < 9) Then sMesAtu := QuotedStr(IntToStr(spnedAnoAtual.Value)+'/0'+IntToStr(cmbMesAtual.ItemIndex+1))
     Else sMesAtu := QuotedStr(IntToStr(spnedAnoAtual.Value)+'/'+IntToStr(cmbMesAtual.ItemIndex+1));
     // Verifica se o Mês Anterior foi escolhido
     If (cmbMesAnterior.Text <> '') Then
      Begin
        If (cmbMesAnterior.ItemIndex < 9) Then sMesAnt := QuotedStr(IntToStr(spnedAnoAnterior.Value)+'/0'+IntToStr(cmbMesAnterior.ItemIndex+1))
        Else sMesAnt := QuotedStr(IntToStr(spnedAnoAnterior.Value)+'/'+IntToStr(cmbMesAnterior.ItemIndex+1));
      End
     Else // Do contrária pega o Mês Atual -1
      Begin
        // Verifica se o Mês atual é janeiro
        If (cmbMesAtual.ItemIndex > 0) Then
         Begin
           If (cmbMesAtual.ItemIndex < 9) Then sMesAnt := QuotedStr(IntToStr(spnedAnoAtual.Value)+'/0'+IntToStr(cmbMesAtual.ItemIndex))
           Else sMesAnt := QuotedStr(IntToStr(spnedAnoAtual.Value)+'/'+IntToStr(cmbMesAtual.ItemIndex));
         End
        Else
         Begin
           sMesAnt := QuotedStr(IntToStr(spnedAnoAtual.Value-1)+'/12');
         End;
      End;
   End
  Else
   Begin
     bFaz := False;
     ShowMessage('É obrigatória a escolha do Mês e Ano atual para a geração do relatório.');
   End;

  // Monta Query
  If bFaz Then
   Begin
    dtmRelAlteracaoBenefPagos.qryBenefAlter.Close;
    dtmRelAlteracaoBenefPagos.qryBenefAlter.SQL.Clear;
    dtmRelAlteracaoBenefPagos.qryBenefAlter.SQL.Add(
'SELECT PP.INSCRICAONUMERO        AS INSCRICAO    , '+
'       EL.MATRICULA              AS MATRICULA    , '+
'       SUBSTR(P1.NOME,1,30)      AS TITULAR      , '+
'       SUBSTR(P2.NOME,1,30)      AS BENEFICIARIO , '+
'       H1.VALORPREV              AS V_ANTERIOR   , '+
'       H2.VALORPREV              AS V_CORRENTE   , '+
'       H2.VALORPREV-H1.VALORPREV AS DIFERENÇA    , '+
'       PT.NOME                   AS PATROCINADORA, '+
'       PL.NOME                   AS PLANO        , '+
'       BE.NOME                   AS BENEFICIO '+
'/*----------------------------------------------------------*/ '+
'FROM HSTBENEFBFCIARIO H1, PARTPREVPLAN PP, PESSOA    P1, '+
'     HSTBENEFBFCIARIO H2, ELEGPATRO    EL, PESSOA    P2, '+
'     PESSOA           PT, PLANPREV     PL, BENEFICIO BE '+
'/*----------------------------------------------------------*/ '+
'WHERE H1.MES           = '+sMesAnt+' '+
'AND   H2.MES           = '+sMesAtu+' '+
'AND   H1.IDTITULAR     = H2.IDTITULAR '+
'AND   H1.IDPESSOA      = H2.IDPESSOA '+
'AND   H1.IDPESSJUR     = H2.IDPESSJUR '+
'AND   H1.IDPLANOPREV   = H2.IDPLANOPREV '+
'AND   H1.IDBENEFICIO   = H2.IDBENEFICIO '+
'AND   H1.VALORPREV    <> (H2.VALORPREV )'+
'AND   PP.IDPESSOA      = H1.IDTITULAR '+
'AND   PP.IDPESSJUR     = H1.IDPESSJUR '+
'AND   PP.IDPLANOPREV   = H1.IDPLANOPREV '+
'AND   PP.SEQPROPOSTA   = 1 '+
'AND   PP.FLGDESATIVADO = 0 '+
'AND   EL.IDPESSOA      = H1.IDTITULAR '+
'AND   EL.IDPESSJUR     = H1.IDPESSJUR '+
'AND   P1.IDPESSOA      = H1.IDTITULAR '+
'AND   P2.IDPESSOA      = H1.IDPESSOA '+
'AND   H1.IDPESSJUR     = PT.IDPESSOA '+
'AND   H1.IDPLANOPREV   = PL.IDPLANOPREV '+
'AND   H1.IDBENEFICIO   = BE.IDBENEFICIO ');

    // Se for escolhida uma Patrocinadora ...
    If (cmbPatrocinadora.Text <> '') Then dtmRelAlteracaoBenefPagos.qryBenefAlter.SQL.Add('AND   PT.IDPESSOA = '+cmbPatrocinadora.LookupValue+' ');
    // Se for escolhido um Plano ...
    If (cmbPlano.Text <> '') Then dtmRelAlteracaoBenefPagos.qryBenefAlter.SQL.Add('AND   PL.IDPLANOPREV = '+cmbPlano.LookupValue+' ');
    // Se for escolhido um Benefício ...
    If (cmbBeneficio.Text <> '') Then dtmRelAlteracaoBenefPagos.qryBenefAlter.SQL.Add('AND   BE.IDBENEFICIO = '+cmbBeneficio.LookupValue+' ');

    dtmRelAlteracaoBenefPagos.qryBenefAlter.SQL.Add(
'/*----------------------------------------------------------*/ '+
'ORDER BY PT.NOME, PL.NOME, '+
'         BE.NOME, P2.NOME');

   End
  Else ModalResult := mrNone;
end;
end.
