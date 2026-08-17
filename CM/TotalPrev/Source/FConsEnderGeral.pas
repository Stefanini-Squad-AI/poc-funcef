{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : SOL 164168 KINTANA 1560241
Responsável : José Roberto Marque -
Descrição   : Implementação Inicial da Consulta geral de endereços.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FConsEnderGeral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery, Mask, DBCtrls,
  Grids, Wwdbigrd, Wwdbgrid, DBClient, Provider, uCMClientDataSet,
  uCmSqlParams, Wwdatsrc, Clipbrd;

const
   vQL = #13+#10;

type
   TfrmConsEnderGeral = class(TfrmSairAjuda)
      pgctrlBusca: TPageControl;
      tbsBusca: TTabSheet;
      pnlEstado: TPanel;
      Label5: TLabel;
      pnlCidade: TPanel;
      Label2: TLabel;
      pnlBairro: TPanel;
      Label3: TLabel;
      cmbEstado: TComboBox;
      cmbCidade: TComboBox;
      cmbBairro: TComboBox;
      edEstado: TEdit;
      edCidade: TEdit;
      edBairro: TEdit;
      ToolbarSep971: TToolbarSep97;
      bbtnBusca: TBitBtn;
      ToolbarSep973: TToolbarSep97;
      bbtnParticipante: TBitBtn;
      PnlLogradouro: TPanel;
      Label6: TLabel;
      CmbLogradouro: TComboBox;
      edLogradouro: TEdit;
      pnlCEP: TPanel;
      Label9: TLabel;
      cmbCEP: TComboBox;
      edCEP: TEdit;
      ToolbarSep972: TToolbarSep97;
    PgCtrlResultado: TPageControl;
    TbsResultado: TTabSheet;
    dbgResultado: TwwDBGrid;
    qryRes: TwwQuery;
    Cds: TClientDataSet;
    dsRes: TDataSource;
    Dsp: TDataSetProvider;

      procedure FormShow(Sender: TObject);
      procedure bbtnBuscaClick(Sender: TObject);
      procedure dbgResultadoDblClick(Sender: TObject);
      procedure bbtnElegivelClick(Sender: TObject);
      procedure dbgResultadoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure dbgResultadoTitleButtonClick(Sender: TObject; AFieldName: String);



   private  // Private declarations

      bElegivel      : Boolean;
      bParticipante  : Boolean;
      bDependente    : Boolean;
      bBeneficiario  : Boolean;
      bBenefAss      : Boolean;
      bRecebedor     : Boolean;
      bBenefpp       : Boolean;

      function TextoFiltro(sTexto, sCampo : string; iItem : Integer) : String;
      function ExisteForm(frm: string): Boolean;

   public   // Public declarations

   end;



var
  frmConsEnderGeral: TfrmConsEnderGeral;


  cCidade, cCEP, cIdpessoa, cIdPessjur,
  cIdLogradouroPrev, cSeqProposta, cIdRgElegBenef,
  cPatro, cSitFund, cIdTitular, cLogradouro : string;



implementation
{$R *.DFM}
uses
   FTelaAut, fConsPart, uConsPart, dConsPart1;



procedure TfrmConsEnderGeral.FormShow(Sender: TObject);
begin
  inherited;

   pgctrlBusca.ActivePage      := tbsBusca;

   cmbCEP.ItemIndex            := 1;
   cmbEstado.ItemIndex         := 1;
   cmbCidade.ItemIndex         := 0;
   cmbBairro.ItemIndex         := 0;
//   cmbPLANO.ItemIndex          := 0;
//   cmbPatro.ItemIndex          := 0;
   cmbLogradouro.ItemIndex  := 0;
//   cmbSitFund.ItemIndex        := 0;
//   cmbSitPatro.ItemIndex       := 0; // Fernando P. 14590

   bElegivel     := False;
   bParticipante := False;
   bDependente   := False;
   bBeneficiario := False;
   bBenefAss     := False;
   bRecebedor    := False;
   bBenefpp      := False;

   edCEP.SetFocus;
end;

procedure TfrmConsEnderGeral.bbtnBuscaClick(Sender: TObject);
var
  sIdPessoa,
  sIdPessjur,
  sFiltro,
  sSQL : String;
begin
  inherited;

  sSQL           := '';
  cIdpessoa      := '';
  cIdTitular     := '';
  cIdPessjur     := '';
  cIdLogradouroPrev   := '';
  cSeqProposta   := '';
  cIdRgElegBenef := '';

  cds.Close;

  //   Início - Tratamento de Busca a partir do cep
  if ( Trim(EdCEP.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND CEP ',EdCEP.Text,cmbCEP.ItemIndex);
  // Estado UF
  if ( Trim(EdEstado.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND UPPER(UF)',EdEstado.Text,cmbEstado.ItemIndex);

  // Cidade
  if ( Trim(EdCidade.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND UPPER(CIDADE) ' ,EdCidade.Text,cmbCidade.ItemIndex);
  // Bairro
  if ( Trim(EdBairro.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND UPPER(BAIRRO) ',EdBairro.Text,cmbBairro.ItemIndex);
  // Logradouro
  if ( Trim(EdLogradouro.Text)<>'' ) then
    sFiltro := sFiltro+TextoFiltro(' AND UPPER(LOGRADOURO)',EdLogradouro.Text,cmbLogradouro.ItemIndex);

  qryRes.DisableControls;

  if trim(sFiltro) = '' then begin
    if messageBox(Handle,'Não foram selecionado(s) filtro(s) para a busca'+#13#10+'por isso a sua pesquisa pode demorar a ser exibida. Deseja Continuar?','Aviso',mb_iconinformation + mb_YesNo) = id_No then begin
      Exit;
    end;
  end;

  if (Trim(EdEstado.Text)='') then
  begin
    MessageDlg('Por favor, Informe o estado da pesquisa', mtInformation, [mbOK, mbHelp], 0);
    Exit;
  end;

  cds.Close;
  qryRes.Close;
  qryRes.SQL.Text :=  'SELECT  CEP, '               +
                      '        UF,  '               + vQL +
                      '        CIDADE, '            + vQL +
                      '        BAIRRO, '            + vQL +
                      '        LOGRADOURO, '        + vQL +
                      '        TIPOLOGRADOURO '     + vQL +
                      'FROM DNECORREIOS WHERE 1=1 ' + vQL +
                      sFiltro + vQL;

  if ( qryRes.Prepared ) then
    qryRes.UnPrepare;

  qryRes.Prepare;
  qryRes.ExecSQL;
  cds.Open;

  if (Trim(EdCEP.Text)<>'') and (cds.IsEmpty) then
  begin
    sFiltro := '';
    sFiltro := sFiltro + TextoFiltro(' AND CEP ',EdCEP.Text,cmbCEP.ItemIndex);

    if (Trim(EdEstado.Text)<>'') then
      sFiltro := sFiltro + TextoFiltro(' AND UPPER(UF) ',EdEstado.Text,cmbEstado.ItemIndex);

    if (Trim(EdCidade.Text)<>'') then
      sFiltro := sFiltro + TextoFiltro(' AND UPPER(CIDADE)',EdCidade.Text,cmbCidade.ItemIndex);

    if (Trim(EdBairro.Text)<>'') then
      sFiltro := sFiltro + TextoFiltro(' AND UPPER(BAIRRO)',EdBairro.Text,cmbBairro.ItemIndex);

    if (Trim(edLogradouro.Text)<>'') then
      sFiltro := sFiltro + TextoFiltro(' AND UPPER(LOGRADOURO)',EdLogradouro.Text,cmbLogradouro.ItemIndex);

    cds.Close;
    qryRes.SQL.Text :=  'SELECT '                 +
                        '       CEP, '           + vQL +
                        '       UF, '            + vQL +
                        '       CIDADE, '        + vQL +
                        '       BAIRRO, '        + vQL +
                        '       LOGRADOURO, '    + vQL +
                        '       TIPOLOGRADOURO ' + vQL +
                        'FROM DNECORREIOS WHERE 1=1 ' +
                        vQL+sFiltro                   + vQL;

    if qryRes.Prepared then
      qryRes.UnPrepare;

    qryRes.Prepare;
    cds.Open;
  end;

  try
    dsRes.DataSet := cds;
    dbgResultado.DataSource    := dsRes;
  except
  end;

  qryRes.EnableControls;

  if cds.IsEmpty then
    bbtnParticipante.Enabled := false
  else
    bbtnParticipante.Enabled := true;


  //bbtnParticipante.Enabled := not( qryRes.IsEmpty );

  //pgctrlBuscaChange(Sender);
end;

function TfrmConsEnderGeral.TextoFiltro(sTexto, sCampo: string; iItem: Integer): String;
begin
   case iItem of
      0 : TextoFiltro := sTexto +' LIKE '''+Trim(sCampo)+'%''';
      1 : TextoFiltro := sTexto +' =    '''+Trim(sCampo)+'''';
      2 : TextoFiltro := sTexto +' LIKE ''%'+Trim(sCampo)+'%''';
   end;
end;

procedure TfrmConsEnderGeral.dbgResultadoDblClick(Sender: TObject);
Var
  S: String;

begin
  inherited;
  if not cds.Eof then
  begin
    if dbgResultado.GetActiveCol = 0 then
      S :=  cds.FieldByName('CEP').AsString;
    if dbgResultado.GetActiveCol = 1 then
      S :=  cds.FieldByName('UF').AsString;
    if dbgResultado.GetActiveCol = 2 then
      S :=  cds.FieldByName('CIDADE').AsString;
    if dbgResultado.GetActiveCol = 3 then
      S :=  cds.FieldByName('BAIRRO').AsString;
    if dbgResultado.GetActiveCol = 4 then
      S :=  cds.FieldByName('LOGRADOURO').AsString;
    if dbgResultado.GetActiveCol = 5 then
      S :=  cds.FieldByName('TIPOLOGRADOURO').AsString;
    ClipBoard.AsText := S;
  end;
end;



procedure TfrmConsEnderGeral.bbtnElegivelClick(Sender: TObject);
var
  S: string;
begin
  inherited;
  S  := '';
//  cds.First;
//  while not Cds.Eof do
//  begin
  if not cds.Eof then
  begin
    S := S + cds.FieldByName('CEP').AsString + #9 +
             cds.FieldByName('UF').AsString + #9 +
             cds.FieldByName('CIDADE').AsString + #9 +
             cds.FieldByName('BAIRRO').AsString + #9 +
             cds.FieldByName('LOGRADOURO').AsString + #9 +
             cds.FieldByName('TIPOLOGRADOURO').AsString + #13#10;
  //    Cds.Next;
  //  end;
    ClipBoard.AsText := S;
  end;
  self.Close;
end;



function TfrmConsEnderGeral.ExisteForm(frm: string): Boolean;
var
   i: Integer;
begin
   Result := False;

   for i := 0 to Screen.FormCount - 1 do
   begin
      if uppercase(Screen.Forms[i].Name) = uppercase(frm) then
      begin
         Result := True;
         Break;
      end;
   end;
end;


procedure TfrmConsEnderGeral.dbgResultadoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   inherited;
   if key = vk_return then bbtnElegivelClick(sender);
end;



procedure TfrmConsEnderGeral.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;



procedure TfrmConsEnderGeral.dbgResultadoTitleButtonClick(Sender: TObject; AFieldName: String);
begin
   inherited;

   cds.IndexName        := 'CHANGEINDEX';
   cds.IndexFieldNames  := AFieldName;
end;



end.







