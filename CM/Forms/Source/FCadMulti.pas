unit FCadMulti;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn, StdCtrls,
  Buttons, ComCtrls, ToolWin, ExtCtrls, TB97, FCadastroCS, MontaSelect,
  DBTables, wwQuery, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwDialog, CmDock, ActnList, ImgList, CmEventosCadastro;

type
  TfrmCadastroMulti = class(TfrmCadastro)
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroOpenDataSet(Sender: TObject);
    procedure CmeCadastroCloseDataSet(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    FDataSets: TList;
  protected
    EstadoCadMulti,
    AuxEstadoCadMulti : TDataSetState;
  public
    { Public declarations }
    procedure VoltarEstadoDataSets;

  published
    property DataSets: TList read FDataSets write FDataSets;

  end;

var
  frmCadastroMulti: TfrmCadastroMulti;

implementation

{$R *.DFM}


procedure TfrmCadastroMulti.sbtnInserirClick(Sender: TObject);
begin
   if Not TDBDataset(ds.DataSet).Database.InTransaction then
      TDBDataset(ds.DataSet).Database.StartTransaction;

   AuxEstadoCadMulti := dsInsert;
   inherited;
end;

procedure TfrmCadastroMulti.sbtnAlterarClick(Sender: TObject);
begin
   if Not TDBDataset(ds.DataSet).Database.InTransaction then
      TDBDataset(ds.DataSet).Database.StartTransaction;

   AuxEstadoCadMulti := dsEdit;
   inherited;
end;

procedure TfrmCadastroMulti.sbtnApagarClick(Sender: TObject);
begin
   if Not TDBDataset(ds.DataSet).Database.InTransaction
   then
      try
         TDBDataset(ds.DataSet).Database.StartTransaction;
         inherited;
         TDBDataset(ds.DataSet).Database.Commit;
      except
         TDBDataset(ds.DataSet).Database.RollBack;
         raise;
      end;
end;


procedure TfrmCadastroMulti.VoltarEstadoDataSets;
begin
   CmeCadastro.Edit(self);
end;

procedure TfrmCadastroMulti.dsStateChange(Sender: TObject);
begin
  if ds.State in [dsInsert,dsEdit,dsBrowse] then
     EstadoCadMulti := AuxEstadoCadMulti;
  inherited;
end;


procedure TfrmCadastroMulti.FormCreate(Sender: TObject);
begin
  inherited;
  FDataSets := TList.Create;
  AuxEstadoCadMulti := dsBrowse;
  EstadoCadMulti := dsBrowse;
end;

procedure TfrmCadastroMulti.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FDataSets.Free;
  inherited;
end;

procedure TfrmCadastroMulti.CmeCadastroOpenDataSet(Sender: TObject);
var
   i: Longint;
begin
   if (DataSets <> nil) then
      if (DataSets.Count = 0) then
         inherited
      else
          for i := 0 to DataSets.Count - 1 do TDBDataSet(DataSets[i]).Open;
end;

procedure TfrmCadastroMulti.CmeCadastroCloseDataSet(Sender: TObject);
var
   i: Longint;
begin
   if DataSets.Count = 0 then
      inherited
   else
      for i := DataSets.Count - 1 downto 0 do TDBDataSet(DataSets[i]).Close;
end;

procedure TfrmCadastroMulti.CmeCadastroInsert(Sender: TObject);
var
   i: Longint;
begin
   if DataSets.Count = 0 then
      inherited
   else
      for i := 0 to DataSets.Count - 1 do TDBDataSet(DataSets[i]).Insert;
end;

procedure TfrmCadastroMulti.CmeCadastroEdit(Sender: TObject);
var
   i: Longint;
begin
   if DataSets.Count = 0 then
      inherited
   else
      for i := 0 to DataSets.Count - 1 do TDBDataSet(DataSets[i]).Edit;
end;

procedure TfrmCadastroMulti.CmeCadastroDelete(Sender: TObject);
var
   i: Longint;
begin
   if DataSets.Count = 0 then
      inherited
   else
      for i := DataSets.Count - 1 downto 0 do TDBDataSet(DataSets[i]).Delete;
end;

procedure TfrmCadastroMulti.CmeCadastroConfirma(Sender: TObject);
var
   i: Longint;
begin
   if DataSets.Count = 0 then
      inherited
   else
      for i := 0 to DataSets.Count - 1 do  TDBDataSet(DataSets[i]).Post;
end;

procedure TfrmCadastroMulti.CmeCadastroCancel(Sender: TObject);
var
   i: Longint;
begin
   if DataSets.Count = 0 then
      inherited
   else
      for i := 0 to DataSets.Count - 1 do TDBDataSet(DataSets[i]).Cancel;
end;

procedure TfrmCadastroMulti.bbtnCancelarClick(Sender: TObject);
begin
  AuxEstadoCadMulti := dsBrowse;
  inherited;
end;

procedure TfrmCadastroMulti.bbtnConfirmarClick(Sender: TObject);
var
   EstadoAnterior: TDataSetState;
begin
   EstadoAnterior := AuxEstadoCadMulti;
   try
      AuxEstadoCadMulti := dsBrowse;

      inherited;

      if TDBDataset(ds.DataSet).Database.InTransaction
      then TDBDataset(ds.DataSet).Database.Commit;
   except
      AuxEstadoCadMulti := EstadoAnterior;
      VoltarEstadoDataSets;
      raise;
   end;
end;

end.
