unit FFrameDadosExportados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBClient, uCMClientDataSet, Provider, Db, DBTables, Grids, DBGrids,
  ExtCtrls, StdCtrls, uModuloGerenciaAA, ComCtrls, uCtrlWebLogAlteracao;

type
  TframeDadosExportados = class(TFrame)
    pnlTabela: TPanel;
    dbgrdWebLogAlteracao: TDBGrid;
    pnlBotoes: TPanel;
    pnlBottomTotal: TPanel;
    lblTotalReg: TLabel;
    lblTotal: TLabel;
    pnlBottomCenter: TPanel;
    pgrProgresso: TProgressBar;
    cdsWebLogAlteracao_Local: TCMClientDataSet;
    dtsExibe: TDataSource;
    pnlDetalhes: TPanel;
    cdsExibe: TCMClientDataSet;
    cdsExibeIDWEBLOGALTERACAO: TFloatField;
    cdsExibeDATAHORA: TDateTimeField;
    cdsExibeOPERACAO: TStringField;
    cdsExibeCHAVEPRIMARIA: TStringField;
    cdsExibeTpOperacao: TStringField;
    cdsExibeTABELA: TStringField;
    pnlBottomMostraChave: TPanel;
    cbMostraChaves: TCheckBox;
    strgrdDetalhes: TStringGrid;
    cdsExibeLOTE: TFloatField;
    pnlTopDetalhes: TPanel;
    cdsExibeUsuario: TStringField;
    Label1: TLabel;
    procedure cdsWebLogAlteracao_LocalAfterOpen(DataSet: TDataSet);
    procedure cdsWebLogAlteracao_LocalAfterClose(DataSet: TDataSet);
    procedure cbMostraChavesClick(Sender: TObject);
    procedure cdsExibeAfterScroll(DataSet: TDataSet);
  private
    bMostraDetalhes : boolean;
  public
    WebLogAlteracao : TCtrlWebLogAlteracao;

    procedure PreparaDetalhes;
    procedure MostraDetalhes;
  end;

implementation

{$R *.DFM}

procedure TframeDadosExportados.cdsWebLogAlteracao_LocalAfterOpen(
  DataSet: TDataSet);
var
  sLoteAnt : String;
begin
  sLoteAnt := '';
  bMostraDetalhes := False;

  cdsWebLogAlteracao_Local.First;
  cdsExibe.Close;
  cdsExibe.CreateDataSet;
  while not cdsWebLogAlteracao_Local.Eof do
  begin
    if  ( cdsWebLogAlteracao_Local.FieldByName('LOTE').AsString = '' )
     or ( cdsWebLogAlteracao_Local.FieldByName('LOTE').AsString <> sLoteAnt ) then
    begin
      cdsExibe.Append;
      cdsExibeIDWEBLOGALTERACAO.AsInteger := cdsWebLogAlteracao_Local.FieldByName('IDWEBLOGALTERACAO').AsInteger;
      cdsExibeUSUARIO.AsString            := WebLogAlteracao.NomeUsuarioSistema( cdsWebLogAlteracao_Local.FieldByName('USUARIO').AsString );
      cdsExibeDATAHORA.AsDateTime         := cdsWebLogAlteracao_Local.FieldByName('DATAHORA').AsDateTime;
      cdsExibeOPERACAO.AsString           := cdsWebLogAlteracao_Local.FieldByName('OPERACAO').AsString;
      cdsExibeTABELA.AsString             := cdsWebLogAlteracao_Local.FieldByName('TABELA').AsString;
      cdsExibeCHAVEPRIMARIA.AsString      := cdsWebLogAlteracao_Local.FieldByName('CHAVEPRIMARIA').AsString;
      cdsExibeLOTE.AsInteger              := cdsWebLogAlteracao_Local.FieldByName('LOTE').AsInteger;
      if cdsWebLogAlteracao_Local.FieldByName('OPERACAO').AsString = 'I' then cdsExibeTpOperacao.AsString := 'Inclusão';
      if cdsWebLogAlteracao_Local.FieldByName('OPERACAO').AsString = 'U' then cdsExibeTpOperacao.AsString := 'Alteração';
      if cdsWebLogAlteracao_Local.FieldByName('OPERACAO').AsString = 'D' then cdsExibeTpOperacao.AsString := 'Exclusão';
      cdsExibe.Post;
      sLoteAnt := cdsWebLogAlteracao_Local.FieldByName('LOTE').AsString;
    end;
    cdsWebLogAlteracao_Local.Next;
  end;
  cdsExibe.First;

  lblTotal.Caption := IntToStr( cdsWebLogAlteracao_Local.RecordCount );
  pgrProgresso.Max := cdsWebLogAlteracao_Local.RecordCount;

  bMostraDetalhes := True;
  PreparaDetalhes;
end;

procedure TframeDadosExportados.cdsWebLogAlteracao_LocalAfterClose(
  DataSet: TDataSet);
begin
  lblTotal.Caption := '';
  pgrProgresso.Max := 0;
  pgrProgresso.Position := 0;
  cdsExibe.Close;
end;

procedure TframeDadosExportados.cbMostraChavesClick(Sender: TObject);
begin
  dbgrdWebLogAlteracao.Columns[4].Visible := cbMostraChaves.Checked;
end;

procedure TframeDadosExportados.cdsExibeAfterScroll(DataSet: TDataSet);
begin
  if bMostraDetalhes then MostraDetalhes;
end;

procedure TframeDadosExportados.PreparaDetalhes;
begin
  strgrdDetalhes.RowCount   := 2;
  strgrdDetalhes.FixedRows  := 1;
  strgrdDetalhes.Cells[0,0] := 'Nome do Campo';
  strgrdDetalhes.Cells[1,0] := 'Conteúdo Atual';
  strgrdDetalhes.Cells[2,0] := 'Conteúdo Anterior';
  strgrdDetalhes.Cells[0,1] := '';
  strgrdDetalhes.Cells[1,1] := '';
  strgrdDetalhes.Cells[2,1] := '';
  strgrdDetalhes.Font.Name  := 'Arial';
  strgrdDetalhes.Font.Style := [];
  strgrdDetalhes.Font.Size  := 8;
end;

procedure TframeDadosExportados.MostraDetalhes;
var
  sLote : string;
begin
  PreparaDetalhes;

  if cdsExibeOPERACAO.AsString = 'D' then exit;

  sLote := trim( cdsExibeLOTE.AsString );

  strgrdDetalhes.RowCount   := 1;
  cdsWebLogAlteracao_Local.First;
  while not cdsWebLogAlteracao_Local.Eof do
  begin
    if trim( cdsWebLogAlteracao_Local.FieldByName('LOTE').AsString ) = sLote then
    begin
      strgrdDetalhes.RowCount := strgrdDetalhes.RowCount + 1;
      strgrdDetalhes.Cells[ 0, strgrdDetalhes.RowCount - 1 ] := cdsWebLogAlteracao_Local.FieldByName('NOMECAMPO').AsString;
      strgrdDetalhes.Cells[ 1, strgrdDetalhes.RowCount - 1 ] := cdsWebLogAlteracao_Local.FieldByName('VALORATUAL').AsString;
      strgrdDetalhes.Cells[ 2, strgrdDetalhes.RowCount - 1 ] := cdsWebLogAlteracao_Local.FieldByName('VALORANTERIOR').AsString;
    end;
    cdsWebLogAlteracao_Local.Next;
  end;
  if strgrdDetalhes.RowCount = 1 then strgrdDetalhes.RowCount := 2;
  strgrdDetalhes.FixedRows  := 1;
end;

end.
