unit FCadCarteiraXEvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdblook, uCmSqlParams,
  uMensErro, uCMTypes, uCtrlEventoCaixaCota, uCtrlCarteiraXEvento,
  uCtrlCarteiraInvest, uCtrlPadroes, uCtrlInvestCotas;

type
  TFrmCadCarteiraXEvento = class(TFrmCadastroGridMTInv)
    Label1: TLabel;
    dblCarteira: TwwDBLookupCombo;
    Label3: TLabel;
    dblEveCxCota: TwwDBLookupCombo;
    CdsCarteira: TCMClientDataSet;
    CdsEvento: TCMClientDataSet;
    CMSqlParams: TCMSqlParams;
    dblRegra: TwwDBLookupCombo;
    Label4: TLabel;
    CdsRegra: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlCarteiraXEvento : TCtrlCarteiraXEvento;
    CtrlCarteiraInvest : TCtrlCarteiraInvest;
    CtrlEventoCaixaCota : TCtrlEventoCaixaCota;
    CtrlInvestCotas : TCtrlInvestCotas;
  public
    { Public declarations }
  end;

var
  FrmCadCarteiraXEvento: TFrmCadCarteiraXEvento;

implementation

{$R *.DFM}

procedure TFrmCadCarteiraXEvento.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlCarteiraXEvento := TCtrlCarteiraXEvento.Create;
   CtrlCarteiraXEvento.InitializeAs(Padroes);
   CtrlCarteiraXEvento.CdsCarteiraXEvento := Cds;

   CtrlCarteiraInvest := TCtrlCarteiraInvest.Create;
   CtrlCarteiraInvest.InitializeAs(Padroes);
   CtrlCarteiraInvest.CdsCarteiraInvest := CdsCarteira;

   CtrlEventoCaixaCota := TCtrlEventoCaixaCota.Create;
   CtrlEventoCaixaCota.InitializeAs(Padroes);
   CtrlEventoCaixaCota.CdsEventoCaixaCota := CdsEvento;

   CtrlInvestCotas  := TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);
   CtrlInvestCotas.CdsRegra := CdsRegra;

end;

procedure TFrmCadCarteiraXEvento.FormShow(Sender: TObject);
begin
  inherited;
   CdsRegra.Data    := CtrlInvestCotas.ListRegra;
   CdsCarteira.Data := CtrlCarteiraInvest.ListCarteiraInvest;
   CdsEvento.Data   := CtrlEventoCaixaCota.ListEventoCaixaCota;
   Cds.Data         := CtrlCarteiraXEvento.ListCarteiraXEvento;
end;

procedure TFrmCadCarteiraXEvento.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := False;

   if Trim(dblCarteira.Text) = '' then
   begin
      MsgDlg('Informe a Carteira.', 'Warning', mtWarning, [mbOk], 0);
      if dblCarteira.CanFocus then
         dblCarteira.SetFocus;
      Exit;
   end;

   if Trim(dblEveCxCota.Text) = '' then
   begin
      MsgDlg('Informe o Evento.', 'Warning', mtWarning, [mbOk], 0);
      if dblEveCxCota.CanFocus then
         dblEveCxCota.SetFocus;
      Exit;
   end;

   if (Cds.State = dsInsert) then
   begin
      CdsAux.Data := CtrlCarteiraXEvento.ListCarteiraXEvento(0, StrToInt(dblCarteira.LookupValue), StrToInt(dblEveCxCota.LookupValue));
      if not CdsAux.IsEmpty then
      begin
         MsgDlg('O Evento já está associado a Carteira.', 'Warning', mtWarning, [mbOk], 0);
         if dblEveCxCota.CanFocus then
            dblEveCxCota.SetFocus;
         Exit;
      end;
   end;

   Accept := True;
end;

procedure TFrmCadCarteiraXEvento.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := CtrlCarteiraXEvento.AplicaAtualCarteiraXEvento;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlCarteiraXEvento.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TFrmCadCarteiraXEvento.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
      Cds.Locate('IDCARTEIRAXEVENTO',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmCadCarteiraXEvento.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
   Cds.Data := CtrlCarteiraXEvento.ListCarteiraXEvento;
end;

procedure TFrmCadCarteiraXEvento.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := CtrlCarteiraXEvento.AplicaAtualCarteiraXEvento;
   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlCarteiraXEvento.MessageInfo,'Erro',mtError,[mbOk],0);

   Cds.Data := CtrlCarteiraXEvento.ListCarteiraXEvento;             
end;

procedure TFrmCadCarteiraXEvento.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
   Accept := CtrlCarteiraXEvento.AplicaAtualCarteiraXEvento;
   if not Accept then
      MsgDlg('Ocorreu um erro na exclusão do Registro.' + #13 +
             'Motivo: ' + CtrlCarteiraXEvento.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TFrmCadCarteiraXEvento.FormDestroy(Sender: TObject);
begin
  inherited;
   FreeAndNil(CtrlEventoCaixaCota);
   FreeAndNil(CtrlCarteiraXEvento);
   FreeAndNil(CtrlCarteiraInvest);
   FreeAndNil(CtrlInvestCotas);
end;

end.
