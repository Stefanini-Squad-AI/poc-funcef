unit FGeraFluxoRealMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlFluxoCaixa, uCMClientDataSet;

type
  TfrmGeraFluxoRealMT = class(TfrmSairAjuda)
    pnlDatas: TPanel;
    gbDatas: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    prgbarGeraFluxo: TProgressBar;
    pnlComentario: TPanel;
    mmComentario: TMemo;
    bbtnGeraFluxo: TBitBtn;
    ToolbarSep971: TToolbarSep97;

    procedure FormCreate(Sender: TObject);
    procedure bbtnGeraFluxoClick(Sender: TObject);
    procedure deDataExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private { Private declarations }

    CtrlFluxoCaixa    : TCtrlFluxoCaixa;

    procedure AtualizaProgressBar(msg: String);


  public  { Public declarations }


  end;



var
  frmGeraFluxoRealMT: TfrmGeraFluxoRealMT;



implementation
{$R *.DFM}
uses
  uMensErro,uDataBase, DBaseDados,uSistema;



procedure TfrmGeraFluxoRealMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa CtrlFluxoCaixa
   CtrlFluxoCaixa:=TCtrlFluxoCaixa.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                          Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlFluxoCaixa.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer,True,
                             AtualizaProgressBar);
end;



procedure TfrmGeraFluxoRealMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlFluxoCaixa.Free;
   inherited;
end;



procedure TfrmGeraFluxoRealMT.deDataExit(Sender: TObject);
begin
   if (ActiveControl=bbtnSair) then Exit;
   if (Trim(deDataInicial.Text)='') and (Trim(deDataFinal.Text)<>'')then
      deDataInicial.Date:=deDataFinal.Date;
   if (Trim(deDataFinal.Text)='') and (Trim(deDataInicial.Text)<>'')then
      deDataFinal.Date:=deDataInicial.Date;
   if (deDataInicial.Date>deDataFinal.Date) then
      deDataFinal.Date:=deDataInicial.Date;
   bbtnGeraFluxo.Enabled:=True;
end;



procedure TfrmGeraFluxoRealMT.bbtnGeraFluxoClick(Sender: TObject);
begin
   prgbarGeraFluxo.Position:=0;
   if CtrlFluxoCaixa.GeraFluxoReal(deDataInicial.Date,deDataFinal.Date) then
    begin
       MsgDlg('Fluxo Real Gerado com Sucesso. ','Aviso',mtWarning,[mbOk],0);
       bbtnSairClick(nil);
    end
   else
    MsgDlg(CtrlFluxoCaixa.MessageInfo+#10#13+'Fluxo Real não foi Gerado','Erro',mtError,[mbOk],0);
end;



procedure TfrmGeraFluxoRealMT.AtualizaProgressBar(msg: String);
begin
   if (msg='*') then
    begin
       if (prgbarGeraFluxo.Max<>CtrlFluxoCaixa.MaxProgresso) then
           prgbarGeraFluxo.Max:=CtrlFluxoCaixa.MaxProgresso;
       prgbarGeraFluxo.StepIt;
    end;
end;



end.
