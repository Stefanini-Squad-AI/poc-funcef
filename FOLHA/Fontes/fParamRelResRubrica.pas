unit FParamRelResRubrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FReports_Folha, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook, Spin,
  ExtCtrls, CheckLst, usistema, dbasedados;

type
  TFrmParamRelResRubrica = class(TFrmReports_Folha)
    ChkLstLoteouVersao: TCheckListBox;
    GrpPatrocinadora: TGroupBox;
    dbcmbPatrocinadora: TwwDBLookupCombo;
    ChkConsolidar: TCheckBox;
    GrpPlano: TGroupBox;
    dbcmbPlano: TwwDBLookupCombo;
    RdoTipoOrdem: TRadioGroup;
    qryPatro: TwwQuery;
    qryPatroNOME: TStringField;
    qryPatroIDPESSOA: TFloatField;
    qryPlano: TwwQuery;
    qryPlanoNOME: TStringField;
    qryPlanoIDPLANOPREV: TFloatField;
    chkMostraEstornado: TCheckBox;
    ChkConsolidaLoteouVersao: TCheckBox;
    chkConsolidaPlano: TCheckBox;
    dbcmbPlanoPrev: TwwDBLookupCombo;
    lblPlanoPrev: TLabel;
    lblPlanoContab: TLabel;
    qryPlanoPrev: TwwQuery;
    procedure RdoTipoFolhaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RdoTipoFiltroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbcmbPatrocinadoraChange(Sender: TObject);
    procedure ChkLstLoteouVersaoClickCheck(Sender: TObject);
    procedure dbcmbPlanoPrevChange(Sender: TObject);
    procedure dbcmbPlanoChange(Sender: TObject);
    procedure CmbMesChange(Sender: TObject);

  private
    { Private declarations }
    ListaLote, ListaVersao : TStringList;
    sTabela, sLoteouVersaoSel : String;
    bEscolheuLoteouVersao : Boolean;
    procedure MontaQuery(sTabela: String);
    procedure MontaQryPatro;
    procedure MontaQryPlano;
    procedure MontaQryPlanoPrev;

  public
    { Public declarations }
    wDia, wMes, wAno : Word;
    sSql, sLoteouVersao, sMesRef : String;

  published
    { Published declarations }
    property Tabela : String read sTabela write sTabela;

  end;

var
  FrmParamRelResRubrica: TFrmParamRelResRubrica;

implementation

Uses uFuncoesFolha, uAdmPrevFB, uMensErro, fAguarde, dRelResRubrica, uObjFolha;

{$R *.DFM}

procedure TFrmParamRelResRubrica.RdoTipoFolhaClick(Sender: TObject);
Var
  I : Integer;

begin
  inherited;
  If RdoTipoFolha.ItemIndex = 0 Then
  Begin
    RdoTipoFiltro.Items.Strings[0]   := 'Por Lote';
    LblLoteouVersao.Caption          := 'Lote';
    ChkConsolidaLoteouVersao.Caption := 'Mostra Relatório Consolidado por Lote';
    sSql := ' SELECT IDLOTE, MESREFERENCIA, DESCRICAO AS DESCR, '+
            ' IDLOTE ||''-''|| DESCRICAO AS DESCRICAO '+
            ' FROM CTRLINTERFACE '+
            ' WHERE TIPO = ''B'' '+
            ' AND IDPESSOA = '+IntToStr(iIdFundacao)+' '+
            ' AND FLGVOLTATMP  = 0 '+
            ' AND IDREFERENCIA IS NULL '+
            ' ORDER BY IDLOTE DESC ';
    qryPreviaouEfetivada.Close;
    qryPreviaouEfetivada.SQL.Clear;
    qryPreviaouEfetivada.SQL.Add(sSql);
    qryPreviaouEfetivada.Open;
    sTabela := 'PREVIA';
    ChkLstLoteouVersao.Clear;
    While Not qryPreviaouEfetivada.Eof Do
    Begin
      ChkLstLoteouVersao.Items.Add(qryPreviaouEfetivada.FieldByName('DESCRICAO').asstring);
      ChkLstLoteouVersao.ItemIndex := 0;
      ListaLote.Add(qryPreviaouEfetivada.FieldByName('IDLOTE').AsString);
      qryPreviaouEfetivada.Next;
    End;
  End
  Else
  Begin
    RdoTipoFiltro.Items.Strings[0] := 'Por Versão';
    LblLoteouVersao.Caption        := 'Versão';
    ChkConsolidaLoteouVersao.Caption := 'Mostra Relatório Consolidado por Versão';
    sSql := ' SELECT IDHSTFOLHABENEF, HISTORICO AS DESCR, '+
            ' IDHSTFOLHABENEF ||''-''|| HISTORICO AS DESCRICAO '+
            ' FROM HSTFOLHABENEF '+
            ' WHERE FLGESTADO <> 2 '+
            ' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
            ' ORDER BY IDHSTFOLHABENEF DESC ';
    qryPreviaouEfetivada.Close;
    qryPreviaouEfetivada.SQL.Clear;
    qryPreviaouEfetivada.SQL.Add(sSql);
    qryPreviaouEfetivada.Open;
    sTabela := 'HISTRUBSAL';
    ChkLstLoteouVersao.Clear;
    While Not qryPreviaouEfetivada.Eof Do
    Begin
      ChkLstLoteouVersao.Items.Add(qryPreviaouEfetivada.FieldByName('DESCRICAO').asstring);
      ChkLstLoteouVersao.ItemIndex := 0;
      ListaVersao.Add(qryPreviaouEfetivada.FieldByName('IDHSTFOLHABENEF').AsString);
      qryPreviaouEfetivada.Next;
    End;
  End;

  If RdoTipoFiltro.ItemIndex = 0 Then
  Begin
    CmbMes.ItemIndex             := -1;
    SpnedAno.Value               := 0;
    LblLoteouVersao.Enabled      := True;
    PnlPreviaouEfetivada.Enabled := True;
    PnlLoteouVersao.Enabled      := True;
    PnlMesPagto.Enabled          := False;
    LblMesPagto.Enabled          := False;
  End
  Else
  Begin
    For I := 0 To ChkLstLoteouVersao.Items.Count - 1 Do
      ChkLstLoteouVersao.Checked[I] := False;

    LblMesPagto.Enabled          := True;
    PnlPreviaouEfetivada.Enabled := True;
    PnlLoteouVersao.Enabled      := False;
    PnlMesPagto.Enabled          := True;
    LblLoteouVersao.Enabled      := False;
    CmbMes.ItemIndex             := wMes - 1;
    SpnedAno.Value               := wAno;
  End;
end;

procedure TFrmParamRelResRubrica.FormShow(Sender: TObject);
var I: Integer;
begin
  inherited;
  QRYPLANO.OPEN;
  qryPlanoPrev.Open; 
  DecodeDate(Date, wAno, wMes, wDia);
  ListaLote   := TStringList.Create;
  ListaVersao := TStringList.Create;
  If RdoTipoFolha.ItemIndex = 0 Then
  Begin
    RdoTipoFiltro.Items.Strings[0] := 'Por Lote';
    LblLoteouVersao.Caption        := 'Lote';
    ChkConsolidaLoteouVersao.Caption := 'Mostra Relatório Consolidado por Lote';
    sSql := ' SELECT IDLOTE, MESREFERENCIA, DESCRICAO AS DESCR, '+
            ' IDLOTE ||''-''|| DESCRICAO AS DESCRICAO '+
            ' FROM CTRLINTERFACE '+
            ' WHERE TIPO = ''B'' '+
            ' AND IDPESSOA = '+IntToStr(iIdFundacao)+' '+
            ' AND FLGVOLTATMP  = 0 '+
            ' AND IDREFERENCIA IS NULL '+
            ' ORDER BY IDLOTE DESC ';
    qryPreviaouEfetivada.Close;
    qryPreviaouEfetivada.SQL.Clear;
    qryPreviaouEfetivada.SQL.Add(sSql);
    qryPreviaouEfetivada.Open;
    sTabela := 'PREVIA';
    ChkLstLoteouVersao.Clear;
    While Not qryPreviaouEfetivada.Eof Do
    Begin
      ChkLstLoteouVersao.Items.Add(qryPreviaouEfetivada.FieldByName('DESCRICAO').asstring);
      ChkLstLoteouVersao.ItemIndex := 0;
      ListaLote.Add(qryPreviaouEfetivada.FieldByName('IDLOTE').AsString);
      qryPreviaouEfetivada.Next;
    End;
  End
  Else
  Begin
    RdoTipoFiltro.Items.Strings[0] := 'Por Versão';
    LblLoteouVersao.Caption        := 'Versão';
    ChkConsolidaLoteouVersao.Caption := 'Mostra Relatório Consolidado por Versão';
    sSql := ' SELECT IDHSTFOLHABENEF, HISTORICO AS DESCR, '+
            ' IDHSTFOLHABENEF ||''-''|| HISTORICO AS DESCRICAO '+
            ' FROM HSTFOLHABENEF '+
            ' WHERE FLGESTADO <> 2 '+
            ' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
            ' ORDER BY IDHSTFOLHABENEF DESC ';
    qryPreviaouEfetivada.Close;
    qryPreviaouEfetivada.SQL.Clear;
    qryPreviaouEfetivada.SQL.Add(sSql);
    qryPreviaouEfetivada.Open;
    sTabela := 'HISTRUBSAL';
    ChkLstLoteouVersao.Clear;
    While Not qryPreviaouEfetivada.Eof Do
    Begin
      ChkLstLoteouVersao.Items.Add(qryPreviaouEfetivada.FieldByName('DESCRICAO').asstring);
      ChkLstLoteouVersao.ItemIndex := 0;
      ListaVersao.Add(qryPreviaouEfetivada.FieldByName('IDHSTFOLHABENEF').AsString);
      qryPreviaouEfetivada.Next;
    End;
  End;

  If RdoTipoFiltro.ItemIndex = 0 Then
  Begin
    CmbMes.ItemIndex             := -1;
    SpnedAno.Value               := 0;
    LblLoteouVersao.Enabled      := True;
    PnlPreviaouEfetivada.Enabled := True;
    PnlLoteouVersao.Enabled      := True;
    PnlMesPagto.Enabled          := False;
    LblMesPagto.Enabled          := False;
  End
  Else
  Begin
    For I := 0 To ChkLstLoteouVersao.Items.Count - 1 Do
      ChkLstLoteouVersao.Checked[I] := False;

    LblMesPagto.Enabled          := True;
    PnlPreviaouEfetivada.Enabled := True;
    PnlLoteouVersao.Enabled      := False;
    PnlMesPagto.Enabled          := True;
    LblLoteouVersao.Enabled      := False;
    CmbMes.ItemIndex             := wMes - 1;
    SpnedAno.Value               := wAno;
  End;
end;

procedure TFrmParamRelResRubrica.RdoTipoFiltroClick(Sender: TObject);
var I: Integer;
begin
  inherited;
  If RdoTipoFolha.ItemIndex = 0 Then
  Begin
    RdoTipoFiltro.Items.Strings[0] := 'Por Lote';
    LblLoteouVersao.Caption        := 'Lote';
    ChkConsolidaLoteouVersao.Caption := 'Mostra Relatório Consolidado por Lote';
    sSql := ' SELECT IDLOTE, MESREFERENCIA, DESCRICAO AS DESCR, '+
            ' IDLOTE ||''-''|| DESCRICAO AS DESCRICAO '+
            ' FROM CTRLINTERFACE '+
            ' WHERE TIPO = ''B'' '+
            ' AND IDPESSOA = '+IntToStr(iIdFundacao)+' '+
            ' AND FLGVOLTATMP  = 0 '+
            ' AND IDREFERENCIA IS NULL '+
            ' ORDER BY IDLOTE DESC ';
    qryPreviaouEfetivada.Close;
    qryPreviaouEfetivada.SQL.Clear;
    qryPreviaouEfetivada.SQL.Add(sSql);
    qryPreviaouEfetivada.Open;
    sTabela := 'PREVIA';
    ChkLstLoteouVersao.Clear;
    While Not qryPreviaouEfetivada.Eof Do
    Begin
      ChkLstLoteouVersao.Items.Add(qryPreviaouEfetivada.FieldByName('DESCRICAO').asstring);
      ChkLstLoteouVersao.ItemIndex := 0;
      ListaLote.Add(qryPreviaouEfetivada.FieldByName('IDLOTE').AsString);
      qryPreviaouEfetivada.Next;
    End;
  End
  Else
  Begin
    RdoTipoFiltro.Items.Strings[0] := 'Por Versão';
    LblLoteouVersao.Caption        := 'Versão';
    ChkConsolidaLoteouVersao.Caption := 'Mostra Relatório Consolidado por Versão';
    sSql := ' SELECT IDHSTFOLHABENEF, HISTORICO AS DESCR, '+
            ' IDHSTFOLHABENEF ||''-''|| HISTORICO AS DESCRICAO '+
            ' FROM HSTFOLHABENEF '+
            ' WHERE FLGESTADO <> 2 '+
            ' AND IDFUNDACAO = '+IntToStr(iIdFundacao)+' '+
            ' ORDER BY IDHSTFOLHABENEF DESC ';
    qryPreviaouEfetivada.Close;
    qryPreviaouEfetivada.SQL.Clear;
    qryPreviaouEfetivada.SQL.Add(sSql);
    qryPreviaouEfetivada.Open;
    sTabela := 'HISTRUBSAL';
    ChkLstLoteouVersao.Clear;
    While Not qryPreviaouEfetivada.Eof Do
    Begin
      ChkLstLoteouVersao.Items.Add(qryPreviaouEfetivada.FieldByName('DESCRICAO').asstring);
      ChkLstLoteouVersao.ItemIndex := 0;
      ListaVersao.Add(qryPreviaouEfetivada.FieldByName('IDHSTFOLHABENEF').AsString);
      qryPreviaouEfetivada.Next;
    End;
  End;

  If RdoTipoFiltro.ItemIndex = 0 Then
  Begin
    CmbMes.ItemIndex             := -1;
    SpnedAno.Value               := 0;
    LblLoteouVersao.Enabled      := True;
    PnlPreviaouEfetivada.Enabled := True;
    PnlLoteouVersao.Enabled      := True;
    PnlMesPagto.Enabled          := False;
    LblMesPagto.Enabled          := False;
  End
  Else
  Begin
    sLoteouVersaoSel := '';
    For I := 0 To ChkLstLoteouVersao.Items.Count - 1 Do
      ChkLstLoteouVersao.Checked[I] := False;

    LblMesPagto.Enabled          := True;
    PnlPreviaouEfetivada.Enabled := True;
    PnlLoteouVersao.Enabled      := False;
    PnlMesPagto.Enabled          := True;
    LblLoteouVersao.Enabled      := False;
    CmbMes.ItemIndex             := wMes - 1;
    SpnedAno.Value               := wAno;
    CmbMesChange(Self);
  End;
end;

procedure TFrmParamRelResRubrica.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatro.close;
  qryPatro.SQL.Clear;
  qryPatro.SQL.Add('SELECT P.IDPESSOA, P.NOME '+
                   'FROM PESSOA P, PATRO PT '+
                   'WHERE (PT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+
                   'AND (P.IDPESSOA = PT.IDPESSOA) '+
                   'ORDER BY P.NOME ');
  qryPatro.open;
end;

procedure TFrmParamRelResRubrica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatro.Active     := False;
  qryPlano.Active     := False;
  qryPlanoPrev.Active := False; 
  ListaLote.Free;
  ListaVersao.Free;
end;

procedure TFrmParamRelResRubrica.bbtnConfirmarClick(Sender: TObject);
var I: Integer;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  bEscolheuLoteouVersao := False;

  If RdoTipoFiltro.ItemIndex = 0 Then
  Begin
    For I := 0 To ChkLstLoteouVersao.Items.Count - 1 Do
    Begin
      If ChkLstLoteouVersao.Checked[I] Then
      Begin
        bEscolheuLoteouVersao := True;
        If RdoTipoFolha.ItemIndex = 0 Then
        Begin
          If sLoteouVersao = '' Then
            sLoteouVersao := ListaLote[I]
          Else
            sLoteouVersao := sLoteouVersao + ',' + ListaLote[I];
        End
        Else
        Begin
          If sLoteouVersao = '' Then
            sLoteouVersao := ListaVersao[I]
          Else
            sLoteouVersao := sLoteouVersao + ',' + ListaVersao[I];
        End;
      End;
    End;
  End;

  If (RdoTipoFolha.ItemIndex = 0) And (RdoTipoFiltro.ItemIndex = 0) Then
  Begin
    If bEscolheuLoteouVersao = False Then
    Begin
      ShowMessage('Por Favor, escolha os Lotes. ');
      ChkLstLoteouVersao.SetFocus;
      ModalResult := mrNone;
      Exit;
    End;
  End
  Else
  Begin
    If (RdoTipoFolha.ItemIndex = 1) And (RdoTipoFiltro.ItemIndex = 0) Then
    Begin
      If bEscolheuLoteouVersao = False Then
      Begin
        ShowMessage('Por Favor, escolha as Versões. ');
        ChkLstLoteouVersao.SetFocus;
        ModalResult := mrNone;
        Exit;
      End;
    End;
  End;

  MontaQuery(sTabela);
  dtmRelResRubrica.pAbreFundacao;

  if dbcmbPlano.Text <> '' then
    dtmRelResRubrica.lblPlano.caption := dbcmbPlano.Text
  else
    dtmRelResRubrica.lblPlano.caption := 'Todos';

  If RdoTipoFolha.ItemIndex = 0 Then
  Begin
    DtmRelResRubrica.lblLiqLoteOuVersao.Caption := 'Líquido do Lote:';
    DtmRelResRubrica.lblTotLoteOuVersao.Caption := 'Totais do Lote:';
  End
  Else
  Begin
    DtmRelResRubrica.lblLiqLoteOuVersao.Caption := 'Líquido da Versão:';
    DtmRelResRubrica.lblTotLoteOuVersao.Caption := 'Totais da Versão:';
  End;

  If ChkConsolidaLoteouVersao.Checked Then
    DtmRelResRubrica.ResTotLoteOuVersao.Visible := False
  Else
    DtmRelResRubrica.ResTotLoteOuVersao.Visible := True;

  dtmRelResRubrica.qryRelResumoRubrica.Open;
end;

procedure TFrmParamRelResRubrica.MontaQuery(sTabela: String);
begin
  If (RdoTipoFolha.ItemIndex = 0) And (RdoTipoFiltro.ItemIndex = 0) Then
    MontaFiltroCompleto(ChkLstLoteouVersao, ListaLote, sLoteouVersaoSel);

  If (RdoTipoFolha.ItemIndex = 1) And (RdoTipoFiltro.ItemIndex = 0) Then
    MontaFiltroCompleto(ChkLstLoteouVersao, ListaVersao, sLoteouVersaoSel);

  dtmRelResRubrica.qryRelResumoRubrica.Close;
  dtmRelResRubrica.qryRelResumoRubrica.SQL.Clear;

  If ChkConsolidar.Checked Then
    DtmRelResRubrica.qryRelResumoRubrica.SQL.Add(' SELECT ''Todas'' AS NOME ')
  Else
    DtmRelResRubrica.qryRelResumoRubrica.SQL.Add(' SELECT P.NOME ');

  If chkConsolidaPlano.Checked Then
    DtmRelResRubrica.qryRelResumoRubrica.SQL.Add(', ''Todos'' AS NOMEPLANOPREV, ''Todos'' AS NOMEPLANO ')
  Else
    dtmrelresrubrica.qryRelResumoRubrica.SQL.Add(', PP.NOME AS NOMEPLANOPREV, PL.NOME AS NOMEPLANO ');

  If SistemaFolha.FlgUsaCodRubExt = 0 Then
    DtmRelResRubrica.qryRelResumoRubrica.SQL.Add(
    ', PD.IDPROVENTO CODPROVDESC, PD.DESCRICAO DESCRPROVDESC ')
  Else
    DtmRelResRubrica.qryRelResumoRubrica.SQL.Add(', PD.CODPROVDESC, PD.DESCRPROVDESC ');

  If ChkConsolidaLoteouVersao.Checked Then
  Begin
    If pos(',', sLoteouVersao) = 0 Then
    Begin
      If RdoTipoFolha.ItemIndex = 0 Then
        DtmRelResRubrica.qryRelResumoRubrica.SQL.Add(
        ', HST.IDLOTE||'' - ''||HST.DESCRICAO AS DESCRVERSAOLOTE ')
      Else
        DtmRelResRubrica.qryRelResumoRubrica.SQL.Add(
        ', HST.IDHSTFOLHABENEF||'' - ''||HST.HISTORICO AS DESCRVERSAOLOTE ');
    End
    Else
      DtmRelResRubrica.qryRelResumoRubrica.SQL.Add(
      ', ' + QuotedStr(sLoteouVersao) + ' AS DESCRVERSAOLOTE ');
  End
  Else
    If RdoTipoFolha.ItemIndex = 0 Then
      DtmRelResRubrica.qryRelResumoRubrica.SQL.Add(
      ', HST.IDLOTE||'' - ''||HST.DESCRICAO AS DESCRVERSAOLOTE ')
    Else
      DtmRelResRubrica.qryRelResumoRubrica.SQL.Add(
      ', HST.IDHSTFOLHABENEF||'' - ''||HST.HISTORICO AS DESCRVERSAOLOTE ');

  dtmRelResRubrica.qryRelResumoRubrica.SQL.Add(
'     , DECODE(PD.FLGDESCONTO,0,''Provento'',''Desconto''), '+
'       COUNT(H.IDRUBRICA) AS TOTRUB, '+
'       COUNT(DISTINCT H.IDRESPONSAVEL) AS TOTREC, '+
'       DECODE(PD.FLGDESCONTO,2,SUM(H.VALORINFO)||'' (I)'',0,NULL,1, '+
'         DECODE(SUM(H.VALORRECEBIDO-H.VALORPROVENTO),0, '+
'           DECODE(SUM(H.VALORINFO),0,NULL,SUM(H.VALORINFO)||'' (I)''), '+
'             SUM(H.VALORRECEBIDO-H.VALORPROVENTO)||'' (R)'')) INFORMATIVO, '+
'       SUM(DECODE(PD.FLGDESCONTO,0,H.VALORPROVENTO,0)) AS PROVENTOS, '+
'       SUM(DECODE(PD.FLGDESCONTO,1,H.VALORPROVENTO,0)) AS DESCONTOS, '+
'       SUM(DECODE(PD.FLGDESCONTO,0,H.VALORPROVENTO,0) - '+
'           DECODE(PD.FLGDESCONTO,1,H.VALORPROVENTO,0)) AS LIQ, '+
'       ''A'' AS QUEBRA ');

  if ChkConsolidar.Checked then // consolidada
    case RdoTipoFolha.ItemIndex of
         // PREVIA
         0: dtmRelResRubrica.qryRelResumoRubrica.SQL.Add('FROM '+Tabela+' H, PROVDESC PD, CTRLINTERFACE HST ');
         // HISTRUBSAL
         1: dtmRelResRubrica.qryRelResumoRubrica.SQL.Add('FROM '+Tabela+' H, PROVDESC PD, HSTFOLHABENEF HST ');
    end
  else
    case RdoTipoFolha.ItemIndex of
       // PREVIA
       0: dtmRelResRubrica.qryRelResumoRubrica.SQL.Add('FROM '+Tabela+' H, PROVDESC PD, PESSOA P, CTRLINTERFACE HST ');
       // HISTRUBSAL
       1: dtmRelResRubrica.qryRelResumoRubrica.SQL.Add('FROM '+Tabela+' H, PROVDESC PD, PESSOA P, HSTFOLHABENEF HST ');
    end;

  If Not chkConsolidaPlano.Checked Then
    dtmRelResRubrica.qryRelResumoRubrica.SQL.Add(', PLANPREVCONTABIL PL, PLANPREV PP ');

  dtmRelResRubrica.qryRelResumoRubrica.SQL.Add('WHERE ');

  case RdoTipoFolha.ItemIndex of
    // PREVIA
    0: Begin
         If RdoTipoFiltro.ItemIndex = 0 Then
         Begin
           If sLoteouVersaoSel <> '' Then
           Begin
             If pos(',', sLoteouVersaoSel) = 0 Then
               dtmRelResRubrica.qryRelResumoRubrica.SQL.Add(' H.IDLOTE = '+sLoteouVersaoSel+' ')
             Else
               dtmRelResRubrica.qryRelResumoRubrica.SQL.Add(' H.IDLOTE in ('+sLoteouVersaoSel+') ');
           End;
         End
         Else
           dtmRelResRubrica.qryRelResumoRubrica.SQL.Add('	H.MES = ' + QuotedStr(sMesRef));

         dtmRelResRubrica.qryRelResumoRubrica.SQL.Add(' AND HST.IDLOTE = H.IDLOTE ');
       End;
    // HISTRUBSAL
    1: Begin
         If RdoTipoFiltro.ItemIndex = 0 Then
         Begin
           If sLoteouVersaoSel <> '' Then
           Begin
             If pos(',', sLoteouVersaoSel) = 0 Then
               dtmRelResRubrica.qryRelResumoRubrica.SQL.Add(' HST.IDHSTFOLHABENEF = '+sLoteouVersaoSel+' ')
             Else
               dtmRelResRubrica.qryRelResumoRubrica.SQL.Add(' HST.IDHSTFOLHABENEF in ('+sLoteouVersaoSel+') ');
           End;
         End
         Else
           dtmRelResRubrica.qryRelResumoRubrica.SQL.Add('	HST.MESREFERENCIA = ' + QuotedStr(sMesRef));

         dtmRelResRubrica.qryRelResumoRubrica.SQL.Add(' AND HST.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF ');
       End;
  end;

  if dbcmbPatrocinadora.Text <> '' then
    dtmRelResRubrica.qryRelResumoRubrica.sql.add(' AND H.IDPATRO = '+dbcmbPatrocinadora.LookupValue);

  dtmRelResRubrica.qryRelResumoRubrica.sql.add(' AND H.IDPESSJUR = '+IntToStr(iIdFundacao)+' ');

  if dbcmbPlano.Text <> '' then
    dtmRelResRubrica.qryRelResumoRubrica.sql.add(' AND H.IDPLANOCONTABIL = '+ dbcmbPlano.LookupValue);

  if dbcmbPlanoPrev.Text <> '' then
    dtmRelResRubrica.qryRelResumoRubrica.sql.add(' AND H.IDPLANOPREV = '+ dbcmbPlanoPrev.LookupValue);

  if not ChkConsolidar.Checked then // consolidada
    dtmRelResRubrica.qryRelResumoRubrica.sql.add(' AND P.IDPESSOA = H.IDPATRO ');

  If Not chkConsolidaPlano.Checked Then
    dtmRelResRubrica.qryRelResumoRubrica.sql.add(' AND PL.IDPLANOPREV(+) = H.IDPLANOCONTABIL '+
                                                 ' AND PP.IDPLANOPREV    = H.IDPLANOPREV ');

  dtmRelResRubrica.qryRelResumoRubrica.sql.add(' AND PD.IDPROVENTO = H.IDRUBRICA ');

  If RdoTipoFolha.ItemIndex = 1 Then
  Begin
    If Not chkMostraEstornado.Checked Then
      dtmRelResRubrica.qryRelResumoRubrica.sql.add(' AND (H.FLGESTORNO IS NULL OR H.FLGESTORNO = 0) ');
  End;

  If SistemaFolha.FlgUsaCodRubExt = 0 Then
    DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(
    ' GROUP BY PD.IDPROVENTO, PD.DESCRICAO, PD.FLGDESCONTO ')
  Else
    DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(
    ' GROUP BY PD.CODPROVDESC, PD.DESCRPROVDESC, PD.FLGDESCONTO ');

  If Not ChkConsolidar.Checked Then
    DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(', P.NOME ');

  If Not chkConsolidaPlano.Checked Then
    DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(', PP.NOME, PL.NOME ');


  If RdoTipoFolha.ItemIndex = 0 Then
    If ChkConsolidaLoteouVersao.Checked Then
    Begin
      If pos(',', sLoteouVersao) = 0 Then
        DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(', HST.IDLOTE, HST.DESCRICAO ')
    End
    Else
      DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(', HST.IDLOTE, HST.DESCRICAO ')
  Else
    If ChkConsolidaLoteouVersao.Checked Then
    Begin
      If pos(',', sLoteouVersao) = 0 Then
        DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(', HST.IDHSTFOLHABENEF, HST.HISTORICO ')
    End
    Else
      DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(', HST.IDHSTFOLHABENEF, HST.HISTORICO ');

  DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(' ORDER BY ');
  If RdoTipoFolha.ItemIndex = 0 Then
    If ChkConsolidaLoteouVersao.Checked Then
    Begin
      If pos(',', sLoteouVersao) = 0 Then
        DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(' HST.DESCRICAO, ')
    End
    Else
      DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(' HST.DESCRICAO, ')
  Else
    If ChkConsolidaLoteouVersao.Checked Then
    Begin
      If pos(',', sLoteouVersao) = 0 Then
        DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(' HST.HISTORICO, ')
    End
    Else
      DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(' HST.HISTORICO, ');

  If Not ChkConsolidar.Checked Then
    DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(' P.NOME, ');

  If Not chkConsolidaPlano.Checked Then
    DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(' PP.NOME, PL.NOME, '); 

  If SistemaFolha.FlgUsaCodRubExt = 0 Then
    DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(
    ' DECODE(PD.FLGDESCONTO,0,''Provento'',''Desconto'') DESC, PD.IDPROVENTO ')
  Else
    DtmRelResRubrica.qryRelResumoRubrica.Sql.Add(
    ' DECODE(PD.FLGDESCONTO,0,''Provento'',''Desconto'') DESC, PD.CODPROVDESC ');

  Case RdoTipoFolha.ItemIndex of
    0: If RdoTipoFiltro.ItemIndex = 0 Then
       Begin
          If pos(',', sLoteouVersaoSel) = 0 Then
          Begin
            qryPreviaouEfetivada.locate('IDLOTE', sLoteouVersaoSel, []);
            dtmRelResRubrica.qrlblMesRef.caption := qryPreviaouEfetivada.FieldByName('DESCRICAO').AsString
          End
          Else
            dtmRelResRubrica.qrlblMesRef.caption := sLoteouVersaoSel;
       End
       Else
         dtmRelResRubrica.qrlblMesRef.caption := sMesRef;

    1: If RdoTipoFiltro.ItemIndex = 0 Then
       Begin
          If pos(',', sLoteouVersaoSel) = 0 Then
          Begin
            qryPreviaouEfetivada.locate('IDHSTFOLHABENEF', sLoteouVersaoSel, []);
            dtmRelResRubrica.qrlblMesRef.caption := qryPreviaouEfetivada.FieldByName('DESCRICAO').AsString
          End
          Else
            dtmRelResRubrica.qrlblMesRef.caption := sLoteouVersaoSel;
       End
       Else
         dtmRelResRubrica.qrlblMesRef.caption := sMesRef;
  end;

  if dbcmbPlano.text <> ''then
    dtmRelResRubrica.lblPlano.Caption := dbcmbPlano.Text;

end;

procedure TFrmParamRelResRubrica.dbcmbPatrocinadoraChange(Sender: TObject);
begin
  inherited;
  If dbcmbPatrocinadora.Text <> '' Then Begin
    ChkConsolidar.Enabled := False;
    ChkConsolidar.Checked := False;
  End Else
    ChkConsolidar.Enabled := True;
  MontaQryPlano;
  MontaQryPlanoPrev; 
end;

procedure TFrmParamRelResRubrica.ChkLstLoteouVersaoClickCheck(
  Sender: TObject);
begin
  inherited;
  If (RdoTipoFolha.ItemIndex = 0) And (RdoTipoFiltro.ItemIndex = 0) Then
    MontaFiltroCompleto(ChkLstLoteouVersao, ListaLote, sLoteouVersaoSel);

  If (RdoTipoFolha.ItemIndex = 1) And (RdoTipoFiltro.ItemIndex = 0) Then
    MontaFiltroCompleto(ChkLstLoteouVersao, ListaVersao, sLoteouVersaoSel);

  MontaQryPatro;
  MontaQryPlano;
  MontaQryPlanoPrev; 
end;

procedure TFrmParamRelResRubrica.MontaQryPlano;
begin
  qryPlano.Close;
  //Relatório exibido a partir da prévia
  If RdoTipoFolha.ItemIndex = 0 Then
  Begin
    //Relatório exibido a partir da prévia e filtrado pelo idlote
    If RdoTipoFiltro.ItemIndex = 0 Then 
    Begin
      If Trim(sLoteouVersaoSel) <> '' Then
      Begin
        If pos(',', sLoteouVersaoSel) = 0 Then
        Begin
          qryPlano.Sql.Clear;
          qryPlano.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                           'FROM PLANPREVCONTABIL P, PREVIA H ');

          If dbcmbplanoprev.LookupValue <> '' Then
            qryPlano.Sql.Add(', PLANPREV PP ');

          qryPlano.Sql.Add('WHERE P.IDPLANOPREV = H.IDPLANOCONTABIL '+
                           ' AND H.IDLOTE = '+sLoteouVersaoSel);

          If dbcmbplanoprev.LookupValue <> '' Then
            qryPlano.Sql.Add(' AND H.IDPLANOPREV = '+dbcmbplanoprev.LookupValue);

          If dbcmbPatrocinadora.LookupValue <> '' Then
            qryPlano.Sql.Add(' AND H.IDPATRO = '+dbcmbPatrocinadora.LookupValue);

          qryPlano.Sql.Add(' ORDER BY P.NOME ');
        End
        Else
        Begin
          qryPlano.Sql.Clear;
          qryPlano.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                           'FROM PLANPREVCONTABIL P, PREVIA H '+
                           'WHERE P.IDPLANOPREV = H.IDPLANOCONTABIL '+
                            ' AND H.IDLOTE in ('+sLoteouVersaoSel+')');

          If dbcmbPatrocinadora.LookupValue <> '' Then
            qryPlano.Sql.Add(' AND H.IDPATRO = '+dbcmbPatrocinadora.LookupValue);

          qryPlano.Sql.Add(' ORDER BY P.NOME ');
        End;
      End;
    End
    Else
    Begin
      //Relatório exibido a partir da prévia e filtrado pelo mês
      qryPlano.Sql.Clear;
      qryPlano.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                       'FROM PLANPREVCONTABIL P, PREVIA H ');

      If dbcmbplanoprev.LookupValue <> '' Then
        qryPlano.Sql.Add(', PLANPREV PP ');

      qryPlano.Sql.Add('WHERE P.IDPLANOPREV = H.IDPLANOCONTABIL '+
                       ' AND H.MESCOBRANCA = '+QuotedStr(sMesRef));

      If dbcmbplanoprev.LookupValue <> '' Then
        qryPlano.Sql.Add(' AND H.IDPLANOPREV = '+dbcmbplanoprev.LookupValue);

      If dbcmbPatrocinadora.LookupValue <> '' Then
        qryPlano.Sql.Add(' AND H.IDPATRO = '+dbcmbPatrocinadora.LookupValue);

      qryPlano.Sql.Add(' ORDER BY P.NOME ');
    End;
  End
  Else
  Begin
    //Relatório exibido a partir da histrubsal
    If RdoTipoFiltro.ItemIndex = 0 Then 
    Begin
      If Trim(sLoteouVersaoSel) <> '' Then
      Begin
        If pos(',', sLoteouVersaoSel) = 0 Then
        Begin
          qryPlano.Sql.Clear;
          qryPlano.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                           'FROM PLANPREVCONTABIL P, HISTRUBSAL H ');

          If dbcmbplanoprev.LookupValue <> '' Then
            qryPlano.Sql.Add(', PLANPREV PP ');

          qryPlano.Sql.Add('WHERE P.IDPLANOPREV = H.IDPLANOCONTABIL '+
                           ' AND H.IDHSTFOLHABENEF = '+sLoteouVersaoSel);

          If dbcmbplanoprev.LookupValue <> '' Then
            qryPlano.Sql.Add(' AND H.IDPLANOPREV = '+dbcmbplanoprev.LookupValue);

          If dbcmbPatrocinadora.LookupValue <> '' Then
            qryPlano.Sql.Add(' AND H.IDPATRO = '+dbcmbPatrocinadora.LookupValue);

          qryPlano.Sql.Add(' ORDER BY P.NOME ');
        End
        Else
        Begin
          qryPlano.Sql.Clear;
          qryPlano.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                           'FROM PLANPREVCONTABIL P, HISTRUBSAL H '+
                           'WHERE P.IDPLANOPREV = H.IDPLANOCONTABIL '+
                            ' AND H.IDHSTFOLHABENEF in ('+sLoteouVersaoSel+')');

          If dbcmbPatrocinadora.LookupValue <> '' Then
            qryPlano.Sql.Add(' AND H.IDPATRO = '+dbcmbPatrocinadora.LookupValue);

          qryPlano.Sql.Add(' ORDER BY P.NOME ');
        End;
      End;
    End
    Else
    Begin
      //Relatório exibido a partir da histrubsal e filtrado pelo mês
      qryPlano.Sql.Clear;
      qryPlano.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                       'FROM PLANPREVCONTABIL P, HISTRUBSAL H ');

      If dbcmbplanoprev.LookupValue <> '' Then
        qryPlano.Sql.Add(', PLANPREV PP ');

      qryPlano.Sql.Add('WHERE P.IDPLANOPREV = H.IDPLANOCONTABIL '+
                       ' AND H.MESCOBRANCA = '+QuotedStr(sMesRef));

      If dbcmbplanoprev.LookupValue <> '' Then
        qryPlano.Sql.Add(' AND H.IDPLANOPREV = '+dbcmbplanoprev.LookupValue);

      If dbcmbPatrocinadora.LookupValue <> '' Then
        qryPlano.Sql.Add(' AND H.IDPATRO = '+dbcmbPatrocinadora.LookupValue);

      qryPlano.Sql.Add(' ORDER BY P.NOME ');
    End;
  End;
  qryPlano.Open;
end;

procedure TFrmParamRelResRubrica.MontaQryPlanoPrev;
begin
  qryPlanoPrev.Close;
  //Relatório exibido a partir da prévia
  If RdoTipoFolha.ItemIndex = 0 Then
  Begin
    //Relatório exibido a partir da prévia e filtrado pelo idlote
    If Trim(sLoteouVersaoSel) <> '' Then
    Begin
      //Testa se foi escolhido só um lote
      If pos(',', sLoteouVersaoSel) = 0 Then
      Begin
        qryPlanoPrev.Sql.Clear;
        qryPlanoPrev.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                             'FROM PLANPREV P, PREVIA H '+
                             'WHERE P.IDPLANOPREV = H.IDPLANOPREV '+
                              ' AND H.IDLOTE = '+sLoteouVersaoSel);

        If dbcmbPatrocinadora.LookupValue <> '' Then
          qryPlanoPrev.Sql.Add(' AND H.IDPATRO = '+dbcmbPatrocinadora.LookupValue);

        qryPlanoPrev.Sql.Add(' ORDER BY P.NOME ');
      End
      Else
      Begin
        qryPlanoPrev.Sql.Clear;
        qryPlanoPrev.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                             'FROM PLANPREV P, PREVIA H '+
                             'WHERE P.IDPLANOPREV = H.IDPLANOPREV '+
                              ' AND H.IDLOTE in ('+sLoteouVersaoSel+')');

        If dbcmbPatrocinadora.LookupValue <> '' Then
          qryPlanoPrev.Sql.Add(' AND H.IDPATRO = '+dbcmbPatrocinadora.LookupValue);

        qryPlanoPrev.Sql.Add(' ORDER BY P.NOME ');
      End;
    End
    Else
    Begin
      qryPlanoPrev.Sql.Clear;
      qryPlanoPrev.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                           'FROM PLANPREV P, PREVIA H '+
                           'WHERE P.IDPLANOPREV = H.IDPLANOPREV '+
                            ' AND H.MESCOBRANCA = '+QuotedStr(sMesRef));

      If dbcmbPatrocinadora.LookupValue <> '' Then
        qryPlanoPrev.Sql.Add(' AND H.IDPATRO = '+dbcmbPatrocinadora.LookupValue);

      qryPlanoPrev.Sql.Add(' ORDER BY P.NOME ');
    End;
  End
  Else
  Begin
    //Relatório exibido a partir da histrubsal e filtrado pelo idhstfolhabenef
    If Trim(sLoteouVersaoSel) <> '' Then
    Begin
      If pos(',', sLoteouVersaoSel) = 0 Then
      Begin
        qryPlanoPrev.Sql.Clear;
        qryPlanoPrev.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                             'FROM PLANPREV P, HISTRUBSAL H '+
                             'WHERE P.IDPLANOPREV = H.IDPLANOPREV '+
                              ' AND H.IDHSTFOLHABENEF = '+sLoteouVersaoSel);

        If dbcmbPatrocinadora.LookupValue <> '' Then
          qryPlanoPrev.Sql.Add(' AND H.IDPATRO = '+dbcmbPatrocinadora.LookupValue);

        qryPlanoPrev.Sql.Add(' ORDER BY P.NOME ');
      End
      Else
      Begin
        qryPlanoPrev.Sql.Clear;
        qryPlanoPrev.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                             'FROM PLANPREV P, HISTRUBSAL H '+
                             'WHERE P.IDPLANOPREV = H.IDPLANOPREV '+
                              ' AND H.IDHSTFOLHABENEF in ('+sLoteouVersaoSel+')');

        If dbcmbPatrocinadora.LookupValue <> '' Then
          qryPlanoPrev.Sql.Add(' AND H.IDPATRO = '+dbcmbPatrocinadora.LookupValue);

        qryPlanoPrev.Sql.Add(' ORDER BY P.NOME ');
      End;
    End
    Else
    Begin
      qryPlanoPrev.Sql.Clear;
      qryPlanoPrev.Sql.Add('SELECT DISTINCT P.IDPLANOPREV, P.NOME '+
                           'FROM PLANPREV P, HISTRUBSAL H '+
                           'WHERE P.IDPLANOPREV = H.IDPLANOPREV '+
                            ' AND H.MESCOBRANCA = '+QuotedStr(sMesRef));

      If dbcmbPatrocinadora.LookupValue <> '' Then
        qryPlanoPrev.Sql.Add(' AND H.IDPATRO = '+dbcmbPatrocinadora.LookupValue);

      qryPlanoPrev.Sql.Add(' ORDER BY P.NOME ');
    End;
  End;
  qryPlanoPrev.Open;
end;

procedure TFrmParamRelResRubrica.dbcmbPlanoPrevChange(Sender: TObject);
begin
  inherited;
  If (dbcmbPlanoPrev.Text <> '') or (dbcmbPlano.Text <> '') Then
  Begin
    ChkConsolidaPlano.Enabled := False;
    ChkConsolidaPlano.Checked := False;
  End
  Else
    ChkConsolidaPlano.Enabled := True;
  MontaQryPlano;
end;

procedure TFrmParamRelResRubrica.dbcmbPlanoChange(Sender: TObject);
begin
  inherited;
  If (dbcmbPlanoPrev.Text <> '') or (dbcmbPlano.Text <> '') Then
  Begin
    ChkConsolidaPlano.Enabled := False;
    ChkConsolidaPlano.Checked := False;
  End
  Else
    ChkConsolidaPlano.Enabled := True;
end;

procedure TFrmParamRelResRubrica.MontaQryPatro;
begin
  If RdoTipoFolha.ItemIndex = 0 Then
  Begin
    If Trim(sLoteouVersaoSel) <> '' Then
    Begin
      qryPatro.close;
      If pos(',', sLoteouVersaoSel) = 0 Then
      Begin
        qryPatro.SQL.Clear;
        qryPatro.SQL.Add('SELECT DISTINCT P.IDPESSOA, P.NOME '+
                         'FROM PESSOA P, PATRO PT, PREVIA H '+
                         'WHERE (PT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+
                          ' AND (P.IDPESSOA = PT.IDPESSOA) '+
                          ' AND (P.IDPESSOA = H.IDPATRO) '+
                          ' AND (H.IDLOTE = '+sLoteouVersaoSel+') '+
                         'ORDER BY P.NOME ');
      End
      Else
      Begin
        qryPatro.SQL.Clear;
        qryPatro.SQL.Add('SELECT DISTINCT P.IDPESSOA, P.NOME '+
                         'FROM PESSOA P, PATRO PT, PREVIA H '+
                         'WHERE (PT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+
                          ' AND (P.IDPESSOA = PT.IDPESSOA) '+
                          ' AND (P.IDPESSOA = H.IDPATRO) '+
                          ' AND (H.IDLOTE IN ('+sLoteouVersaoSel+')) '+
                         'ORDER BY P.NOME ');
      End;
    End
    Else
    Begin
      qryPatro.SQL.Clear;
      qryPatro.SQL.Add('SELECT DISTINCT P.IDPESSOA, P.NOME '+
                       'FROM PESSOA P, PATRO PT, PREVIA H '+
                       'WHERE (PT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+
                        ' AND (P.IDPESSOA = PT.IDPESSOA) '+
                        ' AND (P.IDPESSOA = H.IDPATRO) '+
                        ' AND (H.MESCOBRANCA = '+QuotedStr(sMesRef)+') '+
                       'ORDER BY P.NOME ');
    End;
  End
  Else
  Begin
    If Trim(sLoteouVersaoSel) <> '' Then
    Begin
      qryPatro.close;
      If pos(',', sLoteouVersaoSel) = 0 Then
      Begin
        qryPatro.SQL.Clear;
        qryPatro.SQL.Add('SELECT DISTINCT P.IDPESSOA, P.NOME '+
                         'FROM PESSOA P, PATRO PT, HISTRUBSAL H '+
                         'WHERE (PT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+
                          ' AND (P.IDPESSOA = PT.IDPESSOA) '+
                          ' AND (P.IDPESSOA = H.IDPATRO) '+
                          ' AND (H.IDHSTFOLHABENEF = '+sLoteouVersaoSel+') '+
                         'ORDER BY P.NOME ');
      End
      Else
      Begin
        qryPatro.SQL.Clear;
        qryPatro.SQL.Add('SELECT DISTINCT P.IDPESSOA, P.NOME '+
                         'FROM PESSOA P, PATRO PT, HISTRUBSAL H '+
                         'WHERE (PT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+
                          ' AND (P.IDPESSOA = PT.IDPESSOA) '+
                          ' AND (P.IDPESSOA = H.IDPATRO) '+
                          ' AND (H.IDHSTFOLHABENEF IN ('+sLoteouVersaoSel+')) '+
                         'ORDER BY P.NOME ');
      End;
    End
    Else
    Begin
      qryPatro.SQL.Clear;
      qryPatro.SQL.Add('SELECT DISTINCT P.IDPESSOA, P.NOME '+
                       'FROM PESSOA P, PATRO PT, HISTRUBSAL H '+
                       'WHERE (PT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+
                        ' AND (P.IDPESSOA = PT.IDPESSOA) '+
                        ' AND (P.IDPESSOA = H.IDPATRO) '+
                        ' AND (H.MESCOBRANCA = '+QuotedStr(sMesRef)+') '+
                       'ORDER BY P.NOME ');
    End;
  End;
  qryPatro.open;
end;

procedure TFrmParamRelResRubrica.CmbMesChange(Sender: TObject);
begin
  inherited;
  if (cmbMes.ItemIndex+1) > 9 then
    sMesRef := IntToStr(spnedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1)
  else
    sMesRef := IntToStr(spnedAno.Value)+'/0'+IntToStr(cmbMes.ItemIndex+1);

  MontaQryPatro;
  MontaQryPlanoPrev;
  MontaQryPlano;  
end;

end.
{------------------------------------------------------------------------------|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
| RELAÇÃO DE RUBRICAS PROCESSADAS NA PREVIA, OU EFETIVADAS EM VERSÃO DE PAGA-  |
| MENTO. OPÇÃO POR LOTE (PREVIA), VERSÃO (EFETIVADA) OU MÊS. ALÉM DE FILTROS   |
| PARA PATRO, PLANO E CONSOLIDAÇÃO.                                            |
| NUMREPORT:2016                                                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 30/07/2002 A 30/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Foi colocada mais a tabela HSTFOLHABENEF, para ajudar no filtro do      |
|    relatório.                                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/09/2002 A 03/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Foi trocado o componente dblookupCombo por um CheckListBox, tornando     |
|   possível a escolha de mais de uma versão ou mais de um lote.               |
|                                                                              |
|   - Também foi alterado o caption do componente qrlblMesRef, que recebia o   |
|   nome do lote ou da versão, agora estão recebendo os números dos lotes ou   |
|   das versões escolhidas pelo usuário.                                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/07/2003 A 11/07/2003                         |
| PENDÊNCIA: 14519                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA MULTIFUNDACAO.                                                |
|                                                                              |
|------------------------------------------------------------------------------}

