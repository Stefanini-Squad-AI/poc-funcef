unit FCadVlrReferenciaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, TREdit, uCmSqlParams,
  uCtrlVlrRefContr, uCtrlReferenciaContr;

type
  TfrmCadVlrReferenciaMT = class(TFrmCadastroMT)
    cdsReferencia: TCMClientDataSet;
    lblReferencia: TLabel;
    dblcReferencia: TwwDBLookupCombo;
    edrValor: TDBRealEdit;
    Label1: TLabel;
    Label4: TLabel;
    edData: TCMDateTimePicker;
    spTeste: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    CtrlVlrRefContr     : TCtrlVlrRefContr;
    CtrlReferenciaContr : TCtrlReferenciaContr;
  public
    { Public declarations }
  end;

var
  frmCadVlrReferenciaMT: TfrmCadVlrReferenciaMT;

implementation

{$R *.DFM}

uses dBaseDados, uSistema, uMensErro;

procedure TfrmCadVlrReferenciaMT.FormCreate(Sender: TObject);
begin
   inherited;
   //Inicializa CtrlVlrRefContr
   CtrlVlrRefContr:=TCtrlVlrRefContr.Create;
   CtrlVlrRefContr.Initialize(dtmBaseDados.dbBaseDados,True);

   //Inicializa CtrlReferenciaContr
   CtrlReferenciaContr:=TCtrlReferenciaContr.Create;
   CtrlReferenciaContr.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega Cds 
   Cds.Data:=CtrlVlrRefContr.ListVlrRefContr(-1,0); //vazio

   //Carrega combo de Referências Contratuais
   cdsReferencia.Data:=CtrlReferenciaContr.ListReferenciaContr(0);//Todas

   //Associa Cds
   CtrlVlrRefContr.CdsVlrRefContr:=Cds;
end;

procedure TfrmCadVlrReferenciaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlVlrRefContr.Free;
   CtrlReferenciaContr.Free;
   inherited;
end;

procedure TfrmCadVlrReferenciaMT.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then
    begin
      Cds.Close;
      Cds.Data:=CtrlVlrRefContr.ListVlrRefContr(StrToFloat(MontaSelect.ValoresChave[0]),
                                                StrToDate(MontaSelect.ValoresChave[1]));
    end;
end;

procedure TfrmCadVlrReferenciaMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept:=True;
   if (Trim(dblcReferencia.Text)='') then
    begin
       MsgDlg('A Referência não pode ser deixada de ser preenchida.','Erro',mtError,[mbOK],0);
       Accept:=False;
    end;

   if (Trim(edData.Text)='') then
    begin
       MsgDlg('A Data não pode ser deixada de ser preenchida.','Erro',mtError,[mbOK],0);
       Accept:=False;
    end;
end;

procedure TfrmCadVlrReferenciaMT.CmeCadastroConfirma(Sender: TObject);
begin
   if CtrlVlrRefContr.AplicaVlrRefContr then
      inherited
   else
      MsgDlg(CtrlVlrRefContr.MessageInfo,'Erro',mtError,[mbOK],0);
end;


end.
