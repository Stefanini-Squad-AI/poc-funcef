// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Pendência   : SIG TIBERO
//Responsável : Everson Luiz Pereira da Cunha
//Data        : 22/02/2018
//Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//------------------------------------------------------------------------------

unit FPRelCartasBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, StdCtrls, CheckLst, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, FPreview,
  wwdblook, usistema, dbasedados;

type
  TfrmPRelCartasBanco = class(TfrmOkCancelar)
    pnlVersoes: TPanel;
    ChkLstVersao: TCheckListBox;
    lblVersoes: TLabel;
    pnlNumCarta: TPanel;
    lblNumCarta: TLabel;
    edtNumCarta: TEdit;
    qryHistorico: TwwQuery;
    qryPortador: TwwQuery;
    grpBanco: TGroupBox;
    dblkPortadorPadrao: TwwDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure ChkLstVersaoExit(Sender: TObject);
    procedure ChkLstVersaoClickCheck(Sender: TObject);
  private
    { Private declarations }
    procedure MontaQuery;

  public
    { Public declarations }
    ListaVersao : TStringList;
    sVersaoSel, sMes : String;
    wDia, wMes, wAno : Word;
    bEscolheuVersao : boolean;

  end;

var
  frmPRelCartasBanco: TfrmPRelCartasBanco;

implementation

Uses uFuncoesFolha, dRelCartasBanco;

{$R *.DFM}

procedure TfrmPRelCartasBanco.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);

  Case wMes of
    1: sMes := 'Janeiro';
    2: sMes := 'Fevereiro';
    3: sMes := 'Março';
    4: sMes := 'Abril';
    5: sMes := 'Maio';
    6: sMes := 'Junho';
    7: sMes := 'Julho';
    8: sMes := 'Agosto';
    9: sMes := 'Setembro';
    10: sMes := 'Outubro';
    11: sMes := 'Novembro';
    12: sMes := 'Dezembro';
  End;

  ListaVersao := TStringList.Create;
  qryHistorico.Open;
  ChkLstVersao.Clear;
  While Not qryHistorico.Eof Do
  Begin
    ChkLstVersao.Items.Add(qryHistorico.FieldByName('HISTORICO').AsString);
    ChkLstVersao.ItemIndex := 0;
    ListaVersao.Add(qryHistorico.FieldByName('IDHSTFOLHABENEF').AsString);
    qryHistorico.Next;
  End;
end;

procedure TfrmPRelCartasBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryHistorico.Active := False;
  ListaVersao.Free;
end;

procedure TfrmPRelCartasBanco.bbtnConfirmarClick(Sender: TObject);
Var
  I : Integer;

begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  bEscolheuVersao := False;

  For I := 0 To ChkLstVersao.Items.Count - 1 Do
  Begin
    If ChkLstVersao.Checked[I] = True Then
      bEscolheuVersao := True;
  End;

  If bEscolheuVersao = True Then
  Begin
    If Trim(edtNumCarta.Text) = '' Then
    Begin
      ShowMessage('Favor informar o número da carta.');
      edtNumCarta.SetFocus;
      ModalResult := mrNone;
      Exit;
    End
    Else
      MontaQuery;
  End
  Else
  Begin
    ShowMessage('Por Favor, escolha as Versões. ');
    ChkLstVersao.SetFocus;
    ModalResult := mrNone;
    Exit;
  End;

 try
    dtmRelCartasBanco.ppLabelPotadorForma.Caption := qryPortador.fieldByName('DESCRICAO').asString;
  except showMessage('erro');end;

end;

procedure TfrmPRelCartasBanco.MontaQuery;
Var
  sSql : String;

begin
  MontaFiltro(ChkLstVersao, ListaVersao, sVersaoSel);
  ssql:= '    SELECT                                           '+#13#10+
         '      BC.NOME AS BANCO,                              '+#13#10+
         '      AG.NOME AS AGENCIA,                            '+#13#10+
         '      H.NUMBANCO,                                    '+#13#10+
         '      H.CODPORTFORMA,                                '+#13#10+
         '      PF.DESCRICAO,                                  '+#13#10+
         '      H.IDHSTFOLHABENEF,                             '+#13#10+
         '      H.DATAPAGAMENTO,                               '+#13#10+
         '      COUNT(DISTINCT(PP.INSCRICAONUMERO)) AS QTD,    '+#13#10+

         //Everson TIBERO - Início
{         '      SUM(DECODE(FLGDESCONTO,  0,  VALORPROVENTO, VALORPROVENTO * -1)) AS VALORTOTAL, '+#13#10+
         '      SUM(DECODE(FLGDESCONTO,0,VALORPROVENTO,0.0)) - SUM(DECODE(FLGDESCONTO,1,VALORPROVENTO,0.0)) AS VALORLIQUIDO '+#13#10+}

         '      SUM(DECODE(H.FLGDESCONTO,  0,  H.VALORPROVENTO, H.VALORPROVENTO * -1)) AS VALORTOTAL, '+#13#10+
         '      SUM(DECODE(H.FLGDESCONTO,0,H.VALORPROVENTO,0.0)) - SUM(DECODE(H.FLGDESCONTO,1,H.VALORPROVENTO,0.0)) AS VALORLIQUIDO '+#13#10+
         //Everson TIBERO - Fim

         '    FROM                                             '+#13#10+
         '     HISTRUBSAL H,                                   '+#13#10+
         '     PESSOA P,                                       '+#13#10+
         '     PARTPREVPLAN PP,                                '+#13#10+
         '     DEPENTIT DP,                                    '+#13#10+
         '     PROVDESC PD,                                    '+#13#10+
         '     PORTADORFORMA PF,                               '+#13#10+
         '     PORTADORCONTA PC,                               '+#13#10+
         '     PESSOA BC,                                      '+#13#10+
         '     PESSOA AG                                       '+#13#10+

         '     WHERE P.IDPESSOA = H.IDPESSOA                   '+#13#10+
         '     AND H.IDTITULAR = PP.IDPESSOA                   '+#13#10+
         '     AND H.IDPLANOPREV = PP.IDPLANOPREV              '+#13#10+
         '     AND H.IDPATRO = PP.IDPESSJUR                    '+#13#10+
         '     AND H.IDPESSOA = DP.IDPESSOA(+)                 '+#13#10+
         '     AND H.IDTITULAR = DP.IDTITULAR(+)               '+#13#10+
         '     AND H.IDRUBRICA = PD.IDPROVENTO                 '+#13#10+
         '     AND (H.FLGESTORNO = 0 OR H.FLGESTORNO IS NULL)  '+#13#10+
//         '     AND IDHSTFOLHABENEF IN ('+sVersaoSel+')         '+#13#10+ //Everson TIBERO
         '     AND H.IDHSTFOLHABENEF IN ('+sVersaoSel+')         '+#13#10+ //Everson TIBERO
         '     AND H.CODPORTFORMA = '+ dblkPortadorPadrao.LookupValue +#13#10+
         '     AND H.CODPORTFORMA = PF.CODPORTFORMA            '+#13#10+
         '     AND PF.CODPORTADOR = PC.CODPORTADOR             '+#13#10+
         '     AND PC.IDBANCO = BC.IDPESSOA                    '+#13#10+
         '     AND PC.IDAGENCIA = AG.IDPESSOA                  '+#13#10+
         ' GROUP BY H.DATAPAGAMENTO, H.CODPORTFORMA, H.NUMBANCO, PF.DESCRICAO, H.IDHSTFOLHABENEF, BC.NOME, AG.NOME ';

  dtmRelCartasBanco.qryCartasBanco.Close;
  dtmRelCartasBanco.qryCartasBanco.SQL.Text := sSql;
  if dtmRelCartasBanco.qryCartasBanco.prepared then
    dtmRelCartasBanco.qryCartasBanco.Unprepare;
  dtmRelCartasBanco.qryCartasBanco.Prepare;
  dtmRelCartasBanco.qryCartasBanco.Open;

  try
    dtmRelCartasBanco.pplblDia.Caption      := IntToStr(wDia);
  except; end;
  try
    dtmRelCartasBanco.ppLblMes.Caption      := sMes;
  except; end;
  try
    dtmRelCartasBanco.ppLblAno.Caption      := IntToStr(wAno)+'.';
  except; end;
  try
    dtmRelCartasBanco.ppLblNumCarta.Caption := edtNumCarta.Text;
  except; end;
end;

procedure TfrmPRelCartasBanco.ChkLstVersaoExit(Sender: TObject);
var ssqlPort : string;
begin
  MontaFiltro(ChkLstVersao, ListaVersao, sVersaoSel);
  if sVersaoSel = '' then
    sVersaoSel := '-1';

  ssqlPort :=   ' SELECT                                                 '+#13#10+
                '  DISTINCT HS.CODPORTFORMA,                             '+#13#10+
                '  P.DESCRICAO                                           '+#13#10+
                ' FROM HISTRUBSAL HS, PORTADORFORMA P                    '+#13#10+
                ' WHERE (HS.IDHSTFOLHABENEF IN ('+ sVersaoSel +'))       '+#13#10+
                ' AND   (HS.CODPORTFORMA    = P.CODPORTFORMA)            ';

  qryPortador.close;
  qryPortador.sql.Text := ssqlPort;
  if qryPortador.Prepared then
    qryPortador.unPrepare;
  qryPortador.Prepare;
  qryPortador.Open;

  dblkPortadorPadrao.Enabled := (qryPortador.Active) and (not qryPortador.isEmpty);
end;

procedure TfrmPRelCartasBanco.ChkLstVersaoClickCheck(Sender: TObject);
begin
  inherited;
  ChkLstVersaoExit(Sender);
end;

end.
