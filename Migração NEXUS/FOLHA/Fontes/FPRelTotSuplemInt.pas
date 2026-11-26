unit FPRelTotSuplemInt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, StdCtrls, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, fcCombo,
  fcColorCombo, usistema, dbasedados;

type
  TFrmPRelTotSuplemInt = class(TfrmOkCancelar)
    pnlVersao: TPanel;
    lblVersao: TLabel;
    dblkVersao: TwwDBLookupCombo;
    qryHistorico: TwwQuery;
    qryPatrocinadora: TwwQuery;
    qryPlano: TwwQuery;
    dblkPatrocinadora: TwwDBLookupCombo;
    dblkPlano: TwwDBLookupCombo;
    lblPatro: TLabel;
    lblPlano: TLabel;
    ChkConsolidar: TCheckBox;
    ChkConsolidaPlano: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkVersaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkPatrocinadoraChange(Sender: TObject);
    procedure dblkPlanoChange(Sender: TObject);
  private
    { Private declarations }
    procedure MontaQuery;
  public
    { Public declarations }
  end;

var
  FrmPRelTotSuplemInt: TFrmPRelTotSuplemInt;
  Filtro             : String;

implementation

uses uMensErro, dRelTotSuplemInt;

{$R *.DFM}

procedure TFrmPRelTotSuplemInt.FormCreate(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := False;
  qryHistorico.Open;
end;

procedure TFrmPRelTotSuplemInt.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  Filtro := '';
  If (dblkVersao.Text <> '') And (dblkVersao.LookupValue <> '') Then
  Begin
    Filtro := Filtro +' IDHSTFOLHABENEF = '+ dblkVersao.LookupValue +#13#10;
    dtmRelTotSuplemInt.LbVersao.Caption := 'Versão: '+dblkVersao.Text;

    If ChkConsolidar.Checked And ChkConsolidaPlano.Checked Then
    Begin
      dtmRelTotSuplemInt.lblTotPatro.Visible := False;
      dtmRelTotSuplemInt.dbQuant.Visible     := False;
      dtmRelTotSuplemInt.dbTotSRB.Visible    := False;
      dtmRelTotSuplemInt.dbTotINSS.Visible   := False;
      dtmRelTotSuplemInt.dbTotProv.Visible   := False;
      dtmRelTotSuplemInt.LneQuant.Visible    := False;
      dtmRelTotSuplemInt.LneTotSRB.Visible   := False;
      dtmRelTotSuplemInt.LneTotINSS.Visible  := False;
      dtmRelTotSuplemInt.LneTotProv.Visible  := False;
      dtmRelTotSuplemInt.lblTotPlano.Caption := 'Total Geral: ';
    End
    Else
    Begin
      If ChkConsolidar.Checked Then
      Begin
        dtmRelTotSuplemInt.lblTotPatro.Visible := False;
        dtmRelTotSuplemInt.dbQuant.Visible     := False;
        dtmRelTotSuplemInt.dbTotSRB.Visible    := False;
        dtmRelTotSuplemInt.dbTotINSS.Visible   := False;
        dtmRelTotSuplemInt.dbTotProv.Visible   := False;
        dtmRelTotSuplemInt.LneQuant.Visible    := False;
        dtmRelTotSuplemInt.LneTotSRB.Visible   := False;
        dtmRelTotSuplemInt.LneTotINSS.Visible  := False;
        dtmRelTotSuplemInt.LneTotProv.Visible  := False;
        dtmRelTotSuplemInt.lblTotPlano.Caption := 'Total por Plano: ';
      End
      Else
      Begin
        dtmRelTotSuplemInt.lblTotPatro.Visible := True;
        dtmRelTotSuplemInt.dbQuant.Visible     := True;
        dtmRelTotSuplemInt.dbTotSRB.Visible    := True;
        dtmRelTotSuplemInt.dbTotINSS.Visible   := True;
        dtmRelTotSuplemInt.dbTotProv.Visible   := True;
        dtmRelTotSuplemInt.LneQuant.Visible    := True;
        dtmRelTotSuplemInt.LneTotSRB.Visible   := True;
        dtmRelTotSuplemInt.LneTotINSS.Visible  := True;
        dtmRelTotSuplemInt.LneTotProv.Visible  := True;
        dtmRelTotSuplemInt.lblTotPlano.Caption := 'Total por Plano: ';
      End;
    End;
    MontaQuery;
  End
  Else
  Begin
    MsgDlg('Por Favor, Escolha a Versão.','Erro',mtError,[mbOk, mbHelp], 0);
    ModalResult := mrNone;
    Exit;
  End;
end;

procedure TFrmPRelTotSuplemInt.MontaQuery;
begin
  If ChkConsolidar.Checked Then
  Begin
    If Trim(dblkPlano.Text) <> '' Then
      dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text :=
    ' SELECT '+
    '   COUNT(DISTINCT G3.IDRESPONSAVEL) AS QTDE, '+
    '   NVL(SUM(G5.VALORSRB), 0.00) AS TOTALSRB, '+
    '   NVL(SUM(G6.VALORINSS), 0.00) AS TOTALINSS, '+
    '   NVL(SUM(G3.VALORSUP), 0.00) AS TOTALSUPHSTBENEF, '+
    '   NVL(SUM(G4.VALORLIQUIDO), 0.00) AS TOTALLIQUIDO, '+
    '   NVL(SUM(G4.VALORPROV), 0.00) AS TOTALPROVENTO, '+
    '   NVL(SUM(G4.VALORDESC), 0.00) AS TOTALDESCONTO, '+
    '   G3.IDPLANOPREV, G3.IDBENEFICIO, '+
    '   G3.NOMEBENEF, PL.NOME AS NOMEPLANO, ''Todas'' AS NOMEPATRO '
    Else
    Begin
      If ChkConsolidaPlano.Checked Then
        dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text :=
      ' SELECT '+
      '   COUNT(DISTINCT G3.IDRESPONSAVEL) AS QTDE, '+
      '   NVL(SUM(G5.VALORSRB), 0.00) AS TOTALSRB, '+
      '   NVL(SUM(G6.VALORINSS), 0.00) AS TOTALINSS, '+
      '   NVL(SUM(G3.VALORSUP), 0.00) AS TOTALSUPHSTBENEF, '+
      '   NVL(SUM(G4.VALORLIQUIDO), 0.00) AS TOTALLIQUIDO, '+
      '   NVL(SUM(G4.VALORPROV), 0.00) AS TOTALPROVENTO, '+
      '   NVL(SUM(G4.VALORDESC), 0.00) AS TOTALDESCONTO, '+
      '   G3.IDBENEFICIO, G3.NOMEBENEF, ''Todos'' AS NOMEPLANO, ''Todas'' AS NOMEPATRO '
      Else
        dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text :=
      ' SELECT '+
      '   COUNT(DISTINCT G3.IDRESPONSAVEL) AS QTDE, '+
      '   NVL(SUM(G5.VALORSRB), 0.00) AS TOTALSRB, '+
      '   NVL(SUM(G6.VALORINSS), 0.00) AS TOTALINSS, '+
      '   NVL(SUM(G3.VALORSUP), 0.00) AS TOTALSUPHSTBENEF, '+
      '   NVL(SUM(G4.VALORLIQUIDO), 0.00) AS TOTALLIQUIDO, '+
      '   NVL(SUM(G4.VALORPROV), 0.00) AS TOTALPROVENTO, '+
      '   NVL(SUM(G4.VALORDESC), 0.00) AS TOTALDESCONTO, '+
      '   G3.IDBENEFICIO, G3.NOMEBENEF, G3.IDPLANOPREV, PL.NOME AS NOMEPLANO, ''Todas'' AS NOMEPATRO ';
    End;
  End
  Else
  Begin
    If Trim(dblkPlano.Text) <> '' Then
      dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text :=
    ' SELECT '+
    '   COUNT(DISTINCT G3.IDRESPONSAVEL) AS QTDE, '+
    '   NVL(SUM(G5.VALORSRB), 0.00) AS TOTALSRB, '+
    '   NVL(SUM(G6.VALORINSS), 0.00) AS TOTALINSS, '+
    '   NVL(SUM(G3.VALORSUP), 0.00) AS TOTALSUPHSTBENEF, '+
    '   NVL(SUM(G4.VALORLIQUIDO), 0.00) AS TOTALLIQUIDO, '+
    '   NVL(SUM(G4.VALORPROV), 0.00) AS TOTALPROVENTO, '+
    '   NVL(SUM(G4.VALORDESC), 0.00) AS TOTALDESCONTO, '+
    '   G3.IDPLANOPREV, G3.IDPESSJUR, G3.IDBENEFICIO, '+
    '   G3.NOMEBENEF, PL.NOME AS NOMEPLANO, PT.NOME AS NOMEPATRO '
    Else
    Begin
      If ChkConsolidaPlano.Checked Then
        dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text :=
      ' SELECT '+
      '   COUNT(DISTINCT G3.IDRESPONSAVEL) AS QTDE, '+
      '   NVL(SUM(G5.VALORSRB), 0.00) AS TOTALSRB, '+
      '   NVL(SUM(G6.VALORINSS), 0.00) AS TOTALINSS, '+
      '   NVL(SUM(G3.VALORSUP), 0.00) AS TOTALSUPHSTBENEF, '+
      '   NVL(SUM(G4.VALORLIQUIDO), 0.00) AS TOTALLIQUIDO, '+
      '   NVL(SUM(G4.VALORPROV), 0.00) AS TOTALPROVENTO, '+
      '   NVL(SUM(G4.VALORDESC), 0.00) AS TOTALDESCONTO, '+
      '   G3.IDPESSJUR, G3.IDBENEFICIO, '+
      '   G3.NOMEBENEF, ''Todos'' AS NOMEPLANO, PT.NOME AS NOMEPATRO '
      Else
        dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text :=
      ' SELECT '+
      '   COUNT(DISTINCT G3.IDRESPONSAVEL) AS QTDE, '+
      '   NVL(SUM(G5.VALORSRB), 0.00) AS TOTALSRB, '+
      '   NVL(SUM(G6.VALORINSS), 0.00) AS TOTALINSS, '+
      '   NVL(SUM(G3.VALORSUP), 0.00) AS TOTALSUPHSTBENEF, '+
      '   NVL(SUM(G4.VALORLIQUIDO), 0.00) AS TOTALLIQUIDO, '+
      '   NVL(SUM(G4.VALORPROV), 0.00) AS TOTALPROVENTO, '+
      '   NVL(SUM(G4.VALORDESC), 0.00) AS TOTALDESCONTO, '+
      '   G3.IDPESSJUR, G3.IDBENEFICIO, '+
      '   G3.NOMEBENEF, G3.IDPLANOPREV, PL.NOME AS NOMEPLANO, PT.NOME AS NOMEPATRO ';
    End;
  End;


  dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
' FROM (SELECT '+
'          DISTINCT G2.VALORSUP, G2.IDPLANOPREV, G2.IDPESSJUR, G2.IDPESSOA, G2.IDRESPONSAVEL, '+
'          B.IDBENEFICIO, B.NOME AS NOMEBENEF '+
'          FROM (SELECT '+
'                   SUM(G.VALORINTEGRAL) AS VALORSUP, G.IDPLANOPREV, G.IDPESSJUR, G.IDPESSOA, '+
'                   G.IDRESPONSAVEL '+
'                FROM (SELECT '+
'                         HSB.VALORINTEGRAL, HSB.IDPESSOA, BFC.IDRESPONSAVEL, HSB.IDPLANOPREV, HSB.IDPESSJUR, '+
'                         HSB.IDBENEFICIO, B.TIPOBENEFICIO '+
'                       FROM HSTBENEFBFCIARIO HSB, BFCIARIOTITPLAN BFC, BENEFPLANPREV BP, BENEFICIO B '+
'                       WHERE '+Filtro;

  If Trim(dblkPatrocinadora.Text) <> '' Then
    dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
                            ' AND HSB.IDPESSJUR = '+dblkPatrocinadora.LookupValue;

  If Trim(dblkPlano.Text) <> '' Then
    dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
                            ' AND HSB.IDPLANOPREV = '+dblkPlano.LookupValue;

  dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
'                             AND HSB.IDTITULAR = BFC.IDTITULAR '+
'                             AND HSB.IDPESSOA = BFC.IDPESSOA '+
'                             AND HSB.IDBENEFICIO = BFC.IDBENEFICIO '+
'                             AND HSB.IDPLANOPREV = BFC.IDPLANOPREV '+
'                             AND HSB.IDPESSJUR = BFC.IDPESSJUR '+
'                             AND HSB.IDBENEFICIO = BP.IDBENEFICIO '+
'                             AND HSB.IDPLANOPREV = BP.IDPLANOPREV '+
'                             AND (BP.FLGREFERENCIA = 0 OR (BP.FLGREFERENCIA = 1 AND BP.FLGPAGAINSS = 1)) '+
'                             AND HSB.IDBENEFICIO = B.IDBENEFICIO '+
                            ' AND (((SELECT COUNT(DISTINCT HH1.NUMEROPROCESSO) '+
                              ' FROM HSTBENEFBFCIARIO HH1 '+
                              ' WHERE '+Filtro+
                              ' AND HH1.IDTITULAR = HSB.IDTITULAR '+
                              ' AND HH1.IDPESSOA = HSB.IDPESSOA) = 1) OR '+
                              '(HSB.NUMEROPROCESSO in (SELECT DISTINCT BBF1.NUMEROPROCESSO '+
                                                   ' FROM BENEFBFCIARIO BBF1 '+
                                                   ' WHERE BBF1.DATAINICIO = (SELECT MAX(BBF2.DATAINICIO) '+
                                                                            ' FROM BENEFBFCIARIO BBF2 '+
                                                                            ' WHERE BBF2.IDPESSOA = BBF1.IDTITULAR '+
                                                                            ' AND BBF2.IDTITULAR = BBF1.IDTITULAR) '+
                                                   ' AND BBF1.IDPESSOA = HSB.IDTITULAR '+
                                                   ' AND BBF1.IDTITULAR = HSB.IDPESSOA)))) G '+
'                       GROUP BY G.IDPLANOPREV, G.IDPESSJUR, G.IDPESSOA, '+
'                       G.IDRESPONSAVEL) G2, HSTBENEFBFCIARIO HST2, BENEFPLANPREV BP, BENEFICIO B '+
'                       WHERE  '+Filtro;

  If Trim(dblkPatrocinadora.Text) <> '' Then
    dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
                            ' AND HST2.IDPESSJUR = '+dblkPatrocinadora.LookupValue;

  If Trim(dblkPlano.Text) <> '' Then
    dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
                            ' AND HST2.IDPLANOPREV = '+dblkPlano.LookupValue;

  dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
'                             AND HST2.IDPESSOA = G2.IDPESSOA '+
'                             AND HST2.IDBENEFICIO = BP.IDBENEFICIO '+
'                             AND HST2.IDPLANOPREV = BP.IDPLANOPREV '+
'                             AND (BP.FLGREFERENCIA = 0 OR (BP.FLGREFERENCIA = 1 AND BP.FLGPAGAINSS = 1)) '+
'                             AND HST2.IDBENEFICIO = B.IDBENEFICIO '+
                              ' AND (((SELECT COUNT(DISTINCT HH1.NUMEROPROCESSO) '+
                              ' FROM HSTBENEFBFCIARIO HH1 '+
                              ' WHERE '+Filtro+
                              ' AND HH1.IDTITULAR = HST2.IDTITULAR '+
                              ' AND HH1.IDPESSOA = HST2.IDPESSOA) = 1) OR '+
                              ' (HST2.NUMEROPROCESSO in (SELECT DISTINCT BBF1.NUMEROPROCESSO '+
                                                    ' FROM BENEFBFCIARIO BBF1 '+
                                                    ' WHERE BBF1.DATAINICIO = (SELECT MAX(BBF2.DATAINICIO) '+
                                                                             ' FROM BENEFBFCIARIO BBF2 '+
                                                                             ' WHERE BBF2.IDPESSOA = BBF1.IDTITULAR '+
                                                                             ' AND BBF2.IDTITULAR = BBF1.IDTITULAR) '+
                                                    ' AND BBF1.IDPESSOA = HST2.IDTITULAR '+
                                                    ' AND BBF1.IDTITULAR = HST2.IDPESSOA))) '+
'                             AND B.TIPOBENEFICIO < 99) G3, '+
'                            (SELECT '+
'                                    HB.IDPLANOPREV, HB.IDPATRO, HB.IDRESPONSAVEL, '+
'                                    SUM(DECODE(PR.FLGESPECIAL,0, '+
'                                    DECODE(PR.FLGDESCONTO,0,HB.VALORPROVENTO, 1,(-1)*HB.VALORPROVENTO, 0), 0)) AS VALORLIQUIDO, '+
'                                    SUM(DECODE(PR.FLGESPECIAL,0, '+
'                                    DECODE(PR.FLGDESCONTO,0,HB.VALORPROVENTO, 1,0, 0), 0)) AS VALORPROV, '+
'                                    SUM(DECODE(PR.FLGESPECIAL,0, DECODE(PR.FLGDESCONTO,0,0, 1,HB.VALORPROVENTO, 0), 0)) AS VALORDESC '+
'                            FROM HISTRUBSAL HB, PROVDESC PR '+
'                            WHERE  '+Filtro+
'                                  AND HB.IDRUBRICA = PR.IDPROVENTO '+#13#10+
'                            GROUP BY HB.IDPLANOPREV, HB.IDPATRO, HB.IDRESPONSAVEL) G4, '+#13#10+
'                            (SELECT '+#13#10+
'                               SUM(G.VALORSRB) AS VALORSRB, G.IDPLANOPREV, G.IDPESSJUR, G.IDRESPONSAVEL '+#13#10+
'                             FROM ( SELECT HSB.VALORSRB, HSB.IDPESSOA, BFC.IDRESPONSAVEL, HSB.IDPLANOPREV, HSB.IDPESSJUR, '+#13#10+
'                                           HSB.IDBENEFICIO, B.TIPOBENEFICIO '+#13#10+
'                                    FROM HSTBENEFBFCIARIO HSB, BFCIARIOTITPLAN BFC, BENEFPLANPREV BP, BENEFICIO B '+#13#10+
'                                    WHERE  '+Filtro;

  If Trim(dblkPatrocinadora.Text) <> '' Then
    dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
                            ' AND HSB.IDPESSJUR = '+dblkPatrocinadora.LookupValue;

  If Trim(dblkPlano.Text) <> '' Then
    dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
                            ' AND HSB.IDPLANOPREV = '+dblkPlano.LookupValue;

  dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
'                                          AND HSB.IDTITULAR = BFC.IDTITULAR '+#13#10+
'                                          AND HSB.IDPESSOA = BFC.IDPESSOA '+#13#10+
'                                          AND HSB.IDBENEFICIO = BFC.IDBENEFICIO '+#13#10+
'                                          AND HSB.IDPLANOPREV = BFC.IDPLANOPREV '+#13#10+
'                                          AND HSB.IDPESSJUR = BFC.IDPESSJUR '+#13#10+
'                                          AND HSB.IDBENEFICIO = BP.IDBENEFICIO '+#13#10+
'                                          AND HSB.IDPLANOPREV = BP.IDPLANOPREV '+#13#10+
'                                          AND (BP.FLGREFERENCIA = 0 OR (BP.FLGREFERENCIA = 1 AND BP.FLGPAGAINSS = 1)) '+
'                                          AND HSB.IDBENEFICIO = B.IDBENEFICIO '+
                               ' AND (((SELECT COUNT(DISTINCT HH1.NUMEROPROCESSO) '+
                                      ' FROM HSTBENEFBFCIARIO HH1 '+
                                      ' WHERE '+Filtro+
                                      ' AND HH1.IDTITULAR = HSB.IDTITULAR '+
                                      ' AND HH1.IDPESSOA = HSB.IDPESSOA) = 1) OR '+
                                     ' ( HSB.NUMEROPROCESSO in (SELECT DISTINCT BBF1.NUMEROPROCESSO '+
                                                           ' FROM BENEFBFCIARIO BBF1 '+
                                                           ' WHERE BBF1.DATAINICIO = (SELECT MAX(BBF2.DATAINICIO) '+
                                                                                    ' FROM BENEFBFCIARIO BBF2 '+
                                                                                    ' WHERE BBF2.IDPESSOA = BBF1.IDTITULAR '+
                                                                                    ' AND BBF2.IDTITULAR = BBF1.IDTITULAR) '+
                                                           ' AND BBF1.IDPESSOA = HSB.IDTITULAR '+
                                                           ' AND BBF1.IDTITULAR = HSB.IDPESSOA)))) G '+
'                                    GROUP BY G.IDPLANOPREV, G.IDPESSJUR, G.IDRESPONSAVEL) G5, '+#13#10+
'                                    (SELECT SUM(G.VALORINTEGRAL) AS VALORINSS, G.IDPLANOPREV, G.IDPESSJUR, G.IDRESPONSAVEL '+#13#10+
'                                     FROM (SELECT HSB.VALORINTEGRAL, HSB.IDPESSOA, BFC.IDRESPONSAVEL, HSB.IDPLANOPREV, HSB.IDPESSJUR, '+#13#10+
'                                                  HSB.IDBENEFICIO, B.TIPOBENEFICIO '+#13#10+
'                                           FROM HSTBENEFBFCIARIO HSB, BFCIARIOTITPLAN BFC, BENEFPLANPREV BP, BENEFICIO B '+#13#10+
'                                           WHERE  '+Filtro;

  If Trim(dblkPatrocinadora.Text) <> '' Then
    dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
                            ' AND HSB.IDPESSJUR = '+dblkPatrocinadora.LookupValue;

  If Trim(dblkPlano.Text) <> '' Then
    dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
                            ' AND HSB.IDPLANOPREV = '+dblkPlano.LookupValue;

  dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
'                                                 AND HSB.IDTITULAR = BFC.IDTITULAR '+#13#10+
'                                                 AND HSB.IDPESSOA = BFC.IDPESSOA '+#13#10+
'                                                 AND HSB.IDBENEFICIO = BFC.IDBENEFICIO '+#13#10+
'                                                 AND HSB.IDPLANOPREV = BFC.IDPLANOPREV '+#13#10+
'                                                 AND HSB.IDPESSJUR = BFC.IDPESSJUR '+#13#10+
'                                                 AND HSB.IDBENEFICIO = BP.IDBENEFICIO '+#13#10+
'                                                 AND HSB.IDPLANOPREV = BP.IDPLANOPREV '+#13#10+
'                                                 AND BP.FLGREFERENCIA = 1 '+#13#10+
'                                                 AND BP.FLGPAGAINSS = 0 '+#13#10+
'                                                 AND HSB.IDBENEFICIO = B.IDBENEFICIO '+
                                      ' AND (((SELECT COUNT(DISTINCT HH1.NUMEROPROCESSO) '+
                                             ' FROM HSTBENEFBFCIARIO HH1 '+
                                             ' WHERE '+Filtro+
                                             ' AND HH1.IDTITULAR = HSB.IDTITULAR '+
                                             ' AND HH1.IDPESSOA = HSB.IDPESSOA) = 1) OR '+
                                           ' (HSB.NUMEROPROCESSO in (SELECT DISTINCT BBF1.NUMEROPROCESSO '+
                                                                  ' FROM BENEFBFCIARIO BBF1 '+
                                                                  ' WHERE BBF1.DATAINICIO = (SELECT MAX(BBF2.DATAINICIO) '+
                                                                                           ' FROM BENEFBFCIARIO BBF2 '+
                                                                                           ' WHERE BBF2.IDPESSOA = BBF1.IDTITULAR '+
                                                                                           ' AND BBF2.IDTITULAR = BBF1.IDTITULAR) '+
                                                                  ' AND BBF1.IDPESSOA = HSB.IDTITULAR '+
                                                                  ' AND BBF1.IDTITULAR = HSB.IDPESSOA)))) G '+
'                                            GROUP BY G.IDPLANOPREV, G.IDPESSJUR, G.IDRESPONSAVEL ) G6, PESSOA PT, PLANPREV PL '+#13#10+
'                                            WHERE PT.IDPESSOA = G3.IDPESSJUR '+#13#10+
'                                                  AND PL.IDPLANOPREV = G3.IDPLANOPREV '+#13#10+
'                                                  AND G3.IDRESPONSAVEL = G4.IDRESPONSAVEL '+#13#10+
'                                                  AND G3.IDPLANOPREV = G4.IDPLANOPREV '+#13#10+
'                                                  AND G3.IDPESSJUR = G4.IDPATRO '+#13#10+
'                                                  AND G3.IDRESPONSAVEL = G5.IDRESPONSAVEL(+) '+#13#10+
'                                                  AND G3.IDPLANOPREV = G5.IDPLANOPREV(+) '+#13#10+
'                                                  AND G3.IDPESSJUR = G5.IDPESSJUR(+) '+#13#10+
'                                                  AND G3.IDRESPONSAVEL = G6.IDRESPONSAVEL(+) '+#13#10+
'                                                  AND G3.IDPLANOPREV = G6.IDPLANOPREV(+) '+#13#10+
'                                                  AND G3.IDPESSJUR = G6.IDPESSJUR(+) ';

  If ChkConsolidar.Checked Then
  Begin
    If Trim(dblkPlano.Text) <> '' Then
      dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
      ' GROUP BY G3.IDBENEFICIO, G3.NOMEBENEF, G3.IDPLANOPREV, PL.NOME '+
      ' ORDER BY G3.IDPLANOPREV, G3.IDBENEFICIO '
    Else
    Begin
      If ChkConsolidaPlano.Checked Then
        dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
        ' GROUP BY G3.IDBENEFICIO, G3.NOMEBENEF '+
        ' ORDER BY G3.IDBENEFICIO '
      Else
        dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
        ' GROUP BY G3.IDBENEFICIO, G3.NOMEBENEF, G3.IDPLANOPREV, PL.NOME '+
        ' ORDER BY G3.IDPLANOPREV, G3.IDBENEFICIO ';
    End;
  End
  Else
  Begin
    If Trim(dblkPlano.Text) <> '' Then
      dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
      ' GROUP BY G3.IDBENEFICIO, G3.NOMEBENEF, G3.IDPLANOPREV, PL.NOME, G3.IDPESSJUR, PT.NOME '+
      ' ORDER BY PT.NOME, PL.NOME, G3.NOMEBENEF '
    Else
    Begin
      If ChkConsolidaPlano.Checked Then
        dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
        ' GROUP BY G3.IDBENEFICIO, G3.NOMEBENEF, G3.IDPESSJUR, PT.NOME '+
        ' ORDER BY PT.NOME, G3.NOMEBENEF '
      Else
        dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text := dtmRelTotSuplemInt.qryTotSuplemInt.SQL.Text +
        ' GROUP BY G3.IDBENEFICIO, G3.NOMEBENEF, G3.IDPESSJUR, G3.IDPLANOPREV, PL.NOME, PT.NOME '+
        ' ORDER BY PT.NOME, PL.NOME, G3.NOMEBENEF ';
    End;
  End;

  If Not dtmRelTotSuplemInt.qryTotSuplemInt.Prepared Then
    dtmRelTotSuplemInt.qryTotSuplemInt.Prepare;

  dtmRelTotSuplemInt.qryTotSuplemInt.Open;
end;

procedure TFrmPRelTotSuplemInt.dblkVersaoChange(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := ((dblkVersao.Text <> '') And (dblkVersao.LookupValue <> ''));
end;

procedure TFrmPRelTotSuplemInt.FormShow(Sender: TObject);
begin
  inherited;
  qryPatrocinadora.Open;
  qryPlano.Open;
end;

procedure TFrmPRelTotSuplemInt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryHistorico.Close;
  qryPatrocinadora.Close;
  qryPlano.Close;
end;

procedure TFrmPRelTotSuplemInt.dblkPatrocinadoraChange(Sender: TObject);
begin
  inherited;
  If Trim(dblkPatrocinadora.Text) <> '' Then
  Begin
    ChkConsolidar.Enabled := False;
    ChkConsolidar.Checked := False;
  End Else
    ChkConsolidar.Enabled := True;
end;

procedure TFrmPRelTotSuplemInt.dblkPlanoChange(Sender: TObject);
begin
  inherited;
  If Trim(dblkPlano.Text) <> '' Then
  Begin
    ChkConsolidaPlano.Enabled := False;
    ChkConsolidaPlano.Checked := False;
  End Else
    ChkConsolidaPlano.Enabled := True;
end;

end.


{==============================================================================|
| UNIT: FPRELTOTSUPLEMINT                                                      |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   FORMULÁRIO DE FILTRO PARA O RELATÓRIO DE TOTAIS DE SUPLEMENTAÇÃO INTEGRAL  |
|                                                                              |
|==============================================================================|
