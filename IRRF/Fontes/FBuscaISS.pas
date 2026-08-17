unit FBuscaISS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, uCtrlBuscaISS,
  UCtrlModuloIRRF, ComCtrls;


type
  TfrmBuscaISS = class(TfrmSairAjuda)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    lblContagem: TLabel;
    ProgressBar1: TProgressBar;
    pnlPosicao: TPanel;
    memResult: TMemo;
    bbtnConfirmaGeracao: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmaGeracaoClick(Sender: TObject);
  private
    { Private declarations }
    BuscaISS : TCtrlBuscaISS;
    ModuloIRRF : TCtrlModuloIRRF;
  public
    { Public declarations }
    procedure progresso(vparam : array of variant);

  end;

var
  frmBuscaISS: TfrmBuscaISS;

implementation

uses uMensErro, uSistema, uDataBase, DBaseDados;

{$R *.DFM}



procedure TfrmBuscaISS.FormCreate(Sender: TObject);
Var
  dDataVenc : TDateTime;
begin
   inherited;
   BuscaISS := TCtrlBuscaISS.Create;
   BuscaISS.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
   Sistema.AppRemoteServer,True,nil,nil,False);

   BuscaISS.Progresso := Progresso;
   
   ModuloIRRF    := TCtrlModuloIRRF.Create;
   ModuloIRRF.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
   Sistema.AppRemoteServer,True,nil,nil,False);
   dDataVenc     := ModuloIRRF.CalcProxDiaSemana(sistema.IdEmpresa, Date,3,True);
   dtInicio.Date := ModuloIRRF.CalcDataIni(dDataVenc);
   dtFim.Date    := ModuloIRRF.CalcDataFim(dDataVenc);
   dtInicio.Text := DateToStr(dtInicio.Date);
   dtFim.Text    := DateToStr(dtFim.Date);

   progressbar1.position := 0;
   lblcontagem.caption   := '';
   pnlPosicao.caption    := '';
end;



procedure TfrmBuscaISS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   BuscaISS.free;
   ModuloIRRF.free;
   inherited;
end;



procedure TfrmBuscaISS.FormShow(Sender: TObject);
begin
   inherited;
   bbtnconfirmageracao.enabled := true;
   dtInicio.SetFocus;


end;



procedure TfrmBuscaISS.bbtnConfirmaGeracaoClick(Sender: TObject);
Var
  bPrimVez : boolean;
begin
   inherited;
   bPrimVez := True;

   if dtFim.Date < dtInicio.date then
   Begin
      MsgDlg('Data final não pode ser menor que a inicial.','Aviso',mtWarning,[mbOK],0);
      dtFim.date := dtInicio.date;
      exit;
   end
   else
   if dtFim.Date > Date then
   Begin
      MsgDlg('Data final não pode ser maior que a corrente.','Aviso',mtWarning,[mbOK],0);
      exit;
   end;

   if not BuscaISS.BuscaISS(Sistema.IdEmpresa,
                            dtInicio.text,
                            dtFim.text,
                            sistema.UsaPlanoPatro,
                            bPrimVez) then
   begin
       MsgDlg(BuscaISS.MessageInfo,'Erro',mtError,[mbOK],0);
       exit;
   end
   else
   begin
      if (Copy(pnlPosicao.caption,1,1) <> '>') then
         MsgDlg('Operação efetuada com sucesso!','Aviso',mtWarning,[mbOK],0);
      bbtnconfirmageracao.enabled := false;
   end;
end;



procedure TfrmBuscaISS.progresso(vparam: array of variant);
begin
  Case vParam[0] Of
    0 : progressbar1.position:=progressbar1.position+1;
    1 : memResult.Lines.Add(vParam[1]);
  End;  
end;

end.
