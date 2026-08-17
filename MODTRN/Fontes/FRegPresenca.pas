unit FRegPresenca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, wwdblook, Db, DBTables,
  Wwquery, checklst, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Wwtable,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmRegPresenca = class(TfrmOkCancelar)
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
    chklstEmpregadoNao: TCheckListBox;
    chklstEmpregadoSim: TCheckListBox;
    sbtnAdicionar: TSpeedButton;
    sbtnRemover: TSpeedButton;
    qryFunc: TwwQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    qryHsttrn: TwwQuery;
    pnlGridEscolha: TPanel;
    wwDBGrid1: TwwDBGrid;
    pnlBotoes: TPanel;
    dsHsttrn: TwwDataSource;
    bbtnApanha: TBitBtn;
    spbNome: TSpeedButton;
    spbTipo: TSpeedButton;
    Label1: TLabel;
    dblcInstrutor: TwwDBLookupCombo;
    qryInstrutor: TwwQuery;
    edLocalCurso: TEdit;
    Label2: TLabel;
    bbtnMarcaAusentes: TBitBtn;
    rgAvalCurs: TRadioGroup;
    dsDet: TwwDataSource;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    bbtnMarcaPresentes: TBitBtn;
    dtedPresenca: TCMDateTimePicker;
    Label4: TLabel;
    sbtnImprimirLista: TSpeedButton;
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcCursoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure bbtnApanhaClick(Sender: TObject);
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure spbNomeClick(Sender: TObject);
    procedure spbTipoClick(Sender: TObject);
    procedure bbtnMarcaAusentesClick(Sender: TObject);
    procedure bbtnMarcaPresentesClick(Sender: TObject);
    procedure dtedPresencaChange(Sender: TObject);
    procedure sbtnImprimirListaClick(Sender: TObject);
  private
    ListaEmpregadoNao, ListaEmpregadoSim, ListaNumSeqNao, ListaNumSeqSim: TStringList;
    procedure SelecionachklstEmpregado;
    procedure PreencheTela;
    procedure LimpaTela;
  end;

var
  frmRegPresenca: TfrmRegPresenca;
  ProxSeq: integer;
  FezIncDel, OrdenaPorNome: boolean;
  sSql, updSql: string;
  LstFunc, LstNome: TStringList;
  iIdTipoProcesso: Longint;

implementation

uses uCMTypes, uMensErro, UsoGeralRH, uFuncoesUteisRH, uSistema, uDataBase, DBaseDados,
  CorreioCM, FSelTreinColetivo, FTelaAut, RListaPresenca;

{$R *.DFM}

procedure TfrmRegPresenca.SelecionachklstEmpregado;
begin
 chklstEmpregadoNao.Items.Clear;
 chklstEmpregadoSim.Items.Clear;
 ListaEmpregadoNao := TStringList.Create;
 ListaEmpregadoSim := TStringList.Create;
 ListaNumSeqNao    := TStringList.Create;
 ListaNumSeqSim    := TStringList.Create;

 // Funcionarios Nao Presentess
 sSQL :=        'SELECT F.IDPESSOA, F.MATRICULA, P.NOME, H1.NUMSEQ, '   ;

 sSQL := sSQL + 'DECODE(F.TIPOCONTRATO,''E'',''Efetivo'', ''T'',''Temporário'',';
 sSQL := sSQL + ' ''G'',''Estagiário'', ''3'',''Terceiro'', ''A'',''Autônomo'', ';
 sSQL := sSQL + ' ''S'',''Efet. Esp.'', ''P'',''Proprietário'', ''Indefinido'') AS TIPOCONTRATO ';

 sSQL := sSQL + 'FROM   PESSOA P, FUNCIONARIO F, '            ;

 sSQL := sSQL + '       (SELECT H.IDPESSOA, H.NUMSEQ FROM HSTTRN H  '  ;
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

 sSQL := sSQL + '    AND    NOT EXISTS (SELECT IDPESSOA FROM LISTAPRESENCA L '  ;
 sSQL := sSQL + '                       WHERE L.IDPESSOA = H.IDPESSOA '        ;
 sSQL := sSQL + '                       AND   L.IDCURSO  = H.IDCURSO '        ;
 sSQL := sSQL + '                       AND   L.NUMSEQ   = H.NUMSEQ '        ;
 sSQL := sSQL + '                       AND   L.DATAPRESENCA = TO_DATE('        ;
 sSQL := sSQL + QuotedStr(dtedPresenca.Text) + ',''DD/MM/YYYY''))) H1 ';

 sSQL := sSQL + 'WHERE  F.IDPESSOA       =  P.IDPESSOA AND ' ;

 if sUsuXccusto <> '' then
    sSQL := sSQL + ' F.CODCENTROCUSTO IN ' + sUsuXccusto + ' AND ';

 if sUsuXfilial <> '' then
    sSQL := sSQL + ' F.IDESTAB IN ' + sUsuXfilial + ' AND ';

 sSQL := sSQL + '       F.IDPESSOA       = H1.IDPESSOA '            ;

 // Fim das condições por Seleção dos Funcionarios Nao Presentes

 if OrdenaPorNome then
    sSQL := sSQL + ' ORDER BY UPPER(P.NOME)'
 else
    sSQL := sSQL + ' ORDER BY TIPOCONTRATO, UPPER(P.NOME)';


 qryFunc.Close;
 qryFunc.SQL.Clear;
 qryFunc.SQL.Add(sSQL);
 qryFunc.Open;

 with qryFunc do
 begin
   while not eof do
   begin
     chklstEmpregadoNao.Items.Add(copy(FieldByName('Nome').AsString +
                                       '                                     ',1,32) + ' ' +
                                       FieldByName('TipoContrato').AsString);
     ListaEmpregadoNao.Add(FieldByName('IdPessoa').AsString);
     ListaNumSeqNao.Add(FieldByName('NumSeq').AsString);
     Next;
   end;
   bbtnMarcaAusentes.Visible := (not IsEmpty);
   Close;
 end;


 // Funcionarios Presentes
 sSQL :=        'SELECT F.IDPESSOA, F.MATRICULA, P.NOME, H1.NUMSEQ '  ;
 sSQL := sSQL + 'FROM   PESSOA P, FUNCIONARIO F,          '  ;
 sSQL := sSQL + '       (SELECT H.IDPESSOA, H.NUMSEQ FROM HSTTRN H  '  ;
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

 sSQL := sSQL + '    AND    EXISTS (SELECT IDPESSOA FROM LISTAPRESENCA L '  ;
 sSQL := sSQL + '                   WHERE L.IDPESSOA = H.IDPESSOA '        ;
 sSQL := sSQL + '                   AND   L.IDCURSO  = H.IDCURSO '        ;
 sSQL := sSQL + '                   AND   L.NUMSEQ   = H.NUMSEQ '        ;
 sSQL := sSQL + '                   AND   L.DATAPRESENCA = TO_DATE('        ;
 sSQL := sSQL + QuotedStr(dtedPresenca.Text) + ',''DD/MM/YYYY'')) ';

 sSQL := sSQL + ') H1 WHERE  F.IDPESSOA       =  P.IDPESSOA AND ' ;

 if sUsuXccusto <> '' then
    sSQL := sSQL + ' F.CODCENTROCUSTO IN ' + sUsuXccusto + ' AND ';

 if sUsuXfilial <> '' then
    sSQL := sSQL + ' F.IDESTAB IN ' + sUsuXfilial + ' AND ';

 sSQL := sSQL + '       F.IDPESSOA       =  H1.IDPESSOA    ' ;

 // Fim das condições por Seleção dos Funcionarios Presentes

 sSQL := sSQL + ' ORDER BY UPPER(P.NOME)';


 qryFunc.Close;
 qryFunc.SQL.Clear;
 qryFunc.SQL.Add(sSQL);
 qryFunc.Open;

 with qryFunc do
 begin
   while not eof do
   begin
     chklstEmpregadoSim.Items.Add(FieldByName('Nome').AsString);
     ListaEmpregadoSim.Add(FieldByName('IdPessoa').AsString);
     ListaNumSeqSim.Add(FieldByName('NumSeq').AsString);
     Next;
   end;
   bbtnMarcaPresentes.Visible  := (not IsEmpty);
   Close;
 end;

end;


procedure TfrmRegPresenca.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ListaEmpregadoNao.Free;
  ListaEmpregadoSim.Free;
  ListaNumSeqNao.Free;
  ListaNumSeqSim.Free;
end;

procedure TfrmRegPresenca.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  pnlGridEscolha.SendToBack;
  SelecionachklstEmpregado;
end;

procedure TfrmRegPresenca.FormCreate(Sender: TObject);
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

procedure TfrmRegPresenca.dblcCursoCloseUp(Sender: TObject;
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

procedure TfrmRegPresenca.PreencheTela;
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

procedure TfrmRegPresenca.LimpaTela;
begin
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
  bbtnMarcaAusentes.Visible  := False;
  bbtnMarcaPresentes.Visible := False;
end;

procedure TfrmRegPresenca.bbtnApanhaClick(Sender: TObject);
begin
  inherited;
  PreencheTela;
  bbtnConfirmarClick(Self);
  dtedPresenca.Date := dtedIniReal.Date;
end;

procedure TfrmRegPresenca.sbtnAdicionarClick(Sender: TObject);
var
  I  : integer;
  Mensagem : TMensagem;
begin
  inherited;

  if  (MsgDlg('Confirma a Presença da(s) Pessoa(s) Selecionada(s) ?',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes)
  then exit;

  if not(qryDet.Active) then
    qryDet.Open;

  FezIncDel := false;

  for I:=0 to chklstEmpregadoNao.Items.Count-1 do
    if (chklstEmpregadoNao.checked[I]) then
    begin
      try
        StartTransacao;
        qryDet.Insert;
        qryDet.FieldByName('IDPESSOA').AsInteger := StrToInt(listaEmpregadoNao[I]);
        qryDet.FieldByName('IDCURSO').AsInteger  := tblCurso.FieldByName('IDCURSO').AsInteger;
        qryDet.FieldByName('NUMSEQ').Value       := StrToInt(listaNumSeqNao[I]);
        qryDet.FieldByName('DATAPRESENCA').AsdateTime := dtedPresenca.Date;
        qryDet.Post;
        qryDet.ApplyUpdates;
        CommitTransacao;
        FezIncDel := True;
      except
        RollBackTransacao;
        FezIncDel := False;
      end;


    end;

  if (FezIncDel) then
  begin
    qryDet.Close;
    qryDet.Open;
    bbtnConfirmarClick(Self);
  end;
end;

procedure TfrmRegPresenca.sbtnRemoverClick(Sender: TObject);
var
  I: integer;
begin
  inherited;

  if  (MsgDlg('Confirma a Exclusão da(s) Pessoa(s) Selecionada(s) da Lista de Presença ?',
              'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes)
  then exit;

  if not(qryDet.Active) then
    qryDet.Open;

  FezIncDel := false;

  for I:=0 to chklstEmpregadoSim.Items.Count-1 do
    if (chklstEmpregadoSim.checked[I]) then
    begin
      qryDet.Locate('IDPESSOA;IDCURSO;NUMSEQ;DATAPRESENCA',varArrayOf([StrToInt(listaEmpregadoSim[I]),
                         tblCurso.FieldByName('IDCURSO').AsInteger,
                         StrToInt(listaNumSeqSim[I]),
                         dtedPresenca.Date]),[]);
      try
        StartTransacao;
        qryDet.delete;
        qryDet.ApplyUpdates;
        CommitTransacao;
        FezIncDel := true;
      except
        RollBackTransacao;
        FezIncDel := false;
      end;
    end;

  if (FezIncDel) then
    bbtnConfirmarClick(Self);
end;

procedure TfrmRegPresenca.spbNomeClick(Sender: TObject);
begin
  inherited;
  chklstEmpregadoNao.Items.Clear;
  ListaEmpregadoNao := TStringList.Create;
  ListaNumSeqNao    := TStringList.Create;

  // Funcionarios Nao Presentes
  sSQL :=        'SELECT F.IDPESSOA, F.MATRICULA, P.NOME,  '   ;

  sSQL := sSQL + 'DECODE(F.TIPOCONTRATO,''E'',''Efetivo'', ''T'',''Temporário'',';
  sSQL := sSQL + ' ''G'',''Estagiário'', ''3'',''Terceiro'', ''A'',''Autônomo'', ';
  sSQL := sSQL + ' ''S'',''Efet. Esp.'', ''P'',''Proprietário'', ''Indefinido'') AS TIPOCONTRATO ';

  sSQL := sSQL + 'FROM   PESSOA P, FUNCIONARIO F '            ;
  sSQL := sSQL + 'WHERE  F.IDPESSOA       =  P.IDPESSOA AND ' ;
  sSQL := sSQL + '       F.IDPESSOA       IN '            ;
  sSQL := sSQL + '       (SELECT H.IDPESSOA FROM HSTTRN H  '  ;
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

  sSQL := sSQL + '    AND    NOT EXISTS (SELECT IDPESSOA FROM LISTAPRESENCA L '  ;
  sSQL := sSQL + '                       WHERE L.IDPESSOA = H.IDPESSOA '        ;
  sSQL := sSQL + '                       AND   L.IDCURSO  = H.IDCURSO '        ;
  sSQL := sSQL + '                       AND   L.NUMSEQ   = H.NUMSEQ '        ;
  sSQL := sSQL + '                       AND   L.DATAPRESENCA = TO_DATE('        ;
  sSQL := sSQL + QuotedStr(dtedPresenca.Text) + ',''DD/MM/YYYY'')) ';

  // Fim das condições por Seleção dos Funcionarios Nao Presentes

  sSQL := sSQL + ') ORDER BY UPPER(P.NOME)';


  qryFunc.Close;
  qryFunc.SQL.Clear;
  qryFunc.SQL.Add(sSQL);
  qryFunc.Open;

  with qryFunc do
  begin
    while not eof do
    begin
      chklstEmpregadoNao.Items.Add(copy(FieldByName('Nome').AsString +
                                        '                                     ',1,32) + ' ' +
                                        FieldByName('TipoContrato').AsString);
      ListaEmpregadoNao.Add(FieldByName('IdPessoa').AsString);
      ListaNumSeqNao.Add(FieldByName('NumSeq').AsString);
      Next;
    end;
    Close;
  end;
  OrdenaPorNome := true;
end;

procedure TfrmRegPresenca.spbTipoClick(Sender: TObject);
begin
  inherited;
 chklstEmpregadoNao.Items.Clear;
 ListaEmpregadoNao := TStringList.Create;
 ListaNumSeqNao    := TStringList.Create;

 // Funcionarios Nao Presentes
 sSQL :=        'SELECT F.IDPESSOA, F.MATRICULA, P.NOME,  '   ;

 sSQL := sSQL + 'DECODE(F.TIPOCONTRATO,''E'',''Efetivo'', ''T'',''Temporário'',';
 sSQL := sSQL + ' ''G'',''Estagiário'', ''3'',''Terceiro'', ''A'',''Autônomo'', ';
 sSQL := sSQL + ' ''S'',''Efet. Esp.'', ''P'',''Proprietário'', ''Indefinido'') AS TIPOCONTRATO ';

 sSQL := sSQL + 'FROM   PESSOA P, FUNCIONARIO F '            ;
 sSQL := sSQL + 'WHERE  F.IDPESSOA       =  P.IDPESSOA AND ' ;
 sSQL := sSQL + '       F.IDPESSOA       IN '            ;
 sSQL := sSQL + '       (SELECT H.IDPESSOA FROM HSTTRN H  '  ;
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

 sSQL := sSQL + '    AND    NOT EXISTS (SELECT IDPESSOA FROM LISTAPRESENCA L '  ;
 sSQL := sSQL + '                       WHERE L.IDPESSOA = H.IDPESSOA '        ;
 sSQL := sSQL + '                       AND   L.IDCURSO  = H.IDCURSO '        ;
 sSQL := sSQL + '                       AND   L.NUMSEQ   = H.NUMSEQ '        ;
 sSQL := sSQL + '                       AND   L.DATAPRESENCA = TO_DATE('        ;
 sSQL := sSQL + QuotedStr(dtedPresenca.Text) + ',''DD/MM/YYYY'')) ';

 // Fim das condições por Seleção dos Funcionarios Nao Presentes

 sSQL := sSQL + ') ORDER BY TIPOCONTRATO, UPPER(P.NOME)';


 qryFunc.Close;
 qryFunc.SQL.Clear;
 qryFunc.SQL.Add(sSQL);
 qryFunc.Open;

 with qryFunc do
 begin
   while not eof do
   begin
     chklstEmpregadoNao.Items.Add(copy(FieldByName('Nome').AsString +
                                       '                                     ',1,32) + ' ' +
                                       FieldByName('TipoContrato').AsString);
     ListaEmpregadoNao.Add(FieldByName('IdPessoa').AsString);
     ListaNumSeqNao.Add(FieldByName('NumSeq').AsString);
     Next;
   end;
   Close;
 end;
 OrdenaPorNome := False;

end;

procedure TfrmRegPresenca.bbtnMarcaAusentesClick(Sender: TObject);
var
  c: Integer;
begin
  inherited;
  for c := 0 to chklstEmpregadoNao.Items.Count - 1  do
      chklstEmpregadoNao.Checked[c] := True;

end;

procedure TfrmRegPresenca.bbtnMarcaPresentesClick(Sender: TObject);
var
  c: Integer;
begin
  inherited;
  for c := 0 to chklstEmpregadoSim.Items.Count - 1  do
      chklstEmpregadoSim.Checked[c] := True;

end;

procedure TfrmRegPresenca.dtedPresencaChange(Sender: TObject);
begin
  inherited;
  try
    StrToDate(dtedPresenca.Text);

    if (dtedPresenca.Date < dtedIniReal.Date) then
    begin
      MsgDlg('Data da Lista de Presença não pode ser anterior à de início do curso',
             'Aviso', mtInformation,[mbOk,mbHelp],0);
      dtedPresenca.Date := dtedIniReal.Date;
      dtedPresenca.SetFocus;
      exit;
    end;

    if (dtedFimReal.Text <> '') and (dtedPresenca.Date > dtedFimReal.Date) then
    begin
      MsgDlg('Data da Lista de Presença não pode ser posterior à de final do curso',
             'Aviso', mtInformation,[mbOk,mbHelp],0);
      dtedPresenca.Date := dtedFimReal.Date;
      dtedPresenca.SetFocus;
      exit;
    end;

    if (dtedFimPlan.Text <> '') and (dtedFimReal.Text = '') and (dtedPresenca.Date > dtedFimPlan.Date) then
    begin
      MsgDlg('Data da Lista de Presença não pode ser posterior à de final do curso',
             'Aviso', mtInformation,[mbOk,mbHelp],0);
      dtedPresenca.Date := dtedFimPlan.Date;
      dtedPresenca.SetFocus;
      exit;
    end;

    SelecionachklstEmpregado;
  except
  end;
end;

procedure TfrmRegPresenca.sbtnImprimirListaClick(Sender: TObject);
begin
  inherited;
  RptListaPresenca := TRptListaPresenca.Create(Application);
  RptListaPresenca.sCurso      := dblcCurso.Text;
  RptListaPresenca.sEntid      := dblcEntid.Text;
  RptListaPresenca.sInstrutor  := dblcInstrutor.Text;
  RptListaPresenca.sIdCurso    := tblCurso.FieldByName('IDCURSO').AsString;
  RptListaPresenca.sIdEntid    := qryEntid.FieldByName('IDPESSOA').AsString;
  RptListaPresenca.sIdInstrutor:= qryInstrutor.FieldByName('IDPESSOA').AsString;
  RptListaPresenca.sIniPlan    := dtedIniPlan.Text;
  RptListaPresenca.sFimPlan    := dtedFimPlan.Text;
  RptListaPresenca.sIniReal    := dtedIniReal.Text;
  RptListaPresenca.sFimReal    := dtedFimReal.Text;
  RptListaPresenca.sDataIni    := dtedPresenca.Text;
  RptListaPresenca.sDataFim    := DateToStr(dtedPresenca.Date + 9);
  if (dtedFimReal.Text <> '') and (dtedPresenca.Date + 9 > dtedFimReal.Date) then
    RptListaPresenca.sDataFim    := DateToStr(dtedFimReal.Date);
  if (dtedFimPlan.Text <> '') and (dtedFimReal.Text = '') and (dtedPresenca.Date+9 > dtedFimPlan.Date) then
    RptListaPresenca.sDataFim    := DateToStr(dtedFimPlan.Date);

  RptListaPresenca.CrmRptCMBeforePrint(Sender);
  RptListaPresenca.CrmRptCM.IdReports := 3837;
  RptListaPresenca.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
  RptListaPresenca.CrmRptCM.OrigemCM := 1;
  RptListaPresenca.CrmRptCM.IdModulo := Sistema.IdModulo;
  RptListaPresenca.CrmRptCM.IdUsuario := Sistema.IdUsuario;
  RptListaPresenca.CrmRptCM.Print;
  FreeAndNil(RptListaPresenca);
end;

end.
