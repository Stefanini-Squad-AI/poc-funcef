{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FParamRelPensBanco;

interface

uses
  Windows    , Messages, SysUtils, Classes, Graphics, Controls, Forms   ,
  FOkCancelar, StdCtrls, checklst, Mask   , wwdbedit, Wwdbspin, IvDictio,
  IvMulti    , IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97    , ExtCtrls,
  DBTables   , Dialogs , Db      , Wwquery, wwdblook, usistema, dbasedados;

type
  TfrmParamRelPensBanco = class(TfrmOkCancelar)
    Banco            : TGroupBox;
    Patrocinadora    : TGroupBox;
    qryPatro         : TwwQuery;
    qryBanco         : TwwQuery;
    grpMesRef: TGroupBox;
    dblkfolha: TwwDBLookupCombo;
    qryHist: TwwQuery;
    qryHistHISTORICO: TStringField;
    qryHistIDHSTFOLHABENEF: TFloatField;
    dblkPatro: TwwDBLookupCombo;
    dblkBanco: TwwDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure fazqry;
  public
    { Public declarations }
  end;

var
  frmParamRelPensBanco : TfrmParamRelPensBanco;
  i                    : integer;
  SPatro,SBanco        : String;
  wDia,wMes,wAno       : Word;

implementation

Uses UMensErro, dRelFolha;

{$R *.DFM}

procedure TfrmParamRelPensBanco.FormShow(Sender: TObject);
begin
  inherited;
  // Abre Querys
  qrypatro.open;
  qryBanco.Open;
  qryHist.Open;
end;

procedure TfrmParamRelPensBanco.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // Criticar Dados
  if dblkfolha.Text = '' then
  begin
    MsgDlg('Escolha um Histórico da Folha de Benefício! ','Erro',mtError,[mbOk,mbHelp],0);
    dblkfolha.SetFocus;
    ModalResult := mrNone;
    Exit;
  end
  else Fazqry;
end;


procedure TfrmParamRelPensBanco.FazQry;
var
  sSql: String;
begin
  dtmRelFolha.qryRelPensBanco.Close;
  dtmRelFolha.qryRelPensBanco.sql.clear;

  sSql :=
' SELECT SUM(DECODE(PV.FLGDESCONTO, 0, HRS.VALORPROVENTO, 1, (-1)*HRS.VALORPROVENTO)) AS VALOR, '+
      ' PPP.INSCRICAONUMERO, EL.MATRICULA, HRS.MESCOBRANCA AS MES, '+
      ' DECODE(HRS.CODDOCUMENTO,NULL,''DOC. NÃO CADASTRADO'',HRS.CODDOCUMENTO) AS DOCUMENTO, '+
      ' HRS.NUMBANCO, PB.NOME AS BANCO, HRS.NUMAGENCIA, PA.NOME AS AGENCIA, '+
      ' PEN.NOME AS PENSIONISTA, '+
      ' PEN.NUMDOCUMENTO  AS CPF, PJ.NOME AS PATROCINADORA, HRS.CONTACORRENTE, '+
      ' PTF.DESCRICAO '+
' FROM HISTRUBSAL HRS, PROVDESC PV, '+
    ' ELEGPATRO EL, PARTPREVPLAN PPP, PORTADORFORMA PTF, '+
    ' BANCO BC, AGENCIABANCARIA AG, PESSOA PA, PESSOA PB, '+
    ' PESSOA PJ, PESSOA PEN, '+
    ' (SELECT DISTINCT IDTITULAR, IDFAVORECIDO '+
      'FROM RUBRICAINDIV '+
      'WHERE (FLGPENSAOALIM = 1) '+
      'AND (FLGTPRUBMANUT = ''1'')) R '+
' WHERE (HRS.IDHSTFOLHABENEF = '+qryHist.FieldByname('IDHSTFOLHABENEF').AsString+')';

  if dblkPatro.text <> '' then
    sSql := sSql + ' AND (HRS.IDPATRO = '+qryPatro.FieldByName('IDPESSOA').AsString+')';
  if dblkBanco.text <> '' then
    sSql := sSql + ' AND (BC.IDPESSOA = '+qryBanco.FieldByName('IDPESSOA').AsString+')';

  sSql := sSql +
' AND (R.IDTITULAR = HRS.IDTITULAR) '+
' AND (R.IDFAVORECIDO = HRS.IDRESPONSAVEL) '+
' AND (EL.IDPESSJUR = HRS.IDPATRO) '+
' AND (EL.IDPESSOA = HRS.IDTITULAR) '+
' AND (PPP.IDPESSJUR = HRS.IDPATRO) '+
' AND (PPP.IDPESSOA = HRS.IDTITULAR) '+
' AND (PPP.IDPLANOPREV = HRS.IDPLANOPREV) '+
' AND (HRS.IDRUBRICA = PV.IDPROVENTO) '+
' AND (PV.FLGDESCONTO IN (0,1)) '+
' AND (HRS.CODPORTFORMA = PTF.CODPORTFORMA(+)) '+
' AND (RTRIM(HRS.NUMBANCO) = BC.NUMBANCO(+)) '+
' AND (HRS.NUMAGENCIA = AG.NUMAGENCIA(+)) '+
' AND (PA.IDPESSOA = AG.IDPESSOA OR AG.IDPESSOA IS NULL) '+
' AND (AG.IDBANCO = PB.IDPESSOA OR AG.IDBANCO IS NULL) '+
' AND (PB.IDPESSOA(+) = BC.IDPESSOA) '+
' AND (PEN.IDPESSOA = HRS.IDRESPONSAVEL) '+
' AND (PJ.IDPESSOA = HRS.IDPATRO) '+
' GROUP BY HRS.CODDOCUMENTO, HRS.MESCOBRANCA, '+
        ' PEN.NOME, PEN.NUMDOCUMENTO, PJ.NOME, HRS.NUMBANCO, PB.NOME, HRS.NUMAGENCIA, '+
        ' PA.NOME, HRS.CONTACORRENTE, PTF.DESCRICAO, PPP.INSCRICAONUMERO, EL.MATRICULA '+
' ORDER BY HRS.CODDOCUMENTO, HRS.NUMBANCO, HRS.NUMAGENCIA, PEN.NOME ';

  dtmRelFolha.qryRelPensBanco.sql.add(sSql);
end;

procedure TfrmParamRelPensBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  // Fecha Querys
  qrypatro.Close;
  qryBanco.Close;
  qryHist.Close;
  // Destroi Form
  Action := caFree;
end;

end.
{==============================================================================|
| UNIT: FParamRelPensBanco                                                     |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   Form para parametros do relatório de Crédito de Pensão Alimentícia por     |
| banco e agência.                                                             |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/09/2002 A 11/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NA CONSULTA PARA NÃO DUPLICAR INFORMAÇÃO E MOSTRAR O VALOR       |
| LIQUIDO RECEBIDO.                                                            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 12/09/2002 A 12/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Foi colocado no rpRelPensBanco os campos: Matricula, Portador Forma.     |
|                                                                              |
|------------------------------------------------------------------------------}

