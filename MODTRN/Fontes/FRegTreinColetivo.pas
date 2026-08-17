//==================================================================================
//Analista.: Henrique Massão
//Kintana..: 625235
//SOL......: 124003
//Data.....: 04/09/2009
//Descrição: dblckEntid recebe o campo razaosocial e não mais o idpessoa.
//===============================================================================
unit FRegTreinColetivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, wwdblook, Db, DBTables,
  Wwquery, checklst, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Wwtable,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmRegTreinColetivo = class(TfrmOkCancelar)
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
    bbtnNovo: TBitBtn;
    bbtnApanha: TBitBtn;
    qryUltSeq: TwwQuery;
    spbNome: TSpeedButton;
    spbTipo: TSpeedButton;
    Label1: TLabel;
    dblcInstrutor: TwwDBLookupCombo;
    qryInstrutor: TwwQuery;
    edLocalCurso: TEdit;
    Label2: TLabel;
    bbtnAtualizaInscricoes: TBitBtn;
    qryAux: TwwQuery;
    rgAvalCurs: TRadioGroup;
    dsDet: TwwDataSource;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    bbtnSelecionaInscricoes: TBitBtn;
    spbtnCandFunc: TSpeedButton;
    sbtnImprimirCarta: TSpeedButton;
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcCursoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure bbtnApanhaClick(Sender: TObject);
    procedure bbtnNovoClick(Sender: TObject);
    procedure sbtnAdicionarClick(Sender: TObject);
    procedure sbtnRemoverClick(Sender: TObject);
    procedure spbNomeClick(Sender: TObject);
    procedure spbTipoClick(Sender: TObject);
    procedure bbtnAtualizaInscricoesClick(Sender: TObject);
    procedure bbtnSelecionaInscricoesClick(Sender: TObject);
    procedure spbtnCandFuncClick(Sender: TObject);
    procedure dblcEntidChange(Sender: TObject);
    procedure sbtnImprimirCartaClick(Sender: TObject);
    procedure dblcEntidEnter(Sender: TObject);
  private
    ListaEmpregadoNao, ListaEmpregadoSim, ListaNumSeq: TStringList;

    procedure AtualizaUpdSql;
    procedure SelecionachklstEmpregado;
    procedure PreencheTela;
    procedure LimpaTela;
    procedure RAD_e_Mensagem(sNome: String);
  end;

var
  frmRegTreinColetivo: TfrmRegTreinColetivo;
  ProxSeq: integer;
  FezIncDel, OrdenaPorNome, bEmpregado: boolean;
  sDataFinalAntes, sDataFinalDepois, sDataIniAntes, sDataIniDepois, sSql, updSql: string;
  LstFunc, LstNome: TStringList;
  iIdTipoProcesso: Longint;

implementation

uses uCMTypes, uMensErro, UsoGeralRH, uFuncoesUteisRH, uRAD, uSistema, uDataBase, DBaseDados,
  CorreioCM, FSelTreinColetivo, FTelaAut, RCartaConvoc;

{$R *.DFM}

procedure TfrmRegTreinColetivo.SelecionachklstEmpregado;
begin
 chklstEmpregadoNao.Items.Clear;
 chklstEmpregadoSim.Items.Clear;
 ListaEmpregadoNao := TStringList.Create;
 ListaEmpregadoSim := TStringList.Create;
 ListaNumSeq       := TStringList.Create;

 // Funcionarios Nao Inscritos
 sSQL :=        'SELECT F.IDPESSOA, P.NOME,  '   ;
 if bEmpregado then
   sSQL := sSQL + 'F.MATRICULA, '
 else
   sSQL := sSQL + 'TO_CHAR(F.IDPESSOA) AS MATRICULA, ';

 sSQL := sSQL + 'DECODE(F.TIPOCONTRATO,''E'',''Efetivo'', ''T'',''Temporário'',';
 sSQL := sSQL + ' ''G'',''Estagiário'', ''3'',''Terceiro'', ''A'',''Autônomo'', ';
 sSQL := sSQL + ' ''S'',''Efet. Esp.'', ''P'',''Proprietário'', ''Indefinido'') AS TIPOCONTRATO ';

 sSQL := sSQL + 'FROM   PESSOA P, ';
 if bEmpregado then
   sSQL := sSQL + 'FUNCIONARIO F '
 else
   sSQL := sSQL + 'CANDIDAT F ';

 sSQL := sSQL + 'WHERE  F.IDPESSOA       =  P.IDPESSOA AND ' ;

 if (bEmpregado) and (sUsuXccusto <> '') then
    sSQL := sSQL + ' F.CODCENTROCUSTO IN ' + sUsuXccusto + ' AND ';

 if (bEmpregado) and (sUsuXfilial <> '') then
    sSQL := sSQL + ' F.IDESTAB IN ' + sUsuXfilial + ' AND ';

 sSQL := sSQL + '       F.IDPESSOA       NOT IN '            ;
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
 // Fim das condições por Seleção dos Funcionarios Nao Inscritos

 if OrdenaPorNome then
    sSQL := sSQL + ') ORDER BY UPPER(P.NOME)'
 else
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
     Next;
   end;
   bbtnSelecionaInscricoes.Visible := (not IsEmpty);
   sbtnImprimirCarta.Visible       := (not IsEmpty);
   Close;
 end;


 // Funcionarios Inscritos
 sSQL :=        'SELECT UPPER(P.NOME) AS UPNOME, F.IDPESSOA, P.NOME, H1.NUMSEQ '  ;

 sSQL := sSQL + 'FROM   PESSOA P, FUNCIONARIO F, ';

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

 sSQL := sSQL + ') H1 WHERE  F.IDPESSOA       =  P.IDPESSOA AND ' ;

 if (bEmpregado) and (sUsuXccusto <> '') then
    sSQL := sSQL + ' F.CODCENTROCUSTO IN ' + sUsuXccusto + ' AND ';

 if (bEmpregado) and (sUsuXfilial <> '') then
    sSQL := sSQL + ' F.IDESTAB IN ' + sUsuXfilial + ' AND ';

 sSQL := sSQL + '       F.IDPESSOA       =  H1.IDPESSOA    ' ;

 // Fim das condições por Seleção dos Funcionarios Inscritos

 // Candidatos Inscritos
 sSQL := sSQL + 'UNION SELECT UPPER(P.NOME) AS UPNOME, F.IDPESSOA, ';
 sSQL := sSQL + 'P.NOME, H1.NUMSEQ '  ;

 sSQL := sSQL + 'FROM   PESSOA P, CANDIDAT F, ';

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

 sSQL := sSQL + ') H1 WHERE  F.IDPESSOA       =  P.IDPESSOA AND ' ;

 sSQL := sSQL + '       F.IDPESSOA       =  H1.IDPESSOA    ' ;

 // Fim das condições por Seleção dos Candidatos Inscritos


 sSQL := sSQL + ' ORDER BY 1';

 AtualizaUpdSql;

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
     ListaNumSeq.Add(FieldByName('NumSeq').AsString);
     Next;
   end;
   bbtnAtualizaInscricoes.Visible  := (not IsEmpty);
   Close;
 end;

end;


procedure TfrmRegTreinColetivo.bbtnSairClick(Sender: TObject);
begin
  inherited;
  ListaEmpregadoNao.Free;
  ListaEmpregadoSim.Free;
end;

procedure TfrmRegTreinColetivo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  pnlGridEscolha.SendToBack;
  SelecionachklstEmpregado;
end;

procedure TfrmRegTreinColetivo.FormCreate(Sender: TObject);
begin
  inherited;
  if (Sistema.IdModulo = 417) then
     HelpContext := 4170013;

  if sUsoGeralIdPessoa <> '' then
  begin
    MsgDlg('Utilize a Tela de Registro Individual', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    Close;
  end;
  tblCurso.Open;
  qryEntid.Open;
  qryInstrutor.Open;
  qryHsttrn.Close;
  qryHsttrn.ParamByName('IdCurso').AsInteger := -1;
  qryHsttrn.Open;
  OrdenaPorNome := True;
  bEmpregado    := True;

  iIdTipoProcesso := -1;
  If Sistema.UsaRAD Then
  Begin
     Rad := TRad.Create;
     If Fazquery(DtmBaseDados.qry,'SELECT IDTIPOPROCESSO FROM RADTIPOPROCESSO WHERE (IDREFERENCIA = 20)') Then
        iIdTipoProcesso := DtmBaseDados.qry.FieldByName('IDTIPOPROCESSO').asInteger;
  End;

end;

procedure TfrmRegTreinColetivo.dblcCursoCloseUp(Sender: TObject;
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
         dblcEntid.LookupValue := qryEntid.FieldByName('RAZAOSOCIAL').Value;
         dblcEntid.Update;
      end;
      bbtnApanha.Enabled := (not qryHsttrn.IsEmpty);
  end;
  if dblcCurso.Text <> ''  then  bbtnNovo.Enabled := True;
end;

procedure TfrmRegTreinColetivo.PreencheTela;
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
  redTeoria.Value      := tblCurso.FieldByName('DUR_TEOR').asFloat;
  redPratica.Value     := tblCurso.FieldByName('DUR_PRAT').asFloat;
  redTotal.Value       := redTeoria.Value + redPratica.Value;
  redValCurso.Value    := tblCurso.FieldByName('VALOR').AsFloat;
end;

procedure TfrmRegTreinColetivo.LimpaTela;
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
  bbtnAtualizaInscricoes.Visible  := False;
  bbtnSelecionaInscricoes.Visible := False;
  sbtnImprimirCarta.Visible       := False;
end;

procedure TfrmRegTreinColetivo.bbtnApanhaClick(Sender: TObject);
begin
  inherited;
  PreencheTela;
  bbtnConfirmarClick(Self);
  sDataFinalAntes := dtedFimReal.Text;
  sDataIniAntes   := dtedIniReal.Text;
end;

procedure TfrmRegTreinColetivo.bbtnNovoClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
  bbtnConfirmarClick(Self);
  sDataFinalAntes := '';
  sDataIniAntes   := '';
  redTeoria.Value      := tblCurso.FieldByName('DUR_TEOR').AsInteger;
  redPratica.Value     := tblCurso.FieldByName('DUR_PRAT').AsInteger;
  redTotal.Value       := redTeoria.Value + redPratica.Value;
  redValCurso.Value    := tblCurso.FieldByName('VALOR').AsFloat;
  if not tblCurso.FieldByName('IDENTIDINSTR').isNull then
  begin
     qryEntid.Locate('IDPESSOA', tblCurso.FieldByName('IDENTIDINSTR').Value,[]);
     dblcEntid.LookupValue := qryEntid.FieldByName('IDPESSOA').Value;
     dblcEntid.Update;
  end;

end;

procedure TfrmRegTreinColetivo.sbtnAdicionarClick(Sender: TObject);
var
  I  : integer;
  Mensagem : TMensagem;
begin
  inherited;
  sDataFinalDepois := dtedFimReal.Text;
  sDataIniDepois   := dtedIniReal.Text;

  if
      ((dtedFimReal.Text <> '') and
      (MsgDlg('Curso Já Realizado. Confirma a Inscrição da(s) Pessoa(s) Selecionada(s) ?',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes))
  or
      ((dtedFimReal.Text = '') and (dtedIniReal.Text <> '') and
      (MsgDlg('Curso Já Iniciado. Confirma a Inscrição da(s) Pessoa(s) Selecionada(s) ?',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes))
  or
      ((dtedFimReal.Text = '') and (dtedIniReal.Text = '') and
      (MsgDlg('Confirma a Inscrição da(s) Pessoa(s) Selecionada(s) ?',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes))
  then exit;

  if not(qryDet.Active) then
    qryDet.Open;

  FezIncDel := false;

  for I:=0 to chklstEmpregadoNao.Items.Count-1 do
    if (chklstEmpregadoNao.checked[I]) then
    begin
      qryUltSeq.Close;
      qryUltSeq.ParamByName('IDPESSOA').AsInteger := StrToInt(listaEmpregadoNao[I]);
      qryUltSeq.ParamByName('IDCURSO').AsInteger  := tblCurso.FieldByName('IDCURSO').AsInteger;
      qryUltSeq.Open;
      ProxSeq := qryUltSeq.FieldByName('ULTSEQ').AsInteger + 1;

      if (ProxSeq > 1) and
         (MsgDlg('Já consta esse curso para ' + trim(copy(chklstEmpregadoNao.Items[I],1,32)) +
                 '. Deseja registrar nova ocorrência ?',
               'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes) then
         Continue;

      try
        StartTransacao;
        qryDet.Insert;
        qryDet.FieldByName('IDPESSOA').AsInteger := StrToInt(listaEmpregadoNao[I]);
        qryDet.FieldByName('IDCURSO').AsInteger  := tblCurso.FieldByName('IDCURSO').AsInteger;
        qryDet.FieldByName('NUMSEQ').Value       := ProxSeq;
        qryDet.FieldByName('FLGCONTROLE').AsInteger := 1 - rgControle.ItemIndex;
        qryDet.FieldByName('FLGAVALCURS').AsInteger := 1 - rgAvalCurs.ItemIndex;

        if dblcEntid.Text <> ''  then
          qryDet.FieldByName('IDENTIDINSTR').AsInteger :=
            qryEntid.FieldByName('IDPESSOA').AsInteger;
        if dblcInstrutor.Text <> ''  then
          qryDet.FieldByName('IDINSTRUTOR').AsInteger  :=
            qryInstrutor.FieldByName('IDPESSOA').AsInteger;
        if dtedIniPlan.Text <> '' then
          qryDet.FieldByName('DATPLINI').Value := dtedIniPlan.Date;
        if dtedFimPlan.Text <> '' then
          qryDet.FieldByName('DATPLFIM').Value := dtedFimPlan.Date;
        if dtedIniReal.Text <> '' then
          qryDet.FieldByName('DATREINI').Value := dtedIniReal.Date;
        if dtedFimReal.Text <> '' then
          qryDet.FieldByName('DATREFIM').Value := dtedFimReal.Date;

        qryDet.FieldByName('DUR_TEOR').Value := redTeoria.Value;
        qryDet.FieldByName('DUR_PRAT').Value := redPratica.Value;
        qryDet.FieldByName('DUR_TOT').Value  := redTeoria.Value + redPratica.Value;
        qryDet.FieldByName('VALOR').AsFloat      := redValCurso.Value;
        qryDet.FieldByName('DESP_VIAG').AsFloat  := redValViagem.Value;
        qryDet.FieldByName('DESP_ESTAD').AsFloat := redValHosp.Value;
        qryDet.FieldByName('DESP_OUTR').AsFloat  := redValOutras.Value;
        qryDet.FieldByName('LOCALCURSO').AsString:= edLocalCurso.Text;
        qryDet.Post;
        qryDet.ApplyUpdates;
        CommitTransacao;
        FezIncDel := True;
      except
        RollBackTransacao;
        FezIncDel := False;
      end;

      RAD_e_Mensagem(chklstEmpregadoNao.Items[I]);

    end;

  if (FezIncDel) then
  begin
    qryDet.Close;
    qryDet.Open;
    bbtnConfirmarClick(Self);
  end;
end;

procedure TfrmRegTreinColetivo.sbtnRemoverClick(Sender: TObject);
var
  I: integer;
begin
  inherited;
  if ((dtedFimReal.Text <> '') and
      (MsgDlg('Curso Já Realizado. Confirma a Exclusão da(s) Pessoa(s) Selecionada(s) ?',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes))
  or
      ((dtedFimReal.Text = '') and (dtedIniReal.Text <> '') and
      (MsgDlg('Curso Já Iniciado. Confirma a Exclusão da(s) Pessoa(s) Selecionada(s) ?',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes))
  or
      ((dtedFimReal.Text = '') and (dtedIniReal.Text = '') and
      (MsgDlg('Confirma a Exclusão da(s) Pessoa(s) Selecionada(s) ?',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes))
  then exit;

  if not(qryDet.Active) then
    qryDet.Open;

  FezIncDel := false;

  for I:=0 to chklstEmpregadoSim.Items.Count-1 do
    if (chklstEmpregadoSim.checked[I]) then
    begin

      qryDet.Locate('IDPESSOA;IDCURSO;NUMSEQ',varArrayOf([StrToInt(listaEmpregadoSim[I]),
                         tblCurso.FieldByName('IDCURSO').AsInteger,
                         StrToInt(listaNumSeq[I])]),[]);
      try
        StartTransacao;

        DtmBaseDados.qry.Sql.Clear;
        DtmBaseDados.qry.Sql.Add('DELETE LISTAPRESENCA ');
        DtmBaseDados.qry.Sql.Add('WHERE IDPESSOA = '+ listaEmpregadoSim[I]);
        DtmBaseDados.qry.Sql.Add('AND   IDCURSO  = '+ tblCurso.FieldByName('IDCURSO').AsString);
        DtmBaseDados.qry.Sql.Add('AND   NUMSEQ   = '+ listaNumSeq[I]);
        DtmBaseDados.qry.ExecSQL;

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

procedure TfrmRegTreinColetivo.spbNomeClick(Sender: TObject);
begin
  inherited;
  chklstEmpregadoNao.Items.Clear;
  ListaEmpregadoNao := TStringList.Create;

  // Funcionarios Nao Inscritos
  sSQL :=        'SELECT F.IDPESSOA, P.NOME,  '   ;
 if bEmpregado then
   sSQL := sSQL + 'F.MATRICULA, '
 else
   sSQL := sSQL + 'TO_CHAR(F.IDPESSOA) AS MATRICULA, ';

  sSQL := sSQL + 'DECODE(F.TIPOCONTRATO,''E'',''Efetivo'', ''T'',''Temporário'',';
  sSQL := sSQL + ' ''G'',''Estagiário'', ''3'',''Terceiro'', ''A'',''Autônomo'', ';
  sSQL := sSQL + ' ''S'',''Efet. Esp.'', ''P'',''Proprietário'', ''Indefinido'') AS TIPOCONTRATO ';

  sSQL := sSQL + 'FROM   PESSOA P, ';
  if bEmpregado then
    sSQL := sSQL + 'FUNCIONARIO F '
  else
    sSQL := sSQL + 'CANDIDAT F ';

  sSQL := sSQL + 'WHERE  F.IDPESSOA       =  P.IDPESSOA AND ' ;
  sSQL := sSQL + '       F.IDPESSOA       NOT IN '            ;
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
  // Fim das condições por Seleção dos Funcionarios Nao Inscritos

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
      Next;
    end;
    Close;
  end;
  OrdenaPorNome := true;
end;

procedure TfrmRegTreinColetivo.spbTipoClick(Sender: TObject);
begin
  inherited;
 chklstEmpregadoNao.Items.Clear;
 ListaEmpregadoNao := TStringList.Create;

 // Funcionarios Nao Inscritos
 sSQL :=        'SELECT F.IDPESSOA, P.NOME,  '   ;
 if bEmpregado then
   sSQL := sSQL + 'F.MATRICULA, '
 else
   sSQL := sSQL + 'TO_CHAR(F.IDPESSOA) AS MATRICULA, ';

 sSQL := sSQL + 'DECODE(F.TIPOCONTRATO,''E'',''Efetivo'', ''T'',''Temporário'',';
 sSQL := sSQL + ' ''G'',''Estagiário'', ''3'',''Terceiro'', ''A'',''Autônomo'', ';
 sSQL := sSQL + ' ''S'',''Efet. Esp.'', ''P'',''Proprietário'', ''Indefinido'') AS TIPOCONTRATO ';

 sSQL := sSQL + 'FROM   PESSOA P, ';
 if bEmpregado then
   sSQL := sSQL + 'FUNCIONARIO F '
 else
   sSQL := sSQL + 'CANDIDAT F ';

 sSQL := sSQL + 'WHERE  F.IDPESSOA       =  P.IDPESSOA AND ' ;
 sSQL := sSQL + '       F.IDPESSOA       NOT IN '            ;
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
 // Fim das condições por Seleção dos Funcionarios Nao Inscritos

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
     Next;
   end;
   Close;
 end;
 OrdenaPorNome := False;

end;

procedure TfrmRegTreinColetivo.bbtnAtualizaInscricoesClick(Sender: TObject);
var
  bAtuOutros: boolean;
  Mensagem: TMensagem;
begin
  inherited;
  sDataFinalDepois := dtedFimReal.Text;
  sDataIniDepois := dtedIniReal.Text;

  if (MsgDlg('Confirma a Alteração da(s) Pessoa(s) Inscrita(s)?',
      'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes) then
    exit;

  // Verifica Processos RAD não concluídos
  if (Sistema.UsaRAD) and (iIdTipoProcesso > 0) and (rgControle.ItemIndex = 0) and
     ((sDataIniAntes = '') and (sDataIniDepois <> '') or (sDataFinalAntes = '') and
     (sDataFinalDepois <> '')) then
  begin
    sSql := 'SELECT COUNT(*) AS CONTA FROM HSTTRN H, RADINSTPROCESSO R ';
    qryAux.Sql.Clear;
    qryAux.Sql.Add(sSQL + updSql);
    qryAux.Sql.Add(' AND H.IDPROCESSO = R.IDPROCESSO');
    qryAux.Sql.Add(' AND R.FLGOK(+) <> ''S'' ');
    qryAux.Open;

    if qryAux.FieldByName('CONTA').AsInteger > 0 then
    begin
      MsgDlg('Não Foi Possível Atualizar os Dados. ' +
              iff(qryAux.FieldByName('CONTA').AsInteger > 1,
              'Existem ' + qryAux.FieldByName('CONTA').AsString +
              ' Processos RAD Não Concluídos.',
              'Existe 1 Processo RAD Não Concluído.'),
             'Aviso', mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;
  end;
  // Fim Verifica Processos RAD não concluídos

  sSQL := 'UPDATE HSTTRN H '                ;
  if dblcEntid.Text <> '' then
  begin
    sSQL := sSQL + ' SET    H.IDENTIDINSTR = ';
    sSQL := sSQL + qryEntid.FieldByName('IDPESSOA').AsString;
  end
  else
    sSQL := sSQL + ' SET    H.IDENTIDINSTR = NULL';

  if dblcInstrutor.Text <> '' then
  begin
    sSQL := sSQL + ', H.IDINSTRUTOR = ';
    sSQL := sSQL + qryInstrutor.FieldByName('IDPESSOA').AsString;
  end
  else
    sSQL := sSQL + ', H.IDINSTRUTOR = NULL';

  if dtedIniPlan.Text <> '' then
  begin
    sSQL := sSQL + ', H.DATPLINI = TO_DATE('''     ;
    sSQL := sSQL + dtedIniPlan.Text + ''',''dd/mm/yyyy'') '     ;
  end
  else
    sSQL := sSQL + ', H.DATPLINI  = NULL '        ;

  if dtedFimPlan.Text <> '' then
  begin
    sSQL := sSQL + ', H.DATPLFIM = TO_DATE('''     ;
    sSQL := sSQL + dtedFimPlan.Text + ''',''dd/mm/yyyy'') '     ;
  end
  else
    sSQL := sSQL + ', H.DATPLFIM  = NULL '        ;

  if dtedIniReal.Text <> '' then
  begin
    sSQL := sSQL + ', H.DATREINI = TO_DATE('''     ;
    sSQL := sSQL + dtedIniReal.Text + ''',''dd/mm/yyyy'') '     ;
  end
  else
    sSQL := sSQL + ', H.DATREINI  = NULL '        ;

  if dtedFimReal.Text <> '' then
  begin
    sSQL := sSQL + ', H.DATREFIM = TO_DATE('''     ;
    sSQL := sSQL + dtedFimReal.Text + ''',''dd/mm/yyyy'') '    ;
  end
  else
    sSQL := sSQL + ', H.DATREFIM  = NULL '        ;

  sSQL := sSQL + ', FLGCONTROLE   = ' + IntToStr(1 - rgControle.ItemIndex);
  sSQL := sSQL + ', FLGAVALCURS   = ' + IntToStr(1 - rgAvalCurs.ItemIndex);

  sSQL := sSQL + ', DUR_TEOR   = ' + Float2String(redTeoria.Value);
  sSQL := sSQL + ', DUR_PRAT   = ' + Float2String(redPratica.Value);
  sSQL := sSQL + ', DUR_TOT    = (' +  Float2String(redTeoria.Value) + '+' + Float2String(redPratica.Value) + ')';
  sSQL := sSQL + ', VALOR      = ' + Float2String(redValCurso.Value);

  bAtuOutros := False;
  if  (MsgDlg('Atualiza Também os Valores de Viagem, Hospedagem e Outras ?',
       'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes)
  then begin
    sSQL := sSQL + ', DESP_VIAG  = ' + Float2String(redValViagem.Value);
    sSQL := sSQL + ', DESP_ESTAD = ' + Float2String(redValHosp.Value);
    sSQL := sSQL + ', DESP_OUTR  = ' + Float2String(redValOutras.Value);
    bAtuOutros := True;
  end;

  sSQL := sSQL + ', LOCALCURSO = ' + QuotedStr(edLocalCurso.Text);

  qryAux.Sql.Clear;
  qryAux.Sql.Add(sSQL + updSql);
  try
    qryAux.ExecSQL;
    AtualizaUpdSql;
  except
    MsgDlg('Não Foi Possível Atualizar os Dados', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
  end;

  // Atualiza Valor no RAD
  If ( Sistema.UsaRAD ) And (iIdTipoProcesso > 0) Then
  Begin
      sSQL :=  'UPDATE RADINSTPROCESSO SET VLRPROC = ' +
                OraNumero(FloatToStr(redValCurso.Value + iff(bAtuOutros,
                                redValViagem.Value +
                                redValHosp.Value +
                                redValOutras.Value,0))) +
              ' WHERE IDPROCESSO IN (SELECT IDPROCESSO FROM HSTTRN H ' +
               updSql + ' AND IDPROCESSO IS NOT NULL)';


      DtmBaseDados.qry.Close;
      DtmBaseDados.qry.SQL.Clear;
      DtmBaseDados.qry.SQL.Add(sSQL);
      try
        if sSQL <> ''
        then DtmBaseDados.qry.ExecSQL;
      except
            MsgDlg('Erro ao tentar atualizar o processo no R.A.D.','Erro',mtError,[mbOK],0);
            Abort;
      end;//try
  End;

  // Envia mensagens para os cursos concluídos
  if (rgControle.ItemIndex = 0) and (rgAvalCurs.ItemIndex = 0) and
     (sDataFinalAntes = '') and (sDataFinalDepois <> '') then
  begin
    sSql := 'SELECT IDPESSOA FROM HSTTRN H ';
    qryAux.Sql.Clear;
    qryAux.Sql.Add(sSQL + updSql);
    qryAux.Open;

    if not(qryAux.EOF) then
      Mensagem := TMensagem.Create(Self);

    try
      while not(qryAux.EOF) do
      begin
        Mensagem.Nova;
        Mensagem.IdDestinatario := qryAux.FieldByName('IDPESSOA').AsInteger;
        Mensagem.IdRemetente := Sistema.IdUsuario;
        Mensagem.Assunto := 'Avaliação de Treinamento';
        Mensagem.NomeRemetente := Sistema.NomeUsuario;
        Mensagem.TipoDestinatario := tdUsuario;
        Mensagem.Mensagem := 'Não esqueça de fazer a sua avaliação do curso ' +
                              dblcCurso.Text +
                             ' concluído em ' + sDataFinalDepois;
        Mensagem.Envia;
        qryAux.Next;
      end;
    finally
      Mensagem.Free;
    end;
  end;
  // Fim Envia mensagens para os cursos concluídos
end;

procedure TfrmRegTreinColetivo.AtualizaUpdSql;
begin
 // Salva Condições para eventual atualização posterior
 updSql := ' WHERE  H.IDCURSO = ' ;
 updSql := updSql + tblCurso.FieldByName('IDCURSO').AsString     ;
 if dblcEntid.Text <> '' then begin
    updSql := updSql + '        AND    H.IDENTIDINSTR = '           ;
    updSql := updSql + qryEntid.FieldByName('IDPESSOA').AsString;
 end;

 if dblcInstrutor.Text <> '' then begin
    updSql := updSql + '        AND    H.IDINSTRUTOR = '           ;
    updSql := updSql + qryInstrutor.FieldByName('IDPESSOA').AsString;
 end;

 if dtedIniPlan.Text <> '' then begin
    updSql := updSql + '        AND    H.DATPLINI = TO_DATE('''     ;
    updSql := updSql + dtedIniPlan.Text + ''',''dd/mm/yyyy'') '     ;
 end
 else
    updSql := updSql + '        AND    H.DATPLINI  IS NULL '        ;

 if dtedFimPlan.Text <> '' then begin
    updSql := updSql + '        AND    H.DATPLFIM = TO_DATE('''     ;
    updSql := updSql + dtedFimPlan.Text + ''',''dd/mm/yyyy'') '     ;
 end
 else
    updSql := updSql + '        AND    H.DATPLFIM  IS NULL '        ;

 if dtedIniReal.Text <> '' then begin
    updSql := updSql + '        AND    H.DATREINI = TO_DATE('''     ;
    updSql := updSql + dtedIniReal.Text + ''',''dd/mm/yyyy'') '     ;
 end
 else
    updSql := updSql + '        AND    H.DATREINI  IS NULL '        ;

 if dtedFimReal.Text <> '' then begin
    updSql := updSql + '        AND    H.DATREFIM = TO_DATE('''     ;
    updSql := updSql + dtedFimReal.Text + ''',''dd/mm/yyyy'') '    ;
 end
 else
    updSql := updSql + '        AND    H.DATREFIM  IS NULL '        ;


 if (bEmpregado) and (sUsuXccusto <> '') then
    updSql := updSql + ' AND H.IDPESSOA IN (SELECT IDPESSOA FROM FUNCIONARIO ' +
                       ' WHERE CODCENTROCUSTO IN ' + sUsuXccusto + ') ';

 if (bEmpregado) and (sUsuXfilial <> '') then
    updSql := updSql + ' AND H.IDPESSOA IN (SELECT IDPESSOA FROM FUNCIONARIO ' +
                       ' WHERE IDESTAB IN ' + sUsuXfilial + ') ';
 // Fim Salva condições

end;

procedure TfrmRegTreinColetivo.RAD_e_Mensagem(sNome: String);
var
  Mensagem: TMensagem;
begin
  if (bEmpregado) and (Sistema.UsaRAD) and (iIdTipoProcesso > 0) and (rgControle.ItemIndex = 0) and
     (qryDet.FieldByName('IDPROCESSO').AsInteger <= 0) and
     (qryDet.FieldByName('DATREINI').AsString = '') and
     (qryDet.FieldByName('DATREFIM').AsString = '') then
  begin
    Rad.TipoProcesso    := iIdTipoProcesso;
    Rad.IdPessoa := Sistema.IdEmpresa;
    //Rad.CodCentroRespon := dblcCentRespon.LookupValue;
    //Rad.UnidNegoc       := StrToInt(dblcAtiv.LookupValue);
    Rad.OBS := 'Treinamento de ' + sNome +
               ' em ' + dblcCurso.Text +
               ' iniciando em ' + qryDet.FieldByName('DATPLINI').AsString;
    Rad.Valor := qryDet.FieldByName('VALOR').AsFloat +
                 qryDet.FieldByName('DESP_VIAG').AsFloat +
                 qryDet.FieldByName('DESP_ESTAD').AsFloat +
                 qryDet.FieldByName('DESP_OUTR').AsFloat;

    with (DtmBaseDados.qry) do
    begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT IDEMPRESA, CODCENTROCUSTO FROM FUNCIONARIO WHERE IDPESSOA = '+
               qryDet.FieldByName('IDPESSOA').asString);
      Open;
      if not(IsEmpty) then
      begin
        Rad.IdEmpresa := FieldByName('IDEMPRESA').AsInteger;
        Rad.CodCentroCusto := FieldByName('CODCENTROCUSTO').AsString;
      end;
      Close;
    end;

    //Rad.CodGrupoProd    := sGrupoProd;
    try
      StartTransacao;
      qryDet.Edit;
      qryDet.FieldByName('IDPROCESSO').AsInteger :=  Rad.IniciarProcesso;
      qryDet.Post;
      qryDet.ApplyUpdates;
      CommitTransacao;
    except
      RollBackTransacao;
    end;

    if (qryDet.FieldByName('IDPROCESSO').AsInteger < 0) then
    begin
      MsgDlg('Erro ao tentar instanciar o processo no R.A.D.','Erro',mtError,[mbOK],0);
      Abort;
    end;
  end;

  if (qryDet.FieldByName('FLGCONTROLE').AsInteger = 1) and
     (qryDet.FieldByName('FLGAVALCURS').AsInteger = 1) and
     (sDataFinalAntes = '') and (sDataFinalDepois <> '') Then
  begin
    Mensagem := TMensagem.Create(Self);
    try
      Mensagem.Nova;
      Mensagem.IdDestinatario := qryDet.FieldByName('IDPESSOA').asInteger;
      Mensagem.IdRemetente := Sistema.IdUsuario;
      Mensagem.Assunto := 'Avaliação de Treinamento';
      Mensagem.NomeRemetente := Sistema.NomeUsuario;
      Mensagem.TipoDestinatario := tdUsuario;
      Mensagem.Mensagem := 'Não esqueça de fazer a sua avaliação do curso ' +
                           dblcCurso.Text +
                           ' concluído em ' +
                           qryDet.FieldByName('DATREFIM').asString;
      Mensagem.Envia;
    finally
      Mensagem.Free;
    end;
  end;
end;


procedure TfrmRegTreinColetivo.bbtnSelecionaInscricoesClick(
  Sender: TObject);
var
  c: integer;
begin
  inherited;

  sDataFinalDepois := dtedFimReal.Text;
  sDataIniDepois   := dtedIniReal.Text;

  if
      ((dtedFimReal.Text <> '') and
      (MsgDlg('Curso Já Realizado. Confirma a Inscrição de Pessoas a Selecionar ?',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes))
  or
      ((dtedFimReal.Text = '') and (dtedIniReal.Text <> '') and
      (MsgDlg('Curso Já Iniciado. Confirma a Inscrição de Pessoas a Selecionar  ?',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes))
  or
      ((dtedFimReal.Text = '') and (dtedIniReal.Text = '') and
      (MsgDlg('Confirma a Inscrição de Pessoas a Selecionar  ?',
            'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes))
  then exit;

  if not(qryDet.Active) then
    qryDet.Open;

  FezIncDel := false;

  AbrirFormModal(frmSelTreinColetivo, TfrmSelTreinColetivo);
  if (frmSelTreinColetivo.ModalResult = mrOK) and (LstFunc.Count > 0) then
  for c:= 1 to LstFunc.Count do
  begin
    if ListaEmpregadoNao.IndexOf(LstFunc[c-1]) >= 0 then
    begin
      qryUltSeq.Close;
      qryUltSeq.ParamByName('IDPESSOA').AsInteger := StrToInt(LstFunc[c-1]);
      qryUltSeq.ParamByName('IDCURSO').AsInteger  := tblCurso.FieldByName('IDCURSO').AsInteger;
      qryUltSeq.Open;
      ProxSeq := qryUltSeq.FieldByName('ULTSEQ').AsInteger + 1;

      if (ProxSeq > 1) and
         (MsgDlg('Já consta esse curso para ' + trim(LstNome[c-1]) +
                 '. Deseja registrar nova ocorrência ?',
               'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) <> mrYes) then
         Continue;

      try
        StartTransacao;
        qryDet.Insert;
        qryDet.FieldByName('IDPESSOA').AsInteger := StrToInt(LstFunc[c-1]);
        qryDet.FieldByName('IDCURSO').AsInteger  := tblCurso.FieldByName('IDCURSO').AsInteger;
        qryDet.FieldByName('NUMSEQ').Value       := ProxSeq;
        qryDet.FieldByName('FLGCONTROLE').AsInteger := 1 - rgControle.ItemIndex;
        qryDet.FieldByName('FLGAVALCURS').AsInteger := 1 - rgAvalCurs.ItemIndex;

        if dblcEntid.Text <> ''  then
          qryDet.FieldByName('IDENTIDINSTR').AsInteger :=
            qryEntid.FieldByName('IDPESSOA').AsInteger;
        if dblcInstrutor.Text <> ''  then
          qryDet.FieldByName('IDINSTRUTOR').AsInteger  :=
            qryInstrutor.FieldByName('IDPESSOA').AsInteger;
        if dtedIniPlan.Text <> '' then
          qryDet.FieldByName('DATPLINI').Value := dtedIniPlan.Date;
        if dtedFimPlan.Text <> '' then
          qryDet.FieldByName('DATPLFIM').Value := dtedFimPlan.Date;
        if dtedIniReal.Text <> '' then
          qryDet.FieldByName('DATREINI').Value := dtedIniReal.Date;
        if dtedFimReal.Text <> '' then
          qryDet.FieldByName('DATREFIM').Value := dtedFimReal.Date;

        qryDet.FieldByName('DUR_TEOR').Value := redTeoria.Value;
        qryDet.FieldByName('DUR_PRAT').Value := redPratica.Value;
        qryDet.FieldByName('DUR_TOT').Value  := redTeoria.Value + redPratica.Value;
        qryDet.FieldByName('VALOR').AsFloat      := redValCurso.Value;
        qryDet.FieldByName('DESP_VIAG').AsFloat  := redValViagem.Value;
        qryDet.FieldByName('DESP_ESTAD').AsFloat := redValHosp.Value;
        qryDet.FieldByName('DESP_OUTR').AsFloat  := redValOutras.Value;
        qryDet.FieldByName('LOCALCURSO').AsString:= edLocalCurso.Text;
        qryDet.Post;
        qryDet.ApplyUpdates;
        CommitTransacao;
        FezIncDel := True;
      except
        RollBackTransacao;
        FezIncDel := False;
      end;

      RAD_e_Mensagem('LstNome[c-1]');
    end;
  end;

  if (FezIncDel) then
  begin
    qryDet.Close;
    qryDet.Open;
    bbtnConfirmarClick(Self);
  end;

end;

procedure TfrmRegTreinColetivo.spbtnCandFuncClick(Sender: TObject);
begin
  inherited;
  bEmpregado := not bEmpregado;
  if bEmpregado then
    Panel1.Caption := 'Empregados Não Inscritos'
  else
    Panel1.Caption := 'Candidatos Não Inscritos';
  SelecionachklstEmpregado;
end;

procedure TfrmRegTreinColetivo.dblcEntidChange(Sender: TObject);
begin
  inherited;
  if dblcEntid.Text <> '' then
  begin
    qryInstrutor.Close;
    qryInstrutor.Sql[6] := '  (P.TIPO          = ''F'') AND (P.IDGRUPO = ' +
                           qryEntid.FieldByName('IdPessoa').asString + ') ';
    qryInstrutor.Open;
  end;

end;

procedure TfrmRegTreinColetivo.sbtnImprimirCartaClick(Sender: TObject);
begin
  inherited;
  rptCartaConvoc := TrptCartaConvoc.Create(Application);
  rptCartaConvoc.sCurso      := dblcCurso.Text;
  rptCartaConvoc.sEntid      := dblcEntid.Text;
  rptCartaConvoc.sInstrutor  := dblcInstrutor.Text;
  rptCartaConvoc.sIdCurso    := tblCurso.FieldByName('IDCURSO').AsString;
  rptCartaConvoc.sIdEntid    := qryEntid.FieldByName('IDPESSOA').AsString;
  rptCartaConvoc.sIdInstrutor:= qryInstrutor.FieldByName('IDPESSOA').AsString;
  rptCartaConvoc.sIniPlan    := dtedIniPlan.Text;
  rptCartaConvoc.sFimPlan    := dtedFimPlan.Text;
  rptCartaConvoc.sIniReal    := dtedIniReal.Text;
  rptCartaConvoc.sFimReal    := dtedFimReal.Text;
  rptCartaConvoc.sDataIni    := iff(dtedIniPlan.Text='',dtedIniReal.Text,dtedIniPlan.Text);
  rptCartaConvoc.sDataFim    := iff(dtedFimPlan.Text='',dtedFimReal.Text,dtedFimPlan.Text);

  RptCartaConvoc.CrmRptCMBeforePrint(Sender);
  RptCartaConvoc.CrmRptCM.IdReports := 3838;
  RptCartaConvoc.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
  RptCartaConvoc.CrmRptCM.OrigemCM := 1;
  RptCartaConvoc.CrmRptCM.IdModulo := Sistema.IdModulo;
  RptCartaConvoc.CrmRptCM.IdUsuario := Sistema.IdUsuario;
  RptCartaConvoc.CrmRptCM.Print;
  FreeAndNil(RptCartaConvoc);
end;

procedure TfrmRegTreinColetivo.dblcEntidEnter(Sender: TObject);
begin
  inherited;
  if dblcCurso.Text <> '' then
  begin
    qryEntid.Close;
    qryEntid.Sql[7] := '  (P.TIPO = ''F'') AND (IE.IDCURSO = ' +
                           tblCurso.FieldByName('IdCurso').asString + ') ';
    qryEntid.Open;
  end;

end;

end.
