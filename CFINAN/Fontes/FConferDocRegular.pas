unit FConferDocRegular;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Db, DBTables,
  Wwquery, Wwdatsrc, wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TfrmConferDocRegular = class(TfrmOkCancelar)
    pnlTopo: TPanel;
    Splitter1: TSplitter;
    rgpDocumentos: TRadioGroup;
    qryMestre: TwwQuery;
    qryDetalhe: TwwQuery;
    dsrMestre: TwwDataSource;
    updMestre: TUpdateSQL;
    dsrDetalhe: TwwDataSource;
    gpPeriodo: TGroupBox;
    dtpDataInicial: TCMDateTimePicker;
    dtpDataFinal: TCMDateTimePicker;
    Label1: TLabel;
    grpContaBancaria: TGroupBox;
    dblcContas: TwwDBLookupCombo;
    qryContas: TwwQuery;
    pnlDetalhe: TPanel;
    Splitter3: TSplitter;
    qryRateioMestre: TwwQuery;
    dsrRateioMestre: TwwDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    grdRateioDetalhe: TwwDBGrid;
    qryRateioDetalhe: TwwQuery;
    drsRateioDetalhe: TwwDataSource;
    qryRateioMestreNOME: TStringField;
    qryRateioMestreRECPAG: TStringField;
    qryRateioMestreVALOR: TFloatField;
    qryRateioDetalheNOME: TStringField;
    qryRateioDetalheRECPAG: TStringField;
    qryRateioDetalheVALOR: TFloatField;
    qryMestreCODLANCFINANC: TFloatField;
    qryMestreDESCRICAO: TStringField;
    qryMestreHISTORICO: TStringField;
    qryMestreVALORLANCFINAN: TFloatField;
    qryMestreDATALANCFINAN: TDateTimeField;
    qryMestreIDRELACIONANI: TFloatField;
    qryMestreFLGMARCADO: TStringField;
    pnlMestre: TPanel;
    Splitter2: TSplitter;
    pnlRateioMestre: TPanel;
    Panel1: TPanel;
    grdRateioMestre: TwwDBGrid;
    PnlDadosMestre: TPanel;
    Panel4: TPanel;
    grdMestre: TwwDBGrid;
    pnlDadosDetalhe: TPanel;
    Panel5: TPanel;
    grdDetalhe: TwwDBGrid;
    qryDetalheCODLANCFINANC: TFloatField;
    qryDetalheDESCRICAO: TStringField;
    qryDetalheHISTORICO: TStringField;
    qryDetalheVALORLANCFINAN: TFloatField;
    qryDetalheDATALANCFINAN: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure qryMestreAfterScroll(DataSet: TDataSet);
    procedure gpPeriodoExit(Sender: TObject);
    procedure dblcContasChange(Sender: TObject);
    procedure rgpDocumentosClick(Sender: TObject);
    procedure qryDetalheAfterScroll(DataSet: TDataSet);
    procedure qryMestreFLGMARCADOChange(Sender: TField);
    procedure grdMestreDblClick(Sender: TObject);
    procedure qryMestreBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    iMarcados : Integer;
    procedure FiltraMestre;
  public
    { Public declarations }
  end;

var
  frmConferDocRegular: TfrmConferDocRegular;

implementation

{$R *.DFM}
uses USistema,UDataBase,UMensErro;

procedure TfrmConferDocRegular.FormCreate(Sender: TObject);
begin
   inherited;
   iMarcados:=0;
   
   qryMestre.Close;
   qryMestre.ParamByName('Marcado').AsString:='N';
   qryMestre.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryMestre.ParamByName('CodPortador').AsFloat:=0;
   qryMestre.ParamByName('TodasContas').AsString:='S';
   qryMestre.ParamByName('DataInicial').AsString:='01/01/2001';
   qryMestre.ParamByName('DataFinal').AsString:='01/01/2001';
   qryMestre.ParamByName('TodasDatas').AsString:='S';
   qryMestre.Open;
   qryMestre.First;

   qryRateioMestre.Close;
   qryRateioMestre.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryRateioMestre.ParamByName('CodLancFinanc').AsFloat:=qryMestreCODLANCFINANC.AsFloat;
   qryRateioMestre.Open;

   qryDetalhe.Close;
   qryDetalhe.ParamByName('IDRelacionaNI').AsFloat:=qryMestreIDRELACIONANI.AsFloat;
   qryDetalhe.Open;
   qryDetalhe.First;
                                                                                                
   qryRateioDetalhe.Close;
   qryRateioDetalhe.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryRateioDetalhe.ParamByName('CodLancFinanc').AsFloat:=qryDetalheCODLANCFINANC.AsFloat;
   qryRateioDetalhe.Open;

   qryContas.Close;
   qryContas.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryContas.Open;
end;

procedure TfrmConferDocRegular.qryMestreAfterScroll(DataSet: TDataSet);
begin
   qryRateioMestre.Close;
   qryRateioMestre.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryRateioMestre.ParamByName('CodLancFinanc').AsFloat:=qryMestreCODLANCFINANC.AsFloat;
   qryRateioMestre.Open;

   qryDetalhe.Close;
   qryDetalhe.ParamByName('IDRelacionaNI').AsFloat:=qryMestreIDRELACIONANI.AsFloat;
   qryDetalhe.Open;
   qryDetalhe.First;
end;

procedure TfrmConferDocRegular.qryDetalheAfterScroll(DataSet: TDataSet);
begin
   qryRateioDetalhe.Close;
   qryRateioDetalhe.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;
   qryRateioDetalhe.ParamByName('CodLancFinanc').AsFloat:=qryDetalheCODLANCFINANC.AsFloat;
   qryRateioDetalhe.Open;
end;

procedure TfrmConferDocRegular.gpPeriodoExit(Sender: TObject);
begin
   if ActiveControl=bbtnSair then Exit;

   if dtpDataInicial.Text='' then dtpDataFinal.Text:='';
   if dtpDataInicial.Date>dtpDataFinal.Date then
    begin
       MsgDlg('Data Inicial não pode ser maior que a data Final.','Erro',mtError,[mbOk],0);
       dtpDataFinal.SetFocus;
    end;

   FiltraMestre;
end;

procedure TfrmConferDocRegular.dblcContasChange(Sender: TObject);
begin
   FiltraMestre;
end;

procedure TfrmConferDocRegular.rgpDocumentosClick(Sender: TObject);
begin
   FiltraMestre;
end;

procedure TfrmConferDocRegular.grdMestreDblClick(Sender: TObject);
begin
   if qryMestreFLGMARCADO.AsString='N' then
      Inc(iMarcados)
   else
      Dec(iMarcados);
   bbtnConfirmar.Enabled:=(iMarcados<>0);
end;

procedure TfrmConferDocRegular.qryMestreFLGMARCADOChange(Sender: TField);
begin
   if qryMestre.State in [dsEdit] then qryMestre.Post;
end;

procedure TfrmConferDocRegular.bbtnConfirmarClick(Sender: TObject);
begin
   if qryMestre.UpdatesPending then
    begin
       try
          StartTransacao;
          qryMestre.ApplyUpdates;
          CommitTransacao;
       except
          RollBackTransacao;
          raise;
       end;
       qryMestre.Close;
       qryMestre.Open;
       qryMestreAfterScroll(nil);
    end;
end;

procedure TfrmConferDocRegular.bbtnCancelarClick(Sender: TObject);
begin
   if qryMestre.UpdatesPending then
      if MsgDlg('Existem dados que foram marcados e que ainda não fram gravados.'+#10+#13+
              'Deseja descartá-los ?','Atenção',mtInformation,[mbYes,mbNo],0)  = MrNo then
         Exit
      else
       begin
          qryMestre.CancelUpdates;
          iMarcados:=0;
          bbtnConfirmar.Enabled:=False;
       end;
   inherited;
end;

procedure TfrmConferDocRegular.qryMestreBeforeOpen(DataSet: TDataSet);
begin
   iMarcados:=0;
   bbtnConfirmar.Enabled:=False;
end;

procedure TfrmConferDocRegular.FiltraMestre;
begin
   qryMestre.Close;

   if rgpDocumentos.ItemIndex=0 then
      qryMestre.ParamByName('Marcado').AsString:='N'
   else
      qryMestre.ParamByName('Marcado').AsString:='S';

   qryMestre.ParamByName('IDPessoa').AsFloat:=Sistema.IdEmpresa;

   if dblcContas.Text<>'' then
    begin
       qryMestre.ParamByName('CodPortador').AsFloat:=StrToFloat(dblcContas.LookupValue);
       qryMestre.ParamByName('TodasContas').AsString:='N';
    end
   else
    begin
       qryMestre.ParamByName('CodPortador').AsFloat:=0;
       qryMestre.ParamByName('TodasContas').AsString:='S';
    end;

   if (dtpDataInicial.Text<>'') then
    begin
       qryMestre.ParamByName('DataInicial').AsString:=dtpDataInicial.Text;
       qryMestre.ParamByName('DataFinal').AsString:=dtpDataFinal.Text;
       qryMestre.ParamByName('TodasDatas').AsString:='N';
    end
   else
    begin
       qryMestre.ParamByName('DataInicial').AsString:='01/01/2001';
       qryMestre.ParamByName('DataFinal').AsString:='01/01/2001';
       qryMestre.ParamByName('TodasDatas').AsString:='S';
    end;

   qryMestre.Open;
   qryMestre.First;
   qryMestreAfterScroll(nil);
end;

end.
