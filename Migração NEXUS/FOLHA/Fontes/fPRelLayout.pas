unit fPRelLayout;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)  : Paulo Ramos
// Rotina    : Ajuste em querys
// Data      : 15/01/2007
// Pendencia : 18554
// Alteração : Tratar o campo SITENVIO como CHAR, colocando plics quando
//   necessário.
//-----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin, usistema,
  dbasedados, uConstFolha;

type
  TfrmPRelLayout = class(TfrmOkCancelar)
    qryLayout: TwwQuery;
    GroupBox1: TGroupBox;
    dblkpLayout: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    cboxMes: TComboBox;
    seAno: TSpinEdit;
    GroupBox3: TGroupBox;
    dblkpRubrica: TwwDBLookupCombo;
    qryRubricas: TwwQuery;
    qryLayoutIDLAYOUT: TFloatField;
    qryLayoutDESCRICAO: TStringField;
    qryHistorico: TwwQuery;
    grpTipo: TRadioGroup;
    gboxHist: TGroupBox;
    blkcmpHistorico: TwwDBLookupCombo;
    qryCtrlInterface: TwwQuery;
    rgOrigem: TRadioGroup;
    qryLayoutFLGTIPOCONVENIO: TFloatField;
    rgTipoRegistro: TRadioGroup;
    chkAbono: TCheckBox;
    qryRubricasIDRUBRICA: TFloatField;
    qryRubricasDESCRICAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkpLayoutCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure grpTipoClick(Sender: TObject);
    procedure rgOrigemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkAbonoClick(Sender: TObject);
    procedure seAnoExit(Sender: TObject);
    procedure cboxMesExit(Sender: TObject);
  private
    { Private declarations }
    Mes: String;
    MesAbono, MesCob: String;
    bAvulso: Boolean; // tipo de convênio = {avulso|continuado}
    Procedure MontaQryImportados;
    Procedure MontaQryProcessados;
    procedure ProcessaQryRubrica;  
  public
    { Public declarations }
  end;

var
  frmPRelLayout: TfrmPRelLayout;

implementation

uses UDataBase, dRelFolha, fAguarde, uObjFolha, uMensErro;

{$R *.DFM}

procedure TfrmPRelLayout.FormCreate(Sender: TObject);
var
  Dia,
  Mes,
  Ano  : Word;
begin
Inherited;
  DecodeDate(Now,Ano,Mes,Dia);
  cboxMes.ItemIndex := Mes - 1;
  seAno.Value := Ano;
  qryLayout.open;
  qryHistorico.Open;
  grpTipo.OnClick(Self);
end;

procedure TfrmPRelLayout.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  If chkAbono.Checked Then
    MesAbono := seAno.Text+'/13'
  else
  begin
    If cboxMes.ItemIndex > 8 Then
      MesAbono := seAno.Text+'/'+IntToStr(cboxMes.ItemIndex + 1)
    Else
      MesAbono := seAno.Text+'/0'+IntToStr(cboxMes.ItemIndex + 1);
  end;

  {SE NÃO FOR ESCOLHIDO O HISTÓRICO DA FOLHA, LISTA A RELAÇÃO DE
  CONVÊNIOS IMPORTADOS NAQUELE ANO/MÊS. }

  if cboxMes.Text = '' then
  begin
    MessageDlg('É necessário informar o Mês de referência.', mtInformation, [mbOk],0);
    ModalResult := mrNone;
    exit;
  end;
  if dblkpRubrica.LookupValue = '' then
  begin
    MessageDlg('É necessário informar uma Rubrica.', mtInformation, [mbOk],0);
    ModalResult := mrNone;
    exit;
  end;

  if (grptipo.ItemIndex = 1) and (rgOrigem.ItemIndex=0) and
     (blkcmpHistorico.Text = '')  then
  begin
    MessageDlg('É necessário selecionar um Histórico.', mtInformation, [mbOk],0);
    ModalResult := mrNone;
    exit;
  end;

  if (cboxMes.ItemIndex + 1) <= 9 then
    Mes := '0'+IntToStr((cboxMes.ItemIndex + 1))
  else Mes := IntToStr((cboxMes.ItemIndex + 1));

  // Monta duas query pra cada tipo
  if grpTipo.ItemIndex = 0 then
    MontaQryImportados
  else MontaQryProcessados;
  dtmRelFolha.lblDescricao.Caption := 'Relatório de '+grpTipo.Items.Strings[grpTipo.ItemIndex];
  dtmRelFolha.lblMesRef.Caption    := MesAbono;
  dtmRelFolha.lblRubrica.Caption   := dblkpRubrica.Text;
end;

procedure TfrmPRelLayout.ProcessaQryRubrica;
var lssql: string;
    lsmespag, lsmesref: string;
begin
  if cboxMes.ItemIndex > 8 then
    lsmespag:=seAno.Text+'/'+IntToStr(cboxMes.ItemIndex + 1)
  else
    lsmespag:=seAno.Text+'/0'+IntToStr(cboxMes.ItemIndex + 1);

  if chkAbono.Checked then
    lsmesref:=seAno.Text+'/13'
  else
    lsmesref:=lsmespag;

  if SistemaFolha.FlgUsaCodRubExt = 0 Then
    lssql:=
      'SELECT G.IDRUBRICA, PD.DESCRPROVDESC AS DESCRICAO '+_clinefeed
  else
    lssql:=
      'SELECT G.IDRUBRICA, PD.DESCRICAO '+_clinefeed;

  lssql:=lssql+
    'FROM PROVDESC PD, ( '+_clinefeed+
    '  SELECT IDRUBRICA '+_clinefeed+
    '  FROM LAYOUTXCOLUNAS '+_clinefeed+
    '  WHERE IDLAYOUT = '+inttostr(qrylayoutidlayout.asinteger)+' '+_clinefeed+
    '  UNION '+_clinefeed+
    '  SELECT DISTINCT T.IDPROVENTO AS IDRUBRICA '+_clinefeed+
    '  FROM TMPDESC T, LAYOUTXCOLUNAS LC '+_clinefeed+
    '  WHERE T.MESCOBRANCA = '+quotedstr(lsmespag)+' '+_clinefeed+
    '  AND T.MESREFERENCIA = '+quotedstr(lsmesref)+' '+_clinefeed+
    '  AND T.IDFAVORECIDO = LC.IDFAVORECIDO '+_clinefeed+
    '  AND LC.IDLAYOUT = '+inttostr(qrylayoutidlayout.asinteger)+' '+_clinefeed+
    '  ) G '+_clinefeed+
    'WHERE PD.IDPROVENTO = G.IDRUBRICA '+_clinefeed+
    'ORDER BY PD.DESCRICAO '+_clinefeed;

  qryRubricas.close;
  qryRubricas.sql.clear;
  qryRubricas.sql.add(lssql);
  qryRubricas.Open;
  dblkpRubrica.Enabled:=not qryRubricas.isempty;
end;

procedure TfrmPRelLayout.dblkpLayoutCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  ProcessaQryRubrica;
end;

procedure TfrmPRelLayout.grpTipoClick(Sender: TObject);
begin
  inherited;
  gboxHist.Enabled := (grpTipo.ItemIndex = 0) or
                      ((grpTipo.ItemIndex = 1) and (rgOrigem.ItemIndex = 0));
  rgOrigem.Enabled := grpTipo.ItemIndex = 1;
end;

procedure TfrmPRelLayout.MontaQryImportados;
begin
  dtmrelFolha.qryRelLayout.Sql.Clear;
  bAvulso := true;
  if bAvulso then
  begin
    dtmrelFolha.qryRelLayout.Sql.Add(
      'SELECT PPP.INSCRICAONUMERO, E.MATRICULA, P.NOME, T.VALOR               '+
      'FROM TMPDESC T, PESSOA P, PARTPREVPLAN PPP, ELEGPATRO E              '+
      'WHERE (T.MESCOBRANCA = '+QuotedStr(IntToStr(seAno.value)+'/'+Mes)+') ');

    If chkAbono.Checked Then
      dtmrelFolha.qryRelLayout.Sql.Add(' AND (T.MESREFERENCIA = '+QuotedStr(MesAbono)+') ');

    dtmrelFolha.qryRelLayout.Sql.Add(
      'AND (T.IDPROVENTO = '+qryRubricasIDRUBRICA.AsString+')               '+
      'AND (P.IDPESSOA = T.IDPESSOA)                                        '+
      'AND (PPP.IDPESSOA = T.IDTITULAR)                                        '+
      'AND (E.IDPESSOA = T.IDTITULAR)                                        '+
      'AND (PPP.FLGDESATIVADO = 0)                                           '+
      'ORDER BY T.INSCRICAONUMERO                                           ');
  end else
  begin // continuado
    dtmrelFolha.qryRelLayout.Sql.Add(
      ' SELECT    '+
      '   PPP.INSCRICAONUMERO,    '+
      '   E.MATRICULA,    '+
      '   BEN.NOME FAVORECIDO,    '+
      '   TIT.NOME TITULAR,   '+
      '   RI.VALORRUBRICA     '+
      ' FROM      '+
      '   RUBRICAINDIV RI,        '+
      '   PROVDESC PD,        '+
      '   PARTPREVPLAN PPP,       '+
      '   ELEGPATRO E,        '+
      '   PESSOA BEN,     '+
      '   PESSOA TIT      '+
      ' WHERE (RI.IDPESSOA = 1262638)     '+
      ' AND (RI.IDEMPRESA = 2)        '+
      ' AND (RI.FLGTPRUBMANUT = ''1'')      '+
      ' AND (PD.IDPROVENTO = RI.IDRUBRICA)        '+
      ' AND ((TO_CHAR(RI.DATAFINAL,''YYYY/MM'') >= ''0'') OR (RI.DATAFINAL IS NULL))      '+
      ' AND ((TO_CHAR(RI.DATAINICIO,''YYYY/MM'') <= ''0'') OR (RI.DATAINICIO IS NULL))        '+
      ' AND PPP.IDPESSOA(+) = RI.IDTITULAR        '+
      ' AND E.IDPESSOA(+) = RI.IDTITULAR      '+
      ' AND BEN.IDPESSOA = RI.IDPESSOA        '+
      ' AND TIT.IDPESSOA(+) = RI.IDTITULAR    '+
      ' AND PPP.FLGDESATIVADO = 0                 ');
  end;
end;

procedure TfrmPRelLayout.MontaQryProcessados;
Var
  sSql, sIdLote : string;

begin
  sIdLote := '';

  // Para os Não Efetivados é necessários saber o IDLOTE.
  with qryCtrlInterface do
  begin
    Close;
    Prepare;
    if grpTipo.ItemIndex = 0 then
      ParamByName('MESCOBRANCA').AsString := IntToStr(seAno.value)+'/'+Mes
    else // se for NÃO EFETIVADOS pega o mesreferencia do histórico
      if rgorigem.ItemIndex = 0 then
        ParamByName('MESCOBRANCA').AsString := qryHistorico.FieldByName('MESREFERENCIA').AsString
      else ParamByName('MESCOBRANCA').AsString := IntToStr(seAno.value)+'/'+Mes;
    ParamByName('IDPROVENTO').AsInteger :=  qryRubricasIDRUBRICA.AsInteger;
    Open;
    if IsEmpty then
    begin
      ShowMessage('Não há Importação do Convênio selecionada neste mês referência.');
      ModalResult := mrNone;
      Exit;
    end;
  end;

  qryCtrlInterface.First;
  While Not qryCtrlInterface.Eof Do
  Begin
    sIdLote := sIdLote + qryCtrlInterface.FieldByName('IDLOTE').AsString+',';
    qryCtrlInterface.Next;
  End;

  If sIdLote <> '' Then
    sIdLote := Copy(sIdLote, 1, Length(sIdLote)-1);

  dtmrelFolha.qryRelLayout.Sql.Clear;
  if rgOrigem.ItemIndex = 0 then
  begin
    If chkAbono.Checked Then
    Begin
      ssql:='SELECT PPP.INSCRICAONUMERO, E.MATRICULA, P.NOME, T.VALOR, T.VALORRECEBIDO '+
            'FROM  TMPDESC T, PESSOA P, PARTPREVPLAN PPP, ELEGPATRO E '+
            'WHERE T.IDLOTE IN ('+sIdLote+') '+
            'AND T.MESREFERENCIA = '+QuotedStr(MesAbono)+' '+
            'AND T.IDPROVENTO = '+inttostr(qryRubricasIDRUBRICA.AsInteger)+' ';
      case rgTipoRegistro.itemindex of
        1 : ssql:=ssql+'AND T.SITENVIO IN (''1'',''2'') ';
        2 : ssql:=ssql+'AND T.SITENVIO = ''0'' ';
      end;
      ssql:=ssql+'AND P.IDPESSOA = T.IDPESSOA '+
                 'AND PPP.IDPESSOA = T.IDTITULAR '+
                 'AND E.IDPESSOA = T.IDTITULAR '+
                 'AND PPP.FLGDESATIVADO = 0 ';
      dtmrelFolha.qryRelLayout.Sql.Add(ssql);
    End
    Else
    Begin
      ssql:='SELECT PPP.INSCRICAONUMERO, E.MATRICULA, P.NOME, T.VALOR, T.VALORRECEBIDO '+
            'FROM  TMPDESC T, PESSOA P, PARTPREVPLAN PPP, ELEGPATRO E '+
            'WHERE T.IDLOTE IN ('+sIdLote+') '+
            'AND SUBSTR(T.MESREFERENCIA, 6, 2) <> ''13'' '+
            'AND T.IDPROVENTO = '+inttostr(qryRubricasIDRUBRICA.AsInteger)+' ';
      case rgTipoRegistro.itemindex of
        1 : ssql:=ssql+'AND T.SITENVIO IN (''1'',''2'') ';
        2 : ssql:=ssql+'AND T.SITENVIO = ''0'' ';
      end;
      ssql:=ssql+'AND P.IDPESSOA = T.IDPESSOA '+
                 'AND PPP.IDPESSOA = T.IDTITULAR '+
                 'AND E.IDPESSOA = T.IDTITULAR '+
                 'AND PPP.FLGDESATIVADO = 0 ';
      dtmrelFolha.qryRelLayout.Sql.Add(ssql);
    End;
  end
  else
  begin // PREVIA
    If chkAbono.Checked Then
    Begin
      dtmrelFolha.qryRelLayout.Sql.Add(
        'SELECT PP.INSCRICAONUMERO, EL.MATRICULA,             '+
        '	 P.NOME, TD.VALOR                                   '+
        'FROM TMPDESC TD, PARTPREVPLAN PP, ELEGPATRO EL, PESSOA P   '+
        'WHERE TD.IDLOTE IN ('+sIdLote+') '+
        ' AND TD.MESREFERENCIA = '+QuotedStr(MesAbono)+' '+
        '  AND TD.IDTITULAR NOT IN (                          '+
        '	SELECT IDTITULAR FROM PREVIA                        '+
        '			WHERE MESCOBRANCA = '+QuotedStr(IntToStr(seAno.value)+'/'+Mes)+'       '+
        '			AND IDRUBRICA = '+qryRubricasIDRUBRICA.AsString+') '+
        'AND PP.IDPESSOA = TD.IDTITULAR                       '+
        'AND EL.IDPESSOA = TD.IDTITULAR                       '+
        'AND P.IDPESSOA  = TD.IDTITULAR                       '+
        'AND PP.FLGDESATIVADO = 0                            ');
    End
    Else
    Begin
      dtmrelFolha.qryRelLayout.Sql.Add(
        'SELECT PP.INSCRICAONUMERO, EL.MATRICULA,             '+
        '	 P.NOME, TD.VALOR                                   '+
        'FROM TMPDESC TD, PARTPREVPLAN PP, ELEGPATRO EL, PESSOA P   '+
        'WHERE TD.IDLOTE = '+qryCtrlInterface.FieldByName('IDLOTE').AsString+'   '+
        '  AND TD.IDTITULAR NOT IN (                          '+
        '	SELECT IDTITULAR FROM PREVIA                        '+
        '			WHERE MESCOBRANCA = '+QuotedStr(IntToStr(seAno.value)+'/'+Mes)+'       '+
        '			AND IDRUBRICA = '+qryRubricasIDRUBRICA.AsString+') '+
        'AND PP.IDPESSOA = TD.IDTITULAR                       '+
        'AND EL.IDPESSOA = TD.IDTITULAR                       '+
        'AND P.IDPESSOA  = TD.IDTITULAR                       '+
        'AND PP.FLGDESATIVADO = 0                            ');
    End;
  end;
end;

procedure TfrmPRelLayout.rgOrigemClick(Sender: TObject);
begin
  inherited;
  gboxHist.Enabled := rgOrigem.ItemIndex = 0;
end;

procedure TfrmPRelLayout.FormShow(Sender: TObject);
begin
  inherited;
  MesAbono := '9999/99';
  qryRubricas.Sql.Clear;
  If SistemaFolha.FlgUsaCodRubExt = 0 Then
    qryRubricas.Sql.Add(
    ' SELECT LC.IDRUBRICA, LC.IDRUBRICA||'' - ''||PD.DESCRICAO AS DESCRICAO ')
  Else
    qryRubricas.Sql.Add(
    ' SELECT LC.IDRUBRICA, PD.CODPROVDESC||'' - ''||PD.DESCRPROVDESC AS DESCRICAO ');

  qryRubricas.Sql.Add(
  (* FROM *)
  ' FROM LAYOUTXCOLUNAS LC, PROVDESC PD '+

  (* WHERE *)
  ' WHERE (LC.IDLAYOUT = :IDLAYOUT) AND (PD.IDPROVENTO 	= LC.IDRUBRICA) ');
end;

procedure TfrmPRelLayout.chkAbonoClick(Sender: TObject);
Var
  qryTmp : Twwquery;

begin
  inherited;

  If cboxMes.ItemIndex > 8 Then
    MesCob := seAno.Text+'/'+IntToStr(cboxMes.ItemIndex + 1)
  Else
    MesCob := seAno.Text+'/0'+IntToStr(cboxMes.ItemIndex + 1);

  If chkAbono.Checked Then
  Begin
    qryTmp:=TwwQuery.Create(Application);
    qryTmp.DatabaseName:='BaseDados';
    qryTmp.Close;
    qryTmp.Sql.Clear;

    If FazQuery(qryTmp,
       ' SELECT DISTINCT MESREFERENCIA '+
       ' FROM TMPDESC WHERE MESCOBRANCA = '+QuotedStr(MesCob)+
       ' AND SUBSTR(MESREFERENCIA, 6, 2) = ''13''') Then
    Begin
      MesAbono := qryTmp.Fields[0].AsString;
      qryTmp.Close;
      qryTmp.Free;
    End
    Else
    Begin
      MsgDlg('Não existe lote de abono para o mês de cobrança selecionado.','Informação',
             mtInformation, [mbOK], 0);
      chkAbono.Checked := False;
      ModalResult      := MrNone;
      Exit;
    End;
  End;

  ProcessaQryRubrica;  
end;

procedure TfrmPRelLayout.seAnoExit(Sender: TObject);
begin
  inherited;
  ProcessaQryRubrica;  
end;

procedure TfrmPRelLayout.cboxMesExit(Sender: TObject);
begin
  inherited;
  ProcessaQryRubrica;  
end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/07/2002 A 22/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Foi colocado o filtro flgdesativado = 0, para trazer somente os planos  |
|    em atividade.                                                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 01/08/2003 A 01/08/2003                         |
| VERSÃO PARA LIBERAÇÃO: 3.04.00d                                              |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Foi colocado o campo mesreferencia na qryhistorico, pois estava passan_ |
|    do esse campo que não existia na mesma.                                   |
|                                                                              |
|==============================================================================}
