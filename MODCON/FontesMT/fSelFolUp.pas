unit fSelFolUp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBTables, Db,
  Wwdatsrc, MAHlpBtn, StdCtrls, TEdNum, Spin, wwdblook, ExtCtrls, TB97, IvDictio, IvMulti,
  IvEMulti, TB97Tlbr, ComCtrls, Buttons, CheckLst, wwdbdatetimepicker, CMDateTimePicker,
  fSelProcessoMT, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport, Grids, Wwdbigrd,
  Wwdbgrid, TREdit, ColorCheckListBox;

type
  TfrmSelFolUp = class(TfrmSelProcessoMT)
    wwDBGrid1: TwwDBGrid;
    dsFollowUp: TwwDataSource;
    CdsFollowUp: TCMClientDataSet;
    sqlFollowUp: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmSelFolUp: TfrmSelFolUp;

implementation

uses uMensErro, fAguarde;

{$R *.DFM}

procedure TfrmSelFolUp.FormCreate(Sender: TObject);
begin
  inherited;
  edDataEnc1.Date := Date;
  edDataEnc2.Date := Date + 30;
  rgSitProc.ItemIndex := 0;
  gbxDataEnc.Visible := true;
  IrPaginaResult := false;
end;

procedure TfrmSelFolUp.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  ListaNumProcTrabSel, ListaIdReclamanteSel: TStringList;
  sListaNumProcTrabSel, sListaIdReclamanteSel: string;
begin
  ListaNumProcTrabSel := TStringList.Create;
  ListaIdReclamanteSel := TStringList.Create;

  frmAguarde.Mostra('Selecionando Dados...');
  inherited;
  frmAguarde.Update;
  if (CdsProcesso.IsEmpty) then
  begin
    frmAguarde.Apaga;
    MsgDlg('Não há dados a exibidos com os parâmetros selecionados.', 'Aviso',
      mtWarning, [mbOk, mbHelp], 0);
    exit;
  end;

  while not(CdsProcesso.EOF) do
  begin
    ListaNumProcTrabSel.Add(CdsProcesso.FieldByName('NUMPROCTRAB').asString);
    if (ListaIdReclamanteSel.IndexOf(CdsProcesso.FieldByName('IDRECLAMANTE').asString) = -1) then
      ListaIdReclamanteSel.Add(CdsProcesso.FieldByName('IDRECLAMANTE').asString);
    CdsProcesso.Next;
  end;
  sListaNumProcTrabSel := '';
  for c:=0 to ListaNumProcTrabSel.Count-1 do
    if (sListaNumProcTrabSel = '') then
      sListaNumProcTrabSel := ListaNumProcTrabSel[c]
    else
      sListaNumProcTrabSel := sListaNumProcTrabSel +','+ ListaNumProcTrabSel[c];

  sListaIdReclamanteSel := '';
  for c:=0 to ListaIdReclamanteSel.Count-1 do
    if (sListaIdReclamanteSel = '') then
      sListaIdReclamanteSel := ListaIdReclamanteSel[c]
    else
      sListaIdReclamanteSel := sListaIdReclamanteSel +','+ ListaIdReclamanteSel[c];

  with (sqlFollowUp.SQL) do
  begin
    Clear;
    Add('SELECT');                       
    Add('  EP.NUMPROCTRAB, EP.DATAREALOCOR, EP.NUMSEQ, EP.ASSUNTO, TP.DESCRICAO, P.NOME');
    Add('FROM');
    Add('  PESSOA P, ETAPAPROCTRAB EP, PROCESSOTRAB PT, TIPORECTRAB TP');
    Add('WHERE');

    if (Pos(',', sListaNumProcTrabSel) > 0) then
      Add('  (EP.NUMPROCTRAB   IN (' +sListaNumProcTrabSel+ ')) AND')
    else
      Add('  (EP.NUMPROCTRAB    = ' +sListaNumProcTrabSel+ ') AND');

    if (Pos(',', sListaIdReclamanteSel) > 0) then
      Add('  (PT.IDRECLAMANTE  IN (' +sListaIdReclamanteSel+ ')) AND')
    else
      Add('  (PT.IDRECLAMANTE   = ' +sListaIdReclamanteSel+ ') AND');

    if (edDataEnc1.Date > 0) then
      Add('  (EP.DATAREALOCOR  >= TO_DATE(' +QuotedStr(DateToStr(edDataEnc1.Date))+
        ',''DD/MM/YYYY'')) AND');

    if (edDataEnc2.Date > 0) then
      Add('  (EP.DATAREALOCOR  <= TO_DATE(' +QuotedStr(DateToStr(edDataEnc2.Date))+
        ',''DD/MM/YYYY'')) AND');

    Add('  (EP.NUMPROCTRAB    = PT.NUMPROCTRAB) AND');
    Add('  (PT.IDRECLAMANTE   = P.IDPESSOA) AND');
    Add('  (EP.CODTIPORECURSO = TP.CODTIPORECURSO)');
    Add('ORDER BY');
    Add('  EP.NUMPROCTRAB, EP.DATAREALOCOR');
  end;

  sqlFollowUp.Open;
  frmAguarde.Apaga;
  ExecutarIrPaginaResult;  

  ListaNumProcTrabSel.Free;
  ListaIdReclamanteSel.Free;
end;

end.
