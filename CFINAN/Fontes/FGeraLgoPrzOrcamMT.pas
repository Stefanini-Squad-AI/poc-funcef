unit FGeraLgoPrzOrcamMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdblook, CMDBLookupCombo, ComCtrls, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBClient, uCMClientDataSet, uCtrlListTercFinanc, uCtrlFluxoCaixa;

type
  TfrmGeraLgoPrzOrcamMT = class(TfrmSairAjuda)
    pnlDatas: TPanel;
    lblExercicio: TLabel;
    prgbarGeraFluxo: TProgressBar;
    gbPeriodos: TGroupBox;
    lblInicio: TLabel;
    lblFinal: TLabel;
    dblcPeriodoInicial: TCMDBLookupCombo;
    dblcPeriodoFinal: TCMDBLookupCombo;
    dblcExercicio: TCMDBLookupCombo;
    pnlComentario: TPanel;
    mmComentario: TMemo;
    bbtnGeraFluxo: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    cdsExercicio: TCMClientDataSet;
    cdsPeriodo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcExercicioExit(Sender: TObject);
    procedure dblcPeriodoExit(Sender: TObject);
    procedure bbtnGeraFluxoClick(Sender: TObject);
  private
    { Private declarations }
    CtrlFluxoCaixa : TCtrlFluxoCaixa;
    CtrlListTerceiros : TCtrlListTercFinanc;
    procedure AtualizaProgressBar(msg: String);
  public
    { Public declarations }
  end;

var
  frmGeraLgoPrzOrcamMT: TfrmGeraLgoPrzOrcamMT;

implementation

{$R *.DFM}

uses uMensErro,uDataBase, DBaseDados,uSistema;

procedure TfrmGeraLgoPrzOrcamMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa CtrlFluxoCaixa
   CtrlFluxoCaixa:=TCtrlFluxoCaixa.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                          Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlFluxoCaixa.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer,True,
                             AtualizaProgressBar);

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                                Sistema.ConnectionSide, Sistema.AppRemoteServer,True);
   //Carrega cdsExercicio
   cdsExercicio.Data:=CtrlListTerceiros.ListExercicio(Sistema.IdEmpresa);

   //Carrega csdPeriodo
   cdsPeriodo.Data:=CtrlListTerceiros.ListPeriodo(-1,-1);
end;

procedure TfrmGeraLgoPrzOrcamMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlFluxoCaixa.Free;
   CtrlListTerceiros.Free;
   inherited;
end;

procedure TfrmGeraLgoPrzOrcamMT.dblcExercicioExit(Sender: TObject);
begin
   if (ActiveControl=bbtnSair) then Exit;
   if (Trim(dblcExercicio.Text)='') then dblcExercicio.SetFocus;
   cdsPeriodo.Close;
   cdsPeriodo.Data:=CtrlListTerceiros.ListPeriodo(Sistema.IdEmpresa,
                                                  StrToFloat(dblcExercicio.LookupValue));
end;

procedure TfrmGeraLgoPrzOrcamMT.dblcPeriodoExit(Sender: TObject);
begin
   inherited;
   if (ActiveControl=bbtnSair) then Exit;
   if (Trim(dblcPeriodoInicial.Text)='') and (Trim(dblcPeriodoFinal.Text)<>'') then
    begin
       dblcPeriodoInicial.LookupValue:=dblcPeriodoFinal.LookupValue;
       dblcPeriodoInicial.Text:=dblcPeriodoFinal.Text;
    end;

   if (Trim(dblcPeriodoFinal.Text)='') and (Trim(dblcPeriodoInicial.Text)<>'')then
    begin
       dblcPeriodoFinal.LookupValue:=dblcPeriodoInicial.LookupValue;
       dblcPeriodoFinal.Text:=dblcPeriodoInicial.Text;
    end;

   if (Trim(dblcPeriodoInicial.Text)<>'') and (Trim(dblcPeriodoFinal.Text)<>'') then
      if StrToFloat(dblcPeriodoInicial.LookupValue)>StrToFloat(dblcPeriodoFinal.LookupValue) then
       begin
          dblcPeriodoFinal.LookupValue:=dblcPeriodoInicial.LookupValue;
          dblcPeriodoFinal.Text:=dblcPeriodoInicial.Text;
       end;

   bbtnGeraFluxo.Enabled:=True;
end;

procedure TfrmGeraLgoPrzOrcamMT.bbtnGeraFluxoClick(Sender: TObject);
begin
   prgbarGeraFluxo.Position:=0;
   if CtrlFluxoCaixa.GeraFluxoOrcOrcamen(StrToFloat(dblcPeriodoInicial.LookupValue),
                                         StrToFloat(dblcPeriodoFinal.LookupValue),
                                         StrToFloat(dblcExercicio.LookupValue)) then
    begin
       MsgDlg('Fluxo Orçado Gerado com Sucesso. ','Aviso',mtWarning,[mbOk],0);
       bbtnSairClick(nil);
    end
   else
    MsgDlg(CtrlFluxoCaixa.MessageInfo+#10#13+'Fluxo Orçado não foi Gerado','Erro',mtError,[mbOk],0);
end;

procedure TfrmGeraLgoPrzOrcamMT.AtualizaProgressBar(msg: String);
begin
   if (msg='*') then
    begin
       if (prgbarGeraFluxo.Max<>CtrlFluxoCaixa.MaxProgresso) then
           prgbarGeraFluxo.Max:=CtrlFluxoCaixa.MaxProgresso;
       prgbarGeraFluxo.StepIt;
    end;
end;

end.
