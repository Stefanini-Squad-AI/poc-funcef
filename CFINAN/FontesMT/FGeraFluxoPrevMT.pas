unit FGeraFluxoPrevMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, TREdit, ComCtrls, wwdbdatetimepicker,
  CMDateTimePicker, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, uCtrlFluxoCaixa, uCMClientDataSet;

type
  TfrmGeraFluxoPrevMT = class(TfrmSairAjuda)
    pnlDatas: TPanel;
    gbDatas: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    prgbarGeraFluxo: TProgressBar;
    gbSaldoInicial: TGroupBox;
    reSaldoInicial: TRealEdit;
    pnlComentario: TPanel;
    mmComentario: TMemo;
    bbtnGeraFluxo: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    lblOrigemDados: TLabel;
    cbGeraAtrasados: TCheckBox;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnGeraFluxoClick(Sender: TObject);
    procedure dedDatasExit(Sender: TObject);

  private { Private declarations }

    CtrlFluxoCaixa    : TCtrlFluxoCaixa;

    procedure AtualizaProgressBar(msg: String);


  public  { Public declarations }


  end;




var
  frmGeraFluxoPrevMT: TfrmGeraFluxoPrevMT;




implementation
{$R *.DFM}
uses
  uMensErro,uDataBase, DBaseDados,uSistema;



procedure TfrmGeraFluxoPrevMT.FormCreate(Sender: TObject);
begin
   inherited;

   //Inicializa CtrlFluxoCaixa
   CtrlFluxoCaixa:=TCtrlFluxoCaixa.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                          Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlFluxoCaixa.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer,True,
                             AtualizaProgressBar);
   CtrlFluxoCaixa.TipoEmpresa:=Sistema.TipoEmpresa;

   reSaldoInicial.Value:=CtrlFluxoCaixa.CalculaSaldoInicFlxPrev(Date);
end;



procedure TfrmGeraFluxoPrevMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   CtrlFluxoCaixa.Free;
   inherited;
end;



procedure TfrmGeraFluxoPrevMT.dedDatasExit(Sender: TObject);
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

procedure TfrmGeraFluxoPrevMT.bbtnGeraFluxoClick(Sender: TObject);
begin
   prgbarGeraFluxo.Position:=0;
   if CtrlFluxoCaixa.GeraFluxoPrevisto(reSaldoInicial.Value,deDataInicial.Date,deDataFinal.Date,
                                       cbGeraAtrasados.Checked) then
    begin
       MsgDlg('Fluxo Previsto Gerado com Sucesso. ','Aviso',mtWarning,[mbOk],0);
       bbtnSairClick(nil);
    end
   else
    MsgDlg(CtrlFluxoCaixa.MessageInfo+#10#13+'Fluxo Previsto não foi Gerado','Erro',mtError,[mbOk],0);
   lblOrigemDados.Caption:='';
end;



procedure TfrmGeraFluxoPrevMT.AtualizaProgressBar(msg: String);
begin
   if (Copy(msg,1,1)='*') then
    begin
       if (CtrlFluxoCaixa.MaxProgresso=0) then
        begin
           lblOrigemDados.Caption:=Copy(msg,2,Length(msg)-1);
           prgbarGeraFluxo.Position:=0;
           Application.ProcessMessages;
           Exit;
        end;

       if (prgbarGeraFluxo.Max<>CtrlFluxoCaixa.MaxProgresso) then
           prgbarGeraFluxo.Max:=CtrlFluxoCaixa.MaxProgresso;

       prgbarGeraFluxo.StepIt;
    end;
end;



end.
