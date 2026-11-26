unit FParamRelPensAlim;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FReports_Folha, StdCtrls, Db, Wwdatsrc, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, wwdblook, Spin,
  ExtCtrls;

type
  TFrmParamRelPensAlim = class(TFrmReports_Folha)
    grbPatrocinadora: TGroupBox;
    cmbPatrocinadora: TwwDBLookupCombo;
    qryPatrocinadora: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sPatro : String;
    procedure FazQryEfetivada;
    procedure FazQryPrevia;
  public
    { Public declarations }
  end;

var
  FrmParamRelPensAlim: TFrmParamRelPensAlim;

implementation

Uses dRelFolha, dBaseDados, uSistema, uMensErro;

{$R *.DFM}

procedure TFrmParamRelPensAlim.FormShow(Sender: TObject);
begin
  inherited;
  qryPatrocinadora.Open;
end;

procedure TFrmParamRelPensAlim.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  sPatro := '';
  sPatro := cmbPatrocinadora.Text ;

  // Criticar Dados
  If dblkLoteouVersao.Text = '' Then
  Begin
    If RdoTipoFolha.ItemIndex = 0 Then
      MsgDlg('Por Favor, escolha um Lote!', 'Informação', mtInformation, [mbOk], 0)
    Else
      MsgDlg('Por Favor, escolha uma Versão!', 'Informação', mtInformation, [mbOk], 0);
    dblkLoteouVersao.SetFocus;
    ModalResult := mrNone;
    Exit;
  End
  Else
  Begin
    If RdoTipoFolha.ItemIndex = 0 Then
      FazQryPrevia
    Else
      FazQryEfetivada;
    dtmRelFolha.lblFolha.Caption := dblkLoteouVersao.Text;
    dtmRelFolha.lblPatro.Caption := cmbPatrocinadora.Text;
  End;

end;

procedure TFrmParamRelPensAlim.FazQryEfetivada;
begin
  // Monta Query
  dtmRelFolha.qryRelPensAlim.Close;
  dtmRelFolha.qryRelPensAlim.Sql.Clear;
  dtmRelFolha.qryRelPensAlim.Sql.Add(
  ' SELECT '+
    ' SUM(DECODE(PV.FLGDESCONTO, 0, HRS.VALORPROVENTO, 1, (-1)*HRS.VALORPROVENTO)) AS VALOR, '+
    ' PPP.INSCRICAONUMERO, '+
    ' EL.MATRICULA, '+
    ' PEN.NOME AS PENSIONISTA, '+
    ' PEN.NUMDOCUMENTO AS CPF, '+
    ' PJ.NOME AS PATROCINADORA, '+
    ' HRS.NUMBANCO, '+
    ' PB.NOME AS BANCO, '+
    ' HRS.NUMAGENCIA, '+
    ' PA.NOME AS AGENCIA, '+
    ' HRS.CONTACORRENTE, '+
    ' PTF.DESCRICAO '+
  ' FROM '+
    ' HISTRUBSAL HRS, '+
    ' PROVDESC PV, '+
    ' ELEGPATRO EL, '+
    ' PARTPREVPLAN PPP, '+
    ' PORTADORFORMA PTF, '+
    ' AGENCIABANCARIA AG, '+
    ' BANCO BC, '+
    ' PESSOA PA, '+
    ' PESSOA PB, '+
    ' PESSOA PJ, '+
    ' PESSOA PEN, '+
    ' (SELECT DISTINCT IDTITULAR, IDFAVORECIDO '+
    '  FROM RUBRICAINDIV '+
    '  WHERE (FLGPENSAOALIM = 1) AND (FLGTPRUBMANUT = ''1'')) R '+
  ' WHERE ');

  If cmbPatrocinadora.Text <> '' Then
    dtmRelFolha.qryRelPensAlim.Sql.Add('(HRS.IDPATRO = '+qryPatrocinadora.FieldByName('idpessoa').AsString+') AND ');

  dtmRelFolha.qryRelPensAlim.Sql.Add(
  ' (HRS.IDHSTFOLHABENEF = '+qryPreviaouEfetivada.FieldByName('IDHSTFOLHABENEF').AsString+')'+
  'AND (R.IDTITULAR = HRS.IDTITULAR) '+
  'AND (R.IDFAVORECIDO = HRS.IDRESPONSAVEL) '+
  'AND (EL.IDPESSJUR = HRS.IDPATRO) '+
  'AND (EL.IDPESSOA = HRS.IDTITULAR) '+
  'AND (PPP.IDPESSJUR = HRS.IDPATRO) '+
  'AND (PPP.IDPESSOA = HRS.IDTITULAR) '+
  'AND (PPP.IDPLANOPREV = HRS.IDPLANOPREV) '+
  'AND (HRS.IDRUBRICA = PV.IDPROVENTO) '+
  'AND (PV.FLGDESCONTO IN (0,1)) '+
  'AND (HRS.CODPORTFORMA = PTF.CODPORTFORMA(+)) '+
  'AND (RTRIM(HRS.NUMBANCO) = BC.NUMBANCO(+)) '+
  'AND (HRS.NUMAGENCIA = AG.NUMAGENCIA(+)) '+
  'AND (PA.IDPESSOA = AG.IDPESSOA OR AG.IDPESSOA IS NULL) '+
  'AND (AG.IDBANCO = PB.IDPESSOA OR AG.IDBANCO IS NULL) '+
  'AND (PB.IDPESSOA(+) = BC.IDPESSOA) '+
  'AND (PEN.IDPESSOA = HRS.IDRESPONSAVEL) '+
  'AND (PJ.IDPESSOA = HRS.IDPATRO) '+
  ' GROUP BY '+
    ' PPP.INSCRICAONUMERO, '+
    ' EL.MATRICULA, '+
    ' PEN.NOME, '+
    ' PEN.NUMDOCUMENTO, '+
    ' PJ.NOME, '+
    ' HRS.NUMBANCO, '+
    ' PB.NOME, '+
    ' HRS.NUMAGENCIA, '+
    ' PA.NOME, '+
    ' HRS.CONTACORRENTE, '+
    ' PTF.DESCRICAO '+
  ' ORDER BY '+
    ' PJ.NOME, '+
    ' PEN.NOME ');
end;

procedure TFrmParamRelPensAlim.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qrypatroCINADORA.Close;
  Action := caFree;
end;

procedure TFrmParamRelPensAlim.FazQryPrevia;
begin
  dtmRelFolha.qryRelPensAlim.Close;
  dtmRelFolha.qryRelPensAlim.Sql.Clear;
  dtmRelFolha.qryRelPensAlim.Sql.Add(
  ' SELECT '+
    ' SUM(DECODE(PV.FLGDESCONTO, 0, PRV.VALORPROVENTO, 1, (-1)*PRV.VALORPROVENTO)) AS VALOR, '+
    ' PRV.IDRESPONSAVEL, '+
    ' PPP.INSCRICAONUMERO, '+
    ' EL.MATRICULA, '+
    ' PEN.NOME AS PENSIONISTA, '+
    ' PEN.NUMDOCUMENTO AS CPF, '+
    ' PJ.NOME AS PATROCINADORA, '+
    ' CB.CONTACORRENTE, '+
    ' AG.NUMAGENCIA, '+
    ' PA.NOME AS AGENCIA, '+
    ' BC.NUMBANCO, '+
    ' PB.NOME AS BANCO, '+
    ' PTF.DESCRICAO '+
  ' FROM '+
    ' PREVIA PRV, '+
    ' PROVDESC PV, '+
    ' ELEGPATRO EL, '+
    ' PARTPREVPLAN PPP, '+
    ' PESSOA PJ, '+
    ' PESSOA PB, '+
    ' PESSOA PA, '+
    ' PESSOA PEN, '+
    ' CONTABANCARIA CB, '+
    ' AGENCIABANCARIA AG, '+
    ' PORTADORFORMA PTF, '+
    ' BANCO BC, '+
    ' (SELECT DISTINCT IDTITULAR, IDFAVORECIDO '+
    '  FROM RUBRICAINDIV '+
    '  WHERE (FLGPENSAOALIM = 1) AND (FLGTPRUBMANUT = ''1'')) R '+
  ' WHERE ');

  If cmbPatrocinadora.Text <> '' Then
    dtmRelFolha.qryRelPensAlim.Sql.Add('(PRV.IDPATRO = '+qryPatrocinadora.FieldByName('IDPESSOA').AsString+') AND ');

  dtmRelFolha.qryRelPensAlim.Sql.Add(
  ' (PRV.IDLOTE = '+qryPreviaouEfetivada.FieldByName('IDLOTE').AsString+')'+
  ' AND (R.IDTITULAR = PRV.IDTITULAR) '+
  ' AND (R.IDFAVORECIDO = PRV.IDRESPONSAVEL) '+
  ' AND (EL.IDPESSJUR = PRV.IDPATRO) '+
  ' AND (EL.IDPESSOA = PRV.IDTITULAR) '+
  ' AND (PPP.IDPESSJUR = PRV.IDPATRO) '+
  ' AND (PPP.IDPESSOA = PRV.IDTITULAR) '+
  ' AND (PPP.IDPLANOPREV = PRV.IDPLANOPREV) '+
  ' AND (PRV.IDRUBRICA = PV.IDPROVENTO)  '+
  ' AND (PV.FLGDESCONTO IN (0,1)) '+
  ' AND (PEN.IDPESSOA = PRV.IDRESPONSAVEL) '+
  ' AND (PJ.IDPESSOA = PRV.IDPATRO) '+
  ' AND (PRV.CODPORTFORMA = PTF.CODPORTFORMA(+)) '+
  ' AND (CB.IDPESSOA(+) = PRV.IDRESPONSAVEL) '+
  ' AND (CB.FLGCONTAPREF(+) = 1) '+
  ' AND (AG.IDPESSOA(+) = CB.IDAGENCIA) ' +
  ' AND (PA.IDPESSOA(+) = AG.IDPESSOA) '+
  ' AND (AG.IDBANCO = BC.IDPESSOA(+)) '+
  ' AND (PB.IDPESSOA(+) = BC.IDPESSOA) '+
  ' GROUP BY '+
    ' PPP.INSCRICAONUMERO, '+
    ' EL.MATRICULA, '+
    ' PEN.NOME, '+
    ' PEN.NUMDOCUMENTO, '+
    ' PJ.NOME, '+
    ' CB.CONTACORRENTE, '+
    ' PRV.IDRESPONSAVEL, '+
    ' AG.NUMAGENCIA, '+
    ' PA.NOME, '+
    ' BC.NUMBANCO, '+
    ' PB.NOME, '+
    ' PTF.DESCRICAO '+
  ' ORDER BY '+
    ' PJ.NOME, '+
    ' PEN.NOME ');
end;

end.
