unit FAplicFinancMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, CMDBLookupCombo, Mask,
  wwdbedit, DBCtrls, uCtrlAplicFinanc, uCtrlListTerceiros, uCtrlTiposAplic,
  uGeralFinanc;

type
  TfrmAplicFinancMT = class(TFrmCadastroMT)
    sbtnBuscaInvest: TToolbarButton97;
    dbgrTipoOper: TDBRadioGroup;
    lblContaAplic: TLabel;
    dbreContaAplicacao: TwwDBEdit;
    lblTipoAplic: TLabel;
    dblcTipoAplic: TCMDBLookupCombo;
    lblPortadorConta: TLabel;
    dblcPortadorConta: TCMDBLookupCombo;
    lblDtLanc: TLabel;
    dbdtLanc: TCMDateTimePicker;
    lblPrazoResg: TLabel;
    dbrePrazoResgate: TDBRealEdit;
    lblDataPrevResg: TLabel;
    dbdtResgate: TCMDateTimePicker;
    lblTxPrev: TLabel;
    dbreJurosPrev: TDBRealEdit;
    lblMoedaCota: TLabel;
    dblcMoeda: TCMDBLookupCombo;
    lblNumCotas: TLabel;
    dbreNumCotas: TDBRealEdit;
    lblValor: TLabel;
    dbreValor: TDBRealEdit;
    gbDespesa: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbreDespAplic: TDBRealEdit;
    dbreDespRend: TDBRealEdit;
    lblValorResgPrev: TLabel;
    dbreValorPrev: TDBRealEdit;
    cdsTiposAplic: TCMClientDataSet;
    cdsPortadorConta: TCMClientDataSet;
    cdsMoeda: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dbdtLancExit(Sender: TObject);
  private
    { Private declarations }
    CtrlAplicFinanc   : TCtrlAplicFinanc;
    CtrlTiposAplic    : TCtrlTiposAplic;
    CtrlListTerceiros : TCtrlListTerceiros;
    GeralFinanc       : TGeralFinanc;
  public
    { Public declarations }
  end;

var
  frmAplicFinancMT: TfrmAplicFinancMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmAplicFinancMT.FormCreate(Sender: TObject);
begin
   inherited;

   //Inicializa CtrlAplicFinanc
   CtrlAplicFinanc:=TCtrlAplicFinanc.Create; //(Sistema.IdEmpresa, Sistema.IdModulo,
                                             //Sistema.IdUsuario, Sistema.UsaPlanoPatro);
   CtrlAplicFinanc.Initialize(dtmBaseDados.dbBaseDados,True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.RemoteServer,True);
   //Associa cds
   CtrlAplicFinanc.CdsAplicacoes:=Cds;

   //Inicializa CtrlTiposAplic
   CtrlTiposAplic:=TCtrlTiposAplic.Create; //(Sistema.IdEmpresa, Sistema.IdModulo,
                                             //Sistema.IdUsuario, Sistema.UsaPlanoPatro);
   CtrlTiposAplic.Initialize(dtmBaseDados.dbBaseDados,True,
                             Sistema.ConnectionType,
                             Sistema.ConnectionSide,
                             Sistema.RemoteServer,True);

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTerceiros.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.RemoteServer,True);

   //Inicializa GeralFinanc
   GeralFinanc:=TGeralFinanc.Create;
   GeralFinanc.Initialize(dtmBaseDados.dbBaseDados,True,
                          Sistema.ConnectionType,
                          Sistema.ConnectionSide,
                          Sistema.RemoteServer,True);

   //Carrega cdsPortadorConta
   cdsPortadorConta.Data:=CtrlListTerceiros.ListPortadorConta(Sistema.IdEmpresa);

   //Carrega cdsTiposAplic
   cdsTiposAplic.Data:=CtrlTiposAplic.ListTipoAplicacao(Sistema.IdEmpresa,0);

   //Carrega cdsMoeda
   cdsMoeda.Data:=CtrlListTerceiros.ListMoeda(0,True); //Todas moedas ativas

   MontaSelect.Filtro.Add('APLICACOES.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
   
end;

procedure TfrmAplicFinancMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlAplicFinanc.Free;
   CtrlTiposAplic.Free;
   CtrlListTerceiros.Free;
   inherited;
end;

procedure TfrmAplicFinancMT.CmeCadastroInsert(Sender: TObject);
begin
   inherited;
   cds.FieldByName('APLICRESGATEJUROS').AsString:='A';
   cds.FieldByName('IDPESSOA').AsFloat:=Sistema.IdEmpresa;
   cds.FieldByName('DATALANCAMENTO').AsDateTime :=Date;

   dblcMoeda.Enabled:=True;
   dblcTipoAplic.Enabled:=True;
   dblcPortadorConta.Enabled:=True;
   dbgrTipoOper.Enabled:=True;
   dbdtResgate.ClearDateTime;
   dbreNumCotas.Enabled:= False;
   dbreValor.Enabled:= True;
   dbgrTipoOper.SetFocus;
end;

procedure TfrmAplicFinancMT.CmeCadastroEdit(Sender: TObject);
begin
   inherited;
   dblcMoeda.Enabled:=True;
   dblcTipoAplic.Enabled:=True;
   dblcPortadorConta.Enabled:=True;
   dbgrTipoOper.Enabled:=False;

   if cds.FieldByName('MOEDACOTA').IsNull then
    begin
       dbreNumCotas.Enabled:=False;
       dbreValor.Enabled:=True;
    end
   else
    begin
       dbreNumCotas.Enabled:=True;
       dbreValor.Enabled:=False;
    end;

   dbreContaAplicacao.SetFocus;    
end;

procedure TfrmAplicFinancMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
       cds.Close;
       cds.Data:=CtrlAplicFinanc.ListAplicacoes(StrToFloat(MontaSelect.ValoresChave[0]));
    end;
end;

procedure TfrmAplicFinancMT.dbdtLancExit(Sender: TObject);
var
   rValorCotacao : Double;
begin
   inherited;
   cds.FieldByName('DATAPREVRESGATE').AsDateTime:=cds.FieldByName('DATALANCAMENTO').AsDateTime+
                                                  dbrePrazoResgate.Value;
   if not(cds.FieldByName('MOEDACOTA').IsNull) then
    begin
       if not(GeralFinanc.TestaCotacaoMoeda(cds.FieldByName('MOEDACOTA').AsFloat,
                                            dbdtLanc.Date,True,rValorCotacao)) then
        begin
           MsgDlg(GeralFinanc.MessageInfo,'Erro',mtError,[mbOk],0);
           Exit;
        end;

       if (rValorCotacao=0) then
        begin
           if bTemConta then
           bbtnCancelar.Click
        else
           qryMOEDACOTA.Clear;
        dbreNumCotas.Enabled := False;
        dbreValor.Enabled    := True;
     end
    else
     begin
        dbreNumCotas.Enabled := True;
        dbreValor.Enabled    := False;
        dbreValor.Value      := dbreNumCotas.Value * rValorCotacao;
        qryVALOR.AsFloat     := dbreValor.Value;
     end;
  end;
end;

end.
