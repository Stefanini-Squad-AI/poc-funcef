unit fSelBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, wwdblook,
  ComCtrls, Db, DBTables, Wwquery, Wwdatsrc, Wwdbgrid, wwdbdatetimepicker,
  CMDateTimePicker;

type
  TfrmSelBem = class(TfrmOkCancelar)
    upd: TUpdateSQL;
    ds: TwwDataSource;
    qry: TwwQuery;
    qrySELECTED: TBooleanField;
    qryPLACA: TFloatField;
    qryDESBEM: TStringField;
    qryDESCCONJUNTO: TStringField;
    qryDESCCLASSE: TStringField;
    qryDESCLOCAL: TStringField;
    qryNOMERESP: TStringField;
    qryDESCGRUPO: TStringField;
    qryDTAINCLUSAO: TDateTimeField;
    qryVALORG: TFloatField;
    qrySTATUS: TStringField;
    qryTIPCONTROLE: TStringField;
    qryNOMEFORN: TStringField;
    qryIDPESSOA: TFloatField;
    qryIDBEM: TFloatField;
    qryIDCONJUNTO: TFloatField;
    qryPROCESSAR: TFloatField;
    qryResponsavel: TwwQuery;
    qryResponsavelNOME: TStringField;
    qryResponsavelIDRESPONSAVEL: TFloatField;
    qryGrupo: TwwQuery;
    qryGrupoNOME: TStringField;
    qryGrupoCLASSE: TStringField;
    qryGrupoIDGRUPO: TFloatField;
    qryConjunto: TwwQuery;
    qryConjuntoDESCCONJUNTO: TStringField;
    qryConjuntoIDCONJUNTO: TFloatField;
    qryLocalizacao: TwwQuery;
    qryLocalizacaoNOME: TStringField;
    qryLocalizacaoIDLOCALIZACAO: TFloatField;
    qryClasse: TwwQuery;
    qryClasseDESCRICAO: TStringField;
    qryClasseCODHIERARQ: TStringField;
    qryClasseIDCLASSEBEM: TFloatField;
    pgctrl: TPageControl;
    TabFiltro: TTabSheet;
    pnlPlaca: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    cmbPlaca1: TComboBox;
    edPlaca1: TEdit;
    cmbPlaca2: TComboBox;
    edPlaca2: TEdit;
    anmLupa: TAnimate;
    pnlFiltros: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    cmbClasse: TwwDBLookupCombo;
    cmbLocalizacao: TwwDBLookupCombo;
    cmbConjunto: TwwDBLookupCombo;
    dteDataIni: TCMDateTimePicker;
    cmbResponsavel: TwwDBLookupCombo;
    cmbGrupo: TwwDBLookupCombo;
    dteDataFim: TCMDateTimePicker;
    pnlDescricao: TPanel;
    Bevel4: TBevel;
    Label2: TLabel;
    cmbDescricao: TComboBox;
    edDescricao: TEdit;
    Panel4: TPanel;
    Bevel10: TBevel;
    Label13: TLabel;
    cmbModelo: TComboBox;
    edModelo: TEdit;
    Panel1: TPanel;
    Bevel7: TBevel;
    Label10: TLabel;
    cmbFornec: TComboBox;
    edFornec: TEdit;
    Panel3: TPanel;
    Bevel9: TBevel;
    Label12: TLabel;
    cmbMarca: TComboBox;
    edMarca: TEdit;
    TabResult: TTabSheet;
    dbgResult: TwwDBGrid;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    bbtnMarcar: TBitBtn;
    bbtnDesmarcar: TBitBtn;
    bbtnBusca: TBitBtn;
    qryIDGRUPO: TFloatField;
    qryIDCLASSEBEM: TFloatField;
    qryIDLOCALIZACAO: TFloatField;
    qryIDRESPONSAVEL: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnBuscaClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrlChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnMarcarClick(Sender: TObject);
    procedure bbtnDesmarcarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bResult : Boolean;
  end;

var
  frmSelBem: TfrmSelBem;

implementation

{$R *.DFM}

procedure TfrmSelBem.FormCreate(Sender: TObject);
begin
   inherited;
   qryClasse.Prepare;
   qryLocalizacao.Prepare;
   qryConjunto.Prepare;
   qryGrupo.Prepare;
   qryResponsavel.Prepare;
   qryClasse.Open;
   qryLocalizacao.Open;
   qryConjunto.Open;
   qryGrupo.Open;
   qryResponsavel.Open;
   //-------------------------------------------------------------------------------------
   if not qry.Prepared then
      qry.Prepare;
   qry.Close;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := False;
   bbtnBusca.Enabled     := True;
   pgCtrl.ActivePage     := TabFiltro;
   bResult := False;
end;
//========================================================================================
procedure TfrmSelBem.bbtnBuscaClick(Sender: TObject);
Var
   sFiltro : String;
begin
   inherited;
   Screen.Cursor := crSQLWait;
   qry.Close;
   //-------------------------------------------------------------------------------------
   sFiltro := ' ';
   if (edPlaca1.Text <> '') then
   begin
      case cmbPlaca1.ItemIndex of
         0 : sFiltro := '(PLACA =  ' + edPlaca1.Text + ') AND'; // é igual a
         1 : sFiltro := '(PLACA >  ' + edPlaca1.Text + ') AND'; // é maior que
         2 : sFiltro := '(PLACA >= ' + edPlaca1.Text + ') AND'; // é maior ou igual que
         3 : sFiltro := '(PLACA <  ' + edPlaca1.Text + ') AND'; // é menor que
         4 : sFiltro := '(PLACA <= ' + edPlaca1.Text + ') AND'; // é menor ou igual que
         5 : sFiltro := '(PLACA <> ' + edPlaca1.Text + ') AND'; // é diferente de
      end;
   end;
   qry.SQL.Strings[21] := sFiltro;
   //-------------------------------------------------------------------------------------
   sFiltro := ' ';
   if (edPlaca2.Text <> '') then
   begin
      case cmbPlaca2.ItemIndex of
         0 : sFiltro := '(PLACA =  ' + edPlaca2.Text + ') AND'; // é igual a
         1 : sFiltro := '(PLACA >  ' + edPlaca2.Text + ') AND'; // é maior que
         2 : sFiltro := '(PLACA >= ' + edPlaca2.Text + ') AND'; // é maior ou igual que
         3 : sFiltro := '(PLACA <  ' + edPlaca2.Text + ') AND'; // é menor que
         4 : sFiltro := '(PLACA <= ' + edPlaca2.Text + ') AND'; // é menor ou igual que
         5 : sFiltro := '(PLACA <> ' + edPlaca2.Text + ') AND'; // é diferente de
      end;
   end;
   qry.SQL.Strings[22] := sFiltro;
   //-------------------------------------------------------------------------------------
   sFiltro := ' ';
   if (edDescricao.Text <> '') then
   begin
      case cmbDescricao.ItemIndex of
         0 : sFiltro := '(UPPER(DESBEM) LIKE ''' + trim(ansiuppercase(edDescricao.Text)) + '%''' + ') AND'; // começa com
         1 : sFiltro := '(UPPER(DESBEM) =    ''' + ansiuppercase(edDescricao.Text) + ''') AND'; // é igual a
         2 : sFiltro := '(UPPER(DESBEM) LIKE ''' + '%' + trim(ansiuppercase(edDescricao.Text)) + '%''' + '' + ') AND'; // começa com
         3 : sFiltro := '(UPPER(DESBEM) >    ''' + ansiuppercase(edDescricao.Text) + ''') AND'; // é maior que
         4 : sFiltro := '(UPPER(DESBEM) >=   ''' + ansiuppercase(edDescricao.Text) + ''') AND'; // é maior ou igual que
         5 : sFiltro := '(UPPER(DESBEM) <    ''' + ansiuppercase(edDescricao.Text) + ''') AND'; // é menor que
         6 : sFiltro := '(UPPER(DESBEM) <=   ''' + ansiuppercase(edDescricao.Text) + ''') AND'; // é menor ou igual que
         7 : sFiltro := '(UPPER(DESBEM) <>   ''' + ansiuppercase(edDescricao.Text) + ''') AND'; // é diferente de
      end;
   end;
   qry.SQL.Strings[23] := sFiltro;
   //-------------------------------------------------------------------------------------
   if (cmbClasse.Text <> '') then
   begin
      qry.SQL.Strings[24] := ' (BEM.IDCLASSEBEM = ' + qryClasseIDCLASSEBEM.AsString + ') AND';
   end else
   begin
      qry.SQL.Strings[24] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if (cmbGrupo.Text <> '') then
   begin
      qry.SQL.Strings[25] := ' (BEM.IDGRUPO = ' + qryGrupoIDGRUPO.AsString + ') AND';
   end else
   begin
      qry.SQL.Strings[25] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if (cmbLocalizacao.Text <> '') then
   begin
      qry.SQL.Strings[26] := ' (CONJUNTO.IDLOCALIZACAO = ' + qryLocalizacaoIDLOCALIZACAO.AsString + ') AND';
   end else
   begin
      qry.SQL.Strings[26] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if (cmbResponsavel.Text <> '') then
   begin
      qry.SQL.Strings[27] := ' (CONJUNTO.IDRESPONSAVEL = ' + qryResponsavelIDRESPONSAVEL.AsString + ') AND';
   end else
   begin
      qry.SQL.Strings[27] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if (cmbConjunto.Text <> '') then
   begin
      qry.SQL.Strings[28] := ' (BEM.IDCONJUNTO = ' + qryConjuntoIDCONJUNTO.AsString + ') AND';
   end else
   begin
      qry.SQL.Strings[28] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if (dteDataIni.Text <> '') then
   begin
      qry.SQL.Strings[29] := ' (BEM.DTAINCLUSAO >= TO_DATE('+ #39 + dteDataIni.Text + #39 + ',''DD/MM/YYYY'')) AND';
   end else
   begin
      qry.SQL.Strings[29] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if (dteDataFim.Text <> '') then
   begin
      qry.SQL.Strings[30] := ' (BEM.DTAINCLUSAO <= TO_DATE('+ #39 + dteDataFim.Text + #39 + ',''DD/MM/YYYY'')) AND';
   end else
   begin
      qry.SQL.Strings[30] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   sFiltro := ' ';
   if (edMarca.Text <> '') then
   begin
      case cmbMarca.ItemIndex of
         0 : sFiltro := '(UPPER(DESBEM) LIKE ''' + trim(ansiuppercase(edMarca.Text)) + '%''' + ') AND'; // começa com
         1 : sFiltro := '(UPPER(DESBEM) =    ''' + ansiuppercase(edMarca.Text) + ''') AND'; // é igual a
         2 : sFiltro := '(UPPER(DESBEM) LIKE ''' + '%' + trim(ansiuppercase(edMarca.Text)) + '%''' + '' + ') AND'; // começa com
         3 : sFiltro := '(UPPER(DESBEM) >    ''' + ansiuppercase(edMarca.Text) + ''') AND'; // é maior que
         4 : sFiltro := '(UPPER(DESBEM) >=   ''' + ansiuppercase(edMarca.Text) + ''') AND'; // é maior ou igual que
         5 : sFiltro := '(UPPER(DESBEM) <    ''' + ansiuppercase(edMarca.Text) + ''') AND'; // é menor que
         6 : sFiltro := '(UPPER(DESBEM) <=   ''' + ansiuppercase(edMarca.Text) + ''') AND'; // é menor ou igual que
         7 : sFiltro := '(UPPER(DESBEM) <>   ''' + ansiuppercase(edMarca.Text) + ''') AND'; // é diferente de
      end;
   end;
   qry.SQL.Strings[31] := sFiltro;
   //-------------------------------------------------------------------------------------
   sFiltro := ' ';
   if (edModelo.Text <> '') then
   begin
      case cmbModelo.ItemIndex of
         0 : sFiltro := '(UPPER(DESBEM) LIKE ''' + trim(ansiuppercase(edModelo.Text)) + '%''' + ') AND'; // começa com
         1 : sFiltro := '(UPPER(DESBEM) =    ''' + ansiuppercase(edModelo.Text) + ''') AND'; // é igual a
         2 : sFiltro := '(UPPER(DESBEM) LIKE ''' + '%' + trim(ansiuppercase(edModelo.Text)) + '%''' + '' + ') AND'; // começa com
         3 : sFiltro := '(UPPER(DESBEM) >    ''' + ansiuppercase(edModelo.Text) + ''') AND'; // é maior que
         4 : sFiltro := '(UPPER(DESBEM) >=   ''' + ansiuppercase(edModelo.Text) + ''') AND'; // é maior ou igual que
         5 : sFiltro := '(UPPER(DESBEM) <    ''' + ansiuppercase(edModelo.Text) + ''') AND'; // é menor que
         6 : sFiltro := '(UPPER(DESBEM) <=   ''' + ansiuppercase(edModelo.Text) + ''') AND'; // é menor ou igual que
         7 : sFiltro := '(UPPER(DESBEM) <>   ''' + ansiuppercase(edModelo.Text) + ''') AND'; // é diferente de
      end;
   end;
   qry.SQL.Strings[32] := sFiltro;
   //-------------------------------------------------------------------------------------
   sFiltro := ' ';
   if (edFornec.Text <> '') then
   begin
      case cmbFornec.ItemIndex of
         0 : sFiltro := '(UPPER(NOMEFORN) LIKE ''' + trim(ansiuppercase(edFornec.Text)) + '%''' + ') AND'; // começa com
         1 : sFiltro := '(UPPER(NOMEFORN) =    ''' + ansiuppercase(edFornec.Text) + ''') AND'; // é igual a
         2 : sFiltro := '(UPPER(NOMEFORN) LIKE ''' + '%' + trim(ansiuppercase(edFornec.Text)) + '%''' + '' + ') AND'; // começa com
         3 : sFiltro := '(UPPER(NOMEFORN) >    ''' + ansiuppercase(edFornec.Text) + ''') AND'; // é maior que
         4 : sFiltro := '(UPPER(NOMEFORN) >=   ''' + ansiuppercase(edFornec.Text) + ''') AND'; // é maior ou igual que
         5 : sFiltro := '(UPPER(NOMEFORN) <    ''' + ansiuppercase(edFornec.Text) + ''') AND'; // é menor que
         6 : sFiltro := '(UPPER(NOMEFORN) <=   ''' + ansiuppercase(edFornec.Text) + ''') AND'; // é menor ou igual que
         7 : sFiltro := '(UPPER(NOMEFORN) <>   ''' + ansiuppercase(edFornec.Text) + ''') AND'; // é diferente de
      end;
   end;
   qry.SQL.Strings[33] := sFiltro;
   //-------------------------------------------------------------------------------------
   anmLupa.Active := True;
   qry.DisableControls;
   qry.Open;
   qry.EnableControls;
   anmLupa.Active := False;
   bResult := not qry.IsEmpty;
   bbtnConfirmar.Enabled := True;
   bbtnBusca.Enabled     := False;
   pgCtrl.ActivePage     := TabResult;
   Screen.Cursor := crSQLWait;
   application.ProcessMessages;
end;
//========================================================================================
procedure TfrmSelBem.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   qry.Close;
   bbtnConfirmar.Enabled := False;
   bbtnBusca.Enabled     := True;
   pgCtrl.ActivePage     := TabFiltro;
   bResult := False;
end;
//========================================================================================
procedure TfrmSelBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qryClasse.Close;
   qryLocalizacao.Close;
   qryConjunto.Close;
   qryGrupo.Close;
   qryResponsavel.Close;
   qryClasse.UnPrepare;
   qryLocalizacao.UnPrepare;
   qryConjunto.UnPrepare;
   qryGrupo.UnPrepare;
   qryResponsavel.UnPrepare;
end;
//========================================================================================
procedure TfrmSelBem.pgctrlChange(Sender: TObject);
begin
   inherited;
   if (pgctrl.ActivePage = TabFiltro) then
   begin
      bbtnConfirmar.Enabled := False;
      bbtnBusca.Enabled     := True;
   end else
   begin
      bbtnConfirmar.Enabled := True;
      bbtnBusca.Enabled     := False;
   end;
end;
//========================================================================================
procedure TfrmSelBem.FormShow(Sender: TObject);
begin
   inherited;
   cmbPlaca1.ItemIndex    := 0;
   cmbPlaca2.ItemIndex    := 0;
   cmbDescricao.ItemIndex := 2;
   cmbMarca.ItemIndex     := 2;
   cmbModelo.ItemIndex    := 2;
   cmbFornec.ItemIndex    := 0;
end;
//========================================================================================
procedure TfrmSelBem.bbtnMarcarClick(Sender: TObject);
begin
   inherited;
   dbgResult.SelectAll;
end;
//========================================================================================
procedure TfrmSelBem.bbtnDesmarcarClick(Sender: TObject);
begin
   inherited;
   dbgResult.UnSelectAll;
end;
//========================================================================================
procedure TfrmSelBem.bbtnConfirmarClick(Sender: TObject);
var i: integer;
begin
	with dbgResult,dbgResult.DataSource.DataSet do
	begin
		DisableControls;
		for i:= 0 to SelectedList.Count - 1 do
      begin
			GotoBookmark(SelectedList.items[i]);
			qry.Edit;
         qryPROCESSAR.AsInteger := 1;
         qry.Post;
		end;
		EnableControls;  { Re-enable controls }
	end;
   inherited;
end;

end.



