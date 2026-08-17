//******************************************************************************
// Rotina     : sbtnAlterarClick , sbtnApagarClick e  dbGrdDblClick.
// SOL        : 97876
// Kintana    : 426580                  
// Data       : 08/10/2008
// Responsável: Andre Luiz Santos
// Descrição  : Retirada da exigencia das senhas na alteração e na exclusão.
//******************************************************************************
// Rotina     :
// SOL        : 92822
// Kintana    : 389089
// Data       : 11/08/2008
// Responsável: Ricardo Cristiano
// Descrição  : Instrução CGPC 025 que altera a precificação dos ativos de mercado a vista.
//******************************************************************************

unit FParamCotacaoRVMT;

interface 

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMTInv, Menus, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  fcLabel, faMensagem, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls,
  TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, Mask, wwdbedit, Wwdotdot, Wwdbcomb, uCtrlParamCotacaoRV,
  uCmSqlParams, uCtrlPadroes, uMensErro;

type
  TFrmParamCotacaoRVMT = class(TFrmCadastroGridMTInv)
    dbDtaVigencia: TCMDateTimePicker;
    lblDtOperacao: TLabel;
    dbTipoCotacao: TwwDBComboBox;
    lblTipoCotacao: TLabel;
    CMSqlParams1: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure dbGrdDblClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlParamCotacaoRV : TCtrlParamCotacaoRV;
  public
    { Public declarations }
  end;

var
  FrmParamCotacaoRVMT: TFrmParamCotacaoRVMT;

implementation

uses FAutorizaParametros, FTelaAut;

{$R *.DFM}

procedure TFrmParamCotacaoRVMT.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlParamCotacaoRV := TCtrlParamCotacaoRV.Create;
   CtrlParamCotacaoRV.InitializeAs(Padroes);
   CtrlParamCotacaoRV.CdsParamCotacaoRV := Cds;

   cds.data := CtrlParamCotacaoRV.ListParamCotacaoRV;
end;

procedure TFrmParamCotacaoRVMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   Accept := CtrlParamCotacaoRV.AplicaAtualParamCotacaoRV;

   if not Accept then
      MsgDlg('Ocorreu um erro na gravação do Registro.' + #13 +
             'Motivo: ' + CtrlParamCotacaoRV.MessageInfo,'Atenção',mtWarning,[mbOk],0)
   else
      cds.data := CtrlParamCotacaoRV.ListParamCotacaoRV;

  inherited;

end;

procedure TFrmParamCotacaoRVMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
   Accept := CtrlParamCotacaoRV.AplicaAtualParamCotacaoRV;

   if not Accept then
      MsgDlg('Ocorreu um erro na exclusão do Registro.' + #13 +
             'Motivo: ' + CtrlParamCotacaoRV.MessageInfo,'Atenção',mtWarning,[mbOk],0)
   else
     cds.data := CtrlParamCotacaoRV.ListParamCotacaoRV;

  inherited;

end;

procedure TFrmParamCotacaoRVMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if Trim(dbDtaVigencia.Text) = '' then
  begin
     MsgDlg('Data de vigência não informada.','Atenção' ,MtWarning,[mbok],0);
     if dbDtaVigencia.CanFocus then
        dbDtaVigencia.SetFocus;
  end
  else if Trim(dbTipoCotacao.Text) = '' then
  begin
     MsgDlg('Tipo de Cotação não informada.','Atenção',mtWarning,[mbOK],0);
     if dbTipoCotacao.CanFocus then
        dbTipoCotacao.SetFocus;
  end
  else
     Accept := True;
end;

procedure TFrmParamCotacaoRVMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then
      Cds.Locate('IDPARAMCOTACAORV',MontaSelect.ValoresChave[0],[]);
end;

procedure TFrmParamCotacaoRVMT.bbtnConfirmarClick(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
  inherited;

end;

procedure TFrmParamCotacaoRVMT.sbtnAlterarClick(Sender: TObject);
begin
   if cds.RecordCount > 0  then
         inherited;
      //if (AbrirFormModal(frmAutorizaParametros,TfrmAutorizaParametros) = mrOk) then


end;

procedure TFrmParamCotacaoRVMT.sbtnApagarClick(Sender: TObject);
begin
//   if (AbrirFormModal(frmAutorizaParametros,TfrmAutorizaParametros) = mrOk) then
      inherited;

end;

procedure TFrmParamCotacaoRVMT.dbGrdDblClick(Sender: TObject);
begin
   if cds.RecordCount > 0  then
         inherited;
//      if (AbrirFormModal(frmAutorizaParametros,TfrmAutorizaParametros) = mrOk) then


end;

procedure TFrmParamCotacaoRVMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
    cds.data := CtrlParamCotacaoRV.ListParamCotacaoRV;
end;

procedure TFrmParamCotacaoRVMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlParamCotacaoRV);
end;

end.
