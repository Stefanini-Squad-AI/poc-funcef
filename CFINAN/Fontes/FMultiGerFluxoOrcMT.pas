unit FMultiGerFluxoOrcMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  uCMClientDataSet, uCtrlFluxoCaixa;

type
  TfrmMultiGerFluxoOrcMT = class(TfrmSairAjuda)
    bbtnGeraFluxo: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    gpbPeriodo: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    deDataInicial: TCMDateTimePicker;
    deDataFinal: TCMDateTimePicker;
    AnimateGeracao: TAnimate;
    procedure dDataExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnGeraFluxoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sTipoGeracaoAux : String;
    CtrlFluxoCaixa: TCtrlFluxoCaixa;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; sTipoGeracao: String); reintroduce;
  end;

var
  frmMultiGerFluxoOrcMT: TfrmMultiGerFluxoOrcMT;

implementation

{$R *.DFM}

uses uMensErro,uDataBase, DBaseDados,uSistema;

constructor TfrmMultiGerFluxoOrcMT.Create(AOwner: TComponent;
  sTipoGeracao: String);
begin
   sTipoGeracaoAux:=sTipoGeracao;
   inherited Create(AOwner);
end;

procedure TfrmMultiGerFluxoOrcMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa CtrlFluxoCaixa
   CtrlFluxoCaixa:=TCtrlFluxoCaixa.Create(Sistema.IdEmpresa,Sistema.IdModulo,
                                          Sistema.IdUsuario,Sistema.UsaPlanoPatro);

   CtrlFluxoCaixa.Initialize(dtmBaseDados.dbBaseDados,True);

   if sTipoGeracaoAux='LM' then
    begin
       Caption:='Geração de Fluxo Orç. de Méd. Prazo a partir do Orç. de Longo Prazo';
       HelpContext:=90027;
       bbtnAjuda.HelpContext:=90027;
    end;
   if (sTipoGeracaoAux='MC') or (sTipoGeracaoAux='MCTOT') then
    begin
       Caption:='Geração de Fluxo Orç. de Curto Prazo a partir do Orç. de Médio Prazo';
       HelpContext:=90024;
       bbtnAjuda.HelpContext:=90024;
    end;
   if (sTipoGeracaoAux='MCTOT') then
    begin
       gpbPeriodo.Enabled:=False;
       bbtnGeraFluxo.Enabled:=True;

       with TCMClientDataSet.Create(nil) do
       try
          Data:=CtrlFluxoCaixa.BuscaMinMaxDataFlxOrc(Copy(sTipoGeracaoAux,1,1));

          deDataInicial.Date:=FieldByName('DTMENOR').AsDateTime;
          deDataFinal.Date:=FieldByName('DTMAIOR').AsDateTime;

          gpbPeriodo.Enabled:=((FieldByName('DTMENOR').IsNull) or (FieldByName('DTMAIOR').IsNull));
       finally
          Free;
       end;
    end;
end;

procedure TfrmMultiGerFluxoOrcMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlFluxoCaixa.Free;
   inherited;
   Action:=caFree;
end;

procedure TfrmMultiGerFluxoOrcMT.dDataExit(Sender: TObject);
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

procedure TfrmMultiGerFluxoOrcMT.bbtnGeraFluxoClick(Sender: TObject);
begin
   AnimateGeracao.Active:=True;
   try
      if CtrlFluxoCaixa.GeraMultiFluxoOrc(deDataInicial.Date,deDataFinal.Date,
                                          Copy(sTipoGeracaoAux,1,1),
                                          Copy(sTipoGeracaoAux,2,1)) then
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
