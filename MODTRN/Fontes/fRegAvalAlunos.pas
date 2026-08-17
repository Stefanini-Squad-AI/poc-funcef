unit fRegAvalAlunos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, wwdblook, Db, DBTables,
  Wwquery, checklst, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Wwtable,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmRegAvalAlunos = class(TfrmOkCancelar)
    pnlIdent: TPanel;
    pnlParticipantes: TPanel;
    tblCurso: TwwQuery;
    qryEntid: TwwQuery;
    gbxCurso: TGroupBox;
    Label3: TLabel;
    dblcCurso: TwwDBLookupCombo;
    dblcEntid: TwwDBLookupCombo;
    gbxDatas: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    gbxCarga: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    gbxDespesas: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dtedIniPlan: TCMDateTimePicker;
    dtedFimPlan: TCMDateTimePicker;
    dtedIniReal: TCMDateTimePicker;
    dtedFimReal: TCMDateTimePicker;
    rgControle: TRadioGroup;
    redTeoria: TRealEdit;
    redPratica: TRealEdit;
    redTotal: TRealEdit;
    redValCurso: TRealEdit;
    redValViagem: TRealEdit;
    redValHosp: TRealEdit;
    redValOutras: TRealEdit;
    qryFunc: TwwQuery;
    pnlPessoasInscritas: TPanel;
    qryHsttrn: TwwQuery;
    pnlGridEscolha: TPanel;
    wwDBGrid1: TwwDBGrid;
    pnlBotoes: TPanel;
    dsHsttrn: TwwDataSource;
    bbtnApanha: TBitBtn;
    Label1: TLabel;
    dblcInstrutor: TwwDBLookupCombo;
    qryInstrutor: TwwQuery;
    edLocalCurso: TEdit;
    Label2: TLabel;
    rgAvalCurs: TRadioGroup;
    dsFunc: TwwDataSource;
    updFunc: TUpdateSQL;
    dbrgAvaliacoes: TwwDBGrid;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcCursoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure bbtnApanhaClick(Sender: TObject);
    procedure qryFuncAfterScroll(DataSet: TDataSet);
    procedure bbtnSairClick(Sender: TObject);
    procedure qryFuncBeforePost(DataSet: TDataSet);
  private
    ListaEmpregadoNao, ListaEmpregadoSim, ListaNumSeqNao, ListaNumSeqSim: TStringList;
    procedure SelecionachklstEmpregado;
    procedure PreencheTela;
    procedure LimpaTela;
  end;

var
  frmRegAvalAlunos: TfrmRegAvalAlunos;
  ProxSeq: integer;
  FezIncDel, OrdenaPorNome: boolean;
  sSql, updSql: string;
  LstFunc, LstNome: TStringList;
  iIdTipoProcesso: Longint;

implementation

uses uCMTypes, uMensErro, UsoGeralRH, uFuncoesUteisRH, uSistema, uDataBase, DBaseDados,
  CorreioCM, FSelTreinColetivo, FTelaAut, RListaPresenca;

{$R *.DFM}

procedure TfrmRegAvalAlunos.SelecionachklstEmpregado;
begin
 // Funcionarios Inscritos
 sSQL :=        'SELECT UPPER(P.NOME) AS UPNOME, H1.IDPESSOA, P.NOME, H1.NUMSEQ, '  ;
 sSQL := sSQL + 'H1.AVALTEOR, H1.AVALPRAT, H1.IDCURSO, H1.FLGAVALTEOR, H1.FLGAVALPRAT ';
 sSQL := sSQL + 'FROM   PESSOA P, FUNCIONARIO F, ';

 sSQL := sSQL + '       (SELECT H.IDPESSOA, H.NUMSEQ, H.AVALTEOR, H.AVALPRAT, H.IDCURSO, ';
 sSQL := sSQL + '        H.FLGAVALTEOR, H.FLGAVALPRAT FROM HSTTRN H  '  ;
 sSQL := sSQL + '        WHERE  H.IDCURSO = '                ;
 sSQL := sSQL + tblCurso.FieldByName('IDCURSO').AsString     ;
 if dblcEntid.Text <> '' then begin
    sSQL := sSQL + '        AND    H.IDENTIDINSTR = '           ;
    sSQL := sSQL + qryEntid.FieldByName('IDPESSOA').AsString;
 end;

 if dblcInstrutor.Text <> '' then begin
    sSQL := sSQL + '        AND    H.IDINSTRUTOR = '           ;
    sSQL := sSQL + qryInstrutor.FieldByName('IDPESSOA').AsString;
 end;

 if dtedIniPlan.Text <> '' then begin
    sSQL := sSQL + '        AND    H.DATPLINI = TO_DATE('''     ;
    sSQL := sSQL + dtedIniPlan.Text + ''',''dd/mm/yyyy'') '     ;
 end
 else
    sSQL := sSQL + '        AND    H.DATPLINI  IS NULL '        ;

 if dtedFimPlan.Text <> '' then begin
    sSQL := sSQL + '        AND    H.DATPLFIM = TO_DATE('''     ;
    sSQL := sSQL + dtedFimPlan.Text + ''',''dd/mm/yyyy'') '     ;
 end
 else
    sSQL := sSQL + '        AND    H.DATPLFIM  IS NULL '        ;

 if dtedIniReal.Text <> '' then begin
    sSQL := sSQL + '        AND    H.DATREINI = TO_DATE('''     ;
    sSQL := sSQL + dtedIniReal.Text + ''',''dd/mm/yyyy'') '     ;
 end
 else
    sSQL := sSQL + '        AND    H.DATREINI  IS NULL '        ;

 if dtedFimReal.Text <> '' then begin
    sSQL := sSQL + '        AND    H.DATREFIM = TO_DATE('''     ;
    sSQL := sSQL + dtedFimReal.Text + ''',''dd/mm/yyyy'') '    ;
 end
 else
    sSQL := sSQL + '        AND    H.DATREFIM  IS NULL '        ;

 sSQL := sSQL + ') H1 WHERE  F.IDPESSOA       =  P.IDPESSOA AND ' ;

 if (sUsuXccusto <> '') then
    sSQL := sSQL + ' F.CODCENTROCUSTO IN ' + sUsuXccusto + ' AND ';

 if (sUsuXfilial <> '') then
    sSQL := sSQL + ' F.IDESTAB IN ' + sUsuXfilial + ' AND ';

 sSQL := sSQL + '       F.IDPESSOA       =  H1.IDPESSOA    ' ;

 // Fim das condições por Seleção dos Funcionarios Inscritos

 // Candidatos Inscritos
 sSQL := sSQL + 'UNION SELECT UPPER(P.NOME) AS UPNOME, F.IDPESSOA, ';
 sSQL := sSQL + 'P.NOME, H1.NUMSEQ, H1.AVALTEOR, H1.AVALPRAT, H1.IDCURSO, H1.FLGAVALTEOR, H1.FLGAVALPRAT ';

 sSQL := sSQL + 'FROM   PESSOA P, CANDIDAT F, ';

 sSQL := sSQL + '       (SELECT H.IDPESSOA, H.NUMSEQ, H.AVALTEOR, H.AVALPRAT, H.IDCURSO, ';
 sSQL := sSQL + '        H.FLGAVALTEOR, H.FLGAVALPRAT FROM HSTTRN H  ';
 sSQL := sSQL + '        WHERE  H.IDCURSO = '                ;
 sSQL := sSQL + tblCurso.FieldByName('IDCURSO').AsString     ;
 if dblcEntid.Text <> '' then begin
    sSQL := sSQL + '        AND    H.IDENTIDINSTR = '           ;
    sSQL := sSQL + qryEntid.FieldByName('IDPESSOA').AsString;
 end;

 if dblcInstrutor.Text <> '' then begin
    sSQL := sSQL + '        AND    H.IDINSTRUTOR = '           ;
    sSQL := sSQL + qryInstrutor.FieldByName('IDPESSOA').AsString;
 end;

 if dtedIniPlan.Text <> '' then begin
    sSQL := sSQL + '        AND    H.DATPLINI = TO_DATE('''     ;
    sSQL := sSQL + dtedIniPlan.Text + ''',''dd/mm/yyyy'') '     ;
 end
 else
    sSQL := sSQL + '        AND    H.DATPLINI  IS NULL '        ;

 if dtedFimPlan.Text <> '' then begin
    sSQL := sSQL + '        AND    H.DATPLFIM = TO_DATE('''     ;
    sSQL := sSQL + dtedFimPlan.Text + ''',''dd/mm/yyyy'') '     ;
 end
 else
    sSQL := sSQL + '        AND    H.DATPLFIM  IS NULL '        ;

 if dtedIniReal.Text <> '' then begin
    sSQL := sSQL + '        AND    H.DATREINI = TO_DATE('''     ;
    sSQL := sSQL + dtedIniReal.Text + ''',''dd/mm/yyyy'') '     ;
 end
 else
    sSQL := sSQL + '        AND    H.DATREINI  IS NULL '        ;

 if dtedFimReal.Text <> '' then begin
    sSQL := sSQL + '        AND    H.DATREFIM = TO_DATE('''     ;
    sSQL := sSQL + dtedFimReal.Text + ''',''dd/mm/yyyy'') '    ;
 end
 else
    sSQL := sSQL + '        AND    H.DATREFIM  IS NULL '        ;

 sSQL := sSQL + ') H1 WHERE  F.IDPESSOA       =  P.IDPESSOA AND ' ;

 sSQL := sSQL + '       F.IDPESSOA       =  H1.IDPESSOA    ' ;

 // Fim das condições por Seleção dos Candidatos Inscritos

 sSQL := sSQL + ' ORDER BY 1';

 qryFunc.Close;
 qryFunc.SQL.Clear;
 qryFunc.SQL.Add(sSQL);
 qryFunc.Open;

 if not qryFunc.Eof then
   qryFunc.Edit;

end;


procedure TfrmRegAvalAlunos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  pnlGridEscolha.SendToBack;
  SelecionachklstEmpregado;
end;

procedure TfrmRegAvalAlunos.FormCreate(Sender: TObject);
begin
  inherited;

  tblCurso.Open;
  qryEntid.Open;
  qryInstrutor.Open;
  qryHsttrn.Close;
  qryHsttrn.ParamByName('IdCurso').AsInteger := -1;
  qryHsttrn.Open;
  OrdenaPorNome := True;

end;

procedure TfrmRegAvalAlunos.dblcCursoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if  modified  then begin
      pnlParticipantes.SendToBack;
      LimpaTela;
      qryHsttrn.Close;
      qryHsttrn.ParamByName('IdCurso').AsInteger := tblCurso.FieldByName('IdCurso').AsInteger;
      qryHsttrn.Open;
      if not tblCurso.FieldByName('IDENTIDINSTR').isNull then
      begin
         qryEntid.Locate('IDPESSOA', tblCurso.FieldByName('IDENTIDINSTR').Value,[]);
         dblcEntid.LookupValue := qryEntid.FieldByName('IDPESSOA').Value;
         dblcEntid.Update;
      end;
      bbtnApanha.Enabled := (not qryHsttrn.IsEmpty);
  end;

end;

procedure TfrmRegAvalAlunos.PreencheTela;
begin
  LimpaTela;
  dblcEntid.Text       := qryHsttrn.FieldByName('NOME').AsString;
  edLocalCurso.Text    := qryHsttrn.FieldByName('LOCALCURSO').AsString;
  rgAvalCurs.ItemIndex := 1 - qryHsttrn.FieldByName('FLGAVALCURS').AsInteger;
  qryEntid.Locate('IDPESSOA',qryHsttrn.FieldByName('IDENTIDINSTR').AsInteger,[]);
  dblcInstrutor.Text   := qryHsttrn.FieldByName('INSTRUTOR').AsString;
  qryInstrutor.Locate('IDPESSOA',qryHsttrn.FieldByName('IDINSTRUTOR').AsInteger,[]);
  rgControle.ItemIndex := 1 - qryHsttrn.FieldByName('FLGCONTROLE').AsInteger;
  if qryHsttrn.FieldByName('DATPLINI').Value <> Null then
     dtedIniPlan.Date     := qryHsttrn.FieldByName('DATPLINI').Value;
  if qryHsttrn.FieldByName('DATPLFIM').Value <> Null then
     dtedFimPlan.Date     := qryHsttrn.FieldByName('DATPLFIM').Value;
  if qryHsttrn.FieldByName('DATREINI').Value <> Null then
     dtedIniReal.Date     := qryHsttrn.FieldByName('DATREINI').Value;
  if qryHsttrn.FieldByName('DATREFIM').Value <> Null then
     dtedFimReal.Date     := qryHsttrn.FieldByName('DATREFIM').Value;
  redTeoria.Value      := tblCurso.FieldByName('DUR_TEOR').AsFloat;
  redPratica.Value     := tblCurso.FieldByName('DUR_PRAT').AsFloat;
  redTotal.Value       := redTeoria.Value + redPratica.Value;
  redValCurso.Value    := tblCurso.FieldByName('VALOR').AsFloat;
end;

procedure TfrmRegAvalAlunos.LimpaTela;
begin
  if qryFunc.Active then
    qryFunc.ApplyUpdates;
  dblcEntid.Text       := '';
  edLocalCurso.Text    := '';
  rgControle.ItemIndex := 0;
  dtedIniPlan.Text     := '';
  dtedFimPlan.Text     := '';
  dtedIniReal.Text     := '';
  dtedFimReal.Text     := '';
  redTeoria.Value      := 0;
  redPratica.Value     := 0;
  redTotal.Value       := 0;
  redValCurso.Value    := 0;
  redValViagem.Value   := 0;
  redValHosp.Value     := 0;
  redValOutras.Value   := 0;
end;

procedure TfrmRegAvalAlunos.bbtnApanhaClick(Sender: TObject);
begin
  inherited;
  PreencheTela;
  bbtnConfirmarClick(Self);
end;

procedure TfrmRegAvalAlunos.qryFuncAfterScroll(DataSet: TDataSet);
begin
  inherited;
 if not qryFunc.Eof then
   qryFunc.Edit;

end;

procedure TfrmRegAvalAlunos.bbtnSairClick(Sender: TObject);
begin
  inherited;
  if qryFunc.Active then
    qryFunc.ApplyUpdates;

end;

procedure TfrmRegAvalAlunos.qryFuncBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qryFunc.FieldByName('AVALTEOR').IsNull then
    qryFunc.FieldByName('FLGAVALTEOR').asInteger := 0
  else
    qryFunc.FieldByName('FLGAVALTEOR').asInteger := 1;

  if qryFunc.FieldByName('AVALPRAT').IsNull then
    qryFunc.FieldByName('FLGAVALPRAT').asInteger := 0
  else
    qryFunc.FieldByName('FLGAVALPRAT').asInteger := 1;

end;

end.
