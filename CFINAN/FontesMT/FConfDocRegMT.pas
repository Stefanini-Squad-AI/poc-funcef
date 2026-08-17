unit FConfDocRegMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker,
  Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, DBClient, uCMClientDataSet,
  Provider, DBTables, Wwquery, uCtrlConfDocReg, uCtrlMovimFinanc, uCtrlListTercFinanc,
  uCmSqlParams;

type
  TfrmConfDocRegMT = class(TfrmOkCancelar)
    pnlTopo: TPanel;
    rgpDocumentos: TRadioGroup;
    gpPeriodo: TGroupBox;
    Label1: TLabel;
    dtpDataInicial: TCMDateTimePicker;
    dtpDataFinal: TCMDateTimePicker;
    grpContaBancaria: TGroupBox;
    dblcContas: TwwDBLookupCombo;
    pnlDetalhe: TPanel;
    Splitter3: TSplitter;
    Panel2: TPanel;
    Panel3: TPanel;
    grdRateioDetalhe: TwwDBGrid;
    pnlDadosDetalhe: TPanel;
    Panel5: TPanel;
    grdDetalhe: TwwDBGrid;
    pnlMestre: TPanel;
    Splitter2: TSplitter;
    pnlRateioMestre: TPanel;
    Panel1: TPanel;
    grdRateioMestre: TwwDBGrid;
    PnlDadosMestre: TPanel;
    Panel4: TPanel;
    grdMestre: TwwDBGrid;
    Splitter1: TSplitter;
    dsRegularizados: TwwDataSource;
    dsRateioRegularizados: TwwDataSource;
    dsRelacionados: TwwDataSource;
    dsRateioRelacionados: TwwDataSource;
    cdsPortadorConta: TCMClientDataSet;
    cdsRegularizados: TCMClientDataSet;
    cdsRateioRegularizados: TCMClientDataSet;
    cdsRelacionados: TCMClientDataSet;
    cdsRateioRelacionados: TCMClientDataSet;
    btnSeleciona: TBitBtn;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gpPeriodoExit(Sender: TObject);
    procedure cdsRegularizadosAfterScroll(DataSet: TDataSet);
    procedure btnSelecionaClick(Sender: TObject);
    procedure cdsRelacionadosAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure cdsRegularizadosAfterInsert(DataSet: TDataSet);


  private { Private declarations }

    iMarcados : Integer;
    CtrlConfDocReg : TCtrlConfDocReg;
    CtrlMovimFinanc : TCtrlMovimFinanc;
    CtrlListTerceiros : TCtrlListTercFinanc;

    procedure cdsRegularizadosFLGMARCADOChange(Sender: TField);


  public  { Public declarations }


  end;



var
  frmConfDocRegMT: TfrmConfDocRegMT;



implementation
{$R *.DFM}
uses
  dBaseDados, uSistema, uMensErro;



procedure TfrmConfDocRegMT.FormCreate(Sender: TObject);
begin
   inherited;

   //Inicializa CtrlMovimFinanc
   CtrlConfDocReg:=TCtrlConfDocReg.Create;
   CtrlConfDocReg.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlConfDocReg.CdsRelacionaNI:=cdsRegularizados;

   //Inicializa CtrlMovimFinanc
   CtrlMovimFinanc:=TCtrlMovimFinanc.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                            Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlMovimFinanc.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega cdsPortadorConta
   cdsPortadorConta.Data:=CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa,0);

   //Carrega cds's
   btnSelecionaClick(nil);
end;



procedure TfrmConfDocRegMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlMovimFinanc.Free;
   CtrlListTerceiros.Free;
   inherited;
end;



procedure TfrmConfDocRegMT.gpPeriodoExit(Sender: TObject);
begin
   if ActiveControl=bbtnSair then Exit;
   if dtpDataFinal.Text='' then dtpDataFinal.Text:=dtpDataInicial.Text;
   if dtpDataInicial.Text='' then dtpDataFinal.Text:='';
end;



procedure TfrmConfDocRegMT.btnSelecionaClick(Sender: TObject);
var
   sMarcado : String;
   rCodPortador : Double;
   dDataInicial : TDateTime;
   dDataFinal   : TDateTime;
begin
   dDataInicial:=0;
   dDataFinal:=0;

   rCodPortador:=0;
   if Trim(dblcContas.Text)<>'' then rCodPortador:=StrToFloat(dblcContas.LookupValue);

   case rgpDocumentos.ItemIndex of
      0: sMarcado:='N';
      1: sMarcado:='S';
   end;

   if dtpDataFinal.Text='' then
    begin
       if dtpDataInicial.Text='' then
          dDataFinal:=0
       else
          dtpDataFinal.Text:=dtpDataInicial.Text;
    end;

   if dtpDataInicial.Text='' then
    begin
       dtpDataFinal.Text:='';
       dDataInicial:=0;
       dDataFinal:=0;
    end;

   if (dtpDataInicial.Date>dtpDataFinal.Date) then
    begin
       MsgDlg('Data Inicial não pode ser maior que a data Final.','Erro',mtError,[mbOk],0);
       dtpDataFinal.SetFocus;
       Exit;
    end;

   dDataInicial:=dtpDataInicial.Date;
   dDataFinal:=dtpDataFinal.Date;

   cdsRegularizados.DisableControls;
   try
      cdsRegularizados.Data:=CtrlConfDocReg.ListRegularizados(rCodPortador,
                                                              Sistema.IdEmpresa,
                                                              dDataInicial,
                                                              dDataFinal,
                                                              sMarcado);

      TStringField(cdsRegularizados.FieldByName('FLGMARCADO')).OnChange:=
                                    cdsRegularizadosFLGMARCADOChange;

      cdsRateioRegularizados.Data:=CtrlConfDocReg.ListRateioRegularizados(rCodPortador,
                                                                          Sistema.IdEmpresa,
                                                                          dDataInicial,
                                                                          dDataFinal,
                                                                          sMarcado);

      cdsRelacionados.Data:=CtrlConfDocReg.ListRelacionados(rCodPortador,
                                                            Sistema.IdEmpresa,
                                                            dDataInicial,
                                                            dDataFinal,
                                                            sMarcado);

      cdsRateioRelacionados.Data:=CtrlConfDocReg.ListRateioRelacionados(rCodPortador,
                                                                        Sistema.IdEmpresa,
                                                                        dDataInicial,
                                                                        dDataFinal,
                                                                        sMarcado);
      iMarcados:=0;
   finally
      cdsRegularizados.EnableControls;
   end;
   cdsRegularizados.First;
end;



procedure TfrmConfDocRegMT.cdsRegularizadosAfterScroll(DataSet: TDataSet);
begin
   if not(cdsRegularizados.Active) or
      not(cdsRateioRegularizados.Active) or
      not(cdsRelacionados.Active) then Exit;

   cdsRateioRegularizados.Filtered:=False;
   cdsRateioRegularizados.Filter:='CODLANCFINANC = '+
                                  FloatToStr(cdsRegularizados.FieldByName('CODLANCFINANC').AsFloat);
   cdsRateioRegularizados.Filtered:=True;
   cdsRateioRegularizados.First;

   cdsRelacionados.DisableControls;
   try
      cdsRelacionados.Filtered:=False;
      cdsRelacionados.Filter:='IDRELACIONANI = '+FloatToStr(cdsRegularizados.FieldByName('IDRELACIONANI').AsFloat);
      cdsRelacionados.Filtered:=True;
      cdsRelacionados.First;
   finally
      cdsRelacionados.EnableControls;
   end;
end;



procedure TfrmConfDocRegMT.cdsRelacionadosAfterScroll(DataSet: TDataSet);
begin
   if not(cdsRelacionados.Active) or not(cdsRateioRelacionados.Active) then Exit;

   cdsRateioRelacionados.Filtered:=False;
   cdsRateioRelacionados.Filter:='CODLANCFINANC = '+
                            FloatToStr(cdsRelacionados.FieldByName('CODLANCFINANC').AsFloat);
   cdsRateioRelacionados.Filtered:=True;
end;



procedure TfrmConfDocRegMT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if not(CtrlConfDocReg.AtualizaDados) then MsgDlg(CtrlConfDocReg.MessageInfo,'Erro',mtError,[mbOk],0);
end;



procedure TfrmConfDocRegMT.cdsRegularizadosFLGMARCADOChange(Sender: TField);
begin
   if ((cdsRegularizados.FieldByName('FLGMARCADO').AsString='S') and (rgpDocumentos.ItemIndex=0)) or
      ((cdsRegularizados.FieldByName('FLGMARCADO').AsString='N') and (rgpDocumentos.ItemIndex=1)) then
      Inc(iMarcados)
   else
      Dec(iMarcados);
   bbtnConfirmar.Enabled:=(iMarcados<>0);
end;



procedure TfrmConfDocRegMT.bbtnCancelarClick(Sender: TObject);
begin
   if (iMarcados>0) then
      if MsgDlg('Existem dados que foram marcados e que ainda não fram gravados.'+#10+#13+
              'Deseja descartá-los ?','Atenção',mtInformation,[mbYes,mbNo],0)  = MrNo then
         Exit
      else
       begin
          cdsRegularizados.CancelUpdates;
          iMarcados:=0;
          bbtnConfirmar.Enabled:=False;
       end;
   inherited;
end;



procedure TfrmConfDocRegMT.cdsRegularizadosAfterInsert(DataSet: TDataSet);
begin
   cdsRegularizados.Cancel;
end;



end.
