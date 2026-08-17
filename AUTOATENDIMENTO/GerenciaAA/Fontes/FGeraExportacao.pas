unit FGeraExportacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, FFrameDadosExportados, uModuloGerenciaAA,
  uCmTypes, dBaseDados, uSistema, Db, DBTables, DBClient, uCMClientDataSet,
  uCtrlWebLogAlteracao, uCtrlWebTransfDados, JCLStrings, ComCtrls, uCtrlWebConfiguracao;

type
  TfrmGeraExportacao = class(TfrmOkCancelar)
    Panel1: TPanel;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    btnSalvar: TBitBtn;
    cdsWebTransfDados_Local: TCMClientDataSet;
    cdsWebTransfDados_LocalIDWEBTRANSFDADOS: TFloatField;
    cdsWebTransfDados_LocalDTTRANSF: TDateTimeField;
    cdsWebTransfDados_LocalSITUACAO: TStringField;
    frameDadosExportados: TframeDadosExportados;
    cdsWebTransfDados_LocalNOMEBASE: TStringField;
    cdsWebConfiguracao: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    WebLogAlteracao : TCtrlWebLogAlteracao;
    WebTransfDados  : TCtrlWebTransfDados;
    WebConfiguracao : TCtrlWebConfiguracao;

    procedure MsgErro ( sMsg : String );
  public
    { Public declarations }
  end;

var
  frmGeraExportacao : TfrmGeraExportacao;

implementation

uses FExporta;

{$R *.DFM}

procedure TfrmGeraExportacao.FormCreate(Sender: TObject);
begin
  inherited;
  WebLogAlteracao := TCtrlWebLogAlteracao.Create;
  WebLogAlteracao.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );
  WebLogAlteracao.CdsWebLogAlteracao := frameDadosExportados.cdsWebLogAlteracao_Local;

  frameDadosExportados.WebLogAlteracao := WebLogAlteracao;

  WebTransfDados := TCtrlWebTransfDados.Create;
  WebTransfDados.InitializeAs( WebLogAlteracao );
  WebTransfDados.CdsWebTransfDados := cdsWebTransfDados_Local;

  WebConfiguracao := TCtrlWebConfiguracao.Create;
  WebConfiguracao.InitializeAs( WebLogAlteracao );

  frameDadosExportados.cdsWebLogAlteracao_Local.Data := WebLogAlteracao.SelecionaWebLogAlteracaoEmAberto;

  cdsWebConfiguracao.Data := WebConfiguracao.SelecionaWebConfiguracao;

  frmExporta := TfrmExporta.Create( Self );

  if not frameDadosExportados.cdsWebLogAlteracao_Local.IsEmpty then
  begin
    frameDadosExportados.cdsWebLogAlteracao_Local.First;
    frameDadosExportados.MostraDetalhes;
  end;
end;

procedure TfrmGeraExportacao.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;

procedure TfrmGeraExportacao.btnSalvarClick(Sender: TObject);
begin
  inherited;

  if frameDadosExportados.cdsWebLogAlteracao_Local.IsEmpty then exit;

  with frmExporta do
  begin
    if not cdsWebTransfDados_Local.Active then
    begin
      frameDadosExportados.pgrProgresso.Position := 0;

      //Cria os datasets que serão exportados
      cdsWebTransfDados_Local.CreateDataSet;
      cdsWebLogAlteracao.CreateDataSet;

      //Cria o registro de transferência
      cdsWebTransfDados_Local.Insert;
      cdsWebTransfDados_LocalIDWEBTRANSFDADOS.AsInteger := WebTransfDados.ProximoId;
      cdsWebTransfDados_LocalDTTRANSF.AsDateTime        := Now;
      cdsWebTransfDados_LocalSITUACAO.AsString          := '1';
      cdsWebTransfDados_LocalNOMEBASE.AsString          := cdsWebConfiguracao.FieldByName('NOMEBASE').AsString;
      cdsWebTransfDados_Local.Post;

      //Copia os dados da WEBLOGALTERACAO para o clientdataset da tela de exportação
      with frameDadosExportados do
      begin
        cdsWebLogAlteracao_Local.First;
        while not cdsWebLogAlteracao_Local.Eof do
        begin
          cdsWebLogAlteracao_Local.Edit;
          cdsWebLogAlteracao_Local.FieldByName('IDWEBTRANSFDADOS').AsInteger := cdsWebTransfDados_Local.FieldByName('IDWEBTRANSFDADOS').AsInteger;
          cdsWebLogAlteracao_Local.Post;

          cdsWebLogAlteracao.Insert;
          cdsWebLogAlteracao.FieldByName('IDWEBLOGALTERACAO').AsInteger := cdsWebLogAlteracao_Local.FieldByName('IDWEBLOGALTERACAO').AsInteger;
          cdsWebLogAlteracao.FieldByName('IDWEBTRANSFDADOS').AsInteger  := cdsWebLogAlteracao_Local.FieldByName('IDWEBTRANSFDADOS').AsInteger;
          cdsWebLogAlteracao.FieldByName('DATAHORA').AsDateTime         := cdsWebLogAlteracao_Local.FieldByName('DATAHORA').AsDateTime;
          cdsWebLogAlteracao.FieldByName('OPERACAO').AsString           := cdsWebLogAlteracao_Local.FieldByName('OPERACAO').AsString;
          cdsWebLogAlteracao.FieldByName('CHAVEPRIMARIA').AsString      := cdsWebLogAlteracao_Local.FieldByName('CHAVEPRIMARIA').AsString;
          cdsWebLogAlteracao.FieldByName('NOMECAMPO').AsString          := cdsWebLogAlteracao_Local.FieldByName('NOMECAMPO').AsString;
          cdsWebLogAlteracao.FieldByName('USUARIO').AsString            := cdsWebLogAlteracao_Local.FieldByName('USUARIO').AsString;
          cdsWebLogAlteracao.FieldByName('VALORATUAL').AsString         := cdsWebLogAlteracao_Local.FieldByName('VALORATUAL').AsString;
          cdsWebLogAlteracao.FieldByName('VALORANTERIOR').AsString      := cdsWebLogAlteracao_Local.FieldByName('VALORANTERIOR').AsString;
          cdsWebLogAlteracao.FieldByName('TABELA').AsString             := cdsWebLogAlteracao_Local.FieldByName('TABELA').AsString;
          cdsWebLogAlteracao.FieldByName('LOTE').AsInteger              := cdsWebLogAlteracao_Local.FieldByName('LOTE').AsInteger;
          cdsWebLogAlteracao.Post;

          pgrProgresso.StepIt;

          cdsWebLogAlteracao_Local.Next;
        end;
      end;
      //Copia os dados da WEBTRANSFDADOS para o clientdataset da tela de exportação
      cdsWebTransfDados.Data := cdsWebTransfDados_Local.Data;
      cdsWebTransfDados.Edit;
      cdsWebTransfDadosSITUACAO.AsString := '2';
      cdsWebTransfDados.Post;
    end;
  end;

  if ( frmExporta.ShowModal = mrOk ) then
    if WebTransfDados.GravaWebTransfDados then
      if WebLogAlteracao.GravaWebLogAlteracao then
      begin
        frameDadosExportados.cdsWebLogAlteracao_Local.Close;
        frameDadosExportados.PreparaDetalhes;
        cdsWebTransfDados_Local.Close;
      end;
end;

procedure TfrmGeraExportacao.FormDestroy(Sender: TObject);
begin
  inherited;
  WebLogAlteracao.Free;
  WebTransfDados.Free;
  WebConfiguracao.Free;
  frmExporta.Free;
end;

end.
