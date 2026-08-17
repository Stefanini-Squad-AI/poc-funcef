unit FParamRelSuplMaiorMenor;

interface

uses
  Windows    , Messages, SysUtils, Classes , Graphics, Controls, Forms   , Dialogs ,
  FOkCancelar, IvDictio, IvMulti , IvEMulti, MAHlpBtn, StdCtrls, Buttons , Wwdatsrc,
  TB97Tlbr   , TB97    , ExtCtrls, DBCtrls , Spin    , Db      , DBTables, Wwquery,
  checklst, wwdblook, usistema, dbasedados;

type
  TfrmParamRelSuplMaiorMenor = class(TfrmOkCancelar)
    grpMesRef       : TGroupBox;
    cmbMes          : TComboBox;
    spedAno         : TSpinEdit;
    GroupBox2       : TGroupBox;
    qryPatrocinadora: TwwQuery;
    dsFolha         : TwwDataSource;
    qryFolha        : TwwQuery;
    GroupBox3       : TGroupBox;
    cmbxOrdem       : TComboBox;
    GroupBox1: TGroupBox;
    dbcmbPatrocinadora: TwwDBLookupCombo;
    cmbxFolha: TwwDBLookupCombo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelSuplMaiorMenor : TfrmParamRelSuplMaiorMenor;

implementation

uses dRelFolha, UMensErro, uAdmPrevFB;

{$R *.DFM}

procedure TfrmParamRelSuplMaiorMenor.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatrocinadora.Open;
  qryFolha.Open;
  cmbMes.ItemIndex  := StrToInt(Copy(DateToStr(Date),4,2))-1;
  spedAno.Text      := Copy(DateToStr(Date),7,4);
end;

procedure TfrmParamRelSuplMaiorMenor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatrocinadora.Close;
  qryFolha.Close;
  Action := caFree;
end;

procedure TfrmParamRelSuplMaiorMenor.bbtnConfirmarClick(Sender: TObject);
Var sAnoMes, sFolha, sPatro : String;
    bFaz                    : Boolean;
    n                       : Integer;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // Inicializa variáveis
  bFaz    := True;
  sAnoMes := '';
  sFolha  := '';
  sPatro  := '';
  // Verifica se Patrocinadora foi escolhida
  // Verifica se Tipo Folha de Benefício foi escolhida
  If (cmbxFolha.Text = '') And (bFaz) Then
    begin
          If MsgDlg('O tipo de Folha não foi especificado, todas deste período serão processadas. Confirma ?','Aviso', mtInformation,[mbOk,mbCancel],0) <> mrOk Then bFaz := False;
          sFolha := '';
    end      
  Else
    sFolha := qryFolha.FieldByName('IDHSTFOLHABENEF').AsString;

  // Verifica se Mes Início estão de acordo
  If (cmbMes.Text = '') And bFaz Then
  Begin
    MsgDlg('O Mês é obrigatório !','Aviso', mtInformation,[mbOk,mbHelp],0);
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
    sPatro  := QryPatrocinadora.FieldByName('IDPESSOA').AsString;
    // Pega Paraâmetros
    If cmbMes.ItemIndex < 9 Then
      sAnoMes := QuotedStr(IntToStr(spedAno.Value)+'/0'+IntToStr((cmbMes.ItemIndex+1)))
    Else
      sAnoMes := QuotedStr(IntToStr(spedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1));
    // Monta Query
    DtmRelFolha.qrySupMaiorMenor.Close;
    DtmRelFolha.qrySupMaiorMenor.SQL.Clear;
    DtmRelFolha.qrySupMaiorMenor.SQL.Add(
'SELECT DISTINCT '+#13+
'       PJ.NOME   AS PATRO, PF.NOME AS PFISICA, BE.NOME AS BENEF, '+#13+
'       PP.INSCRICAONUMERO, SUM(HS.VALORPROVENTO) AS VLRPGTO , HB.MES'+#13+
'FROM PESSOA PJ, SITBENEFICIO  SB, BENEFICIO        BE, HISTRUBSAL   HS, '+#13+
'     PESSOA PF, BENEFBFCIARIO BF, HSTBENEFBFCIARIO HB, PARTPREVPLAN PP '+#13+
'WHERE '+#13+
'      (HB.MES            = '+sAnoMes+')       AND '+#13+
'      (HB.IDPESSJUR      = '+sPatro+' )      AND '+#13+
'      (HB.MES            = HS.MES)            AND '+#13+
'      (HS.VALORPROVENTO  > 0)                 AND '+#13+
'      (HB.IDPESSJUR      = PJ.IDPESSOA)       AND '+#13+
'      (HB.IDPESSJUR      = HS.IDPESSJUR)      AND '+#13+
'      (HB.IDTITULAR      = HS.IDPESSOA)       AND '+#13+
'      (HB.IDTITULAR      = PF.IDPESSOA)       AND '+#13+
'      (HB.IDTITULAR      = BF.IDTITULAR)      AND '+#13+
'      (HB.IDTITULAR      = PP.IDPESSOA)       AND '+#13+
'      (HB.IDBENEFICIO    = BE.IDBENEFICIO)    AND '+#13+
'      (BF.IDSITBENEFICIO = SB.IDSITBENEFICIO) '+#13);

     // Verifica se Foi escolhida alguma Folha específica
     If sFolha <> '' Then DtmRelFolha.qrySupMaiorMenor.SQL.Add('AND (HS.IDHSTFOLHABENEF ='+sFolha+') '+#13);

     DtmRelFolha.qrySupMaiorMenor.SQL.Add(
'GROUP BY PJ.NOME, PF.NOME, BE.NOME, PP.INSCRICAONUMERO, HB.MES '+#13);
     // Verifica qual é a ordem escolhida pelo usuário
     If cmbxOrdem.ItemIndex < 1      Then
      Begin
        DtmRelFolha.qrySupMaiorMenor.SQL.Add(' ORDER BY PJ.NOME, BE.NOME, VLRPGTO ASC');
        DtmRelFolha.lbOrdem01.Caption := 'VALOR CRESCENTE';
      End
     Else If cmbxOrdem.ItemIndex = 1 Then
      Begin
        DtmRelFolha.qrySupMaiorMenor.SQL.Add(' ORDER BY PJ.NOME, BE.NOME, VLRPGTO DESC');
        DtmRelFolha.lbOrdem01.Caption := 'VALOR DECRESCENTE';
      End
     Else If cmbxOrdem.ItemIndex = 2 Then
      Begin
        DtmRelFolha.qrySupMaiorMenor.SQL.Add(' ORDER BY PJ.NOME, BE.NOME ASC');
        DtmRelFolha.lbOrdem01.Caption := 'BENEFICIÁRIO CRESCENTE';
      End
     Else If cmbxOrdem.ItemIndex = 3 Then
      Begin
        DtmRelFolha.qrySupMaiorMenor.SQL.Add(' ORDER BY PJ.NOME, BE.NOME DESC');
        DtmRelFolha.lbOrdem01.Caption := 'BENEFICIÁRIO DECRESCENTE';
      End
     Else If cmbxOrdem.ItemIndex = 4 Then
      Begin
        DtmRelFolha.qrySupMaiorMenor.SQL.Add(' ORDER BY PJ.NOME, PP.INSCRICAONUMERO ASC');
        DtmRelFolha.lbOrdem01.Caption := 'INSCRIÇÃO CRESCENTE';
      End
     Else If cmbxOrdem.ItemIndex = 5 Then
      Begin
        DtmRelFolha.qrySupMaiorMenor.SQL.Add(' ORDER BY PJ.NOME, PP.INSCRICAONUMERO DESC');
        DtmRelFolha.lbOrdem01.Caption := 'INSCRIÇÃO DECRESCENTE';
      End;
     // Abre QryFundação
     DtmRelFolha.qryFundacao.Close;
     DtmRelFolha.qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
     DtmRelFolha.qryFundacao.Open;
   End
  Else
   Begin
     ModalResult := mrNone;
   End;
end;

end.

