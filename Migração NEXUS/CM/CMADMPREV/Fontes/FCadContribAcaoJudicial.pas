unit FCadContribAcaoJudicial;

//------------------------------------------------------------------------------
//N. Solicitação: WO8602
//Dt Alteração..: 05/06/2024
//Responsável...: Luis Ferrari
//Descrição.....: Readequação do rateio e Importação de planilha Excel com o rateio por planos de benefícios dos imóveis da FUNCEF.
//------------------------------------------------------------------------------
// Alteração  : inclusao da funcionalidade
// Autor(a)   : Edilaine Ferraresi
// Data       : 30/01/2017
// SIG        : 36752
// Descricao  : Equacionamento - cadastro de ação judicial para contribuicao
//------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, Db, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  TREdit, wwdbedit, Mask, DBCtrls, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, FCadastroGridOpcCS, UImportaArquivoNovo;  //WO8602

type
  TfrmCadContribAcaoJudicial = class(TFrmCadastroGridOpcCS)
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    lblMotivo: TLabel;
    lblObs: TLabel;
    lblPerc: TLabel;
    dpdbDtIniAcao: TCMDateTimePicker;
    dpdbDtFimAcao: TCMDateTimePicker;
    dblkMotivo: TwwDBLookupCombo;
    edbPercentual: TDBEdit;
    edbObservacao: TwwDBEdit;
    rgTipoAcao: TRadioGroup;
    qryAux: TwwQuery;
    qryMotivo: TwwQuery;
    qryValida: TwwQuery;
    updValida: TUpdateSQL;
    dsValida: TDataSource;
    updPart: TUpdateSQL;
    procedure sbtnApagarClick(Sender: TObject);
    procedure edbPercentualKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnInserirClick(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    bClickNoOKCancel  : boolean;
    bClickNoSair      : boolean;

    procedure TrataVigenciaAcaoJudicial(sAnoMesIni : string);
    procedure AbreArquivo(Tipo : TTipoAcao);
    procedure PreencheSQL(Tipo : TTipoAcao);
    function  VerificaAcaoJudicialVigente(var sVigencia : string; var iIdVigente : integer) : boolean;
    function  VerificaExisteAnoMesCadastrado(var iIdAcao : integer) : boolean;
    function  VerificaDataIniIntervaloValido : boolean;

  public
    { Public declarations }
    iIDContribuicao   : integer;
    iIDNucleoFamiliar : integer;
    iIdPessoa    : integer;
    iIdPessJur   : integer;
    iIdPlanoPrev : integer;
    sNomeTabela  : string;
    TipoAcao     : TTipoAcao;

  end;

var
  frmCadContribAcaoJudicial: TfrmCadContribAcaoJudicial;

  function CadastraAcaoJudicial(pIDContribuicao, pIDNucleoFamiliar : integer) : TModalResult;  overload;

  function CadastraAcaoJudicial(pIDContribuicao, pIdPessoa, pIdPessJur, pIdPlanoPrev : integer) : TModalResult;  overload;

implementation

uses UAdmPrev, UMensErro, UDataBase, Usistema, uCMTypes, DBaseDados, UFuncoesUteis;

{$R *.DFM}


function CadastraAcaoJudicial(pIDContribuicao, pIDNucleoFamiliar : integer) : TModalResult;
begin
  Application.CreateForm(TfrmCadContribAcaoJudicial, frmCadContribAcaoJudicial);

  with frmCadContribAcaoJudicial do
  begin
    iIDContribuicao   := pIDContribuicao;
    iIDNucleoFamiliar := pIDNucleoFamiliar;
    dbGrd.BringToFront;
    Visible := false;
    bGravaDados  := false;    // os dados deverão ser gravados pela funcionalidade que chamou
    bExibeMsgExc := false;
    TipoAcao    := taPensionista;
    sNomeTabela := 'CONTRIBNUCLEOACJUDDEFICIT';
    PreencheSQL(taPensionista);
    AbreArquivo(taPensionista);
    Result := ShowModal;
  end;

  frmCadContribAcaoJudicial.Free;
end;


function CadastraAcaoJudicial(pIDContribuicao, pIdPessoa, pIdPessJur, pIdPlanoPrev : integer) : TModalResult;  overload;
begin
  Application.CreateForm(TfrmCadContribAcaoJudicial, frmCadContribAcaoJudicial);

  with frmCadContribAcaoJudicial do
  begin
    iIDContribuicao := pIDContribuicao;
    iIdPessoa       := pIdpessoa;
    iIdPessJur      := pIdPessJur;
    iIdPlanoPrev    := pIdPlanoPrev;
    dbGrd.BringToFront;
    Visible := false;
    bGravaDados      := false;    // os dados deverão ser gravados pela funcionalidade que chamou
    bExibeMsgExc     := false;
    QRY.UpdateObject := updPart;
    TipoAcao         := taParticipante;
    sNomeTabela      := 'CONTRIBPARTPACJUDDEFICIT';
    PreencheSQL(taParticipante);
    AbreArquivo(taParticipante);
    Result := ShowModal;
  end;

  frmCadContribAcaoJudicial.Free;
end;


procedure TfrmCadContribAcaoJudicial.sbtnApagarClick(Sender: TObject);
begin
  if MsgDlg('Deseja excluir a ação judicial cadastrada? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  begin
    sbtnApagar.down := false;
    exit;
  end;

  inherited;
end;

procedure TfrmCadContribAcaoJudicial.edbPercentualKeyPress(Sender: TObject; var Key: Char);
var
  sValor : string;
  sDec   : string;
begin
  inherited;
  sValor := TDBEdit(Sender).text;
  sDec   := iff(pos(',', sValor) > 0, copy(sValor, pos(',', sValor)+1, length(svalor)), '');

  If not( key in['0'..'9', ',', #08] ) then
     key := #0;

  if (key in [',']) and ((length(sValor) = 0) or (pos(',', sValor) <> 0)) then     // virgula no inicio ou mais de uma
      key := #0;

  if (key <> #0) and (not (key in [',',#8])) and (length(sValor) >= 2) and (StrToFloat(sValor+Key) > 100) then
     key := #0;

  if (Key <> #0) and (sDec <> '') and (not (key in [',',#8])) and (length(sDec+Key)>2) then
     key := #0;
end;

procedure TfrmCadContribAcaoJudicial.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  CmeCadastro.RepetirInsert := false;

  {usa uma query auxiliar caso a validação de vigencia altere a operação de insert para edit na qry principal }
  qryValida.close;
  if TipoAcao = taPensionista then
     qryValida.ParamByName('IDNUCLEO').AsInteger  := -1
  else
  begin
    qryValida.ParamByName('IDPESSOA').AsInteger    := -1;
    qryValida.ParamByName('IDPESSJUR').AsInteger   := -1;
    qryValida.ParamByName('IDPLANOPREV').AsInteger := -1;
  end;
  qryValida.ParamByName('IDCONTRIB').AsInteger := -1;
  qryValida.ParamByName('IDACAOJUD').AsInteger := -1;
  qryValida.open;

  qryValida.Insert;

  rgTipoAcao.ItemIndex := 0;
end;

procedure TfrmCadContribAcaoJudicial.FormActivate(Sender: TObject);
begin
  inherited;

  qryMotivo.close;
  qryMotivo.open;

  sbtnAlterar.enabled := not qry.IsEmpty;
  sbtnApagar.enabled  := not qry.IsEmpty;
  if qry.IsEmpty then
     CmeCadastro.Operacao := opVazio
  else
     CmeCadastro.Operacao := opIdle;
end;


procedure TfrmCadContribAcaoJudicial.sbtnAlterarClick(Sender: TObject);
begin
  inherited;

  {usa uma query auxiliar caso a validação de vigencia altere a operação de insert para edit na qry principal }
  if TipoAcao = taPensionista then
  begin
    qryValida.close;
    qryValida.ParamByName('IDNUCLEO').AsInteger  := iIDNucleoFamiliar;
    qryValida.ParamByName('IDCONTRIB').AsInteger := iIDContribuicao;
    qryValida.ParamByName('IDACAOJUD').AsInteger := qry.FieldByName('IDCONTRIBACJUDDEFICIT').AsInteger;
    qryValida.open;
  end
  else
  begin
    qryValida.close;
    qryValida.ParamByName('IDPESSOA').AsInteger    := iIdPessoa;
    qryValida.ParamByName('IDPESSJUR').AsInteger   := iIdPessJur;
    qryValida.ParamByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
    qryValida.ParamByName('IDCONTRIB').AsInteger   := iIDContribuicao;
    qryValida.ParamByName('IDACAOJUD').AsInteger := qry.FieldByName('IDCONTRIBACJUDDEFICIT').AsInteger;
    qryValida.Open;
  end;

  case qry.FieldByName('FLGPREPARO').AsInteger of 
    2 : rgTipoAcao.ItemIndex := 0;
    0 : rgTipoAcao.ItemIndex := 1;
   else rgTipoAcao.ItemIndex := 2;
  end;

  qryValida.edit;

end;

procedure TfrmCadContribAcaoJudicial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if bClickNoOKCancel and (not bClickNoSair) then Abort;

  inherited;
  Action := caFree;
end;

procedure TfrmCadContribAcaoJudicial.bbtnSairClick(Sender: TObject);
begin
  bClickNoOKCancel  := False;
  bClickNoSair      := True;

  inherited;
end;

procedure TfrmCadContribAcaoJudicial.FormShow(Sender: TObject);
begin
  inherited;
  bClickNoOKCancel  := False;
  bClickNoSair      := False;

end;

procedure TfrmCadContribAcaoJudicial.bbtnConfirmarClick(Sender: TObject);
var
  opAux : TOperacao;
  sAnoMesVig : TRecVigencia;
  iIdAcaoJud  : integer;
begin
  bClickNoOKCancel := True;
  opAux := CmeCadastro.Operacao;

  sAnoMesVig.sDtIni := '';
  sAnoMesVig.sDtFim := '';
  iIdAcaoJud := -1;

  // validando
  if dpdbDtIniAcao.Date = 0 then
  begin
    MsgDlg('É necessário informar a data de início da ação judicial.', 'Atenção', mtInformation, [mbOk], 0);
    dpdbDtIniAcao.SetFocus;
    abort;
  end;

  if (dpdbDtIniAcao.Date > 0) then
  begin
    if TipoAcao = taPensionista then
       AcaoJudicialVigenteNucleo(iIDNucleoFamiliar, iIDContribuicao, sAnoMesVig, iIdAcaoJud)
    else
       AcaoJudicialVigenteParticip(iIdPessoa, iIdPessJur, iIdPlanoPrev, iIDContribuicao, sAnoMesVig, iIdAcaoJud);

    if ((sAnoMesVig.sDtIni <> '') and (sAnoMesVig.sDtIni > FormatDateTime('YYYY/MM', dpdbDtIniAcao.Date))) or
       ((sAnoMesVig.sDtIni <> '') and (sAnoMesVig.sDtFim <> '') and
        (FormatDateTime('YYYY/MM', dpdbDtIniAcao.Date) > sAnoMesVig.sDtIni) and
        (FormatDateTime('YYYY/MM', dpdbDtIniAcao.Date) < sAnoMesVig.sDtFim)) then
    begin
      MsgDlg('A data de início é menor que a data da ação judicial vigente.', 'Atenção', mtInformation, [mbOk], 0);
      dpdbDtIniAcao.SetFocus;
      abort;
    end;

    if not VerificaDataIniIntervaloValido() then
    begin
      MsgDlg('A data de início faz parte do intervalo de uma ação judicial cadastrada.', 'Atenção', mtInformation, [mbOk], 0);
      dpdbDtIniAcao.SetFocus;
      abort;
    end;
  end;


  if (CmeCadastro.ConfirmaCadastro) and (edbPercentual.text = '') and (rgTipoAcao.ItemIndex = 0) then
  begin
    MsgDlg('É necessário informar o percentual.', 'Atenção', mtInformation, [mbOk], 0);
    edbPercentual.SetFocus;
    Abort;
  end;

  if (CmeCadastro.ConfirmaCadastro) and (dblkMotivo.text = '') then
  begin
    MsgDlg('É necessário informar o motivo da ação judicial.', 'Atenção', mtInformation, [mbOk], 0);
    dblkMotivo.SetFocus;
    Abort;
  end;

  if (CmeCadastro.ConfirmaCadastro) and (edbObservacao.text = '') then
  begin
    MsgDlg('É necessário preencher o campo observação.', 'Atenção', mtInformation, [mbOk], 0);
    edbObservacao.SetFocus;
    Abort;
  end;

  if (CmeCadastro.ConfirmaCadastro) and (dpdbDtFimAcao.Date > 0) and (dpdbDtFimAcao.Date < dpdbDtIniAcao.Date) then
  begin
    MsgDlg('A data final deverá ser maior que a data início.', 'Atenção', mtInformation, [mbOk], 0);
    dpdbDtFimAcao.SetFocus;
    Abort;
  end;

  inherited;

  AbreArquivo(TipoAcao);
end;

procedure TfrmCadContribAcaoJudicial.qryBeforePost(DataSet: TDataSet);
begin
  inherited;

  TrataVigenciaAcaoJudicial( FormatDateTime('YYYY/MM', dpdbDtIniAcao.Date) );

  if CmeCadastro.Operacao = opInserir then
     qry.FieldByName('IDCONTRIBACJUDDEFICIT').AsInteger := LeUltRegistro(qryAux, sNomeTabela);

  if TipoAcao = taPensionista then
     qry.FieldByName('IDNUCLEOFAMILIAR').AsInteger      := iIDNucleoFamiliar
  else
  begin
    qry.FieldByName('IDPESSOA').AsInteger    := iIdPessoa;
    qry.FieldByName('IDPESSJUR').AsInteger   := iIdPessJur;
    qry.FieldByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
    qry.FieldByName('SEQPROPOSTA').AsInteger := 1;
  end;
  qry.FieldByName('IDCONTRIBUICAO').AsInteger        := iIDContribuicao;
  qry.FieldByName('ANOMESINIACJUDDEFICIT').AsString  := FormatDateTime('YYYY/MM', dpdbDtIniAcao.Date);
  qry.FieldByName('ANOMESFIMACJUDDEFICIT').AsString  := iff(dpdbDtFimAcao.text <> '', FormatDateTime('YYYY/MM', dpdbDtFimAcao.Date), '');

  {codigo dos itens:  0 - Prepara e Não Envia  /  1 - Não Prepara /  2 - Prepara e Envia}
  qry.FieldByName('FLGPREPARO').AsInteger := iff(rgTipoAcao.ItemIndex = 0, 2,
                                             iff(rgTipoAcao.ItemIndex = 1, 0, 1));
end;

procedure TfrmCadContribAcaoJudicial.bbtnCancelarClick(Sender: TObject);
begin
  if qryValida.Active and (qryValida.UpdatesPending) then qryValida.CancelUpdates;

  bClickNoOKCancel  := True;

  inherited;
end;

procedure TfrmCadContribAcaoJudicial.TrataVigenciaAcaoJudicial(sAnoMesIni : string);
var
  sAnoMesVig    : string;
  iIdAcaoJudVig : integer;
  Operacao      : TOperacao;
begin
  Operacao := CmeCadastro.Operacao;

  // verifica se tem alguma ação vigente
  if VerificaAcaoJudicialVigente(sAnoMesVig, iIdAcaoJudVig) then
  begin
    //se o AnoMes da vigente = sAnoMesIni informado,  alterar os dados da ação vigente
    if sAnoMesVig = sAnoMesIni then
       Operacao := opAlterar
    else
    //se o AnoMes da vigente < sAnoMesIni informado, encerrar a ação vigente com sAnoMesIni -1
    if sAnoMesIni > sAnoMesVig  then
    begin
      try
        // muda data da ação vigente
        qryAux.close;
        qryAux.SQL.text := 'update '+sNomeTabela+
                           '   set ANOMESFIMACJUDDEFICIT = '+Quotedstr( FormatDateTime('YYYY/MM', IncMonth(dpdbDtIniAcao.date, -1)) ) +
                           ' where IDCONTRIBACJUDDEFICIT = '+IntToStr(iIdAcaoJudVig);
        qryAux.ExecSQL;
      except
        MsgDlg('Erro ao atualizar Data Final.', 'Atenção', mtInformation, [mbOk], 0);
      end;
    end
    //se o AnoMes da vigente > sAnoMesIni informado, não efetua o cadastro
    else
      qry.CancelUpdates;
  end
  else
  begin
    if VerificaExisteAnoMesCadastrado(iIdAcaoJudVig) then
       Operacao := opAlterar;
  end;

  if Operacao <> CmeCadastro.Operacao then
  begin
    qry.CancelUpdates;
    qry.Locate('IDCONTRIBACJUDDEFICIT', iIdAcaoJudVig, [loCaseInsensitive]);
    qry.edit;
  end;
  CmeCadastro.Operacao := Operacao;

  {passa para qry principal os valores que não são tratado no metodo qryBeforePost}
  qry.FieldByName('PERCACJUDDEFICIT').AsFloat       := qryValida.FieldByName('PERCACJUDDEFICIT').AsFloat;
  qry.FieldByName('IDMOTIVOACJUDDEFICIT').AsInteger := qryValida.FieldByName('IDMOTIVOACJUDDEFICIT').AsInteger;
  qry.FieldByName('OBSACJUDDEFICIT').AsString       := qryValida.FieldByName('OBSACJUDDEFICIT').AsString;

end;


function TfrmCadContribAcaoJudicial.VerificaAcaoJudicialVigente(var sVigencia : string; var iIdVigente : integer) : boolean;
begin
  qryAux.Close;
  qryAux.sql.clear;
  qryAux.SQL.Add('SELECT IDCONTRIBACJUDDEFICIT, ANOMESINIACJUDDEFICIT ');
  qryAux.SQL.Add('FROM   '+sNomeTabela );
  qryAux.SQL.Add('WHERE  IDCONTRIBUICAO   = '+IntToStr(iIDContribuicao));
  if TipoAcao = taPensionista then
     qryAux.SQL.Add('AND    IDNUCLEOFAMILIAR = '+IntToStr(iIDNucleoFamiliar))
  else
  begin
     qryAux.SQL.Add('AND    IDPESSOA    = '+IntToStr(iIdPessoa));
     qryAux.SQL.Add('AND    IDPESSJUR   = '+IntToStr(iIdPessJur));
     qryAux.SQL.Add('AND    IDPLANOPREV = '+IntToStr(iIdPlanoPrev));
     qryAux.SQL.Add('AND    SEQPROPOSTA = 1');
  end;
  qryAux.SQL.Add('AND    ((ANOMESFIMACJUDDEFICIT IS NULL) OR ');
  qryAux.SQL.Add('        (ANOMESFIMACJUDDEFICIT > '+QuotedStr(FormatDateTime('YYYY/MM', Date))+')) ');

  if CmeCadastro.Operacao = opAlterar then
     qryAux.SQL.Add('AND   IDCONTRIBACJUDDEFICIT <> '+qry.FieldByName('IDCONTRIBACJUDDEFICIT').AsString );

  qryAux.SQL.Add('ORDER BY ANOMESINIACJUDDEFICIT DESC ');

  qryAux.open;
  if not qryAux.eof then
  begin
    iIdVigente := qryAux.Fields[0].AsInteger;
    sVigencia  := qryAux.Fields[1].AsString;
  end;
  Result := not qryAux.eof;
end;


procedure TfrmCadContribAcaoJudicial.AbreArquivo(Tipo : TTipoAcao);
begin
  if Tipo = taPensionista then
  begin
    qry.close;
    qry.ParamByName('IDNUCLEO').AsInteger  := iIDNucleoFamiliar;
    qry.ParamByName('IDCONTRIB').AsInteger := iIDContribuicao;
    qry.open;
  end
  else
  begin
    qry.close;
    qry.ParamByName('IDPESSOA').AsInteger    := iIdPessoa;
    qry.ParamByName('IDPESSJUR').AsInteger   := iIdPessJur;
    qry.ParamByName('IDPLANOPREV').AsInteger := iIdPlanoPrev;
    qry.ParamByName('IDCONTRIB').AsInteger   := iIDContribuicao;
    qry.open;
  end;

end;


procedure TfrmCadContribAcaoJudicial.PreencheSQL(Tipo: TTipoAcao);
begin
  //-----------------------------------------
  // QRY
  //-----------------------------------------
  if Tipo = taPensionista then
  begin
    qry.close;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT AC.IDCONTRIBACJUDDEFICIT, ');
    qry.SQL.Add('       AC.IDNUCLEOFAMILIAR,      ');
    qry.SQL.Add('       AC.IDCONTRIBUICAO,        ');
    qry.SQL.Add('       DECODE (AC.FLGPREPARO, 0,''Prepara e Não Envia'',  ');
    qry.SQL.Add('                              1,''Não Prepara'',          ');
    qry.SQL.Add('                              2,''Prepara e Envia'') AS TIPOACAO,');
    qry.SQL.Add('       AC.FLGPREPARO,                                            ');
    qry.SQL.Add('       AC.PERCACJUDDEFICIT,                                      ');
    qry.SQL.Add('       TO_DATE(AC.ANOMESINIACJUDDEFICIT, ''YYYY/MM'')  as DATAINICIO, ');
    qry.SQL.Add('       LAST_DAY(TO_DATE(AC.ANOMESFIMACJUDDEFICIT, ''YYYY/MM''))  as DATAFINAL,  ');
    qry.SQL.Add('       AC.ANOMESINIACJUDDEFICIT,                          ');
    qry.SQL.Add('       AC.ANOMESFIMACJUDDEFICIT,                          ');
    qry.SQL.Add('       M.DESCRICAO,                                       ');
    qry.SQL.Add('       AC.IDMOTIVOACJUDDEFICIT,                           ');
    qry.SQL.Add('       SUBSTR(AC.OBSACJUDDEFICIT, 1, 100) OBSACJUDDEFICIT ');
    qry.SQL.Add('FROM   CONTRIBNUCLEOACJUDDEFICIT AC                       ');
    qry.SQL.Add('JOIN   MOTIVO M ON M.IDMOTIVO = AC.IDMOTIVOACJUDDEFICIT   ');
    qry.SQL.Add('WHERE  AC.IDNUCLEOFAMILIAR = :IDNUCLEO                    ');
    qry.SQL.Add('AND    AC.IDCONTRIBUICAO   = :IDCONTRIB                   ');
    qry.SQL.Add('ORDER BY AC.ANOMESINIACJUDDEFICIT DESC                    ');
  end
  else
  begin
    qry.close;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT AC.IDCONTRIBACJUDDEFICIT, ');
    qry.SQL.Add('       AC.IDPESSOA,       ');
    qry.SQL.Add('       AC.IDPESSJUR,      ');
    qry.SQL.Add('       AC.IDPLANOPREV,    ');
    qry.SQL.Add('       AC.SEQPROPOSTA,    ');
    qry.SQL.Add('       AC.IDCONTRIBUICAO, ');
    qry.SQL.Add('       DECODE (AC.FLGPREPARO, 0,''Prepara e Não Envia'',  ');
    qry.SQL.Add('                              1,''Não Prepara'',          ');
    qry.SQL.Add('                              2,''Prepara e Envia'') AS TIPOACAO,');
    qry.SQL.Add('       AC.FLGPREPARO,                                            ');
    qry.SQL.Add('       AC.PERCACJUDDEFICIT,                                      ');
    qry.SQL.Add('       TO_DATE(AC.ANOMESINIACJUDDEFICIT, ''YYYY/MM'')  as DATAINICIO, ');
    qry.SQL.Add('       LAST_DAY(TO_DATE(AC.ANOMESFIMACJUDDEFICIT, ''YYYY/MM''))  as DATAFINAL,  ');
    qry.SQL.Add('       AC.ANOMESINIACJUDDEFICIT,                          ');
    qry.SQL.Add('       AC.ANOMESFIMACJUDDEFICIT,                          ');
    qry.SQL.Add('       M.DESCRICAO,                                       ');
    qry.SQL.Add('       AC.IDMOTIVOACJUDDEFICIT,                           ');
    qry.SQL.Add('       SUBSTR(AC.OBSACJUDDEFICIT, 1, 100) OBSACJUDDEFICIT ');
    qry.SQL.Add('FROM   CONTRIBPARTPACJUDDEFICIT AC                        ');
    qry.SQL.Add('JOIN   MOTIVO M ON M.IDMOTIVO = AC.IDMOTIVOACJUDDEFICIT   ');
    qry.SQL.Add('WHERE  AC.IDPESSOA       = :IDPESSOA                      ');
    qry.SQL.Add('AND    AC.IDPESSJUR      = :IDPESSJUR                     ');
    qry.SQL.Add('AND    AC.IDPLANOPREV    = :IDPLANOPREV                   ');
    qry.SQL.Add('AND    AC.IDCONTRIBUICAO = :IDCONTRIB                     ');
    qry.SQL.Add('AND    AC.SEQPROPOSTA    = 1                              ');
    qry.SQL.Add('ORDER BY AC.ANOMESINIACJUDDEFICIT DESC                    ');
  end;

  //-----------------------------------------
  // VALIDA
  //-----------------------------------------
  qryValida.Close;
  qryValida.SQL.Clear;
  qryValida.SQL.Add('SELECT AC.IDCONTRIBACJUDDEFICIT, ');
  if Tipo = taPensionista then
     qryValida.SQL.Add('    AC.IDNUCLEOFAMILIAR,')
  else
  begin
    qryValida.SQL.Add('     AC.IDPESSOA,        ');
    qryValida.SQL.Add('     AC.IDPESSJUR,       ');
    qryValida.SQL.Add('     AC.IDPLANOPREV,     ');
    qryValida.SQL.Add('     AC.SEQPROPOSTA,     ');
  end;
  qryValida.SQL.Add('       AC.IDCONTRIBUICAO,  ');
  qryValida.SQL.Add('       AC.FLGPREPARO,      ');
  qryValida.SQL.Add('       AC.PERCACJUDDEFICIT,');
  qryValida.SQL.Add('       TO_DATE(AC.ANOMESINIACJUDDEFICIT, ''YYYY/MM'')  as DATAINICIO, ');
  qryValida.SQL.Add('       LAST_DAY(TO_DATE(AC.ANOMESFIMACJUDDEFICIT, ''YYYY/MM''))  as DATAFINAL,  ');
  qryValida.SQL.Add('       AC.ANOMESINIACJUDDEFICIT,         ');
  qryValida.SQL.Add('       AC.ANOMESFIMACJUDDEFICIT,         ');
  qryValida.SQL.Add('       AC.IDMOTIVOACJUDDEFICIT,          ');
  qryValida.SQL.Add('       AC.OBSACJUDDEFICIT                ');
  qryValida.SQL.Add('FROM   '+sNomeTabela+' AC');

  qryValida.SQL.Add('WHERE  AC.IDCONTRIBUICAO   = :IDCONTRIB  ');
  qryValida.SQL.Add('AND    ((AC.IDCONTRIBACJUDDEFICIT = :IDACAOJUD) or (:IDACAOJUD = 1)) ');

  if Tipo = taPensionista then
     qryValida.SQL.Add('AND    AC.IDNUCLEOFAMILIAR = :IDNUCLEO ')
  else
  begin
    qryValida.SQL.Add('AND    AC.IDPESSOA       = :IDPESSOA    ');
    qryValida.SQL.Add('AND    AC.IDPESSJUR      = :IDPESSJUR   ');
    qryValida.SQL.Add('AND    AC.IDPLANOPREV    = :IDPLANOPREV ');
    qryValida.SQL.Add('AND    AC.SEQPROPOSTA    = 1            ');
  end;

end;

function TfrmCadContribAcaoJudicial.VerificaExisteAnoMesCadastrado(var iIdAcao: integer): boolean;
begin
  qryAux.Close;
  qryAux.sql.clear;
  qryAux.SQL.Add('SELECT IDCONTRIBACJUDDEFICIT ');
  qryAux.SQL.Add('FROM   '+sNomeTabela );
  qryAux.SQL.Add(' WHERE IDCONTRIBUICAO        = '+IntToStr(iIDContribuicao) );
  qryAux.SQL.Add('   AND ANOMESINIACJUDDEFICIT = '+Quotedstr(FormatDateTime('YYYY/MM', dpdbDtIniAcao.date)) );

  if TipoAcao = taPensionista then
     qryAux.SQL.Add('   AND IDNUCLEOFAMILIAR = '+IntToStr(iIDNucleoFamiliar))
  else
  begin
     qryAux.SQL.Add('   AND IDPESSJUR   = '+IntToStr(iIdPessJur));
     qryAux.SQL.Add('   AND IDPLANOPREV = '+IntToStr(iIdPlanoPrev));
     qryAux.SQL.Add('   AND IDPESSOA    = '+IntToStr(iIdPessoa));
     qryAux.SQL.Add('   AND SEQPROPOSTA = 1');
  end;

  qryAux.Open;
  if not qryAux.eof then
     iIdAcao := qryAux.Fields[0].AsInteger;

  Result := not qryAux.eof;
end;

function TfrmCadContribAcaoJudicial.VerificaDataIniIntervaloValido : boolean;
begin
  qryAux.close;
  qryAux.SQL.clear;
  qryAux.SQL.Add('SELECT IDCONTRIBACJUDDEFICIT ');
  qryAux.SQL.Add('  FROM '+sNomeTabela );
  qryAux.SQL.Add(' WHERE '+Quotedstr(FormatDateTime('YYYY/MM', dpdbDtIniAcao.date))+' BETWEEN ANOMESINIACJUDDEFICIT AND ANOMESFIMACJUDDEFICIT ');
  qryAux.SQL.Add('   AND IDCONTRIBUICAO      = '+IntToStr(iIDContribuicao) );

  if TipoAcao = taPensionista then
     qryAux.SQL.Add('   AND IDNUCLEOFAMILIAR = '+IntToStr(iIDNucleoFamiliar))
  else
  begin
     qryAux.SQL.Add('   AND IDPESSJUR   = '+IntToStr(iIdPessJur));
     qryAux.SQL.Add('   AND IDPLANOPREV = '+IntToStr(iIdPlanoPrev));
     qryAux.SQL.Add('   AND IDPESSOA    = '+IntToStr(iIdPessoa));
     qryAux.SQL.Add('   AND SEQPROPOSTA = 1');
  end;
  qryAux.Open;

  result := qryAux.eof;
end;


end.
