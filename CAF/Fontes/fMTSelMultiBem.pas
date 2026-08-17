unit fMTSelMultiBem;

{
--------------------------------------------------------------------------------
  ALTERAÇÕES / IMPLEMENTAÇÕES
--------------------------------------------------------------------------------
  Nº SOL......: 172256
  Nº KINTANA..: 1547763
  Data........: 02/08/2012
  Responsável.: Vander Campos
  Descrição...: Incluir a funcionalidade Seleção de Bens para Processamento.
                Existe uma funcionalidade semelhante em Movimentações ' Seleção
                para Transferência.
--------------------------------------------------------------------------------
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, wwdblook, ComCtrls, Db, DBTables, Wwquery, Wwdatsrc, Wwdbgrid,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, DBClient, uCMClientDataSet,
  MontaSelect, Mask, wwdbedit, IvEMulti;

type
  // Vander - SOL: 172256 - KTN: 1547763
  ProcBuscaSelecionados = Procedure Of Object;
  //

  TfrmMTSelMultiBem = class(TfrmOkCancelar)
    ds: TwwDataSource;
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
    Label9: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    cmbClasse: TwwDBLookupCombo;
    cmbLocalizacao: TwwDBLookupCombo;
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
    cds: TCMClientDataSet;
    sqlSelMultiBem: TCMSqlParams;
    cdsClasse: TCMClientDataSet;
    cdsLocalizacao: TCMClientDataSet;
    cdsConjunto: TCMClientDataSet;
    cdsGrupo: TCMClientDataSet;
    cdsResponsavel: TCMClientDataSet;
    sqlClasse: TCMSqlParams;
    sqlLocalizacao: TCMSqlParams;
    sqlConjunto: TCMSqlParams;
    sqlGrupo: TCMSqlParams;
    sqlResponsavel: TCMSqlParams;
    MSConjunto: TMontaSelect;
    Label11: TLabel;
    Label3: TLabel;
    dbeConjunto: TwwDBEdit;
    bbtnSelConjunto: TBitBtn;
    dsConjunto: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure bbtnBuscaClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pgctrlChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnMarcarClick(Sender: TObject);
    procedure bbtnDesmarcarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure dbeConjuntoClick(Sender: TObject);
  private
  public
    { Public declarations }
    bResult : Boolean;

    // Vander - SOL: 172256 - KTN: 1547763
    Procedure EdtKeyPress(Sender: TObject; var Key: Char);
    Class Function BuscaSelecionados(ACds : TClientDataSet; ABeforePost : ProcBuscaSelecionados; AIncluirBaixados : Boolean = FALSE) : Boolean;


  end;

var
  frmMTSelMultiBem: TfrmMTSelMultiBem;

implementation

{$R *.DFM}

uses uSistema;

procedure TfrmMTSelMultiBem.FormCreate(Sender: TObject);
begin
   inherited;
   sqlClasse.Prepare;
   sqlClasse.Open;
   sqlLocalizacao.Prepare;
   sqlLocalizacao.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
   sqlLocalizacao.Open;
   sqlGrupo.Prepare;
   sqlGrupo.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
   sqlGrupo.Open;
   sqlResponsavel.Prepare;
   sqlResponsavel.Open;
   //-------------------------------------------------------------------------------------
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSConjunto.Filtro.Add('CONJUNTO.INATIVO = 0');
   sqlConjunto.Prepare;
   sqlConjunto.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
   sqlConjunto.ParamByName('IDCONJUNTO').AsFloat := -1;
   sqlConjunto.Open;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := False;
   bbtnBusca.Enabled     := True;
   pgCtrl.ActivePage     := TabFiltro;
   bResult := False;
end;
//========================================================================================
procedure TfrmMTSelMultiBem.FormShow(Sender: TObject);
begin
   inherited;
   cmbPlaca1.ItemIndex    := 0;
   cmbPlaca2.ItemIndex    := 0;
   cmbDescricao.ItemIndex := 2;
   cmbMarca.ItemIndex     := 2;
   cmbModelo.ItemIndex    := 2;
   cmbFornec.ItemIndex    := 0;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTSelMultiBem.bbtnSelConjuntoClick(Sender: TObject);
begin
   inherited;
   MSConjunto.Executar;
   if MSConjunto.RetornouValor then
   begin
      sqlConjunto.Prepare;
      sqlConjunto.ParamByName('IDCONJUNTO').AsFloat := strtofloat(MSConjunto.ValoresChave[0]);
      sqlConjunto.ParamByName('IDPESSOA').AsFloat   := strtofloat(MSConjunto.ValoresChave[1]);
      sqlConjunto.Open;
      //----------------------------------------------------------------------------------
      cdsLocalizacao.Locate('IDLOCALIZACAO;IDPESSOA', VarArrayOf([cdsConjunto.FieldByName('IDLOCALIZACAO').AsFloat,
                                                                  cdsConjunto.FieldByName('IDPESSOA').AsFloat]),[]);
      cmbLocalizacao.Text := cdsLocalizacao.FieldByName('NOME').AsString;
      cdsResponsavel.Locate('IDRESPONSAVEL',cdsConjunto.FieldByName('IDRESPONSAVEL').AsFloat,[]);
      cmbResponsavel.Text := cdsResponsavel.FieldByName('NOME').AsString;
      //----------------------------------------------------------------------------------
   end;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTSelMultiBem.dbeConjuntoClick(Sender: TObject);
begin
   inherited;
   if dbeConjunto.Text <> '' then
   begin
      sqlConjunto.Prepare;
      sqlConjunto.ParamByName('IDCONJUNTO').AsFloat := -1;
      sqlConjunto.ParamByName('IDPESSOA').AsFloat   := 0;
      sqlConjunto.Open;
   end;
end;
//========================================================================================
procedure TfrmMTSelMultiBem.bbtnBuscaClick(Sender: TObject);
Var
   sFiltro : String;
begin
   inherited;
   Screen.Cursor := crSQLWait;
   cds.Close;
   //-------------------------------------------------------------------------------------
   sFiltro := ' ';
   if edPlaca1.Text <> '' then
   begin
      case cmbPlaca1.ItemIndex of
         0 : sFiltro := 'PLACA =  ' + edPlaca1.Text + ' AND'; // é igual a
         1 : sFiltro := 'PLACA >  ' + edPlaca1.Text + ' AND'; // é maior que
         2 : sFiltro := 'PLACA >= ' + edPlaca1.Text + ' AND'; // é maior ou igual que
         3 : sFiltro := 'PLACA <  ' + edPlaca1.Text + ' AND'; // é menor que
         4 : sFiltro := 'PLACA <= ' + edPlaca1.Text + ' AND'; // é menor ou igual que
         5 : sFiltro := 'PLACA <> ' + edPlaca1.Text + ' AND'; // é diferente de
      end;
   end;
   sqlSelMultiBem.SQL.Strings[21] := sFiltro;
   //-------------------------------------------------------------------------------------
   sFiltro := ' ';
   if edPlaca2.Text <> '' then
   begin
      case cmbPlaca2.ItemIndex of
         0 : sFiltro := 'PLACA =  ' + edPlaca2.Text + ' AND'; // é igual a
         1 : sFiltro := 'PLACA >  ' + edPlaca2.Text + ' AND'; // é maior que
         2 : sFiltro := 'PLACA >= ' + edPlaca2.Text + ' AND'; // é maior ou igual que
         3 : sFiltro := 'PLACA <  ' + edPlaca2.Text + ' AND'; // é menor que
         4 : sFiltro := 'PLACA <= ' + edPlaca2.Text + ' AND'; // é menor ou igual que
         5 : sFiltro := 'PLACA <> ' + edPlaca2.Text + ' AND'; // é diferente de
      end;
   end;
   sqlSelMultiBem.SQL.Strings[22] := sFiltro;
   //-------------------------------------------------------------------------------------
   sFiltro := ' ';
   if edDescricao.Text <> '' then
   begin
      case cmbDescricao.ItemIndex of
         0 : sFiltro := 'UPPER(DESBEM) LIKE ''' + trim(ansiuppercase(edDescricao.Text)) + '%''' + ' AND'; // começa com
         1 : sFiltro := 'UPPER(DESBEM) =    ''' + ansiuppercase(edDescricao.Text) + ''' AND'; // é igual a
         2 : sFiltro := 'UPPER(DESBEM) LIKE ' + #39 + '%' + trim(ansiuppercase(edDescricao.Text)) + '%' + #39 + ' AND'; // Possui Texto
         3 : sFiltro := 'UPPER(DESBEM) >    ''' + ansiuppercase(edDescricao.Text) + ''' AND'; // é maior que
         4 : sFiltro := 'UPPER(DESBEM) >=   ''' + ansiuppercase(edDescricao.Text) + ''' AND'; // é maior ou igual que
         5 : sFiltro := 'UPPER(DESBEM) <    ''' + ansiuppercase(edDescricao.Text) + ''' AND'; // é menor que
         6 : sFiltro := 'UPPER(DESBEM) <=   ''' + ansiuppercase(edDescricao.Text) + ''' AND'; // é menor ou igual que
         7 : sFiltro := 'UPPER(DESBEM) <>   ''' + ansiuppercase(edDescricao.Text) + ''' AND'; // é diferente de
      end;
   end;
   sqlSelMultiBem.SQL.Strings[23] := sFiltro;
   //-------------------------------------------------------------------------------------
   if cmbClasse.Text <> '' then
   begin
      sqlSelMultiBem.SQL.Strings[24] := ' BEM.IDCLASSEBEM = ' + cdsClasse.FieldByName('IDCLASSEBEM').AsString + ' AND';
   end else
   begin
      sqlSelMultiBem.SQL.Strings[24] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if cmbGrupo.Text <> '' then
   begin
      sqlSelMultiBem.SQL.Strings[25] := ' BEM.IDGRUPO = ' + cdsGrupo.FieldByName('IDGRUPO').AsString + ' AND ';
   end else
   begin
      sqlSelMultiBem.SQL.Strings[25] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if cmbLocalizacao.Text <> '' then
   begin
      sqlSelMultiBem.SQL.Strings[26] := ' CONJUNTO.IDLOCALIZACAO = ' + cdsLocalizacao.FieldByName('IDLOCALIZACAO').AsString + ' AND ';
   end else
   begin
      sqlSelMultiBem.SQL.Strings[26] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if cmbResponsavel.Text <> '' then
   begin
      sqlSelMultiBem.SQL.Strings[27] := ' CONJUNTO.IDRESPONSAVEL = ' + cdsResponsavel.FieldByName('IDRESPONSAVEL').AsString + ' AND ';
   end else
   begin
      sqlSelMultiBem.SQL.Strings[27] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if dbeConjunto.Text <> '' then
   begin
      sqlSelMultiBem.SQL.Strings[28] := ' BEM.IDCONJUNTO = ' + cdsConjunto.FieldByName('IDCONJUNTO').AsString + ' AND';
   end else
   begin
      sqlSelMultiBem.SQL.Strings[28] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if dteDataIni.Text <> '' then
   begin
      sqlSelMultiBem.SQL.Strings[29] := ' BEM.DTAINCLUSAO >= TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dteDataIni.Date) + #39 + ',''DD/MM/YYYY'') AND';
   end else
   begin
      sqlSelMultiBem.SQL.Strings[29] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   if dteDataFim.Text <> '' then
   begin
      sqlSelMultiBem.SQL.Strings[30] := ' BEM.DTAINCLUSAO <= TO_DATE('+ #39 + FormatDateTime('dd/mm/yyyy',dteDataFim.Date) + #39 + ',''DD/MM/YYYY'') AND ';
   end else
   begin
      sqlSelMultiBem.SQL.Strings[30] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   sFiltro := ' ';
   if edMarca.Text <> '' then
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
   sqlSelMultiBem.SQL.Strings[31] := sFiltro;
   //-------------------------------------------------------------------------------------
   sFiltro := ' ';
   if edModelo.Text <> '' then
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
   sqlSelMultiBem.SQL.Strings[32] := sFiltro;
   //-------------------------------------------------------------------------------------
   sFiltro := ' ';
   if edFornec.Text <> '' then
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
   sqlSelMultiBem.SQL.Strings[33] := sFiltro;
   //-------------------------------------------------------------------------------------
   anmLupa.Active := True;
   cds.DisableControls;
   sqlSelMultiBem.Prepare;
   sqlSelMultiBem.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   sqlSelMultiBem.Open;
   cds.EnableControls;
   anmLupa.Active := False;
   //-------------------------------------------------------------------------------------
   bResult := not cds.IsEmpty;
   bbtnConfirmar.Enabled := True;
   bbtnBusca.Enabled := False;
   pgCtrl.ActivePage := TabResult;
   Screen.Cursor := crDefault;
   Application.ProcessMessages;
end;
//========================================================================================
procedure TfrmMTSelMultiBem.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   cds.Close;
   bbtnConfirmar.Enabled := False;
   bbtnBusca.Enabled     := True;
   pgCtrl.ActivePage     := TabFiltro;
   bResult := False;
end;
//========================================================================================
procedure TfrmMTSelMultiBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsClasse.Close;
   cdsLocalizacao.Close;
   cdsConjunto.Close;
   cdsGrupo.Close;
   cdsResponsavel.Close;
end;
//========================================================================================
procedure TfrmMTSelMultiBem.pgctrlChange(Sender: TObject);
begin
   inherited;
   if pgctrl.ActivePage = TabFiltro then
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
procedure TfrmMTSelMultiBem.bbtnMarcarClick(Sender: TObject);
begin
   inherited;
   dbgResult.SelectAll;
end;
//========================================================================================
procedure TfrmMTSelMultiBem.bbtnDesmarcarClick(Sender: TObject);
begin
   inherited;
   dbgResult.UnSelectAll;
end;
//========================================================================================
procedure TfrmMTSelMultiBem.bbtnConfirmarClick(Sender: TObject);
var
   i : integer;
begin
   with dbgResult,dbgResult.DataSource.DataSet do
   begin
      DisableControls;
      for i := 0 to SelectedList.Count - 1 do
      begin
         GotoBookmark(SelectedList.items[i]);
		   cds.Edit;
         cds.FieldByName('PROCESSAR').AsInteger := 1;
         cds.Post;
		end;
		EnableControls;
	end;
   inherited;
end;



class function TfrmMTSelMultiBem.BuscaSelecionados(ACds: TClientDataSet; ABeforePost : ProcBuscaSelecionados; AIncluirBaixados: Boolean): Boolean;
Var
  AFields     : Array Of String;
  I            : Integer;
  //RegInclusos : Integer;
  FrmSel      : TfrmMTSelMultiBem;

  //Estado anterior do DataSet
  IndexFields : String;
  IndexName   : String;
  idxIDBEM    : TIndexDef;

begin
  Screen.Cursor := crSQLWait;
  Try
    Result := False;
    //Application.CreateForm(TfrmMTSelMultiBem,FrmSel);
    FrmSel := TfrmMTSelMultiBem.Create(nil);
    Try
      FrmSel.FormStyle := FsNormal;
      FrmSel.Position  := poDesktopCenter;
      FrmSel.Visible   := False;
      //FrmSel.Top       := 84;
      //Application.ProcessMessages;
      Screen.Cursor    := crDefault;

      FrmSel.edPlaca1.OnKeyPress := FrmSel.EdtKeyPress;
      FrmSel.edPlaca2.OnKeyPress := FrmSel.EdtKeyPress;      

      FrmSel.ShowModal;

      Result := FrmSel.bResult;

      if NOT Result Then EXIT;

      Screen.Cursor := crSQLWait;

      IndexFields := '';
      IndexName   := '';

      //Valida os Fields existentes nos DataSets
      For I := 0 To ACDS.Fields.Count - 1 do
        if FrmSel.cds.FindField(ACDS.Fields[I].FieldName) <> Nil Then
        Begin
           SetLength(AFields, Length(AFields) + 1);
           AFields[Length(AFields)-1] := ACDS.Fields[I].FieldName;
        End;
      //

      IndexFields := Trim(ACds.IndexFieldNames);
      IndexName   := ACds.IndexName;

      ACDS.DisableControls;
      idxIDBEM := TIndexDef.Create(ACDS.IndexDefs, 'idxIDBEM', 'IDBEM', [ixUnique]);
      Try
        ACds.IndexName := 'idxIDBEM';

        ACDS.Last;
        //
        if (FrmSel.cds.Filtered) AND (FrmSel.cds.Filter <> '') Then
           FrmSel.cds.Filter := FrmSel.cds.Filter + ' AND ';

        FrmSel.cds.Filter   := FrmSel.cds.Filter + 'PROCESSAR = 1';
        FrmSel.cds.Filtered := True;
        FrmSel.cds.First;
        ///

        //RegInclusos := 0;
        With FrmSel.CDS do
          While not EOF do
          Begin
            if (FieldByName('BAIXATOTAL').AsString <> 'S')                       OR
               (AIncluirBaixados AND (FieldByName('BAIXATOTAL').AsString = 'S')) Then
               Try
                 ACds.Append;
                 For I := 0 To Length(AFields) - 1 do
                   ACds.FieldByName(AFields[I]).Value := FrmSel.Cds.FieldByName(AFields[I]).Value;

                 ABeforePost;

                 ACds.Post;
                 //Inc(RegInclusos);
               Except
                 on E : Exception do
                    if (E.ClassType = EDBClient)                        OR
                       (POS('KEY VIOLATION', UpperCase(E.Message)) > 0) Then
                       ACds.Cancel
                    Else
                       RAISE;
               End;

            NEXT;
          End;
          //

          //if RegInclusos = 0 Then
          //   ShowMessage('Todos os registros selecionados já foram inclusos!');

      Finally
        ACds.IndexName := IndexName;
        ACds.IndexDefs.Delete(idxIDBEM.Index);
        ACds.IndexFieldNames := IndexFields;
      End;
    Finally
      FreeAndNil(FrmSel);
    End;
  Finally
    ACDS.EnableControls;
    Screen.Cursor := crDefault;
  End;

end;

procedure TfrmMTSelMultiBem.EdtKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in['0'..'9',Chr(8)]) then Key:= #0;
end;

end.

