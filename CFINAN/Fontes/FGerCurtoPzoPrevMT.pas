unit FGerCurtoPzoPrevMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlFluxoCaixa;

type
  TfrmGerCurtoPzoPrevMT = class(TfrmSairAjuda)
    bbtnGeraFluxo: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    pnlDatas: TPanel;
    gbDatas: TGroupBox;
    lblDataInicial: TLabel;
    lblDataFinal: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    pnlComentario: TPanel;
    mmComentario: TMemo;
    AnimateGeracao: TAnimate;
    procedure FormCreate(Sender: TObject);
    procedure deDataExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnGeraFluxoClick(Sender: TObject);
  private
    { Private declarations }
    CtrlFluxoCaixa: TCtrlFluxoCaixa;
  public
    { Public declarations }
  end;

var
  frmGerCurtoPzoPrevMT: TfrmGerCurtoPzoPrevMT;

implementation

{$R *.DFM}

uses uMensErro,uDataBase, DBaseDados,uSistema;

procedure TfrmGerCurtoPzoPrevMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa CtrlFluxoCaixa
   CtrlFluxoCaixa:=TCtrlFluxoCaixa.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                          Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlFluxoCaixa.Initialize(dtmBaseDados.dbBaseDados,True);

end;

procedure TfrmGerCurtoPzoPrevMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlFluxoCaixa.Free;
   inherited;
   Action:=caFree;
end;

procedure TfrmGerCurtoPzoPrevMT.deDataExit(Sender: TObject);
begin
   inherited;
   if (ActiveControl=bbtnSair) then Exit;
   if (Trim(deDataInicial.Text)='') and (Trim(deDataFinal.Text)<>'')then
      deDataInicial.Date:=deDataFinal.Date;
   if (Trim(deDataFinal.Text)='') and (Trim(deDataInicial.Text)<>'')then
      deDataFinal.Date:=deDataInicial.Date;
   if (deDataInicial.Date>deDataFinal.Date) then
      deDataFinal.Date:=deDataInicial.Date;
   bbtnGeraFluxo.Enabled:=True;
end;

procedure TfrmGerCurtoPzoPrevMT.bbtnGeraFluxoClick(Sender: TObject);
begin
   inherited;
   AnimateGeracao.Active:=True;
   try
      if CtrlFluxoCaixa.GeraMultiFluxoOrc(deDataInicial.Date,deDataFinal.Date,'PRV','C') then
       begin
          MsgDlg('Fluxo Gerado com Sucesso. ','Aviso',mtWarning,[mbOk],0);
          bbtnSairClick(nil);
       end
      else
       MsgDlg(CtrlFluxoCaixa.MessageInfo+#10#13+'Fluxo não foi Gerado','Erro',mtError,[mbOk],0);
   finally
      AnimateGeracao.Active:=False;
   end;
end;

end.
