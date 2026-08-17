unit FSele;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, Wwdatsrc, DBTables,
  MAHlpBtn, CMFRMPROP, Wwkeycb, DBGrid2, Mask, wwdbedit, Wwdotdot, Wwdbcomb;

type
  TfrmSelec = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    Panel1: TPanel;
    dbgrdSel: TDBGrid2;
    maHelpBitBtn1: TmaHelpBitBtn;
    Panel4: TPanel;
    isrch: TwwIncrementalSearch;
    Label1: TLabel;
    Panel5: TPanel;
    cmb: TComboBox;
    dsSelec: TDataSource;
    Label2: TLabel;
    kcmb: TwwKeyCombo;
    procedure dbgrdSelDblClick(Sender: TObject);
    procedure kcmbChange(Sender: TObject);
    procedure cmbChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  protected
    CamposPesq: TStringList;

    procedure AjustarColunas;
    procedure AjustarColunasIndice;
    procedure AssociarDataSet(dset: TDataSet);

  public
    { Public declarations }
    function Selecionar(dset: TDataSet; aCampos : Array of String;
                        aTitulos: Array of String; const sTitulo: string): Boolean;
    function SelecionarEx(dset: TDataSet; Campos : TStringList;
                          Titulos: TStringList;
                          const sTitulo: string;
                          SearchCtrls: Boolean;
                          HelpCont: THelpContext): Boolean;

  end;

var
  frmSelec: TfrmSelec;
  dbcolSelecionar: TDBGridColumns;
  colSelecionar: Tcolumn;

implementation

{$R *.DFM}

uses wwCommon;

procedure TfrmSelec.AssociarDataSet(dset: TDataSet);
begin
   if dset is TTable then begin
      kcmb.Visible := True;
      kcmb.DataSource := dsSelec;
      cmb.Visible  := False;
      Label2.FocusControl := cmb;
   end; { if...then }

   if dset is TQuery then begin
      kcmb.Visible := False;
      kcmb.DataSource := nil;
      cmb.Visible  := True;
      Label2.FocusControl := kcmb;
   end; { if...then }

   dsSelec.Enabled := false;
   dsSelec.DataSet := dset;
   dsSelec.Enabled := True;
end;

function TfrmSelec.SelecionarEx(dset: TDataSet; Campos : TStringList;
                                Titulos: TStringList;
                                const sTitulo: string;
                                SearchCtrls: Boolean;
                                HelpCont: THelpContext): Boolean;
var
   iTam, i: Integer;

begin
   Caption := sTitulo;

   HelpContext := HelpCont;

   AssociarDataSet(dset);

   Panel4.Visible := SearchCtrls;

   cmb.Items.Clear;
   CamposPesq.Clear;

   {Limpo a Colunas do DBGrid}
   dbgrdSel.Columns.Clear;
   iTam := 0;
   if Campos.Count > 0 then
      {Adiciona as colunas no DBGrid}
      for i := 0 to Campos.Count - 1 do begin
         colSelecionar := dbgrdSel.Columns.Add;
         colSelecionar.FieldName := Campos.Strings[i];
         CamposPesq.Add(colSelecionar.FieldName);
         if i < Titulos.Count then begin
            cmb.Items.Add(Titulos.Strings[i]);
            colSelecionar.Title.Caption := Titulos.Strings[i];
         end
         else begin
            cmb.Items.Add(dset.FieldByName(colSelecionar.FieldName).DisplayLabel);
            colSelecionar.Title.Caption := dset.FieldByName(colSelecionar.FieldName).DisplayLabel;
         end;

         iTam := iTam + colSelecionar.Width;
      end {for}
   else
      {Adiciona as colunas no DBGrid}
      for i := 0 to dset.FieldCount - 1 do begin
         if dset.Fields[i].Visible then begin
            colSelecionar := dbgrdSel.Columns.Add;
            colSelecionar.FieldName := dset.Fields[i].FieldName;
//
         if i < Titulos.Count then begin
            cmb.Items.Add(Titulos.Strings[i]);
            colSelecionar.Title.Caption := Titulos.Strings[i];
         end
         else begin
            cmb.Items.Add(dset.FieldByName(colSelecionar.FieldName).DisplayLabel);
            colSelecionar.Title.Caption := dset.FieldByName(colSelecionar.FieldName).DisplayLabel;
         end;

//
            CamposPesq.Add(colSelecionar.FieldName);

            iTam := iTam + colSelecionar.Width;
         end;
      end;{for}

   iTam := iTam + 43;

   {Verifica se o Total das colunas estorou o Tamanho da Tela}
   if iTam > Screen.Width then
      iTam := Screen.Width;

   ClientWidth := iTam;

   if iTam < Panel3.Width then
      ClientWidth := Panel3.Width + 43;

   if SearchCtrls and (Panel5.Left - isrch.Left < Label1.Width) then begin
      ClientWidth := ClientWidth + (Label1.Width - (Panel5.Left - isrch.Left));
   end; {then}

   if ClientWidth > iTam then begin
      { Distribui o que falta entre as colunas }
      for i := 0 to dbgrdSel.Columns.Count - 1 do
         dbgrdSel.Columns[i].Width := (ClientWidth - 43) div dbgrdSel.Columns.Count
   end; {then}

   isrch.Width := Panel5.Left - isrch.Left;
   cmb.ItemIndex := 0;
   kcmb.ItemIndex := 0;
   AjustarColunas;
   Result := ShowModal = mrOk;
end; {function TfrmSelec.Selecionar}

function TfrmSelec.Selecionar(dset: TDataSet;
     ACampos : Array of String; ATitulos: Array of String; const sTitulo: string): Boolean;
var
   iTam, i: Integer;
begin
   Caption := sTitulo;

   AssociarDataSet(dset);

   cmb.Items.Clear;
   CamposPesq.Clear;

   {Limpo a Colunas do DBGrid}
   dbgrdSel.Columns.Clear;
   iTam := 0;
   {Adiciona as colunas no DBGrid}
   for i := low(aCampos) to high(aCampos) do begin
     colSelecionar := dbgrdSel.Columns.Add;
     colSelecionar.FieldName := aCampos[i];
     colSelecionar.Title.Caption := aTitulos[i];
     cmb.Items.Add(aTitulos[i]);
     CamposPesq.Add(colSelecionar.FieldName);
     iTam := iTam + colSelecionar.Width;
   end;{for}
   iTam := iTam + 43;
   {Verifica se o Total das colunas estorou o Tamanho da Tela}
   if iTam > Screen.Width then
      iTam := Screen.Width;
   ClientWidth := iTam;
   isrch.Width := Panel5.Left - isrch.Left;
   cmb.ItemIndex := 0;
   kcmb.ItemIndex := 0;
   AjustarColunas;
   Result := ShowModal = mrOk;
end; {function TfrmSelec.Selecionar}

procedure TfrmSelec.dbgrdSelDblClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Click;
end; {procedure TfrmSelec.dbgrdSelDblClick}

procedure TfrmSelec.kcmbChange(Sender: TObject);
begin
   inherited;
   isrch.Clear;

   AjustarColunasIndice;

   if not kcmb.DroppedDown then isrch.setFocus;
end;

procedure TfrmSelec.cmbChange(Sender: TObject);
begin
   inherited;
   isrch.Clear;

   AjustarColunas;

   if not cmb.DroppedDown then isrch.setFocus;
end;

procedure TfrmSelec.AjustarColunas;
begin
   isrch.setSearchField('');

   { Move grid columns to match index }
   with dsSelec.dataSet do begin
      DisableControls;

//
      CamposPesq.Move(cmb.ItemIndex,0);
//
      dbgrdSel.Columns[cmb.ItemIndex].Index := 0;
      cmb.Items.Move(cmb.ItemIndex, 0);
      cmb.ItemIndex := 0;


      EnableControls;
   end;

   isrch.setSearchField(CamposPesq.Strings[0]);
end;

procedure TfrmSelec.AjustarColunasIndice;
var i: integer;
    foundIndexField: boolean;
    curIndex: integer;
begin
   FoundIndexField := false;
   isrch.setSearchField('');
   curIndex:= 0;

   { Move grid columns to match index }
   with (dsSelec.DataSet as TTable) do begin
      DisableControls;

      for i:= 0 to IndexFieldCount-1 do begin
         if indexFields[i].visible then begin
            indexFields[i].index:= curIndex;
            if not foundIndexfield then begin
               isrch.setSearchField(indexFields[i].fieldName);
               foundIndexField:= True;
            end;
            inc(curIndex);
         end;
      end;

      for i := 0 to dbgrdSel.Columns.Count - 1 do begin
         if isrch.SearchField = dbgrdSel.Columns[i].FieldName then begin
            dbgrdSel.Columns[i].Index := 0;
         end; { if...then }
      end; { for }

      EnableControls;
   end;
end;

procedure TfrmSelec.FormCreate(Sender: TObject);
begin
     CamposPesq := TStringList.Create;
     inherited;
end;

procedure TfrmSelec.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if (ActiveControl = kcmb) or (ActiveControl = cmb) then begin
     Exit;
  end;

  if Key=VK_RETURN then begin
     bbtnConfirmar.SetFocus;
     ModalResult:= mrOK;
  end
  else if (Key in [VK_UP, VK_DOWN, VK_NEXT, VK_PRIOR]) then begin
     dbgrdSel.KeyDown(Key, Shift);
     Key := 0;
  end
end;


procedure TfrmSelec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     CamposPesq.Free;
     inherited;
end;

end.
