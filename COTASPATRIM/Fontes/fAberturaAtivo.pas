unit fAberturaAtivo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBClient, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, wwdblook, CMDBLookupCombo, uCMClientDataSet, uCtrlAtivo,
  uCtrlPadroes, Mask, DBCtrls, wwdbdatetimepicker, CMDateTimePicker,
  uMensErro, uCtrlContasFundos;

type
  TfrmAberturaAtivo = class(TfrmOkCancelar)
    dbgrdFundos: TwwDBGrid;
    cdsContas: TCMClientDataSet;
    dtsContas: TDataSource;
    grpCotacaoInicial: TGroupBox;
    Label3: TLabel;
    Label2: TLabel;
    CdsLkpAtivo: TCMClientDataSet;
    Label4: TLabel;
    dblkpAtivo: TCMDBLookupCombo;
    cdsAtivo: TCMClientDataSet;
    dbdtDataAbert: TCMDateTimePicker;
    dtsAtivo: TDataSource;
    dbedtValor: TDBEdit;
    procedure dbgrdFundosUpdateFooter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkpAtivoChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure cdsAtivoAfterOpen(DataSet: TDataSet);
    procedure cdsContasAfterOpen(DataSet: TDataSet);
    procedure dbedtValorExit(Sender: TObject);

  private
    CtrlAtivo: TCtrlAtivo;
    CtrlContasFundos : TCtrlContasFundos;

    fTotalValor, fTotalCotas : extended;

    bPodeTotalizar : boolean;

    procedure Totaliza( Sender: TField );

  public
    procedure SelecionaAtivo;
  end;

var
  frmAberturaAtivo: TfrmAberturaAtivo;

implementation

{$R *.DFM}

procedure TfrmAberturaAtivo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlAtivo := TCtrlAtivo.Create;
  CtrlAtivo.InitializeAs( Padroes );

  CtrlContasFundos := TCtrlContasFundos.Create;
  CtrlContasFundos.InitializeAs( Padroes );

  CtrlAtivo.cds := cdsAtivo;
  CtrlContasFundos.cds := cdsContas;

  CdsLkpAtivo.Data := CtrlAtivo.CarregaAtivo;

  fTotalValor := 0;
  fTotalCotas := 0;

  bPodeTotalizar := True;

  cdsContas.Data := CtrlContasFundos.ContasPorAtivo( -1 );
end;


procedure TfrmAberturaAtivo.dblkpAtivoChange(Sender: TObject);
begin
  inherited;
  SelecionaAtivo;
end;


procedure TfrmAberturaAtivo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.SetFocus;

  if dbdtDataAbert.Text = '' then
  begin
    MsgDlg('A data de abertura deve ser informada.', 'Atenção', mtWarning, [mbOk], 0);
    dbdtDataAbert.SetFocus;
    exit;
  end;

  if dbedtValor.Text = '' then
  begin
    MsgDlg('O valor de abertura deve ser informado.', 'Atenção', mtWarning, [mbOk], 0);
    dbedtValor.SetFocus;
    exit;
  end;

  CtrlAtivo.GravaDados;
  CtrlContasFundos.GravaDadosConta;
  SelecionaAtivo;
end;

procedure TfrmAberturaAtivo.SelecionaAtivo;
begin
  grpCotacaoInicial.Enabled := False;
  dbgrdFundos.Enabled := False;
  if ( dblkpAtivo.Text = '' ) or ( dblkpAtivo.LookupValue = '' )then
  begin
    cdsAtivo.Close;
    cdsContas.Data := CtrlContasFundos.ContasPorAtivo( -1 );
  end
  else
  begin
    cdsAtivo.Data := CtrlAtivo.SelecionaAtivo( StrToInt( dblkpAtivo.LookupValue ) );
    cdsContas.Data := CtrlContasFundos.ContasPorAtivo( StrToInt( dblkpAtivo.LookupValue ),
     cdsAtivo.FieldByName('VLABERT').AsFloat );

    grpCotacaoInicial.Enabled := True;
    dbgrdFundos.Enabled := True;

    cdsContas.First;

    Totaliza( nil );
  end;
end;

procedure TfrmAberturaAtivo.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg( 'Confirma abandono das alterações?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
    SelecionaAtivo;
end;


procedure TfrmAberturaAtivo.dbgrdFundosUpdateFooter(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmAberturaAtivo.cdsAtivoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField( DataSet.FieldByName('VLABERT') ).DisplayFormat := '#,##0.000000';
end;

procedure TfrmAberturaAtivo.cdsContasAfterOpen(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('COTASABERT').OnChange := Totaliza;
  TFloatField( DataSet.FieldByName('VLABERT') ).DisplayFormat    := '#,##0.000000';
  TFloatField( DataSet.FieldByName('COTASABERT') ).DisplayFormat := '#,##0.000000';
  TFloatField( DataSet.FieldByName('COTASABERT') ).EditFormat    := '###0.000000';
end;

procedure TfrmAberturaAtivo.Totaliza( Sender : TField );
var
  iRecNo : integer;
begin
  if not bPodeTotalizar then exit;
  dbgrdFundos.SetFocus;
  bPodeTotalizar := False;
  iRecNo := cdsContas.RecNo;
  try
    fTotalValor := 0;
    fTotalCotas := 0;
    if cdsContas.Active then
    begin
      cdsContas.First;
      while not cdsContas.Eof do
      begin
        cdsContas.Edit;
        cdsContas.FieldByName('VLABERT').AsFloat := cdsContas.FieldByName('COTASABERT').AsFloat *
         cdsAtivo.FieldByName('VLABERT').AsFloat;
        cdsContas.Post;
        fTotalCotas := fTotalCotas + cdsContas.FieldByName('COTASABERT').AsFloat;
        fTotalValor := fTotalValor + cdsContas.FieldByName('VLABERT').AsFloat;
        cdsContas.Next;
      end;
    end;
    dbgrdFundos.Columns[0].FooterValue := 'TOTAL';
    dbgrdFundos.Columns[1].FooterValue := FormatFloat( '#,##0.000000'     , fTotalValor );
    dbgrdFundos.Columns[2].FooterValue := FormatFloat( '#,##0.000000' , fTotalCotas );
  finally
    cdsContas.RecNo := iRecNo;
    bPodeTotalizar := True;
  end;
end;

procedure TfrmAberturaAtivo.dbedtValorExit(Sender: TObject);
begin
  inherited;
  Totaliza( nil );
end;

end.
