unit FConsExportImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FFrameDadosExportados, DBCtrls, DBTables, Db,
  DBClient, uCMClientDataSet, uCtrlWebTransfDados, uCtrlWebLogAlteracao,
  dBaseDados, uSistema, uModuloGerenciaAA, JCLStrings, wwdblook,
  CMDBLookupCombo;

type
  TfrmConsExportImport = class(TfrmOkCancelar)
    ToolbarExportar: TToolbar97;
    btnSalvar: TBitBtn;
    pnlTop: TPanel;
    lblAlteracoeExportadas: TLabel;
    cdsTransf: TCMClientDataSet;
    cdsTransfIDWEBTRANSFDADOS: TFloatField;
    dtsTransf: TDataSource;
    cdsTransfSITUACAO: TStringField;
    cdsTransfDTTRANSF: TDateTimeField;
    frameDadosExportados: TframeDadosExportados;
    cdsTransfNOMEBASE: TStringField;
    grpLookup: TGroupBox;
    dblkpTransf: TDBLookupComboBox;
    cdsTransfLookup: TStringField;
    pnlIdWebTransfDados: TPanel;
    pnlDtTransf: TPanel;
    pnlBaseDados: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cdsTransfCalcFields(DataSet: TDataSet);
    procedure dblkpTransfClick(Sender: TObject);
  private
    WebTransfDados  : TCtrlWebTransfDados;
    WebLogAlteracao : TCtrlWebLogAlteracao;

    procedure MsgErro ( sMsg : String );
    procedure Seleciona;
  public
    procedure Prepara( sSituacao : String );
  end;

var
  frmConsExportImport: TfrmConsExportImport;

implementation

uses FExporta;

{$R *.DFM}

procedure TfrmConsExportImport.FormCreate(Sender: TObject);
begin
  inherited;

  WebLogAlteracao := TCtrlWebLogAlteracao.Create;
  WebLogAlteracao.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  WebTransfDados := TCtrlWebTransfDados.Create;
  WebTransfDados.InitializeAs( WebLogAlteracao );

  frmExporta := TfrmExporta.Create( Self );
end;

procedure TfrmConsExportImport.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmConsExportImport.Seleciona;
begin
  frmExporta.cdsWebTransfDados.Close;
  frmExporta.cdsWebLogAlteracao.Close;

  frameDadosExportados.pgrProgresso.Position := 0;

  frameDadosExportados.cdsWebLogAlteracao_Local.Data :=
   WebLogAlteracao.SelecionaWebLogAlteracaoPorWebTransfDados( cdsTransfIDWEBTRANSFDADOS.AsInteger );

  if not frameDadosExportados.cdsWebLogAlteracao_Local.IsEmpty then
  begin
    frameDadosExportados.cdsWebLogAlteracao_Local.First;
    frameDadosExportados.MostraDetalhes;
  end;
end;

procedure TfrmConsExportImport.btnSalvarClick(Sender: TObject);
begin
  inherited;

  if frameDadosExportados.cdsWebLogAlteracao_Local.IsEmpty then exit;

  with frmExporta do
  begin
    if not cdsWebTransfDados.Active then
    begin
      //Cria os datasets que serão exportados
      cdsWebLogAlteracao.CreateDataSet;
      cdsWebTransfDados.CreateDataSet;

      with frameDadosExportados do
      begin
        cdsWebTransfDados.Close;
        cdsWebTransfDados.CreateDataSet;
        cdsWebTransfDados.Insert;
        cdsWebTransfDadosIDWEBTRANSFDADOS.AsInteger := cdsTransfIDWEBTRANSFDADOS.AsInteger;
        cdsWebTransfDadosDTTRANSF.AsDateTime        := cdsTransfDTTRANSF.AsDateTime;
        cdsWebTransfDadosSITUACAO.AsString          := '2';
        cdsWebTransfDadosNOMEBASE.AsString          := cdsTransfNOMEBASE.AsString;
        cdsWebTransfDados.Post;

        cdsWebLogAlteracao_Local.First;
        while not cdsWebLogAlteracao_Local.Eof do
        begin
          cdsWebLogAlteracao.Insert;
          cdsWebLogAlteracao.FieldByName('IDWEBLOGALTERACAO').AsInteger := cdsWebLogAlteracao_Local.FieldByName('IDWEBLOGALTERACAO').AsInteger;
          cdsWebLogAlteracao.FieldByName('IDWEBTRANSFDADO').AsInteger  := cdsWebLogAlteracao_Local.FieldByName('IDWEBTRANSFDADOS').AsInteger;
          cdsWebLogAlteracao.FieldByName('DATAHORA').AsDateTime         := cdsWebLogAlteracao_Local.FieldByName('DATAHORA').AsDateTime;
          cdsWebLogAlteracao.FieldByName('OPERACAO').AsString           := cdsWebLogAlteracao_Local.FieldByName('OPERACAO').AsString;
          cdsWebLogAlteracao.FieldByName('CHAVEPRIMARIA').AsString      := cdsWebLogAlteracao_Local.FieldByName('CHAVEPRIMARIA').AsString;
          cdsWebLogAlteracao.FieldByName('NOMECAMPO').AsString          := cdsWebLogAlteracao_Local.FieldByName('NOMECAMPO').AsString;
          cdsWebLogAlteracao.FieldByName('USUARIO').AsInteger           := cdsWebLogAlteracao_Local.FieldByName('USUARIO').AsInteger;
          cdsWebLogAlteracao.FieldByName('VALORATUAL').AsString         := cdsWebLogAlteracao_Local.FieldByName('VALORATUAL').AsString;
          cdsWebLogAlteracao.FieldByName('VALORANTERIOR').AsString      := cdsWebLogAlteracao_Local.FieldByName('VALORANTERIOR').AsString;
          cdsWebLogAlteracao.FieldByName('TABELA').AsString             := cdsWebLogAlteracao_Local.FieldByName('TABELA').AsString;
          cdsWebLogAlteracao.FieldByName('LOTE').AsInteger              := cdsWebLogAlteracao_Local.FieldByName('LOTE').AsInteger;
          cdsWebLogAlteracao.Post;

          pgrProgresso.StepIt;

          cdsWebLogAlteracao_Local.Next;
        end;
      end;
      frameDadosExportados.cdsWebLogAlteracao_Local.First;
    end;
  end;

  frmExporta.ShowModal;

end;

procedure TfrmConsExportImport.FormDestroy(Sender: TObject);
begin
  inherited;
  WebLogAlteracao.Free;
  WebTransfDados.Free;
  frmExporta.Free;
end;

procedure TfrmConsExportImport.Prepara( sSituacao : String );
begin
  cdsTransf.Data := WebTransfDados.LookupDtTransf( sSituacao );

  cdsTransf.First;
  dblkpTransf.KeyValue := cdsTransfIDWEBTRANSFDADOS.AsInteger;
  Seleciona;

  if sSituacao = '1' then
  begin
    ToolbarExportar.Visible := True;
    Caption := 'Consulta Exportações de Dados';
    grpLookup.Caption := 'Exportação';
    HelpContext := 4650017;
  end
  else
  begin
    ToolbarExportar.Visible := False;
    Caption := 'Consulta Importações de Dados';
    grpLookup.Caption := 'Importação';
    HelpContext := 4650020;
  end;
end;

procedure TfrmConsExportImport.cdsTransfCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsTransfLookup.AsString := StrPadLeft( cdsTransfIDWEBTRANSFDADOS.AsString, 6 ) +
   '     ' + FormatDateTime( 'dd/mm/yyyy hh:nn:ss', cdsTransfDTTRANSF.AsDateTime ) +
   '     ' + cdsTransfNOMEBASE.AsString;
end;

procedure TfrmConsExportImport.dblkpTransfClick(Sender: TObject);
begin
  inherited;
  Seleciona;
end;

end.
