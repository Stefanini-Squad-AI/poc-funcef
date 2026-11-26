{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FParamRelBenefPgto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, Db, DBTables, Wwquery, DBCtrls, checklst,
  wwdblook, usistema, dbasedados;

type
  TfrmBenefPgto = class(TfrmOkCancelar)
    qryPatrocinadora: TwwQuery;
    GroupBox2: TGroupBox;
    dbcmbPatrocinadora: TwwDBLookupCombo;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spedAno: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBenefPgto      : TfrmBenefPgto;
  
implementation

uses dRelFolha,  UMensErro, uAdmPrevFB;

{$R *.DFM}

procedure TfrmBenefPgto.FormCreate(Sender: TObject);
begin
  inherited;
  QryPatrocinadora.Open;
  // Mês e Ano
  cmbMes.ItemIndex  := StrToInt(Copy(FormatDateTime('dd/mm/yyyy', Date),4,2))-1;
  spedAno.Text      := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4);
end;

procedure TfrmBenefPgto.bbtnConfirmarClick(Sender: TObject);
Var sAnoMes, sSql, sPatro : String;
    bFaz                  : Boolean;
    n                     : Integer;
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
  sSql    := '';
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
    if dbcmbPatrocinadora.text <> '' then
      sPatro := QryPatrocinadora.FieldByName('IDPESSOA').AsString;
     // Pega Paraâmetros
    If cmbMes.ItemIndex < 9 Then
      sAnoMes := QuotedStr(IntToStr(spedAno.Value)+'/0'+IntToStr((cmbMes.ItemIndex+1)))
    Else
      sAnoMes := QuotedStr(IntToStr(spedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1));
    // Monta Query
    DtmRelFolha.qryBenefPgto.Close;
    DtmRelFolha.qryBenefPgto.SQL.Clear;
    DtmRelFolha.qryBenefPgto.SQL.Add(' SELECT G.PATRO, G.BENEF, G.QTD, G.VLRPGTO, G.MES '+
                                     ' FROM (SELECT PJ.NOME AS PATRO, '+
                                           ' BE.NOME AS BENEF, '+
                                           ' SUM(HB.VLBENEFPGTO) AS VLRPGTO, '+
                                           ' COUNT(HB.IDBENEFICIO) AS QTD, '+
                                           ' HB.MES ');

     // Atribui à Variável
     sSql := ' FROM HSTBENEFBFCIARIO HB, PESSOA PJ, BENEFICIO BE '+
             ' WHERE HB.MES = '+sAnoMes;

     // Verifica se Alguma Patrocinadora foi escolhida
     If sPatro <> '' Then
        SSql := sSql +' AND HB.IDPESSJUR = '+sPatro;

     sSql := sSql + ' AND HB.VLBENEFPGTO > 0 '+
                    ' AND PJ.IDPESSOA = HB.IDPESSJUR '+
                    ' AND BE.IDBENEFICIO = HB.IDBENEFICIO ';

     // Atribui a Query da Variável ao Objeto TQuery
     // --------------------------------------------

     // Query Principal
     DtmRelFolha.qryBenefPgto.SQL.Add(sSql+' GROUP BY PJ.NOME, BE.NOME, HB.MES ) G '+
                                           ' ORDER BY G.PATRO, G.BENEF');
     // Sub-Query
     DtmRelFolha.qrySubReport02.Close;
     DtmRelFolha.qrySubReport02.SQL.Clear;
     DtmRelFolha.qrySubReport02.SQL.Add(' SELECT G.BENEF, G.VLRPGTO '+
        ' FROM (SELECT SUM(HB.VLBENEFPGTO) AS VLRPGTO, BE.NOME AS BENEF '+sSql);
     DtmRelFolha.qrySubReport02.SQL.Add('GROUP BY BE.NOME) G ORDER BY G.BENEF');
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

procedure TfrmBenefPgto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryPatrocinadora.Close;
  Action := caFree;
end;

end.
