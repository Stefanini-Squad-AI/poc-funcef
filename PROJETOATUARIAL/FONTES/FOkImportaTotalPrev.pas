// *************************************************************************************************
//                                   REGISTRO DE ALTERAÇÕES
// *************************************************************************************************
// Data        : 13.11.2003
// Responsável : Camille
// Alteração   : Criei a opção de importar apenas os dependentes menores ou inválidos
// -------------------------------------------------------------------------------------------------
unit FOkImportaTotalPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, CheckLst, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, Db, DBTables, Wwquery;

type
  TfrmOkImportaTotalPrev = class(TfrmOkCancelar)
    GrpBxSitFundacao: TGroupBox;
    CkLstBxSitFundacao: TCheckListBox;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdtVersao: TEdit;
    EdtEntidade: TEdit;
    EdtPatrocinadora: TEdit;
    EdtPlano: TEdit;
    Label1: TLabel;
    EdtReferencia: TMaskEdit;
    QrySitFundacao: TQuery;
    QryPatrocinadorasVersao: TQuery;
    QryPlanosVersao: TQuery;
    rgrpDependentes: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    rgrpTipoLeitura: TRadioGroup;
    rgrpSituacao: TRadioGroup;
    GroupBox1: TGroupBox;
    lblIdade: TLabel;
    edIdade: TEdit;
    GrpBxSitPatrocinadora: TGroupBox;
    CkLstBxSitPatrocinadora: TCheckListBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GrpBxSitPlano: TGroupBox;
    CkLstBxSitPlano: TCheckListBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    QrySitPatrocinadora: TQuery;
    QrySitPlano: TQuery;
    RdGrpSituacao: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LimpaTela;
    function GetPatrocinadoras: String;
    function GetPlanos: String;
    function GetSitFundacao: String;
    function SituacaoSelecionada: Boolean;
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgrpDependentesClick(Sender: TObject);
    procedure rgrpTipoLeituraClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    procedure setListasSituacoes;
    function getSitPatrocinadora: String;
    function getSitPlano: String;
  public
    { Public declarations }
  end;

var
  frmOkImportaTotalPrev: TfrmOkImportaTotalPrev;
  LstCodSitFundacao, LstCodSitPatrocinadora, LstCodSitPlano: TStringList;

implementation

uses FPrincipal, uGlobal, FTelaAut, uVersaoBase, uImportaTotalPrev;

{$R *.DFM}

procedure TfrmOkImportaTotalPrev.bbtnConfirmarClick(Sender: TObject);
var
  sAnoMes: String;
  bHistoricoSituacao: Boolean;
begin
  if (rgrpTipoLeitura.ItemIndex = 1) and (rgrpSituacao.ItemIndex < 0)
  then begin
     MessageDlg('Selecione o tipo de participante (Ativos ou Assistidos) para o qual deseja processar.', mtWarning, [mbOk], 0);
     rgrpSituacao.SetFocus;
     Exit;
  end;


  Try
    Screen.Cursor := crHourGlass;
    sAnoMes := copy(EdtReferencia.Text, 4, 4) + '/' + copy(EdtReferencia.Text, 1, 2);


    InsereTabelasAuxiliares(WG_CD_PESSOA_ENTID, False);

    //Solução para contornar os problemas da tabela EVENTOSPREV
    bHistoricoSituacao := (RdGrpSituacao.ItemIndex = 1);
    //---

    if rgrpTipoLeitura.ItemIndex = 0 then
      ImportaParticipanteTotalPrev(GetPatrocinadoras,
         GetPlanos,
         sAnoMes,
         GetSitFundacao,
         GetSitPatrocinadora,
         GetSitPlano,
         rgrpDependentes.ItemIndex,
         StrToInt(edIdade.Text),
         bHistoricoSituacao)
    else
      ImportaParticipanteTotalPrevSemEventos(GetPatrocinadoras,
         GetPlanos,
         sAnoMes,
         GetSitFundacao,
         GetSitPatrocinadora,
         GetSitPlano,
         rgrpDependentes.ItemIndex,
         StrToInt(edIdade.Text),
         rgrpSituacao.ItemIndex,
         bHistoricoSituacao);
  Finally
    Screen.Cursor := crDefault;
    LimpaTela;
  End;
end;

procedure TfrmOkImportaTotalPrev.FormCreate(Sender: TObject);
begin
   if uGlobal.WG_CD_VERSAO = 0 then
   begin
     MessageDlg('Selecione uma Versão da Base de Trabalho !',
        mtWarning, [mbOk], 0);
     AbrirForm(frmVersaoBase,TfrmVersaoBase,False );
     close;
   end;

  inherited;
  EdtReferencia.Text := FormatDateTime('mm/yyyy', WG_DT_REFER_BASE);

  with frmPrincipal.stbarStatusBar do
   begin
     EdtVersao.Text := panels[3].Text;  // versao
     EdtEntidade.Text := panels[4].Text;  // entidade
     EdtPatrocinadora.Text := panels[5].Text;  // patrocinadora
     EdtPlano.Text := panels[6].Text;  // plano
   end;

  setListasSituacoes; 
end;

procedure TfrmOkImportaTotalPrev.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qrySitFundacao.Close;
  inherited;
end;

function TfrmOkImportaTotalPrev.GetPatrocinadoras: String;
begin
  with QryPatrocinadorasVersao do
   begin
     Result := '';
     Close;
     ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
     Open;
     while not Eof do
      begin
        Result := Result + FieldByName('CD_PESSOA_PATROC').asString + ', ';
        Next;
      end;

     Result := copy(Result, 1, (Length(Trim(Result)) - 1));
     Close;
   end;
end;

function TfrmOkImportaTotalPrev.GetSitFundacao: String;
var
  iI: Word;
begin
  Result := '';
  for iI := 0 to CkLstBxSitFundacao.Items.Count - 1 do
    if CkLstBxSitFundacao.Checked[iI] then
      Result := Result + LstCodSitFundacao.Strings[iI] + ', ';

  if Result <> '' then
    Result := copy(Result, 1, (Length(Trim(Result)) - 1));
end;

procedure TfrmOkImportaTotalPrev.LimpaTela;
var
  iI: Word;
begin
  for  iI := 0 to CkLstBxSitFundacao.Items.Count - 1 do
    CkLstBxSitFundacao.Checked[iI] := False;
end;

function TfrmOkImportaTotalPrev.GetPlanos: String;
begin
  with QryPlanosVersao do
   begin
     Result := '';
     Close;
     ParamByName('CD_VERSAO').asInteger := WG_CD_VERSAO;
     Open;
     while not Eof do
      begin
        Result := Result + FieldByName('CD_PLANO').asString + ', ';
        Next;
      end;

     Result := copy(Result, 1, (Length(Trim(Result)) - 1));
     Close;
   end;
end;

function TfrmOkImportaTotalPrev.SituacaoSelecionada: Boolean;
var
  iI: Word;
begin
  // Retorna TRUE se ao menos 1 item estiver selecionado
  Result := False;
  for iI := 0 to CkLstBxSitFundacao.Items.Count - 1 do
    if CkLstBxSitFundacao.Checked[iI] then
     begin
       Result := True;
       Break;
     end;
end;

procedure TfrmOkImportaTotalPrev.bbtnCancelarClick(Sender: TObject);
begin
  bbtnSair.Click;
end;

procedure TfrmOkImportaTotalPrev.BitBtn1Click(Sender: TObject);
var
  iI: Word;
begin
  for iI := 0 to CkLstBxSitFundacao.Items.Count - 1 do
    CkLstBxSitFundacao.Checked[iI] := True;
  CkLstBxSitFundacao.SetFocus;
end;

procedure TfrmOkImportaTotalPrev.BitBtn2Click(Sender: TObject);
var
  iI: Word;
begin
  for iI := 0 to CkLstBxSitFundacao.Items.Count - 1 do
    CkLstBxSitFundacao.Checked[iI] := False;
  CkLstBxSitFundacao.SetFocus;    
end;

procedure TfrmOkImportaTotalPrev.FormShow(Sender: TObject);
begin
  inherited;
  lblIdade.Visible          := False;
  edIdade.Visible           := False;
  rgrpDependentes.ItemIndex := 0;
  rgrpSituacao.Visible      := False;
  Width                     := 702;

  GrpBxSitFundacao.Visible      := True;
  GrpBxSitPatrocinadora.Visible := True;
  GrpBxSitPlano.Visible         := True;
end;

procedure TfrmOkImportaTotalPrev.rgrpDependentesClick(Sender: TObject);
begin
  inherited;
  if rgrpDependentes.ItemIndex = 0
  then begin
     lblIdade.Visible := False;
     edIdade.Visible  := False;
  end
  else begin
     lblIdade.Visible := True;
     edIdade.Visible  := True;
  end;
end;

procedure TfrmOkImportaTotalPrev.rgrpTipoLeituraClick(Sender: TObject);
begin
  inherited;
  if rgrpTipoLeitura.ItemIndex = 0
  then begin
     frmOkImportaTotalPrev.Width := 702;
     rgrpSituacao.Visible        := False;

     GrpBxSitFundacao.Visible      := True;
     GrpBxSitPatrocinadora.Visible := True;
     GrpBxSitPlano.Visible         := True;
  end
  else begin
     frmOkImportaTotalPrev.Width := 368;
     rgrpSituacao.Visible        := True;
     
     GrpBxSitFundacao.Visible      := True;
     GrpBxSitPatrocinadora.Visible := True;
     GrpBxSitPlano.Visible         := True;
  end;
end;

procedure TfrmOkImportaTotalPrev.setListasSituacoes;
begin
  Try
    //Fundação
    qrySitFundacao.Close;
    qrySitFundacao.Open;

    LstCodSitFundacao := TStringList.Create;
    CkLstBxSitFundacao.Items.Clear;
    while not qrySitFundacao.EOF do
     begin
       CkLstBxSitFundacao.Items.Add(qrySitFundacao.FieldByName('DS_SITUACAO_FUNDACAO').asString);
       LstCodSitFundacao.Add(qrySitFundacao.FieldByName('CD_SITUACAO_FUNDACAO').asString);
       qrySitFundacao.next;
     end;


    //Patrocinadora
    QrySitPatrocinadora.Close;
    QrySitPatrocinadora.Open;

    LstCodSitPatrocinadora := TStringList.Create;
    CkLstBxSitPatrocinadora.Items.Clear;
    while not qrySitPatrocinadora.EOF do
     begin
       CkLstBxSitPatrocinadora.Items.Add(qrySitPatrocinadora.FieldByName('DS_SITUACAO').asString);
       LstCodSitPatrocinadora.Add(qrySitPatrocinadora.FieldByName('CD_SITUACAO').asString);
       qrySitPatrocinadora.next;
     end;

     
    //Plano
    QrySitPlano.Close;
    QrySitPlano.Open;

    LstCodSitPlano := TStringList.Create;
    CkLstBxSitPlano.Items.Clear;
    while not qrySitPlano.EOF do
     begin
       CkLstBxSitPlano.Items.Add(qrySitPlano.FieldByName('DS_SITUACAO').asString);
       LstCodSitPlano.Add(qrySitPlano.FieldByName('CD_SITUACAO').asString);
       qrySitPlano.next;
     end;    
  Finally
    qrySitFundacao.Close;
    qrySitPatrocinadora.Close;
    qrySitPlano.Close;
  End;
end;

function TfrmOkImportaTotalPrev.getSitPatrocinadora: String;
var
  i: Word;
begin
  Result := '';
  for i := 0 to CkLstBxSitPatrocinadora.Items.Count - 1 do
    if CkLstBxSitPatrocinadora.Checked[i] then
      Result := Result + LstCodSitPatrocinadora.Strings[i] + ', ';

  if Result <> '' then
    Result := copy(Result, 1, (Length(Trim(Result)) - 1));
end;

function TfrmOkImportaTotalPrev.getSitPlano: String;
var
  i: Word;
begin
  Result := '';
  for i := 0 to CkLstBxSitPlano.Items.Count - 1 do
    if CkLstBxSitPlano.Checked[i] then
      Result := Result + LstCodSitPlano.Strings[i] + ', ';

  if Result <> '' then
    Result := copy(Result, 1, (Length(Trim(Result)) - 1));
end;

procedure TfrmOkImportaTotalPrev.BitBtn3Click(Sender: TObject);
var
  i: Word;
begin
  for i := 0 to CkLstBxSitPatrocinadora.Items.Count - 1 do
    CkLstBxSitPatrocinadora.Checked[i] := True;
    
  CkLstBxSitPatrocinadora.SetFocus;
end;

procedure TfrmOkImportaTotalPrev.BitBtn4Click(Sender: TObject);
var
  i: Word;
begin
  for i := 0 to CkLstBxSitPatrocinadora.Items.Count - 1 do
    CkLstBxSitPatrocinadora.Checked[i] := False;
    
  CkLstBxSitPatrocinadora.SetFocus;
end;

procedure TfrmOkImportaTotalPrev.BitBtn5Click(Sender: TObject);
var
  i: Word;
begin
  for i := 0 to CkLstBxSitPlano.Items.Count - 1 do
    CkLstBxSitPlano.Checked[i] := True;

  CkLstBxSitPlano.SetFocus;
end;

procedure TfrmOkImportaTotalPrev.BitBtn6Click(Sender: TObject);
var
  i: Word;
begin
  for i := 0 to CkLstBxSitPlano.Items.Count - 1 do
    CkLstBxSitPlano.Checked[i] := False;

  CkLstBxSitPlano.SetFocus;
end;

end.
